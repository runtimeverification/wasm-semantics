```k
requires "arithmetic-normalization.md"
requires "bit-normalization.md"
requires "common.md"

module WASM-INT-SYMBOLIC
    imports private WASM-INT-ARITHMETIC-NORMALIZATION
    imports private WASM-INT-BIT-NORMALIZATION-LEMMAS
    imports private WASM-INT-COMMON
endmodule

```