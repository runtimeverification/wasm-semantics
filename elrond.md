```k
module ELROND
    imports WASM-REFERENCE-INTERPRETER-SYNTAX
    imports WASM-AUXIL
    imports WASM-TEXT

  syntax Instr ::= "elrond_trap" "(" WasmString ")"

  rule <instrs>
          #import(MOD, Name, #funcDesc(... id: OID, type: TIDX))
        => #func(... type: TIDX, locals: [ .ValTypes ], body: elrond_trap(Name) .Instrs, metadata: #meta(... id: OID, localIds: .Map))
              ...
        </instrs>
    requires MOD ==K #token("\"env\"", "WasmStringToken")
endmodule
```