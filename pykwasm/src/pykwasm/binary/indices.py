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


def memidx(s: InputStream) -> int:
    return u32(s)


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
