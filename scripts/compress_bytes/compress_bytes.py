#!/usr/bin/env python3

import operator
import subprocess
import sys

from contextlib import closing
from dataclasses import dataclass
import json
from socket import AF_INET, SO_REUSEADDR, SOCK_STREAM, SOL_SOCKET, socket
import tempfile
from pathlib import Path
from typing import Any, Iterable, List, Mapping, Optional, Set, Tuple

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
from pyk.cli_utils import BugReport
from pyk.kast.manip import push_down_rewrites, ml_pred_to_bool
from pyk.kast.outer import (
    KAtt,
    KClaim,
    KDefinition,
    KFlatModule,
    KImport,
    KProduction,
    KRequire,
    KRule,
    KTerminal,
    )
from pyk.kcfg import KCFG, KCFGExplore
from pyk.ktool.kprint import KPrint, SymbolTable
from pyk.ktool.kprove import KProve
from pyk.ktool.krun import _krun, KRunOutput
from pyk.prelude.k import GENERATED_TOP_CELL, K
from pyk.prelude.kbool import TRUE, andBool
from pyk.prelude.bytes import BYTES, bytesToken
from pyk.prelude.kint import INT, intToken, leInt, ltInt
from pyk.prelude.ml import mlAnd, mlTop

from . import execution
from .functions import findFunctions, Functions, WasmFunction
from .kast import ( extractRewriteParents,
                    getInner,
                    kinner_top_down_fold,
                    replaceChild,
                   )
from .types import (ValType)

sys.setrecursionlimit(2000)

ROOT = Path('/mnt/data/runtime-verification/wasm-semantics')
BUILD_DIR = ROOT / '.build'
DEFINITION_PARENT = BUILD_DIR / 'defn/haskell'
DEFINITION_DIR = DEFINITION_PARENT / 'elrond-wasm-kompiled'
DATA_DIR = BUILD_DIR / 'data'
JSON_DIR = DATA_DIR / 'json'
SUMMARIES_DIR = DATA_DIR / 'summaries'
DEFAULT_SUMMARIES_DIR = ROOT / 'summaries'

GENERATED_RULE_PRIORITY = 20
MAP = KSort('Map')

DEBUG_ID = '' # 'c61765c6271ee4683c48d3b4450abbba1ce4c38e6b18d8c3d0a34c1b09c50cbb'

@dataclass(frozen=True)
class Identifiers:
    sort_to_ids: Mapping[KSort, Set[KToken]]

class MyKPrint(KPrint):
    def __init__(
        self,
        definition_dir: Path,
        use_directory: Optional[Path] = None,
        bug_report: Optional[BugReport] = None,
        extra_unparsing_modules: Iterable[KFlatModule] = (),
    ) -> None:
        super().__init__(definition_dir, use_directory, bug_report, extra_unparsing_modules)

    @classmethod
    def _patch_symbol_table(cls, symbol_table: SymbolTable) -> None:
        symbol_table['_|->_'] = lambda c1, c2: f'({c1} |-> {c2})'


class LazyExplorer:
    def __init__(self, rules:List[KRule], identifiers:Identifiers, data_folder:Path, printer:KPrint):
        self.__rules = rules
        self.__identifiers = identifiers
        self.__summary_folder = data_folder
        self.__printer = printer
        self.__explorer:Optional[KCFGExplore] = None

    def __enter__(self) -> 'LazyExplorer':
        return self
    
    def __exit__(self, *_args: Any) -> None:
        self.close()

    def close(self) -> None:
        if self.__explorer:
            self.__explorer.close()

    def get(self) -> KCFGExplore:
        if self.__explorer is None:
            if not DEBUG_ID:
                self.__makeSemantics()
            temp_dir = tempfile.TemporaryDirectory(prefix='kprove')
            kprove = makeKProve(temp_dir)
            self.__explorer = makeExplorer(kprove)
        return self.__explorer

    def printer(self) -> KPrint:
        return self.__printer

    def __makeSemantics(self) -> None:
        identifier_sentences = [
            KProduction(
                sort=sort,
                items=[KTerminal(token.token)],
                att=KAtt({'token': ''})
            )
            for sort, tokens in self.__identifiers.sort_to_ids.items()
            for token in tokens
        ]
        identifiers_module = KFlatModule('IDENTIFIERS', sentences=identifier_sentences)

        req = KRequire('elrond-impl.md')
        ims = [KImport('ELROND-IMPL'), KImport('IDENTIFIERS')]
        summaries_module = KFlatModule('SUMMARIES', sentences=self.__rules, imports=ims)

        definition = KDefinition(
            'SUMMARIES',
            all_modules=[identifiers_module, summaries_module],
            requires=[req]
        )

        definition_text = self.__printer.pretty_print(definition)
        # definition_text = definition_text.replace('$', '$#')

        self.__summary_folder.mkdir(parents=True, exist_ok=True)
        (self.__summary_folder / 'summaries.k').write_text(definition_text)

        kompileSemantics(self.__summary_folder)

def kompileSemantics(summary_folder:Optional[Path]) -> None:
    result = subprocess.run(
        ['rm', '-r', DEFINITION_DIR]
    )
    args = [ 'kompile'
        , '--backend', 'haskell'
        , '--md-selector', 'k'
        , '--emit-json'
        , '-I', str(summary_folder) if summary_folder else str(DEFAULT_SUMMARIES_DIR)
        , '-I', str(ROOT)
        , '--directory', str(DEFINITION_PARENT)
        , '--main-module', 'ELROND-WASM'
        , '--syntax-module', 'ELROND-WASM-SYNTAX'
        , str(ROOT / 'elrond-wasm.md')
        ]
    print('Running:', ' '.join(args), flush=True)
    result = subprocess.run(args)
    assert result.returncode == 0

def findRewrites(term:KInner) -> List[KRewrite]:
    def maybe_rewrite(term:KInner) -> Optional[List[KRewrite]]:
        if isinstance(term, KRewrite):
            return [term]
        return None
    return kinner_top_down_fold(maybe_rewrite, operator.add, [], term)

SET_BYTES_RANGE = '#setBytesRange(_,_,_)_WASM-DATA_Bytes_Bytes_Int_Bytes'
DOT_BYTES = '.Bytes_BYTES-HOOKED_Bytes'

def bytesToString(b:str) -> str:
    assert b.startswith('b"')
    assert b.endswith('"')

    b = b[2:-1]
    return b

def filterBytes(term: KToken) -> KInner:
    assert term.sort == BYTES
    bytes = bytesToString(term.token)

    zero = '\x00'
    zeros = []
    start = bytes.find(zero, 0)
    if start < 0:
        return term
    while start >= 0:
        idx = start
        next = bytes.find(zero, idx + 1)
        # TODO: Revert this to the previous version.
        while next - idx == len(zero):
            idx = next
            next = bytes.find(zero, idx + 1)
        zeros.append((start, idx))
        start = next
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

    new_term = KApply(DOT_BYTES, ())
    for (start, end) in keep:
        new_term = KApply (SET_BYTES_RANGE,
                        ( new_term
                        , KToken(str(start), INT)
                        , bytesToken(bytes[start:end])
                        )
                      )
    return new_term

def filterBytesCallback(term: KInner) -> KInner:
    if isinstance(term, KToken):
        if term.sort == BYTES:
            term = filterBytes(term)
            s = str(term)
            pos = s.find(('\\x00' * 100))
            pos -= 100
            if pos < 0:
                pos = 0
            return term
    return term

def computeBytes(term:KInner) -> KToken:
    if isinstance(term, KToken):
        assert term.sort == BYTES, term
        return term
    assert isinstance(term, KApply)
    if term.label.name == DOT_BYTES:
        return bytesToken('')
    assert term.label.name == SET_BYTES_RANGE, term
    assert len(term.args) == 3, term
    (inner, start, token) = term.args

    inner = computeBytes(inner)
    assert inner.sort == BYTES, inner
    inner_str = bytesToString(inner.token)

    assert isinstance(start, KToken), start
    assert start.sort == INT
    start_int = int(start.token)

    assert isinstance(token, KToken), token
    assert token.sort == BYTES, token
    token_str = bytesToString(token.token)

    if len(inner_str) < start_int + len(token_str):
        inner_str += '\x00' * (start_int + len(token_str) - len(inner_str))
    inner_str = inner_str[:start_int] + token_str + inner_str[start_int + len(token_str):]
    
    return bytesToken(inner_str)

def unpackBytesCallback(term:KInner) -> KInner:
    if isinstance(term, KApply):
        if term.label.name == SET_BYTES_RANGE:
            return computeBytes(term)
    return term

def printKoreCfg(node_id:str, kcfg:KCFG, printer:KPrint) -> None:
    cterm = kcfg.node(node_id).cterm
    kore = printer.kast_to_kore(cterm.config)
    print(printer.kore_to_pretty(kore))
    for constraint in cterm.constraints:
        kore = printer.kast_to_kore(constraint)
        print(printer.kore_to_pretty(kore))

def krun(input_file: Path, output_file:Path) -> None:
    print('Run')
    result = _krun(
        input_file=input_file,
        definition_dir=DEFINITION_DIR,
        output=KRunOutput.JSON
    )
    output_file.parent.mkdir(parents=True, exist_ok=True)
    output_file.write_text(result.stdout)

def loadJsonDict(input_file:Path) -> Mapping[str, Any]:
    print('Load json', flush=True)
    value = input_file.read_text()
    return json.loads(value)

def loadJsonKrun(input_file:Path) -> KInner:
    value = loadJsonDict(input_file)
    return KInner.from_dict(value['term'])

def loadJson(input_file:Path) -> KInner:
    value = loadJsonDict(input_file)
    return KInner.from_dict(value)

def replaceBytes(term: KInner) -> KInner:
    term = bottom_up(filterBytesCallback, term)
    return term

def unpackBytes(term: KInner) -> KInner:
    term = bottom_up(unpackBytesCallback, term)
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
    assert False, vtype

def makeStatementList(statements:List[KInner]) -> KSequence:
    return KSequence(statements)

def makeSort(t:ValType) -> KSort:
    if t == ValType.I32 or t == ValType.I64:
        return KSort('Int')
    if t == ValType.F32 or t == ValType.F64:
        return KSort('Float')
    assert False, t

def makeVariable(name:str, t:ValType) -> KVariable:
    return KVariable(name=name, sort=makeSort(t))

def makeVariables(types: List[ValType]) -> List[KVariable]:
    retv = []
    for idx in range(0, len(types)):
        retv.append(makeVariable(f'MyArg{idx}', types[idx]))
    return retv

def makeTypeConstraint(var:KInner, vType:ValType) -> KInner:
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

def generateSymbolicFunctionCall(function:WasmFunction) -> Tuple[KSequence, KInner, KInner]:
    argument_types_list = function.argumentTypesList()
    variables = makeVariables(argument_types_list)
    assert len(variables) == len(argument_types_list)
    stack:KInner = KVariable('MyStack', sort=KSort('ValStack'))
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
    constraint_list:List[KInner] = [makeTypeConstraint(var, vtype) for var, vtype in zip(variables, argument_types_list)]
    constraint = makeBalancedAndBool(constraint_list)
    return (call, stack, constraint)

def hasQuestionmarkVariables(term:KInner) -> bool:
    def maybe_is_questionmark_variable(term:KInner) -> Optional[bool]:
        if not isinstance(term, KVariable):
            return None
        if term.name.startswith('?'):
            return True
        return False
    assert isinstance(term, KInner)
    return kinner_top_down_fold(maybe_is_questionmark_variable, operator.or_, False, term)

def makeRewrite(lhs:KInner, rhs:KInner) -> KInner:
    def makeRewriteIfNeeded(left:KInner, right:KInner) -> KInner:
        if left == right:
            return left
        return KRewrite(left, right)
    assert isinstance(lhs, KApply)
    assert isinstance(rhs, KApply)
    assert lhs.arity == rhs.arity, [lhs.arity, lhs.label, rhs.arity, rhs.label]
    assert lhs.label == rhs.label
    rw = lhs.let(args=[makeRewriteIfNeeded(l, r) for (l, r) in zip(lhs.args, rhs.args)])
    return push_down_rewrites(rw)

def makeClaim(term:KInner, address:str, functions:Functions) -> Tuple[KInner, KClaim]:
    function = functions.addrToFunction(address)
    (call, stack, constraint) = generateSymbolicFunctionCall(function)
    lhs = replaceChild(term, '<instrs>', call)
    lhs = replaceChild(lhs, '<valstack>', stack)
    lhs = replaceChild(lhs, '<mdata>', KVariable('MyMdata', sort=BYTES))
    lhs = replaceChild(lhs, '<locals>', KVariable('MyLocals', sort=MAP))
    rewrite = makeRewrite(lhs, term)
    writeJson(rewrite, ROOT / 'tmp' / 'rewrite.json')
    return (lhs, KClaim(body=rewrite, requires=constraint))

def buildRewriteRequires(lhs_id:str, rhs_id:str, kcfg:KCFG) -> Tuple[KInner, KInner]:
    lhs_node = kcfg.node(lhs_id)
    rhs_node = kcfg.node(rhs_id)
    lhs_config = unpackBytes(lhs_node.cterm.config)
    rhs_config = unpackBytes(rhs_node.cterm.config)
    rewrite = makeRewrite(lhs_config, rhs_config)
    rewrite = getInner(rewrite, 0, '<elrond-wasm>')
    rewrite = getInner(rewrite, 1, '<wasm>')
    requires = [c for c in lhs_node.cterm.constraints if c != TRUE]
    for c in rhs_node.cterm.constraints:
        if c != TRUE and c not in lhs_node.cterm.constraints and not hasQuestionmarkVariables(c):
            requires.append(c)
    constraint = andBool([ml_pred_to_bool(c) for c in requires])
    return (rewrite, constraint)

# It would be tempting to use cterm.build_rule or cterm.build_claim, however,
# we should check first if those, say, remove function definitions from the
# configuration when calling `minimize_rule`. The rule is not valid without
# those.
def makeFinalClaim(lhs_id:str, rhs_id:str, kcfg:KCFG) -> KClaim:
    (rewrite, constraint) = buildRewriteRequires(lhs_id=lhs_id, rhs_id=rhs_id, kcfg=kcfg)
    return KClaim(body=rewrite, requires=constraint)

# It would be tempting to use cterm.build_rule or cterm.build_claim, however,
# we should check first if those, say, remove function definitions from the
# configuration when calling `minimize_rule`. The rule is not valid without
# those.
def makeFinalRule(lhs_id:str, rhs_id:str, kcfg:KCFG) -> KRule:
    (rewrite, constraint) = buildRewriteRequires(lhs_id=lhs_id, rhs_id=rhs_id, kcfg=kcfg)

    att_dict = {'priority': str(GENERATED_RULE_PRIORITY)}
    rule_att = KAtt(atts=att_dict)
    return KRule(body=rewrite, requires=constraint, att=rule_att)

def makeKProve(temp_dir: tempfile.TemporaryDirectory) -> KProve:
    return KProve(
        DEFINITION_DIR,
        use_directory=Path(temp_dir.name),
        bug_report=None
        # bug_report=BugReport(Path('bug_report'))
    )

def makeExplorer(kprove:KProve) -> KCFGExplore:
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

def writeJson(term: KInner, output_file: Path) -> None:
    output_file.write_text(json.dumps(term.to_dict()))

def myStep(explorer:LazyExplorer, cfg:KCFG, node_id:str) -> List[str]:
    node = cfg.node(node_id)
    out_edges = cfg.edges(source_id=node.id)
    if len(out_edges) > 0:
        return [edge.target.id for edge in out_edges]
    print('Executing!', flush=True)
    actual_depth, cterm, next_cterms = explorer.get().cterm_execute(node.cterm, depth=1)
    if actual_depth == 0:
        if len(next_cterms) < 2:
            print(explorer.printer().pretty_print(node.cterm.config))
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

def myStepLogging(explorer:LazyExplorer, kcfg:KCFG, node_id:str, branches:int) -> List[str]:
    prev_cterm = kcfg.node(node_id).cterm
    prev_config = prev_cterm.config
    # prev_config = replaceBytes(prev_config)
    new_node_ids = myStep(explorer=explorer, cfg=kcfg, node_id=node_id)
    first = True
    print([node_id], '->', new_node_ids, f'{branches - 1} branches left', flush=True)
    for new_node_id in new_node_ids:
        new_cterm = kcfg.node(new_node_id).cterm
        config = new_cterm.config

        diff = makeRewrite(prev_config, config)
        if not first:
            print('-' * 80)
        first = False
        # pretty = explorer.printer().pretty_print(diff)
        # print(pretty)
        children = extractRewriteParents(diff)
        for child in children:
            pretty = explorer.printer().pretty_print(child)
            print(pretty)
            print()

        for c in new_cterm.constraints:
            if c != TRUE and not c in prev_cterm.constraints:
                pretty = explorer.printer().pretty_print(ml_pred_to_bool(c))
                print('requires:', pretty)
                print(explorer.printer().pretty_print(c))
                print(c)
    print('=' * 80, flush=True)
    return new_node_ids

def executeFunction(
    function_addr:str,
    term:KInner,
    functions:Functions,
    explorer:LazyExplorer,
    state_path:Path,
    execution_decision:execution.ExecutionManager,
    ) -> List[KRule]:

    print('*' * 80)
    print('*' * 80)
    print('*' * 26, ' ' * 10, function_addr)
    print('*' * 80)
    print('*' * 80, flush=True)

    function_state_path = state_path / 'functions'
    function_state_path.mkdir(parents=True, exist_ok=True)
    function_state_path = function_state_path / f'{function_addr}.json'

    if (function_state_path.exists()):
        json = function_state_path.read_text()
        kcfg = KCFG.from_json(json)
    else:
        (_, claim) = makeClaim(term, function_addr, functions)
        kcfg = KCFG.from_claim(explorer.printer().definition, claim)

    debug = kcfg.get_node(DEBUG_ID)
    if debug:
        for e in kcfg.edges(source_id = debug.id):
            kcfg.remove_edge(e.source.id, e.target.id)
            kcfg.remove_node(e.target.id)

    try:
        first_node_id = kcfg.get_unique_init().id
        node_ids = myStep(explorer, kcfg, first_node_id)
        assert len(node_ids) == 1
        lhs_id = node_ids[0]
        rhs_ids = []
        while node_ids:
            current_node_id = node_ids[-1]
            node_ids.pop()
            new_node_ids = myStepLogging(explorer, kcfg, current_node_id, len(node_ids) + 1)
            for node_id in reversed(new_node_ids):
                decision = execution_decision.decideConfiguration(kcfg, node_id)
                if isinstance(decision, execution.Finish):
                    rhs_ids.append(node_id)
                    print([node_id], 'finished', flush=True)
                elif isinstance(decision, execution.UnimplementedElrondFunction):
                    raise ValueError(repr(decision))
                elif isinstance(decision, execution.UnsummarizedFunction):
                    return decision
                elif isinstance(decision, execution.Loop):
                    return decision
                elif isinstance(decision, execution.Continue):
                    node_ids.append(node_id)
                elif isinstance(decision, execution.ClaimNotAppliedForSummarizedFunction):
                    # rule = makeFinalRule(current_node_id, node_id, kcfg)
                    # print(explorer.printer().pretty_print(rule))
                    # printKoreCfg(current_node_id, kcfg, explorer.printer())
                    raise ValueError(repr(decision))
                else:
                    assert False, decision
    finally:
        function_state_path.parent.mkdir(parents=True, exist_ok=True)
        function_state_path.write_text(kcfg.to_json())
    return [makeFinalRule(lhs_id, rhs_id, kcfg) for rhs_id in rhs_ids]

def executeFunctionWithRules(
        function_addr:str,
        rules:List[KRule],
        term:KInner,
        functions:Functions,
        identifiers:Identifiers,
        printer:KPrint,
        state_path:Path,
        execution_decision:execution.ExecutionManager,
    ) -> List[KRule]:
    with LazyExplorer(rules, identifiers, SUMMARIES_DIR / function_addr, printer) as explorer:
        execution_decision.startFunction(int(function_addr))
        new_rules = executeFunction(
            function_addr, term, functions, explorer, state_path, execution_decision
        )
        if isinstance(new_rules, execution.UnsummarizedFunction):
            raise ValueError(repr(new_rules))
        if isinstance(new_rules, execution.Loop):
            raise ValueError(repr(new_rules))
        assert isinstance(new_rules, list)
    execution_decision.finishFunction(int(function_addr))
    for r in new_rules:
        assert '"callBack' not in str(r)
    return rules + new_rules

def executeFunctions(
        term:KInner,
        functions:Functions,
        identifiers:Identifiers,
        printer:KPrint,
        state_path:Path,
        execution_decision:execution.ExecutionManager,
    ) -> None:
    rules:List[KRule] = []
    unprocessed_functions:List[str] = [
        addr
            for addr in functions.addrs()
            if not functions.addrToFunction(addr).is_builtin()
    ]
    not_processable: List[str] = []
    processed_functions: List[str] = []
    while unprocessed_functions:
        postponed_functions:List[str] = []
        for function_addr in unprocessed_functions:
            with LazyExplorer(rules, identifiers, SUMMARIES_DIR / function_addr, printer) as explorer:
                execution_decision.startFunction(int(function_addr))
                new_rules = executeFunction(
                    function_addr, term, functions, explorer, state_path, execution_decision
                )
                if isinstance(new_rules, execution.UnsummarizedFunction):
                    postponed_functions.append(function_addr)
                elif isinstance(new_rules, execution.Loop):
                    not_processable.append(function_addr)
                else:
                    assert isinstance(new_rules, list)
                    processed_functions.append(function_addr)
                    execution_decision.finishFunction(int(function_addr))
                    rules += new_rules
        if len(postponed_functions) == len(unprocessed_functions):
            raise ValueError(f'Cannot summarize {unprocessed_functions}, postponed={postponed_functions}, unprocessable={unprocessed_functions}, processed={processed_functions}')
        unprocessed_functions = postponed_functions
    print(f'unprocessed={unprocessed_functions}, unprocessable={unprocessed_functions}, processed={processed_functions}')


def findIdentifiers(term:KInner) -> Identifiers:
    def maybe_identifier(term_:KInner) -> Optional[Mapping[KSort, Set[KToken]]]:
        if isinstance(term_, KToken):
            if term_.sort.name in ['IdentifierToken']:
                return {term_.sort : {term_}}
        return None
    def merge_dicts(
            first:Mapping[KSort, Set[KToken]],
            second:Mapping[KSort, Set[KToken]]
        ) -> Mapping[KSort, Set[KToken]]:
        result = dict(first)
        for key, value in second.items():
            if key in result:
                result[key] |= value
            else:
                result[key] = value
        return result
    return Identifiers(kinner_top_down_fold(maybe_identifier, merge_dicts, {}, term))

class VariablesForGlobals:
    def __init__(self) -> None:
        self.__next_index = 0

    def __replaceGlobal(term:KInner):
        if not isinstance(term, KApply):
            return term
        if term.label.name != 'globalInst':
            return term
        assert term.arity == 3, term
        gmut = term.args[2]
        assert isinstance(gmut, KApply), gmut
        assert gmut.name == 'gMut', gmut
        assert gmut.arity == 1, term
        mutability = gmut.args[0]
        assert isinstance(mutability, KApply), mutability
        if mutability.name == 'const':
            return term
        assert mutability.name == 'var', mutability
        
        gvalue = term.args[1]
        assert isinstance(gvalue, KApply), gvalue
        assert gvalue.name == '<gValue>', gvalue
        assert gvalue.arity == 1, gvalue

        typed_value = gvalue.args[0]
        assert isinstance(value, KApply), typed_value
        assert typed_value.name == 'stuff', typed_value
        assert typed_value.arity == 2, typed_value

        variable = KVariable(f'MyGlobal{self.__next_index}', sort=INT)

        return replaceChild(term, '<>')

def replaceGlobalsWithVariables(term:KInner):
    return term

def runForInput(input_file:Path, short_name:str) -> None:
    kompileSemantics(None)

    json_dir = JSON_DIR / short_name
    krun_output_file = json_dir / 'krun.json'
    bytes_output_file = json_dir / 'bytes.json'
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
    identifiers = findIdentifiers(term)
    functions = findFunctions(term)
    assert '"callBack' in str(term), [str(term)]
    term = replaceChild(term, '<exports>', KVariable('MyExports', sort=MAP))
    assert not '"callBack' in str(term)
    term = replaceChild(term, '<caller>', KVariable('MyCaller', sort=MAP))
    replaceGlobalsWithVariables(term)
    # TODO: replace global data with variables.
    
    printer = MyKPrint(DEFINITION_DIR)
    execution_decision = execution.ExecutionManager(functions)

    executeFunctions(term, functions, identifiers, printer, json_dir, execution_decision)

def main() -> None:
    runForInput(ROOT / 'tmp' / 'sum-to-n.wat', 'sum-to-n')
    return
    # logging.basicConfig()
    # logging.getLogger().setLevel(logging.DEBUG)

    kompileSemantics(None)

    krun_output_file = JSON_DIR / 'krun.json'
    bytes_output_file = JSON_DIR / 'bytes.json'
    input_file = ROOT / 'tmp' / 'sum-to-n.wat'
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
    identifiers = findIdentifiers(term)
    functions = findFunctions(term)
    assert '"callBack' in str(term), [str(term)]
    term = replaceChild(term, '<exports>', KVariable('MyExports', sort=MAP))
    assert not '"callBack' in str(term)
    # TODO: replace global data with variables.
    
    printer = MyKPrint(DEFINITION_DIR)
    execution_decision = execution.ExecutionManager(functions)

    rules:List[KRule] = []
    rules = executeFunctionWithRules('11', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    rules = executeFunctionWithRules('12', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    rules = executeFunctionWithRules('16', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    # # References
    rules = executeFunctionWithRules('14', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    rules = executeFunctionWithRules('9', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    rules = executeFunctionWithRules('8', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    rules = executeFunctionWithRules('10', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    # Loop
    # executeFunctionWithRules('13', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
    # Depends on 13
    # rules = executeFunctionWithRules('15', rules, term, functions, identifiers, printer, JSON_DIR, execution_decision)
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
