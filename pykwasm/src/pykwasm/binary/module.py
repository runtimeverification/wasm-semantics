from __future__ import annotations

from typing import TYPE_CHECKING

from pyk.kast.inner import KApply, KLabel, KSort, KToken

import pykwasm.kwasm_ast as wast
from pykwasm.binary.indices import externidx, funcidx, memidx, tableidx, typeidx
from pykwasm.binary.instructions import expr

from .combinators import list_of, sized
from .integers import u32
from .types import externtype_as_import_desc, globaltype, memtype, rectype, reftype, tabletype, valtype
from .utils import WasmEOFError, WasmParseError, peek_byte, peek_bytes, read_byte, read_bytes, skip

if TYPE_CHECKING:
    from pyk.kast.inner import KInner

    from .types import RecType
    from .utils import A, InputStream, Parser

MAGIC = b'\x00\x61\x73\x6d'
VERSION = b'\x01\x00\x00\x00'

EMPTY_SECTION: KInner = wast.EMPTY_DEFNS


def parse_magic(s: InputStream) -> None:
    try:
        val = s.read(4)
        assert val == MAGIC
    except Exception as e:
        raise WasmParseError('Could not read magic value') from e


def parse_version(s: InputStream) -> None:
    try:
        val = s.read(4)
        assert val == VERSION
    except Exception as e:
        raise WasmParseError('Could not read version') from e


def parse_custom_section(s: InputStream) -> bytes:
    try:
        n = peek_byte(s)
    except WasmEOFError:
        return b''

    if n != 0:
        return b''
    skip(1, s)
    return read_bytes(n, s)


def parse_custom_sections(s: InputStream) -> list[bytes]:
    sects = []
    while True:
        sect = parse_custom_section(s)
        if not sect:
            break
        sects.append(sect)
    return sects


def section(sec_id: int, p: Parser[A], default: A, s: InputStream) -> A:
    try:
        n = peek_byte(s)
    except WasmEOFError:
        return default

    if n != sec_id:
        return default
    skip(1, s)
    return sized(p, s)


# TODO support recursive types in type sections
def typesec(s: InputStream) -> KInner:
    def rectype_to_type_decl(rc: RecType) -> KInner:
        match rc:
            case [(_, [], st)]:
                return wast.type(st)
            case _:
                raise WasmParseError('recursive types are not supported')

    rectypes = list_of(rectype, s)
    type_decls = [rectype_to_type_decl(t) for t in rectypes]
    return wast.defns(type_decls)


def byte_list(s: InputStream) -> bytes:
    n = u32(s)
    return read_bytes(n, s)


def name(s: InputStream) -> str:
    bs = byte_list(s)
    return bs.decode('utf-8')


def importsec(s: InputStream) -> KInner:
    def import_(s: InputStream) -> KInner:
        nm1 = wast.wasm_string(name(s))
        nm2 = wast.wasm_string(name(s))
        desc = externtype_as_import_desc(s)
        return wast.imp(nm1, nm2, desc)

    imports = list_of(import_, s)
    return wast.defns(imports)


def funcsec(s: InputStream) -> list[int]:
    return list_of(typeidx, s)


def tablesec(s: InputStream) -> KInner:
    def table(s: InputStream) -> KInner:
        match peek_bytes(2, s):
            case b'\x40\x00':
                raise WasmParseError('table_tt_with_initializer not implemented')
            case _:
                # TODO this should return '𝗍𝖺𝖻𝗅𝖾 tt (𝗋𝖾𝖿.𝗇𝗎𝗅𝗅 ht) if tt=at lim (𝗋𝖾𝖿 𝗇𝗎𝗅𝗅? ht)'
                _at, lim, rt = tabletype(s)
                return wast.table(lim, rt)

    tables = list_of(table, s)
    return wast.defns(tables)


def memsec(s: InputStream) -> KInner:
    mems = list_of(memtype, s)
    return wast.defns([wast.memory(lim) for _at, lim in mems])


def globalsec(s: InputStream) -> KInner:
    def glob(s: InputStream) -> KInner:
        gt = globaltype(s)
        e = wast.instrs(expr(s))
        return wast.glob(gt, e)

    return wast.defns(list_of(glob, s))


def exportsec(s: InputStream) -> KInner:
    def export(s: InputStream) -> KInner:
        nm = name(s)
        xx = externidx(s)
        return wast.export(wast.wasm_string(nm), index=xx)

    return wast.defns(list_of(export, s))


def startsec(s: InputStream) -> KInner:
    start_func = funcidx(s)
    return wast.defns([wast.start(start_func)])


def elemsec(s: InputStream) -> KInner:
    def elemkind(s: InputStream) -> KInner:
        match read_byte(s):
            case 0:
                return wast.funcref
            case x:
                raise WasmParseError(f'Invalid elemkind: {x}')

    def elem_init(init: list[list[KInner]]) -> list[int | None]:
        def expr_to_int(expr: list[KInner]) -> int | None:
            # 'expr' must be a constant expression consisting of a reference instruction
            match expr:
                case [KApply(KLabel('aRef.func'), (KToken(sfuncidx, KSort('Int')),))]:
                    return int(sfuncidx)
                case [KApply(KLabel('aRef.null'), _)]:
                    return None
                case _:
                    raise WasmParseError(f'Expected a constant reference instruction as elem initializer, got {expr}')

        return [expr_to_int(e) for e in init]

    def elem(s: InputStream) -> KInner:
        match read_byte(s):
            case 0:
                e0 = expr(s)
                ys = list_of(funcidx, s)
                return wast.elem(wast.funcref, wast.elem_active(0, wast.instrs(e0)), ys)
            case 1:
                rt = elemkind(s)
                ys = list_of(funcidx, s)
                return wast.elem(rt, wast.elem_passive(), ys)
            case 2:
                x = tableidx(s)
                e = expr(s)
                rt = elemkind(s)
                ys = list_of(funcidx, s)
                return wast.elem(rt, wast.elem_active(x, wast.instrs(e)), ys)
            case 3:
                rt = elemkind(s)
                ys = list_of(funcidx, s)
                return wast.elem(rt, wast.elem_declarative(), ys)
            case 4:
                e0 = expr(s)
                es = list_of(expr, s)
                return wast.elem(wast.funcref, wast.elem_active(0, wast.instrs(e0)), elem_init(es))
            case 5:
                rt = reftype(s)
                es = list_of(expr, s)
                return wast.elem(rt, wast.elem_passive(), elem_init(es))
            case 6:
                x = tableidx(s)
                e0 = expr(s)
                rt = reftype(s)
                es = list_of(expr, s)
                return wast.elem(rt, wast.elem_active(x, wast.instrs(e0)), elem_init(es))
            case 7:
                rt = reftype(s)
                es = list_of(expr, s)
                return wast.elem(rt, wast.elem_declarative(), elem_init(es))
            case x:
                raise WasmParseError(f'Invalid elem descriptor: {x}')

    return wast.defns(list_of(elem, s))


def codesec(s: InputStream) -> list[tuple[list[KInner], list[KInner]]]:
    def locals(s: InputStream) -> tuple[int, KInner]:
        n = u32(s)
        t = valtype(s)
        return n, t

    def func(s: InputStream) -> tuple[list[KInner], list[KInner]]:
        locs = list_of(locals, s)
        body = expr(s)

        locs_flattened = [t for n, t in locs for _ in range(n)]
        return locs_flattened, body

    def code(s: InputStream) -> tuple[list[KInner], list[KInner]]:
        return sized(func, s)

    return list_of(code, s)


def datasec(s: InputStream) -> KInner:
    def data(s: InputStream) -> KInner:
        match read_byte(s):
            case 0:
                e = expr(s)
                bs = byte_list(s)
                return wast.data(bs, wast.datamode_active(0, wast.instrs(e)))
            case 1:
                bs = byte_list(s)
                return wast.data(bs, wast.datamode_passive())
            case 2:
                x = memidx(s)
                e = expr(s)
                bs = byte_list(s)
                return wast.data(bs, wast.datamode_active(x, wast.instrs(e)))
            case x:
                raise WasmParseError(f'Invalid data segment descriptor: {x}')

    return wast.defns(list_of(data, s))


def datacntsec(s: InputStream) -> int | None:
    return u32(s)


def parse_module(s: InputStream) -> KInner:
    parse_magic(s)
    parse_version(s)

    custom_sections = []
    customs = lambda: custom_sections.extend(parse_custom_sections(s))

    customs()

    type_section = section(1, typesec, EMPTY_SECTION, s)

    customs()

    import_section = section(2, importsec, EMPTY_SECTION, s)

    customs()

    function_section: list[int] = section(3, funcsec, [], s)

    customs()

    table_section = section(4, tablesec, EMPTY_SECTION, s)

    customs()

    memory_section = section(5, memsec, EMPTY_SECTION, s)

    customs()

    global_section = section(6, globalsec, EMPTY_SECTION, s)

    customs()

    export_section = section(7, exportsec, EMPTY_SECTION, s)

    customs()

    start_section = section(8, startsec, EMPTY_SECTION, s)

    customs()

    elem_section = section(9, elemsec, EMPTY_SECTION, s)

    customs()

    data_cnt_section = section(12, datacntsec, None, s)  # noqa f841

    customs()

    code_section: list[tuple[list[KInner], list[KInner]]] = section(10, codesec, [], s)

    customs()

    data_section = section(11, datasec, EMPTY_SECTION, s)

    customs()

    functions = [
        wast.func(
            wast.KInt(typ_idx),
            wast.vec_type(wast.val_types(locals)),
            wast.instrs(code),
        )
        for typ_idx, (locals, code) in zip(function_section, code_section, strict=True)
    ]

    return wast.module(
        types=type_section,
        funcs=wast.defns(functions),
        tables=table_section,
        mems=memory_section,
        globs=global_section,
        elem=elem_section,
        data=data_section,
        start=start_section,
        imports=import_section,
        exports=export_section,
    )
