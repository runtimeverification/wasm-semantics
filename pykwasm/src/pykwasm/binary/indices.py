from __future__ import annotations

from typing import TYPE_CHECKING

import pykwasm.kwasm_ast as wast

from .integers import u32
from .utils import WasmParseError, read_byte

if TYPE_CHECKING:
    from pyk.kast.inner import KInner

    from .utils import InputStream


def typeidx(s: InputStream) -> int:
    return u32(s)


def funcidx(s: InputStream) -> int:
    return u32(s)


def tableidx(s: InputStream) -> int:
    return u32(s)


# TODO multi-memory support is future work; the K semantics models a single memory,
# so any reference to a memory other than 0 is rejected instead of mis-executing.
def memidx(s: InputStream) -> int:
    x = u32(s)
    if x != 0:
        raise WasmParseError(f'Multi-memory is not supported. Expected memory index 0, got: {x}')
    return x


def globalidx(s: InputStream) -> int:
    return u32(s)


def tagidx(s: InputStream) -> int:
    return u32(s)


def elemidx(s: InputStream) -> int:
    return u32(s)


def dataidx(s: InputStream) -> int:
    return u32(s)


def localidx(s: InputStream) -> int:
    return u32(s)


def labelidx(s: InputStream) -> int:
    return u32(s)


def externidx(s: InputStream) -> KInner:
    match read_byte(s):
        case 0x00:
            return wast.externidx_func(funcidx(s))
        case 0x01:
            return wast.externidx_table(tableidx(s))
        case 0x02:
            return wast.externidx_memory(memidx(s))
        case 0x03:
            return wast.externidx_global(globalidx(s))
        case 0x04:
            return wast.externidx_tag(tagidx(s))
        case x:
            raise WasmParseError(f'Invalid externidx descriptor: {x}')
