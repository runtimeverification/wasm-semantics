import io
import struct

import pytest

from pykwasm import kwasm_ast as wast
from pykwasm.binary import floats, integers
from pykwasm.binary.types import limits
from pykwasm.binary.utils import WasmEOFError, WasmParseError


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
