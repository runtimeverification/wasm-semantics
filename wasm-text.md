WebAssembly Text Format
=======================

```k
require "wasm.k"
require "data.k"

module WASM-TEXT-SYNTAX
    imports WASM-TEXT
    imports WASM-SYNTAX
endmodule

module WASM-TEXT
    imports WASM
```

Folded Instructions
-------------------

Folded Instructions (`FoldedInstr`): Folded Instructions describes the rules of desugaring plain instructions and block instructions.

```k
    syntax Instr ::= FoldedInstr
    syntax FoldedInstr ::= "(" PlainInstr Instrs ")"
                         | "(" PlainInstr        ")" [prefer]
 // ---------------------------------------------------------
    rule <k> ( PI:PlainInstr IS:Instrs ):FoldedInstr => IS ~> PI ... </k>
    rule <k> ( PI:PlainInstr           ):FoldedInstr =>       PI ... </k>

    syntax FoldedInstr ::= "(" "block" OptionalId TypeDecls Instrs ")"
 // ------------------------------------------------------------------
    rule <k> ( block OID:OptionalId TDECLS:TypeDecls INSTRS:Instrs ) => block OID TDECLS INSTRS end ... </k>

    syntax FoldedInstr ::= "(" "if" OptionalId TypeDecls Instrs "(" "then" Instrs ")" ")"
                         | "(" "if" OptionalId TypeDecls Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
 // -----------------------------------------------------------------------------------------------------------
    rule <k> ( if OID:OptionalId TDECLS:TypeDecls C:Instrs ( then IS ) )              => C ~> if OID TDECLS IS else .Instrs end ... </k>
    rule <k> ( if OID:OptionalId TDECLS:TypeDecls C:Instrs ( then IS ) ( else IS' ) ) => C ~> if OID TDECLS IS else IS'     end ... </k>

    syntax FoldedInstr ::= "(" "loop" OptionalId TypeDecls Instrs ")"
 // -----------------------------------------------------------------
    rule <k> ( loop OID:OptionalId TDECLS:TypeDecls IS ) => loop OID TDECLS IS end ... </k>
```

```k
endmodule
```
