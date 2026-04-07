from __future__ import annotations

from typing import TYPE_CHECKING

if TYPE_CHECKING:
    from collections.abc import Callable
    from typing import TYPE_CHECKING, BinaryIO, TypeAlias, TypeVar

    InputStream: TypeAlias = BinaryIO

    A = TypeVar('A')
    Parser: TypeAlias = Callable[[InputStream], A]
    NParser: TypeAlias = Callable[[int, InputStream], A]


def read_bytes(n: int, s: InputStream) -> bytes:
    b = s.read(n)
    if len(b) != n:
        raise WasmEOFError(f'Unexpected EOF. Expected {n} bytes, got {len(b)}')
    return b


def read_byte(s: InputStream) -> int:
    return read_bytes(1, s)[0]


def peek_bytes(n: int, s: InputStream) -> bytes:
    pos = s.tell()
    b = s.read(n)
    if len(b) != n:
        raise WasmEOFError(f'Unexpected EOF. Expected {n} bytes, got {len(b)}')
    reset(pos, s)
    return b


def peek_byte(s: InputStream) -> int:
    return peek_bytes(1, s)[0]


def skip(n: int, s: InputStream) -> None:
    s.seek(n, 1)


def reset(n: int, s: InputStream) -> None:
    s.seek(n, 0)


def expect_bytes(expected: bytes, s: InputStream) -> None:
    bs = read_bytes(len(expected), s)
    if bs != expected:
        raise WasmParseError(f'Expected {expected!r}, got {bs!r}')


class WasmParseError(Exception):
    pass


class WasmEOFError(WasmParseError):
    pass
