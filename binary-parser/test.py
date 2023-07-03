#!/usr/bin/env python3

from pathlib import Path
import wasm2kast
from pyk.ktool.krun import KRun
from pyk.kast.inner import KInner, KSort, KSequence, Subst
from pyk.kast.manip import split_config_from
import sys

WASM_definition_llvm_no_coverage_dir = Path('.build/defn/llvm/test-kompiled')


def config_to_kast_term(config):
    return { 'format' : 'KAST', 'version': 2, 'term': config.to_dict() }

def run_module(parsed_module: KInner):

    try:
      krun = KRun(WASM_definition_llvm_no_coverage_dir)
      
      # Create an initial config
      config_kast = krun.definition.init_config(KSort('GeneratedTopCell'))

      # Embed parsed_module to <k>
      symbolic_config, init_subst = split_config_from(config_kast)
      init_subst['K_CELL'] = KSequence(parsed_module)
      config_with_module = Subst(init_subst)(symbolic_config)
      
      # Convert the config to kore
      config_kore = krun.kast_to_kore(config_with_module, KSort('GeneratedTopCell'))

      # Run the config
      krun.run_kore_term(config_kore)
  
    except Exception as e:
        raise Exception(f'Received error while running') from e

sys.setrecursionlimit(1500000000)

if __name__ == "__main__":
    module = wasm2kast.main()
    run_module(module)
