from __future__ import annotations

import io
import struct
from typing import TYPE_CHECKING

import pytest
from pyk.kast.inner import KApply

from pykwasm import kwasm_ast as wast
from pykwasm.binary import floats, integers
from pykwasm.binary.instructions import instr
from pykwasm.binary.module import MAGIC, VERSION, parse_module
from pykwasm.binary.types import limits
from pykwasm.binary.utils import WasmEOFError, WasmParseError, peek_bytes

if TYPE_CHECKING:
    from pyk.kast.inner import KInner


def stream(data: bytes) -> io.BytesIO:
    """Helper: wrap bytes in a seekable stream."""
    return io.BytesIO(data)


def uleb128(value: int) -> bytes:
    """Helper: encode an unsigned integer as ULEB128."""
    buf = []
    while True:
        b = value & 0x7F
        value >>= 7
        if value:
            buf.append(b | 0x80)
        else:
            buf.append(b)
            break
    return bytes(buf)


def section(sec_id: int, content: bytes) -> bytes:
    """Helper: wrap section content with its id and ULEB128-encoded size."""
    return bytes([sec_id]) + uleb128(len(content)) + content


def custom_section(name: str, payload: bytes = b'') -> bytes:
    """Helper: build a custom section (id 0) with the given name and raw payload."""
    name_bytes = name.encode('utf-8')
    content = uleb128(len(name_bytes)) + name_bytes + payload
    return section(0, content)


def defns_len(k: KInner) -> int:
    """Count the number of items in a `Defns` cons-list KAST node."""
    n = 0
    while isinstance(k, KApply) and k.args:
        n += 1
        k = k.args[1]
    return n


class TestFloats:
    VALUES = [0.0, 3.14, -1.5, 1.23456789, -9.99, float('inf'), float('-inf')]

    @pytest.mark.parametrize('value', VALUES)
    def test_f32(self, value: float) -> None:
        encoded = struct.pack('<f', value)
        assert floats.f32(stream(encoded)) == pytest.approx(value)

    @pytest.mark.parametrize('value', VALUES)
    def test_f64(self, value: float) -> None:
        encoded = struct.pack('<d', value)
        assert floats.f64(stream(encoded)) == pytest.approx(value)

    def test_f32_eof_raises(self) -> None:
        with pytest.raises(WasmEOFError):
            floats.f32(stream(b'\x00\x01'))  # only 2 bytes, needs 4

    def test_f64_eof_raises(self) -> None:
        with pytest.raises(WasmEOFError):
            floats.f64(stream(b'\x00\x01\x02\x03\x04'))  # only 5 bytes, needs 8


class TestIntegers:
    U32_VALUES = [0, 1, 127, 128, 300, 624485, 2**32 - 1]
    U64_VALUES = [0, 1, 2**32, 2**35 + 1, 2**64 - 1]
    I32_VALUES = [0, 1, -1, 127, -128, 2**31 - 1, -(2**31)]
    I64_VALUES = [0, 1, -1, 2**63 - 1, -(2**63)]

    @staticmethod
    def encode_uleb128(value: int) -> bytes:
        buf = []
        while True:
            b = value & 0x7F
            value >>= 7
            if value:
                buf.append(b | 0x80)
            else:
                buf.append(b)
                break
        return bytes(buf)

    @staticmethod
    def encode_sleb128(value: int) -> bytes:
        buf = []
        while True:
            b = value & 0x7F
            value >>= 7
            if (value == 0 and b & 0x40 == 0) or (value == -1 and b & 0x40 != 0):
                buf.append(b)
                break
            buf.append(b | 0x80)
        return bytes(buf)

    @pytest.mark.parametrize('value', U32_VALUES)
    def test_unsigned_32(self, value: int) -> None:
        encoded = self.encode_uleb128(value)
        assert integers.u32(stream(encoded)) == value

    @pytest.mark.parametrize('value', U64_VALUES)
    def test_unsigned_64(self, value: int) -> None:
        encoded = self.encode_uleb128(value)
        assert integers.u64(stream(encoded)) == value

    @pytest.mark.parametrize('value', I32_VALUES)
    def test_uninterpreted_32(self, value: int) -> None:
        expected = integers.to_uninterpreted(32, value)
        encoded = self.encode_sleb128(value)
        assert integers.i32(stream(encoded)) == expected

    @pytest.mark.parametrize('value', I64_VALUES)
    def test_uninterpreted_64(self, value: int) -> None:
        expected = integers.to_uninterpreted(64, value)
        encoded = self.encode_sleb128(value)
        assert integers.i64(stream(encoded)) == expected


class TestLimits:
    def test_i32_no_max(self) -> None:
        at, lim = limits(stream(b'\x00' + uleb128(1)))
        assert at == wast.i32
        assert lim == (1, None)

    def test_i32_with_max(self) -> None:
        at, lim = limits(stream(b'\x01' + uleb128(1) + uleb128(2)))
        assert at == wast.i32
        assert lim == (1, 2)

    def test_i64_no_max(self) -> None:
        at, lim = limits(stream(b'\x04' + uleb128(1)))
        assert at == wast.i64
        assert lim == (1, None)

    def test_i64_with_max(self) -> None:
        at, lim = limits(stream(b'\x05' + uleb128(1) + uleb128(2)))
        assert at == wast.i64
        assert lim == (1, 2)

    @pytest.mark.parametrize('flag', [0x02, 0x03])
    def test_shared_memory_flags_rejected(self, flag: int) -> None:
        with pytest.raises(WasmParseError):
            limits(stream(bytes([flag]) + uleb128(1)))


class TestPeekBytes:
    def test_successful_peek_does_not_advance_stream(self) -> None:
        s = stream(b'\x01\x02\x03')
        assert peek_bytes(2, s) == b'\x01\x02'
        assert s.tell() == 0

    def test_partial_eof_restores_stream_position(self) -> None:
        # only 1 byte available, but 2 are requested: the short read must not leave the
        # stream advanced past the byte it couldn't help but consume while trying.
        s = stream(b'\x40')
        with pytest.raises(WasmEOFError):
            peek_bytes(2, s)
        assert s.tell() == 0

    def test_true_eof_restores_stream_position(self) -> None:
        s = stream(b'')
        with pytest.raises(WasmEOFError):
            peek_bytes(1, s)
        assert s.tell() == 0


class TestCustomSections:
    def _wrap(self, *sections: bytes) -> bytes:
        return MAGIC + VERSION + b''.join(sections)

    def test_custom_sections_do_not_break_stream_alignment(self) -> None:
        type_section = section(1, uleb128(1) + bytes([0x60]) + uleb128(1) + bytes([0x7F]) + uleb128(1) + bytes([0x7F]))
        func_section = section(3, uleb128(1) + uleb128(0))
        export_section = section(7, uleb128(1) + (uleb128(len(b'f')) + b'f' + bytes([0x00]) + uleb128(0)))
        code_section = section(10, uleb128(1) + (uleb128(4) + bytes([0x00, 0x20, 0x00, 0x0B])))

        data = self._wrap(
            custom_section('a', b'hello'),
            type_section,
            custom_section('b'),
            func_section,
            custom_section('c', b'world'),
            export_section,
            custom_section('d'),
            code_section,
            custom_section('e'),
        )

        module = parse_module(stream(data))

        assert isinstance(module, KApply)
        types, funcs, _, _, _, _, _, _, _, exports, _ = module.args
        assert defns_len(types) == 1
        assert defns_len(funcs) == 1
        assert defns_len(exports) == 1


class TestTrailingData:
    def test_empty_module_parses(self) -> None:
        parse_module(stream(MAGIC + VERSION))

    def test_trailing_garbage_rejected(self) -> None:
        with pytest.raises(WasmParseError):
            parse_module(stream(MAGIC + VERSION + b'\xff\xff\xff'))

    def test_trailing_garbage_after_sections_rejected(self) -> None:
        # trailing byte doesn't match any expected section id, and isn't a custom section (id 0) either,
        # so it must be caught by the final EOF check rather than any individual `section()` call.
        type_section = section(1, uleb128(1) + bytes([0x60]) + uleb128(0) + uleb128(0))
        with pytest.raises(WasmParseError):
            parse_module(stream(MAGIC + VERSION + type_section + b'\xff'))


class TestFuncCodeLengthMismatch:
    def test_more_funcs_than_code_entries_rejected(self) -> None:
        func_section = section(3, uleb128(1) + uleb128(0))
        code_section = section(10, uleb128(0))
        with pytest.raises(WasmParseError):
            parse_module(stream(MAGIC + VERSION + func_section + code_section))

    def test_more_code_entries_than_funcs_rejected(self) -> None:
        func_section = section(3, uleb128(0))
        code_section = section(10, uleb128(1) + (uleb128(2) + bytes([0x00, 0x0B])))
        with pytest.raises(WasmParseError):
            parse_module(stream(MAGIC + VERSION + func_section + code_section))


def unwrap_instr(k: KApply) -> KApply:
    """Helper: strip the `aInstrWithPos` position wrapper added by `instr()`."""
    assert k.label.name == 'aInstrWithPos'
    inner = k.args[0]
    assert isinstance(inner, KApply)
    return inner


class TestInstructions:
    # non-zero, multi-byte memidx values plus a trailing sentinel byte prove the parser
    # consumes exactly the memidx operands, not just a fixed number of bytes that
    # happens to work for the single-byte/zero case
    @pytest.mark.parametrize('dst_memidx, src_memidx', [(0, 0), (300, 65536)], ids=['zero', 'multi_byte'])
    def test_memory_copy(self, dst_memidx: int, src_memidx: int) -> None:
        # 0xFC 10 dst_memidx src_memidx
        s = stream(bytes([0xFC]) + uleb128(10) + uleb128(dst_memidx) + uleb128(src_memidx) + b'\x01')
        i = instr(s)
        assert isinstance(i, KApply)
        assert unwrap_instr(i) == wast.MEMORY_COPY
        assert s.read(1) == b'\x01'

    @pytest.mark.parametrize('memidx', [0, 300], ids=['zero', 'multi_byte'])
    def test_memory_fill(self, memidx: int) -> None:
        # 0xFC 11 memidx
        s = stream(bytes([0xFC]) + uleb128(11) + uleb128(memidx) + b'\x01')
        i = instr(s)
        assert isinstance(i, KApply)
        assert unwrap_instr(i) == wast.MEMORY_FILL
        assert s.read(1) == b'\x01'
