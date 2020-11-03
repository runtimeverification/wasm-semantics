#!/usr/bin/env python3

import sys
import json
import kwasm_ast as a

from wasm.parsers.module import parse_module, Module
from wasm.datatypes import ValType, FunctionType, Function

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
    body = a.instrs([]) # TODO: Implement instructions.
    return a.func(type, locals, body)

########
# Data #
########

def val_type(t):
    if t == ValType.i32:
        return a.i32
    if t == ValType.i64:
        return a.i64
    if t == ValType.f32:
        return a.f32
    if t == ValType.f64:
        return a.f64

def func_type(params, results):
    ps_list = [val_type(p) for p in params]
    rs_list = [val_type(r) for r in results]
    pvec = a.vec_type(a.val_types(ps_list))
    rvec = a.vec_type(a.val_types(rs_list))
    return a.func_type(pvec, rvec)

########
# Main #
########

if __name__ == "__main__":
    main()
