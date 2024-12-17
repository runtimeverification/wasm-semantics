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
        <moduleInstances> ( .Bag => <moduleInst> <modIdx> NEXT </modIdx> ... </moduleInst>) ... </moduleInstances>
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
    rule #getEntryPoint() => FUNCNAME
         [[ <entry> FUNCNAME </entry> ]]
```

In the remote semantics, the Wasm VM has a fixed entrypoint.

```remote
    syntax WasmString ::= #getEntryPoint() [function, total]
    rule #getEntryPoint() => #token("\"ulmDispatchCaller\"", "WasmStringToken")
```

Passing Control
---------------

The embedder loads the module to be executed and then resolves the entrypoint function.

```k
    rule <k> PGM:PgmEncoding => #resolveCurModuleFuncExport(#getEntryPoint()) </k>
         <instrs> .K => decodePgm(PGM) </instrs>
```

Note that entrypoint resolution must occur _after_ the Wasm module has been loaded.
This is ensured by requiring that the `<instrs>` cell is empty during resolution.

```k
    syntax Initializer ::= #resolveCurModuleFuncExport(WasmString)
                         | #resolveModuleFuncExport(Int, WasmString)
                         | #resolveFunc(Int, ListInt)
    // ----------------------------------------------
    rule <k> #resolveCurModuleFuncExport(FUNCNAME) => #resolveModuleFuncExport(MODIDX, FUNCNAME) </k>
         <instrs> .K </instrs>
         <curModIdx> MODIDX:Int </curModIdx>

    rule <k> #resolveModuleFuncExport(MODIDX, FUNCNAME) => #resolveFunc(FUNCIDX, FUNCADDRS) </k>
         <instrs> .K </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <exports> ... FUNCNAME |-> FUNCIDX ... </exports>
           <funcAddrs> FUNCADDRS </funcAddrs>
           ...
         </moduleInst>

    rule <k> #resolveFunc(FUNCIDX, FUNCADDRS) => .K </k>
         <instrs> .K => (invoke FUNCADDRS {{ FUNCIDX }} orDefault -1 ):Instr </instrs>
         requires isListIndex(FUNCIDX, FUNCADDRS)
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

```k
endmodule
```
