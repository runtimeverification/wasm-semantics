requires "kwasm-lemmas.md"

module MEMORY-SPEC
    imports KWASM-LEMMAS

    claim <instrs> i32.const ADDR ~> i32.const ADDR ~> #load(i64, load32_u, 0) ~> #store(i64, store16, 0) => .K ... </instrs>
          <curModIdx> CUR </curModIdx>
          <moduleInst>
            <modIdx> CUR </modIdx>
           <memAddrs> ListItem(MEMADDR) </memAddrs>
            ...
          </moduleInst>
          <mems> MEMS1:List ListItem(memInst(_, SIZE, _)) _:List </mems>
        requires
         #inUnsignedRange(i32, ADDR)
         andBool size(MEMS1) ==Int MEMADDR
         andBool ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()

    claim <instrs>  i32.const ADDR ~> i32.const ADDR ~> #load(ITYPE:IValType, load, 0) ~> #store(ITYPE, store, 0) => .K ... </instrs>
          <curModIdx> CUR </curModIdx>
          <moduleInst>
            <modIdx> CUR </modIdx>
            <memAddrs> ListItem(MEMADDR) </memAddrs>
            ...
          </moduleInst>
          <mems> MEMS1:List ListItem(memInst(_, SIZE, _)) _:List </mems>
        requires
         size(MEMS1) ==Int MEMADDR
         andBool #get(#chop(<i32> ADDR)) +Int #numBytes(ITYPE) <=Int SIZE *Int #pageSize()
endmodule
