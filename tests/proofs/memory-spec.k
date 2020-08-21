requires "kwasm-lemmas.md"

module MEMORY-SPEC
    imports KWASM-LEMMAS

    rule <instrs> i32.const ADDR ~> i32.const ADDR ~> i64.load32_u ~> i64.store16 => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> MEMADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> MEMADDR </mAddr>
           <msize> SIZE    </msize>
           <mdata> _BM      </mdata>
           ...
         </memInst>
       requires
        ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
        andBool #inUnsignedRange(i32, ADDR)

    rule <instrs>  i32.const ADDR ~> i32.const ADDR ~> ITYPE:IValType.load ~> ITYPE.store => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> MEMADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> MEMADDR </mAddr>
           <msize> SIZE    </msize>
           <mdata> _BM      </mdata>
           ...
         </memInst>
       requires #chop(<i32> ADDR) ==K <i32> ?EA
        andBool ?EA +Int #numBytes(ITYPE) <=Int SIZE *Int #pageSize()
endmodule
