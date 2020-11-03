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
    body = a.instrs([instr(i) for i in f.body])

    return a.func(type, locals, body)

##########
# Instrs #
##########

def instr(i):
    B = BinaryOpcode
    if i.opcode == B.BLOCK:
        instrs = a.instrs([instr(x) for x in i.instructions ])
        res = vec_type(i.result_type)
        return a.BLOCK(res, instrs)
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
    # TODO: Implement instructions.
    if i.opcode == B.DROP:
        return a.DROP
    if i.opcode == B.END:
        return a.END
    if i.opcode == B.F32_ABS:
        return a.F32_ABS
    if i.opcode == B.F32_CEIL:
        return a.F32_CEIL
    if i.opcode == B.F32_CONST:
        return a.F32_CONST
    if i.opcode == B.F32_DEMOTE_F64:
        return a.F32_DEMOTE_F64
    if i.opcode == B.F32_FLOOR:
        return a.F32_FLOOR
    if i.opcode == B.F32_LOAD:
        return a.F32_LOAD
    if i.opcode == B.F32_NEAREST:
        return a.F32_NEAREST
    if i.opcode == B.F32_NEG:
        return a.F32_NEG
    if i.opcode == B.F32_SQRT:
        return a.F32_SQRT
    if i.opcode == B.F32_STORE:
        return a.F32_STORE
    if i.opcode == B.F32_TRUNC:
        return a.F32_TRUNC
    if i.opcode == B.F64_ADD:
        return a.F64_ADD
    if i.opcode == B.F64_CONVERT_S_I32:
        return a.F64_CONVERT_S_I32
    if i.opcode == B.F64_CONVERT_U_I32:
        return a.F64_CONVERT_U_I32
    if i.opcode == B.F64_COPYSIGN:
        return a.F64_COPYSIGN
    if i.opcode == B.F64_DIV:
        return a.F64_DIV
    if i.opcode == B.F64_EQ:
        return a.F64_EQ
    if i.opcode == B.F64_GE:
        return a.F64_GE
    if i.opcode == B.F64_GT:
        return a.F64_GT
    if i.opcode == B.F64_LE:
        return a.F64_LE
    if i.opcode == B.F64_LT:
        return a.F64_LT
    if i.opcode == B.F64_MAX:
        return a.F64_MAX
    if i.opcode == B.F64_MIN:
        return a.F64_MIN
    if i.opcode == B.F64_MUL:
        return a.F64_MUL
    if i.opcode == B.F64_NE:
        return a.F64_NE
    if i.opcode == B.F64_PROMOTE_F32:
        return a.F64_PROMOTE_F32
    if i.opcode == B.F64_REINTERPRET_I64:
        return a.F64_REINTERPRET_I64
    if i.opcode == B.F64_SUB:
        return a.F64_SUB
    if i.opcode == B.GET_GLOBAL:
        return a.GET_GLOBAL
    if i.opcode == B.GET_LOCAL:
        return a.GET_LOCAL
    if i.opcode == B.I32_CLZ:
        return a.I32_CLZ
    if i.opcode == B.I32_CONST:
        return a.I32_CONST
    if i.opcode == B.I32_CTZ:
        return a.I32_CTZ
    if i.opcode == B.I32_EQ:
        return a.I32_EQ
    if i.opcode == B.I32_EQZ:
        return a.I32_EQZ
    if i.opcode == B.I32_GE_S:
        return a.I32_GE_S
    if i.opcode == B.I32_GE_U:
        return a.I32_GE_U
    if i.opcode == B.I32_GT_S:
        return a.I32_GT_S
    if i.opcode == B.I32_GT_U:
        return a.I32_GT_U
    if i.opcode == B.I32_LE_S:
        return a.I32_LE_S
    if i.opcode == B.I32_LE_U:
        return a.I32_LE_U
    if i.opcode == B.I32_LOAD:
        return a.I32_LOAD
    if i.opcode == B.I32_LOAD16_S:
        return a.I32_LOAD16_S
    if i.opcode == B.I32_LOAD16_U:
        return a.I32_LOAD16_U
    if i.opcode == B.I32_LOAD8_S:
        return a.I32_LOAD8_S
    if i.opcode == B.I32_LOAD8_U:
        return a.I32_LOAD8_U
    if i.opcode == B.I32_LT_S:
        return a.I32_LT_S
    if i.opcode == B.I32_LT_U:
        return a.I32_LT_U
    if i.opcode == B.I32_NE:
        return a.I32_NE
    if i.opcode == B.I32_POPCNT:
        return a.I32_POPCNT
    if i.opcode == B.I32_REINTERPRET_F32:
        return a.I32_REINTERPRET_F32
    if i.opcode == B.I32_STORE:
        return a.I32_STORE
    if i.opcode == B.I32_STORE16:
        return a.I32_STORE16
    if i.opcode == B.I32_STORE8:
        return a.I32_STORE8
    if i.opcode == B.I32_TRUNC_S_F64:
        return a.I32_TRUNC_S_F64
    if i.opcode == B.I32_WRAP_I64:
        return a.I32_WRAP_I64
    if i.opcode == B.I64_ADD:
        return a.I64_ADD
    if i.opcode == B.I64_AND:
        return a.I64_AND
    if i.opcode == B.I64_DIV_S:
        return a.I64_DIV_S
    if i.opcode == B.I64_DIV_U:
        return a.I64_DIV_U
    if i.opcode == B.I64_EXTEND_S_I32:
        return a.I64_EXTEND_S_I32
    if i.opcode == B.I64_EXTEND_U_I32:
        return a.I64_EXTEND_U_I32
    if i.opcode == B.I64_LOAD32_S:
        return a.I64_LOAD32_S
    if i.opcode == B.I64_LOAD32_U:
        return a.I64_LOAD32_U
    if i.opcode == B.I64_MUL:
        return a.I64_MUL
    if i.opcode == B.I64_OR:
        return a.I64_OR
    if i.opcode == B.I64_REM_S:
        return a.I64_REM_S
    if i.opcode == B.I64_REM_U:
        return a.I64_REM_U
    if i.opcode == B.I64_ROTL:
        return a.I64_ROTL
    if i.opcode == B.I64_ROTR:
        return a.I64_ROTR
    if i.opcode == B.I64_SHL:
        return a.I64_SHL
    if i.opcode == B.I64_SHR_S:
        return a.I64_SHR_S
    if i.opcode == B.I64_SHR_U:
        return a.I64_SHR_U
    if i.opcode == B.I64_STORE32:
        return a.I64_STORE32
    if i.opcode == B.I64_SUB:
        return a.I64_SUB
    if i.opcode == B.I64_TRUNC_U_F32:
        return a.I64_TRUNC_U_F32
    if i.opcode == B.I64_XOR:
        return a.I64_XOR
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
        return a.SET_GLOBAL
    if i.opcode == B.SET_LOCAL:
        return a.SET_LOCAL
    if i.opcode == B.TEE_LOCAL:
        return a.TEE_LOCAL
    if i.opcode == B.UNREACHABLE:
        return a.UNREACHABLE

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
