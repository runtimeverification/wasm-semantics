#!/usr/bin/env python3

"""Translate a WebAssembly spec test (`.wast`) into KWasm statements via `wast2json`.

The official spec test suite is written in the `.wast` text format, which mixes Wasm modules
with embedder assertions. `wast2json` (from wabt) splits such a file into

  * a JSON manifest of commands (module / assert_return / assert_trap / register / ...), and
  * one `.wasm` binary per module.

This module reads that manifest, parses each `.wasm` with the pykwasm binary parser, and turns
the whole file into a single `Stmts` term that the KWasm test embedder (`test.md`) can execute.
Going through the binary format means the K text-format front end is bypassed entirely.

Commands the K semantics does not model (validation, linking, exhaustion) and assertions that
cannot be expressed (NaN payload patterns) are *reported as skipped* rather than silently
dropped -- see `Skipped` and `TranslatedTest.skipped`.
"""

from __future__ import annotations

import json
import math
import struct
import subprocess
from dataclasses import dataclass, field
from typing import TYPE_CHECKING

from pyk.kast.inner import KApply, KInner, KToken

import pykwasm.kwasm_ast as wast

from .binary import parse_module

if TYPE_CHECKING:
    from pathlib import Path
    from typing import Any


# Command types that the K semantics has no rules for. `test.md` parses them and reduces them
# to `.K`, so emitting them would be a silent no-op that looks like a passing assertion.
# Skipping them explicitly keeps the report honest.
UNMODELED_COMMANDS = {
    'assert_exhaustion',  # no stack-depth accounting
    'assert_invalid',  # module validation is not modeled
    'assert_malformed',  # decoding failures are not modeled
    'assert_uninstantiable',  # instantiation traps are not modeled
    'assert_unlinkable',  # link-time checks are not modeled
}

# `wast2json` emits these in place of a concrete float when the spec only constrains the NaN
# payload class. KWasm's `equalVal` compares floats by value, so neither can be checked.
NAN_PATTERNS = {'nan:canonical', 'nan:arithmetic'}


class Wast2KastError(Exception):
    pass


@dataclass(frozen=True)
class Skipped:
    """A command that was deliberately not translated."""

    line: int
    command: str
    reason: str


@dataclass
class TranslatedTest:
    """The result of translating one `.wast` file."""

    stmts: list[KInner] = field(default_factory=list)
    skipped: list[Skipped] = field(default_factory=list)

    # NOTE: deliberately no `Stmts`-term accessor for the `<k>` cell. The `<k>` entry point runs
    # `text2abstract` over the program, whose identifier-context helpers only cover text-format
    # productions -- feeding it these already-abstract terms gets stuck. Load `<instrs>` instead.


def run_wast2json(wast_file: Path, output_dir: Path, wast2json: str = 'wast2json') -> Path:
    """Run `wast2json` on `wast_file`, writing the manifest and `.wasm` modules into `output_dir`.

    Returns the path of the JSON manifest.
    """
    output_dir.mkdir(parents=True, exist_ok=True)
    json_path = output_dir / (wast_file.stem + '.json')
    proc = subprocess.run(
        [wast2json, str(wast_file), '-o', str(json_path)],
        capture_output=True,
        text=True,
    )
    if proc.returncode != 0:
        raise Wast2KastError(f'wast2json failed on {wast_file}: {proc.stderr.strip()}')
    return json_path


def wast2kast(json_path: Path) -> TranslatedTest:
    """Translate a `wast2json` manifest (and its sibling `.wasm` files) into KWasm statements."""
    manifest = json.loads(json_path.read_text())
    base_dir = json_path.parent

    result = TranslatedTest()
    for command in manifest['commands']:
        res = _translate_command(command, base_dir)
        if isinstance(res, KInner):
            result.stmts.append(res)
        else:
            result.skipped.append(res)
    return result


def _translate_command(command: dict[str, Any], base_dir: Path) -> KInner | Skipped:
    ctype = command['type']
    line = command.get('line', -1)

    if ctype in UNMODELED_COMMANDS:
        return Skipped(line, ctype, 'not modeled by the K semantics')

    match ctype:
        case 'module':
            return _module(command, base_dir)
        case 'action':
            return _action(command['action'])
        case 'assert_return':
            action = _action(command['action'])
            expected = command.get('expected', [])
            unchecked = [v['value'] for v in expected if str(v.get('value')) in NAN_PATTERNS]
            if unchecked:
                return Skipped(line, ctype, f'NaN pattern not representable: {unchecked[0]}')
            return wast.assert_return(action, [_value_instr(v) for v in expected])
        case 'assert_trap':
            return wast.assert_trap(
                _action(command['action']),
                command.get('text', ''),
            )
        case 'register':
            return wast.register(command['as'], command.get('name'))

    raise Wast2KastError(f'Unhandled command type at line {line}: {ctype}')


def _module(command: dict[str, Any], base_dir: Path) -> KInner:
    filename = command['filename']
    path = base_dir / filename

    with path.open('rb') as f:
        module = parse_module(f)

    name = command.get('name')
    if name is None:
        return module

    if not isinstance(module, KApply) or module.label.name != wast.MODULE:
        raise Wast2KastError(f'Expected a module term, got {module}')
    metadata = wast.module_metadata(mid=wast.identifier(name), filename=filename)
    return KApply(module.label, list(module.args[:-1]) + [metadata])


def _action(action: dict[str, Any]) -> KInner:
    atype = action['type']
    module = action.get('module')

    if atype == 'invoke':
        args = [_value_instr(a) for a in action.get('args', [])]
        return wast.invoke_action(action['field'], args, module)

    if atype == 'get':
        return wast.get_action(action['field'], module)

    raise Wast2KastError(f'Unhandled action type: {atype}')


def _value_instr(value: dict[str, Any]) -> KInner:
    """Translate one JSON value into the instruction that pushes it.

    Values are emitted as `*.const` instructions rather than as `Val` terms so that the
    semantics' own `#chop` / `#round` normalization applies -- in particular so that an f32
    literal is rounded to f32 precision exactly as a program-produced value would be.
    """
    vtype = value['type']
    raw = value.get('value')

    if raw is None:
        raise Wast2KastError(f'Value of type {vtype} has no payload')

    if vtype == 'i32':
        return wast.I32_CONST(int(raw))
    if vtype == 'i64':
        return wast.I64_CONST(int(raw))
    if vtype == 'f32':
        return KApply('aFConst', [wast.f32, _k_float(_f32_from_bits(int(raw)))])
    if vtype == 'f64':
        return KApply('aFConst', [wast.f64, _k_float(_f64_from_bits(int(raw)))])
    if vtype == 'externref':
        if raw == 'null':
            return wast.REF_NULL(wast.HEAPTYPE_EXTERN)
        return wast.REF_EXTERN_CONST(int(raw))
    if vtype == 'funcref':
        if raw == 'null':
            return wast.REF_NULL(wast.HEAPTYPE_FUNC)
        return wast.REF_FUNC_ADDR_CONST(int(raw))

    raise Wast2KastError(f'Unhandled value type: {vtype}')


def _f32_from_bits(bits: int) -> float:
    return struct.unpack('<f', struct.pack('<I', bits))[0]


def _f64_from_bits(bits: int) -> float:
    return struct.unpack('<d', struct.pack('<Q', bits))[0]


def _k_float(value: float) -> KToken:
    """Render a Python float as a K `Float` literal.

    Uses 18 significant digits, which round-trips any IEEE double exactly, so no precision is
    lost relative to the bit pattern wast2json gave us. (An f32 bit pattern widens to a double
    exactly, and the semantics rounds it back down via `#round`.)
    """
    if math.isnan(value):
        return KToken('NaN', 'Float')
    if math.isinf(value):
        return KToken('-Infinity' if value < 0 else 'Infinity', 'Float')
    return KToken(f'{value:.17e}', 'Float')
