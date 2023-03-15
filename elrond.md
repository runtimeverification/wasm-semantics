```k
require "wasm-text.md"

module ELROND-SYNTAX
  imports WASM-TEXT-SYNTAX
endmodule

module ELROND
  imports WASM-TEXT

  syntax Instr ::= "elrond_trap" "(" String ")"  [klabel(elrond_trap), symbol]

  rule  <instrs>
          elrond_trap("\"getNumArguments\"") => i32.const ?_NumArguments:Int
          ...
        </instrs>

  rule <instrs>
          #import(MOD, Name, #funcDesc(... id: OID, type: TIDX))
        => #func(... type: TIDX, locals: [ .ValTypes ],
                body: elrond_trap(#parseWasmString(Name)) return .Instrs,
                metadata: #meta(... id: OID, localIds: .Map))
              ...
        </instrs>
    requires MOD ==K #token("\"env\"", "WasmStringToken")

  // syntax IdentifierToken ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=:\\@^.-]+" [token]
  syntax IdentifierToken ::= r"\\$#[0-9a-zA-Z!$#%&'*+/<>?_`|~=:\\@^.-]+" [token]
  // syntax  ::= "$__stack_pointer" [token]
endmodule
```