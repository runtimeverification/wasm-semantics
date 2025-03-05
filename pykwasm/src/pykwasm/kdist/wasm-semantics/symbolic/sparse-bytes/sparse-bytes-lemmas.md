```k
requires "get-bytes-range-lemmas.md"
requires "get-range-lemmas.md"
requires "common-sparse-bytes-lemmas.md"
requires "replace-at-lemmas.md"
requires "set-range-lemmas.md"
requires "sparse-bytes-lemmas-basic.md"
requires "substr-sparse-bytes-lemmas.md"

module SPARSE-BYTES-LEMMAS
    imports private COMMON-SPARSE-BYTES-LEMMAS
    imports private GET-BYTES-RANGE-LEMMAS
    imports private GET-BYTES-RANGE-LEMMAS-BASIC
    imports private GET-RANGE-LEMMAS
    imports private GET-RANGE-LEMMAS-BASIC
    imports private REPLACE-AT-LEMMAS
    imports private REPLACE-AT-LEMMAS-BASIC
    imports private SET-RANGE-LEMMAS
    imports private SET-RANGE-LEMMAS-BASIC
    imports private SPARSE-BYTES-LEMMAS-BASIC
    imports private SPARSE-BYTES-LEMMAS-BASIC-SYMBOLIC
    imports private SUBSTR-SPARSE-BYTES-LEMMAS
    imports private SUBSTR-SPARSE-BYTES-LEMMAS-BASIC
endmodule

```