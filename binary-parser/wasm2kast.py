import sys
import json
import kwasm_ast as a

from wasm.parsers.module import parse_module, Module


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
    return a.module()

if __name__ == "__main__":
    main()
