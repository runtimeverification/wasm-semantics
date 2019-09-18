requires "kwasm-lemmas.k"

module MEMORY-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <k> (ITYPE:IValType.store (i32.const ADDR) (ITYPE.load (i32.const ADDR)):Instr):Instr => . ... </k>
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
       requires #chop(<i32> ADDR) ==K <i32> EA
        andBool EA +Int #numBytes(ITYPE) <=Int SIZE *Int #pageSize()
        andBool #inUnsignedRange(i32, ADDR) // Makes sure we don't take the trapping path
        andBool #isByteMap(BM)

endmodule
