```k
require "elrond-configuration.md"
require "wasm-text.md"

module ELROND-IMPL
  imports ELROND-CONFIGURATION
  imports WASM-TEXT

  syntax Intw ::= wrap(Int)
  syntax Bytesw ::= wrap(Bytes)

  syntax Instr ::= "elrond_trap" "(" String ")"  [klabel(elrond_trap), symbol]

  syntax Instr ::= "elrondError"  [klabel(elrondError), symbol]
  syntax Instr ::= "elrondReverted"  [klabel(elrondReverted), symbol]

  rule  <instrs>
          elrond_trap("\"getNumArguments\"") => i32.const ?_NumArguments:Int
          ...
        </instrs>

  rule  <instrs>
          elrond_trap("\"signalError\"") => elrondError
          ...
        </instrs>

  rule <instrs> (elrondError ~> _:K) => elrondReverted </instrs>
        <valstack> _:ValStack => .ValStack </valstack>
        <locals> _:Map => .Map </locals>

  rule  <instrs>
          elrond_trap("\"smallIntGetUnsignedArgument\"") => i64.const ?Argument:Int
          ...
        </instrs>
    ensures 0 <=Int ?Argument andBool ?Argument <Int (1 <<Int 64)

  rule  <instrs>
          elrond_trap("\"smallIntGetUnsignedArgument\"") => elrondError
          ...
        </instrs>

  rule  <instrs>
          elrond_trap("\"checkNoPayment\"") => .K
          ...
        </instrs>

  rule  <instrs>
          elrond_trap("\"checkNoPayment\"") => elrondError
          ...
        </instrs>

  rule  <wasm>
            <instrs>
              elrond_trap("\"mBufferSetBytes\"") => .K
              ...
            </instrs>
            <locals>
                (0 |-> <i32> Handle:Int)
                (1 |-> <i32> Ptr:Int)
                (2 |-> <i32> Len:Int)
            </locals>
            <valstack> S:ValStack => <i32> ?_MBufferSetBytesResult:Int : S </valstack>
            <mdata> Mem:Bytes </mdata>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[wrap(Handle) <- wrap(substrBytes(Mem, Ptr, Ptr +Int Len))]
            </buffers>
        </elrond>
    requires true #And #Ceil(substrBytes(Mem, Ptr, Ptr +Int Len))

  rule <instrs>
          #import(MOD, Name, #funcDesc(... id: OID, type: TIDX))
        => #func(... type: TIDX, locals: [ .ValTypes ],
                body: elrond_trap(#parseWasmString(Name)) return .Instrs,
                metadata: #meta(... id: OID, localIds: .Map))
              ...
        </instrs>
    requires MOD ==K #token("\"env\"", "WasmStringToken")

  // syntax IdentifierToken ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=:\\@^.-]+" [token]
  // syntax  ::= "$__stack_pointer" [token]
endmodule
```