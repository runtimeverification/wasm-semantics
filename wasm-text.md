WebAssembly Text Format
=======================

```k
require "wasm.k"
require "data.k"

module WASM-TEXT-SYNTAX
    imports WASM-TEXT
    imports WASM-SYNTAX
```

Identifiers
-----------

In WebAssembly, identifiers are defined by the regular expression below.

```k
    syntax Identifier ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=:\\@^.-]+" [token]
 // -----------------------------------------------------------------------
```

Integers
--------

In WebAssembly, integers could be represented in either the decimal form or hexadecimal form.
In both cases, digits can optionally be separated by underscores.

```k
    syntax WasmInt ::= r"[\\+-]?[0-9]+(_[0-9]+)*"               [token]
                     | r"[\\+-]?0x[0-9a-fA-F]+(_[0-9a-fA-F]+)*" [token]
 // -------------------------------------------------------------------
```

```k
endmodule
```

```k
module WASM-TEXT
    imports WASM
```

The text format is a concrete syntax for Wasm.
Most instructions, those in the sort `PlainInstr`, have identical keywords in the abstract and concrete syntax, and can be used idrectly.

Values
------

We define `NValType` which stands for `named valtype`, representing values that has an identifier associated to it.

```k
    syntax NValType ::= "{" Identifier AValType "}"
    syntax ValType ::= NValType
 // ---------------------------
    rule unnameValTypes ( { ID V } VS )   => V unnameValTypes ( VS )
    rule <k> #init_localids I:Int { ID V }   VS => #init_localids I +Int 1 VS ... </k>
         <localIds> LOCALIDS => LOCALIDS [ ID <- I ] </localIds>
```

Folded Instructions
-------------------

Folded instructions are a syntactic sugar where expressions can be grouped using parentheses, like S-expressions, for higher readability.

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

Identifiers
-----------

In `KWASM` rules, we use `#freshId ( Int )` to generate a fresh identifier based on the element index in the current module.
And we use `OptionalId` to handle the case where an identifier could be omitted.

```k
    syntax Identifier ::= #freshId ( Int )
    syntax OptionalId ::= "" [klabel(.Identifier)]
                        | Identifier
 // --------------------------------
```

In the abstract Wasm syntax, indices are always integers.
In the text format, we extend indices to incorporate identifiers.

```k
    syntax Index ::= Identifier
 // ---------------------------
```

We enable context lookups with identifiers.

```k
    rule #ContextLookup(IDS:Map, ID:Identifier) => {IDS [ ID ]}:>Int
      requires ID in_keys(IDS)
```

Block Instructions
------------------

In the text format, block instructions can have identifiers attached to them, and branch instructions can refer to these identifiers.
First, we allow identifiers on labels.

```k
    syntax Label ::= "label" Identifier VecType "{" Instrs "}" ValStack
 // --------------------------------------------------------------------
    rule <k> label _:Identifier [ TYPES ] { _ } VALSTACK' => . ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>
```

Then, we define how to branch to identifiers, and how the branches using integers still match on named labels.

```k
    rule <k> br 0     ~> ( label _:Identifier [ TYPES ] { IS } VALSTACK' => label [ TYPES ] { IS } VALSTACK' ) ... </k>

    rule <k> br ID:Identifier ~> label ID  [ TYPES ] { IS } VALSTACK' => IS ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>
    rule <k> br ID:Identifier ~> label [ TYPES ] { IS } VALSTACK' => br ID ... </k>
    rule <k> br ID:Identifier ~> label ID' [ TYPES ] { IS } VALSTACK' => br ID ... </k>
      requires ID =/=K ID'
```

Finally, we introduce the text format block instructions, which may have identifiers after each keyword.
If more than one identifier is present, they all have to agree (they are just there to make clear what if-block they belong to).
If identifiers are used, one must occur after the initial keyword (`block`, `if` or `loop`).

```k
    syntax Instr ::= BlockInstr
 // ---------------------------

    syntax BlockInstr ::= "block" Identifier TypeDecls Instrs "end" OptionalId
 // --------------------------------------------------------------------------
    rule <k> block ID:Identifier TDECLS IS end OID':OptionalId => IS ~> label ID gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
      requires ID ==K OID'
        orBool notBool isIdentifier(OID')

    syntax BlockInstr ::= "loop" Identifier TypeDecls Instrs "end" OptionalId
 // -------------------------------------------------------------------------
    rule <k> loop ID:Identifier TDECLS:TypeDecls IS end OID':OptionalId => IS ~> label ID gatherTypes(result, TDECLS) { loop ID TDECLS IS end } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
      requires ID ==K OID'
        orBool notBool isIdentifier(OID')
```

In the text format, it is also allowed to have a conditional without the `else` branch.

```k
    syntax BlockInstr ::= "if" Identifier TypeDecls Instrs "else" OptionalId Instrs "end" OptionalId
                        | "if" OptionalId TypeDecls Instrs                          "end" OptionalId
 // ------------------------------------------------------------------------------------------------
    rule <k> if TDECLS:TypeDecls IS end => if TDECLS IS else .Instrs end ... </k>

    rule <k> if ID:Identifier TDECLS:TypeDecls IS                         end OID'':OptionalId => if ID TDECLS IS else ID .Instrs end ID ... </k>
      requires ID ==K OID''
        orBool notBool isIdentifier(OID'')

    rule <k> if ID:Identifier TDECLS:TypeDecls IS else OID':OptionalId IS' end OID'':OptionalId => IS  ~> label ID gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL =/=Int 0
       andBool ( ID ==K OID'  orBool notBool isIdentifier(OID')  )
       andBool ( ID ==K OID'' orBool notBool isIdentifier(OID'') )

    rule <k> if ID:Identifier TDECLS:TypeDecls IS else OID':OptionalId IS' end OID'':OptionalId => IS' ~> label ID gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL ==Int 0
       andBool ( ID ==K OID'  orBool notBool isIdentifier(OID')  )
       andBool ( ID ==K OID'' orBool notBool isIdentifier(OID'') )
```

Definitions
-----------

TODO: It's pretty ugly to access `NEXTIDX` the way we are doing here, ideally it should be more functional.

```k
    syntax DefinitionType ::= "type" | "func" | "table" | "memory" | "global" | "module"
    syntax Instr ::= "#saveIdentifier" DefinitionType OptionalId
 // ------------------------------------------------------------
    rule <k> #saveIdentifier _:DefinitionType => . ... </k>

    rule <k> #saveIdentifier type ID:Identifier => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> IDS => IDS [ID <- NEXTIDX -Int 1] </typeIds>
           <nextTypeIdx> NEXTIDX </nextTypeIdx>
           ...
         </moduleInst>

    rule <k> #saveIdentifier func ID:Identifier => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcIds> IDS => IDS [ID <- NEXTIDX -Int 1] </funcIds>
           <nextFuncIdx> NEXTIDX </nextFuncIdx>
           ...
         </moduleInst>

    rule <k> #saveIdentifier table ID:Identifier => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS => IDS [ ID <- 0] </tabIds>
           ...
         </moduleInst>

    rule <k> #saveIdentifier memory ID:Identifier => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS => IDS [ ID <- 0] </memIds>
           ...
         </moduleInst>

    rule <k> #saveIdentifier global ID:Identifier => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS => IDS [ID <- NEXTIDX -Int 1] </globIds>
           <nextGlobIdx> NEXTIDX </nextGlobIdx>
           ...
         </moduleInst>

    rule <k> #saveIdentifier module ID:Identifier => . ... </k>
         <moduleIds> IDS => IDS [ID <- NEXTIDX -Int 1 ] </moduleIds>
         <nextModuleIdx> NEXTIDX </nextModuleIdx>
```

### Types

Type could be declared explicitly and could optionally bind with an identifier.
`identifier` for `param` will be used only when the function type is declared when defining a function.
When defining `TypeDefn`, the `identifier` for `param` will be ignored and will not be saved into the module instance.

```k
    syntax TypeDecl  ::= "(" TypeDecl ")"     [bracket]
                       | "param" Identifier AValType
 // ------------------------------------------------
    rule #gatherTypes(result , param ID:Identifier     _:AValType TDECLS:TypeDecls , TYPES) => #gatherTypes(result , TDECLS , TYPES)
    rule #gatherTypes(param  , param ID:Identifier VTYPE:AValType TDECLS:TypeDecls , TYPES) => #gatherTypes(param  , TDECLS , TYPES + { ID VTYPE } .ValTypes)

    syntax TypeDefn ::= "(type" OptionalId "(" "func" TypeDecls ")" ")"
 // ----------------------------------------------------------------------
    rule <k> (type OID:OptionalId ( func TDECLS ) ) => ftype { TDECLS } ~> #saveIdentifier type OID ... </k>
```

### Functions

```k
    syntax FuncDefn ::= "(" "func" OptionalId FuncSpec ")"
 // ------------------------------------------------------
    rule <k> ( func OID:OptionalId TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs ) => func { TUSE LDECLS INSTRS } ~> #saveIdentifier func OID ... </k>
```

#### Locals

```k
    syntax LocalDecl ::= "local" Identifier AValType
 // ------------------------------------------------
    rule #asLocalType(local ID:Identifier VTYPE:AValType   LDECLS:LocalDecls , VTYPES) => #asLocalType(LDECLS , VTYPES + { ID VTYPE } .ValTypes)
```

### Globals

The declaration of mutable/immutable globals differ between text format and abstract syntax.
In the abstract syntax, types are tagged with `var` or `const`, whereas in the text format, contants types are untagged and mutable types are tagged with `mut`.

```k
    syntax TextFormatGlobalType ::= AValType | "(" "mut" AValType ")"
    syntax GlobalType ::= asGMut (TextFormatGlobalType) [function]
 // --------------------------------------------------------------
    rule asGMut ( (mut T:AValType ) ) => var   T
    rule asGMut (      T:AValType   ) => const T

    syntax GlobalSpec ::= TextFormatGlobalType Instr
    syntax GlobalDefn ::= "(" "global" OptionalId GlobalSpec ")"
 // ------------------------------------------------------------
    rule <k> ( global OID:OptionalId TYP:TextFormatGlobalType IS:Instr )
          => global { asGMut(TYP) IS }
          ~> #saveIdentifier global OID
          ...
         </k>
```

### Memories and Tables

The `MemorySpec` and `TableSpec` productions are used to define all ways that a memory and table can specified.

```k
    syntax MemorySpec ::= MemType
    syntax MemoryDefn ::= "(" "memory" OptionalId MemorySpec ")"
 // ------------------------------------------------------------
    rule <k> ( memory OID:OptionalId MIN:Int         ):MemoryDefn => memory { MIN .Int } ~> #saveIdentifier memory OID ... </k>
      requires MIN <=Int #maxMemorySize()
    rule <k> ( memory OID:OptionalId MIN:Int MAX:Int ):MemoryDefn => memory { MIN MAX  } ~> #saveIdentifier memory OID ... </k>
      requires MIN <=Int #maxMemorySize()
       andBool MAX <=Int #maxMemorySize()

    syntax TableSpec ::= TableType
    syntax TableDefn ::= "(" "table" OptionalId TableSpec ")"
 // ---------------------------------------------------------
    rule <k> ( table OID:OptionalId MIN:Int         funcref ):TableDefn => table { MIN .Int } ~> #saveIdentifier table OID ... </k>
      requires MIN <=Int #maxTableSize()
    rule <k> ( table OID:OptionalId MIN:Int MAX:Int funcref ):TableDefn => table { MIN MAX  } ~> #saveIdentifier table OID... </k>
      requires MIN <=Int #maxTableSize()
       andBool MAX <=Int #maxTableSize()

```

Intitial memory data, and initial table elements can be given inline in the text format.

```k
    syntax MemorySpec ::= "(" "data" DataString ")"
 // -----------------------------------------------
    rule <k> ( memory ( data DS ) ) => ( memory #freshId(NEXTID) (data DS) ) ... </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( memory ID:Identifier ( data DS ) )
          => ( memory ID #lengthDataPages(DS) #lengthDataPages(DS) ):MemoryDefn
          ~> ( data ID (i32.const 0) DS ) ... </k>
      requires #lengthDataPages(DS) <=Int #maxMemorySize()

    syntax TableSpec ::= TableElemType "(" "elem" ElemSegment ")"
 // -------------------------------------------------------------
    rule <k> ( table funcref ( elem ES ) ) => ( table #freshId(NEXTID) funcref (elem ES) ) ... </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( table ID:Identifier funcref ( elem ES ) )
          => ( table ID #lenElemSegment(ES) #lenElemSegment(ES) funcref ):TableDefn
          ~> ( elem ID (i32.const 0) ES )
          ...
         </k>
```

Exports
-------

Exports can be declared like regular functions, memories, etc., by giving an inline export declaration.
In that case, it simply desugars to the definition followed by an export of it.
If no identifer is present, one must be introduced so that the export can refer to it.
Note that it is possible to define multiple exports inline, i.e. export a single entity under many names.

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

Imports can optionally have identifiers.

```k
    syntax ImportDefn ::= "(" "import" WasmString WasmString ImportDesc ")"
    syntax ImportDesc ::= "(" "func"   OptionalId TypeUse              ")" [klabel(funcImportDesc)]
                        | "(" "table"  OptionalId TableType            ")" [klabel( tabImportDesc)]
                        | "(" "memory" OptionalId MemType              ")" [klabel( memImportDesc)]
                        | "(" "global" OptionalId TextFormatGlobalType ")" [klabel(globImportDesc)]
 // -----------------------------------------------------------------------------------------------
    rule <k> ( import MOD NAME (func   OID:OptionalId TUSE) ) => import { MOD NAME func   TUSE         } ~> #saveIdentifier func   OID ... </k>
    rule <k> ( import MOD NAME (table  OID:OptionalId TTYP) ) => import { MOD NAME table  TTYP         } ~> #saveIdentifier table  OID ... </k>
    rule <k> ( import MOD NAME (memory OID:OptionalId MTYP) ) => import { MOD NAME memory MTYP         } ~> #saveIdentifier memory OID ... </k>
    rule <k> ( import MOD NAME (global OID:OptionalId GTYP) ) => import { MOD NAME global asGMut(GTYP) } ~> #saveIdentifier global OID ... </k>
```

Imports can be declared like regular functions, memories, etc., by giving an inline import declaration.

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

Modules
-------

In the text format, a module may have an identifier.
The definitions may appear in any order, so before starting module instantiation, the defintions must be structured.

```k
    syntax ModuleDecl ::= "(" "module" OptionalId Defns ")"
 // -------------------------------------------------------
    rule <k> ( module OID:OptionalId DEFNS ) => module structureModule(DEFNS) ~> #saveIdentifier module OID ... </k>
```

However, there are some dependencies among definitions that require that we do them in a certain order, even though they may appear in many valid orders.
First, functions, tables, memories and globals get *allocated*.
Then, tables, memories and globals get *instantiated* with elements, data and initialization vectors.
However, since (currently) globals can only make use of imported globals to be instantiated, we can initialize at allocation time.
Finally, the start function is invoked.
Exports may appear anywhere in a module, but can only be performed after what they refer to has been allocated.
Exports that are inlined in a definition, e.g., `func (export "foo") ...`, are safe to extract as they appear.
Imports must appear before any allocations in a module, due to validation.

A subtle point is related to tables with inline `elem` definitions: since these may refer to functions by identifier, we need to make sure that tables definitions come after function definitions.

`structureModule` takes a list of definitions and returns a map with different groups of definitions, preserving the order within each group.
The groups are chosen to represent different stages of allocation and instantiation.

```k
    syntax Map ::=  structureModule (     Defns) [function]
                 | #structureModule (Map, Defns) [function]
                 | #initialMap ()                [function]
 // -------------------------------------------------------
    rule #initialMap ()
      => "types"     |-> .Defns
         "imports"   |-> .Defns
         "functions" |-> .Defns
         "tables"    |-> .Defns
         "memories"  |-> .Defns
         "globals"   |-> .Defns
         "exports"   |-> .Defns
         "start"     |-> .Defns
         "elem"      |-> .Defns
         "data"      |-> .Defns

    rule structureModule(DS) => #structureModule(#initialMap (), #reverse(DS, .Defns))

    rule #structureModule(M,                  .Defns) => M
    rule #structureModule(M, (T:TypeDefn    DS:Defns)) => #structureModule(M ["types"     <- (T  {M ["types"    ]}:>Defns)], DS)
    rule #structureModule(M, (I:ImportDefn  DS:Defns)) => #structureModule(M ["imports"   <- (I  {M ["imports"  ]}:>Defns)], DS)
    rule #structureModule(M, (F:FuncDefn    DS:Defns)) => #structureModule(M ["functions" <- (F  {M ["functions"]}:>Defns)], DS)
    rule #structureModule(M, (T:TableDefn   DS:Defns)) => #structureModule(M ["tables"    <- (T  {M ["tables"   ]}:>Defns)], DS)
    rule #structureModule(M, (MM:MemoryDefn DS:Defns)) => #structureModule(M ["memories"  <- (MM {M ["memories" ]}:>Defns)], DS)
    rule #structureModule(M, (G:GlobalDefn  DS:Defns)) => #structureModule(M ["globals"   <- (G  {M ["globals"  ]}:>Defns)], DS)
    rule #structureModule(M, (E:ExportDefn  DS:Defns)) => #structureModule(M ["exports"   <- (E  {M ["exports"  ]}:>Defns)], DS)
    rule #structureModule(M, (S:StartDefn   DS:Defns)) => #structureModule(M ["start"     <- (S  .Defns                  )], DS)
    rule #structureModule(M, (E:ElemDefn    DS:Defns)) => #structureModule(M ["elem"      <- (E  {M ["elem"     ]}:>Defns)], DS)
    rule #structureModule(M, (D:DataDefn    DS:Defns)) => #structureModule(M ["data"      <- (D  {M ["data"     ]}:>Defns)], DS)

    syntax Defns ::= #reverse(Defns, Defns) [function]
 // --------------------------------------------------
    rule #reverse(       .Defns  , ACC) => ACC
    rule #reverse(D:Defn DS:Defns, ACC) => #reverse(DS, D ACC)
```

It is permissible to define modules without the `module` keyword, by simply stating the definitions at the top level in the file.

```k
    rule <k> D:Defn => ( module .Defns ) ~> D ... </k>
         <curModIdx> .Int </curModIdx>
```

### Binary Modules

**TODO**: Implement modules represented in binary format.

```k
    syntax ModuleDecl ::= "(" "module" OptionalId "binary" DataString ")"
                        | "module" "binary" Int
 // -------------------------------------------
    rule <k> ( module OID binary DS ) => module binary Bytes2Int(#DS2Bytes(DS), LE, Unsigned) ... </k>
    rule <k> module binary I => . ... </k>
```

```k
endmodule
```
