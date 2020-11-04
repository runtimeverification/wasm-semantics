#!/usr/bin/env python3

from pyk.kast import KSequence, KConstant, KApply, KToken



###########
# KLabels #
###########

MODULE = 'aModuleDecl'
MODULE_METADATA = 'moduleMeta'
TYPE = 'aTypeDefn'
FUNC_TYPE = 'aFuncType'
VEC_TYPE = 'aVecType'
VAL_TYPES = 'listValTypes'
VAL_TYPES_NIL = '.List{\"listValTypes\"}_ValTypes'
I32 = 'i32'
I64 = 'i32'

FUNC = 'aFuncDefn'
FUNC_METADATA = 'funcMeta'

DEFNS  = '___WASM-COMMON-SYNTAX_Defns_Defn_Defns'
INSTRS = '___WASM-COMMON-SYNTAX_Instrs_Instr_Instrs'

EMPTY_STMTS = '.List{\"listStmt\"}_EmptyStmts'
EMPTY_ID = '.Identifier'
EMPTY_MAP = '.Map'

###################
# Basic Datatypes #
###################

def KInt(value : int):
    return KToken(str(value), 'Int')

#########
# Lists #
#########

def KNamedList(klabel, empty_klabel, items):
    tail = KApply(empty_klabel, [])
    while not items == []:
        last = items.pop()
        tail = KApply(klabel, [last, tail])
    return tail

def defns(items):
    return KNamedList(DEFNS, EMPTY_STMTS, items)

def instrs(items):
    return KNamedList(INSTRS, EMPTY_STMTS, items)

def val_types(items):
    return KNamedList(VAL_TYPES, VAL_TYPES_NIL, items)

###########
# Empties #
###########

EMPTY_ID = KApply(EMPTY_ID, [])

EMPTY_DEFNS = KApply(EMPTY_STMTS, [])

EMPTY_MODULE_METADATA = KApply(MODULE_METADATA, [EMPTY_ID, KApply(EMPTY_MAP, [])])

EMPTY_FUNC_METADATA = KApply(FUNC_METADATA, [EMPTY_ID, KApply(EMPTY_MAP, [])])

############
# ValTypes #
############

i32 = KApply('i32', [])
i64 = KApply('i64', [])
f32 = KApply('f32', [])
f64 = KApply('f64', [])

def vec_type(valtypes):
    return KApply(VEC_TYPE, [valtypes])

def func_type(params, results):
    return KApply(FUNC_TYPE, [params, results])

################
# Declarations #
################

def type(func_type, metadata=EMPTY_ID):
    return KApply(TYPE, [func_type, metadata])

def func(type, locals, body, metadata=EMPTY_FUNC_METADATA):
    return KApply(FUNC, [type, locals, body, metadata])

def module(types=EMPTY_DEFNS,
           funcs=EMPTY_DEFNS,
           tables=EMPTY_DEFNS,
           mems=EMPTY_DEFNS,
           globs=EMPTY_DEFNS,
           elem=EMPTY_DEFNS,
           data=EMPTY_DEFNS,
           start=EMPTY_DEFNS,
           imports=EMPTY_DEFNS,
           exports=EMPTY_DEFNS,
           metadata=EMPTY_MODULE_METADATA):
    """Construct a Kast of a module."""
    return KApply(MODULE,
                  [types,
                   funcs,
                   tables,
                   mems,
                   globs,
                   elem,
                   data,
                   start,
                   imports,
                   exports,
                   metadata])
