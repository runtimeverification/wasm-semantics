from __future__ import annotations

from typing import TYPE_CHECKING

import pytest
from pyk.cli.utils import dir_path
from pyk.kdist import kdist
from pyk.ktool.krun import KRun

if TYPE_CHECKING:
    from pathlib import Path

    from pytest import Config, Parser


def pytest_addoption(parser: Parser) -> None:
    parser.addoption(
        '--llvm-dir',
        dest='llvm_dir',
        type=dir_path,
        help='Existing LLVM kompiled directory.',
    )


@pytest.fixture(scope='session')
def llvm_dir(pytestconfig: Config) -> Path | None:
    return pytestconfig.getoption('llvm_dir')


@pytest.fixture(scope='session')
def krun_llvm(llvm_dir: Path | None) -> KRun:
    if llvm_dir is not None:
        return KRun(llvm_dir)

    llvm_dir = kdist.which('wasm-semantics.llvm')
    if not llvm_dir.is_dir():
        raise ValueError('LLVM definition not found. Run make from the repository root, or pass --llvm-dir')

    return KRun(llvm_dir)
