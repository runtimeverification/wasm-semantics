requires "kwasm-lemmas.k"

module MEMORY-SYMBOLIC-TYPE-SPEC
    imports KWASM-LEMMAS

    rule <k> (i32.const ADDR) (i32.const ADDR) (ITYPE.load) (ITYPE:IValType.store) => . ... </k>
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
       requires #chop(<i32> ADDR) ==K <i32> ?EA
        andBool ?EA +Int #numBytes(ITYPE) <=Int SIZE *Int #pageSize()
        andBool #isByteMap(BM)

endmodule
