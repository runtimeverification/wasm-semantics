# Preprocessor that converts Wasm concrete syntax into a form parseable by K.
# example usage: python convert.py f32.wast

import re
import sys


def hex2float(h):
    if "nan" in h:
        return h.replace("nan", "NaN")
    elif "inf" in h:
        return h.replace("inf", "Infinity")
    elif "0x" not in h:
        return h
    else:
        return h.split()[0] + " " + "%e" % (float.fromhex(h.split()[1]))


def main():
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1])
    for line in (infile.readlines()):
        sys.stdout.write(re.sub(r"(?:(?:f32|f64)\.const )([^\)]+)",
                             lambda m: hex2float(m.group()),
                             line))
    infile.close()

if __name__ == "__main__":
    main()
