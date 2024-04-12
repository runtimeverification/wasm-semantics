from __future__ import annotations

from pathlib import Path
from typing import TYPE_CHECKING

from pyk.kbuild.utils import k_version
from pyk.kdist.api import Target
from pyk.ktool.kompile import KompileBackend, kompile

if TYPE_CHECKING:
    from collections.abc import Mapping
    from typing import Any, Final


SOURCE_DIR: Final = Path(__file__).parent


class KompileTarget(Target):
    _kompile_args: dict[str, Any]

    def __init__(self, kompile_args: Mapping[str, Any]):
        self._kompile_args = dict(kompile_args)

    def build(self, output_dir: Path, deps: dict[str, Path], args: dict[str, Any], verbose: bool) -> None:
        kompile(
            output_dir=output_dir,
            verbose=verbose,
            **self._kompile_args,
        )

    def source(self) -> tuple[Path, ...]:
        return (SOURCE_DIR,)

    def context(self) -> dict[str, str]:
        return {'k-version': k_version().text}


__TARGETS__: Final = {
    'llvm': KompileTarget(
        {
            'backend': KompileBackend.LLVM,
            'main_file': SOURCE_DIR / 'test.md',
            'main_module': 'WASM-TEST',
            'syntax_module': 'WASM-TEST-SYNTAX',
            'md_selector': 'k',
            'gen_glr_bison_parser': True,
            'opt_level': 2,
            'ccopts': ['-g'],
        },
    ),
    'kwasm-lemmas': KompileTarget(
        {
            'backend': KompileBackend.HASKELL,
            'main_file': SOURCE_DIR / 'kwasm-lemmas.md',
            'main_module': 'KWASM-LEMMAS',
            'syntax_module': 'WASM-TEXT-SYNTAX',
            'md_selector': 'k',
            'warning_to_error': True,
        },
    ),
    'wrc20': KompileTarget(
        {
            'backend': KompileBackend.HASKELL,
            'main_file': SOURCE_DIR / 'wrc20.md',
            'main_module': 'WRC20-LEMMAS',
            'syntax_module': 'WASM-TEXT-SYNTAX',
            'md_selector': 'k',
            'warning_to_error': True,
        },
    ),
}
