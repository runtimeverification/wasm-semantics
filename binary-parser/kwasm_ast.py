import pyk

from pyk.kast import KSequence, KConstant, KApply, KToken

MODULE = 'aModuleDecl'
EMPTY_DEFNS = '.List{\"listStmt\"}_EmptyStmts'
MODULE_METADATA = 'moduleMeta'
EMPTY_ID = '.Identifier'
EMPTY_MAP = '.Map'


def module(types=None, funcs=None, tables=None, mems=None, globs=None, elem=None, data=None, start=None, imports=None, exports=None, metadata=None):
    return KApply(MODULE, [KApply(EMPTY_DEFNS, [])] * 10 + [KApply(MODULE_METADATA, [KApply(EMPTY_ID, []), KApply(EMPTY_MAP, [])])])
