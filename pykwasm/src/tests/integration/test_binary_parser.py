import sys
from io import BytesIO
from pathlib import Path
from subprocess import run

import pytest
from pyk.kast.inner import KInner, KSequence, KSort, Subst
from pyk.kast.manip import split_config_from
from pyk.ktool.krun import KRun

from pykwasm.wasm2kast import wasm2kast

BINARY_DIR = Path(__file__).parent / 'binary'
BINARY_WAT_FILES = BINARY_DIR.glob('*.wat')

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


def run_module(krun: KRun, parsed_module: KInner) -> None:
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
        krun.run_pattern(config_kore)

    except Exception as e:
        raise Exception('Received error while running') from e
