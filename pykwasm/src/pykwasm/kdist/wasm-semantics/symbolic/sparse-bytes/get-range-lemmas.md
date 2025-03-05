```k

module GET-RANGE-LEMMAS-BASIC
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX
    imports GET-BYTES-RANGE-LEMMAS-BASIC
endmodule

module GET-RANGE-LEMMAS  [symbolic]
    imports GET-RANGE-LEMMAS-BASIC

    rule #getRange(SB, Addr:Int, Width:Int)
        => Bytes2Int(unwrap(extractSparseBytes(getBytesRange, SB, Addr, Width)), LE, Unsigned)
        requires Addr <Int size(SB)
             andBool 0 <Int Width andBool 0 <=Int Addr
        [simplification]
    rule #getRange(SB, Addr:Int, Width:Int)
        => 0
        requires size(SB) <=Int Addr 
             andBool 0 <Int Width andBool 0 <=Int Addr
        [simplification]

endmodule
```