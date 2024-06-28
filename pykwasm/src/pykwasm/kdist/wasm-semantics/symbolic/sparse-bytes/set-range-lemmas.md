```k
module SET-RANGE-LEMMAS-BASIC
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

    syntax SBSetFunction ::= setRange(value:Int)
endmodule

module SET-RANGE-LEMMAS  [symbolic]
    imports SET-RANGE-LEMMAS-BASIC

    rule functionSparseBytesWellDefined(
            setRange(Val:Int), Addr:Int, Width:Int
        )
        => #setRangeActuallySets(Addr, Val, Width)
    rule updateSparseBytesSize(
            setRange(Val:Int), SBSize:Int, Addr:Int, Width:Int
        )
        => maxInt(SBSize, Addr +Int Width)
        requires #setRangeActuallySets(Addr, Val, Width)
    rule getReplacementSparseBytes(
            setRange(Value:Int), Addr:Int, Width:Int
        )
        => SBChunk(#bytes(Int2Bytes(Width, Value, LE)))
        requires #setRangeActuallySets(Addr, Value, Width)

    rule #setRange(SB:SparseBytes, Addr:Int, Value:Int, Width:Int)
        => updateSparseBytes(
              setRange(Value), SB, Addr, Width
          )
        requires functionSparseBytesWellDefined(
              setRange(Value), Addr, Width
          )
      [simplification]

    rule updateSparseBytes(setRange(Value:Int), SBChunk(#bytes(A)), Start:Int, Width:Int)
        => SBChunk(#bytes(replaceAtBytes(A, Start, Int2Bytes(Width, Value, LE))))
        requires functionSparseBytesWellDefined(setRange(Value), Start, Width)
            andBool Start +Int Width <=Int lengthBytes(A)
        [simplification, concrete(A)]

    rule updateSparseBytes(setRange(Value:Int), SBChunk(#empty(A)), Start:Int, Width:Int)
        => SBChunk(#empty(Start))
          updateSparseBytes(setRange(Value), SBChunk(#empty(A -Int Start)), 0, Width)
        requires functionSparseBytesWellDefined(setRange(Value), Start, Width)
            andBool Start +Int Width <=Int A
            andBool 0 <Int Start
        [simplification]
    rule updateSparseBytes(setRange(Value:Int), SBChunk(#empty(A)), 0, Width:Int)
        => concat(
              updateSparseBytes(setRange(Value), SBChunk(#empty(Width)), 0, Width),
              SBChunk(#empty(A -Int Width))
          )
        requires functionSparseBytesWellDefined(setRange(Value), 0, Width)
            andBool Width <Int A
        [simplification]
    rule updateSparseBytes(setRange(Value:Int), SBChunk(#empty(A)), 0, A)
        => SBChunk(#bytes(Int2Bytes(A, Value, LE)))
        requires functionSparseBytesWellDefined(setRange(Value), 0, A)
        [simplification]

    rule updateSparseBytes(setRange(Value:Int), .SparseBytes, 0, Width:Int)
        => SBChunk(#bytes(Int2Bytes(Width, Value, LE)))
        requires functionSparseBytesWellDefined(setRange(Value), 0, Width)
        [simplification]
    rule updateSparseBytes(setRange(Value:Int), .SparseBytes, Addr:Int, Width:Int)
        => SBChunk(#empty(Addr)) SBChunk(#bytes(Int2Bytes(Width, Value, LE)))
        requires 0 <Int Addr
          andBool functionSparseBytesWellDefined(setRange(Value), Addr, Width)
        [simplification]
    // TODO: This should be a general function based on
    // something like splitSparseBytesItemNoFunction
    rule updateSparseBytes(setRange(Value:Int), M:SparseBytes, 0, Width:Int)
        => SBChunk(#bytes(Int2Bytes(Width, Value, LE)))
          substrSparseBytes(M, Width, size(M))
        requires Width <Int size(M)
          andBool functionSparseBytesWellDefined(setRange(Value), 0, Width)
        [simplification]
    rule updateSparseBytes(setRange(Value:Int), M:SparseBytes, 0, Width:Int)
        => SBChunk(#bytes(Int2Bytes(Width, Value, LE)))
        requires size(M) <=Int Width
          andBool functionSparseBytesWellDefined(setRange(Value), 0, Width)
        [simplification]

    rule updateSparseBytes(setRange(Value:Int), M:SparseBytes, Addr, Width:Int)
        => concat(M, updateSparseBytes(setRange(Value:Int), .SparseBytes, Addr -Int size(M), Width:Int))
        requires size(M) <=Int Addr
          andBool 0 <Int size(M)
          andBool functionSparseBytesWellDefined(setRange(Value), Addr, Width)
        [simplification]

    rule updateSparseBytes(setRange(#getRange(M, Addr, Width)), M, Addr, Width) => M
        [simplification]

endmodule

```