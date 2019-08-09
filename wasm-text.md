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

Folded Instructions describes the rules of desugaring plain instructions and block instructions.

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

Memory and Tables
-----------------

Intitial memory data, and initial table elements can be given inline in the text format.

```k
    syntax MemorySpec ::= "(" "data" DataString ")"
 // -----------------------------------------------
    rule <k> ( memory ( data DS ) ) => ( memory #freshId(NEXTID) (data DS) ) ... </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( memory ID:Identifier ( data DS ) )
          =>  memory { ID #lengthDataPages(DS) #lengthDataPages(DS) }
          ~> ( data ID (i32.const 0) DS ) ... </k>
      requires #lengthDataPages(DS) <=Int #maxMemorySize()

    syntax TableSpec ::= TableElemType "(" "elem" ElemSegment ")"
 // -------------------------------------------------------------
    rule <k> ( table funcref ( elem ES ) ) => ( table #freshId(NEXTID) funcref (elem ES) ) ... </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( table ID:Identifier funcref ( elem ES ) )
          =>  table { ID #lenElemSegment(ES) #lenElemSegment(ES) }
          ~> ( elem ID (i32.const 0) ES )
          ...
         </k>
```

Exports
-------

Exports can also be declared like regular functions, memories, etc., by giving an inline export declaration.
In that case, it simply desugars to an export followed by the definition, after introducing a fresh identifier if no identifier is present.
Note that it is possible to define multiple exports inline, i.e., export a single entity under many names.

```k
    syntax InlineExport  ::= "(" "export" WasmString ")"
 // ----------------------------------------------------

    syntax GlobalSpec ::= InlineExport GlobalSpec
 // ---------------------------------------------
    rule <k> ( global                  EXPO:InlineExport SPEC:GlobalSpec )
          => ( global #freshId(NEXTID) EXPO              SPEC            )
          ...
         </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( global ID:Identifier ( export ENAME ) SPEC:GlobalSpec )
          => ( export ENAME ( global ID ) )
          ~> ( global ID SPEC )
          ...
         </k>

    syntax FuncSpec   ::= InlineExport FuncSpec
 // -------------------------------------------
    rule <k> ( func                  EXPO:InlineExport SPEC:FuncSpec )
          => ( func #freshId(NEXTID) EXPO              SPEC          )
          ...
         </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( func ID:Identifier ( export ENAME ) SPEC:FuncSpec )
          => ( export ENAME ( func ID ) )
          ~> ( func ID SPEC )
          ...
         </k>

    syntax TableSpec  ::= InlineExport TableSpec
 // --------------------------------------------
    rule <k> ( table                  EXPO:InlineExport SPEC:TableSpec )
          => ( table #freshId(NEXTID) EXPO              SPEC           )
          ...
         </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( table ID:Identifier ( export ENAME ) SPEC:TableSpec )
          => ( export ENAME ( table ID ) )
          ~> ( table ID SPEC )
          ...
         </k>

    syntax MemorySpec ::= InlineExport MemorySpec
 // ---------------------------------------------
    rule <k> ( memory                  EXPO:InlineExport SPEC:MemorySpec )
          => ( memory #freshId(NEXTID) EXPO              SPEC            )
          ...
         </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( memory ID:Identifier ( export ENAME ) SPEC:MemorySpec )
          => ( export ENAME ( memory ID ) )
          ~> ( memory ID SPEC )
          ...
         </k>
```

Imports
-------

Imports can also be declared like regular functions, memories, etc., by giving an inline import declaration.

```k
    syntax InlineImport ::= "(" "import" WasmString WasmString ")"
 // --------------------------------------------------------------

    syntax GlobalSpec ::= InlineImport TextFormatGlobalType
 // -------------------------------------------------------
    rule <k> ( global OID:OptionalId (import MOD NAME) TYP ) => ( import MOD NAME (global OID TYP) ) ... </k>

    syntax FuncSpec ::= InlineImport TypeUse
 // ----------------------------------------
    rule <k> ( func OID:OptionalId (import MOD NAME) TUSE ) => ( import MOD NAME (func OID TUSE) ) ... </k>

    syntax TableSpec ::= InlineImport TableType
 // -------------------------------------------
    rule <k> ( table OID:OptionalId (import MOD NAME) TT:TableType ) => ( import MOD NAME (table OID TT) ) ... </k>

    syntax MemorySpec ::= InlineImport MemType
 // ------------------------------------------
    rule <k> ( memory OID:OptionalId (import MOD NAME) MT:MemType ) => ( import MOD NAME (memory OID MT) ) ... </k>
```

```k
endmodule
```
