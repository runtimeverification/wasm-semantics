from __future__ import annotations

from typing import TYPE_CHECKING

from .integers import u32
from .utils import WasmParseError, reset

if TYPE_CHECKING:
    from .utils import A, InputStream, Parser


def iterate(f: Parser[A], s: InputStream) -> list[A]:
    results = []
    while True:
        try:
            results.append(f(s))
        except (WasmParseError, IndexError, ValueError):
            break
    return results


def sized(p: Parser[A], s: InputStream) -> A:
    size = u32(s)
    start_pos = s.tell()
    res = p(s)
    end_pos = s.tell()
    if end_pos - start_pos != size:
        raise WasmParseError('Size mismatch')
    return res


def parse_n(p: Parser[A], n: int, s: InputStream) -> list[A]:
    results = []
    for _ in range(n):
        x = p(s)
        results.append(x)
    return results


def list_of(p: Parser[A], s: InputStream) -> list[A]:
    n = u32(s)
    return parse_n(p, n, s)


def either(ps: list[Parser[A]], s: InputStream) -> A:
    for p in ps:
        pos = s.tell()
        try:
            return p(s)
        except WasmParseError:
            reset(pos, s)
            continue
    raise WasmParseError('None of the alternatives succeeded')
