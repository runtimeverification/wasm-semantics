requires "kwasm-lemmas.k"

module MEMORY-CONCRETE-TYPE-LEMMAS
    imports KWASM-LEMMAS

    rule #getRange(BM, START, WIDTH) => 0
      requires notBool (WIDTH >Int 0)
    rule #getRange(BM, START, WIDTH) => #get(BM, START) +Int (#getRange(BM, START +Int 1, WIDTH -Int 1) *Int 256)
      requires          WIDTH >Int 0

    rule #wrap(16, N) => N modInt (256 *Int 256)

    rule (X modInt M) modInt N => X modInt N
      requires M modInt N ==Int 0
       andBool N >Int 0
       andBool M >Int 0

    // Should be generalized:
    // ----------------------
//  rule (X +Int (Y +Int (Z *Int 256)) *Int 256) modInt 65536 => (X +Int (Y *Int 256)) modInt 65536
//  rule (#get(BM, X) +Int #get(BM, Y) *Int 256) modInt 65536 => #get(BM, X) +Int #get(BM, Y) *Int 256
//    requires #isByteMap(BM)
    // ----------------------

endmodule


module MEMORY-CONCRETE-TYPE-SPEC
    imports WASM-TEXT
    imports MEMORY-CONCRETE-TYPE-LEMMAS

    rule <k> (i64.store16 (i32.const ADDR) (i64.load32_u (i32.const ADDR)):FoldedInstr):FoldedInstr
          => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> MEMADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> MEMADDR </mAddr>
           <msize> SIZE </msize>
           <mdata> BM   </mdata>
           ...
         </memInst>
       requires
        ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
        andBool #isByteMap(BM)
        andBool #inUnsignedRange(i32, ADDR)

endmodule
