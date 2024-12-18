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
        if kompile_args['backend'] == PykBackend.LLVM:
            kompile(
                output_dir=output_dir,
                verbose=verbose,
                llvm_proof_hint_debugging=llvm_proof_hint_debugging,
                llvm_proof_hint_instrumentation=llvm_proof_hint_instrumentation,
                **kompile_args,
            )
        else:
            kompile(
                output_dir=output_dir,
                verbose=verbose,
                **kompile_args,
            )

    def context(self) -> dict[str, str]:
        return {'k-version': k_version().text}

    def deps(self) -> tuple[str]:
        return ('wasm-semantics.source',)


def ulm_wasm_args(src_dir: Path, ulm_test: bool = False) -> dict[str, Any]:
    build_dir = Path(__file__).parent.parent.parent.parent.parent / 'build'
    ulm_lib_ccopts = []
    if not ulm_test:
        ulm_lib_ccopts = [
            '-L' + str(build_dir / 'lib'),
            '-lulmkllvm',
            '-shared',
            '-fPIC',
            str(build_dir / 'deps' / 'ulm' / 'kllvm' / 'lang' / 'ulm_language_entry.cpp'),
        ]
    return {
        'backend': PykBackend.LLVM,
        'hook_namespaces': ['KRYPTO'] + ([] if ulm_test else ['ULM']),
        'ccopts': [
            '-g',
            '-std=c++20',
            '-lcrypto',
            '-lsecp256k1',
            '-lssl',
            str(build_dir / 'lib' / 'krypto.a'),
        ]
        + ulm_lib_ccopts
        + [
            '-I' + str(build_dir / 'deps' / 'ulm' / 'kllvm'),
            '-DULM_LANG_ID=wasm',
        ],
        'llvm_hidden_visibility': True,
        'llvm_kompile_type': 'main' if ulm_test else 'library',
        'llvm_kompile_output': 'interpreter' if ulm_test else 'libkwasm.so',
        'opt_level': 2,
        'include_dirs': [build_dir / 'deps' / 'ulm' / 'kllvm', build_dir / 'deps' / 'plugin' / 'plugin'],
        'main_file': src_dir / 'wasm-semantics/ulm-wasm.md',
        'md_selector': 'k|' + ('local' if ulm_test else 'remote'),
        'main_module': 'ULM-WASM',
        'syntax_module': 'ULM-WASM-SYNTAX',
        'emit_json': True,
        'warnings_to_errors': not ulm_test,
    }


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
    'ulm-wasm': KompileTarget(
        lambda src_dir: ulm_wasm_args(src_dir),
    ),
    'ulm-wasm-test': KompileTarget(
        lambda src_dir: ulm_wasm_args(src_dir, ulm_test=True),
    ),
}
