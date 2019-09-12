requires "kwasm-lemmas.k"

// TODO: i32 => ITYPE
module MEMORY-SPEC
    imports KWASM-LEMMAS

    rule <k> (i32.const ADDR):Instr (i32.load ):Instr (i32.const ADDR):Instr (i32.store ):Instr => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> MEMADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> MEMADDR </mAddr>
           <msize> SIZE </msize>
           ...
         </memInst>
       requires #chop(<i32> ADDR) ==K <i32> EA // Remove and error goes away
        andBool EA +Int 4 <=Int SIZE *Int #pageSize() // Remove and error goes away.
        andBool #inUnsignedRange(i32, ADDR) // Remove and error goes away.

endmodule