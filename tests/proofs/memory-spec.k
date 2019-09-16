requires "kwasm-lemmas.k"

/*
TODO:To make the proof complete:
1. Make sure that the Z3 can realize that

        #chop(<T> X) ==K <T> Y
andBool #chop(<T> X) ==K <T> Z
=>      Y ==Int Z

and remove the inUnsignedRange requirement.
*/

module MEMORY-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <k> (TYPE:IValType.store (i32.const ADDR) (TYPE.load (i32.const ADDR)):Instr):Instr => . ... </k>
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
        andBool EA +Int #numBytes(TYPE) <=Int SIZE *Int #pageSize()
        andBool #inUnsignedRange(i32, ADDR) // Makes sure we don't take the trapping path

endmodule
