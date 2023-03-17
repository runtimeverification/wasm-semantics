import operator

from typing import Callable, Dict, Iterable, List, Optional, Tuple, TypeVar

from pyk.kast.inner import (
    KAs,
    KApply,
    KInner,
    KLabel,
    KRewrite,
    KSequence,
    KSort,
    KToken,
    KVariable,
    top_down,
    )

V = TypeVar('V')

def replaceChild(term:KInner, parent_name:str, replacement:KInner) -> KInner:
    def replaceChildCallback(term:KInner) -> KInner:
        if not isinstance(term, KApply):
            return term
        if not term.label.name == parent_name:
            return term
        assert term.arity == 1, term
        return term.let(args=[replacement])

    return top_down(replaceChildCallback, term)


def getInner(term:KInner, idx:int, label:Optional[str]) -> KInner:
  assert isinstance(term, KApply), term
  assert idx < term.arity, [term, idx]
  retv = term.args[idx]
  if label is not None:
    assert isinstance(retv, KApply), retv
    assert retv.label.name == label, [retv.label.name, label]
  return retv

def getInnerPath(term:KInner, path:Iterable[Tuple[int, Optional[str]]]) -> KInner:
    for (ids, label) in path:
        term = getInner(term, ids, label)
    return term

def loadToken(term:KInner) -> str:
    assert isinstance(term, KToken), term
    return term.token

def loadTokenFromChild(term:KInner) -> str:
    assert isinstance(term, KApply), term
    assert len(term.args) == 1, term
    return loadToken(term.args[0])

def loadMap(term:KInner, value_loader:Callable[[KInner], V], loaded: Dict[str, V]) -> None:
    assert isinstance(term, KApply), term
    if term.label.name == '_Map_':
        assert term.arity == 2, term
        loadMap(term.args[0], value_loader, loaded)
        loadMap(term.args[1], value_loader, loaded)
    elif term.label.name == '_|->_':
        assert term.arity == 2, term
        key = loadToken(term.args[0])
        value = value_loader(term.args[1])
        assert not key in loaded, [term, loaded, key]
        loaded[key] = value
    else:
        assert False, term

def loadMapFromChild(term:KInner, value_loader:Callable[[KInner], V]) -> Dict[str, V]:
    assert isinstance(term, KApply), term
    assert len(term.args) == 1, term
    kdict = term.args[0]
    retv:Dict[str, V] = {}
    loadMap(kdict, value_loader, retv)
    return retv

def getChildren(item:KInner) -> Iterable[KInner]:
    if isinstance(item, KApply):
        return item.args
    if isinstance(item, KSort):
        return []
    if isinstance(item, KToken):
        return []
    if isinstance(item, KVariable):
        return []
    if isinstance(item, KLabel):
        return []
    if isinstance(item, KAs):
        return [item.pattern, item.alias]
    if isinstance(item, KRewrite):
        return [item.lhs, item.rhs]
    if isinstance(item, KSequence):
        return item.items
    assert False, [item, type(item)]

def kinner_top_down_fold(
    summarizer:Callable[[KInner], Optional[V]],
    merger:Callable[[V, V], V],
    default:V,
    to_fold:KInner
) -> V:
    summary = summarizer(to_fold)
    if summary is not None:
        return summary
    children = getChildren(to_fold)
    summaries = map(
        lambda x: kinner_top_down_fold(summarizer, merger, default, x),
        children
    )
    return fold(merger, summaries, default)

def extractRewriteParents(term:KInner) -> List[KInner]:
    def maybe_with_rewrite_child(value:KInner) -> Optional[List[KInner]]:
        children = getChildren(value)
        if fold(operator.or_, map(lambda x:isinstance(x, KRewrite), children), False):
            return [value]
        return None
    return kinner_top_down_fold(maybe_with_rewrite_child, operator.add, [], term)

def fold(folder:Callable[[V, V], V], to_fold:Iterable[V], initial:V) -> V:
    result = initial
    for item in reversed(list(to_fold)):
        result = folder(item, result)
    return result
