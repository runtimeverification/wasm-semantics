WebAssembly State and Semantics
===============================

```k
require "data.k"
require "numeric.k"

module WASM
    imports WASM-DATA
    imports WASM-NUMERIC
```

Configuration
-------------

```k
    configuration
      <wasm>
        <k> $PGM:Stmts </k>
        <valstack> .ValStack </valstack>
        <curFrame>
          <locals>    .Map </locals>
          <localIds>  .Map </localIds>
          <curModIdx> .Int </curModIdx>
          <labelDepth> 0   </labelDepth>
          <labelIds>  .Map </labelIds>
        </curFrame>
        <moduleRegistry> .Map </moduleRegistry>
        <moduleIds> .Map </moduleIds>
        <moduleInstances>
          <moduleInst multiplicity="*" type="Map">
            <modIdx>      0    </modIdx>
            <exports>     .Map </exports>
            <typeIds>     .Map </typeIds>
            <types>       .Map </types>
            <nextTypeIdx> 0    </nextTypeIdx>
            <funcIds>     .Map </funcIds>
            <funcAddrs>   .Map </funcAddrs>
            <nextFuncIdx> 0    </nextFuncIdx>
            <tabIds>      .Map </tabIds>
            <tabAddrs>    .Map </tabAddrs>
            <memIds>      .Map </memIds>
            <memAddrs>    .Map </memAddrs>
            <globIds>     .Map </globIds>
            <globalAddrs> .Map </globalAddrs>
            <nextGlobIdx>   0    </nextGlobIdx>
          </moduleInst>
        </moduleInstances>
        <nextModuleIdx> 0 </nextModuleIdx>
        <mainStore>
          <funcs>
            <funcDef multiplicity="*" type="Map">
              <fAddr>    0              </fAddr>
              <fCode>    .Instrs:Instrs </fCode>
              <fType>    .Type          </fType>
              <fLocal>   .Type          </fLocal>
              <fModInst> 0              </fModInst>
            </funcDef>
          </funcs>
          <nextFuncAddr> 0 </nextFuncAddr>
          <tabs>
            <tabInst multiplicity="*" type="Map">
              <tAddr> 0    </tAddr>
              <tmax>  .Int </tmax>
              <tsize> 0    </tsize>
              <tdata> .Map </tdata>
            </tabInst>
          </tabs>
          <nextTabAddr> 0 </nextTabAddr>
          <mems>
            <memInst multiplicity="*" type="Map">
              <mAddr> 0                  </mAddr>
              <mmax>  .Int               </mmax>
              <msize> 0                  </msize>
              <mdata> ByteMap <| .Map |> </mdata>
            </memInst>
          </mems>
          <nextMemAddr> 0 </nextMemAddr>
          <globals>
            <globalInst multiplicity="*" type="Map">
              <gAddr>  0         </gAddr>
              <gValue> undefined </gValue>
              <gMut>   .Mut      </gMut>
            </globalInst>
          </globals>
          <nextGlobAddr> 0 </nextGlobAddr>
        </mainStore>
        <deterministicMemoryGrowth> true </deterministicMemoryGrowth>
        <nextFreshId> 0 </nextFreshId>
      </wasm>
```

### Assumptions and invariants

Integers in K are unbounded.
As an invariant, however, for any integer `< iNN > I:Int` on the stack, `I` is between 0 and `#pow(NN) - 1`.
That way, unsigned instructions can make use of `I` directly, whereas signed instructions may need `#signed(iNN, I)`.

The highest address in a memory instance divided by the `#pageSize()` constant (defined below) may not exceed the value in the `<max>` cell, if present.

Since memory data is bytes, all integers in the `Map` in the `<mdata>` cell are bounded to be between 1 and 255, inclusive.
All places in the data with no entry are considered zero bytes.

Instructions
------------

### Text Format

WebAssmebly code consists of instruction sequences.
The basic abstract syntax contains only the `instr` syntax production.
The text format also specifies the `plaininstr`, which corresponds almost exactly to the the `instr` production.

Most instructions are plain instructions.

```k
    syntax Instr ::= PlainInstr
 // ---------------------------
```

### Sequencing

WebAssembly code consists of sequences of statements (`Stmts`).
In this file we define 3 types of statements:

-   Instruction (`Instr`): Administrative or computational instructions.
-   Definitions (`Defn`) : The declarations of `type`, `func`, `table`, `mem` etc.
-   The Declaration of a module.

The sorts `EmptyStmt` and `EmptyStmts` are administrative so that the empty list of `Stmt`, `Instr`, or `Defn` has a unique least sort.

```k
    syntax EmptyStmt
 // ----------------

    syntax Instr ::= EmptyStmt
    syntax Defn  ::= EmptyStmt
    syntax Stmt  ::= Instr | Defn
 // -----------------------------

    syntax EmptyStmts ::= List{EmptyStmt , ""} [klabel(listStmt)]
    syntax Instrs     ::= List{Instr     , ""} [klabel(listStmt)]
    syntax Defns      ::= List{Defn      , ""} [klabel(listStmt)]
    syntax Stmts      ::= List{Stmt      , ""} [klabel(listStmt)]
 // -------------------------------------------------------------

    syntax Instrs ::= EmptyStmts
    syntax Defns  ::= EmptyStmts
    syntax Stmts  ::= Instrs | Defns
 // --------------------------------
    rule          <k> .Stmts          => .       ... </k>
    rule          <k> (S:Stmt .Stmts) => S       ... </k>
    rule [step] : <k> (S:Stmt SS)     => S ~> SS ... </k> requires SS =/=K .Stmts
```

### Traps

`trap` is the error mechanism of Wasm.
Traps cause all execution to halt, and can not be caught from within Wasm.
We emulate this by consuming everything in the `<k>` cell that is not a `Stmt`.
Statements are not part of Wasm semantics, but rather of the embedder, and is where traps can be caught.
Thus, a `trap` "bubbles up" (more correctly, to "consumes the continuation") until it reaches a statement which is not an `Instr` or `Def`.

```k
    syntax Instr ::= "trap"
 // -----------------------
    rule <k> trap ~> (L:Label   => .) ... </k>
    rule <k> trap ~> (F:Frame   => .) ... </k>
    rule <k> trap ~> (I:Instr   => .) ... </k>
    rule <k> trap ~> (IS:Instrs => .) ... </k>
    rule <k> trap ~> (D:Defn    => .) ... </k>
    rule <k> trap ~> (DS:Defns  => .) ... </k>

    rule <k> trap ~> (S:Stmt SS:Stmts => S ~> SS) ... </k>
```

When a single value ends up on the instruction stack (the `<k>` cell), it is moved over to the value stack (the `<valstack>` cell).
If the value is the special `undefined`, then `trap` is generated instead.

```k
    rule <k> undefined => trap ... </k>
    rule <k>        V:Val    => .        ... </k>
         <valstack> VALSTACK => V : VALSTACK </valstack>
      requires V =/=K undefined
```

Common Operator Machinery
-------------------------

Common machinery for operators is supplied here, based on their categorization.
This allows us to give purely functional semantics to many of the opcodes.

### Constants

Constants are moved directly to the value stack.
Function `#unsigned` is called on integers to allow programs to use negative numbers directly.
**TODO**: Implement `Float` in the format of `-nan`, `nan:0x n:hexnum` and `hexfloat`.

```k
    syntax PlainInstr ::= IValType "." "const" Int
                        | FValType "." "const" Number
 // -------------------------------------------------
    rule <k> ITYPE:IValType . const VAL => #chop (< ITYPE > VAL) ... </k>
    rule <k> FTYPE:FValType . const VAL => #round(  FTYPE , VAL) ... </k>
```

### Unary Operations

When a unary operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.
An `*UnOp` operator always produces a result of the same type as its operand.

```k
    syntax PlainInstr ::= IValType "." IUnOp
                        | FValType "." FUnOp
 // ----------------------------------------
    rule <k> ITYPE . UOP:IUnOp => ITYPE . UOP C1 ... </k>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <k> FTYPE . UOP:FUnOp => FTYPE . UOP C1 ... </k>
         <valstack> < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Binary Operations

When a binary operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.

```k
    syntax PlainInstr ::= IValType "." IBinOp
                        | FValType "." FBinOp
 // -----------------------------------------
    rule <k> ITYPE . BOP:IBinOp => ITYPE . BOP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <k> FTYPE . BOP:FBinOp => FTYPE . BOP C1 C2 ... </k>
         <valstack> < FTYPE > C2 : < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Test Operations

When a test operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.

```k
    syntax PlainInstr ::= IValType "." TestOp
 // -----------------------------------------
    rule <k> TYPE . TOP:TestOp => TYPE . TOP C1 ... </k>
         <valstack> < TYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Relationship Operations

When a relationship operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.

```k
    syntax PlainInstr ::= IValType "." IRelOp
                        | FValType "." FRelOp
 // -----------------------------------------
    rule <k> ITYPE . ROP:IRelOp => ITYPE . ROP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <k> FTYPE . ROP:FRelOp => FTYPE . ROP C1 C2 ... </k>
         <valstack> < FTYPE > C2 : < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Conversion Operations

Conversion Operation convert constant elements at the top of the stack to another type.

```k
    syntax PlainInstr ::= AValType "." CvtOp
 // ----------------------------------------
    rule <k> ATYPE:AValType . CVTOP:Cvti32Op => ATYPE . CVTOP C1  ... </k>
         <valstack> < i32 > C1 : VALSTACK => VALSTACK </valstack>

    rule <k> ATYPE:AValType . CVTOP:Cvti64Op => ATYPE . CVTOP C1  ... </k>
         <valstack> < i64 > C1 : VALSTACK => VALSTACK </valstack>

    rule <k> ATYPE:AValType . CVTOP:Cvtf32Op => ATYPE . CVTOP C1  ... </k>
         <valstack> < f32 > C1 : VALSTACK => VALSTACK </valstack>

    rule <k> ATYPE:AValType . CVTOP:Cvtf64Op => ATYPE . CVTOP C1  ... </k>
         <valstack> < f64 > C1 : VALSTACK => VALSTACK </valstack>
```

ValStack Operations
-------------------

Operator `drop` removes a single item from the `<valstack>`.
The `select` operator picks one of the second or third stack values based on the first.

```k
    syntax PlainInstr ::= "drop"
 // ----------------------------
    rule <k> drop => . ... </k>
         <valstack> _ : VALSTACK => VALSTACK </valstack>

    syntax PlainInstr ::= "select"
 // ------------------------------
    rule <k> select => . ... </k>
         <valstack>
           < i32 > C : < TYPE > V2:Number : < TYPE > V1:Number : VALSTACK
      =>   < TYPE > #if C =/=Int 0 #then V1 #else V2 #fi       : VALSTACK
         </valstack>
```

Structured Control Flow
-----------------------

`nop` does nothing.

```k
    syntax PlainInstr ::= "nop"
 // ---------------------------
    rule <k> nop => . ... </k>
```

`unreachable` causes an immediate `trap`.

```k
    syntax PlainInstr ::= "unreachable"
 // -----------------------------------
    rule <k> unreachable => trap ... </k>
```

Labels are administrative instructions used to mark the targets of break instructions.
They contain the continuation to use following the label, as well as the original stack to restore.
The supplied type represents the values that should taken from the current stack.

A block is the simplest way to create targets for break instructions (ie. jump destinations).
It simply executes the block then records a label with an empty continuation.

We keep track of the number of labels on the stack, incrementing and decrementing the `<labelDepth>` counter when one is introduced or removed.

```k
    syntax Label ::= "label" VecType "{" Instrs "}" ValStack
 // --------------------------------------------------------
    rule <k> label [ TYPES ] { _ } VALSTACK' => . ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>
         <labelDepth> DEPTH => DEPTH -Int 1 </labelDepth>

    syntax Instr ::= "block" TypeDecls Instrs "end"
                   | "block" VecType   Instrs "end"
 // -----------------------------------------------
    rule <k> block TDECLS:TypeDecls IS end => block gatherTypes(result, TDECLS) IS end ... </k>
    rule <k> block VECTYP:VecType   IS end => IS ~> label VECTYP { .Instrs } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
         <labelDepth> DEPTH => DEPTH +Int 1 </labelDepth>
```

The `br*` instructions search through the instruction stack (the `<k>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WebAssembly specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax PlainInstr ::= "br" Index
 // --------------------------------
    rule <k> br IDX   ~> (SS:Stmts => .) ... </k>
    rule <k> br IDX   ~> ( I:Instr => .) ... </k>
    rule <k> br 0     ~> label [ TYPES ] { IS } VALSTACK' => IS ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>
         <labelDepth> DEPTH => DEPTH -Int 1 </labelDepth>
    rule <k> br N:Int ~> L:Label => br N -Int 1 ... </k>
         <labelDepth> DEPTH => DEPTH -Int 1 </labelDepth>
      requires N >Int 0

    syntax PlainInstr ::= "br_if" Index
 // -----------------------------------
    rule <k> br_if IDX => br IDX ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL =/=Int 0
    rule <k> br_if IDX => .    ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL  ==Int 0

    syntax PlainInstr ::= "br_table" ElemSegment
 // --------------------------------------------
    rule <k> br_table ES:ElemSegment => br #getElemSegment(ES, minInt(VAL, #lenElemSegment(ES) -Int 1)) ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
```

Finally, we have the conditional and loop instructions.

```k
    syntax Instr ::= "if" TypeDecls Instrs "else" Instrs "end"
 // ----------------------------------------------------------
    rule <k> if TDECLS:TypeDecls IS else IS' end => IS  ~> label gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
         <labelDepth> DEPTH => DEPTH +Int 1 </labelDepth>
      requires VAL =/=Int 0

    rule <k> if TDECLS:TypeDecls IS else IS' end => IS' ~> label gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
         <labelDepth> DEPTH => DEPTH +Int 1 </labelDepth>
      requires VAL ==Int 0

    syntax Instr ::= "loop" TypeDecls Instrs "end"
 // ----------------------------------------------
    rule <k> loop TDECLS:TypeDecls IS end => IS ~> label gatherTypes(result, TDECLS) { loop TDECLS IS end } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
         <labelDepth> DEPTH => DEPTH +Int 1 </labelDepth>
```

Variable Operators
------------------

### Locals

The various `init_local` variants assist in setting up the `locals` cell.

```k
    syntax Instr ::=  "init_local"  Int Val
                   |  "init_locals"     ValStack
                   | "#init_locals" Int ValStack
 // --------------------------------------------
    rule <k> init_local INDEX VALUE => . ... </k>
         <locals> LOCALS => LOCALS [ INDEX <- VALUE ] </locals>

    rule <k> init_locals VALUES => #init_locals 0 VALUES ... </k>

    rule <k> #init_locals _ .ValStack => . ... </k>
    rule <k> #init_locals N (VALUE : VALSTACK)
          => init_local N VALUE
          ~> #init_locals (N +Int 1) VALSTACK
          ...
          </k>
```

`init_localids` help setting up ids for local indices.

```k
    syntax Instr ::=  "init_localids" ValTypes
                   | "#init_localids" Int ValTypes
 // ----------------------------------------------
    rule <k> init_localids VTYPES => #init_localids 0 VTYPES ... </k>
    rule <k> #init_localids I:Int .ValTypes     => .                          ... </k>
    rule <k> #init_localids I:Int V:AValType VS => #init_localids I +Int 1 VS ... </k>
    rule <k> #init_localids I:Int { ID V }   VS => #init_localids I +Int 1 VS ... </k>
         <localIds> LOCALIDS => LOCALIDS [ ID <- I ] </localIds>
```

The `*_local` instructions are defined here.

```k
    syntax PlainInstr ::= "local.get" Index
                        | "local.set" Index
                        | "local.tee" Index
 //----------------------------------------
    rule <k> local.get TFIDX => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <locals> ... #ContextLookup(IDS , TFIDX) |-> VALUE ... </locals>
         <localIds> IDS </localIds>

    rule <k> local.set TFIDX => . ... </k>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <locals> ... #ContextLookup(IDS , TFIDX) |-> (_ => VALUE) ... </locals>
         <localIds> IDS </localIds>

    rule <k> local.tee TFIDX => . ... </k>
         <valstack> VALUE : VALSTACK </valstack>
         <locals> ... #ContextLookup(IDS , TFIDX) |-> (_ => VALUE) ... </locals>
         <localIds> IDS </localIds>
```

### Globals

When globals are declared, they must also be given a constant initialization value.
The `GlobalSpec` production is used to define all ways that a global can specified.
Globals can either be specified by giving a type and an initializer expression; or by an import and it's expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax TextFormatGlobalType ::= AValType | "(" "mut" AValType ")"
 // -----------------------------------------------------------------

    syntax GlobalType ::= Mut AValType
                        | asGMut (TextFormatGlobalType) [function]
 // --------------------------------------------------------------
    rule asGMut ( (mut T:AValType ) ) => var   T
    rule asGMut (      T:AValType   ) => const T

    syntax Defn       ::= GlobalDefn
    syntax GlobalSpec ::= TextFormatGlobalType Instr
    syntax GlobalDefn ::= "(" "global" OptionalId GlobalSpec ")"
                        |     "global" OptionalId GlobalType
 // --------------------------------------------------------
    rule <k> ( global OID:OptionalId TYP:TextFormatGlobalType IS:Instr ) => IS ~> global OID asGMut(TYP) ... </k>

    rule <k> global OID:OptionalId MUT:Mut TYP:AValType => . ... </k>
         <valstack> < TYP > VAL : STACK => STACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS => #saveId(IDS, OID, NEXTIDX) </globIds>
           <nextGlobIdx> NEXTIDX => NEXTIDX +Int 1                </nextGlobIdx>
           <globalAddrs> GLOBS   => GLOBS [ NEXTIDX <- NEXTADDR ] </globalAddrs>
           ...
         </moduleInst>
         <nextGlobAddr> NEXTADDR => NEXTADDR +Int 1 </nextGlobAddr>
         <globals>
           ( .Bag
          => <globalInst>
               <gAddr>  NEXTADDR  </gAddr>
               <gValue> <TYP> VAL </gValue>
               <gMut>   MUT       </gMut>
             </globalInst>
           )
           ...
         </globals>
```

The `get` and `set` instructions read and write globals.

```k
    syntax PlainInstr ::= "global.get" Index
                        | "global.set" Index
 // ----------------------------------------
    rule <k> global.get TFIDX => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS </globIds>
           <globalAddrs> ... #ContextLookup(IDS , TFIDX) |-> GADDR ... </globalAddrs>
           ...
         </moduleInst>
         <globalInst>
           <gAddr>  GADDR </gAddr>
           <gValue> VALUE </gValue>
           ...
         </globalInst>

    rule <k> global.set TFIDX => . ... </k>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS </globIds>
           <globalAddrs> ... #ContextLookup(IDS , TFIDX) |-> GADDR ... </globalAddrs>
           ...
         </moduleInst>
         <globalInst>
           <gAddr>  GADDR      </gAddr>
           <gValue> _ => VALUE </gValue>
           ...
         </globalInst>
```

Types
-----

### Type Gathering

This defines helper functions that gathers function together.
The function `gatherTypes` keeps the `TypeDecl`s that have the same `TypeKeyWord` as we need and throws away the `TypeDecl` having different `TypeKeyWord`.

```k
    syntax TypeKeyWord ::= "param" | "result"
 // -----------------------------------------

    syntax TypeDecl  ::= "(" TypeDecl ")"     [bracket]
                       | TypeKeyWord ValTypes
                       | "param" Identifier AValType
    syntax TypeDecls ::= List{TypeDecl , ""} [klabel(listTypeDecl)]
 // ---------------------------------------------------------------

    syntax VecType ::=  gatherTypes ( TypeKeyWord , TypeDecls )            [function]
                     | #gatherTypes ( TypeKeyWord , TypeDecls , ValTypes ) [function]
 // ---------------------------------------------------------------------------------
    rule  gatherTypes(TKW , TDECLS:TypeDecls) => #gatherTypes(TKW, TDECLS, .ValTypes)

    rule #gatherTypes( _  ,                                   .TypeDecls , TYPES) => [ TYPES ]
    rule #gatherTypes(TKW , TKW':TypeKeyWord _:ValTypes TDECLS:TypeDecls , TYPES) => #gatherTypes(TKW, TDECLS, TYPES) requires TKW =/=K TKW'
    rule #gatherTypes(TKW , TKW         TYPES':ValTypes TDECLS:TypeDecls , TYPES)
      => #gatherTypes(TKW ,                             TDECLS:TypeDecls , TYPES + TYPES')
    rule #gatherTypes(result , param ID:Identifier     _:AValType TDECLS:TypeDecls , TYPES) => #gatherTypes(result , TDECLS , TYPES)
    rule #gatherTypes(param  , param ID:Identifier VTYPE:AValType TDECLS:TypeDecls , TYPES) => #gatherTypes(param  , TDECLS , TYPES + { ID VTYPE } .ValTypes)
```

### Type Use

A type use is a reference to a type definition.
It may optionally be augmented by explicit inlined parameter and result declarations.
A type use should start with `'(' 'type' x:typeidx ')'` followed by a group of inlined parameter or result declarations.

```k
    syntax TypeUse ::= TypeDecls
                     | "(type" Index ")"           [prefer]
                     | "(type" Index ")" TypeDecls
 // ----------------------------------------------

    syntax FuncType ::= asFuncType ( TypeDecls )         [function, klabel(TypeDeclsAsFuncType)]
                      | asFuncType ( Map, Map, TypeUse ) [function, klabel(TypeUseAsFuncType)  ]
 // --------------------------------------------------------------------------------------------
    rule asFuncType(TDECLS:TypeDecls)                       => gatherTypes(param, TDECLS) -> gatherTypes(result, TDECLS)
    rule asFuncType(   _   ,   _  , TDECLS:TypeDecls)       => asFuncType(TDECLS)
    rule asFuncType(TYPEIDS, TYPES, (type TFIDX ))          => {TYPES[#ContextLookup(TYPEIDS ,TFIDX)]}:>FuncType
    rule asFuncType(TYPEIDS, TYPES, (type TFIDX ) TDECLS )  => asFuncType(TDECLS)
      requires TYPES[#ContextLookup(TYPEIDS, TFIDX)] ==K unnameFuncType(asFuncType(TDECLS))
```

### Type Declaration

Type could be declared explicitly and could optionally bind with an identifier.
`identifier` for `param` will be used only when the function type is declared when defining a function.
When defining `TypeDefn`, the `identifier` for `param` will be ignored and will not be saved into the module instance.

```k
    syntax Defn     ::= TypeDefn
    syntax TypeDefn ::= "(type" OptionalId "(" "func" TypeDecls ")" ")"
 // -------------------------------------------------------------------
    rule <k> (type ID (func TDECLS:TypeDecls)) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> IDS => #saveId(IDS, ID, NEXTIDX) </typeIds>
           <nextTypeIdx> NEXTIDX => NEXTIDX +Int 1 </nextTypeIdx>
           <types> TYPES => TYPES [NEXTIDX <- unnameFuncType(asFuncType(TDECLS))] </types>
           ...
         </moduleInst>
```

Function Declaration and Invocation
-----------------------------------

### Function Local Declaration

```k
    syntax LocalDecl  ::= "(" LocalDecl ")"           [bracket]
                        | "local"            ValTypes
                        | "local" Identifier AValType
    syntax LocalDecls ::= List{LocalDecl , ""}        [klabel(listLocalDecl)]
 // -------------------------------------------------------------------------

    syntax VecType ::=  asLocalType ( LocalDecls            ) [function]
                     | #asLocalType ( LocalDecls , ValTypes ) [function]
 // -------------------------------------------------------------------
    rule  asLocalType(LDECLS) => #asLocalType(LDECLS, .ValTypes)

    rule #asLocalType(.LocalDecls                                            , VTYPES) => [ VTYPES ]
    rule #asLocalType(local               VTYPES':ValTypes LDECLS:LocalDecls , VTYPES) => #asLocalType(LDECLS , VTYPES + VTYPES')
    rule #asLocalType(local ID:Identifier VTYPE:AValType   LDECLS:LocalDecls , VTYPES) => #asLocalType(LDECLS , VTYPES + { ID VTYPE } .ValTypes)
```

### Function Implicit Type Declaration

It could also be declared implicitly when a `TypeUse` is a `TypeDecls`, in this case it will allocate a type when the type is not in the current module instance.

```k
    syntax Instr ::= #checkTypeUse ( TypeUse )
 // ------------------------------------------
    rule <k> #checkTypeUse ( TDECLS:TypeDecls ) => (type (func TDECLS)) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <types> TYPES </types>
           ...
         </moduleInst>
       requires notBool unnameFuncType(asFuncType(TDECLS)) in values(TYPES)

    rule <k> #checkTypeUse ( TDECLS:TypeDecls ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <types> TYPES </types>
           ...
         </moduleInst>
       requires unnameFuncType(asFuncType(TDECLS)) in values(TYPES)

    rule <k> #checkTypeUse ( (type TFIDF) )        => . ... </k>
    rule <k> #checkTypeUse ( (type TFIDF) TDECLS ) => . ... </k>
```

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we allow for an "abstract" function declaration using syntax `func_::___`, and a more concrete one which allows arbitrary order of declaration of parameters, locals, and results.
The `FuncSpec` production is used to define all ways that a global can specified.
A function can either be specified by giving a type, what locals it allocates, and a function body; or by an import and it's expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax Defn     ::= FuncDefn
    syntax FuncSpec ::= TypeUse LocalDecls Instrs
    syntax FuncDefn ::= "(" "func" OptionalId FuncSpec ")"
 // ------------------------------------------------------
    rule <k> ( func OID:OptionalId TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs ) => #checkTypeUse ( TUSE ) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> TYPEIDS </typeIds>
           <types>   TYPES   </types>
           <funcIds> IDS => #saveId(IDS, OID, NEXTIDX) </funcIds>
           <nextFuncIdx> NEXTIDX => NEXTIDX +Int 1 </nextFuncIdx>
           <funcAddrs> ADDRS => ADDRS [ NEXTIDX <- NEXTADDR ] </funcAddrs>
           ...
         </moduleInst>
         <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>
         <funcs>
           ( .Bag
          => <funcDef>
               <fAddr>    NEXTADDR                             </fAddr>
               <fCode>    INSTRS                               </fCode>
               <fType>    asFuncType  ( TYPEIDS, TYPES, TUSE ) </fType>
               <fLocal>   asLocalType ( LDECLS )               </fLocal>
               <fModInst> CUR                                  </fModInst>
             </funcDef>
           )
           ...
         </funcs>
```

### Function Invocation/Return

Frames are used to store function return points.
Similar to labels, they sit on the instruction stack (the `<k>` cell), and `return` consumes things following it until hitting it.
Unlike labels, only one frame can be "broken" through at a time.

```k
    syntax Frame ::= "frame" Int ValTypes ValStack Map Int Map
 // ----------------------------------------------------------
    rule <k> frame MODIDX' TRANGE VALSTACK' LOCAL' LABELDEPTH LABELIDS => . ... </k>
         <valstack> VALSTACK => #take(unnameValTypes(TRANGE), VALSTACK) ++ VALSTACK' </valstack>
         <locals> _ => LOCAL' </locals>
         <curModIdx> _ => MODIDX' </curModIdx>
         <labelDepth> _ => LABELDEPTH </labelDepth>
         <labelIds> _ => LABELIDS </labelIds>
```

When we invoke a function, the element on the top of the stack will become the last parameter of the function.
For example, when we call `(invoke "foo" (i64.const 100) (i64.const 43) (i32.const 22))`, `(i32.const 22)` will be on the top of `<valstack>`, but it will be the last parameter of this function invocation if this function takes 3 parameters.
That is, whenever we want to `#take` or `#drop` an array of `params`, we need to reverse the array of `params` to make the type of the last parameter matching with the type of the valur on the top of stack.
The `#take` function will return the parameter stack in the reversed order, then we need to reverse the stack again to get the actual parameter array we want.

```k
    syntax Instr ::= "(" "invoke" Int ")"
 // -------------------------------------
    rule <k> ( invoke FADDR )
          => init_locals #revs(#take(#revt(unnameValTypes(TDOMAIN)), VALSTACK)) ++ #zero(unnameValTypes(TLOCALS))
          ~> init_localids TDOMAIN + TLOCALS
          ~> block [TRANGE] INSTRS end
          ~> frame MODIDX TRANGE #drop(#revt(unnameValTypes(TDOMAIN)), VALSTACK) LOCAL DEPTH IDS
          ...
          </k>
         <valstack>  VALSTACK => .ValStack </valstack>
         <locals> LOCAL => .Map </locals>
         <curModIdx> MODIDX => MODIDX' </curModIdx>
         <labelDepth> DEPTH => 0 </labelDepth>
         <labelIds> IDS => .Map </labelIds>
         <funcDef>
           <fAddr>    FADDR                     </fAddr>
           <fCode>    INSTRS                    </fCode>
           <fType>    [ TDOMAIN ] -> [ TRANGE ] </fType>
           <fLocal>   [ TLOCALS ]               </fLocal>
           <fModInst> MODIDX'                   </fModInst>
         </funcDef>

    syntax PlainInstr ::= "return"
 // ------------------------------
    rule <k> return ~> (I:Instr  => .)    ... </k>
    rule <k> return ~> (SS:Stmts => .)    ... </k>
    rule <k> return ~> (L:Label  => .)    ... </k>
    rule <k> (return => .) ~> FR:Frame    ... </k>
```

### Function Call

`call funcidx` and `call_indirect typeidx` are 2 control instructions that invokes a function in the current frame.

```k
    syntax PlainInstr ::= "call" Index
 // ----------------------------------
    rule <k> call TFIDX => ( invoke FADDR:Int ) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcIds> IDS </funcIds>
           <funcAddrs> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcAddrs>
           ...
         </moduleInst>
```

```k
    syntax PlainInstr ::= "call_indirect" TypeUse
 // ---------------------------------------------
    rule <k> call_indirect TUSE:TypeUse => ( invoke FADDR ) ... </k>
         <curModIdx> CUR </curModIdx>
         <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> TYPEIDS </typeIds>
           <types> TYPES </types>
           <tabAddrs> 0 |-> ADDR </tabAddrs>
           ...
         </moduleInst>
         <tabInst>
           <tAddr> ADDR </tAddr>
           <tdata> ... IDX |-> FADDR ... </tdata>
           ...
         </tabInst>
         <funcDef>
           <fAddr> FADDR </fAddr>
           <fType> FTYPE </fType>
           ...
         </funcDef>
      requires unnameFuncType(asFuncType(TYPEIDS, TYPES, TUSE)) ==K unnameFuncType(FTYPE)

    rule <k> call_indirect TUSE:TypeUse => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> TYPEIDS </typeIds>
           <types> TYPES </types>
           <tabAddrs> 0 |-> ADDR </tabAddrs>
           ...
         </moduleInst>
         <tabInst>
           <tAddr> ADDR </tAddr>
           <tdata> ... IDX |-> FADDR ... </tdata>
           ...
         </tabInst>
         <funcDef>
           <fAddr> FADDR </fAddr>
           <fType> FTYPE </fType>
           ...
         </funcDef>
      requires unnameFuncType(asFuncType(TYPEIDS, TYPES, TUSE)) =/=K unnameFuncType(FTYPE)

    rule <k> call_indirect TUSE:TypeUse => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabAddrs> 0 |-> ADDR </tabAddrs>
           ...
         </moduleInst>
         <tabInst>
           <tAddr> ADDR  </tAddr>
           <tdata> TDATA </tdata>
           ...
         </tabInst>
      requires notBool IDX in_keys(TDATA)
```

Table
-----

When implementing a table, we first need to define the `TableElemType` type to define the type of elements inside a `tableinst`.
Currently there is only one possible value for it which is "funcref".

```k
    syntax TableElemType ::= "funcref"
 // ----------------------------------
```

The allocation of a new `tableinst`.
Currently at most one table may be defined or imported in a single module.
The only allowed `TableElemType` is "funcref", so we ignore this term in the reducted sort.
The table values are addresses into the store of functions.
The `TableSpec` production is used to define all ways that a global can specified.
A table can either be specified by giving its type (limits and `funcref`); by specifying a vector of its initial `elem`ents; or by an import and its expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax Defn      ::= TableDefn
    syntax TableType ::= Limits TableElemType
    syntax TableSpec ::= TableType
    syntax TableDefn ::= "(" "table"     OptionalId TableSpec ")"
                       |     "table" "{" OptionalId Int OptionalInt "}"
 // -------------------------------------------------------------------
    rule <k> ( table OID:OptionalId MIN:Int         funcref ):TableDefn => table { OID MIN .Int } ... </k>
      requires MIN <=Int #maxTableSize()
    rule <k> ( table OID:OptionalId MIN:Int MAX:Int funcref ):TableDefn => table { OID MIN MAX  } ... </k>
      requires MIN <=Int #maxTableSize()
       andBool MAX <=Int #maxTableSize()

    rule <k> table { _ _ _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabAddrs> MAP </tabAddrs>
           ...
         </moduleInst>
       requires MAP =/=K .Map

    rule <k> table { ID MIN MAX } => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS => #saveId(IDS, ID, 0) </tabIds>
           <tabAddrs> .Map => (0 |-> NEXTADDR) </tabAddrs>
           ...
         </moduleInst>
         <nextTabAddr> NEXTADDR => NEXTADDR +Int 1 </nextTabAddr>
         <tabs>
           ( .Bag
          => <tabInst>
               <tAddr>   NEXTADDR </tAddr>
               <tmax>    MAX      </tmax>
               <tsize>   MIN      </tsize>
               <tdata>   .Map     </tdata>
             </tabInst>
           )
           ...
         </tabs>
```

Memory
------

When memory is allocated, it is put into the store at the next available index.
Memory can only grow in size, so the minimum size is the initial value.
Currently, only one memory may be accessible to a module, and thus the `<mAddr>` cell is an array with at most one value, at index 0.
The `MemorySpec` production is used to define all ways that a global can specified.
A memory can either be specified by giving its type (limits); by specifying a vector of its initial `data`; or by an import and its expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax Defn       ::= MemoryDefn
    syntax MemType    ::= Limits
    syntax MemorySpec ::= MemType
    syntax MemoryDefn ::= "(" "memory" OptionalId MemorySpec ")"
                        |     "memory" "{" OptionalId Int OptionalInt "}"
 // ---------------------------------------------------------------------
    rule <k> ( memory OID:OptionalId MIN:Int         ):MemoryDefn => memory { OID MIN .Int } ... </k>
      requires MIN <=Int #maxMemorySize()
    rule <k> ( memory OID:OptionalId MIN:Int MAX:Int ):MemoryDefn => memory { OID MIN MAX  } ... </k>
      requires MIN <=Int #maxMemorySize()
       andBool MAX <=Int #maxMemorySize()

    rule <k> memory { _ _ _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> MAP </memAddrs>
           ...
         </moduleInst>
      requires MAP =/=K .Map

    rule <k> memory { ID MIN MAX } => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS => #saveId(IDS, ID, 0) </memIds>
           <memAddrs> .Map => (0 |-> NEXTADDR) </memAddrs>
           ...
         </moduleInst>
         <nextMemAddr> NEXTADDR => NEXTADDR +Int 1 </nextMemAddr>
         <mems>
           ( .Bag
          => <memInst>
               <mAddr>   NEXTADDR </mAddr>
               <mmax>    MAX      </mmax>
               <msize>   MIN      </msize>
               ...
             </memInst>
           )
           ...
         </mems>
```

The assorted store operations take an address of type `i32` and a value.
The `storeX` operations first wrap the the value to be stored to the bit wdith `X`.
The value is encoded as bytes and stored at the "effective address", which is the address given on the stack plus offset.

```k
    syntax Instr ::= IValType "." StoreOp Int Int
 //                | FValType "." StoreOp Int Float
                   | "store" "{" Int Int Number "}"
 // -----------------------------------------------

    syntax PlainInstr ::= IValType  "." StoreOpM
                        | FValType  "." StoreOpM
 // --------------------------------------------

    syntax StoreOpM ::= StoreOp | StoreOp MemArg
 // --------------------------------------------
    rule <k> ITYPE . SOP:StoreOp               => ITYPE . SOP  IDX                          VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>
    rule <k> ITYPE . SOP:StoreOp MEMARG:MemArg => ITYPE . SOP (IDX +Int #getOffset(MEMARG)) VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>

    rule <k> store { WIDTH EA VAL } => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA => #setRange(DATA, EA, VAL, WIDTH) </mdata>
           ...
         </memInst>
         requires (EA +Int WIDTH) <=Int (SIZE *Int #pageSize())

    rule <k> store { WIDTH  EA  _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
         requires (EA +Int WIDTH) >Int (SIZE *Int #pageSize())

    syntax StoreOp ::= "store" | "store8" | "store16" | "store32"
 // -------------------------------------------------------------
    rule <k> ITYPE . store   EA VAL => store { #numBytes(ITYPE) EA VAL            } ... </k>
    rule <k> _     . store8  EA VAL => store { 1                EA #wrap(8,  VAL) } ... </k>
    rule <k> _     . store16 EA VAL => store { 2                EA #wrap(16, VAL) } ... </k>
    rule <k> i64   . store32 EA VAL => store { 4                EA #wrap(32, VAL) } ... </k>
```

The assorted load operations take an address of type `i32`.
The `loadX_sx` operations loads `X` bits from memory, and extend it to the right length for the return value, interpreting the bytes as either signed or unsigned according to `sx`.
The value is fetched from the "effective address", which is the address given on the stack plus offset.
Sort `Signedness` is defined in module `BYTES`.

```k
    syntax Instr ::= "load" "{" IValType Int Int Signedness"}"
 // ----------------------------------------------------------

    syntax PlainInstr ::= IValType "." LoadOpM
                        | FValType "." LoadOpM
                        | IValType "." LoadOp Int
 // ---------------------------------------------

    syntax LoadOpM ::= LoadOp | LoadOp MemArg
 // -----------------------------------------
    rule <k> ITYPE . LOP:LoadOp               => ITYPE . LOP  IDX                          ... </k>
         <valstack> < i32 > IDX : VALSTACK    => VALSTACK </valstack>
    rule <k> ITYPE . LOP:LoadOp MEMARG:MemArg => ITYPE . LOP (IDX +Int #getOffset(MEMARG)) ... </k>
         <valstack> < i32 > IDX : VALSTACK    => VALSTACK </valstack>

    rule <k> load { ITYPE WIDTH EA SIGN }
          => < ITYPE > #if SIGN ==K Signed
                           #then #signedWidth(WIDTH, #getRange(DATA, EA, WIDTH))
                           #else #getRange(DATA, EA, WIDTH)
                       #fi
         ...
         </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA </mdata>
           ...
         </memInst>
      requires (EA +Int WIDTH) <=Int (SIZE *Int #pageSize())

    rule <k> load { _ WIDTH EA _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
      requires (EA +Int WIDTH) >Int (SIZE *Int #pageSize())

    syntax LoadOp ::= "load"
                    | "load8_u" | "load16_u" | "load32_u"
                    | "load8_s" | "load16_s" | "load32_s"
 // -----------------------------------------------------
    rule <k> ITYPE . load     EA:Int => load { ITYPE #numBytes(ITYPE) EA Unsigned } ... </k>
    rule <k> ITYPE . load8_u  EA:Int => load { ITYPE 1                EA Unsigned } ... </k>
    rule <k> ITYPE . load16_u EA:Int => load { ITYPE 2                EA Unsigned } ... </k>
    rule <k> i64   . load32_u EA:Int => load { i64   4                EA Unsigned } ... </k>
    rule <k> ITYPE . load8_s  EA:Int => load { ITYPE 1                EA Signed   } ... </k>
    rule <k> ITYPE . load16_s EA:Int => load { ITYPE 2                EA Signed   } ... </k>
    rule <k> i64   . load32_s EA:Int => load { i64   4                EA Signed   } ... </k>
```

`MemArg`s can optionally be passed to `load` and `store` operations.
The `offset` parameter is added to the the address given on the stack, resulting in the "effective address" to store to or load from.
The `align` parameter is for optimization only and is not allowed to influence the semantics, so we ignore it.

```k
    syntax MemArg ::= OffsetArg | AlignArg | OffsetArg AlignArg
 // -----------------------------------------------------------

    syntax OffsetArg ::= "offset=" Int
    syntax AlignArg  ::= "align="  Int
 // ----------------------------------

    syntax Int ::= #getOffset ( MemArg ) [function]
 // -----------------------------------------------
    rule #getOffset(           _:AlignArg) => 0
    rule #getOffset(offset= OS           ) => OS
    rule #getOffset(offset= OS _:AlignArg) => OS
```

The `size` operation returns the size of the memory, measured in pages.

```k
    syntax PlainInstr ::= "memory.size"
 // -----------------------------------
    rule <k> memory.size => < i32 > SIZE ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
```

`grow` increases the size of memory in units of pages.
Failure to grow is indicated by pushing -1 to the stack.
Success is indicated by pushing the previous memory size to the stack.
`grow` is non-deterministic and may fail either due to trying to exceed explicit max values, or because the embedder does not have resources available.
By setting the `<deterministicMemoryGrowth>` field in the configuration to `true`, the sematnics ensure memory growth only fails if the memory in question would exceed max bounds.

```k
    syntax Instr ::= "grow" Int
 // ---------------------------

    syntax PlainInstr ::= "memory.grow"
 // -----------------------------------
    rule <k> memory.grow => grow N ... </k>
         <valstack> < i32 > N : VALSTACK => VALSTACK </valstack>

    rule <k> grow N => < i32 > SIZE ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <mmax>    MAX  </mmax>
           <msize>   SIZE => SIZE +Int N </msize>
           ...
         </memInst>
      requires #growthAllowed(SIZE +Int N, MAX)

    rule <k> grow N => < i32 > #unsigned(i32, -1) ... </k>
         <deterministicMemoryGrowth> DET:Bool </deterministicMemoryGrowth>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <mmax>    MAX  </mmax>
           <msize>   SIZE </msize>
           ...
         </memInst>
      requires notBool DET
        orBool notBool #growthAllowed(SIZE +Int N, MAX)

    syntax Bool ::= #growthAllowed(Int, OptionalInt) [function]
 // -----------------------------------------------------------
    rule #growthAllowed(SIZE, .Int ) => SIZE <=Int #maxMemorySize()
    rule #growthAllowed(SIZE, I:Int) => #growthAllowed(SIZE, .Int) andBool SIZE <=Int I
```

However, the absolute max allowed size if 2^16 pages.
Incidentally, the page size is 2^16 bytes.
The maximum of table size is 2^32 bytes.

```k
    syntax Int ::= #pageSize()      [function]
    syntax Int ::= #maxMemorySize() [function]
    syntax Int ::= #maxTableSize()  [function]
 // ------------------------------------------
    rule #pageSize()      => 65536
    rule #maxMemorySize() => 65536
    rule #maxTableSize()  => 4294967296
```

Initializers
------------

### Offset

The `elem` and `data` initializers take an offset, which is an instruction.
This is not optional.
The offset can either be specified explicitly with the `offset` key word, or be a single instruction.

```k
    syntax Offset ::= "(" "offset" Instrs ")"
                    | Instrs
 // ------------------------
```

### Table initialization

Tables can be initialized with element and the element type is always `funcref".
The initialization of a table needs an offset and a list of functions, given as `Index`s.
A table index is optional and will be default to zero.

```k
    syntax Defn     ::= ElemDefn
    syntax ElemDefn ::= "(" "elem"     Index Offset ElemSegment ")"
                      | "(" "elem"           Offset ElemSegment ")"
                      |     "elem" "{" Index        ElemSegment "}"
    syntax Stmt     ::= #initElements ( Int, Int, Map, Map, ElemSegment )
 // ---------------------------------------------------------------------
    // Default to table with index 0.
    rule <k> ( elem        OFFSET      ELEMSEGMENT ) =>     ( elem 0 OFFSET ELEMSEGMENT ) ... </k>
    rule <k> ( elem TABIDX IS:Instrs   ELEMSEGMENT ) => IS ~> elem { TABIDX ELEMSEGMENT } ... </k>
    rule <k> ( elem TABIDX (offset IS) ELEMSEGMENT ) => IS ~> elem { TABIDX ELEMSEGMENT } ... </k>

    rule <k> elem { TABIDX ELEMSEGMENT } => #initElements ( ADDR, OFFSET, FADDRS, FIDS, ELEMSEGMENT ) ... </k>
         <curModIdx> CUR </curModIdx>
         <valstack> < i32 > OFFSET : STACK => STACK </valstack>
         <moduleInst>
           <modIdx> CUR  </modIdx>
           <funcIds> FIDS </funcIds>
           <funcAddrs> FADDRS </funcAddrs>
           <tabIds>  TIDS </tabIds>
           <tabAddrs> #ContextLookup(TIDS, TABIDX) |-> ADDR </tabAddrs>
           ...
         </moduleInst>

    rule <k> #initElements (    _,      _,      _,   _, .ElemSegment ) => . ... </k>
    rule <k> #initElements ( ADDR, OFFSET, FADDRS, IDS,  E ES        ) => #initElements ( ADDR, OFFSET +Int 1, FADDRS, IDS, ES ) ... </k>
         <tabInst>
           <tAddr> ADDR </tAddr>
           <tdata> DATA => DATA [ OFFSET <- FADDRS[#ContextLookup(IDS, E)] ] </tdata>
           ...
         </tabInst>
```

### Memory initialization

Memories can be initialized with data, specified as a list of bytes together with an offset.
The `data` initializer simply puts these bytes into the specified memory, starting at the offset.

```k
    syntax Defn     ::= DataDefn
    syntax DataDefn ::= "(" "data"     Index Offset DataString ")"
                      | "(" "data"           Offset DataString ")"
                      |     "data" "{" Index        Bytes      "}"
 // --------------------------------------------------------------
    // Default to memory 0.
    rule <k> ( data       OFFSET:Offset STRINGS ) =>     ( data   0     OFFSET    STRINGS  ) ... </k>
    rule <k> ( data MEMID IS:Instrs     STRINGS ) => IS ~> data { MEMID #DS2Bytes(STRINGS) } ... </k>
    rule <k> ( data MEMID (offset IS)   STRINGS ) => IS ~> data { MEMID #DS2Bytes(STRINGS) } ... </k>

    // For now, deal only with memory 0.
    rule <k> data { MEMIDX DSBYTES } => . ... </k>
         <valstack> < i32 > OFFSET : STACK => STACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS </memIds>
           <memAddrs> #ContextLookup(IDS, MEMIDX) |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr> ADDR </mAddr>
           <mdata> DATA
                  => #setRange(DATA, OFFSET, Bytes2Int(DSBYTES, LE, Unsigned), lengthBytes(DSBYTES))
           </mdata>
           ...
         </memInst>

    syntax Int ::= #lengthDataPages ( DataString ) [function]
 // ---------------------------------------------------------
    rule #lengthDataPages(DS:DataString) => lengthBytes(#DS2Bytes(DS)) up/Int #pageSize()

    syntax Int ::= Int "up/Int" Int [function]
 // ------------------------------------------
    rule I1 up/Int I2 => (I1 +Int (I2 -Int 1)) /Int I2 requires I2 >Int 0
```

Start Function
--------------

The `start` component of a module declares the function index of a `start function` that is automatically invoked when the module is instantiated, after `tables` and `memories` have been initialized.

```k
    syntax Defn      ::= StartDefn
    syntax StartDefn ::= "(" "start" Index ")"
 // ------------------------------------------
    rule <k> ( start TFIDX ) => ( invoke FADDR ) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcIds> IDS </funcIds>
           <funcAddrs> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcAddrs>
           ...
         </moduleInst>
```

Export
------

Exports make functions, tables, memories and globals available for importing into other modules.

```k
    syntax Defn       ::= ExportDefn
    syntax ExportDefn ::= "(" "export" WasmString "(" Externval ")" ")"
 // -------------------------------------------------------------------
    rule <k> ( export ENAME ( _:AllocatedKind TFIDX:Index ) ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <exports> EXPORTS => EXPORTS [ ENAME <- TFIDX ] </exports>
           ...
         </moduleInst>
```

Imports
-------

Imports need to describe the type of what is imported.
That an import is really a subtype of the declared import needs to be checked at instantiation time.
The value of a global gets copied when it is imported.

```k
    syntax Defn       ::= ImportDefn
    syntax ImportDefn ::= "(" "import" WasmString WasmString ImportDesc ")"
    syntax ImportDesc ::= "(" "func"   OptionalId TypeUse              ")" [klabel(funcImportDesc)]
                        | "(" "table"  OptionalId TableType            ")" [klabel( tabImportDesc)]
                        | "(" "memory" OptionalId MemType              ")" [klabel( memImportDesc)]
                        | "(" "global" OptionalId TextFormatGlobalType ")" [klabel(globImportDesc)]
 // -----------------------------------------------------------------------------------------------
    rule <k> ( import MOD NAME (func OID:OptionalId TUSE:TypeUse) ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> TYPEIDS </typeIds>
           <types>   TYPES   </types>
           <funcIds> IDS => #saveId(IDS, OID, NEXT) </funcIds>
           <funcAddrs> FS => FS [NEXT <- ADDR] </funcAddrs>
           <nextFuncIdx> NEXT => NEXT +Int 1 </nextFuncIdx>
           ...
         </moduleInst>
         <moduleRegistry> ... MOD |-> MODIDX ... </moduleRegistry>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <funcIds> IDS' </funcIds>
           <funcAddrs> ... #ContextLookup(IDS' , TFIDX) |-> ADDR ... </funcAddrs>
           <exports>   ... NAME |-> TFIDX                        ... </exports>
           ...
         </moduleInst>
         <funcDef>
           <fAddr> ADDR </fAddr>
           <fType> FTYPE </fType>
           ...
         </funcDef>
      requires unnameFuncType(FTYPE) ==K unnameFuncType(asFuncType(TYPEIDS, TYPES, TUSE))

    rule <k> ( import MOD NAME (table OID:OptionalId (LIM _):TableType) ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS => #saveId(IDS, OID, 0) </tabIds>
           <tabAddrs> .Map => 0 |-> ADDR </tabAddrs>
           ...
         </moduleInst>
         <moduleRegistry> ... MOD |-> MODIDX ... </moduleRegistry>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <tabIds> IDS' </tabIds>
           <tabAddrs> ... #ContextLookup(IDS' , TFIDX) |-> ADDR ... </tabAddrs>
           <exports>  ... NAME |-> TFIDX                        ... </exports>
           ...
         </moduleInst>
         <tabInst>
           <tAddr> ADDR </tAddr>
           <tmax>  MAX  </tmax>
           <tsize> SIZE </tsize>
           ...
         </tabInst>
       requires #limitsMatchImport(SIZE, MAX, LIM)

    rule <k> ( import MOD NAME (memory OID:OptionalId LIM:Limits) ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS => #saveId(IDS, OID, 0) </memIds>
           <memAddrs> .Map => 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <moduleRegistry> ... MOD |-> MODIDX ... </moduleRegistry>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <memIds> IDS' </memIds>
           <memAddrs> ... #ContextLookup(IDS' , TFIDX) |-> ADDR ... </memAddrs>
           <exports>  ... NAME |-> TFIDX                        ... </exports>
           ...
         </moduleInst>
         <memInst>
           <mAddr> ADDR </mAddr>
           <mmax>  MAX  </mmax>
           <msize> SIZE </msize>
           ...
         </memInst>
       requires #limitsMatchImport(SIZE, MAX, LIM)

    rule <k> ( import MOD NAME (global OID:OptionalId TGTYP:TextFormatGlobalType) ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS => #saveId(IDS, OID, NEXT) </globIds>
           <globalAddrs> GS => GS [NEXT <- ADDR] </globalAddrs>
           <nextGlobIdx> NEXT => NEXT +Int 1 </nextGlobIdx>
           ...
         </moduleInst>
         <moduleRegistry> ... MOD |-> MODIDX ... </moduleRegistry>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <globIds> IDS' </globIds>
           <globalAddrs> ... #ContextLookup(IDS' , TFIDX) |-> ADDR ... </globalAddrs>
           <exports>     ... NAME |-> TFIDX                        ... </exports>
           ...
         </moduleInst>
         <globalInst>
           <gAddr>  ADDR    </gAddr>
           <gValue> <TYP> _ </gValue>
           <gMut>   MUT     </gMut>
         </globalInst>
       requires asGMut(TGTYP) ==K MUT TYP
```

Tables and memories have proper subtyping, unlike globals and functions where a type is only a subtype of itself.
Subtyping is determined by whether the limits of one table/memory fit in the limits of another.
The following function checks if the limits in the first parameter *match*, i.e. is a subtype of, the limits in the second.

```k
    syntax Bool ::= #limitsMatchImport(Int, OptionalInt, Limits) [function]
 // -----------------------------------------------------------------------
    rule #limitsMatchImport(L1,      _, L2:Int   ) => L1 >=Int L2
    rule #limitsMatchImport( _,   .Int,  _:Int  _) => false
    rule #limitsMatchImport(L1, U1:Int, L2:Int U2) => L1 >=Int L2 andBool U1 <=Int U2
```

Module Instantiation
--------------------

There is some dependencies among definitions that require that we do them in a certain order, even though they may appear in many valid orders.
First, functions, tables, memories and globals get *allocated*.
Then, tables, memories and globals get *instantiated* with elements, data and initialization vectors.
However, since (currently) globals can only make use of imported globals to be instantiated, we can initialize at allocation time.
Finally, the start function is invoked.
Exports may appear anywhere in a module, but can only be performed after what they refer to has been allocated.
Exports that are inlined in a definition, e.g., `func (export "foo") ...`, are safe to extract as they appear.
Imports must appear before any allocations in a module, due to validation.

A subtle point is related to tables with inline `elem` definitions: since these may refer to functions by identifier, we need to make sure that tables definitions come after function definitions.

`sortModule` takes a list of definitions and returns a map with different groups of definitions, preserving the order within each group.
The groups are chosen to represent different stages of allocation and instantiation.

```k
    syntax ModuleDecl ::= sortedModule ( id: OptionalId, types: Defns, importDefns: Defns, funcsGlobals: Defns, allocs: Defns, exports: Defns, inits: Defns, start: Defns )
 // -----------------------------------------------------------------------------------------------------------------------------------------------------------------------

    syntax ModuleDecl ::=  sortModule ( Defns , OptionalId ) [function]
                        | #sortModule ( Defns , ModuleDecl ) [function]
 // -------------------------------------------------------------------
    rule sortModule(DEFNS, OID) => #sortModule(#reverse(DEFNS, .Defns), sortedModule(... id: OID, types: .Defns, importDefns: .Defns, funcsGlobals: .Defns, allocs: .Defns, exports: .Defns, inits: .Defns, start: .Defns))

    rule #sortModule(.Defns, SORTED_MODULE) => SORTED_MODULE

    rule #sortModule((T:TypeDefn   DS:Defns => DS), sortedModule(... types: (TS => T TS)))

    rule #sortModule((I:ImportDefn DS:Defns => DS), sortedModule(... importDefns: (IS => I IS)))

    rule #sortModule((X:FuncDefn   DS:Defns => DS), sortedModule(... funcsGlobals: (FGS => X FGS)))
    rule #sortModule((X:GlobalDefn DS:Defns => DS), sortedModule(... funcsGlobals: (FGS => X FGS)))

    rule #sortModule((A:TableDefn  DS:Defns => DS), sortedModule(... allocs: (AS => A AS)))
    rule #sortModule((A:MemoryDefn DS:Defns => DS), sortedModule(... allocs: (AS => A AS)))

    rule #sortModule((E:ExportDefn DS:Defns => DS), sortedModule(... exports: (ES => E ES)))

    rule #sortModule((I:DataDefn   DS:Defns => DS), sortedModule(... inits: (IS => I IS)))
    rule #sortModule((I:ElemDefn   DS:Defns => DS), sortedModule(... inits: (IS => I IS)))

    rule #sortModule((S:StartDefn  DS:Defns => DS), sortedModule(... start: (_ => S .Defns)))

    syntax Defns ::= #reverse(Defns, Defns) [function]
 // --------------------------------------------------
    rule #reverse(       .Defns  , ACC) => ACC
    rule #reverse(D:Defn DS:Defns, ACC) => #reverse(DS, D ACC)
```

A new module instance gets allocated.
Then, the surrounding `module` tag is discarded, and the definitions are executed, putting them into the module currently being defined.

```k
    syntax Stmt       ::= ModuleDecl
    syntax ModuleDecl ::= "(" "module" OptionalId Defns ")"
                        |     "module" OptionalId Map
 // -------------------------------------------------
    rule <k> ( module OID:OptionalId DEFNS ) => sortModule(DEFNS, OID) ... </k>

    rule <k> sortedModule(... id: OID, types: TS, importDefns: IS, funcsGlobals: FGS, allocs: AS, exports: ES, inits: INIS, start: S)
          => TS ~> IS ~> FGS ~> AS ~> ES ~> INIS ~> S
         ...
         </k>
         <curModIdx> _ => NEXT </curModIdx>
         <nextModuleIdx> NEXT => NEXT +Int 1 </nextModuleIdx>
         <moduleIds> IDS => #saveId(IDS, OID, NEXT) </moduleIds>
         <moduleInstances>
           ( .Bag
          => <moduleInst>
               <modIdx> NEXT </modIdx>
               ...
             </moduleInst>
           )
           ...
         </moduleInstances>
```

It is permissible to define modules without the `module` keyword, by simply stating the definitions at the top level in the file.

```k
    rule <k> D:Defn => ( module .Defns ) ~> D ... </k>
         <curModIdx> .Int </curModIdx>
```

After a module is instantiated, it should be saved somewhere.
How this is done is up to the embedder.

```k
endmodule
```
