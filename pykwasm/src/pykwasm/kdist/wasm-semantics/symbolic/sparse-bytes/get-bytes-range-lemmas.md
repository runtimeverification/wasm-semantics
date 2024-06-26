```k
module GET-BYTES-RANGE-LEMMAS-BASIC
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX
    syntax SBGetFunction ::= "getBytesRange"
endmodule

module GET-BYTES-RANGE-LEMMAS  [symbolic]
    imports GET-BYTES-RANGE-LEMMAS-BASIC

    rule #getBytesRange(SB, Addr:Int, Width:Int)
        => unwrap(extractSparseBytes(getBytesRange, SB, Addr, Width))
        requires (0 <Int Addr orBool Addr +Int Width =/=Int size(SB))
             andBool Addr <Int size(SB)
             andBool 0 <Int Width andBool 0 <=Int Addr
        [simplification]
    rule extractSparseBytes(getBytesRange, SB, Addr, Width)
        => fromBytes(#getBytesRange(SB, Addr, Width))
        requires (Addr ==Int 0 andBool Addr +Int Width ==Int size(SB))
             orBool size(SB) <=Int Addr
        [simplification]
endmodule

```