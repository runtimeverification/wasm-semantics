from __future__ import annotations

import json
import struct
from typing import TYPE_CHECKING

import pytest
from pyk.kast.inner import KApply, KToken

from pykwasm import kwasm_ast as wast
from pykwasm.wast2kast import Wast2KastError, wast2kast

if TYPE_CHECKING:
    from pathlib import Path


def manifest(tmp_path: Path, *commands: dict) -> Path:
    path = tmp_path / 'test.json'
    path.write_text(json.dumps({'source_filename': 'test.wast', 'commands': list(commands)}))
    return path


def invoke(field: str, args: list[dict] | None = None, **kwargs: object) -> dict:
    return {'type': 'invoke', 'field': field, 'args': args or [], **kwargs}


class TestValues:
    # wast2json emits every numeric value as an unsigned decimal *bit pattern*, so a negative
    # i32 arrives as its two's-complement encoding and a float arrives as its raw bits.
    def test_i32_is_unsigned_bit_pattern(self, tmp_path: Path) -> None:
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'i32', 'value': '4294967278'}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert _args_of_invoke(stmt) == [wast.I32_CONST(4294967278)]

    def test_i64(self, tmp_path: Path) -> None:
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'i64', 'value': '18446744073709551615'}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert _args_of_invoke(stmt) == [wast.I64_CONST(18446744073709551615)]

    @pytest.mark.parametrize('value', [0.0, 1.5, -1.5, 3.4028234663852886e38, 1e-45])
    def test_f32_bit_pattern_round_trips(self, tmp_path: Path, value: float) -> None:
        bits = struct.unpack('<I', struct.pack('<f', value))[0]
        # Not every double is an f32; compare against what the bit pattern actually denotes.
        as_f32 = struct.unpack('<f', struct.pack('<I', bits))[0]
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'f32', 'value': str(bits)}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        (arg,) = _args_of_invoke(stmt)
        assert isinstance(arg, KApply) and arg.label.name == 'aFConst'
        token = arg.args[1]
        assert isinstance(token, KToken)
        # The literal must name exactly the double the bit pattern denotes; the semantics rounds
        # it back to f32 via `#round`.
        assert float(token.token) == as_f32

    @pytest.mark.parametrize('value', [0.0, 0.1, -2.5, 1.7976931348623157e308, 5e-324])
    def test_f64_bit_pattern_round_trips(self, tmp_path: Path, value: float) -> None:
        bits = struct.unpack('<Q', struct.pack('<d', value))[0]
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'f64', 'value': str(bits)}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        token = _args_of_invoke(stmt)[0].args[1]  # type: ignore[union-attr]
        assert isinstance(token, KToken)
        assert float(token.token) == value

    def test_negative_zero_keeps_its_sign(self, tmp_path: Path) -> None:
        # `equalVal` compares signFloat, so dropping the sign here would silently weaken every
        # -0.0 assertion in the suite.
        bits = struct.unpack('<Q', struct.pack('<d', -0.0))[0]
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'f64', 'value': str(bits)}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        token = _args_of_invoke(stmt)[0].args[1]  # type: ignore[union-attr]
        assert isinstance(token, KToken)
        assert token.token.startswith('-')
        assert struct.pack('<d', float(token.token)) == struct.pack('<d', -0.0)

    @pytest.mark.parametrize(
        ('py_value', 'expected'),
        [(float('inf'), 'Infinity'), (float('-inf'), '-Infinity'), (float('nan'), 'NaN')],
    )
    def test_non_finite_use_k_spelling(self, tmp_path: Path, py_value: float, expected: str) -> None:
        # Python's `str()` gives 'inf'/'nan', which K's Float lexer does not accept.
        bits = struct.unpack('<Q', struct.pack('<d', py_value))[0]
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'f64', 'value': str(bits)}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        token = _args_of_invoke(stmt)[0].args[1]  # type: ignore[union-attr]
        assert isinstance(token, KToken)
        assert token.token == expected

    def test_null_refs(self, tmp_path: Path) -> None:
        args = [{'type': 'funcref', 'value': 'null'}, {'type': 'externref', 'value': 'null'}]
        cmd = {'type': 'action', 'line': 1, 'action': invoke('f', args), 'expected': []}
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert _args_of_invoke(stmt) == [
            wast.REF_NULL(wast.HEAPTYPE_FUNC),
            wast.REF_NULL(wast.HEAPTYPE_EXTERN),
        ]

    def test_extern_ref_value(self, tmp_path: Path) -> None:
        cmd = {
            'type': 'action',
            'line': 1,
            'action': invoke('f', [{'type': 'externref', 'value': '1'}]),
            'expected': [],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert _args_of_invoke(stmt) == [wast.REF_EXTERN_CONST(1)]

    def test_unknown_value_type_rejected(self, tmp_path: Path) -> None:
        cmd = {'type': 'action', 'line': 1, 'action': invoke('f', [{'type': 'v128', 'value': '0'}]), 'expected': []}
        with pytest.raises(Wast2KastError, match='v128'):
            wast2kast(manifest(tmp_path, cmd))


class TestCommands:
    def test_unmodeled_commands_are_skipped_not_dropped(self, tmp_path: Path) -> None:
        # These reduce to `.K` in test.md, so emitting them would look like a passing assertion.
        commands = [
            {'type': 'assert_invalid', 'line': 1, 'filename': 'x.wasm', 'module_type': 'binary', 'text': 'bad'},
            {'type': 'assert_malformed', 'line': 2, 'filename': 'y.wasm', 'module_type': 'binary', 'text': 'bad'},
            {'type': 'assert_exhaustion', 'line': 3, 'action': invoke('f'), 'expected': [], 'text': 'stack'},
        ]
        result = wast2kast(manifest(tmp_path, *commands))
        assert result.stmts == []
        assert [s.command for s in result.skipped] == ['assert_invalid', 'assert_malformed', 'assert_exhaustion']

    @pytest.mark.parametrize('pattern', ['nan:canonical', 'nan:arithmetic'])
    def test_nan_pattern_assertions_are_skipped(self, tmp_path: Path, pattern: str) -> None:
        cmd = {
            'type': 'assert_return',
            'line': 7,
            'action': invoke('f'),
            'expected': [{'type': 'f32', 'value': pattern}],
        }
        result = wast2kast(manifest(tmp_path, cmd))
        assert result.stmts == []
        assert len(result.skipped) == 1
        assert result.skipped[0].line == 7
        assert pattern in result.skipped[0].reason

    def test_assert_trap_ignores_expected_types(self, tmp_path: Path) -> None:
        # For assert_trap, `expected` carries result *types* with no values -- reading them as
        # values would raise.
        cmd = {
            'type': 'assert_trap',
            'line': 1,
            'action': invoke('f', [{'type': 'i32', 'value': '0'}]),
            'text': 'out of bounds memory access',
            'expected': [{'type': 'i32'}],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert isinstance(stmt, KApply)
        assert stmt.label.name == wast.ASSERT_TRAP_ACTION
        assert stmt.args[1] == wast.wasm_string('out of bounds memory access')

    def test_register_with_and_without_module_name(self, tmp_path: Path) -> None:
        commands = [
            {'type': 'register', 'line': 1, 'as': 'test'},
            {'type': 'register', 'line': 2, 'as': 'exporter', 'name': '$m'},
        ]
        anon, named = wast2kast(manifest(tmp_path, *commands)).stmts
        assert isinstance(anon, KApply) and anon.label.name == wast.REGISTER
        assert isinstance(named, KApply) and named.label.name == wast.REGISTER_AS
        assert named.args[1] == wast.identifier('$m')

    def test_get_action_with_module(self, tmp_path: Path) -> None:
        cmd = {
            'type': 'assert_return',
            'line': 1,
            'action': {'type': 'get', 'field': 'e', 'module': '$Global'},
            'expected': [{'type': 'i32', 'value': '42'}],
        }
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert isinstance(stmt, KApply)
        action = stmt.args[0]
        assert isinstance(action, KApply) and action.label.name == wast.GET_ACTION
        assert action.args[0] == wast.identifier('$Global')

    def test_bare_action_asserts_no_results(self, tmp_path: Path) -> None:
        # Otherwise the callee's results leak onto the value stack and mask a clean finish.
        cmd = {'type': 'action', 'line': 1, 'action': invoke('fill'), 'expected': []}
        (stmt,) = wast2kast(manifest(tmp_path, cmd)).stmts
        assert isinstance(stmt, KApply)
        assert stmt.label.name == wast.ASSERT_RETURN
        assert stmt.args[1] == wast.instrs([])

    def test_unknown_command_rejected(self, tmp_path: Path) -> None:
        with pytest.raises(Wast2KastError, match='assert_something_new'):
            wast2kast(manifest(tmp_path, {'type': 'assert_something_new', 'line': 1}))


def _args_of_invoke(stmt: object) -> list:
    """Pull the argument instructions out of an `( assert_return ( invoke ... ) ... )` term."""
    assert isinstance(stmt, KApply) and stmt.label.name == wast.ASSERT_RETURN
    action = stmt.args[0]
    assert isinstance(action, KApply) and action.label.name == wast.INVOKE_ACTION
    return _instr_list(action.args[2])


def _instr_list(k: object) -> list:
    items = []
    while isinstance(k, KApply) and k.args:
        items.append(k.args[0])
        k = k.args[1]
    return items
