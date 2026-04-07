from __future__ import annotations

from typing import TYPE_CHECKING

from .utils import WasmParseError, read_byte

if TYPE_CHECKING:
    from .utils import InputStream


def parse_uint(bits: int, s: InputStream) -> int:
    n = read_byte(s)

    # No continuation bit
    if n < 2**7:
        if n >= 2**bits:
            raise WasmParseError(f'Value {n} exceeds u{bits} range')
        return n

    # Has continuation bit
    if bits <= 7:  # Not enough bits remaining
        raise WasmParseError(f'LEB128 encoding too long for u{bits}')

    m = parse_uint(bits - 7, s)
    return (n - 2**7) + (2**7) * m


def parse_sint(bits: int, s: InputStream) -> int:
    n = read_byte(s)

    # No continuation bit and 0 sign bit
    if n < 2**6:
        if n >= 2 ** (bits - 1):
            raise WasmParseError(f'Value {n} exceeds s{bits} range')
        return n

    # No continuation bit and 1 sign bit
    if 2**6 <= n and n < 2**7:
        signed_value = n - 2**7
        if signed_value < -(2 ** (bits - 1)):
            raise WasmParseError(f'Value {signed_value} exceeds s{bits} range')
        return n - 2**7

    # Has continuation bit
    if bits <= 7:  # Not enough bits remaining
        raise WasmParseError(f'LEB128 encoding too long for s{bits}')

    i = parse_sint(bits - 7, s)
    return (2**7) * i + (n - 2**7)


def u32(s: InputStream) -> int:
    return parse_uint(32, s)


def u64(s: InputStream) -> int:
    return parse_uint(64, s)


def to_uninterpreted(bits: int, x: int) -> int:
    if 0 <= x:
        return x
    return x + 2**bits


def parse_iint(bits: int, s: InputStream) -> int:
    i = parse_sint(bits, s)
    return to_uninterpreted(bits, i)


def i32(s: InputStream) -> int:
    return parse_iint(32, s)


def i64(s: InputStream) -> int:
    return parse_iint(64, s)
