from __future__ import annotations

import sys
from argparse import ArgumentParser
from contextlib import contextmanager
from pathlib import Path
from tempfile import NamedTemporaryFile
from typing import TYPE_CHECKING

from pyk.cli.utils import file_path
from pyk.kdist import kdist
from pyk.ktool.krun import _krun
from pyk.utils import run_process

from .preprocessor import preprocess

if TYPE_CHECKING:
    from collections.abc import Iterator


SCRIPT_FILE = Path(__file__).parent / 'kwasm.sh'


def main() -> None:
    parser = _argument_parser()
    args, _ = parser.parse_known_args()

    if args.command == 'run':
        _exec_run(args.program)
    else:
        proc_res = run_process(['bash', str(SCRIPT_FILE)] + sys.argv[1:], pipe_stdout=False, check=False)
        sys.exit(proc_res.returncode)

    raise AssertionError()


def _exec_run(program: Path) -> None:
    definition_dir = kdist.get('wasm-semantics.llvm')

    with _preprocessed(program) as input_file:
        proc_res = _krun(definition_dir=definition_dir, input_file=input_file, check=False)

    status = proc_res.returncode
    out = proc_res.stderr if status else proc_res.stdout
    file = sys.stderr if status else sys.stdout

    print(out, end='', file=file, flush=True)
    sys.exit(status)


@contextmanager
def _preprocessed(program: Path) -> Iterator[Path]:
    program_text = program.read_text()
    with NamedTemporaryFile() as f:
        tmp_file = Path(f.name)
        tmp_file.write_text(preprocess(program_text))
        yield tmp_file


def _argument_parser() -> ArgumentParser:
    parser = ArgumentParser(prog='kwasm')
    command_parser = parser.add_subparsers(dest='command', required=True)

    run_parser = command_parser.add_parser('run', help='run a WebAssembly program')
    run_parser.add_argument('program', metavar='PROGRAM', type=file_path, help='path to WebAssembly program')

    command_parser.add_parser('kast', help='parse a WebAssembly program and output it in a supported format')
    command_parser.add_parser('prove', help='run a WebAssembly K proof')
    command_parser.add_parser('help', help='display help message')
    command_parser.add_parser('version', help='display the KWasm, K, Kore, and Z3 versions in use')

    return parser


if __name__ == '__main__':
    main()
