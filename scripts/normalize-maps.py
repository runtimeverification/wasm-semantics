#!/usr/bin/env python3

import fileinput

def main():
    for line in fileinput.input():
        if '|->' in line:
            idx = 0
            while line[idx].isspace():
                idx += 1
            print(f"{line[:idx]}({line.strip()})")
        else:
            print(line.rstrip())

if __name__ == '__main__':
    main()
