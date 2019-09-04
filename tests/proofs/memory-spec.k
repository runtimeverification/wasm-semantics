requires "kwasm-lemmas.k"

// TODO: i32 => ITYPE
module MEMORY-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <i32> N:Int ==K <i32> N':Int => N ==Int N' [smt-lemma, trusted]

    rule #chop(<i32> X) ==K <i32> Y andBool #chop(<i32> X) ==K <i32> Z
      => <i32> Y ==K <i32> Z
      [trusted, smt-lemma]

    rule <k> (i32.load (i32.const ADDR)):Instr (i32.store (i32.const ADDR)):Instr => . ... </k>
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
        andBool #inUnsignedRange(i32, ADDR)

endmodule