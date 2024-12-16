#!/usr/bin/env python3

"""
This library provides a translation from the Wasm binary format to Kast.
"""

from __future__ import annotations

import os
import subprocess
import sys
from io import BytesIO
from pathlib import Path

from pyk.kast.inner import KSequence, KSort, KToken, Subst
from pyk.kast.manip import split_config_from
from pyk.ktool.krun import KRun

from .wasm2kore import PatternWriter, wasm2kast


def main():
    # read env vars
    debug = 'DEBUG' in os.environ

    # check arg count
    if len(sys.argv) < 3:
        print('usage: [DEBUG=1] run_wasm <llvm_dir> <wasm_file> [-cellname:sort=cellvalue...]')
        sys.exit(1)
    args = sys.argv[1:]

    # parse fixed args
    llvm_dir = Path(args[0])
    wasm_file = Path(args[1])
    infile = open(wasm_file, 'rb')

    def build_subst_key(key_name):
        return key_name.upper() + '_CELL'

    # parse extra args
    config_subst = {}
    extra_args = args[2:]
    for arg in extra_args:
        if arg[0] != '-':
            raise ValueError(f'substitution argument was ill-formed: {arg!r}')
        prekey_sort, val = arg[1:].split('=')
        prekey, sort = prekey_sort.split(':')
        key = build_subst_key(prekey)

        if key == 'k':
            raise ValueError("substitution may not contain a 'k' key")
        if key in config_subst:
            raise ValueError(f'redundant key found in substitution map: {prekey}')

        if sort == 'String':
            val = '"' + f'{val}' + '"'
        config_subst[key] = KToken(val, sort)

    # parse module as binary (with fallback to textual parser)
    try:
        module = wasm2kast(infile)
    except Exception:
        proc_res = subprocess.run(['wat2wasm', wasm_file, '--output=/dev/stdout'], check=True, capture_output=True)
        infile.close()
        infile = BytesIO(proc_res.stdout)
        module = wasm2kast(infile)
        infile.close()

    # get runner
    runner = KRun(llvm_dir)

    # embed parsed_module to <k>
    top_sort = KSort('GeneratedTopCell')
    config_kast = runner.definition.init_config(top_sort)
    symbolic_config, init_subst = split_config_from(config_kast)
    init_subst['K_CELL'] = KSequence(module)

    # check substitution keys
    ulm_keys = {'GAS_CELL', 'ENTRY_CELL', 'CREATE_CELL'}
    if ulm_keys.issubset(init_subst.keys()) and not ulm_keys.issubset(config_subst.keys()):
        raise ValueError(
            f'ULM Wasm detected but required substition keys for these cells are missing: {ulm_keys - config_subst.keys()}'
        )

    # update config substitution
    final_subst = init_subst | config_subst

    # apply substitution to config
    config_with_module = Subst(final_subst)(symbolic_config)

    # convert the config to kore
    config_kore = runner.kast_to_kore(config_with_module, top_sort)

    # monkey patch kore
    patched_config_kore = PatternWriter(config_kore)

    # log input kore
    if debug:
        with open(wasm_file.name + '.input.kore', 'w') as f:
            patched_config_kore.write(f)

    # run the config
    proc_data = runner.run_process(patched_config_kore, term=True, expand_macros=False)

    # print the result
    print(proc_data.stdout)
    if proc_data.returncode != 0 or debug:
        print(proc_data.stderr, file=sys.stderr)
    proc_data.check_returncode()
