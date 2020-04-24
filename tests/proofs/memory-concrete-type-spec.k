requires "kwasm-lemmas.k"

module MEMORY-CONCRETE-TYPE-SPEC
    imports MEMORY-CONCRETE-TYPE-LEMMAS

    rule <k> (i64.load32_u) (i64.store16) => . ... </k>
         <valstack> < i32 > ADDR : < i32 > ADDR : VS => VS </valstack>
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
