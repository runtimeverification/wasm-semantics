```k
module REPLACE-AT-LEMMAS-BASIC
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

    syntax SBSetFunction ::= replaceAt(value:Bytes)
endmodule

module REPLACE-AT-LEMMAS  [symbolic]
    imports REPLACE-AT-LEMMAS-BASIC

    rule functionSparseBytesWellDefined(
            replaceAt(_Val:Bytes), Addr:Int, Width:Int
        )
        => 0 <=Int Addr andBool 0 <Int Width
    rule updateSparseBytesSize(
            replaceAt(Val:Bytes), SBSize:Int, Addr:Int, Width:Int
        )
        => maxInt(SBSize, Addr +Int Width)
        requires functionSparseBytesWellDefined(
            replaceAt(Val:Bytes), Addr, Width
        )
    rule getReplacementSparseBytes(
            replaceAt(Value:Bytes), Addr:Int, Width:Int
        )
        => SBChunk(#bytes(Value))
        requires functionSparseBytesWellDefined(
                replaceAt(Value:Bytes), Addr, Width
            )
          andBool Width ==Int lengthBytes(Value)

    rule replaceAt(SB:SparseBytes, Addr:Int, Value:Bytes)
        => updateSparseBytes(
              replaceAt(Value), SB, Addr, lengthBytes(Value)
          )
        requires functionSparseBytesWellDefined(
              replaceAt(Value), Addr, lengthBytes(Value)
          )
      [simplification, symbolic(SB)]
    rule replaceAt(SB:SparseBytes, Addr:Int, Value:Bytes)
        => updateSparseBytes(
              replaceAt(Value), SB, Addr, lengthBytes(Value)
          )
        requires functionSparseBytesWellDefined(
              replaceAt(Value), Addr, lengthBytes(Value)
          )
      [simplification, symbolic(Addr)]
    rule replaceAt(SB:SparseBytes, Addr:Int, Value:Bytes)
        => updateSparseBytes(
              replaceAt(Value), SB, Addr, lengthBytes(Value)
          )
        requires functionSparseBytesWellDefined(
              replaceAt(Value), Addr, lengthBytes(Value)
          )
      [simplification, symbolic(Value)]

    rule updateSparseBytes(
              replaceAt(Value), SB, Addr, Width
          )
        => replaceAt(SB, Addr, Value)
        requires functionSparseBytesWellDefined(
              replaceAt(Value), Addr, Width
          )
          andBool Width ==Int lengthBytes(Value)
      [simplification, concrete]

    rule updateSparseBytes(
              replaceAt(Value), SB, 0, Width
          )
        => SBChunk(#bytes(Value))
        requires functionSparseBytesWellDefined(
              replaceAt(Value), 0, Width
          )
          andBool Width ==Int lengthBytes(Value)
          andBool Width ==Int size(SB)
      [simplification]

endmodule

```