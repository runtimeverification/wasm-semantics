#!/usr/bin/env python3

"""
This library provides a translation from the Wasm binary format to Kast.
"""

import sys
from typing import IO, Iterable

from pyk.kast.inner import KInner
from wasm import instructions
from wasm.datatypes import (
    DataSegment,
    ElementSegment,
    Export,
    Function,
    FunctionType,
    Global,
    GlobalType,
    Import,
    Limits,
    Memory,
    MemoryType,
    Module,
    Mutability,
    RefType,
    StartFunction,
    Table,
    TableType,
    TypeIdx,
    ValType,
    addresses,
)
from wasm.datatypes.element_segment import ElemMode, ElemModeActive, ElemModeDeclarative, ElemModePassive
from wasm.instructions import BaseInstruction
from wasm.opcodes import BinaryOpcode
from wasm.parsers import parse_module

from pykwasm import kwasm_ast as a


def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1], 'rb')
    module = wasm2kast(infile)
    infile.close()
    return module


def wasm2kast(wasm_bytes: IO[bytes], filename=None) -> KInner:
    """Returns a dictionary representing the Kast JSON."""
    ast = parse_module(wasm_bytes)
    return ast2kast(ast, filename=filename)


def ast2kast(wasm_ast: Module, filename=None) -> KInner:
    """Returns a dictionary representing the Kast JSON."""
    types = a.defns([typ(x) for x in wasm_ast.types])
    funcs = a.defns([func(x) for x in wasm_ast.funcs])
    tables = a.defns([table(x) for x in wasm_ast.tables])
    mems = a.defns([memory(x) for x in wasm_ast.mems])
    globs = a.defns([glob(x) for x in wasm_ast.globals])
    elems = a.defns([elem(x) for x in wasm_ast.elem])
    datas = a.defns([data(x) for x in wasm_ast.data])
    starts = a.defns(start(wasm_ast.start))
    imports = a.defns([imp(x) for x in wasm_ast.imports])
    exports = a.defns([export(x) for x in wasm_ast.exports])
    meta = a.module_metadata(filename=filename)
    return a.module(
        types=types,
        funcs=funcs,
        tables=tables,
        mems=mems,
        globs=globs,
        elem=elems,
        data=datas,
        start=starts,
        imports=imports,
        exports=exports,
        metadata=meta,
    )


#########
# Defns #
#########


def typ(t: FunctionType):
    return a.type(func_type(t.params, t.results))


def func(f: Function):
    type = a.KInt(f.type_idx)
    ls_list = [val_type(x) for x in f.locals]
    locals = a.vec_type(a.val_types(ls_list))
    body = instrs(f.body)
    return a.func(type, locals, body)


def table(t: Table):
    ls = limits(t.type.limits)
    typ = ref_type(t.type.elem_type)
    return a.table(ls, typ)


def memory(m: Memory):
    ls = limits(m.type)
    return a.memory(ls)


def glob(g: Global):
    t = global_type(g.type)
    init = instrs(g.init)
    return a.glob(t, init)


def ref_type(t: RefType):
    if t is addresses.FunctionAddress:
        return a.funcref
    if t is addresses.ExternAddress:
        return a.externref
    raise ValueError(f'Invalid RefType: {t}')


def elem_mode(m: ElemMode) -> KInner:
    if isinstance(m, ElemModeActive):
        offset = instrs(m.offset)
        return a.elem_active(m.table, offset)
    if isinstance(m, ElemModeDeclarative):
        return a.elem_declarative()
    if isinstance(m, ElemModePassive):
        return a.elem_passive()
    raise ValueError(f'Unknown ElemMode: {m}')


def elem_init(init: tuple[Iterable[BaseInstruction], ...]) -> Iterable[int | None]:
    def expr_to_int(expr: Iterable[BaseInstruction]) -> int | None:
        # 'expr' must be a constant expression consisting of a reference instruction
        assert len(expr) == 1 or len(expr) == 2 and isinstance(expr[1], instructions.End), expr
        instr = expr[0]

        if isinstance(instr, instructions.RefFunc):
            return instr.funcidx
        if isinstance(instr, instructions.RefNull):
            return None
        raise ValueError(f'Invalid reference expression: {expr}')

    return [expr_to_int(e) for e in init]


def elem(e: ElementSegment):
    typ = ref_type(e.type)
    mode = elem_mode(e.mode)
    init = elem_init(e.init)
    return a.elem(typ, mode, init)


def data(d: DataSegment):
    offset = instrs(d.offset)
    return a.data(d.memory_idx, offset, d.init)


def start(s: StartFunction):
    if s is None:
        return []
    return [a.start(s.function_idx)]


def imp(i: Import):
    mod_name = a.wasm_string(i.module_name)
    name = a.wasm_string(i.as_name)
    t = type(i.desc)
    if t is TypeIdx:
        desc = a.func_desc(i.desc)
    elif t is GlobalType:
        desc = a.global_desc(global_type(i.desc))
    elif t is TableType:
        desc = a.table_desc(limits(i.desc.limits))
    elif t is MemoryType:
        desc = a.memory_desc(limits(i.desc))
    return a.imp(mod_name, name, desc)


def export(e: Export):
    name = a.wasm_string(e.name)
    idx = e.desc
    return a.export(name, idx)


##########
# Instrs #
##########

block_id = 0


def instrs(iis):
    """Turn a list of instructions into KAST."""
    # We ignore `END`.
    # The AST supplied by py-wasm has already parsed these and terminated the blocks.
    # We also ignore `ELSE`.
    # The AST supplied by py-wasm includes the statements in the else-branch as part of the `IF` instruction.
    return a.instrs([instr(i) for i in iis if not i.opcode == BinaryOpcode.END and not i.opcode == BinaryOpcode.ELSE])


def instr(i):
    B = BinaryOpcode
    global block_id
    # TODO rewrite 'i.opcode == _' conditions as isinstance for better type-checking
    if i.opcode == B.BLOCK:
        cur_block_id = block_id
        block_id += 1
        iis = instrs(i.instructions)
        res = vec_type(i.result_type)
        return a.BLOCK(res, iis, a.KInt(cur_block_id))
    if i.opcode == B.BR:
        return a.BR(i.label_idx)
    if i.opcode == B.BR_IF:
        return a.BR_IF(i.label_idx)
    if i.opcode == B.BR_TABLE:
        return a.BR_TABLE(i.label_indices, i.default_idx)
    if i.opcode == B.CALL:
        return a.CALL(i.function_idx)
    if i.opcode == B.CALL_INDIRECT:
        return a.CALL_INDIRECT(i.type_idx)
    if i.opcode == B.ELSE:
        raise (ValueError('ELSE opcode: should have been filtered out.'))
    if i.opcode == B.END:
        raise (ValueError('End opcode: should have been filtered out.'))
    if i.opcode == B.F32_CONST:
        return a.F32_CONST(i.value)
    if i.opcode == B.F64_CONST:
        return a.F64_CONST(i.value)
    if i.opcode == B.F32_REINTERPRET_I32:
        raise (ValueError('Reinterpret instructions not implemented.'))
    if i.opcode == B.F64_REINTERPRET_I64:
        raise (ValueError('Reinterpret instructions not implemented.'))
    if i.opcode == B.GET_GLOBAL:
        return a.GET_GLOBAL(i.global_idx)
    if i.opcode == B.GET_LOCAL:
        return a.GET_LOCAL(i.local_idx)
    if i.opcode == B.I32_CONST:
        return a.I32_CONST(i.value)
    if i.opcode == B.I64_CONST:
        return a.I64_CONST(i.value)
    if i.opcode == B.I32_REINTERPRET_F32:
        raise (ValueError('Reinterpret instructions not implemented.'))
    if i.opcode == B.I64_REINTERPRET_F64:
        raise (ValueError('Reinterpret instructions not implemented.'))
    if i.opcode == B.IF:
        cur_block_id = block_id
        block_id += 1
        thens = instrs(i.instructions)
        els = instrs(i.else_instructions)
        res = vec_type(i.result_type)
        return a.IF(res, thens, els, a.KInt(cur_block_id))
    if i.opcode == B.F32_STORE:
        return a.F32_STORE(i.memarg.offset)
    if i.opcode == B.F64_STORE:
        return a.F64_STORE(i.memarg.offset)
    if i.opcode == B.I32_STORE:
        return a.I32_STORE(i.memarg.offset)
    if i.opcode == B.I64_STORE:
        return a.I64_STORE(i.memarg.offset)
    if i.opcode == B.I32_STORE16:
        return a.I32_STORE16(i.memarg.offset)
    if i.opcode == B.I64_STORE16:
        return a.I64_STORE16(i.memarg.offset)
    if i.opcode == B.I32_STORE8:
        return a.I32_STORE8(i.memarg.offset)
    if i.opcode == B.I64_STORE8:
        return a.I64_STORE8(i.memarg.offset)
    if i.opcode == B.I64_STORE32:
        return a.I64_STORE32(i.memarg.offset)
    if i.opcode == B.F32_LOAD:
        return a.F32_LOAD(i.memarg.offset)
    if i.opcode == B.F64_LOAD:
        return a.F64_LOAD(i.memarg.offset)
    if i.opcode == B.I32_LOAD:
        return a.I32_LOAD(i.memarg.offset)
    if i.opcode == B.I64_LOAD:
        return a.I64_LOAD(i.memarg.offset)
    if i.opcode == B.I32_LOAD16_S:
        return a.I32_LOAD16_S(i.memarg.offset)
    if i.opcode == B.I32_LOAD16_U:
        return a.I32_LOAD16_U(i.memarg.offset)
    if i.opcode == B.I64_LOAD16_S:
        return a.I64_LOAD16_S(i.memarg.offset)
    if i.opcode == B.I64_LOAD16_U:
        return a.I64_LOAD16_U(i.memarg.offset)
    if i.opcode == B.I32_LOAD8_S:
        return a.I32_LOAD8_S(i.memarg.offset)
    if i.opcode == B.I32_LOAD8_U:
        return a.I32_LOAD8_U(i.memarg.offset)
    if i.opcode == B.I64_LOAD8_S:
        return a.I64_LOAD8_S(i.memarg.offset)
    if i.opcode == B.I64_LOAD8_U:
        return a.I64_LOAD8_U(i.memarg.offset)
    if i.opcode == B.I64_LOAD32_S:
        return a.I64_LOAD32_S(i.memarg.offset)
    if i.opcode == B.I64_LOAD32_U:
        return a.I64_LOAD32_U(i.memarg.offset)
    if i.opcode == B.LOOP:
        cur_block_id = block_id
        block_id += 1
        iis = instrs(i.instructions)
        res = vec_type(i.result_type)
        return a.LOOP(res, iis, a.KInt(cur_block_id))
    if i.opcode == B.SET_GLOBAL:
        return a.SET_GLOBAL(i.global_idx)
    if i.opcode == B.SET_LOCAL:
        return a.SET_LOCAL(i.local_idx)
    if i.opcode == B.TEE_LOCAL:
        return a.TEE_LOCAL(i.local_idx)
    if isinstance(i, instructions.RefFunc):
        return a.REF_FUNC(i.funcidx)
    if isinstance(i, instructions.RefNull):
        if i.reftype is addresses.FunctionAddress:
            return a.REF_NULL('func')
        if i.reftype is addresses.ExternAddress:
            return a.REF_NULL('extern')
        raise ValueError(f'Unknown heap type: {i}, {i.reftype}')
    if isinstance(i, instructions.TableGet):
        return a.TABLE_GET(i.tableidx)
    if isinstance(i, instructions.TableSet):
        return a.TABLE_SET(i.tableidx)
    if isinstance(i, instructions.TableInit):
        return a.TABLE_INIT(i.tableidx, i.elemidx)
    if isinstance(i, instructions.ElemDrop):
        return a.ELEM_DROP(i.elemidx)
    if isinstance(i, instructions.TableCopy):
        return a.TABLE_COPY(i.tableidx1, i.tableidx2)
    if isinstance(i, instructions.TableGrow):
        return a.TABLE_GROW(i.tableidx)
    if isinstance(i, instructions.TableSize):
        return a.TABLE_SIZE(i.tableidx)
    if isinstance(i, instructions.TableFill):
        return a.TABLE_FILL(i.tableidx)

    # Catch all for operations without direct arguments.
    return eval('a.' + i.opcode.name)


########
# Data #
########


def val_type(t: ValType):
    if t == ValType.i32:
        return a.i32
    if t == ValType.i64:
        return a.i64
    if t == ValType.f32:
        return a.f32
    if t == ValType.f64:
        return a.f64
    if t == ValType.externref:
        return a.externref
    if t == ValType.funcref:
        return a.funcref
    raise ValueError(f'Unknown value type: {t}')


def vec_type(ts: Iterable[ValType]):
    _ts = [val_type(x) for x in ts]
    return a.vec_type(a.val_types(_ts))


def func_type(params, results):
    pvec = vec_type(params)
    rvec = vec_type(results)
    return a.func_type(pvec, rvec)


def limits(l: Limits):
    return (l.min, l.max)


def global_type(t: GlobalType):
    vt = val_type(t.valtype)
    if t.mut is Mutability.const:
        return a.global_type(a.MUT_CONST, vt)
    return a.global_type(a.MUT_VAR, vt)
