from pyk.kast import KSequence, KConstant, KApply, KToken

MODULE = 'aModuleDecl'
EMPTY_DEFNS = '.List{\"listStmt\"}_EmptyStmts'
MODULE_METADATA = 'moduleMeta'
EMPTY_ID = '.Identifier'
EMPTY_MAP = '.Map'

def empty_defns():
    """Empty list of definitions."""
    return KApply(EMPTY_DEFNS, [])

def empty_module_metadata():
    """No metadata."""
    return KApply(MODULE_METADATA, [KApply(EMPTY_ID, []), KApply(EMPTY_MAP, [])])

def module(types=None,
           funcs=None,
           tables=None,
           mems=None,
           globs=None,
           elem=None,
           data=None,
           start=None,
           imports=None,
           exports=None,
           metadata=None):
    """Construct a Kast of a module."""
    return KApply(MODULE, [empty_defns()] * 10 + [empty_module_metadata()])
