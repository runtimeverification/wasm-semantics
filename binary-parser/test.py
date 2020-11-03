#!/usr/bin/env python3

import wasm2kast
import pyk
import sys

WASM_definition_llvm_no_coverage_dir = '.build/defn/llvm'

def config_to_kast_term(config):
    return { 'format' : 'KAST', 'version': 1, 'term': config }

def run_module(parsed_module):
    input_json = config_to_kast_term(parsed_module)
    krun_args = [ '--term', '--debug']
    (rc, new_wasm_config, err) = pyk.krunJSON(WASM_definition_llvm_no_coverage_dir, input_json, krunArgs = krun_args, teeOutput=True)
    if rc != 0:
        raise Exception("Received error while running: " + err )

def pykPrettyPrint(module):
    WASM_definition_llvm_no_coverage_dir = '.build/defn/llvm'
    WASM_definition_main_file = 'test'
    WASM_definition_llvm_no_coverage = pyk.readKastTerm(WASM_definition_llvm_no_coverage_dir + '/' + WASM_definition_main_file + '-kompiled/compiled.json')
    WASM_symbols_llvm_no_coverage = pyk.buildSymbolTable(WASM_definition_llvm_no_coverage)
    print(pyk.prettyPrintKast(module, WASM_symbols_llvm_no_coverage))

sys.setrecursionlimit(1500000000)

if __name__ == "__main__":
    module = wasm2kast.main()
    pykPrettyPrint(module)
    run_module(module)
