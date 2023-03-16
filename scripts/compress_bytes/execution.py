from dataclasses import dataclass

from pyk.kast.inner import (
    KInner,
    KApply,
    KToken,
    KSequence,
    KVariable,
    )
from pyk.kcfg import KCFG
from pyk.prelude.k import K

from .functions import Functions
from .kast import (getInnerPath,
                   )

class Decision:
    pass

class Continue(Decision):
    pass

class Finish(Decision):
    pass

class Loop(Decision):
    pass

@dataclass(frozen=True)
class UnimplementedElrondFunction(Decision):
    function_id: int
    function_name: str

@dataclass(frozen=True)
class UnsummarizedFunction(Decision):
    function_id: int
    function_name: str

IMPLEMENTED_ELROND_FUNCTIONS = [
    2,  # smallIntGetUnsignedArgument
    3,  # getNumArguments
    4,  # signalError
    6,  # checkNoPayment
]

class ExecutionManager:
    def __init__(self, functions:Functions) -> None:
        self.__already_summarized = set()
        self.__functions = functions
        pass

    def decideConfiguration(self, kcfg:KCFG, node_id:str) -> Decision:
        node = kcfg.node(node_id)
        instrs = getInstrsChild(node.cterm.config)

        if isinstance(instrs, KVariable):
            assert instrs.name == 'MyOtherInstructions', instrs
            assert instrs.sort == K, instrs
            return Finish()

        assert isinstance(instrs, KSequence)
        assert instrs.items, instrs

        first = getFirstInstruction(instrs)
        if first.label.name == 'aCall':
            return self.__handleCall(first)
        if first.label.name == 'elrondReverted':
            return Finish()
        if first.label.name == 'aLoop':
                return Loop()
        return Continue()

    def __handleCall(self, call:KApply) -> Decision:
        assert call.label.name == 'aCall'
        assert call.arity == 1
        value = call.args[0]
        assert isinstance(value, KToken), value
        id = int(value.token)
        if self.__isElrondFunction(id):
            if id in IMPLEMENTED_ELROND_FUNCTIONS:
                return Continue()
            return UnimplementedElrondFunction(id, self.__functionName(id))
        if id in self.__already_summarized:
            return Continue()
        return UnsummarizedFunction(id, self.__functionName(id))

    def __functionName(self, id:int) -> str:
        return self.__functions.addrToFunction(str(id)).name()

    def __isElrondFunction(self, id:int) -> bool:
        return self.__functions.addrToFunction(str(id)).is_builtin()

def getInstrsChild(term:KInner) -> KInner:
    instrs = getInnerPath(term, [(0, '<wasm-test>'), (1, '<wasm>'), (0, '<instrs>')])
    assert instrs.arity == 1, instrs
    return instrs.args[0]

def getFirstInstruction(instrs:KSequence) -> KApply:
    assert instrs.items
    first = instrs.items[0]
    assert isinstance(first, KApply), first
    return first

