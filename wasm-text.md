WebAssembly Text Format
=======================

```k
require "wasm.k"
require "data.k"

module WASM-TEXT-SYNTAX
    imports WASM-TEXT
    imports WASM-SYNTAX
endmodule

module WASM-SYNTAX
    imports WASM-TOKEN-SYNTAX
    imports WASM-DATA
endmodule
```

Wasm Tokens
-----------

`WASM-TOKEN-SYNTAX` module defines the tokens used in parsing programs.

```k
module WASM-TOKEN-SYNTAX
```

### Strings

In WebAssembly, strings are defined differently to K's built-in strings, so we have to write the definition of WebAssembly `WasmString` in a separate module, and use the module just for parsing the program.
Note that you cannot use a normal K `String` in any production definitions, because the definitions of `String` and `WasmString` overlap, and the K tokenizer does not support ambiguity.

```k
    syntax WasmStringToken ::= r"\\\"(([^\\\"\\\\])|(\\\\[0-9a-fA-F]{2})|(\\\\t)|(\\\\n)|(\\\\r)|(\\\\\\\")|(\\\\')|(\\\\\\\\)|(\\\\u\\{[0-9a-fA-F]{1,6}\\}))*\\\"" [token]
 // -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

### Identifiers

In WebAssembly, identifiers are defined by the regular expression below.

```k
    syntax IdentifierToken ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=:\\@^.-]+" [token]
 // ----------------------------------------------------------------------------
```

### Integers

In WebAssembly, integers could be represented in either the decimal form or hexadecimal form.
In both cases, digits can optionally be separated by underscores.

```k
    syntax WasmIntToken ::= r"[\\+-]?[0-9]+(_[0-9]+)*"               [token]
                          | r"[\\+-]?0x[0-9a-fA-F]+(_[0-9a-fA-F]+)*" [token]
 // ------------------------------------------------------------------------
```

### Layout

WebAssembly allows for block comments using `(;` and `;)`, and line comments using `;;`.
Additionally, white-space is skipped/ignored.
Declaring regular expressions of sort `#Layout` infroms the K lexer to drop these tokens.

```k
    syntax #Layout ::= r"\\(;([^;]|(;+([^;\\)])))*;\\)" [token]
                     | r";;[^\\n\\r]*"                  [token]
                     | r"[\\ \\n\\r\\t]"                [token]
 // -----------------------------------------------------------
```

```k
endmodule
```

Wasm Textual Format
-------------------

```k
module WASM-TEXT
    imports WASM
```

The text format is a concrete syntax for Wasm.
It allows specifying instructions in a folded, S-expression like format, and a few other syntactic sugars.
Most instructions, those in the sort `PlainInstr`, have identical keywords in the abstract and concrete syntax, and can be used idrectly.

### Text Integers

All integers given in the text format are automatically turned into regular integers.
That means converting between hexadecimal and decimal when necessary, and removing underscores.

**TODO**: Symbolic reasoning for sort `WasmIntToken` not tested yet.
In the future should investigate which direction the subsort should go.
(`WasmIntToken` under `Int`/`Int` under `WasmIntToken`)

```k
    syntax WasmInt ::= Int
    syntax WasmInt ::= WasmIntToken [klabel(WasmInt), avoid, symbol, function]
 // --------------------------------------------------------------------------
    rule `WasmInt`(VAL) => WasmIntToken2Int(VAL)

    syntax String ::= WasmIntToken2String    ( WasmIntToken ) [function, functional, hook(STRING.token2string)]
    syntax Int    ::= WasmIntTokenString2Int ( String       ) [function]
                    | WasmIntToken2Int       ( WasmIntToken ) [function]
 // --------------------------------------------------------------------
    rule WasmIntTokenString2Int(S)  => String2Base(replaceFirst(S, "0x", ""), 16) requires findString(S, "0x", 0) =/=Int -1
    rule WasmIntTokenString2Int(S)  => String2Base(                        S, 10) requires findString(S, "0x", 0)  ==Int -1

    rule WasmIntToken2Int(VAL) => WasmIntTokenString2Int(replaceAll(WasmIntToken2String(VAL), "_", ""))
```

### Folded Instructions

Folded instructions are a syntactic sugar where expressions can be grouped using parentheses for higher readability.

```k
    syntax Instr ::= FoldedInstr
 // ----------------------------
```

One type of folded instruction are `PlainInstr`s wrapped in parentheses and optionally includes nested folded instructions to indicate its operands.

```k
    syntax FoldedInstr ::= "(" PlainInstr Instrs ")"
                         | "(" PlainInstr        ")" [prefer]
 // ---------------------------------------------------------
    rule <k> ( PI:PlainInstr IS:Instrs ):FoldedInstr => IS ~> PI ... </k>
    rule <k> ( PI:PlainInstr           ):FoldedInstr =>       PI ... </k>
```

Another type of folded instruction is control flow blocks wrapped in parentheses, in which case the `end` keyword is omitted.

```k
    syntax FoldedInstr ::= "(" "block" OptionalId TypeDecls Instrs ")"
 // ------------------------------------------------------------------
    rule <k> ( block               TDECLS:TypeDecls INSTRS:Instrs ) => block    TDECLS INSTRS end ... </k>
    rule <k> ( block ID:Identifier TDECLS:TypeDecls INSTRS:Instrs ) => block ID TDECLS INSTRS end ... </k>

    syntax FoldedInstr ::= "(" "if" OptionalId TypeDecls Instrs "(" "then" Instrs ")" ")"
                         | "(" "if" OptionalId TypeDecls Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
 // -----------------------------------------------------------------------------------------------------------
    rule <k> ( if OID:OptionalId TDECLS:TypeDecls C:Instrs ( then IS ) )              => C ~> if OID TDECLS IS          end ... </k>
    rule <k> ( if                TDECLS:TypeDecls C:Instrs ( then IS ) ( else IS' ) ) => C ~> if     TDECLS IS else IS' end ... </k>
    rule <k> ( if  ID:Identifier TDECLS:TypeDecls C:Instrs ( then IS ) ( else IS' ) ) => C ~> if  ID TDECLS IS else IS' end ... </k>

    syntax FoldedInstr ::= "(" "loop" OptionalId TypeDecls Instrs ")"
 // -----------------------------------------------------------------
    rule <k> ( loop               TDECLS:TypeDecls IS ) => loop    TDECLS IS end ... </k>
    rule <k> ( loop ID:Identifier TDECLS:TypeDecls IS ) => loop ID TDECLS IS end ... </k>
```

### Identifiers

When we want to specify an identifier, we can do so with the following helper function.

```k
    syntax IdentifierToken ::= String2Identifier(String) [function, functional, hook(STRING.string2token)]
```

### Looking up Indices

In the abstract Wasm syntax, indices are always integers.
In the text format, we extend indices to incorporate identifiers.
We also enable context lookups with identifiers.

```k
    syntax Index ::= Identifier
 // ---------------------------
    rule #ContextLookup(IDS:Map, ID:Identifier) => {IDS [ ID ]}:>Int
      requires ID in_keys(IDS)
```

### Block Instructions

In the text format, block instructions can have identifiers attached to them, and branch instructions can refer to these identifiers.
The `<labelIds>` cell maps labels to the depth at which they occur.
To ensure the bookkeeping mapping in `<labelIds>` is properly updated when branching, we don't make a new `Label` production, but instead a different one: `IdLabel`.

Branching with an identifier is the same as branching to the label with that identifier.
The correct label index is calculated by looking at whih depth the index occured and what depth execution is currently at.

```k
    rule <k> br ID:Identifier => br DEPTH -Int DEPTH' -Int 1 ... </k>
         <labelDepth> DEPTH </labelDepth>
         <labelIds> ... ID |-> DEPTH' ... </labelIds>
```

Finally, we introduce the text format block instructions, which may have identifiers after each keyword.
If more than one identifier is present, they all have to agree (they are just there to make clear what if-block they belong to).
If identifiers are used, one must occur after the initial keyword (`block`, `if` or `loop`).

```k
    syntax Instr ::= BlockInstr
 // ---------------------------

    syntax BlockInstr ::= "block" Identifier TypeDecls Instrs "end" OptionalId
 // --------------------------------------------------------------------------
    rule <k> block ID:Identifier TDECLS IS end OID':OptionalId => block TDECLS IS end ... </k>
         <labelDepth> DEPTH </labelDepth>
         <labelIds> IDS => IDS[ID <- DEPTH] </labelIds>
      requires ID ==K OID'
        orBool notBool isIdentifier(OID')

    syntax BlockInstr ::= "loop" Identifier TypeDecls Instrs "end" OptionalId
 // -------------------------------------------------------------------------
    rule <k> loop ID:Identifier TDECLS:TypeDecls IS end OID':OptionalId => loop TDECLS IS end ... </k>
         <labelDepth> DEPTH </labelDepth>
         <labelIds> IDS => IDS[ID <- DEPTH] </labelIds>
      requires ID ==K OID'
        orBool notBool isIdentifier(OID')
```

In the text format, it is also allowed to have a conditional without the `else` branch.

```k
    syntax BlockInstr ::= "if" Identifier TypeDecls Instrs "else" OptionalId Instrs "end" OptionalId
                        | "if" OptionalId TypeDecls Instrs                          "end" OptionalId
 // ------------------------------------------------------------------------------------------------
    rule <k> if TDECLS:TypeDecls IS end => if TDECLS IS else .Instrs end ... </k>

    rule <k> if ID:Identifier TDECLS:TypeDecls IS end OID'':OptionalId => if ID TDECLS IS else ID .Instrs end ID ... </k>
      requires ID ==K OID''
        orBool notBool isIdentifier(OID'')

    rule <k> if ID:Identifier TDECLS:TypeDecls IS else OID':OptionalId IS' end OID'':OptionalId => if TDECLS:TypeDecls IS else IS' end ... </k>
         <labelDepth> DEPTH </labelDepth>
         <labelIds> IDS => IDS[ID <- DEPTH] </labelIds>
      requires ( ID ==K OID'  orBool notBool isIdentifier(OID')  )
       andBool ( ID ==K OID'' orBool notBool isIdentifier(OID'') )
```

### Exports

Exports can be declared like regular functions, memories, etc., by giving an inline export declaration.
In that case, it simply desugars to the definition followed by an export of it.
If no identifer is present, one must be introduced so that the export can refer to it.
Note that it is possible to define multiple exports inline, i.e. export a single entity under many names.

```k
    syntax InlineExport  ::= "(" "export" WasmString ")"
 // ----------------------------------------------------
```

### Imports

Imports can be declared like regular functions, memories, etc., by giving an inline import declaration.

```k
    syntax InlineImport ::= "(" "import" WasmString WasmString ")"
 // --------------------------------------------------------------
```

### Modules

Modules are defined as a sequence of definitions, that may come in any order.
The only requirements are that all imports must precede all other definitions, and that there may be at most one start function.

```k
    syntax Stmt       ::= ModuleDecl
    syntax ModuleDecl ::= "(" "module" OptionalId Defns ")"
 // -------------------------------------------------------
```

Desugaring
----------
The text format is one of the concrete formats of Wasm.
Every concrete format maps to a common structure, described as an abstract syntax.
The function `text2abstract` is a partial function which maps valid programs in the text format to the abstract format.
Some classes of invalid programs, such as those where an identifier appears in a context in which it is not declared, are undefined.

The function deals with the desugarings which are context dependent.
Other desugarings are either left for runtime or expressed as macros (for now).

### Unfolding Abbreviations

```k
    syntax Stmts ::= unfoldStmts  ( Stmts )       [function]
    syntax Defns ::= unfoldDefns  ( Defns )       [function]
                   | #unfoldDefns ( Defns , Int ) [function]
 // --------------------------------------------------------
    rule unfoldStmts(( module OID:OptionalId DS) SS) => ( module OID unfoldDefns(DS) ) unfoldStmts(SS)
    rule unfoldStmts(.Stmts) => .Stmts
    rule unfoldStmts(S SS) => S unfoldStmts(SS) [owise]

    rule unfoldDefns(DS) => #unfoldDefns(DS, 0)
    rule #unfoldDefns(.Defns, _) => .Defns
    rule #unfoldDefns(D:Defn DS, I) => D #unfoldDefns(DS, I) [owise]
```

#### Functions

```k
    syntax FuncSpec   ::= InlineImport TypeUse
 // ------------------------------------------
    rule #unfoldDefns(( func OID:OptionalId (import MOD NAME) TUSE) DS, I)
      => ( import MOD NAME (func OID TUSE) ) #unfoldDefns(DS, I)

    syntax FuncSpec   ::= InlineExport FuncSpec
 // -------------------------------------------
    rule #unfoldDefns(( func EXPO:InlineExport SPEC:FuncSpec ) DS, I)
      => #unfoldDefns(( func #freshId(I) EXPO  SPEC) DS, I +Int 1)

    rule #unfoldDefns(( func ID:Identifier ( export ENAME ) SPEC:FuncSpec ) DS, I)
      => ( export ENAME ( func ID ) ) #unfoldDefns(( func ID SPEC ) DS, I)
```

#### Tables

```k
    syntax TableSpec ::= TableElemType "(" "elem" ElemSegment ")"
 // -------------------------------------------------------------
    rule #unfoldDefns(( table funcref ( elem ELEM ) ) DS, I)
      => #unfoldDefns(( table #freshId(I) funcref ( elem ELEM ) ) DS, I +Int 1)

    rule #unfoldDefns(( table ID:Identifier funcref ( elem ELEM ) ) DS, I)
      => ( table ID #lenElemSegment(ELEM) #lenElemSegment(ELEM) funcref ):TableDefn
         ( elem  ID (offset (i32.const 0) .Instrs) ELEM )
         #unfoldDefns(DS, I)

    syntax TableSpec  ::= InlineImport TableType
 // --------------------------------------------
    rule #unfoldDefns(( table OID:OptionalId (import MOD NAME) TT:TableType ) DS, I)
      => ( import MOD NAME (table OID TT) ) #unfoldDefns(DS, I)

    syntax TableSpec  ::= InlineExport TableSpec
 // --------------------------------------------
    rule #unfoldDefns(( table EXPO:InlineExport SPEC:TableSpec ) DS, I)
      => #unfoldDefns(( table #freshId(I) EXPO SPEC ) DS, I +Int 1)

    rule #unfoldDefns(( table ID:Identifier ( export ENAME ) SPEC:TableSpec ) DS, I)
      => ( export ENAME ( table ID ) ) #unfoldDefns(( table ID SPEC ) DS, I)
```

#### Memories

```k
    syntax MemorySpec ::= "(" "data" DataString ")"
 // -----------------------------------------------
    rule #unfoldDefns(( memory ( data DATA ) ) DS, I)
      => #unfoldDefns(( memory #freshId(I) ( data DATA ) ) DS, I +Int 1)

    rule #unfoldDefns(( memory ID:Identifier ( data DATA ) ) DS, I)
      => ( memory ID #lengthDataPages(DATA) #lengthDataPages(DATA) ):MemoryDefn
         ( data   ID (offset (i32.const 0) .Instrs) DATA )
         #unfoldDefns(DS, I)

    syntax Int ::= #lengthDataPages ( DataString ) [function]
 // ---------------------------------------------------------
    rule #lengthDataPages(DS:DataString) => lengthBytes(#DS2Bytes(DS)) up/Int #pageSize()

    syntax MemorySpec ::= InlineImport MemType
 // ------------------------------------------
    rule #unfoldDefns(( memory OID:OptionalId (import MOD NAME) MT:MemType ) DS, I)
      => ( import MOD NAME (memory OID MT  ) ) #unfoldDefns(DS, I)

    syntax MemorySpec ::= InlineExport MemorySpec
 // ---------------------------------------------
    rule #unfoldDefns(( memory EXPO:InlineExport SPEC:MemorySpec ) DS, I)
      => #unfoldDefns(( memory #freshId(I:Int) EXPO SPEC ) DS, I +Int 1)

    rule #unfoldDefns(( memory ID:Identifier ( export ENAME ) SPEC:MemorySpec ) DS, I)
      => ( export ENAME ( memory ID ) ) #unfoldDefns( ( memory ID SPEC ) DS, I)
```

#### Globals

```k
    syntax GlobalSpec ::= InlineImport TextFormatGlobalType
 // -------------------------------------------------------
    rule #unfoldDefns(( global OID:OptionalId (import MOD NAME) TYP ) DS, I)
      => ( import MOD NAME (global OID TYP ) ) #unfoldDefns(DS, I) 

    syntax GlobalSpec ::= InlineExport GlobalSpec
 // ---------------------------------------------
    rule #unfoldDefns(( global EXPO:InlineExport SPEC:GlobalSpec ) DS, I)
      => #unfoldDefns(( global #freshId(I) EXPO SPEC ) DS, I +Int 1)

    rule #unfoldDefns(( global ID:Identifier ( export ENAME ) SPEC:GlobalSpec ) DS, I)
      => ( export ENAME ( global ID ) ) #unfoldDefns(( global ID SPEC ) DS, I)
```

### Sorting Modules

The text format allows definitions to appear in any order in a module.
In the abstract format, the module is a record, one for each type of definition.
The following functions convert the text format module, given as a list of definitions, into the abstract format.
In doing so, the respective ordering of all types of definitions are preserved.

```k
    syntax Stmts ::= structureModules ( Stmts ) [function]
 // ------------------------------------------------------
    rule structureModules((module OID:OptionalId DS) SS) => structureModule(DS, OID) structureModules(SS)
    rule structureModules(.Stmts) => .Stmts
    rule structureModules(S SS) => S structureModules(SS) [owise]

    syntax ModuleDecl ::=  structureModule ( Defns , OptionalId ) [function]
                        | #structureModule ( Defns , ModuleDecl ) [function]
 // ------------------------------------------------------------------------
    rule structureModule(DEFNS, OID) => #structureModule(#reverse(DEFNS, .Defns), #emptyModule(OID))

    rule #structureModule(.Defns, SORTED_MODULE) => SORTED_MODULE

    rule #structureModule((T:TypeDefn   DS:Defns => DS), #module(... types:       TS => T TS))
    rule #structureModule((I:ImportDefn DS:Defns => DS), #module(... importDefns: IS => I IS))
    rule #structureModule((X:FuncDefn   DS:Defns => DS), #module(... funcs:       FS => X FS))
    rule #structureModule((X:GlobalDefn DS:Defns => DS), #module(... globals:     GS => X GS))
    rule #structureModule((T:TableDefn  DS:Defns => DS), #module(... tables:      TS => T TS))
    rule #structureModule((M:MemoryDefn DS:Defns => DS), #module(... mems:        MS => M MS))
    rule #structureModule((E:ExportDefn DS:Defns => DS), #module(... exports:     ES => E ES))
    rule #structureModule((I:DataDefn   DS:Defns => DS), #module(... data:        IS => I IS))
    rule #structureModule((I:ElemDefn   DS:Defns => DS), #module(... elem:        IS => I IS))
    rule #structureModule((S:StartDefn  DS:Defns => DS), #module(... start:       _  => S .Defns))

    syntax Defns ::= #reverse(Defns, Defns) [function]
 // --------------------------------------------------
    rule #reverse(       .Defns  , ACC) => ACC
    rule #reverse(D:Defn DS:Defns, ACC) => #reverse(DS, D ACC)
```

## Replacing Identifiers and Unfolding Instructions

The desugaring is done on the module level.
First, if the program is just a list of definitions, that's an abbreviation for a single module.
If not, we distribute the text to abstract transformation out over all the statements in the file.

**TODO:**

-   Get rid of inline type declarations.
    The text format allows specifying the type directly in the function header using the `param` and `result` keywords.
    However, these will either be desugared to a new top-level `type` declaration or they must match an existing one.
    In the abstract format, a function's type is a pointer to a top-level `type` declaration.
    This could either be done by doing an initial pass to gather all type declarations, or they could be desugared locally, which is similar to what we do currently: `(func (type X) TDS:TDecls ... ) => (func (type X))` and `(func TDS:TDecls ...) => (type TDECLS) (func (type NEXT_TYPE_ID))`.
-   Remove module names.
-   Give the text format and abstract format different sorts, and have `text2abstract` handle the conversion.
    Then identifiers and other text-only constructs can be completely removed from the abstract format.


### The Context

The `Context` contains information of how to map text-level identifiers to corresponding indices.
Record updates can currently not be done in a function rule which also does other updates, so we have helper functions to update specific fields.

```k
    syntax Context ::= ctx(localIds: Map)
                     | #updateLocalIds    ( Context , Map )        [function, functional]
                     | #updateLocalIdsAux ( Context , Map , Bool ) [function, functional]
 // -------------------------------------------------------------------------------------
    rule #updateLocalIds(C, M) => #updateLocalIdsAux(C, M, false)
    rule #updateLocalIdsAux(ctx(... localIds: (_ => M)), M, false => true)
    rule #updateLocalIdsAux(C, _, true) => C
```

### Traversing Modules

The program is traversed in full once, context beting gathered along the way.
Since we do not have polymorphic functions available, we define one function per sort of syntactic construct we need to traverse, and for each type of list we encounter.

```k
    syntax Stmt      ::= "#t2aStmt"       "<" Context ">" "(" Stmt       ")" [function]
    syntax Defn      ::= "#t2aDefn"       "<" Context ">" "(" Defn       ")" [function]
    syntax FuncSpec  ::= "#t2aFuncSpec"   "<" Context ">" "(" FuncSpec   ")" [function]
    syntax TypeUse   ::= "#t2aTypeUse"    "<" Context ">" "(" TypeUse    ")" [function]
    syntax LocalDecl ::= "#t2aLocalDecl"  "<" Context ">" "(" LocalDecl  ")" [function]
 // -----------------------------------------------------------------------------------
    rule text2abstract(DS:Defns) => text2abstract(( module DS ) .Stmts)
    rule text2abstract(SS)       => #t2aStmts<ctx( ... localIds: .Map)>(structureModules(unfoldStmts(SS))) [owise]

    rule #t2aStmt<C>(#module(... funcs: FS => #t2aDefns<C>(FS)))
    rule #t2aStmt<C>(D:Defn)  => #t2aDefn<C>(D)
    rule #t2aStmt<C>(I:Instr) => #t2aInstr<C>(I)
    rule #t2aStmt<_>(S) => S [owise]

    rule #t2aDefn<C>(( func OID:OptionalId FS:FuncSpec )) => ( func OID #t2aFuncSpec<C>(FS))
    rule #t2aDefn<C>(D:Defn) => D [owise]

    rule #t2aFuncSpec<C>(T:TypeUse LS:LocalDecls IS:Instrs)
      => #t2aTypeUse   <#updateLocalIds(C, #ids2Idxs(T, LS))>(T)
         #t2aLocalDecls<#updateLocalIds(C, #ids2Idxs(T, LS))>(LS)
         #t2aInstrs    <#updateLocalIds(C, #ids2Idxs(T, LS))>(IS)

    rule #t2aTypeUse<_>((type TYP) TDS:TypeDecls      ) => (type TYP)
    rule #t2aTypeUse<C>((param ID:Identifier AVT) TDS ) => (param AVT) {#t2aTypeUse<C>(TDS)}:>TypeDecls
    rule #t2aTypeUse<_>(TU) => TU [owise]

    rule #t2aLocalDecl<C>(local ID:Identifier AVT:AValType) => local AVT .ValTypes
    rule #t2aLocalDecl<C>(LD) => LD [owise]
```

### Instructions

**TODO:** Desugar folded instructions.

```k
    syntax Instr ::= "#t2aInstr" "<" Context ">" "(" Instr ")" [function]
 // ---------------------------------------------------------------------
    rule #t2aInstr<C>(( PI:PlainInstr  IS:Instrs ):FoldedInstr) => ({#t2aInstr<C>(PI)}:>PlainInstr #t2aInstrs<C>(IS))
    rule #t2aInstr<C>(( PI:PlainInstr            ):FoldedInstr) =>  #t2aInstr<C>(PI)
```

#### Basic Instructions

```k
    rule #t2aInstr<_>(unreachable)      => unreachable
    rule #t2aInstr<_>(nop)              => nop
    rule #t2aInstr<_>(br L)             => br L
    rule #t2aInstr<_>(br_if L)          => br_if L
    rule #t2aInstr<_>(br_table ES)      => br_table ES
    rule #t2aInstr<_>(return)           => return
    rule #t2aInstr<_>(call F)           => call F
    rule #t2aInstr<_>(call_indirect TU) => call_indirect TU
```

#### Parametric Instructions

```k
    rule #t2aInstr<_>(drop)   => drop
    rule #t2aInstr<_>(select) => select
```

#### Variable Instructions

```k
    rule #t2aInstr<ctx(... localIds: LIDS)>(local.get ID:Identifier) => local.get {LIDS[ID]}:>Int
    rule #t2aInstr<ctx(... localIds: LIDS)>(local.set ID:Identifier) => local.set {LIDS[ID]}:>Int
    rule #t2aInstr<ctx(... localIds: LIDS)>(local.tee ID:Identifier) => local.tee {LIDS[ID]}:>Int

    rule #t2aInstr<_>(local.get I:Int) => local.get I
    rule #t2aInstr<_>(local.set I:Int) => local.set I
    rule #t2aInstr<_>(local.tee I:Int) => local.tee I
    rule #t2aInstr<_>(global.get I)    => global.get I
    rule #t2aInstr<_>(global.set I)    => global.set I
```

#### Memory Instructions

```k
    rule #t2aInstr<_>(ITYPE:IValType.OP:StoreOpM) => ITYPE.OP
    rule #t2aInstr<_>(FTYPE:FValType.OP:StoreOpM) => FTYPE.OP
    rule #t2aInstr<_>(ITYPE:IValType.OP:LoadOpM)  => ITYPE.OP
    rule #t2aInstr<_>(FTYPE:FValType.OP:LoadOpM)  => FTYPE.OP
    rule #t2aInstr<_>(memory.size)                => memory.size
    rule #t2aInstr<_>(memory.grow)                => memory.grow
```

#### Numeric Instructions

```k
    rule #t2aInstr<_>(ITYPE:IValType.const I) => ITYPE.const I
    rule #t2aInstr<_>(FTYPE:FValType.const N) => FTYPE.const N
    rule #t2aInstr<_>(ITYPE.OP:IUnOp)         => ITYPE.OP
    rule #t2aInstr<_>(FTYPE.OP:FUnOp)         => FTYPE.OP
    rule #t2aInstr<_>(ITYPE.OP:IBinOp)        => ITYPE.OP
    rule #t2aInstr<_>(FTYPE.OP:FBinOp)        => FTYPE.OP
    rule #t2aInstr<_>(ITYPE.OP:TestOp)        => ITYPE.OP
    rule #t2aInstr<_>(ITYPE.OP:IRelOp)        => ITYPE.OP
    rule #t2aInstr<_>(FTYPE.OP:FRelOp)        => FTYPE.OP
    rule #t2aInstr<_>(ATYPE.OP:CvtOp)         => ATYPE.OP
```

#### Block Instructions

There are several formats of block instructions, and the text-to-abstract transformation must be distributed over them.

**TODO:**

-   Desugar BlockInstr here, by adding labelDepth and labelIds to context.
-   Then desugar the folded versions of the block instructions here as well.

```k
    rule #t2aInstr<C>( block                TDS:TypeDecls IS end)     =>  block     TDS #t2aInstrs<C>(IS) end
    rule #t2aInstr<C>( block  ID:Identifier TDS           IS end OID) =>  block  ID TDS #t2aInstrs<C>(IS) end OID
    rule #t2aInstr<C>((block OID:OptionalId TDS           IS))        => (block OID TDS #t2aInstrs<C>(IS))

    rule #t2aInstr<C>( loop                 TDS IS end)      =>  loop     TDS #t2aInstrs<C>(IS) end
    rule #t2aInstr<C>( loop  ID:Identifier  TDS IS end OID') =>  loop ID  TDS #t2aInstrs<C>(IS) end OID'
    rule #t2aInstr<C>((loop OID:OptionalId  TDS IS))         => (loop OID TDS #t2aInstrs<C>(IS))

    rule #t2aInstr<C>( if                TDS IS else IS'                 end)       =>  if     TDS #t2aInstrs<C>(IS) else      #t2aInstrs<C>(IS') end
    rule #t2aInstr<C>( if  ID:Identifier TDS IS else OID':OptionalId IS' end OID'') =>  if  ID TDS #t2aInstrs<C>(IS) else OID' #t2aInstrs<C>(IS') end OID''
    rule #t2aInstr<C>( if OID:OptionalId TDS IS                          end OID'') =>  if OID TDS #t2aInstrs<C>(IS)                              end OID''
    rule #t2aInstr<C>((if OID:OptionalId TDS COND (then IS)))                       => (if OID TDS #t2aInstrs<C>(COND) (then #t2aInstrs<C>(IS)))
    rule #t2aInstr<C>((if OID:OptionalId TDS COND (then IS) (else IS')))            => (if OID TDS #t2aInstrs<C>(COND) (then #t2aInstrs<C>(IS)) (else #t2aInstrs<C>(IS')))
```

#### KWasm Administrative Instructions

The following instructions are not part of the official Wasm text format.
They are currently supported in KWasm text files, but may be deprecated.

```k
    rule #t2aInstr<C>(trap) => trap

    rule #t2aInstr<C>(block VT:VecType IS:Instrs end) => block VT #t2aInstrs<C>(IS) end

    rule #t2aInstr<_>(init_local I V) => init_local I V
    rule #t2aInstr<_>(init_locals VS) => init_locals VS
```

### List Functions

The following are helper functions.
They distribute the text-to-abstract functions above over lists.

```k
    syntax Stmts      ::= "#t2aStmts"      "<" Context ">" "(" Stmts      ")" [function]
    syntax Defns      ::= "#t2aDefns"      "<" Context ">" "(" Defns      ")" [function]
    syntax Instrs     ::= "#t2aInstrs"     "<" Context ">" "(" Instrs     ")" [function]
    syntax LocalDecls ::= "#t2aLocalDecls" "<" Context ">" "(" LocalDecls ")" [function]
 // ------------------------------------------------------------------------------------
    rule #t2aStmts<C>(S:Stmt SS:Stmts) => #t2aStmt<C>(S) #t2aStmts<C>(SS)
    rule #t2aStmts<_>(.Stmts) => .Stmts

    rule #t2aDefns<C>(D:Defn DS:Defns) => #t2aDefn<C>(D) #t2aDefns<C>(DS)
    rule #t2aDefns<_>(.Defns) => .Defns

    rule #t2aInstrs<C>(I:Instr IS:Instrs) => #t2aInstr<C>(I) #t2aInstrs<C>(IS)
    rule #t2aInstrs<_>(.Instrs) => .Instrs

    rule #t2aLocalDecls<C>(LD:LocalDecl LDS:LocalDecls) => #t2aLocalDecl<C>(LD) #t2aLocalDecls<C>(LDS)
    rule #t2aLocalDecls<_>(.LocalDecls) => .LocalDecls
```

### Functions for Gathering Context

The following are helper functions for gathering and updating context.

```k
    syntax Map ::= #ids2Idxs(TypeUse, LocalDecls)      [function, functional]
                 | #ids2Idxs(Int, TypeUse, LocalDecls) [function, functional]
 // -------------------------------------------------------------------------
    rule #ids2Idxs(TU, LDS) => #ids2Idxs(0, TU, LDS)

    rule #ids2Idxs(_, .TypeDecls, .LocalDecls) => .Map
    rule #ids2Idxs(N, (type _)    , LDS) => #ids2Idxs(N, .TypeDecls, LDS)
    rule #ids2Idxs(N, (type _) TDS, LDS) => #ids2Idxs(N, TDS       , LDS)

    rule #ids2Idxs(N, (param ID:Identifier _) TDS, LDS)
      => (ID |-> N) #ids2Idxs(N +Int 1, TDS, LDS)
    rule #ids2Idxs(N, (param _)   TDS, LDS) => #ids2Idxs(N +Int 1, TDS, LDS)
    rule #ids2Idxs(N, TD:TypeDecl TDS, LDS) => #ids2Idxs(N       , TDS, LDS) [owise]

    rule #ids2Idxs(N, .TypeDecls, local ID:Identifier _ LDS:LocalDecls)
      => (ID |-> N) #ids2Idxs(N +Int 1, .TypeDecls, LDS)
    rule #ids2Idxs(N, .TypeDecls, LD:LocalDecl LDS) => #ids2Idxs(N +Int 1, .TypeDecls, LDS) [owise]
```

```k
endmodule
```
