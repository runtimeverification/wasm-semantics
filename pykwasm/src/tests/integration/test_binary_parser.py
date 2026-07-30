from __future__ import annotations

import sys
from io import BytesIO
from pathlib import Path
from subprocess import run
from typing import TYPE_CHECKING

import pytest
from pyk.kast.inner import KSequence, KSort, Subst
from pyk.kast.manip import split_config_from

from pykwasm.wasm2kast import wasm2kast

if TYPE_CHECKING:
    from pyk.kast import KInner
    from pyk.kore.syntax import Pattern
    from pyk.ktool.krun import KRun


BINARY_DIR = Path(__file__).parent / 'binary'
BINARY_WAT_FILES = list(BINARY_DIR.glob('*.wat'))


@pytest.mark.parametrize('wat_path', BINARY_WAT_FILES, ids=str)
def test_wasm2kast(krun_llvm: KRun, wat_path: Path) -> None:
    # Given
    wat2wasm_cmd = ['wat2wasm', str(wat_path), '--output=/dev/stdout']
    proc_res = run(wat2wasm_cmd, check=True, capture_output=True)
    wasm_file = BytesIO(proc_res.stdout)

    # When
    module = wasm2kast(wasm_file)

    # Then
    run_module(krun_llvm, module)


def run_module(krun: KRun, parsed_module: KInner) -> Pattern:
    # pyk serializes kore terms recursively (pyk.kore.syntax.Pattern.write) and the term
    # nesting depth grows with module size, so the default limit of 1000 is not enough:
    # basic-features.wat needs about 4000. Set 20000 for headroom.
    sys.setrecursionlimit(max(sys.getrecursionlimit(), 20_000))

    # Create an initial config
    config_kast = krun.definition.init_config(KSort('GeneratedTopCell'))

    # Embed parsed_module into the <k> cell
    symbolic_config, init_subst = split_config_from(config_kast)
    init_subst['K_CELL'] = KSequence(parsed_module)
    config_with_module = Subst(init_subst)(symbolic_config)

    # Convert the config to kore
    config_kore = krun.kast_to_kore(config_with_module, KSort('GeneratedTopCell'))

    # Run the config
    return krun.run_pattern(config_kore)
