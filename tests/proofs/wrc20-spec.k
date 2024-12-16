// This is the "fast transfer" version of the WRC20 spec by pauld.

module WRC20-SPEC
    imports WRC20-LEMMAS

    // Reverse bytes spec.

    claim <instrs> sequenceDefns(#t2aDefns<#freshCtx()>(#wrc20ReverseBytes)) // TODO: Have this pre-loaded in the store.
                ~> i32.const ADDR
                ~> i32.const ADDR
                ~> #load(i64, load, 0)
                ~> (invoke NEXTADDR) // TODO: Use `call`.
                ~> #store(i64, store, 0)
                => .K
                 ...
          </instrs>
          <curModIdx> CUR </curModIdx>
          <moduleInst>
            <modIdx> CUR </modIdx>
            <types> #wrc20ReverseBytesTypeIdx |-> #wrc20ReverseBytesType </types>
            <memAddrs> ListItem(MEMADDR) </memAddrs>
            <funcAddrs> FUNCADDRS => ?_ </funcAddrs>
            <nextFuncIdx> NEXTFUNCIDX => NEXTFUNCIDX +Int 1 </nextFuncIdx>
            ...
          </moduleInst>
          <funcs> .Bag => ?_ </funcs>
          <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>
          <mems> MEMS1:List ListItem(memInst(_, SIZE, BM => ?BM')) </mems>
          // TODO: Ideally, there should also be a list variable at the end of the <mems> cell
          //  however, list unification does not seem to work that well in the Haskell Backend at the moment
          // hence we end in the memory location being affected, for the time being.
          //
          // TODO: Make function out of this tricky side condition.
       requires ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
        andBool NEXTFUNCIDX >=Int 0
        andBool NEXTFUNCIDX ==Int size(FUNCADDRS)
        andBool #inUnsignedRange(i32, ADDR)
        andBool size(MEMS1) ==Int MEMADDR
       ensures  #getRange(BM, ADDR +Int 0, 1) ==Int #getRange(?BM', ADDR +Int 7, 1)
        andBool #getRange(BM, ADDR +Int 1, 1) ==Int #getRange(?BM', ADDR +Int 6, 1)
        andBool #getRange(BM, ADDR +Int 2, 1) ==Int #getRange(?BM', ADDR +Int 5, 1)
        andBool #getRange(BM, ADDR +Int 3, 1) ==Int #getRange(?BM', ADDR +Int 4, 1)
        andBool #getRange(BM, ADDR +Int 4, 1) ==Int #getRange(?BM', ADDR +Int 3, 1)
        andBool #getRange(BM, ADDR +Int 5, 1) ==Int #getRange(?BM', ADDR +Int 2, 1)
        andBool #getRange(BM, ADDR +Int 6, 1) ==Int #getRange(?BM', ADDR +Int 1, 1)
        andBool #getRange(BM, ADDR +Int 7, 1) ==Int #getRange(?BM', ADDR +Int 0, 1)

endmodule
