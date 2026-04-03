from __future__ import annotations

from typing import TYPE_CHECKING

from pykwasm.binary.indices import typeidx

from .. import kwasm_ast as wast
from .combinators import either, list_of
from .integers import u64
from .utils import WasmParseError, peek_byte, read_byte, skip

if TYPE_CHECKING:
    from typing import TypeAlias

    from pyk.kast.inner import KInner

    from .utils import InputStream

# subtype struct in recursive types
# subtype ::= sub final? typeuse* comptype
SubType: TypeAlias = tuple[bool, list[int], 'KInner']

# A group of mutually recursive composite types
# rectype :: = rec list(subtype)
RecType: TypeAlias = list[SubType]


def rectype(s: InputStream) -> RecType:
    n = peek_byte(s)
    if n == 0x4E:
        skip(1, s)
        sts = list_of(parse_subtype, s)
        return sts
    return [parse_subtype(s)]


def parse_subtype(s: InputStream) -> SubType:
    n = peek_byte(s)

    if n == 0x4F:
        skip(1, s)
        xs = list_of(typeidx, s)
        ct = parse_comptype(s)
        return (True, xs, ct)
    if n == 0x50:
        skip(1, s)
        xs = list_of(typeidx, s)
        ct = parse_comptype(s)
        return (False, xs, ct)

    ct = parse_comptype(s)
    return (True, [], ct)


def parse_comptype(s: InputStream) -> KInner:
    n = read_byte(s)
    if n == 0x60:
        ts1 = resulttype(s)
        ts2 = resulttype(s)
        return wast.func_type(wast.vec_type(wast.val_types(ts1)), wast.vec_type(wast.val_types(ts2)))

    if n == 0x5E:
        raise WasmParseError('array composite type is not yet supported')
    if n == 0x5F:
        raise WasmParseError('struct composite type is not yet supported')
    raise WasmParseError(f'composite type not yet supported: {n}')


def resulttype(s: InputStream) -> list[KInner]:
    return list_of(valtype, s)


def valtype(s: InputStream) -> KInner:
    d = peek_byte(s)

    try:
        return either(
            [
                numtype,
                reftype,
                # TODO implement vectypes
                # vectype,
            ],
            s,
        )
    except WasmParseError:
        raise WasmParseError(f'Could not parse valtype. Descriptor: {d}') from None


def reftype(s: InputStream) -> KInner:
    match read_byte(s):
        case 0x70:
            return wast.funcref
        case 0x6F:
            return wast.externref
        case d:
            raise WasmParseError(f'Unsupported reftype descriptor: {d}')


def numtype(s: InputStream) -> KInner:
    match read_byte(s):
        case 0x7C:
            return wast.f64
        case 0x7D:
            return wast.f32
        case 0x7E:
            return wast.i64
        case 0x7F:
            return wast.i32
        case d:
            raise WasmParseError(f'Invalid numtype descriptor: {d}')


Limits: TypeAlias = tuple[int, int | None]


# Returns (addressType, (n, m))
def limits(s: InputStream) -> tuple[KInner, Limits]:
    match read_byte(s):
        case 0x00:
            n = u64(s)
            return wast.i32, (n, None)
        case 0x01:
            n = u64(s)
            m = u64(s)
            return wast.i32, (n, m)
        case 0x02:
            n = u64(s)
            return wast.i64, (n, None)
        case 0x03:
            n = u64(s)
            m = u64(s)
            return wast.i64, (n, m)
        case d:
            raise WasmParseError(f'Invalid limit descriptor: {d}')


# Returns (addressType, limits, reftype)
def tabletype(s: InputStream) -> tuple[KInner, Limits, KInner]:
    rt = reftype(s)
    at, lim = limits(s)
    return at, lim, rt


# Returns (addressType, limits)
def memtype(s: InputStream) -> tuple[KInner, Limits]:
    return limits(s)


def mut(s: InputStream) -> KInner:
    match read_byte(s):
        case 0x00:
            return wast.MUT_CONST
        case 0x01:
            return wast.MUT_VAR
        case d:
            raise WasmParseError(f'Invalid mut descriptor. Expected 0x00 or 0x01, got: {d}')


def globaltype(s: InputStream) -> KInner:
    t = valtype(s)
    m = mut(s)
    return wast.global_type(m, t)


def tagtype(s: InputStream) -> int:
    match read_byte(s):
        case 0x00:
            return typeidx(s)
        case d:
            raise WasmParseError(f'Invalid tagtype descriptor. Expected 0x00, got: {d}')


# TODO this function parses externtype from wasm 3.0 but returns ImportDesc from Wasm 1.0.
# Update the ImportDefn K definition to reflect the changes.
def externtype_as_import_desc(s: InputStream) -> KInner:
    match read_byte(s):
        case 0x00:
            x = typeidx(s)
            return wast.func_desc(x)
        case 0x01:
            _at, lim, _rt = tabletype(s)
            return wast.table_desc(lim)
        case 0x02:
            _at, lim = memtype(s)
            return wast.memory_desc(lim)
        case 0x03:
            gt = globaltype(s)
            return wast.global_desc(gt)
        case 0x04:
            # jt = tagtype(s)
            raise WasmParseError('externtype tagtype variant is not yet supported.')
        case d:
            raise WasmParseError(f'Invalid externtype descriptor. Expected [0x00-0x04], got: {d}')


def heaptype(s: InputStream) -> KInner:
    match read_byte(s):
        case 0x6F:
            return wast.HEAPTYPE_EXTERN
        case 0x70:
            return wast.HEAPTYPE_FUNC
        case x:
            raise WasmParseError(f'Unsupported heaptype descriptor: {x}')
