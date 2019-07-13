```k
require "wasm.k"

module WASM-TEST
    imports WASM
    configuration
      <wasm/>
      <initial> ($PGM:Stmts):K </initial>

    rule <initial> PROG => . </initial>
         <k> .EmptyStmts => PROG ... </k>
      requires PROG =/=K .Stmts
      
endmodule
```
