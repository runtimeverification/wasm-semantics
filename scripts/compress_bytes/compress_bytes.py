#!/usr/bin/env python3

import logging
import sys

from contextlib import closing
import json
from socket import AF_INET, SO_REUSEADDR, SOCK_STREAM, SOL_SOCKET, socket
import tempfile
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from pyk.cterm import CTerm
# from pyk.kast import kast_term
from pyk.kast.inner import KInner, KApply, KToken, KLabel, KRewrite, KSort, KVariable, bottom_up
from pyk.kast.outer import KClaim
from pyk.kcfg import KCFG, KCFGExplore
from pyk.ktool.kprove import KProve
from pyk.ktool.krun import _krun, KRunOutput
from pyk.prelude.kbool import TRUE, andBool
from pyk.prelude.kint import INT, intToken, leInt, ltInt

from .kast import (replaceChild,
                   getInner,
                   getInnerPath,
                   loadTokenFromChild,
                   loadMapFromChild,
                   loadToken)

sys.setrecursionlimit(2000)

ROOT = Path('/mnt/data/runtime-verification/tmp/wasm-semantics')
DEFINITION_DIR = ROOT / '.build/defn/haskell/test-kompiled'

def filterBytes(term: KToken) -> KToken:
    assert term.sort.name == 'Bytes'
    bytes = term.token
    assert bytes.startswith('b"')
    assert bytes.endswith('"')

    bytes = bytes[2:-1]

    zeros = []
    start = bytes.find('\x00', 0)
    if start < 0:
        return term
    while start >= 0:
        idx = start + 1
        while bytes[idx] == '\x00':
            idx += 1
        zeros.append((start, idx))
        start = bytes.find('\x00', idx)
    zeros = [(start, end) for (start, end) in zeros if end - start > 100]
    if not zeros:
        return term

    keep = []
    last_end = 0
    for (start, end) in zeros:
        if start > last_end:
            keep.append((last_end, start))
        last_end = end
    if last_end < len(bytes):
        keep.append((last_end, len(bytes)))

    term = KApply(KLabel('.Bytes_BYTES-HOOKED_Bytes', []), ())
    for (start, end) in keep:
        term = KApply (KLabel('#setBytesRange(_,_,_)_WASM-DATA_Bytes_Bytes_Int_Bytes', []),
                        ( term
                        , KToken(str(start), INT)
                        , KToken(f'b"{bytes[start:end]}"', KSort('Bytes'))
                        )
                      )
    return term

def filterBytesCallback(term: KInner) -> KInner:
    if isinstance(term, KToken):
        if term.sort.name == 'Bytes':
            return filterBytes(term)
    return term

def krun(input_file: Path, output_file:Path) -> CTerm:
    print('Run')
    result = _krun(
        input_file=input_file,
        definition_dir=DEFINITION_DIR,
        output=KRunOutput.JSON
    )
    output_file.write_text(result.stdout)

def loadJsonKrun(input_file:Path):
    print('Load json')
    value = input_file.read_text()
    # result_kast = kast_term(json.loads(result.stdout), KInner)
    result_kast = KInner.from_dict(json.loads(value)['term'])
    return result_kast

def loadJson(input_file:Path):
    print('Load json')
    value = input_file.read_text()
    # result_kast = kast_term(json.loads(result.stdout), KInner)
    result_kast = KInner.from_dict(json.loads(value))
    return result_kast

def replaceBytes(term: KInner):
    term = bottom_up(filterBytesCallback, term)
    return term

class ValType:
    def __init__(self, ktype:int) -> None:
        self.__type = ktype

    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        if self == ValType.I32:
            return 'ValType.I32'
        if self == ValType.I64:
            return 'ValType.I64'
        if self == ValType.F32:
            return 'ValType.F32'
        if self == ValType.F64:
            return 'ValType.F64'

class ValType:
    (I32, I64, F32, F64) = (ValType(i) for i in range(0, 4))

class VecType:
    def __init__(self, types:List[ValType]) -> None:
        self.__types = types

    def types(self) -> List[ValType]:
        return self.__types

    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        return f'VecType(types={repr(self.__types)})'

class FuncType:
    def __init__(self, arg_types: VecType, result_types: VecType) -> None:
        self.__arg_types = arg_types
        self.__result_types = result_types

    def argumentTypesList(self) -> List[ValType]:
        return self.__arg_types.types()

    def __str__(self) -> str:
        return repr(self)
    
    def __repr__(self) -> str:
        return f'FuncType(arg_types={repr(self.__arg_types)}, result_types={repr(self.__result_types)})'

class WasmFunction:
    def __init__(self, name:str, ftype:FuncType, is_builtin:bool, has_instructions:bool, address:str) -> None:
        self.__name = name
        self.__type = ftype
        self.__is_builtin = is_builtin
        self.__has_instructions = has_instructions
        self.__address = address

    def argumentTypesList(self):
        return self.__type.argumentTypesList()
    
    def address(self):
        return self.__address

    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        return f'WasmFunction(name={repr(self.__name)}, ftype={repr(self.__type)}, is_builtin={repr(self.__is_builtin)}, has_instructions={self.__has_instructions}, address={repr(self.__address)})'

def getFirstInstruction(term:KInner) -> Optional[KInner]:
    assert isinstance(term, KApply), term
    assert term.label.name == '<fCode>', term
    assert term.arity == 1
    term = term.args[0]
    while True:
        if not isinstance(term, KApply):
            return term
        if term.label.name == '.List{"listStmt"}_EmptyStmts':
            return None
        if not term.label.name == '___WASM-COMMON-SYNTAX_Instrs_Instr_Instrs':
            return term
        term = term.args[0]

def isElrondTrap(term:KInner) -> bool:
    if not isinstance(term, KApply):
        return False
    return term.label.name == 'elrond_trap'

def loadValType(term:KInner) -> List[ValType]:
    assert isinstance(term, KApply), term
    if term.label.name == 'i32':
        assert term.arity == 0, term
        return ValType.I32
    if term.label.name == 'i64':
        assert term.arity == 0, term
        return ValType.I64
    if term.label.name == 'f32':
        assert term.arity == 0, term
        return ValType.F32
    if term.label.name == 'f64':
        assert term.arity == 0, term
        return ValType.F64
    assert False, term

def loadVecType(term:KInner) -> VecType:
    assert isinstance(term, KApply), term
    assert term.label.name == 'aVecType', term
    assert term.arity == 1, term
    term = term.args[0]

    types = []
    while True:
        assert isinstance(term, KApply), term
        if term.label.name == '.List{"listValTypes"}_ValTypes':
            assert term.arity == 0, term
            return VecType(types)
        if term.label.name == 'listValTypes':
            assert term.arity == 2, term
            types.append(loadValType(term.args[0]))
            term = term.args[1]
        else:
            assert False, term

def loadFunctionType(term:KInner) -> FuncType:
    assert isinstance(term, KApply)
    assert term.label.name == 'aFuncType', term
    assert term.arity == 2, term
    arg_types = loadVecType(term.args[0])
    result_types = loadVecType(term.args[1])
    return FuncType(arg_types, result_types)


def loadFunctionTypeFromChild(term:KInner) -> FuncType:
    assert isinstance(term, KApply), term
    assert term.arity == 1
    return loadFunctionType(term.args[0])

def loadFunction(kfunc_def:KApply, loaded: Dict[str, WasmFunction]) -> None:
    assert kfunc_def.label.name == '<funcDef>', kfunc_def

    kfaddr = getInner(kfunc_def, 0, '<fAddr>')
    assert kfaddr is not None
    addr = loadTokenFromChild(kfaddr)

    kfcode = getInner(kfunc_def, 1, '<fCode>')
    kFirstInstruction = getFirstInstruction(kfcode)
    if kFirstInstruction is not None:
        is_elrond_trap = isElrondTrap(kFirstInstruction)
        has_instructions = True
    else:
        is_elrond_trap = False
        has_instructions = False

    kftype = getInner(kfunc_def, 2, '<fType>')
    function_type = loadFunctionTypeFromChild(kftype)

    kfunc_id = getInnerPath(kfunc_def, [(5, '<funcMetadata>'), (0, '<funcId>')])
    function_name = loadTokenFromChild(kfunc_id)

    f = WasmFunction(
        name = function_name,
        ftype = function_type,
        is_builtin = is_elrond_trap,
        has_instructions=has_instructions,
        address = addr
    )
    loaded[addr] = f

def functionMapToList(term:KInner, functions:List[KInner]) -> None:
    assert isinstance(term, KApply)
    if term.label.name == '_FuncDefCellMap_':
        assert term.arity == 2, term
        functionMapToList(term.args[0], functions)
        functionMapToList(term.args[1], functions)
    elif term.label.name == 'FuncDefCellMapItem':
        assert term.arity == 2, term
        func = term.args[1]
        assert isinstance(func, KApply), func
        assert func.label.name == '<funcDef>', func
        functions.append(func)
    else:
        assert False, [term, term.label.name]

def loadFunctionsFromStore(term:KInner) -> Dict[str, WasmFunction]:
    assert isinstance(term, KApply), term
    assert term.label.name == '<funcs>', term
    assert term.arity == 1
    funcs = []
    functionMapToList(term.args[0], funcs)
    func_addr_to_def = {}
    for kfunc_def in funcs:
        assert isinstance(kfunc_def, KApply), kfunc_def
        assert kfunc_def.label.name == '<funcDef>', kfunc_def

        loadFunction(kfunc_def, func_addr_to_def)
    return func_addr_to_def

class Functions:
    def __init__(self,
                 name_to_id:dict[str, str],
                 id_to_addr:dict[str, str],
                 id_to_type:dict[str, FuncType],
                 addr_to_def:dict[str, WasmFunction]):
        self.__name_to_id = name_to_id
        self.__id_to_addr = id_to_addr
        self.__id_to_type = id_to_type
        self.__addr_to_def = addr_to_def

    def addrToFunction(self, addr:str) -> WasmFunction:
        return self.__addr_to_def[addr]

    def __str__(self):
        return repr(self)
    
    def __repr__(self):
        return f'Functions(name_to_id={repr(self.__name_to_id)}, id_to_addr={repr(self.__id_to_addr)}, id_to_type={repr(self.__id_to_type)}, addr_to_def={repr(self.__addr_to_def)})'

def findFunctions(term:KInner) -> Functions:
    kwasm = getInnerPath(term, [(0, '<wasm-test>'), (1, '<wasm>')])
    assert kwasm is not None, [term.args[0].label.name, term.args[0].args[1].label.name]
    kmodule_instances = getInner(kwasm, 5, '<moduleInstances>')
    assert isinstance(kmodule_instances, KApply), kmodule_instances
    assert len(kmodule_instances.args) == 1, kmodule_instances
    kmodule_instance = getInnerPath(kmodule_instances, [(0, 'ModuleInstCellMapItem'), (1, '<moduleInst>')])
    ktypes = getInner(kmodule_instance, 2, '<types>')
    kfunc_addrs = getInner(kmodule_instance, 4, '<funcAddrs>')
    kfunc_ids = getInnerPath(kmodule_instance, [(13, '<moduleMetadata>'), (2, '<funcIds>')])
    kfuncs = getInnerPath(kwasm, [(7, '<mainStore>'), (0, '<funcs>')])

    func_name_to_id = loadMapFromChild(kfunc_ids, loadToken)
    func_id_to_addr = loadMapFromChild(kfunc_addrs, loadToken)
    func_id_to_type = loadMapFromChild(ktypes, loadFunctionType)  # TODO: Probably not needed.
    func_addr_to_def = loadFunctionsFromStore(kfuncs)
    return Functions(
        name_to_id=func_name_to_id,
        id_to_addr=func_id_to_addr,
        id_to_type=func_id_to_type,
        addr_to_def=func_addr_to_def
    )

def makeApply(label:str, args: List[KInner]) -> KApply:
    return KApply(KLabel(label, []), args)

# TODO: Replace with intToken.
def makeIntToken(value:str) -> KToken:
    return KToken(value, INT)

def makeACall(address: str) -> KApply:
    return makeApply('aCall', [makeIntToken(address)])

def makeType(vtype:ValType) -> KApply:
    if vtype == ValType.I32:
        return KApply('i32')
    if vtype == ValType.I64:
        return KApply('i64')
    if vtype == ValType.F32:
        return KApply('f32')
    if vtype == ValType.F64:
        return KApply('f64')
    assert False, vtype

def makePush(value:KInner, vtype:ValType) -> KApply:
    if vtype == ValType.I32 or vtype == ValType.I64:
        return makeApply('aIConst', [makeType(vtype), value])
    if vtype == ValType.F32 or vtype == ValType.F64:
        return makeApply('aFConst', [makeType(vtype), value])

def makeStatementList(statements:List[KInner]) -> KApply:
    retv = makeApply('.List{"listStmt"}_EmptyStmts', [])
    for statement in reversed(statements):
        retv = makeApply('___WASM-COMMON-SYNTAX_Instrs_Instr_Instrs', [statement, retv])
    return retv

def makeSort(t:ValType):
    if t == ValType.I32 or t == ValType.I64:
        return KSort('Int')
    if t == ValType.F32 or t == ValType.F64:
        return KSort('Float')

def makeVariable(name:str, t:ValType) -> KVariable:
    return KVariable(name=name, sort=makeSort(t))

def makeVariables(types: List[ValType]) -> List[KVariable]:
    retv = []
    for idx in range(0, len(types)):
        retv.append(makeVariable(f'MyArg{idx}', types[idx]))
    return retv

def makeTypeConstraint(var:KInner, vType:ValType) -> KApply:
    if vType == ValType.I32:
        return andBool([leInt(intToken(0), var), ltInt(var, intToken(2 ** 32))])
    if vType == ValType.I64:
        return andBool([leInt(intToken(0), var), ltInt(var, intToken(2 ** 64))])
    assert False, vType

def makeBalancedAndBool(constraints: List[KInner]) -> KInner:
    return andBool(constraints)
    # if not constraints:
    #     return TRUE
    # while len(constraints) > 1:
    #     new_constraints = []
    #     idx = 0
    #     while idx + 1 < len(constraints):
    #         new_constraints.append(andBool(constraints[idx], constraints[idx + 1]))
    #         idx += 2
    #     if idx < len(constraints):
    #         new_constraints.append(constraints)[idx]
    #     constraints = new_constraints
    # return constraints[0]

def generateSymbolicFunctionCall(function:WasmFunction) -> Tuple[KApply, KApply]:
    # TODO: Replace this with a stack properly initialized, because in
    # real usage the arguments may be pushed at other times, too, not only
    # before the call.
    # TODO: Add type constraints
    argument_types_list = function.argumentTypesList()
    variables = makeVariables(argument_types_list)
    assert len(variables) == len(argument_types_list)
    statements = [makePush(var, vtype) for var, vtype in zip(variables, argument_types_list)]
    # statements.reverse()
    statements.append(makeACall(function.address()))
    call = makeStatementList(statements)
    constraint_list = [makeTypeConstraint(var, vtype) for var, vtype in zip(variables, argument_types_list)]
    constraint = makeBalancedAndBool(constraint_list)
    return (call, constraint)

def makeRewrite(lhs:KInner, rhs:KInner):
    def makeRewriteIfNeeded(left, right):
        if left == right:
            return left
        return KRewrite(left, right)
    assert isinstance(lhs, KApply)
    assert isinstance(rhs, KApply)
    assert lhs.arity == rhs.arity, [lhs.arity, lhs.label, rhs.arity, rhs.label]
    assert lhs.label == rhs.label
    return lhs.let(args=[makeRewriteIfNeeded(l, r) for (l, r) in zip(lhs.args, rhs.args)])

def makeClaim(term:KInner, address:str, functions:Functions) -> KClaim:
    function = functions.addrToFunction(address)
    (call, constraint) = generateSymbolicFunctionCall(function)
    lhs = replaceChild(term, '<instrs>', call)
    writeJson(makeRewrite(lhs, term), ROOT / 'tmp' / 'rewrite.json')
    return KClaim(body=makeRewrite(lhs, term), requires=constraint)

def makeKProve(temp_dir: tempfile.TemporaryDirectory):
    return KProve(
        DEFINITION_DIR,
        use_directory=Path(temp_dir.name),
        bug_report=None
        # bug_report=BugReport(Path('bug_report'))
    )

def makeExplorer(kprove:KProve):
    return KCFGExplore(
        kprove,
        free_port_on_host(),
        bug_report=kprove._bug_report
    )

# Based on: https://stackoverflow.com/a/45690594
# TODO: has an obvious race condition, replace with something better.
def free_port_on_host(host: str = 'localhost') -> int:
    with closing(socket(AF_INET, SOCK_STREAM)) as sock:
        sock.bind((host, 0))
        sock.setsockopt(SOL_SOCKET, SO_REUSEADDR, 1)
        _, port = sock.getsockname()
    return port

def writeJson(term: KInner, output_file: Path):
    output_file.write_text(json.dumps(term.to_dict()))

def main():
    logging.basicConfig()
    logging.getLogger().setLevel(logging.DEBUG)

    krun_output_file = ROOT / 'tmp' / 'krun.json'
    bytes_output_file = ROOT / 'tmp' / 'bytes.json'
    input_file = ROOT / 'sum-to-n.wat'
    if not bytes_output_file.exists():
        if not krun_output_file.exists():
            krun(input_file, krun_output_file)
        term = loadJsonKrun(krun_output_file)
        # TODO: Replace the config in the term
        # assert not term.constraints
        # print(term.constraints)
        config = replaceBytes(term)
        writeJson(config, bytes_output_file)
    term = loadJson(bytes_output_file)
    functions = findFunctions(term)
    claim = makeClaim(term, '11', functions)
    temp_dir = tempfile.TemporaryDirectory(prefix='kprove')
    kprove = makeKProve(temp_dir)
    explorer = makeExplorer(kprove)
    kcfg = KCFG.from_claim(kprove.definition, claim)
    first_node_id = kcfg.get_unique_init().id
    (_nextkcfg, new_node_id) = explorer.step(
            cfgid='random-string-with-no-meaning',
            cfg=kcfg,
            node_id=first_node_id,
            depth=1
        )
    print(kcfg.node(new_node_id))

if __name__ == '__main__':
    main()
