import sys
from wasm.parsers.module import parse_module


def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1], 'rb')
    wasm2kast(infile)
    infile.close()
    return 0


def wasm2kast(wasm_bytes : bytes):
    ast = parse_module(wasm_bytes)
    return None


if __name__ == "__main__":
    main()
