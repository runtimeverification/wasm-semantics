requires "kwasm-lemmas.k"

// This is the "fast transfer" version of the WRC20 spec by pauld.

// There is no specified behavior yet.
// As long as the program parses correctly, the spec will pass.

module WRC20-SPEC
    imports KWASM-LEMMAS

    //rule <k> #wrc20 </k>

    // Reverse bytes spec.

    rule <k> #wrc20ReverseBytes
          ~> (i32.load (i32.const ADDR))
             ( i64.const X )
             ( invoke NEXTADDR ) // TODO: Use `call`.
             (i32.store (i32.const ADDR))
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
          <mAddr> MEMADDR </mAddr>
          <msize> SIZE    </msize>
          <mdata> ByteMap <| ...
                             (ADDR        |-> ( V0 => V7 ))
                             (ADDR +Int 1 |-> ( V1 => V6 ))
                             (ADDR +Int 2 |-> ( V2 => V5 ))
                             (ADDR +Int 3 |-> ( V3 => V4 ))
                             (ADDR +Int 4 |-> ( V4 => V3 ))
                             (ADDR +Int 5 |-> ( V5 => V2 ))
                             (ADDR +Int 6 |-> ( V6 => V1 ))
                             (ADDR +Int 7 |-> ( V7 => V0 ))
                             ... |>
          </mdata>
        </memInst>
        // TODO: Make function out of this tricky side condition.
      requires notBool unnameFuncType(asFuncType(#wrc20ReverseBytesTypeDecls)) in values(TYPES)
       andBool ADDR +Int #numBytes(i64) <=Int SIZE *Int #pageSize()
       // andBool #isByteMap(BM) // TODO: how to specify?
       andBool #inUnsignedRange(i64, X)
       andBool #inUnsignedRange(i64, ADDR)

endmodule
