import io
import struct

import pytest

from pykwasm.binary import floats, integers
from pykwasm.binary.utils import WasmEOFError


def stream(data: bytes) -> io.BytesIO:
    """Helper: wrap bytes in a seekable stream."""
    return io.BytesIO(data)


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
