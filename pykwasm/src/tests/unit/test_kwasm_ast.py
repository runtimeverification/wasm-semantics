import pytest

from pykwasm.kwasm_ast import KBytes

KBYTES_TEST_DATA = (
    (bytes([0x0, 0x41, 0xFF]), 'b"\\x00A\\xff"'),
    (bytes([]), 'b""'),
    (b'WASM', 'b"WASM"'),
    (b'foo\xaa\x01barbaz', 'b"foo\\xaa\\x01barbaz"'),
    (b'foo\xaabar\x01baz', 'b"foo\\xaabar\\x01baz"'),
    (b'abcdefghijklmnopqrstuvwxyz', 'b"abcdefghijklmnopqrstuvwxyz"'),
    (
        0x11223344556677889900AABBCCDDEEFF.to_bytes(length=16, byteorder='big'),
        'b"\\x11\\"3DUfw\\x88\\x99\\x00\\xaa\\xbb\\xcc\\xdd\\xee\\xff"',
    ),
)


@pytest.mark.parametrize(('input', 'expected'), KBYTES_TEST_DATA)
def test_kbytes(input: bytes, expected: str) -> None:
    # When
    t = KBytes(input)
    # How KToken stores the string may change. Check the serialized string instead of t.token
    t_dict = t.to_dict()

    # Then
    assert t_dict['token'] == expected
    assert t_dict['sort']['name'] == 'Bytes'
