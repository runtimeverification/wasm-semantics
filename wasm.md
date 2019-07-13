```k
require "data.k"

module WASM
    imports WASM-DATA

    configuration
      <wasm>
        <k> $PGM:Stmts </k>
      </wasm>

    syntax EmptyStmt
 // ----------------

    syntax Instr ::= EmptyStmt
    syntax Defn  ::= EmptyStmt
    syntax Stmt  ::= Instr | Defn
 // -----------------------------

    syntax EmptyStmts ::= List{EmptyStmt , ""} [klabel(listStmt)]
    syntax Stmts      ::= List{Stmt      , ""} [klabel(listStmt)]
 // -------------------------------------------------------------

    syntax Instrs ::= EmptyStmts
    syntax Defns  ::= EmptyStmts
    syntax Stmts  ::= Instrs | Defns
 // --------------------------------
 
    syntax Stmt ::= "nop"
 // ---------------------
    rule <k> nop => . ... </k>

endmodule
```
