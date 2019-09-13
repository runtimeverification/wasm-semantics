requires "kwasm-lemmas.k"

// TODO: i32 => ITYPE
module MEMORY-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <i32> N:Int ==K <i32> N':Int => N ==Int N' [smt-lemma]

    rule <k> (i32.store (i32.const ADDR) (i32.load (i32.const ADDR))):Instr => . ... </k>
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
       requires #chop(<i32> ADDR) ==K <i32> EA
        andBool EA +Int 4 <=Int SIZE *Int #pageSize()
        andBool #inUnsignedRange(i32, ADDR) // Makes sure we don't take the trapping path

endmodule