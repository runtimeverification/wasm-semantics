#!/usr/bin/env python3

"""
This library provides a translation from the Wasm binary format to Kast.
"""

from __future__ import annotations

import sys
from typing import TYPE_CHECKING

from .binary import parse_module

if TYPE_CHECKING:
    from typing import IO

    from pyk.kast import KInner


def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1], 'rb')
    module = wasm2kast(infile)
    infile.close()
    return module


def wasm2kast(wasm_bytes: IO[bytes], filename=None) -> KInner:
    """
    Parse a WebAssembly binary module into its corresponding KAST representation.

    Args:
        wasm_bytes: A binary IO stream containing the WebAssembly module bytes.
        filename: Optional filename associated with the module. Currently unused.

    Returns:
        A KAST term of sort `ModuleDecl` representing the parsed WebAssembly module.
    """
    return parse_module(wasm_bytes)
