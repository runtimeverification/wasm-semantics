KWASM Lemmas
============

```k
module KWASM-LEMMAS
    imports INT
    imports LIST

    syntax Val ::= "<" "i32" ">" Int    [klabel(<_>_)]
 // --------------------------------------------------

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

    syntax Stmt ::= "i32" "." "const" Int
 // -----------------------------------------
    rule <k> i32 . const VAL => < i32 > VAL ... </k>

    rule <k>        V:Val    => .        ... </k>
         <valstack> VALSTACK => V : VALSTACK </valstack>
endmodule
```
