"""Run the official WebAssembly spec test suite through the *binary* front end.

Each `.wast` file is converted on the fly by `wast2json` into a command manifest plus one
`.wasm` per module; the modules are parsed by the pykwasm binary parser and the commands are
translated into KWasm embedder statements (see `pykwasm.wast2kast`). The whole file then runs
as a single `krun` invocation.

This complements the text-format conformance suite driven from the top-level Makefile. That one
depends on K's `.wast` parser, which cannot read 17 of the 90 files at all; this one bypasses
the text format entirely.

A file passes when execution drains the `<instrs>` cell. A failed assertion gets stuck, so
whatever is left in that cell is the diagnosis.
"""

from __future__ import annotations

import sys
from pathlib import Path
from typing import TYPE_CHECKING

import pytest
from pyk.kast.inner import KApply, KSequence, KSort, Subst
from pyk.kast.manip import split_config_from

import pykwasm.kwasm_ast as wast
from pykwasm.wast2kast import run_wast2json, wast2kast

if TYPE_CHECKING:
    from pyk.kast import KInner
    from pyk.ktool.krun import KRun


SPEC_TEST_DIR = Path(__file__).parents[4] / 'tests' / 'wasm-tests' / 'test' / 'core'
SPEC_TESTS = sorted(SPEC_TEST_DIR.glob('*.wast'))

# Files that cannot run through this pipeline yet, with the reason.
#
# Unlike the text-format suite's exclusion lists, no entry here is about a *parser front end*
# limitation of K -- `wast2json` converts all 90 files cleanly. Every entry is a real gap in the
# binary parser, the semantics, or the LLVM backend, so this list doubles as a to-do list.
#
# Keep it sorted, and keep each reason specific enough to act on.
SKIP: dict[str, str] = {
    # -- binary parser: unsupported encodings -------------------------------------------------
    # `blocktype ::= i:i33` (a block whose type is a type index, i.e. it takes parameters).
    # Supporting it also needs semantics work: `#block`/`#loop`/`#if` carry only a result
    # VecType, with no way to express block parameters.
    'block.wast': 'binary parser: i33 (type-index) blocktype unsupported',
    'br.wast': 'binary parser: i33 (type-index) blocktype unsupported',
    'fac.wast': 'binary parser: i33 (type-index) blocktype unsupported',
    'func.wast': 'binary parser: i33 (type-index) blocktype unsupported',
    'if.wast': 'binary parser: i33 (type-index) blocktype unsupported',
    'loop.wast': 'binary parser: i33 (type-index) blocktype unsupported',
    # The data-segment tag is a u32 in the grammar, but `datasec` reads it with `read_byte`, so
    # an over-long LEB128 encoding of 0 (0x80 0x00) is rejected. These two files test exactly that.
    'binary-leb128.wast': 'binary parser: data segment tag read as one byte, not u32 (LEB128)',
    'binary.wast': 'binary parser: data segment tag read as one byte, not u32 (LEB128)',
    # 0xFC 8/9
    'bulk.wast': 'binary parser: memory.init / data.drop (0xFC 8, 9) unsupported',
    'memory_init.wast': 'binary parser: memory.init / data.drop (0xFC 8, 9) unsupported',
    # 0xFC 0..7
    'conversions.wast': 'binary parser: saturating truncation (0xFC 0..7) unsupported',
    # 0xBC..0xBF -- also unimplemented in numeric.md (see its TODO on reinterpret)
    'endianness.wast': 'binary parser + semantics: reinterpret (0xBC..0xBF) unimplemented',
    'float_exprs.wast': 'binary parser + semantics: reinterpret (0xBC..0xBF) unimplemented',
    'float_literals.wast': 'binary parser + semantics: reinterpret (0xBC..0xBF) unimplemented',
    'memory.wast': 'binary parser + semantics: reinterpret (0xBC..0xBF) unimplemented',
    # K's ImportDefn has no reftype slot, so the parser refuses rather than lose the type
    'elem.wast': 'binary parser: externref table import unsupported',
    'linking.wast': 'binary parser: externref table import unsupported',
    # -- semantics gaps -----------------------------------------------------------------------
    # `#load`/`#store` only have rules for IValType; the FValType store production in wasm.md is
    # commented out. Any f32/f64 memory access gets stuck.
    'address.wast': 'semantics: f32/f64 load & store unimplemented',
    'align.wast': 'semantics: f32/f64 load & store unimplemented',
    'call_indirect.wast': 'semantics: f32/f64 load & store unimplemented',
    'float_memory.wast': 'semantics: f32/f64 load & store unimplemented',
    'left-to-right.wast': 'semantics: f32/f64 load & store unimplemented',
    'memory_redundancy.wast': 'semantics: f32/f64 load & store unimplemented',
    'memory_trap.wast': 'semantics: f32/f64 load & store unimplemented',
    'traps.wast': 'semantics: f32/f64 load & store unimplemented',
    # Semantics yields +0.0 where the spec requires -0.0; `equalVal` compares signFloat, so the
    # assertion correctly fails.
    'f32.wast': 'semantics: sign of negative zero not preserved',
    'f32_bitwise.wast': 'semantics: sign of negative zero not preserved',
    'f64.wast': 'semantics: sign of negative zero not preserved',
    'f64_bitwise.wast': 'semantics: sign of negative zero not preserved',
    # -- LLVM backend -------------------------------------------------------------------------
    # The interpreter dies with SIGSEGV on a valid ground configuration (not a stack-depth
    # problem -- it still crashes with `ulimit -s unlimited`). For table_init.wast the trigger is
    # `table.init` with length 0xFFFFFFFC; the text-format suite never reaches this code path.
    'br_table.wast': 'LLVM backend: interpreter segfaults mid-run',
    'table_init.wast': 'LLVM backend: interpreter segfaults on table.init with length 0xFFFFFFFC',
}


def _skip_reason(path: Path) -> str | None:
    return SKIP.get(path.name)


@pytest.mark.parametrize('wast_path', SPEC_TESTS, ids=lambda p: p.name)
def test_conformance(krun_llvm: KRun, wast_path: Path, tmp_path: Path) -> None:
    # pyk serializes kore recursively and nesting depth grows with the program size; the spec
    # tests are much larger than the hand-written fixtures, so raise the limit generously.
    sys.setrecursionlimit(max(sys.getrecursionlimit(), 100_000))

    reason = _skip_reason(wast_path)
    if reason is not None:
        pytest.skip(reason)

    run_wast2json(wast_path, tmp_path)
    translated = wast2kast(tmp_path / (wast_path.stem + '.json'))

    if not translated.stmts:
        pytest.skip(f'no executable commands ({len(translated.skipped)} skipped)')

    final = _run(krun_llvm, translated.stmts)

    leftover = _cell(final, 'INSTRS_CELL')
    assert leftover is not None, 'no <instrs> cell in the final configuration'
    assert _is_empty_k(leftover), (
        f'execution got stuck; <instrs> cell was not drained.\n'
        f'{_describe(krun_llvm, leftover)}\n'
        f'({len(translated.stmts)} commands run, {len(translated.skipped)} skipped)'
    )


def _run(krun: KRun, stmts: list[KInner]) -> KInner:
    config_kast = krun.definition.init_config(KSort('GeneratedTopCell'))
    symbolic_config, init_subst = split_config_from(config_kast)

    # Load `<instrs>` directly instead of going through `<k>`.
    #
    # The `<k>` cell rule pipes the program through `text2abstract`, the text-format desugarer.
    # Our terms come from the binary parser and are *already* abstract, so that pass is at best
    # wasted work over the whole file -- and at worst it gets stuck, because its identifier-context
    # helpers (e.g. `#idcFuncsAux`) only have cases for text-format productions. Sequencing the
    # statements here is exactly what `sequenceStmts` would do.
    init_subst['INSTRS_CELL'] = KSequence([wast.INIT_SPECTEST_MODULE, *stmts])
    # `init_config` leaves `<k>` holding the free configuration variable `$PGM`. Since we are not
    # using the `<k>` entry point, it has to be cleared -- handing the interpreter a non-ground
    # term crashes it rather than producing an error.
    init_subst['K_CELL'] = KSequence()
    config_with_program = Subst(init_subst)(symbolic_config)

    config_kore = krun.kast_to_kore(config_with_program, KSort('GeneratedTopCell'))
    result_kore = krun.run_pattern(config_kore)
    return krun.kore_to_kast(result_kore)


def _cell(config: KInner, cell_name: str) -> KInner | None:
    _, subst = split_config_from(config)
    return subst.get(cell_name)


def _is_empty_k(term: KInner) -> bool:
    if isinstance(term, KSequence):
        return term.arity == 0
    return isinstance(term, KApply) and term.label.name == '#EmptyK'


def _describe(krun: KRun, term: KInner, limit: int = 1500) -> str:
    """Render the stuck term. Falls back to the raw KAST if pretty-printing fails."""
    try:
        text = krun.pretty_print(term)
    except Exception:  # noqa: BLE001 - diagnostics must never mask the real assertion
        text = str(term)
    return text[:limit] + ('...' if len(text) > limit else '')
