# This script is not used during runtime.
# It just helps converting a conformance test to a test that we can use by removing unsupported functions and converting hexfloat to normal float.
# example usage: python convert.py f32.wast

import re
import sys


def hex2float(h):
    print(h)
    if "nan" in h:
        return h.replace("nan", "NaN")
    elif "inf" in h:
        return h.replace("inf", "Infinity")
    elif "0x" not in h:
        return h
    else:
        return h.split()[0] + " " + "%e" % (float.fromhex(h.split()[1]))


def main():
    filename = sys.argv[1]
    infile = "tests/wasm-tests/test/core/%s" % filename
    outfile = open("tests/simple/%s-c.%s" % tuple(filename.split(".")), "w")
    unsupported = ["nan:", "reinterpret",
                   "assert_return_canonical_nan", "assert_return_arithmetic_nan", "assert_invalid", "assert_malformed"]
    for line in (open(infile).readlines()):
        if any(x in line for x in unsupported):
            outfile.write(";; "+line)
        else:
            outfile.write(re.sub(r"(?:(?:f32|f64)\.const )([^\)]+)",
                                 lambda m: hex2float(m.group()), line))
    outfile.write("\n#clearConfig\n")


if __name__ == "__main__":
    main()
