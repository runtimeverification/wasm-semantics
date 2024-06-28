```k

module SPARSE-BYTES-LEMMAS-BASIC
    imports SPARSE-BYTES
    imports WASM-DATA-COMMON

    syntax SparseBytes ::= concat(SparseBytes, SparseBytes)  [function, total, symbol(concatSparseBytes)]
    rule concat(.SparseBytes, A:SparseBytes) => A
    rule concat(A:SBItemChunk B:SparseBytes, C:SparseBytes) => merge(A, concat(B, C))

    syntax SparseBytes ::= merge(SBItemChunk, SparseBytes)  [function, total, symbol(mergeSparseBytes)]
    rule merge(SBChunk(#bytes(A)), SBChunk(#bytes(B)) C:SparseBytes) => SBChunk(#bytes(A +Bytes B)) C
    rule merge(SBChunk(#empty(A)), SBChunk(#empty(B)) C:SparseBytes) => SBChunk(#empty(A +Int B)) C
    rule merge(SBChunk(#bytes(A)), SBChunk(#empty(B)) C:SparseBytes) => SBChunk(#bytes(A)) SBChunk(#empty(B)) C
    rule merge(SBChunk(#empty(A)), SBChunk(#bytes(B)) C:SparseBytes) => SBChunk(#empty(A)) SBChunk(#bytes(B)) C
    rule merge(SBChunk(#bytes(A)), .SparseBytes) => SBChunk(#bytes(A)) .SparseBytes
    rule merge(SBChunk(#empty(A)), .SparseBytes) => SBChunk(#empty(A)) .SparseBytes

    syntax Bool ::= #setRangeActuallySets(addr:Int, val:Int, width:Int)  [function, total]
    rule #setRangeActuallySets(Addr:Int, Val:Int, Width:Int)
        => 0 <Int Width andBool 0 <=Int Val andBool 0 <=Int Addr

    syntax Bool ::= disjontRangesSimple(start1:Int, len1:Int, start2:Int, len2:Int)  [function, total]
    rule disjontRangesSimple(Start1:Int, Len1:Int, Start2:Int, Len2:Int)
        => (Start1 +Int Len1 <=Int Start2)
          orBool (Start2 +Int Len2 <=Int Start1)

    syntax Bool ::= disjontRanges(start1:Int, len1:Int, start2:Int, len2:Int)  [function, total]
    rule disjontRanges(Start1:Int, Len1:Int, Start2:Int, Len2:Int)
        => true
      requires disjontRangesSimple(Start1:Int, Len1:Int, Start2:Int, Len2:Int)
    rule disjontRanges(Start1:Int, Len1:Int, Start2:Int, Len2:Int)
        => false
      requires notBool disjontRangesSimple(Start1:Int, Len1:Int, Start2:Int, Len2:Int)

endmodule

module SPARSE-BYTES-LEMMAS-BASIC-SYMBOLIC  [symbolic]
    imports private CEILS-SYNTAX
    imports private SPARSE-BYTES-LEMMAS-BASIC

    rule concat(A, .SparseBytes) => A
        [simplification]
    rule concat(concat(A:SparseBytes, B:SparseBytes), C:SparseBytes) => concat(A, concat(B, C))
        [simplification]

    rule merge(SBChunk(#bytes(A)), merge(SBChunk(#bytes(B)), C)) => merge(SBChunk(#bytes(A +Bytes B)), C)
        [simplification]
    rule merge(SBChunk(#bytes(A)), merge(SBChunk(#empty(B)), C)) => SBChunk(#bytes(A)) merge(SBChunk(#empty(B)), C)
        [simplification]
    rule merge(SBChunk(#empty(A)), merge(SBChunk(#bytes(B)), C)) => SBChunk(#empty(A)) merge(SBChunk(#bytes(B)), C)
        [simplification]
    rule merge(SBChunk(#empty(A)), merge(SBChunk(#empty(B)), C)) => merge(SBChunk(#empty(A +Int B)), C)
        [simplification]

    rule concat(merge(A, B), C) => merge(A, concat(B, C))
        [simplification]

    rule disjontRanges
          ( (A1:Int modIntTotal M1:Int) +Int B1:Int, Len1:Int
          , (A2:Int modIntTotal M2:Int) +Int B2:Int, Len2:Int
          )
        => true
      requires
        ( ( (0 <=Int A1 andBool A1 <Int M1)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1 +Int B1, Len1, A2 +Int B2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1 +Int B1, Len1, A2 +Int M2 +Int B2, Len2)
              )
            )
          )
        orBool
          ( (0 -Int M1 <=Int A1 andBool A1 <Int 0)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1 +Int M1 +Int B1, Len1, A2 +Int B2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1 +Int M1 +Int B1, Len1, A2 +Int M2 +Int B2, Len2)
              )
            )
          )
        )
      [simplification]

    rule disjontRanges
          ( (A1:Int modIntTotal M1:Int), Len1:Int
          , (A2:Int modIntTotal M2:Int) +Int B2:Int, Len2:Int
          )
        => true
      requires
        ( ( (0 <=Int A1 andBool A1 <Int M1)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1, Len1, A2 +Int B2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1, Len1, A2 +Int M2 +Int B2, Len2)
              )
            )
          )
        orBool
          ( (0 -Int M1 <=Int A1 andBool A1 <Int 0)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1 +Int M1, Len1, A2 +Int B2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1 +Int M1, Len1, A2 +Int M2 +Int B2, Len2)
              )
            )
          )
        )
      [simplification]
    rule disjontRanges
          ( (A1:Int modIntTotal M1:Int) +Int B1:Int, Len1:Int
          , (A2:Int modIntTotal M2:Int), Len2:Int
          )
        => true
      requires
        ( ( (0 <=Int A1 andBool A1 <Int M1)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1 +Int B1, Len1, A2 , Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1 +Int B1, Len1, A2 +Int M2, Len2)
              )
            )
          )
        orBool
          ( (0 -Int M1 <=Int A1 andBool A1 <Int 0)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1 +Int M1 +Int B1, Len1, A2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1 +Int M1 +Int B1, Len1, A2 +Int M2, Len2)
              )
            )
          )
        )
      [simplification]
    rule disjontRanges
          ( (A1:Int modIntTotal M1:Int), Len1:Int
          , (A2:Int modIntTotal M2:Int), Len2:Int
          )
        => true
      requires
        ( ( (0 <=Int A1 andBool A1 <Int M1)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1, Len1, A2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1, Len1, A2 +Int M2, Len2)
              )
            )
          )
        orBool
          ( (0 -Int M1 <=Int A1 andBool A1 <Int 0)
          andBool
            ( ( (A2 >=Int 0 andBool A2 <Int M2)
              andBool disjontRangesSimple(A1 +Int M1, Len1, A2, Len2)
              )
            orBool
              ( (0 -Int M2 <=Int A2 andBool A2 <Int 0)
              andBool disjontRangesSimple(A1 +Int M1, Len1, A2 +Int M2, Len2)
              )
            )
          )
        )
      [simplification]

    rule size(#setRange(M:SparseBytes, Addr:Int, Val:Int, Width:Int))
      => maxInt(Addr +Int Width, size(M))
      requires #setRangeActuallySets(Addr, Val, Width)
        [simplification]
    rule size(#setRange(M:SparseBytes, Addr:Int, Val:Int, Width:Int))
      => size(M)
      requires notBool (#setRangeActuallySets(Addr, Val, Width))
        [simplification]

    rule size(replaceAt(Dest:SparseBytes, Index:Int, Src:Bytes))
        => maxInt(size(Dest), Index +Int lengthBytes(Src))
        requires 0 <=Int Index
        [simplification]
    rule size(substrSparseBytes(B:SparseBytes, Start:Int, End:Int))
        => End -Int Start
        requires 0 <=Int Start andBool Start <=Int End andBool End <=Int size(B)
        [simplification]
    rule size(concat(A:SparseBytes, B:SparseBytes)) => size(A) +Int size(B)
        [simplification]
    rule size(merge(A:SBItemChunk, B:SparseBytes)) => size(A) +Int size(B)
        [simplification]
    rule 0 <=Int size(_:SparseBytes) => true
        [simplification]
endmodule

```