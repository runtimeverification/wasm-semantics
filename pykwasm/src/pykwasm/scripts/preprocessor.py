# Preprocessor that converts Wasm concrete syntax into a form parseable by K.
# example usage: kwasm-preprocess f32.wast

import re
import sys


def hex2float(h: str) -> str:
    h = re.sub('_', '', h)
    if 'nan' in h:
        # TODO: Keep bit pattern of float, don't turn all of them into simple NaNs.
        return re.sub('-?nan(:.*$)?', 'NaN', h)
    elif 'inf' in h:
        return h.replace('inf', 'Infinity')
    elif '0x' in h:
        try:
            return h.split()[0] + ' ' + '%e' % (float.fromhex(h.split()[1]))
        except OverflowError:
            return h
        except ValueError:
            return h
    else:
        return h


def main() -> None:
    if len(list(sys.argv)) == 1:
        infile = sys.stdin
    else:
        infile = open(sys.argv[1])

    def replace(m: re.Match) -> str:
        return hex2float(m.group())

    for line in infile.readlines():
        sys.stdout.write(re.sub(r'(?:(?:f32|f64)\.const )([^\)]+)', replace, line))

    infile.close()


if __name__ == '__main__':
    main()
