requires "kwasm-lemmas.k"

// This is the "fast transfer" version of the WRC20 spec by pauld.

// There is no specified behavior yet.
// As long as the program parses correctly, the spec will pass.

module WRC20-SPEC
    imports KWASM-LEMMAS

    rule <k> #wrc20 </k>

    // Reverse bytes spec.

    rule <k> #wrc20ReverseBytes
    //    ~> (call String2Identifier("$i64.reverse_bytes"))
        => .
           ...
        </k>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <types> TYPES => _ </types>
          <nextTypeIdx> NEXTTYPEIDX => NEXTTYPEIDX +Int 1 </nextTypeIdx>
          <funcIds> _ => _ </funcIds>
          <funcAddrs> _ => _ </funcAddrs>
          <nextFuncIdx> NEXTFUNCIDX => NEXTFUNCIDX +Int 1 </nextFuncIdx>
          ...
        </moduleInst>
        <funcs> _ => _ </funcs>
        <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>
        // TODO: Make function.
      requires notBool unnameFuncType(asFuncType(#wrc20ReverseBytesTypeDecls)) in values(TYPES)

endmodule
