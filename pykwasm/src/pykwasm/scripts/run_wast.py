"""Run a WebAssembly spec test (`.wast`) file through the binary front end.

This is the command-line counterpart to `test_conformance.py`: it converts `wast_file` with
`wast2json`, translates the resulting commands into KWasm embedder statements, runs them with
the LLVM backend, and prints the final configuration as a kore term on stdout.
"""

from __future__ import annotations

import sys
from argparse import ArgumentParser
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import TYPE_CHECKING

from pyk.cli.utils import dir_path, file_path
from pyk.kast.inner import KSequence, KSort, Subst
from pyk.kast.manip import split_config_from
from pyk.kdist import kdist
from pyk.ktool.krun import KRun

import pykwasm.kwasm_ast as wast
from pykwasm.wast2kast import Wast2KastError, run_wast2json, wast2kast

if TYPE_CHECKING:
    from pyk.kast import KInner
    from pyk.kore.syntax import Pattern


def main() -> None:
    args = _argument_parser().parse_args()

    krun = KRun(args.llvm_dir) if args.llvm_dir is not None else KRun(kdist.get('wasm-semantics.llvm'))

    with TemporaryDirectory() as tmp_dir:
        tmp_path = Path(tmp_dir)
        try:
            json_path = run_wast2json(args.wast_file, tmp_path, wast2json=args.wast2json)
        except Wast2KastError as err:
            print(err, file=sys.stderr)
            sys.exit(1)
        translated = wast2kast(json_path)

    for skipped in translated.skipped:
        print(f'skipping line {skipped.line}: {skipped.command} ({skipped.reason})', file=sys.stderr)

    result_kore = _run(krun, translated.stmts, depth=args.depth)

    if args.output == 'kore':
        print(result_kore.text)
    else:
        result_kast = krun.kore_to_kast(result_kore)
        print(krun.pretty_print(result_kast))


def _run(krun: KRun, stmts: list[KInner], *, depth: int | None) -> Pattern:
    # See `test_conformance._run` for why the program is loaded into `<instrs>` directly instead
    # of going through `<k>`.
    sys.setrecursionlimit(max(sys.getrecursionlimit(), 100_000))

    config_kast = krun.definition.init_config(KSort('GeneratedTopCell'))
    symbolic_config, init_subst = split_config_from(config_kast)

    init_subst['INSTRS_CELL'] = KSequence([wast.INIT_SPECTEST_MODULE, *stmts])
    init_subst['K_CELL'] = KSequence()
    config_with_program = Subst(init_subst)(symbolic_config)

    config_kore = krun.kast_to_kore(config_with_program, KSort('GeneratedTopCell'))
    return krun.run_pattern(config_kore, depth=depth)


def _argument_parser() -> ArgumentParser:
    parser = ArgumentParser(prog='kwasm-run-wast', description='run a WebAssembly spec test (.wast) file')
    parser.add_argument('wast_file', metavar='WAST_FILE', type=file_path, help='path to .wast file')
    parser.add_argument(
        '--llvm-dir', dest='llvm_dir', metavar='LLVM_DIR', type=dir_path, help='existing LLVM kompiled directory'
    )
    parser.add_argument(
        '--wast2json', dest='wast2json', metavar='WAST2JSON', default='wast2json', help='wast2json executable to use'
    )
    parser.add_argument('--depth', dest='depth', metavar='DEPTH', type=int, help='maximum number of steps to take')
    parser.add_argument(
        '--output',
        dest='output',
        metavar='FORMAT',
        choices=('kore', 'pretty'),
        default='kore',
        help='format to output the final configuration in (default: kore)',
    )
    return parser


if __name__ == '__main__':
    main()
