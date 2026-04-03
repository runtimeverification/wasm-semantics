from __future__ import annotations

import sys
from io import BytesIO
from pathlib import Path
from subprocess import run
from typing import TYPE_CHECKING

import pytest
from pyk.kast.inner import KApply, KLabel, KSequence, KSort, Subst
from pyk.kast.manip import split_config_from
from pyk.kast.prelude.utils import token

from pykwasm.binary.module import parse_module
from pykwasm.wasm2kast import wasm2kast

if TYPE_CHECKING:
    from pyk.kast import KInner
    from pyk.kore.syntax import Pattern
    from pyk.ktool.krun import KRun


BINARY_DIR = Path(__file__).parent / 'binary'
BINARY_WAT_FILES = list(BINARY_DIR.glob('*.wat'))

sys.setrecursionlimit(1500000000)


@pytest.mark.parametrize('wat_path', BINARY_WAT_FILES, ids=str)
def test_wasm2kast(krun_llvm: KRun, wat_path: Path) -> None:
    # Given
    wat2wasm_cmd = ['wat2wasm', str(wat_path), '--output=/dev/stdout']
    proc_res = run(wat2wasm_cmd, check=True, capture_output=True)
    wasm_file = BytesIO(proc_res.stdout)

    assert not proc_res.returncode

    # When
    module = wasm2kast(wasm_file)

    # Then
    run_module(krun_llvm, module)


@pytest.mark.parametrize('wat_path', BINARY_WAT_FILES, ids=str)
def test_self_binary_parser(krun_llvm: KRun, wat_path: Path) -> None:
    # Given
    wat2wasm_cmd = ['wat2wasm', str(wat_path), '--output=/dev/stdout']
    proc_res = run(wat2wasm_cmd, check=True, capture_output=True)
    wasm_file = BytesIO(proc_res.stdout)

    assert not proc_res.returncode

    # When
    module = parse_module(wasm_file)

    # Then

    # Can convert to Kore successfully
    krun_llvm.kast_to_kore(module, KSort('ModuleDecl'))

    # Can run (initiate) successfully
    run_module(krun_llvm, module)


@pytest.mark.parametrize('wat_path', BINARY_WAT_FILES, ids=str)
def test_diff(krun_llvm: KRun, wat_path: Path) -> None:
    # Given
    wat2wasm_cmd = ['wat2wasm', str(wat_path), '--output=/dev/stdout']
    proc_res = run(wat2wasm_cmd, check=True, capture_output=True)

    assert not proc_res.returncode

    # When
    module_wasm2kast = remove_block_ids(wasm2kast(BytesIO(proc_res.stdout)))

    module_self = parse_module(BytesIO(proc_res.stdout))

    # Then
    assert module_wasm2kast == module_self

    run_wasm2kast = run_module(krun_llvm, module_wasm2kast)
    run_self = run_module(krun_llvm, module_self)
    assert run_wasm2kast == run_self


def run_module(krun: KRun, parsed_module: KInner) -> Pattern:
    try:
        # Create an initial config
        config_kast = krun.definition.init_config(KSort('GeneratedTopCell'))

        # Embed parsed_module to <k>
        symbolic_config, init_subst = split_config_from(config_kast)
        init_subst['K_CELL'] = KSequence(parsed_module)
        config_with_module = Subst(init_subst)(symbolic_config)

        # Convert the config to kore
        config_kore = krun.kast_to_kore(config_with_module, KSort('GeneratedTopCell'))

        # Run the config
        return krun.run_pattern(config_kore)

    except Exception as e:
        raise Exception('Received error while running') from e


def remove_block_ids(k: KInner) -> KInner:
    match k:
        
        case KApply(KLabel('aBlock'), (vec_type, instrs, _)):
            return KApply('aBlock', (vec_type, remove_block_ids(instrs), token(0)))
        
        case KApply(KLabel('aIf'), (vec_type, then_instrs, else_instrs, _)):
            return KApply('aIf', (vec_type, remove_block_ids(then_instrs), remove_block_ids(else_instrs), token(0)))
        
        case KApply(KLabel('aLoop'), (vec_type, instrs, _)):
            return KApply(KLabel('aLoop'), (vec_type, remove_block_ids(instrs), token(0)))
        
        case _:
            return k.map_inner(remove_block_ids)
