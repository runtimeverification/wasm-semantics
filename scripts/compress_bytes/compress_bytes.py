#!/usr/bin/env python3

import logging
import sys

from contextlib import closing
import json
from socket import AF_INET, SO_REUSEADDR, SOCK_STREAM, SOL_SOCKET, socket
import tempfile
from pathlib import Path
from typing import List, Tuple

from pyk.cterm import CTerm
from pyk.kast.inner import (
    KInner,
    KApply,
    KToken,
    KLabel,
    KRewrite,
    KSequence,
    KSort,
    KVariable,
    bottom_up)
from pyk.kast.manip import push_down_rewrites
from pyk.kast.outer import KClaim
from pyk.kcfg import KCFG, KCFGExplore
from pyk.ktool.kprove import KProve
from pyk.ktool.krun import _krun, KRunOutput
from pyk.prelude.k import GENERATED_TOP_CELL, K
from pyk.prelude.kbool import TRUE, andBool
from pyk.prelude.kint import INT, intToken, leInt, ltInt
from pyk.prelude.ml import mlAnd, mlTop

from . import execution
from .functions import findFunctions, Functions, WasmFunction
from .kast import (extractRewriteParents,
                   replaceChild,
                   )
from .types import (ValType)

sys.setrecursionlimit(2000)

ROOT = Path('/mnt/data/runtime-verification/wasm-semantics')
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

def loadJsonDict(input_file:Path):
    print('Load json')
    value = input_file.read_text()
    return json.loads(value)

def loadJsonKrun(input_file:Path):
    value = loadJsonDict(input_file)
    return KInner.from_dict(value['term'])

def loadJson(input_file:Path):
    value = loadJsonDict(input_file)
    return KInner.from_dict(value)

def replaceBytes(term: KInner):
    term = bottom_up(filterBytesCallback, term)
    return term

def replaceBytesCTerm(term: CTerm) -> CTerm:
    new_term = replaceBytes(term.config)
    thing = mlAnd([new_term] + list(term.constraints), GENERATED_TOP_CELL)
    return CTerm(thing)

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
    return KSequence(statements)

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
    argument_types_list = function.argumentTypesList()
    variables = makeVariables(argument_types_list)
    assert len(variables) == len(argument_types_list)
    stack = KVariable('MyStack', sort=KSort('ValStack'))
    for var, vtype in zip(variables, argument_types_list):
        stack = KApply(
            '_:__WASM-DATA_ValStack_Val_ValStack',
            ( KApply('<_>__WASM-DATA_IVal_IValType_Int', (makeType(vtype), var))
            , stack
            )
        )
    statements = [
        KApply('aNop'),
        makeACall(function.address()),
        KVariable('MyOtherInstructions', sort=K)
    ]
    call = makeStatementList(statements)
    constraint_list = [makeTypeConstraint(var, vtype) for var, vtype in zip(variables, argument_types_list)]
    constraint = makeBalancedAndBool(constraint_list)
    return (call, stack, constraint)

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
    (call, stack, constraint) = generateSymbolicFunctionCall(function)
    lhs = replaceChild(term, '<instrs>', call)
    lhs = replaceChild(lhs, '<valstack>', stack)
    rewrite = makeRewrite(lhs, term)
    writeJson(rewrite, ROOT / 'tmp' / 'rewrite.json')
    return (lhs, KClaim(body=rewrite, requires=constraint))

def makeFinalClaim(lhs_id:str, rhs_id:str, kcfg:KCFG):
    lhs_node = kcfg.node(lhs_id)
    rhs_node = kcfg.node(rhs_id)
    rewrite = makeRewrite(lhs_node.cterm.config, rhs_node.cterm.config)
    requires = [c for c in lhs_node.cterm.constraints if c != TRUE]
    for c in rhs_node.cterm.constraints:
        if c != TRUE and c not in lhs_node.cterm.constraints:
            requires.append(c)
    constraint = andBool(requires)
    return KClaim(body=rewrite, requires=constraint)

def makeCTerm(term, inner, address:str, functions:Functions) -> CTerm:
    function = functions.addrToFunction(address)
    (call, stack, constraint) = generateSymbolicFunctionCall(function)
    lhs = replaceChild(term, '<instrs>', call)
    lhs = replaceChild(lhs, '<valstack>', stack)
    rewrite = makeRewrite(lhs, term)
    writeJson(rewrite, ROOT / 'tmp' / 'rewrite.json')
    return (lhs, KClaim(body=rewrite, requires=constraint))

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
        39425,
        # free_port_on_host(),
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

def myStep(explorer:KCFGExplore, cfg:KCFG, node_id:str):
    node = cfg.node(node_id)
    out_edges = cfg.edges(source_id=node.id)
    if len(out_edges) > 0:
        return [edge.target.id for edge in out_edges]
    actual_depth, cterm, next_cterms = explorer.cterm_execute(node.cterm, depth=1)
    if actual_depth == 0:
        if len(next_cterms) < 2:
            raise ValueError(f'Unable to take {1} steps from node (next={len(next_cterms)}), got {actual_depth} steps: {node.id}')
        next_ids = []
        for next_cterm in next_cterms:
            next_cterm = replaceBytesCTerm(next_cterm)
            new_node = cfg.get_or_create_node(next_cterm)
            cfg.create_edge(node.id, new_node.id, condition=mlTop(), depth=1)
            next_ids.append(new_node.id)
        return next_ids
    if actual_depth != 1:
        writeJson(node.cterm.config, ROOT / 'tmp' / 'stuck.json')
        print('cterm=', cterm)
        print('cterms.len=', len(next_cterms), flush=True)
        raise ValueError(f'Unable to take {1} steps from node, got {actual_depth} steps: {node.id}')
    if len(next_cterms) != 0:
        raise ValueError(f'Unexpected next cterms length {len(next_cterms)}: {node.id}')
    cterm = replaceBytesCTerm(cterm)
    new_node = cfg.get_or_create_node(cterm)
    # TODO: This may be other things than mlTop()
    cfg.create_edge(node.id, new_node.id, condition=mlTop(), depth=1)
    return [new_node.id]

    # _LOGGER.info(f'Found new node at depth {depth} {cfgid}: {shorten_hashes((node.id, new_node.id))}')
    # if len(out_edges) == 0:
    #     cfg.create_edge(node.id, new_node.id, condition=mlTop(), depth=depth)
    # else:
    #     edge = out_edges[0]
    #     if depth > edge.depth:
    #         raise ValueError(
    #             f'Step depth {depth} greater than original edge depth {edge.depth} {cfgid}: {shorten_hashes((edge.source.id, edge.target.id))}'
    #         )
    #     cfg.remove_edge(edge.source.id, edge.target.id)
    #     cfg.create_edge(edge.source.id, new_node.id, condition=mlTop(), depth=depth)
    #     cfg.create_edge(new_node.id, edge.target.id, condition=mlTop(), depth=(edge.depth - depth))
    return next_ids

def myStepLogging(explorer:KCFGExplore, kcfg:KCFG, node_id:str):
    prev_config = kcfg.node(node_id).cterm.config
    # prev_config = replaceBytes(prev_config)
    new_node_ids = myStep(explorer = explorer, cfg=kcfg, node_id=node_id)
    first = True
    print([node_id], '->', new_node_ids)
    for new_node_id in new_node_ids:
        config = kcfg.node(new_node_id).cterm.config

        rewrite = makeRewrite(prev_config, config)
        diff = push_down_rewrites(rewrite)
        if not first:
            print('-' * 80)
        first = False
        # pretty = explorer.kprint.pretty_print(diff)
        # print(pretty)
        children = extractRewriteParents(diff)
        for child in children:
            pretty = explorer.kprint.pretty_print(child)
            print(pretty)
            print()
    print('=' * 80, flush=True)
    return new_node_ids

def executeFunction(
    function_addr:str,
    term:KInner,
    functions:Functions,
    explorer:KCFGExplore,
    state_path:Path
    ) -> None:

    print('*' * 80)
    print('*' * 80)
    print('*' * 30, ' ' * 10, function_addr)
    print('*' * 80)
    print('*' * 80)

    function_state_path = state_path / 'functions'
    function_state_path.mkdir(parents=True, exist_ok=True)
    function_state_path = function_state_path / f'{function_addr}.json'

    if (function_state_path.exists()):
        json = function_state_path.read_text()
        kcfg = KCFG.from_json(json)
    else:
        (_, claim) = makeClaim(term, function_addr, functions)
        kcfg = KCFG.from_claim(explorer.kprint.definition, claim)

    execution_decision = execution.ExecutionManager(functions)

    try:
        first_node_id = kcfg.get_unique_init().id
        node_ids = myStep(explorer, kcfg, first_node_id)
        assert len(node_ids) == 1
        lhs_id = node_ids[0]
        rhs_ids = []
        while node_ids:
            new_node_ids = myStepLogging(explorer, kcfg, node_ids[-1])
            node_ids.pop()
            for node_id in reversed(new_node_ids):
                decision = execution_decision.decideConfiguration(kcfg, node_id)
                if isinstance(decision, execution.Finish):
                    rhs_ids.append(node_id)
                    print([node_id], 'finished')
                elif isinstance(decision, execution.UnimplementedElrondFunction):
                    raise ValueError(repr(decision))
                elif isinstance(decision, execution.UnsummarizedFunction):
                    raise ValueError(repr(decision))
                elif isinstance(decision, execution.Loop):
                    raise ValueError(repr(decision))
                elif isinstance(decision, execution.Continue):
                    node_ids.append(node_id)
    finally:
        function_state_path.write_text(kcfg.to_json())
    for rhs_id in rhs_ids:
        claim = makeFinalClaim(lhs_id, rhs_id, kcfg)
        print(explorer.kprint.pretty_print_kas(claim))

def main():
    # logging.basicConfig()
    # logging.getLogger().setLevel(logging.DEBUG)

    krun_output_file = ROOT / 'tmp' / 'krun.json'
    bytes_output_file = ROOT / 'tmp' / 'bytes.json'
    input_file = ROOT / 'tmp' / 'sum-to-n.wat'
    data_path = ROOT / 'data'
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
    temp_dir = tempfile.TemporaryDirectory(prefix='kprove')
    kprove = makeKProve(temp_dir)
    with makeExplorer(kprove) as explorer:
        executeFunction('11', term, functions, explorer, data_path)
        executeFunction('12', term, functions, explorer, data_path)
        executeFunction('16', term, functions, explorer, data_path)
        # References
        # executeFunction('15', term, functions, explorer, data_path)
        # executeFunction('14', term, functions, explorer, data_path)
        # executeFunction('9', term, functions, explorer, data_path)
        # executeFunction('8', term, functions, explorer, data_path)
        # executeFunction('10', term, functions, explorer, data_path)
        # Loop
        # executeFunction('13', term, functions, explorer, data_path)
    #   print(config)
    # d['result']['state']['term']['term'] - kore term
    # 

'''
Python debugging of RPC responses:

import compress_bytes.compress_bytes as c
from pathlib import Path
from pyk.ktool.kprint import KPrint
from pyk.kore.syntax import Pattern

my_kprint = KPrint(c.DEFINITION_DIR)

d = c.loadJsonDict(Path(c.ROOT) / 'tmp' / 'response.log')

d['result']['state']['term']['term']['args'][0]['args'][1]['args'][7]['args'][4]['args'][0]['args'][1]['args'][3]['args'][0]['value'] = '...removed-memory...'

kore = Pattern.from_dict(d['result']['state']['term']['term'])
pretty = my_kprint.kore_to_pretty(kore)
print(pretty)
'''


if __name__ == '__main__':
    main()
