requires "kwasm-lemmas.k"

/*
TODO:To make the proof complete:
1. Make sure that the Z3 can realize that
        #chop(<T> X) ==K <T> Y
andBool #chop(<T> X) ==K <T> Z
=>      Y ==Int Z

and remove the inUnsignedRange requirement.

2.i32 => ITYPE
*/

module MEMORY-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <TYPE> N:Int ==K <TYPE'> N':Int => TYPE ==K TYPE' andBool N ==Int N' [smt-lemma]

    rule <k> (TYPE.store (TYPE.const ADDR) (TYPE.load (TYPE.const ADDR)):Instr):Instr => . ... </k>
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
       requires #chop(<TYPE> ADDR) ==K <TYPE> EA
        andBool EA +Int 4 <=Int SIZE *Int #pageSize()
        andBool #inUnsignedRange(TYPE, ADDR) // Makes sure we don't take the trapping path

endmodule
