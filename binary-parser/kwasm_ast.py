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
INTS = 'listInt'
INTS_NIL = '.List{\"listInt\"}_Ints'

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

def ints(iis : [int]):
    kis = [KInt(x) for x in iis]
    return KNamedList(INTS, INTS_NIL, kis)

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

##########
# Instrs #
##########

NOP = KApply('aNop', [])

def BLOCK(vec_type, instrs):
    return KApply('aBlock', [vec_type, instrs])

def BR(idx : int):
    return KApply('aBr', [KInt(idx)])

def BR_IF(idx : int):
    return KApply('aBr_if', [KInt(idx)])

def BR_TABLE(idxs : [int], default):
    return KApply('aBr_table', [ints(idxs + (default,))])

def CALL(function_idx : int):
    return KApply('aCall', [KInt(function_idx)])

def CALL_INDIRECT(type_idx : int):
    return KApply('aCall_indirect', [KInt(type_idx)])

  ##############
  # Float Unop #
  ##############
F32_ABS  = KApply('aFUnOp', [f32, KApply('aAbs', [])])
F32_CEIL = KApply('aFUnOp', [f32, KApply('aCeil', [])])
F32_FLOOR = KApply('aFUnOp', [f32, KApply('aFloor', [])])
F32_NEAREST = KApply('aFUnOp', [f32, KApply('aNearest', [])])
F32_NEG = KApply('aFUnOp', [f32, KApply('aNeg', [])])
F32_SQRT = KApply('aFUnOp', [f32, KApply('aSqrt', [])])
F32_TRUNC = KApply('aFUnOp', [f32, KApply('aTrunc', [])])
F64_ABS  = KApply('aFUnOp', [f64, KApply('aAbs', [])])
F64_CEIL = KApply('aFUnOp', [f64, KApply('aCeil', [])])
F64_FLOOR = KApply('aFUnOp', [f64, KApply('aFloor', [])])
F64_NEAREST = KApply('aFUnOp', [f64, KApply('aNearest', [])])
F64_NEG = KApply('aFUnOp', [f64, KApply('aNeg', [])])
F64_SQRT = KApply('aFUnOp', [f64, KApply('aSqrt', [])])
F64_TRUNC = KApply('aFUnOp', [f64, KApply('aTrunc', [])])

DROP = KApply('aDrop', [])
F32_CONST = NOP
F32_DEMOTE_F64 = NOP
F32_LOAD = NOP

F32_STORE = NOP
F64_ADD = NOP
F64_CONVERT_S_I32 = NOP
F64_CONVERT_U_I32 = NOP
F64_COPYSIGN = NOP
F64_DIV = NOP
F64_EQ = NOP
F64_GE = NOP
F64_GT = NOP
F64_LE = NOP
F64_LT = NOP
F64_MAX = NOP
F64_MIN = NOP
F64_MUL = NOP
F64_NE = NOP
F64_PROMOTE_F32 = NOP
F64_REINTERPRET_I64 = NOP
F64_SUB = NOP
GET_GLOBAL = NOP
GET_LOCAL = NOP
I32_CLZ = NOP
I32_CONST = NOP
I32_CTZ = NOP
I32_EQ = NOP
I32_EQZ = NOP
I32_GE_S = NOP
I32_GE_U = NOP
I32_GT_S = NOP
I32_GT_U = NOP
I32_LE_S = NOP
I32_LE_U = NOP
I32_LOAD = NOP
I32_LOAD16_S = NOP
I32_LOAD16_U = NOP
I32_LOAD8_S = NOP
I32_LOAD8_U = NOP
I32_LT_S = NOP
I32_LT_U = NOP
I32_NE = NOP
I32_POPCNT = NOP
I32_REINTERPRET_F32  = NOP
I32_STORE = NOP
I32_STORE16 = NOP
I32_STORE8 = NOP
I32_TRUNC_S_F64 = NOP
I32_WRAP_I64 = NOP
I64_ADD = NOP
I64_AND = NOP
I64_DIV_S = NOP
I64_DIV_U = NOP
I64_EXTEND_S_I32 = NOP
I64_EXTEND_U_I32 = NOP
I64_LOAD32_S = NOP
I64_LOAD32_U = NOP
I64_MUL = NOP
I64_OR = NOP
I64_REM_S = NOP
I64_REM_U = NOP
I64_ROTL = NOP
I64_ROTR = NOP
I64_SHL = NOP
I64_SHR_S = NOP
I64_SHR_U = NOP
I64_STORE32 = NOP
I64_SUB = NOP
I64_TRUNC_U_F32 = NOP
I64_XOR = NOP
IF = NOP
LOOP = NOP
MEMORY_GROW = NOP
MEMORY_SIZE = NOP
RETURN = NOP
SELECT = NOP
SET_GLOBAL = NOP
SET_LOCAL = NOP
TEE_LOCAL = NOP
UNREACHABLE = NOP

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
