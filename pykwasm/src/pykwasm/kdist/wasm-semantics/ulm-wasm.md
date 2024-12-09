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

```k
    syntax OutputData ::= "NO_OUTPUT"
                        | Bytes

    configuration
      <ulmWasm>
        <k> $PGM:PgmEncoding </k>
        <wasm/>
        <create> $CREATE:Bool </create>
        <gas> $GAS:Int </gas>
        <status> EVMC_INTERNAL_ERROR </status>
        <output> NO_OUTPUT </output>
```

A special configuration cell is added in the local case to support VM initialization.

```local
        <entry> $ENTRY:String </entry>
```


```k
      </ulmWasm>
```

Passing Control
---------------

The embedder loads the module to be executed and then resolves the entrypoint function.

```k
    rule <k> PGM:PgmEncoding => . </k>
         <instrs> .K => decodePgm(PGM) </instrs>
```

ULM Hook Behavior
-----------------

These rules define various integration points between the ULM and our Wasm interpreter.

**Note**: the first three rules hooks below are written with helper functions
          because parse errors were encountered when writing `<generatedTopCell>` literals.

```k
    syntax Int ::= #getGasLeft() [function, total]
    rule [[ #getGasLeft() => Gas ]]
         <gas> Gas:Int </gas>

    syntax Bytes ::= #getOutput() [function, total]
    rule [[ #getOutput() => #if OutVal ==K NO_OUTPUT #then .Bytes #else {OutVal}:>Bytes #fi ]]
         <output> OutVal:OutputData </output>

    syntax Int ::= #getStatus() [function, total]
    rule [[ #getStatus() => #if OutVal ==K NO_OUTPUT #then EVMC_INTERNAL_ERROR #else Status #fi ]]
         <output> OutVal:OutputData </output>
         <status> Status:Int </status>

    rule getGasLeft(_) => #getGasLeft()
    rule getOutput(_)  => #getOutput()
    rule getStatus(_)  => #getStatus()
```

```k
endmodule
```
