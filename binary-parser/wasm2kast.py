import sys

from ast import *


def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1], 'rb')
    wasm2kast(infile)
    infile.close()
    return 0


def wasm2kast(wasm_bytes : bytes):
    ast = wasm2ast(wasm_bytes)
    return None


def wasm2ast(wasm_bytes : bytes) -> Module :
    magic = wasm_bytes.read(4)
    assert magic == b'\x00asm', magic
    version = wasm_bytes.read(4)
    print(version)
    assert version == b'\x01\x00\x00\x00', version

    remainder = wasm_bytes.peek()
    assert remainder == b'', remainder
    return Module()


if __name__ == "__main__":
    main()
