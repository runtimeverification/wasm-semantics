#!/usr/bin/env python3

import sys
import json
import kwasm_ast as a

from wasm.parsers.module import parse_module, Module
from wasm.datatypes import ValType, FunctionType, Function
from wasm.opcodes import BinaryOpcode

def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1], 'rb')
    module = wasm2kast(infile)
    infile.close()
    return module

def wasm2kast(wasm_bytes : bytes) -> dict:
    """Returns a dictionary representing the Kast JSON."""
    ast = parse_module(wasm_bytes)
    return ast2kast(ast)

def ast2kast(wasm_ast : Module) -> dict:
    """Returns a dictionary representing the Kast JSON."""
    types = a.defns([type(x) for x in wasm_ast.types])
    funcs = a.defns([func(x) for x in wasm_ast.funcs])
    return a.module(types=types, funcs=funcs)

#########
# Defns #
#########

def type(t : FunctionType):
    return a.type(func_type(t.params, t.results))

def func(f : Function):
    type = a.KInt(f.type_idx)
    ls_list = [val_type(x) for x in f.locals]
    locals = a.vec_type(a.val_types(ls_list))
    body = instrs(f.body)
    return a.func(type, locals, body)

##########
# Instrs #
##########

def instrs(iis):
    return a.instrs([instr(i) for i in iis if not i.opcode == BinaryOpcode.END])

def instr(i):
    B = BinaryOpcode
    if i.opcode == B.BLOCK:
        iis = instrs(i.instructions)
        res = vec_type(i.result_type)
        return a.BLOCK(res, iis)
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
    if i.opcode == B.END:
        raise(ValueError("End opcode: should have been filtered out."))
    if i.opcode == B.F32_CONST:
        return a.F32_CONST(i.value)
    if i.opcode == B.F64_CONST:
        return a.F64_CONST(i.value)
    if i.opcode == B.F32_DEMOTE_F64:
        return a.F32_DEMOTE_F64
    if i.opcode == B.F64_CONVERT_S_I32:
        return a.F64_CONVERT_S_I32
    if i.opcode == B.F64_CONVERT_U_I32:
        return a.F64_CONVERT_U_I32
    if i.opcode == B.F64_PROMOTE_F32:
        return a.F64_PROMOTE_F32
    if i.opcode == B.F64_REINTERPRET_I64:
        raise(ValueError('Reinterpret instructions not implemented.'))
    if i.opcode == B.GET_GLOBAL:
        return a.GET_GLOBAL(i.global_idx)
    if i.opcode == B.GET_LOCAL:
        return a.GET_LOCAL
    if i.opcode == B.I32_CONST:
        return a.I32_CONST(i.value)
    if i.opcode == B.I64_CONST:
        return a.I64_CONST(i.value)
    if i.opcode == B.I32_REINTERPRET_F32:
        raise(ValueError('Reinterpret instructions not implemented.'))
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
    if i.opcode == B.I32_TRUNC_S_F64:
        return a.I32_TRUNC_S_F64
    if i.opcode == B.I32_WRAP_I64:
        return a.I32_WRAP_I64
    if i.opcode == B.I64_EXTEND_S_I32:
        return a.I64_EXTEND_S_I32
    if i.opcode == B.I64_EXTEND_U_I32:
        return a.I64_EXTEND_U_I32
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
    if i.opcode == B.I64_TRUNC_U_F32:
        return a.I64_TRUNC_U_F32
    if i.opcode == B.IF:
        return a.IF
    if i.opcode == B.LOOP:
        return a.LOOP
    if i.opcode == B.MEMORY_GROW:
        return a.MEMORY_GROW
    if i.opcode == B.MEMORY_SIZE:
        return a.MEMORY_SIZE
    if i.opcode == B.NOP:
        return a.NOP
    if i.opcode == B.RETURN:
        return a.RETURN
    if i.opcode == B.SELECT:
        return a.SELECT
    if i.opcode == B.SET_GLOBAL:
        return a.SET_GLOBAL(i.global_idx)
    if i.opcode == B.SET_LOCAL:
        return a.SET_LOCAL
    if i.opcode == B.TEE_LOCAL:
        return a.TEE_LOCAL
    if i.opcode == B.UNREACHABLE:
        return a.UNREACHABLE
    # Catch all.
    op = i.opcode
    return eval('a.' + i.opcode.name)

########
# Data #
########

def val_type(t : ValType):
    if t == ValType.i32:
        return a.i32
    if t == ValType.i64:
        return a.i64
    if t == ValType.f32:
        return a.f32
    if t == ValType.f64:
        return a.f64

def vec_type(ts : [ValType]):
    _ts = [val_type(x) for x in ts]
    return a.vec_type(a.val_types(_ts))


def func_type(params, results):
    pvec = vec_type(params)
    rvec = vec_type(results)
    return a.func_type(pvec, rvec)

########
# Main #
########

if __name__ == "__main__":
    main()
