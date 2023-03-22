```k
require "elrond-configuration.md"
require "wasm-text.md"

module ELROND-IMPL
  imports ELROND-CONFIGURATION
  imports WASM-TEXT
  imports MAP-INTW-TO-BYTESW

  syntax Intw ::= wrap(Int) | wrapI(Int)
  syntax Int ::= unwrap(Intw) [function, total]
  rule unwrap(wrap(V:Int)) => V

  syntax Bytesw ::= wrap(Bytes)
  syntax Bytes ::= unwrap(Bytesw) [function, total]
  rule unwrap(wrap(V:Bytes)) => V

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

  rule  <instrs>
          elrond_trap("\"managedSignalError\"") => elrondError
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
              elrond_trap("\"mBufferSetBytes\"") => i32.const ?_MBufferSetBytesResult:Int
              ...
            </instrs>
            <locals>
                (0 |-> <i32> Handle:Int)
                (1 |-> <i32> Ptr:Int)
                (2 |-> <i32> Len:Int)
            </locals>
            <mdata> Mem:Bytes </mdata>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[wrap(Handle) <- wrap(substrBytes(Mem, Ptr, Ptr +Int Len))]
            </buffers>
            ...
        </elrond>
    requires true #And #Ceil(substrBytes(Mem, Ptr, Ptr +Int Len))

  rule  <wasm>
            <instrs>
              elrond_trap("\"mBufferAppendBytes\"") => i32.const ?_MBufferAppendBytesResult:Int
              ...
            </instrs>
            <locals>
                (0 |-> <i32> Handle:Int)
                (1 |-> <i32> Ptr:Int)
                (2 |-> <i32> Len:Int)
            </locals>
            <mdata> Mem:Bytes </mdata>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[ wrap(Handle)
                    <-  wrap
                        ( unwrap(M [ wrap(Handle) ] orDefault wrap(.Bytes))
                          +Bytes substrBytes(Mem, Ptr, Ptr +Int Len)
                        )
                    ]
            </buffers>
            ...
        </elrond>
    requires true #And #Ceil(substrBytes(Mem, Ptr, Ptr +Int Len))

  rule  <wasm>
            <instrs>
              elrond_trap("\"mBufferAppend\"") => i32.const ?_MBufferAppendBytesResult:Int
              ...
            </instrs>
            <locals>
                (0 |-> <i32> HandleAccumulator:Int)
                (1 |-> <i32> HandleData:Int)
            </locals>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[ wrap(HandleAccumulator)
                    <-  wrap
                        ( unwrap(M [ wrap(HandleAccumulator) ] orDefault wrap(.Bytes))
                          +Bytes unwrap(M [ wrap(HandleData) ] orDefault wrap(.Bytes))
                        )
                    ]
            </buffers>
            ...
        </elrond>

  rule  <wasm>
            <instrs>
              elrond_trap("\"mBufferNew\"") => i32.const ?NewHandle:Int
              ...
            </instrs>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[ wrap(?NewHandle) <- wrap(.Bytes)]
            </buffers>
            ...
        </elrond>
      ensures notBool wrap(?NewHandle) in_keys(M)

  rule  <wasm>
            <instrs>
              // TODO: Should append to the returned result, or something like that.
              elrond_trap("\"mBufferFinish\"") => i32.const ?_MBufferFinishResult:Int
              ...
            </instrs>
            <locals>
                (0 |-> <i32> _Handle:Int)
            </locals>
            ...
        </wasm>
        <elrond>
            <buffers>
                _M:MapIntwToBytesw
            </buffers>
            ...
        </elrond>

  rule  <wasm>
            <instrs>
              // TODO: Should append to the returned result, or something like that.
              elrond_trap("\"managedCaller\"") => .K
              ...
            </instrs>
            <locals>
                (0 |-> <i32> Handle:Int)
            </locals>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw => M[wrap(Handle) <- wrap(Caller)]
            </buffers>
            <caller>
                Caller:Bytes
            </caller>
        </elrond>

  rule <instrs>
          #import(MOD, Name, #funcDesc(... id: OID, type: TIDX))
        => #func(... type: TIDX, locals: [ .ValTypes ],
                body: elrond_trap(#parseWasmString(Name)) return .Instrs,
                metadata: #meta(... id: OID, localIds: .Map))
              ...
        </instrs>
    requires MOD ==K #token("\"env\"", "WasmStringToken")

  rule  <wasm>
            <instrs>
              elrond_trap("\"bigIntSetInt64\"") => .K
              ...
            </instrs>
            <locals>
                (0 |-> <i32> Handle:Int)
                (1 |-> <i64> Value:Int)
            </locals>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[ wrap(Handle)
                    <-  wrap(Int2Bytes(Value, LE, Signed))
                    ]
            </buffers>
            ...
        </elrond>

  rule  <wasm>
            <instrs>
              elrond_trap("\"bigIntAdd\"") => .K
              ...
            </instrs>
            <locals>
                (0 |-> <i32> HandleDest:Int)
                (1 |-> <i32> Handle1:Int)
                (2 |-> <i32> Handle2:Int)
            </locals>
            ...
        </wasm>
        <elrond>
            <buffers>
                M:MapIntwToBytesw
                => M[ wrap(HandleDest)
                    <-  wrap
                        ( Int2Bytes
                          ( Bytes2Int(unwrap(M[wrap(Handle1)] orDefault wrap(.Bytes)), LE, Signed)
                            +Int Bytes2Int(unwrap(M[wrap(Handle2)] orDefault wrap(.Bytes)), LE, Signed)
                          , LE, Signed
                          )
                        )
                    ]
            </buffers>
            ...
        </elrond>

  // syntax IdentifierToken ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=:\\@^.-]+" [token]
  // syntax  ::= "$__stack_pointer" [token]
endmodule
```