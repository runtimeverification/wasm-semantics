module SPARSE-BYTES-SYNTAX
  imports BYTES
  imports INT

  syntax SBItem ::= #empty(Int)      [symbol(SBItem:empty)]
                  | #bytes(Bytes)    [symbol(SBItem:bytes)]


  syntax SBItemChunk ::= SBChunk(SBItem)

  syntax SparseBytes ::= List{SBItemChunk, ""}

  syntax Bytes ::= unwrap(SparseBytes)
    [function, total, symbol(SparseBytes:unwrap)]

  syntax Bytes ::= unwrap(SBItem)
    [function, total, symbol(SBItem:unwrap)]

  syntax Int ::= size(SparseBytes)
    [function, total, symbol(SparseBytes:size)]

  syntax Int ::= size(SBItem)
    [function, total, symbol(SBItem:size)]

  syntax Bytes ::= zeros(Int) [function, total, symbol(zeros)]
endmodule

module SPARSE-BYTES
  imports BOOL
  imports SPARSE-BYTES-SYNTAX
  imports REPLACE-AT-COMMON
  imports REPLACE-AT-CONCRETE
  imports REPLACE-AT-SYMBOLIC

  // syntax Bytes ::= unwrap(SparseBytes)
  //   [function, total, symbol(SparseBytes:unwrap)]
// -----------------------------------------------------------------
  rule unwrap(SBChunk(SBI) REST) => unwrap(SBI) +Bytes unwrap(REST)
  rule unwrap(.SparseBytes)       => .Bytes

  syntax SparseBytes ::= fromBytes(Bytes)
    [function, total, symbol(SparseBytes:fromBytes)]
// ---------------------------------------------------------
  rule fromBytes(Bs) => SBChunk(#bytes(Bs))

  // syntax Bytes ::= unwrap(SBItem)
  //   [function, total, symbol(SBItem:unwrap)]
// -----------------------------------------------
  rule unwrap(#bytes(Bs)) => Bs
  rule unwrap(#empty(N))  => zeros(N)

  // syntax Bytes ::= zeros(Int) [function, total, symbol(zeros)]
// -------------------------------------------------------------------
  rule zeros(N) => padLeftBytes(.Bytes, size(#empty(N)), 0)

  // syntax Int ::= size(SparseBytes)
  //   [function, total, symbol(SparseBytes:size)]
// ---------------------------------------------------
  rule size(SBChunk(SBI)  SBS) => size(SBI) +Int size(SBS)
  rule size(.SparseBytes)       => 0

  // syntax Int ::= size(SBItem)
  //   [function, total, symbol(SBItem:size)]
// -----------------------------------------------
  rule size(#bytes(Bs)) => lengthBytes(Bs)
  rule size(#empty(N))   => maxInt(N,0)


  syntax SparseBytes ::= substrSparseBytes(SparseBytes, from: Int, to: Int)
    [function, total, symbol(SparseBytes:substr)]
// ------------------------------------------------------------------------
  rule substrSparseBytes(_, S, E) => .SparseBytes
    requires notBool( 0 <=Int S andBool S <=Int E )

  rule substrSparseBytes(.SparseBytes, S, E) => .SparseBytes
    requires 0 <=Int S andBool S <=Int E

  rule substrSparseBytes(SBChunk(SBI) REST, S, E) => substrSparseBytes(REST, S -Int size(SBI), E -Int size(SBI))
    requires 0 <=Int S andBool S <=Int E
     andBool size(SBI) <=Int S

  rule substrSparseBytes(SBChunk(SBI) REST, S, E)
    => #let SUBSTR = substrSBItem(SBI, S, E)
       #in SUBSTR substrSparseBytes(REST, 0, E -Int size(SBI))
    requires 0 <=Int S andBool S <=Int E
     andBool size(SBI) >Int S

  syntax SparseBytes ::= substrSBItem(SBItem, from: Int, to: Int)
    [function, total, symbol(SBItem:substr)]
// -------------------------------------------------------------
  rule substrSBItem(_SBI, S, E)      => .SparseBytes
    requires S <Int 0 orBool E <Int S

  rule substrSBItem(#empty(N), S, E) => .SparseBytes
    requires 0 <=Int S andBool S <=Int E
     andBool N <=Int S

  rule substrSBItem(#empty(N), S, E) => SBChunk( #empty( minInt(E, N) -Int S) )
    requires 0 <=Int S andBool S <=Int E
     andBool S <Int N

  rule substrSBItem(#bytes(Bs), S, E) => .SparseBytes
    requires 0 <=Int S andBool S <=Int E
     andBool          lengthBytes(Bs) <=Int S

  rule substrSBItem(#bytes(Bs), S, E)
    => SBChunk(#bytes( substrBytes(Bs, S, minInt(E, lengthBytes(Bs))) ))
    requires 0 <=Int S andBool S <=Int E
     andBool S <Int lengthBytes(Bs)

endmodule

module REPLACE-AT-COMMON
  imports BOOL
  imports SPARSE-BYTES-SYNTAX

  syntax SparseBytes ::= replaceAt(SparseBytes, Int, Bytes)
    [function, total, symbol(SparseBytes:replaceAt)]
// --------------------------------------------------------
  // invalid argument
  rule replaceAt(_, S, _) => .SparseBytes
    requires S <Int 0

  // append
  rule replaceAt(.SparseBytes, S, Bs) => SBChunk(#bytes(Bs))
    requires 0 ==Int S

  // append padded
  rule replaceAt(.SparseBytes, S, Bs) => SBChunk(#empty(S)) SBChunk(#bytes(Bs))
    requires 0 <Int S

  // skip
  rule replaceAt(SBChunk(SBI) REST, S, Bs)
    => SBChunk(SBI) replaceAt(REST, S -Int size(SBI), Bs)
    requires size(SBI) <=Int S

  syntax SparseBytes ::= replaceAtZ(Int, SparseBytes, Int, Bytes)
    [function, total, symbol(SparseBytes:replaceAtZ)]
// ---------------------------------------------------------------
  ////////////// S < 0
  rule replaceAtZ(_, _, S, _) => .SparseBytes
    requires S <Int 0

  ////////////// S > 0
  // split zeros: 0 < S < N
  rule replaceAtZ(N, REST, S, Bs)
    => SBChunk(#empty(S)) replaceAtZ(N -Int S, REST, 0, Bs)
    requires 0 <Int S
     andBool S <Int N

  // skip zeros: 0 <= N <= S
  rule replaceAtZ(N, REST, S, Bs)
    => SBChunk(#empty(N)) replaceAt(REST, S -Int N, Bs)
    requires 0 <Int S
     andBool 0 <=Int N
     andBool N <=Int S

  ////////////// S == 0
  ///////// len(Bs) < N
  rule replaceAtZ(N, REST, S, Bs)
    => SBChunk(#bytes(Bs)) SBChunk(#empty(N -Int lengthBytes(Bs))) REST
    requires 0 ==Int S
     andBool lengthBytes(Bs) <Int N

  ///////// len(Bs) = N
  rule replaceAtZ(N, REST, S, Bs)
    => SBChunk(#bytes(Bs)) REST
    requires 0 ==Int S
     andBool lengthBytes(Bs) ==Int N

  ///////// len(Bs) > N
  rule replaceAtZ(N, REST, S, Bs)
    => replaceAt(SBChunk(#bytes(zeros(N))) REST, S, Bs)
    requires 0 ==Int S
     andBool lengthBytes(Bs) >Int N


  syntax SparseBytes ::= replaceAtB(Bytes, SparseBytes, Int, Bytes)
    [function, total, symbol(SparseBytes:replaceAtB)]
// ---------------------------------------------------------------
  ////////// S + len(Bs) <= len(MB)
  rule replaceAtB(MB, REST, S, Bs)
    => SBChunk(#bytes( replaceAtBytes(MB, S, Bs) )) REST
    requires 0 <=Int S
     andBool S +Int lengthBytes(Bs) <=Int lengthBytes(MB)

  ////////// S + len(Bs) > len(MB)
  rule replaceAtB(MB, REST, S, Bs)
    => replaceAt(
          joinUntil(MB, REST, S +Int lengthBytes(Bs)),
          S,
          Bs
        )
    requires 0 <=Int S
     andBool lengthBytes(MB) <Int S +Int lengthBytes(Bs)


  // join list items until Bs is at least I bytes
  syntax SparseBytes ::= joinUntil(Bytes, SparseBytes, Int)
    [function, total]
// --------------------------------------------------------
  rule joinUntil(Bs, REST, I)
    => SBChunk(#bytes(Bs)) REST
    requires I <=Int lengthBytes(Bs)

  rule joinUntil(Bs,                    SBChunk(SBI) REST, I)
    => joinUntil(Bs +Bytes unwrap(SBI), REST,              I)
    requires I >Int lengthBytes(Bs)

  rule joinUntil(Bs, .SparseBytes, I)
    => SBChunk(#bytes( padRightBytes(Bs, I, 0) ))
    requires I >Int lengthBytes(Bs)
endmodule

module REPLACE-AT-CONCRETE  [concrete]
  imports REPLACE-AT-COMMON

  rule replaceAt(SBChunk(#empty(N))  REST, S, Bs) => replaceAtZ(N, REST, S, Bs)
    requires S <Int N
  rule replaceAt(SBChunk(#bytes(B)) REST, S, Bs) => replaceAtB(B, REST, S, Bs)
    requires S <Int lengthBytes(B)

endmodule

module REPLACE-AT-SYMBOLIC  [symbolic]
  imports REPLACE-AT-COMMON

  rule replaceAt(SBChunk(#empty(N))  REST, S, Bs) => replaceAtZ(N, REST, S, Bs)
    requires S <Int N
    [simplification, concrete]
  rule replaceAt(SBChunk(#bytes(B)) REST, S, Bs) => replaceAtB(B, REST, S, Bs)
    requires S <Int lengthBytes(B)
    [simplification, concrete]

endmodule
