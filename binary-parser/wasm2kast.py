import sys
import pyk
import json
import kwasm_ast as labels

from wasm.parsers.module import parse_module, Module

from pyk.kast import KSequence, KConstant, KApply, KToken

def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1], 'rb')
    module = wasm2kast(infile)
    infile.close()
    return module


def wasm2kast(wasm_bytes : bytes) -> dict:
    """Returns a dictionary representing the Kast JSON."""
    ast = parse_module(wasm_bytes)
    return ast2kast(ast)


def ast2kast(wasm_ast : Module) -> dict:
    """Returns a dictionary representing the Kast JSON."""
    return KApply(labels.MODULE, [KApply(labels.EMPTY_DEFNS, [])] * 10 + [KApply(labels.MODULE_METADATA, [KApply(labels.EMPTY_ID, []), KApply(labels.EMPTY_MAP, [])])])


if __name__ == "__main__":
    main()
