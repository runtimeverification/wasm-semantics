requires "kwasm-lemmas.k"

module DEAD-CODE-ELIMINATION-SPEC
    imports WASM
    imports KWASM-LEMMAS

    rule <k> ( ITYPE:IValType . const X:Int ) => . ... </k>
         <valstack> S:ValStack => < ITYPE > X : S </valstack>
      requires #inUnsignedRange(ITYPE, X)

endmodule