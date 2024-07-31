from __future__ import annotations

import shutil
from pathlib import Path
from typing import TYPE_CHECKING

from pyk.kbuild.utils import k_version
from pyk.kdist.api import Target
from pyk.ktool.kompile import PykBackend, kompile

if TYPE_CHECKING:
    from collections.abc import Callable, Mapping
    from typing import Any, Final


class SourceTarget(Target):
    SRC_DIR: Final = Path(__file__).parent

    def build(self, output_dir: Path, deps: dict[str, Path], args: dict[str, Any], verbose: bool) -> None:
        shutil.copytree(self.SRC_DIR / 'wasm-semantics', output_dir / 'wasm-semantics')

    def source(self) -> tuple[Path, ...]:
        return (self.SRC_DIR,)


class KompileTarget(Target):
    _kompile_args: Callable[[Path], Mapping[str, Any]]

    def __init__(self, kompile_args: Callable[[Path], Mapping[str, Any]]):
        self._kompile_args = kompile_args

    def build(self, output_dir: Path, deps: dict[str, Path], args: dict[str, Any], verbose: bool) -> None:
        llvm_proof_hint_debugging = bool(args.get('llvm-proof-hint-debugging', ''))
        llvm_proof_hint_instrumentation = bool(args.get('llvm-proof-hint-instrumentation', ''))
        kompile_args = self._kompile_args(deps['wasm-semantics.source'])
        kompile(
            output_dir=output_dir,
            verbose=verbose,
            llvm_proof_hint_debugging=llvm_proof_hint_debugging,
            llvm_proof_hint_instrumentation=llvm_proof_hint_instrumentation,
            **kompile_args,
        )

    def context(self) -> dict[str, str]:
        return {'k-version': k_version().text}

    def deps(self) -> tuple[str]:
        return ('wasm-semantics.source',)


__TARGETS__: Final = {
    'source': SourceTarget(),
    'llvm': KompileTarget(
        lambda src_dir: {
            'backend': PykBackend.LLVM,
            'main_file': src_dir / 'wasm-semantics/test.md',
            'main_module': 'WASM-TEST',
            'syntax_module': 'WASM-TEST-SYNTAX',
            'md_selector': 'k',
            'warnings_to_errors': True,
            'gen_glr_bison_parser': True,
            'opt_level': 3,
            'ccopts': ['-g'],
        },
    ),
    'kwasm-lemmas': KompileTarget(
        lambda src_dir: {
            'backend': PykBackend.HASKELL,
            'main_file': src_dir / 'wasm-semantics/kwasm-lemmas.md',
            'main_module': 'KWASM-LEMMAS',
            'syntax_module': 'WASM-TEXT-SYNTAX',
            'md_selector': 'k',
            'warnings_to_errors': True,
        },
    ),
    'wrc20': KompileTarget(
        lambda src_dir: {
            'backend': PykBackend.HASKELL,
            'main_file': src_dir / 'wasm-semantics/wrc20.md',
            'main_module': 'WRC20-LEMMAS',
            'syntax_module': 'WASM-TEXT-SYNTAX',
            'md_selector': 'k',
            'warnings_to_errors': True,
        },
    ),
}
