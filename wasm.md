WebAssembly State and Semantics
===============================

```k
module WASM-SYNTAX
endmodule
```

```k
module WASM
    imports INT
    imports LIST
    imports MAP

    syntax IValType ::= "i32" | "i64"
    syntax ValType  ::= IValType
 // ----------------------------

    syntax IVal ::= "<" IValType ">" Int    [klabel(<_>_)]
    syntax  Val ::= IVal
 // --------------------

    syntax ValStack ::= ".ValStack"
                   | Val      ":"  ValStack
 // ---------------------------------------

    configuration
      <wasm>
        <k> $PGM:Stmts </k>
        <valstack> .ValStack </valstack>
      </wasm>

    syntax Stmts      ::= List{Stmt      , ""} [klabel(listStmt)]
 // -------------------------------------------------------------
    rule          <k> (S:Stmt .Stmts) => S       ... </k>
    rule [step] : <k> (S:Stmt SS)     => S ~> SS ... </k> requires SS =/=K .Stmts

    syntax Stmt ::= IValType "." "const" Int
 // -----------------------------------------
    rule <k> ITYPE:IValType . const VAL => < ITYPE > VAL ... </k>

    rule <k>        V:Val    => .        ... </k>
         <valstack> VALSTACK => V : VALSTACK </valstack>
```

```k
endmodule
```
