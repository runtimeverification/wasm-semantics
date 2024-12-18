```k
requires "wasm.md"
requires "ulm.k"
```

```k
module ULM-WASM-SYNTAX
    imports WASM
```

Program Encoding
----------------

The ULM-integrated WASM VM has two possible program encodings:

1.  In the local test VM case, a direct encoding is used.

    ```local
    syntax PgmEncoding ::= ModuleDecl
    ```

2.  In the remote ULM-integrated VM case, a byte encoding is used.

    ```remote
    syntax PgmEncoding ::= Bytes
    ```

```k
endmodule
```

```k
module ULM-WASM
    imports ULM-WASM-SYNTAX
    imports ULM
```

Program Decoding
----------------

The WASM VM must decode the input program:

1.  In local test VM case, the decoding function is just identity.

    ```local
    syntax ModuleDecl ::= decodePgm(ModuleDecl) [function, total]
    // ----------------------------------------------------------
    rule decodePgm(Mod) => Mod
    ```

2.  In the remote ULM-integrated VM case, a specialized, hooked byte decoder is used.

    ```remote
    syntax ModuleDecl ::= decodePgm(Bytes) [function, hook(ULM.decode)]
    ```

Configuration
-------------

Here we define the initial configuration.
Note that the default status code indicates an internal error; this is used defensively, since if we ever get stuck, an error will always be indicated.
Similarly, we define a default null output which may indicate internal errors.

We need to have a `<generatedTop>` cell that is available for the rules below.
If we have at least two top level entries in the configuration above, K will
infer that this must be the top configuration, so it will wrap it in
`<generatedTop>` early, making it available.

```k
    syntax OutputData ::= "NO_OUTPUT"
                        | Bytes

    configuration
      <k> $PGM:PgmEncoding </k>
      <ulmWasm>
        <wasm/>
        <create> $CREATE:Bool </create>
        <gas> $GAS:Int </gas>
        <status> EVMC_INTERNAL_ERROR </status>
        <output> NO_OUTPUT </output>
        <contractModIdx> -1 </contractModIdx>
```

A special configuration cell is added in the local case to support VM initialization.

```local
        <entry> $ENTRY:WasmString </entry>
```


```k
      </ulmWasm>
```

Implementing all unresolved imports as hooks
--------------------------------------------

```k

    syntax String ::= wasmString2StringStripped ( WasmString ) [function]
                    | #stripQuotes ( String ) [function]
 // ----------------------------------------------------
    rule wasmString2StringStripped(WS) => #stripQuotes(#parseWasmString(WS))

    rule #stripQuotes(S) => replaceAll(S, "\"", "")

    syntax IdentifierToken ::= String2Identifier(String) [function, total, hook(STRING.string2token)]

```

First, we create an empty module for any import referencing a non-existing module.

```k

    rule
        <instrs> #import(MOD, _, _) ... </instrs>
        <moduleRegistry> MR:Map => MR [ MOD <- NEXT ] </moduleRegistry>
        <nextModuleIdx> NEXT => NEXT +Int 1 </nextModuleIdx>
        <moduleInstances>
            .Bag => <moduleInst> <modIdx> NEXT </modIdx> ... </moduleInst>
            ...
        </moduleInstances>
        requires notBool MOD in_keys(MR)

```

Next, for each import referencing a non-existing function, we add a function
that just invokes a (non-wasm) `hostCall` instruction.

```k

    syntax Instr ::= hostCall(String, String, FuncType)
 // ---------------------------------------------------
    rule
        <instrs>
            (  .K
            => allocfunc
                ( HOSTMOD, NEXTADDR, TYPE, [ .ValTypes ]
                , hostCall
                    ( wasmString2StringStripped(MOD)
                    , wasmString2StringStripped(NAME)
                    , TYPE
                    )
                  .Instrs
                , #meta
                    (... id: String2Identifier
                        ( "$auto-alloc:"
                        +String #parseWasmString(MOD)
                        +String ":"
                        +String #parseWasmString(NAME)
                        )
                    , localIds: .Map
                    )
                )
            )
            ~> #import(MOD, NAME, #funcDesc(... type: TIDX))
            ...
        </instrs>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
            <modIdx> CUR </modIdx>
            <types> ... TIDX |-> TYPE ... </types>
            ...
        </moduleInst>
        <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>
        <moduleRegistry> ... MOD |-> HOSTMOD ... </moduleRegistry>
        <moduleInst>
            <modIdx> HOSTMOD </modIdx>
            <exports> EXPORTS => EXPORTS [NAME <- NEXTFUNC ] </exports>
            <funcAddrs> FS => setExtend(FS, NEXTFUNC, NEXTADDR, -1) </funcAddrs>
            <nextFuncIdx> NEXTFUNC => NEXTFUNC +Int 1 </nextFuncIdx>
            <nextTypeIdx> NEXTTYPE => NEXTTYPE +Int 1 </nextTypeIdx>
            <types> TYPES => TYPES [ NEXTTYPE <- TYPE ] </types>
            ...
        </moduleInst>
    requires notBool NAME in_keys(EXPORTS)

```

Obtaining the Entrypoint
------------------------

In the standalone semantics, the Wasm VM obtains an entrypoint from the configuration.

```local
    syntax WasmString ::= #getEntryPoint() [function, total]
    rule [[ #getEntryPoint() => FUNCNAME ]]
         <entry> FUNCNAME </entry>
```

In the remote semantics, the Wasm VM has a fixed entrypoint.

```remote
    syntax WasmString ::= #getEntryPoint() [function, total]
    rule #getEntryPoint() => #token("\"ulmDispatchCaller\"", "WasmStringToken")
```

Passing Control
---------------

The embedder loads the module to be executed and then calls the entrypoint function.

```k
    rule
        <k> PGM:PgmEncoding
            => setContractModIdx
                ~> #resolveCurModuleFuncExport(#getEntryPoint())
                ~> remoteSetOutputOnCreate(PGM)
                ~> setSuccessStatus
        </k>
        <instrs> .K => decodePgm(PGM) </instrs>
```

Note that entrypoint resolution must occur _after_ the Wasm module has been loaded.
This is ensured by requiring that the `<instrs>` cell is empty during resolution.

```k
    syntax Initializer ::= #resolveCurModuleFuncExport(WasmString)
                         | #resolveModuleFuncExport(Int, WasmString)
                         | #resolveFunc(Int, ListInt)
                         | "setContractModIdx"
                         | remoteSetOutputOnCreate(PgmEncoding)
                         | "setSuccessStatus"
    // ----------------------------------------------
    rule <k>
            #resolveCurModuleFuncExport(FUNCNAME)
            => #resolveModuleFuncExport(MODIDX, FUNCNAME)
            ...
         </k>
         <instrs> .K </instrs>
         <curModIdx> MODIDX:Int </curModIdx>

    rule <k>
              #resolveModuleFuncExport(MODIDX, FUNCNAME)
              => #resolveFunc(FUNCIDX, FUNCADDRS)
              ...
         </k>
         <instrs> .K </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <exports> ... FUNCNAME |-> FUNCIDX ... </exports>
           <funcAddrs> FUNCADDRS </funcAddrs>
           ...
         </moduleInst>

    rule <k> #resolveFunc(FUNCIDX, FUNCADDRS) => .K ... </k>
         <instrs> .K => (invoke FUNCADDRS {{ FUNCIDX }} orDefault -1 ):Instr </instrs>
         <valstack>
            .ValStack => <i32> #if CREATE #then 1 #else 0 #fi : .ValStack
         </valstack>
        <create> CREATE:Bool </create>
         requires isListIndex(FUNCIDX, FUNCADDRS)
```

When we call ULM hooks, the `curModIdx` cell changes to point to the ULM module.
However, the ULM hooks need to access data from the main contract module
(e.g. the contract's memory). In order to do that, we save the main module index
in the `contractModIdx` cell.

```k
    rule
        <k> setContractModIdx => .K ... </k>
        <instrs> .K </instrs>
        <curModIdx> MODIDX:Int </curModIdx>
        <contractModIdx> _ => MODIDX </contractModIdx>
```

`remoteSetOutputOnCreate` will do nothing on local but will set the output to
its argument on remote, but only if the `<create>` cell holds `true`.

```local
    rule remoteSetOutputOnCreate(_) => .K
```

```remote
    rule
        <k> remoteSetOutputOnCreate(Out:Bytes) => .K ... </k>
        <instrs> .K </instrs>
        <create> true </create>
        <output> _ => Out </output>

    rule
        <k> remoteSetOutputOnCreate(_) => .K ... </k>
        <create> false </create>
```

```k
    rule
        // setSuccessStatus should only be used after everything finished executing,
        // so we are checking that it is the only thing left in the <k> cell.
        <k> setSuccessStatus => .K </k>
        <instrs> .K </instrs>
        <status> _ => EVMC_SUCCESS </status>
```

Here we handle the case when entrypoint resolution fails.

**TODO:** Decide how to handle failure case.

```k
    // rule <k> Init:Initializer => . </k> [owise]
```

ULM Hook Behavior
-----------------

These rules define various integration points between the ULM and our Wasm interpreter.

```k

    rule getGasLeft(
        <generatedTop>
            <ulmWasm>
                <gas> Gas:Int </gas>
                ...
            </ulmWasm>
            ...
        </generatedTop>
    ) => Gas
    rule getOutput(
        <generatedTop>
            <ulmWasm>
                <output> OutVal:OutputData </output>
                ...
            </ulmWasm>
            ...
        </generatedTop>
    )  => #if OutVal ==K NO_OUTPUT #then .Bytes #else {OutVal}:>Bytes #fi
    rule getStatus(
        <generatedTop>
            <ulmWasm>
                <output> OutVal:OutputData </output>
                <status> Status:Int </status>
                ...
            </ulmWasm>
            ...
        </generatedTop>
    )  => #if OutVal ==K NO_OUTPUT #then EVMC_INTERNAL_ERROR #else Status #fi
```

Hooks implementation
--------------------

Helpers: exception handling. For now, #exception simply stops execution.

```remote
    syntax UlmInstr ::= #throwException(code: Int, reason: String)
    syntax UlmInstr ::= #exception(reason: String)
    rule
        <instrs>
            #throwException(Code:Int, Reason:String)
            => setStatus(Code)
                ~> #exception(Reason)
            ...
        </instrs>
```

Helpers: setting the status.

```remote
    syntax UlmInstr ::= setStatus(code: Int)
    rule
        <instrs> setStatus(Status:Int) => .K ... </instrs>
        <status> _ => Status </status>
```

Helpers: storing bytes into memory. `#memStore` expects that the object
which starts at offset (or contains it) has enough capacity to hold the bytes.

```remote
    syntax UlmInstr ::= #memStore(offset: Int, bytes: Bytes)
 // -----------------------------------------------------------------

    rule
        <instrs>
            #memStore(_OFFSET, _BS)
            => #throwException(EVMC_INTERNAL_ERROR, "mem store: memory instance not found (negative)")
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
            <modIdx> MODIDX </modIdx>
            <memAddrs> ListItem(ADDR) </memAddrs>
            ...
        </moduleInst>
      requires
        ADDR <Int 0

    rule
        <instrs>
            #memStore(_OFFSET, _BS)
            => #throwException(EVMC_INTERNAL_ERROR, "mem store: memory instance not found (upper)")
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
            <modIdx> MODIDX </modIdx>
            <memAddrs> ListItem(ADDR) </memAddrs>
            ...
        </moduleInst>
        <mems> MEMS </mems>
      requires
        0 <=Int ADDR andBool size(MEMS) <=Int ADDR

    rule
        <instrs>
            #memStore(OFFSET, _)
            => #throwException(EVMC_INVALID_MEMORY_ACCESS, "bad bounds (lower)")
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
            <modIdx> MODIDX </modIdx>
            <memAddrs> ListItem(ADDR) </memAddrs>
            ...
        </moduleInst>
        <mems> MEMS </mems>
      requires
        0 <=Int ADDR andBool ADDR <Int size(MEMS)
        andBool #signed(i32 , OFFSET) <Int 0

    rule
        <instrs> #memStore(OFFSET, BS)
            => #throwException(EVMC_INVALID_MEMORY_ACCESS, "bad bounds (upper)") ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
            <modIdx> MODIDX </modIdx>
            <memAddrs> ListItem(ADDR) </memAddrs>
            ...
        </moduleInst>
        <mems> MEMS </mems>
      requires
        0 <=Int ADDR andBool ADDR <Int size(MEMS)
        andBool
            ( #let memInst(_MAX, SIZE, _DATA) = MEMS[ADDR]
            #in (0 <=Int #signed(i32 , OFFSET)
                andBool #signed(i32 , OFFSET) +Int lengthBytes(BS) >Int (SIZE *Int #pageSize())
                )
            )

    rule
        <instrs> #memStore(OFFSET, BS) => .K ... </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
            <modIdx> MODIDX </modIdx>
            <memAddrs> ListItem(ADDR) </memAddrs>
            ...
        </moduleInst>
        <mems>
            MEMS
            =>  #let memInst(MAX, SIZE, DATA) = MEMS[ADDR]
                #in MEMS [ ADDR <- memInst(MAX, SIZE, #setBytesRange(DATA, OFFSET, BS)) ]
        </mems>
      requires
        0 <=Int ADDR andBool ADDR <Int size(MEMS)
        andBool
            ( #let memInst(MAX, SIZE, DATA) = MEMS[ADDR]
            #in (0 <=Int #signed(i32 , OFFSET)
                andBool #signed(i32 , OFFSET) +Int lengthBytes(BS) <=Int (SIZE *Int #pageSize())
                )
            )
      [preserves-definedness] // setBytesRange total, ADDR key in range for MEMS
```

Helpers: loading bytes from memory.

```remote

    syntax InternalInstr ::= #memLoad ( offset: Int , length: Int )
 // ---------------------------------------------------------------

    rule [memLoad-wrong-index]:
        <instrs>
            (.K => #throwException(EVMC_INTERNAL_ERROR, "Invalid memory index"))
            ~> #memLoad(_OFFSET, _LENGTH)
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
          <modIdx> MODIDX </modIdx>
          <memAddrs> ListItem(ADDR) </memAddrs>
          ...
        </moduleInst>
        <mems> MEMS </mems>
      requires notBool
        ( 0 <=Int ADDR
        andBool ADDR <Int size(MEMS)
        )

    rule [memLoad-negative]:
        <instrs>
            (.K => #throwException(EVMC_INVALID_MEMORY_ACCESS, "Negative length or offset."))
            ~> #memLoad(OFFSET, LENGTH)
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
          <modIdx> MODIDX </modIdx>
          <memAddrs> ListItem(ADDR) </memAddrs>
          ...
        </moduleInst>
        <mems> MEMS </mems>
      requires true
        andBool 0 <=Int ADDR
        andBool ADDR <Int size(MEMS)
        andBool notBool
            ( #signed(i32, LENGTH) >=Int 0
            andBool #signed(i32, OFFSET) >=Int 0
            )

    rule [memLoad-page-error]:
        <instrs>
            (.K => #throwException(EVMC_INVALID_MEMORY_ACCESS, "Out of memory page."))
            ~> #memLoad(OFFSET, LENGTH)
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
          <modIdx> MODIDX </modIdx>
          <memAddrs> ListItem(ADDR) </memAddrs>
          ...
        </moduleInst>
        <mems> MEMS </mems>
      requires true
        andBool 0 <=Int ADDR
        andBool ADDR <Int size(MEMS)
        andBool #signed(i32, LENGTH) >=Int 0
        andBool #signed(i32, OFFSET) >=Int 0
        andBool notBool
            (#let memInst(_, SIZE, _DATA) = MEMS[ADDR] #in
                #signed(i32 , OFFSET) +Int #signed(i32 , LENGTH) <=Int (SIZE *Int #pageSize())
            )

    rule [memLoad]:
        <instrs> #memLoad(OFFSET, LENGTH) => #getBytesRange(
            #let memInst(_MAX, _SIZE, DATA) = MEMS[ADDR]
            #in DATA,
            OFFSET, LENGTH)
            ...
        </instrs>
        <contractModIdx> MODIDX:Int </contractModIdx>
        <moduleInst>
          <modIdx> MODIDX </modIdx>
          <memAddrs> ListItem(ADDR) </memAddrs>
          ...
        </moduleInst>
        <mems> MEMS </mems>
      requires true
        andBool 0 <=Int ADDR
        andBool ADDR <Int size(MEMS)
        andBool #signed(i32, LENGTH) >=Int 0
        andBool #signed(i32, OFFSET) >=Int 0
        andBool
            (#let memInst(_, SIZE, _DATA) = MEMS[ADDR] #in
                #signed(i32 , OFFSET) +Int #signed(i32 , LENGTH) <=Int (SIZE *Int #pageSize())
            )

```

Handle the actual hook calls.

```remote
    rule
        <instrs>
            hostCall("env", "CallDataLength", [ .ValTypes ] -> [ i32 .ValTypes ])
            => i32.const lengthBytes(CallData())
            ...
        </instrs>

    rule
        <instrs>
            hostCall("env", "CallData", [ i32 .ValTypes ] -> [ .ValTypes ])
            => #memStore(OFFSET, CallData())
            ...
        </instrs>
        <locals>
            ListItem(<i32> OFFSET:Int)
        </locals>

    rule
        <instrs>
            hostCall("env", "setOutput", [ i32 i32 .ValTypes ] -> [ .ValTypes ])
            => #memLoad(OFFSET, LENGTH) ~> #setOutput
            ...
        </instrs>
        <locals>
            ListItem(<i32> OFFSET:Int) ListItem(<i32> LENGTH:Int)
        </locals>

    syntax InternalInstr ::= "#setOutput"

    rule
        <instrs>
            BYTES:Bytes ~> #setOutput => .K
            ...
        </instrs>
        <output>
            _ => BYTES
        </output>


    rule
        <instrs>
            hostCall("env", "fail", [ i32 i32 .ValTypes ] -> [ .ValTypes ])
            => #memLoad(OFFSET, LENGTH) ~> #fail
            ...
        </instrs>
        <locals>
            ListItem(<i32> OFFSET:Int) ListItem(<i32> LENGTH:Int)
        </locals>


    syntax InternalInstr ::= "#fail"

    rule
        <instrs>
            BYTES:Bytes ~> #fail => #throwException(EVMC_FAILURE, Bytes2String(BYTES))
            ...
        </instrs>
```

```k
endmodule
```
