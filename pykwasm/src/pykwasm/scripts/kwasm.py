from __future__ import annotations

import sys
from argparse import ArgumentParser
from contextlib import contextmanager
from enum import Enum
from pathlib import Path
from tempfile import NamedTemporaryFile
from typing import TYPE_CHECKING

from pyk.cli.utils import dir_path, file_path
from pyk.kdist import kdist
from pyk.ktool.kprint import KAstOutput, _kast
from pyk.ktool.kprove import _kprove
from pyk.ktool.krun import _krun
from pyk.utils import run_process

from .preprocessor import preprocess

if TYPE_CHECKING:
    from collections.abc import Container, Iterable, Iterator
    from subprocess import CompletedProcess


SCRIPT_FILE = Path(__file__).parent / 'kwasm.sh'


class ProofDefinition(Enum):
    KWASM_LEMMAS = 'kwasm-lemmas'
    WRC20 = 'wrc20'


def main() -> None:
    parser = _argument_parser()
    args, rest = parser.parse_known_args()

    if args.command == 'run':
        _exec_run(program=args.program)
    elif args.command == 'kast':
        _exec_kast(program=args.program, output=args.output)
    elif args.command == 'prove':
        _exec_prove(spec_file=args.spec, proof_defn=args.defn, include_dirs=args.include_dirs, args=rest)
    else:
        proc_res = run_process(['bash', str(SCRIPT_FILE)] + sys.argv[1:], pipe_stdout=False, check=False)
        sys.exit(proc_res.returncode)

    raise AssertionError()


def _exec_run(program: Path) -> None:
    definition_dir = kdist.get('wasm-semantics.llvm')

    with _preprocessed(program) as input_file:
        proc_res = _krun(definition_dir=definition_dir, input_file=input_file, check=False)

    _exit_with_output(proc_res)


def _exec_kast(program: Path, output: KAstOutput | None) -> None:
    definition_dir = kdist.get('wasm-semantics.llvm')

    with _preprocessed(program) as input_file:
        proc_res = _kast(input_file, definition_dir=definition_dir, output=output, check=False)

    _exit_with_output(proc_res)


def _exec_prove(
    spec_file: Path,
    proof_defn: ProofDefinition,
    include_dirs: Iterable[Path] | None,
    args: Iterable[str],
) -> None:
    definition_dir = kdist.get(f'wasm-semantics.{proof_defn.value}')
    proc_res = _kprove(
        spec_file,
        kompiled_dir=definition_dir,
        include_dirs=include_dirs or (),
        args=args,
        check=False,
    )
    _exit_with_output(proc_res, normal_status=(0, 1))


@contextmanager
def _preprocessed(program: Path) -> Iterator[Path]:
    program_text = program.read_text()
    with NamedTemporaryFile() as f:
        tmp_file = Path(f.name)
        tmp_file.write_text(preprocess(program_text))
        yield tmp_file


def _exit_with_output(cp: CompletedProcess, *, normal_status: Container[int] | None = None) -> None:
    status = cp.returncode
    normal_status = normal_status or (0,)
    err = status not in normal_status
    out = cp.stderr if err else cp.stdout
    file = sys.stderr if err else sys.stdout
    print(out, end='', file=file, flush=True)
    sys.exit(status)


def _argument_parser() -> ArgumentParser:
    parser = ArgumentParser(prog='kwasm')
    command_parser = parser.add_subparsers(dest='command', required=True)

    run_parser = command_parser.add_parser('run', help='run a WebAssembly program')
    run_parser.add_argument('program', metavar='PROGRAM', type=file_path, help='path to WebAssembly program')

    kast_parser = command_parser.add_parser(
        'kast', help='parse a WebAssembly program and output it in a supported format'
    )
    kast_parser.add_argument('program', metavar='PROGRAM', type=file_path, help='path to WebAssembly program')
    kast_parser.add_argument('--output', metavar='FORMAT', type=KAstOutput, help='format to output the term in')

    prove_parser = command_parser.add_parser('prove', help='run a WebAssembly K proof')
    prove_parser.add_argument('spec', metavar='SPEC', type=file_path, help='K specification to be proved')
    prove_parser.add_argument('defn', metavar='DEFN', type=ProofDefinition, help='proof definition')
    prove_parser.add_argument(
        '-I', dest='include_dirs', metavar='INCLUDE', action='append', type=dir_path, help='include path'
    )

    command_parser.add_parser('help', help='display help message')
    command_parser.add_parser('version', help='display the KWasm, K, Kore, and Z3 versions in use')

    return parser


if __name__ == '__main__':
    main()
