requires "kwasm-lemmas.k"

module MEMORY-CONCRETE-TYPE-SPEC
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
        andBool #inUnsignedRange(i32, ADDR)

endmodule
