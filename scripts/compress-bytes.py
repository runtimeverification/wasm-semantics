#!/usr/bin/env python3

import fileinput

def isIdentifierChar(c):
    return c.isalpha() or c.isdigit() or c in '$#_\''

class BytesCompressor:
    ( START
    , SLASH
    , LINE_COMMENT
    , MULTILINE_COMMENT
    , MULTILINE_COMMENT_STAR
    , STRING
    , STRING_QUOTE
    , IDENTIFIER
    , B
    , BYTES
    , BYTES_QUOTE
    ) = range(0, 11)

    def __init__(self):
        self.__state = BytesCompressor.START

    def addLine(self, line):
        line_chunks = []
        def startTransition(c):
            if c == '/':
                return BytesCompressor.SLASH
            elif c == '"':
                return BytesCompressor.STRING
            elif c == 'b':
                return BytesCompressor.B
            elif isIdentifierChar(c):
                return BytesCompressor.IDENTIFIER
            else:
                return BytesCompressor.START
        start = 0
        for idx in range(0, len(line)):
            c = line[idx]
            if self.__state == BytesCompressor.START:
              self.__state = startTransition(c)
            elif self.__state == BytesCompressor.SLASH:
                if c == '/':
                    self.__state = BytesCompressor.LINE_COMMENT
                elif c == '*':
                    self.__state = BytesCompressor.MULTILINE_COMMENT
                else:
                    self.__state = startTransition(c)
            elif self.__state == BytesCompressor.LINE_COMMENT:
                pass
            elif self.__state == BytesCompressor.MULTILINE_COMMENT:
                if c == '*':
                    self.__state = BytesCompressor.MULTILINE_COMMENT_STAR
            elif self.__state == BytesCompressor.MULTILINE_COMMENT_STAR:
                if c == '*':
                    pass
                elif c == '/':
                    self.__state = BytesCompressor.START
                else:
                    self.__state = BytesCompressor.MULTILINE_COMMENT
            elif self.__state == BytesCompressor.STRING:
                if c == '"':
                    self.__state = BytesCompressor.START
                elif c == '\\':
                    self.__state = BytesCompressor.STRING_QUOTE
            elif self.__state == BytesCompressor.STRING_QUOTE:
                self.__state = BytesCompressor.STRING
            elif self.__state == BytesCompressor.IDENTIFIER:
                if not isIdentifierChar(c):
                    self.__state = startTransition(c)
            elif self.__state == BytesCompressor.B:
                if c == '"':
                    self.__state = BytesCompressor.BYTES
                    line_chunks.append(line[start:idx - 1])
                    start = idx + 1
                elif isIdentifierChar(c):
                    self.__state = BytesCompressor.IDENTIFIER
                else:
                    self.__state = startTransition(c)
            elif self.__state == BytesCompressor.BYTES:
                if c == '"':
                    self.__state = BytesCompressor.START
                    self.__filterBytes(line[start:idx], line_chunks)
                    start = idx + 1
                elif c == '\\':
                    self.__state = BytesCompressor.BYTES_QUOTE
            elif self.__state == BytesCompressor.BYTES_QUOTE:
                self.__state = BytesCompressor.BYTES
            else:
                assert False, self.__state

        if self.__state == BytesCompressor.START:
            pass
        elif self.__state == BytesCompressor.SLASH:
            self.__state = BytesCompressor.START
        elif self.__state == BytesCompressor.LINE_COMMENT:
            self.__state = BytesCompressor.START
        elif self.__state == BytesCompressor.MULTILINE_COMMENT:
            pass
        elif self.__state == BytesCompressor.MULTILINE_COMMENT_STAR:
            self.__state = BytesCompressor.MULTILINE_COMMENT
        elif self.__state == BytesCompressor.STRING:
            assert False
        elif self.__state == BytesCompressor.STRING_QUOTE:
            assert False
        elif self.__state == BytesCompressor.IDENTIFIER:
            self.__state = BytesCompressor.START
        elif self.__state == BytesCompressor.B:
            self.__state = BytesCompressor.START
        elif self.__state == BytesCompressor.BYTES:
            assert False
        elif self.__state == BytesCompressor.BYTES_QUOTE:
            assert False
        else:
            assert False, self.__state

        if not line_chunks:
            return [line]
        line_chunks.append(line[start:])
        return [''.join(line_chunks)]
    
    def end(self):
        assert self.__state == BytesCompressor.START, self.__state
        return []

    def __filterBytes(self, bytes, line_chunks):
        start = bytes.find('\\x00', 0)
        if start < 0:
            line_chunks.append('b"')
            line_chunks.append(bytes)
            line_chunks.append('"')
            return
        zeros = []
        while start >= 0:
            idx = start + 1
            next = bytes.find('\\x00', idx)
            while next == idx + 3:
                idx = next + 1
                next = bytes.find('\\x00', idx)
            zeros.append((start, idx + 3))
            start = next
        zeros = [(start, end) for (start, end) in zeros if end - start > 100]
        if not zeros:
            line_chunks.append('b"')
            line_chunks.append(bytes)
            line_chunks.append('"')
            return
        keep = []
        last_end = 0
        for (start, end) in zeros:
            if start > last_end:
                keep.append((last_end, start))
            last_end = end
        if last_end < len(bytes):
            keep.append((last_end, len(bytes)))

        for (_start, _end) in keep:
            line_chunks.append('#setBytesRange ( ')
        line_chunks.append('.Bytes')
        for (start, end) in keep:
            line_chunks.append(', ')
            line_chunks.append(str(start))
            line_chunks.append(', b"')
            line_chunks.append(bytes[start:end])
            line_chunks.append('" )')

def main():
    filter = BytesCompressor()
    for line in fileinput.input():
        for l in filter.addLine(line.rstrip()):
            print(l)
    for l in filter.end():
        print(l)

if __name__ == '__main__':
    main()

