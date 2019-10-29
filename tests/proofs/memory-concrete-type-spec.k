requires "kwasm-lemmas.k"

module MEMORY-CONCRETE-TYPE-LEMMAS
  imports KWASM-LEMMAS

  rule #getRange(BM, START, WIDTH) => 0
    requires notBool (WIDTH >Int 0)
  rule #getRange(BM, START, WIDTH) => #get(BM, START) +Int (#getRange(BM, START +Int 1, WIDTH -Int 1) *Int 256)
    requires          WIDTH >Int 0

endmodule

module MEMORY-CONCRETE-TYPE-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <k> (i32.store (i32.const ADDR) (i32.load (i32.const ADDR)):Instr):Instr => . ... </k>
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
        andBool EA +Int #numBytes(i32) <=Int SIZE *Int #pageSize()
        andBool #isByteMap(BM)
        andBool #inUnsignedRange(i32, ADDR)

    rule <k> (i64.store (i32.const ADDR) (i64.load (i32.const ADDR)):Instr):Instr => . ... </k>
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
        andBool EA +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
        andBool #isByteMap(BM)
        andBool #inUnsignedRange(i32, ADDR)

endmodule
