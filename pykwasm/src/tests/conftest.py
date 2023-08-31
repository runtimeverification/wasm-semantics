from pathlib import Path

import pytest
from pyk.cli.utils import dir_path
from pyk.ktool.krun import KRun
from pytest import Config, Parser


def pytest_addoption(parser: Parser) -> None:
    parser.addoption(
        '--llvm-dir',
        dest='llvm_dir',
        type=dir_path,
        help='Existing LLVM kompiled directory.',
    )


@pytest.fixture(scope='session')
def llvm_dir(pytestconfig: Config) -> Path:
    ldir = pytestconfig.getoption('llvm_dir')
    assert isinstance(ldir, Path)
    return ldir


@pytest.fixture(scope='session')
def krun_llvm(llvm_dir: Path) -> KRun:
    return KRun(llvm_dir)
