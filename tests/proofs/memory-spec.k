requires "kwasm-lemmas.md"

module MEMORY-SPEC
    imports KWASM-LEMMAS

    rule <k> (i64.store16 (i32.const ADDR) (i64.load32_u (i32.const ADDR)):FoldedInstr):FoldedInstr => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> MEMADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> MEMADDR </mAddr>
           <msize> SIZE    </msize>
           <mdata> BM      </mdata>
           ...
         </memInst>
       requires
        ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
        andBool #inUnsignedRange(i32, ADDR)

    rule <k> (ITYPE:IValType.store (i32.const ADDR) (ITYPE.load (i32.const ADDR)):Instr):Instr => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> MEMADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> MEMADDR </mAddr>
           <msize> SIZE    </msize>
           <mdata> BM      </mdata>
           ...
         </memInst>
       requires #chop(<i32> ADDR) ==K <i32> ?EA
        andBool ?EA +Int #numBytes(ITYPE) <=Int SIZE *Int #pageSize()
endmodule
