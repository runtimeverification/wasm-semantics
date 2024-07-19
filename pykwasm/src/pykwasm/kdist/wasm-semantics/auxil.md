Auxiliary Wasm Commands
=======================

Generally useful commands that are not part of the actual Wasm semantics.

```k
requires "wasm.md"

module WASM-AUXIL-SYNTAX
    imports WASM-SYNTAX

    syntax Stmt ::= Auxil
 // ---------------------

    syntax Auxil ::= "#clearConfig"
 // -------------------------------
endmodule

module WASM-AUXIL
    imports WASM-AUXIL-SYNTAX
    imports WASM

    rule [clearConfig]:
         <instrs> #clearConfig => .K ...    </instrs>
         <curModIdx>         _ => .Int      </curModIdx>
         <valstack>          _ => .ValStack </valstack>
         <locals>            _ => .List     </locals>
         <moduleInstances>   _ => .Bag      </moduleInstances>
         <moduleIds>         _ => .Map      </moduleIds>
         <nextModuleIdx>     _ => 0         </nextModuleIdx>
         <moduleRegistry>    _ => .Map      </moduleRegistry>
         <mainStore>
           <nextFuncAddr>    _ => 0         </nextFuncAddr>
           <funcs>           _ => .Bag      </funcs>
           <nextTabAddr>     _ => 0         </nextTabAddr>
           <tabs>            _ => .Bag      </tabs>
           <mems>            _ => .List     </mems>
           <nextGlobAddr>    _ => 0         </nextGlobAddr>
           <globals>         _ => .Bag      </globals>
           <nextElemAddr>    _ => 0         </nextElemAddr>
           <elems>           _ => .Bag      </elems>
         </mainStore>

endmodule
```
