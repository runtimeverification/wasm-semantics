requires "kwasm-lemmas.k"

// This is the "fast transfer" version of the WRC20 spec by pauld.

// There is no specified behavior yet.
// As long as the program parses correctly, the spec will pass.

module WRC20-SPEC
    imports KWASM-LEMMAS

    //rule <k> #wrc20 </k>

    // Reverse bytes spec.

    rule <k> #wrc20ReverseBytes // TODO: Have this pre-loaded in the store.
          ~> (i64.load (i32.const ADDR)):FoldedInstr
             (i32.const ADDR)
             ( invoke NEXTADDR ) // TODO: Use `call`.
             (i64.store)
          => .
             ...
        </k>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <memAddrs> 0 |-> MEMADDR </memAddrs>
          <types> TYPES => _ </types>
          <nextTypeIdx> NEXTTYPEIDX => NEXTTYPEIDX +Int 1 </nextTypeIdx>
          <funcIds> _ => _ </funcIds>
          <funcAddrs> _ => _ </funcAddrs>
          <nextFuncIdx> NEXTFUNCIDX => NEXTFUNCIDX +Int 1 </nextFuncIdx>
          ...
        </moduleInst>
        <funcs> _ => _ </funcs>
        <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>
        <memInst>
          <mAddr> MEMADDR  </mAddr>
          <msize> SIZE     </msize>
          <mdata> BM => BM' </mdata>
          ...
        </memInst>
        // TODO: Make function out of this tricky side condition.
      requires notBool unnameFuncType(asFuncType(#wrc20ReverseBytesTypeDecls)) in values(TYPES)
       andBool ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
       andBool #isByteMap(BM)
       andBool #isByteMap(BM')
       andBool #inUnsignedRange(i64, X)
       andBool #inUnsignedRange(i32, ADDR)
       andBool #get(BM, ADDR +Int 0) ==Int #get(BM', ADDR +Int 7 )
       andBool #get(BM, ADDR +Int 1) ==Int #get(BM', ADDR +Int 6 )
       andBool #get(BM, ADDR +Int 2) ==Int #get(BM', ADDR +Int 5 )
       andBool #get(BM, ADDR +Int 3) ==Int #get(BM', ADDR +Int 4 )
       andBool #get(BM, ADDR +Int 4) ==Int #get(BM', ADDR +Int 3 )
       andBool #get(BM, ADDR +Int 5) ==Int #get(BM', ADDR +Int 2 )
       andBool #get(BM, ADDR +Int 6) ==Int #get(BM', ADDR +Int 1 )
       andBool #get(BM, ADDR +Int 7) ==Int #get(BM', ADDR +Int 0 )

endmodule
