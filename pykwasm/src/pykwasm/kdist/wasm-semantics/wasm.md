WebAssembly State and Semantics
===============================

```k
requires "data.md"
requires "data/list-int.k"
requires "data/list-ref.k"
requires "data/sparse-bytes.k"
requires "data/tools.k"
requires "numeric.md"

module WASM-SYNTAX
    imports WASM-DATA-SYNTAX
    imports WASM-COMMON-SYNTAX
    imports WASM-NUMERIC-SYNTAX
endmodule
```

Common Syntax
-------------

```k
module WASM-COMMON-SYNTAX
    imports WASM-DATA-COMMON-SYNTAX
    imports WASM-NUMERIC-SYNTAX
```

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

    syntax EmptyStmts ::= List{EmptyStmt , ""} [overload(listStmt), terminator-symbol(".List{\"listStmt\"}")]
    syntax Instrs     ::= List{Instr     , ""} [overload(listStmt)]
    syntax Defns      ::= List{Defn      , ""} [overload(listStmt)]
    syntax Stmts      ::= List{Stmt      , ""} [overload(listStmt)]
 // -------------------------------------------------------------

    syntax Instrs ::= EmptyStmts
    syntax Defns  ::= EmptyStmts
    syntax Stmts  ::= Instrs | Defns
 // --------------------------------
```

### Instructions

**TODO**: Implement `Float` in the format of `-nan`, `nan:0x n:hexnum` and `hexfloat`.

```k
    syntax PlainInstr ::= IValType "." "const" WasmInt    [symbol(aIConst)]
                        | FValType "." "const" Number     [symbol(aFConst)]
                        | "ref.null" HeapType             [symbol(aRef.null)]
                        | IValType "." IUnOp              [symbol(aIUnOp)]
                        | FValType "." FUnOp              [symbol(aFUnOp)]
                        | IValType "." ExtendS            [symbol(aExtendS)] // TODO this is more permissive than the official spec as it allows 'i32.extend32_s'
                        | IValType "." IBinOp             [symbol(aIBinOp)]
                        | FValType "." FBinOp             [symbol(aFBinOp)]
                        | IValType "." TestOp             [symbol(aTestOp)]
                        | IValType "." IRelOp             [symbol(aIRelOp)]
                        | FValType "." FRelOp             [symbol(aFRelOp)]
                        | ValType "." CvtOp               [symbol(aCvtOp)]
                        | "drop"                          [symbol(aDrop)]
                        | "select"                        [symbol(aSelect)]
                        | "nop"                           [symbol(aNop)]
                        | "unreachable"                   [symbol(aUnreachable)]
                        | "return"                        [symbol(aReturn)]
                        | "memory.size"                   [symbol(aSize)]
                        | "memory.grow"                   [symbol(aGrow)]
                        | "memory.fill"                   [symbol(aFill)]
                        | "memory.copy"                   [symbol(aCopy)]
 // -----------------------------------

    syntax TypeUse     ::= TypeDecls
                         | "(type" Index ")"           [prefer, symbol(aTypeUseIndex)] // TODO: Remove and move to wasm-text.
                         | "(type" Index ")" TypeDecls
    syntax TypeKeyWord ::= "param" | "result"
    syntax TypeDecl    ::= "(" TypeDecl ")"     [bracket]
                         | TypeKeyWord ValTypes
                         | "param" Identifier ValType
    syntax TypeDecls   ::= List{TypeDecl , ""} [symbol(listTypeDecl), terminator-symbol(".List{\"listTypeDecl\"}")]
 // -----------------------------------------------------------------

    syntax StoreOp ::= "store"    [symbol(storeOpStore)]
                     | "store8"   [symbol(storeOpStore8)]
                     | "store16"  [symbol(storeOpStore16)]
                     | "store32"  [symbol(storeOpStore32)]
    syntax LoadOp  ::= "load"     [symbol(loadOpLoad)]
                     | "load8_u"  [symbol(loadOpLoad8_u)]
                     | "load16_u" [symbol(loadOpLoad16_u)]
                     | "load32_u" [symbol(loadOpLoad32_u)]
                     | "load8_s"  [symbol(loadOpLoad8_s)]
                     | "load16_s" [symbol(loadOpLoad16_s)]
                     | "load32_s" [symbol(loadOpLoad32_s)]
 // --------------------------------------------------------------
```

### Definitions at the Module Level

```k
    syntax Defn ::= TypeDefn
                  | GlobalDefn
                  | FuncDefn
                  | TableDefn
                  | MemoryDefn
                  | ElemDefn
                  | DataDefn
                  | StartDefn
                  | ExportDefn
                  | ImportDefn
 // --------------------------
```

The following are kept abstract, and can be extended in other formats, such as the text format.

```k
    syntax TypeDefn
    syntax GlobalDefn
    syntax FuncDefn
    syntax TableDefn
    syntax MemoryDefn
    syntax ElemDefn
    syntax DataDefn
    syntax StartDefn
    syntax ImportDefn
    syntax ExportDefn
 // -----------------
```

```k
endmodule
```

Internal Syntax
---------------

```k
module WASM-INTERNAL-SYNTAX
    imports WASM-DATA-INTERNAL-SYNTAX

    syntax Instr ::=  "init_locals" ValStack
                   | "#init_locals" ValStack
 // ----------------------------------------

    syntax Int ::= #pageSize()      [function, total]
    syntax Int ::= #maxMemorySize() [function, total]
    syntax Int ::= #maxTableSize()  [function, total]
 // ------------------------------------------

endmodule
```

Semantics
---------

```k
module WASM
    imports LIST-INT
    imports LIST-INT-PRIMITIVE
    imports MAP
    imports WASM-COMMON-SYNTAX
    imports WASM-INTERNAL-SYNTAX
    imports WASM-DATA
    imports WASM-DATA-TOOLS
    imports WASM-NUMERIC
    imports LIST-REF-EXTENSIONS
```

### Configuration

```k
    configuration
      <wasm>
        <instrs> .K </instrs>
        <valstack> .ValStack </valstack>
        <curFrame>
          <locals>    .List </locals>
          <curModIdx> .Int  </curModIdx>
        </curFrame>
        <moduleRegistry> .Map </moduleRegistry>
        <moduleIds> .Map </moduleIds>
        <moduleInstances>
          <moduleInst multiplicity="*" type="Map">
            <modIdx>      0            </modIdx>
            <exports>     .Map         </exports>
            <types>       .Map         </types>
            <nextTypeIdx> 0            </nextTypeIdx>
            <funcAddrs>   .ListInt     </funcAddrs>
            <nextFuncIdx> 0            </nextFuncIdx>
            <tabIds>      .Map         </tabIds>
            <tabAddrs>    .Map         </tabAddrs>
            <nextTabIdx>  0            </nextTabIdx>
            <memIds>      .Map         </memIds>
            <memAddrs>    .List        </memAddrs>
            <elemIds>     .Map         </elemIds>
            <elemAddrs>   .Map         </elemAddrs>
            <nextElemIdx> 0            </nextElemIdx>
            <globIds>     .Map         </globIds>
            <globalAddrs> .Map         </globalAddrs>
            <nextGlobIdx> 0            </nextGlobIdx>
            <moduleMetadata>
              <moduleFileName> .String </moduleFileName>
              <moduleId>               </moduleId>
              <funcIds>        .Map    </funcIds>
              <typeIds>        .Map    </typeIds>
            </moduleMetadata>
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
              <funcMetadata>
                <funcId> </funcId>
                <localIds> .Map </localIds>
              </funcMetadata>
            </funcDef>
          </funcs>
          <nextFuncAddr> 0 </nextFuncAddr>
          <tabs>
            <tabInst multiplicity="*" type="Map">
              <tAddr> 0     </tAddr>
              <tmax>  .Int  </tmax>
              <tdata> .ListRef </tdata> // TODO use ARRAY O(1) lookup
            </tabInst>
          </tabs>
          <nextTabAddr> 0 </nextTabAddr>
          <mems> .List </mems>
          <globals>
            <globalInst multiplicity="*" type="Map">
              <gAddr>  0         </gAddr>
              <gValue> undefined </gValue>
              <gMut>   .Mut      </gMut>
            </globalInst>
          </globals>
          <nextGlobAddr> 0 </nextGlobAddr>
          <elems>
            <elemInst multiplicity="*" type="Map">
              <eAddr>  0        </eAddr>
              <eType>  funcref  </eType>
              <eValue> .ListRef </eValue> // TODO use ARRAY O(1) lookup
            </elemInst>
          </elems>
          <nextElemAddr> 0 </nextElemAddr>
        </mainStore>
        <deterministicMemoryGrowth> true </deterministicMemoryGrowth>
      </wasm>
```

### Assumptions and invariants

Integers in K are unbounded.
As an invariant, however, for any integer `< iNN > I:Int` on the stack, `I` is between 0 and `#pow(NN) - 1`.
That way, unsigned instructions can make use of `I` directly, whereas signed instructions may need `#signed(iNN, I)`.

The highest address in a memory instance divided by the `#pageSize()` constant (defined below) may not exceed the value in the `<max>` cell, if present.

Since memory data is bytes, all integers in the `Map` in the `<mdata>` cell are bounded to be between 1 and 255, inclusive.
All places in the data with no entry are considered zero bytes.

### Translations to Abstract Syntax

Before execution, the program is translated from the text-format concrete syntax tree into an abstract syntax tree using the following function.
It's full definition is found in the `wasm-text.md` file.

```k
    syntax Stmts ::= text2abstract ( Stmts ) [function]
 // ---------------------------------------------------
```

Instructions
------------

### Sequencing

```k
    syntax K ::= sequenceStmts  ( Stmts  ) [function, total]
               | sequenceDefns  ( Defns  ) [function, total]
               | sequenceInstrs ( Instrs ) [function, total]
 // -------------------------------------------------
    rule sequenceStmts(.Stmts) => .K
    rule sequenceStmts(S SS  ) => S ~> sequenceStmts(SS)

    rule sequenceDefns(.Defns) => .K
    rule sequenceDefns(D DS  ) => D ~> sequenceDefns(DS)

    rule sequenceInstrs(.Instrs) => .K
    rule sequenceInstrs(I IS   ) => I ~> sequenceInstrs(IS)
```

### Traps

`trap` is the error mechanism of Wasm.
Traps cause all execution to halt, and can not be caught from within Wasm.
We emulate this by consuming everything in the `<instrs>` cell that is not a `Stmt`.
Statements are not part of Wasm semantics, but rather of the embedder, and is where traps can be caught.
Thus, a `trap` "bubbles up" (more correctly, to "consumes the continuation") until it reaches a statement which is not an `Instr` or `Def`.

```k
    syntax Instr ::= "trap"
 // -----------------------
    rule <instrs> trap ~> (_L:Label => .K) ... </instrs>
    rule <instrs> trap ~> (_F:Frame => .K) ... </instrs>
    rule <instrs> trap ~> (_I:Instr => .K) ... </instrs>
    rule <instrs> trap ~> (_D:Defn  => .K) ... </instrs>
```

When a single value ends up on the instruction stack (the `<instrs>` cell), it is moved over to the value stack (the `<valstack>` cell).
If the value is the special `undefined`, then `trap` is generated instead.

```k
    rule <instrs> undefined => trap ... </instrs>
    rule <instrs>   V:Val    => .K       ... </instrs>
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

```k
    rule <instrs> ITYPE:IValType . const VAL => #chop (< ITYPE > VAL) ... </instrs>
    rule <instrs> FTYPE:FValType . const VAL => #round(  FTYPE , VAL) ... </instrs>

    rule <instrs> ref.null extern => <externref> null ... </instrs>
    rule <instrs> ref.null func   => <funcref>   null ... </instrs>
```

### Unary Operations

When a unary operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.
An `*UnOp` operator always produces a result of the same type as its operand.

```k
    rule <instrs> ITYPE . UOP:IUnOp => ITYPE . UOP C1 ... </instrs>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <instrs> FTYPE . UOP:FUnOp => FTYPE . UOP C1 ... </instrs>
         <valstack> < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <instrs> ITYPE . UOP:ExtendS => ITYPE . UOP C1 ... </instrs>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Binary Operations

When a binary operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.

```k
    rule <instrs> ITYPE . BOP:IBinOp => ITYPE . BOP C1 C2 ... </instrs>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <instrs> FTYPE . BOP:FBinOp => FTYPE . BOP C1 C2 ... </instrs>
         <valstack> < FTYPE > C2 : < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Test Operations

When a test operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.

```k
    rule <instrs> TYPE . TOP:TestOp => TYPE . TOP C1 ... </instrs>
         <valstack> < TYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Relationship Operations

When a relationship operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.

```k
    rule <instrs> ITYPE . ROP:IRelOp => ITYPE . ROP C1 C2 ... </instrs>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
    rule <instrs> FTYPE . ROP:FRelOp => FTYPE . ROP C1 C2 ... </instrs>
         <valstack> < FTYPE > C2 : < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Conversion Operations

Conversion Operation convert constant elements at the top of the stack to another type.

```k
    rule <instrs> TYPE:ValType . CVTOP:Cvti32Op => TYPE . CVTOP C1  ... </instrs>
         <valstack> < i32 > C1 : VALSTACK => VALSTACK </valstack>

    rule <instrs> TYPE:ValType . CVTOP:Cvti64Op => TYPE . CVTOP C1  ... </instrs>
         <valstack> < i64 > C1 : VALSTACK => VALSTACK </valstack>

    rule <instrs> TYPE:ValType . CVTOP:Cvtf32Op => TYPE . CVTOP C1  ... </instrs>
         <valstack> < f32 > C1 : VALSTACK => VALSTACK </valstack>

    rule <instrs> TYPE:ValType . CVTOP:Cvtf64Op => TYPE . CVTOP C1  ... </instrs>
         <valstack> < f64 > C1 : VALSTACK => VALSTACK </valstack>
```

ValStack Operations
-------------------

Operator `drop` removes a single item from the `<valstack>`.
The `select` operator picks one of the second or third stack values based on the first.

```k
    rule <instrs> drop => .K ... </instrs>
         <valstack> _ : VALSTACK => VALSTACK </valstack>

    rule <instrs> select => .K ... </instrs>
         <valstack> < i32 > C : V2 : V1 : VALSTACK
                 =>             V2      : VALSTACK
         </valstack>
      requires C ==Int 0 andBool #sameType(V1, V2)

    rule <instrs> select => .K ... </instrs>
         <valstack> < i32 > C : V2 : V1 : VALSTACK
                 =>                  V1 : VALSTACK
         </valstack>
      requires C =/=Int 0 andBool #sameType(V1, V2)
```

Structured Control Flow
-----------------------

`nop` does nothing.

```k
    rule <instrs> nop => .K ... </instrs>
```

`unreachable` causes an immediate `trap`.

```k
    rule <instrs> unreachable => trap ... </instrs>
```

Labels are administrative instructions used to mark the targets of break instructions.
They contain the continuation to use following the label, as well as the original stack to restore.
The supplied type represents the values that should taken from the current stack.

A block is the simplest way to create targets for break instructions (ie. jump destinations).
It simply executes the block then records a label with an empty continuation.

```k
    syntax Label ::= "label" VecType "{" Instrs "}" ValStack
 // --------------------------------------------------------
    rule <instrs> label [ TYPES ] { _ } VALSTACK' => .K ... </instrs>
         <valstack> VALSTACK => #take(lengthValTypes(TYPES), VALSTACK) ++ VALSTACK' </valstack>

    syntax BlockMetaData ::= OptionalInt
 // ------------------------------------

    syntax Instr ::= #block(VecType, Instrs, BlockMetaData) [symbol(aBlock)]
 // --------------------------------------------------------------------------------
    rule <instrs> #block(VECTYP, IS, _) => sequenceInstrs(IS) ~> label VECTYP { .Instrs } VALSTACK ... </instrs>
         <valstack> VALSTACK => .ValStack </valstack>
```

The `br*` instructions search through the instruction stack (the `<instrs>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WebAssembly specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax Instr ::= #br( Int ) [symbol(aBr)]
 // -------------------------------------------------
    rule <instrs> #br(_IDX) ~> (_S:Stmt => .K) ... </instrs>
    rule <instrs> #br(0   ) ~> label [ TYPES ] { IS } VALSTACK' => sequenceInstrs(IS) ... </instrs>
         <valstack> VALSTACK => #take(lengthValTypes(TYPES), VALSTACK) ++ VALSTACK' </valstack>
    rule <instrs> #br(N:Int) ~> _L:Label => #br(N -Int 1) ... </instrs>
      requires N >Int 0

    syntax Instr ::= "#br_if" "(" Int ")" [symbol(aBr_if)]
 // --------------------------------------------------------------
    rule <instrs> #br_if(IDX) => #br(IDX) ... </instrs>
         <valstack> <i32> VAL : VALSTACK => VALSTACK </valstack>
      requires VAL =/=Int 0
    rule <instrs> #br_if(_IDX) => .K    ... </instrs>
         <valstack> <i32> VAL : VALSTACK => VALSTACK </valstack>
      requires VAL  ==Int 0

    syntax Instr ::= "#br_table" "(" Ints ")" [symbol(aBr_table)]
 // ---------------------------------------------------------------------
    rule <instrs> #br_table(ES) => #br(#getInts(ES, minInt(VAL, #lenInts(ES) -Int 1))) ... </instrs>
         <valstack> <i32> VAL : VALSTACK => VALSTACK </valstack>
      requires 0 <=Int VAL
       andBool #lenInts(ES) >Int 0
      [preserves-definedness]
      // preserves-definedness:
      // - 0 <= VAL and minInt(VAL, #lenInts(ES) -Int 1) ensures #getInts(_) is defined

```

Finally, we have the conditional and loop instructions.

```k
    syntax Instr ::= #if( VecType, then : Instrs, else : Instrs, blockInfo: BlockMetaData) [symbol(aIf)]
 // ------------------------------------------------------------------------------------------------------------
    rule <instrs> #if(VECTYP, IS, _, _)  => sequenceInstrs(IS) ~> label VECTYP { .Instrs } VALSTACK ... </instrs>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL =/=Int 0

    rule <instrs> #if(VECTYP, _, IS, _) => sequenceInstrs(IS) ~> label VECTYP { .Instrs } VALSTACK ... </instrs>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL ==Int 0

    syntax Instr ::= #loop(VecType, Instrs, BlockMetaData) [symbol(aLoop)]
 // ------------------------------------------------------------------------------
    rule <instrs> #loop(VECTYP, IS, BLOCKMETA) => sequenceInstrs(IS) ~> label VECTYP { #loop(VECTYP, IS, BLOCKMETA) } VALSTACK ... </instrs>
         <valstack> VALSTACK => .ValStack </valstack>
```

Variable Operators
------------------

### Locals

The various `init_local` variants assist in setting up the `locals` cell.

```k
    rule <instrs> init_locals VALUES => #init_locals VALUES ... </instrs>
         <locals> _ => .List </locals>

    rule <instrs> #init_locals .ValStack => .K ... </instrs>
    rule <instrs> #init_locals (VALUE : VALSTACK)
               => #init_locals VALSTACK
               ...
          </instrs>
         <locals> ... .List => ListItem(VALUE) </locals>
```

The `*_local` instructions are defined here.

```k
    syntax Instr ::= "#local.get" "(" Int ")" [symbol(aLocal.get)]
                   | "#local.set" "(" Int ")" [symbol(aLocal.set)]
                   | "#local.tee" "(" Int ")" [symbol(aLocal.tee)]
 // ----------------------------------------------------------------------
    rule <instrs> #local.get(I) => .K ... </instrs>
         <valstack> VALSTACK => {LOCALS [ I ]}:>Val : VALSTACK </valstack>
         <locals> LOCALS </locals>
         requires isVal(LOCALS [ I ])  // requires needed to make rule valid

    rule <instrs> #local.set(I) => .K ... </instrs>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <locals> LOCALS => LOCALS[I <- VALUE] </locals>
        requires I >=Int 0 andBool I <Int size(LOCALS)

    rule <instrs> #local.tee(I) => .K ... </instrs>
         <valstack> VALUE : _VALSTACK </valstack>
         <locals> LOCALS => LOCALS[I <- VALUE] </locals>
        requires I >=Int 0 andBool I <Int size(LOCALS)
```

### Globals

When globals are declared, they must also be given a constant initialization value.
The `GlobalSpec` production is used to define all ways that a global can specified.
Globals can either be specified by giving a type and an initializer expression; or by an import and it's expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax GlobalType ::= Mut ValType [symbol(aGlobalType)]
 // ---------------------------------------------------------------

    syntax GlobalDefn ::= #global(type: GlobalType, init: Instrs, metadata: OptionalId) [symbol(aGlobalDefn)]
    syntax Alloc      ::= allocglobal (OptionalId, GlobalType)
 // ----------------------------------------------------------
    rule <instrs> #global(... type: TYP, init: IS, metadata: OID) => sequenceInstrs(IS) ~> allocglobal(OID, TYP) ... </instrs>

    rule <instrs> allocglobal(OID:OptionalId, MUT:Mut TYP:ValType) => .K ... </instrs>
         <valstack> VAL : STACK => STACK </valstack>
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
               <gAddr>  NEXTADDR </gAddr>
               <gValue> VAL      </gValue>
               <gMut>   MUT      </gMut>
             </globalInst>
           )
           ...
         </globals>
      requires #typeMatches(TYP, VAL)

```

The `get` and `set` instructions read and write globals.

```k
    syntax Instr ::= "#global.get" "(" Int ")" [symbol(aGlobal.get)]
                   | "#global.set" "(" Int ")" [symbol(aGlobal.set)]
 // ------------------------------------------------------------------------
    rule <instrs> #global.get(IDX) => .K ... </instrs>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globalAddrs> ... IDX |-> GADDR ... </globalAddrs>
           ...
         </moduleInst>
         <globalInst>
           <gAddr>  GADDR </gAddr>
           <gValue> VALUE </gValue>
           ...
         </globalInst>

    rule <instrs> #global.set(IDX) => .K ... </instrs>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globalAddrs> ... IDX |-> GADDR ... </globalAddrs>
           ...
         </moduleInst>
         <globalInst>
           <gAddr>  GADDR      </gAddr>
           <gValue> _ => VALUE </gValue>
           ...
         </globalInst>
         [preserves-definedness]
      // Preserving definedness:
      //  - Map update preserves definedness (<globalInst>)
```

### Table Instructions

- [Structure](https://webassembly.github.io/spec/core/syntax/instructions.html#table-instructions)
- [Execution](https://webassembly.github.io/spec/core/exec/instructions.html#table-instructions)

```k
    syntax Instr ::= "#table.get"  "(" Int ")"          [symbol(aTable.get)]
                   | "#table.set"  "(" Int ")"          [symbol(aTable.set)]
                   | "#table.size" "(" Int ")"          [symbol(aTable.size)]
                   | "#table.grow" "(" Int ")"          [symbol(aTable.grow)]
                   | "#table.fill" "(" Int ")"          [symbol(aTable.fill)]
                   | "#table.copy" "(" Int "," Int ")"  [symbol(aTable.copy)]
                   | "#table.init" "(" Int "," Int ")"  [symbol(aTable.init)]
                   | "#elem.drop"  "(" Int ")"          [symbol(aElem.drop)]
 // ---------------------------------------------------------------------------------
```

#### `table.get`

```k
    rule [table.get]:
        <instrs> #table.get( TID ) => #tableGet(TADDR, I) ... </instrs>
        <valstack> <i32> I : REST => REST </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx>   CUR    </modIdx>
          <tabAddrs> ... TID |-> TADDR ... </tabAddrs>
          ...
        </moduleInst>

    syntax Instr ::= #tableGet( addr: Int, index: Int)
    rule [tableGet]:
        <instrs> #tableGet( TADDR, I) => getRefOrNull(TDATA, I) ... </instrs>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tdata> TDATA </tdata>
          ...
        </tabInst>
      requires 0 <=Int I
       andBool I <Int size(TDATA)

    rule [tableGet-trap]:
        <instrs> #tableGet( TADDR, I) => trap ... </instrs>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tdata> TDATA </tdata>
          ...
        </tabInst>
      requires I <Int 0
        orBool size(TDATA) <=Int I
```

#### `table.set`

```k
    syntax Instr ::= #tableSet( addr: Int , val: RefVal , idx: Int )
 // -----------------------------------------
    rule [table.set]:
        <instrs> #table.set( TID )
              => #tableSet(TADDR, VAL, I) ...
        </instrs>
        <valstack> VAL:RefVal : <i32> I : REST => REST </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... TID |-> TADDR ... </tabAddrs>
          ...
        </moduleInst>

    rule [tableSet-oob]:
        <instrs> #tableSet(TADDR, _VAL, I) => trap ... </instrs>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tdata> TDATA </tdata>
          ...
        </tabInst>
      requires I <Int 0
        orBool size(TDATA) <=Int I

    rule [tableSet]:
        <instrs> #tableSet(TADDR, VAL, I) => .K ... </instrs>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tdata> TDATA => TDATA [ I <- VAL ] </tdata>
          ...
        </tabInst>
      requires 0 <=Int I
       andBool I <Int size(TDATA)
      [preserves-definedness]
    // Preserving definedness:
    //   - I is in list bounds
```

#### `table.size`

```k
    rule [table.size]:
        <instrs> #table.size(TID) => i32.const size(TDATA) ... </instrs>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... TID |-> TADDR ... </tabAddrs>
          ...
        </moduleInst>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tdata> TDATA </tdata>
          ...
        </tabInst>
```

#### `table.grow`

```k
    rule [table.grow]:
        <instrs> #table.grow(TID) => i32.const size(TDATA) ... </instrs>
        <valstack> <i32> N : REFVAL : STACK => STACK </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... TID |-> TADDR ... </tabAddrs>
          ...
        </moduleInst>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tmax>  TMAX  </tmax>
          <tdata> TDATA => TDATA makeListRefTotal(N, REFVAL) </tdata>
          ...
        </tabInst>
      requires #canGrow(size(TDATA), N, TMAX)

    rule [table.grow-fail]:
        <instrs> #table.grow(TID) => i32.const (#pow(i32) -Int 1) ... </instrs>
        <valstack> <i32> N : _REFVAL : STACK => STACK </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... TID |-> TADDR ... </tabAddrs>
          ...
        </moduleInst>
        <tabInst>
          <tAddr> TADDR </tAddr>
          <tmax>  TMAX  </tmax>
          <tdata> TDATA </tdata>
          ...
        </tabInst>
      requires notBool #canGrow(size(TDATA), N, TMAX)

    syntax Bool ::= #canGrow(len: Int, n: Int, max: OptionalInt)   [function, total]
 // --------------------------------------------------------------------------------
    rule #canGrow(LEN, N, MAX) => LEN +Int N <Int #pow(i32)
                          andBool LEN +Int N <=Int MAX
    rule #canGrow(LEN, N, .Int) => LEN +Int N <Int #pow(i32)

```

#### `table.fill`

```k
    rule [table.fill]:
        <instrs> #table.fill(TID)
              => #tableCheckSizeGTE(TADDR, I +Int N)
              ~> #tableFill(TID, N, RVAL, I) ...
        </instrs>
        <valstack> <i32> N : RVAL : <i32> I : STACK => STACK </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... TID |-> TADDR ... </tabAddrs>
          ...
        </moduleInst>

    syntax Instr ::= #tableFill(Int, Int, RefVal, Int)
 // ------------------------------------------------------
    rule [tableFill-zero]:
        <instrs> #tableFill(_, 0, _, _) => .K ... </instrs>

    rule [tableFill-loop]:
        <instrs> #tableFill(TID, N, RVAL, I)
              => <i32> I
              ~> RVAL
              ~> #table.set(TID)
              ~> #tableFill(TID, N -Int 1, RVAL, I +Int 1)
                 ...
        </instrs>
      requires N >Int 0

```

#### `table.copy`

```k
    rule [table.copy]:
        <instrs> #table.copy(TX, TY)
              => #tableCheckSizeGTE(TYADDR, S +Int N)
              ~> #tableCheckSizeGTE(TXADDR, D +Int N)
              ~> #tableCopy(TX, TY, N, S, D)
                 ...
        </instrs>
        <valstack> <i32> N : <i32> S : <i32> D : STACK => STACK </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... (TX |-> TXADDR) (TY |-> TYADDR) ... </tabAddrs>
          ...
        </moduleInst>

    rule [table.copy-self]:
        <instrs> #table.copy(TX, TX)
              => #tableCheckSizeGTE(TXADDR, maxInt(S, D) +Int N)
              ~> #tableCopy(TX, TX, N, S, D)
                 ...
        </instrs>
        <valstack> <i32> N : <i32> S : <i32> D : STACK => STACK </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <tabAddrs> ... TX |-> TXADDR ... </tabAddrs>
          ...
        </moduleInst>

    syntax Instr ::= #tableCopy(tix: Int, tiy: Int, n: Int, s: Int, d: Int)
 // -----------------------------------------------------------------------
    rule [tableCopy-zero]:
        <instrs> #tableCopy(_, _, 0, _, _) => .K ... </instrs>

    // If D (destination index) is less than S (source), go from left to right
    // Otherwise, start from the end
    rule [tableCopy-LR]:
        <instrs> #tableCopy(TIX, TIY, N, S, D)
              => <i32> D
              ~> <i32> S
              ~> #table.get(TIY)
              ~> #table.set(TIX)
              ~> #tableCopy(TIX, TIY, N -Int 1, S +Int 1, D +Int 1)
                 ...
        </instrs>
      requires N >Int 0
       andBool D <=Int S

    rule [tableCopy-RL]:
        <instrs> #tableCopy(TIX, TIY, N, S, D)
              => <i32> (D +Int N -Int 1)
              ~> <i32> (S +Int N -Int 1)
              ~> #table.get(TIY)
              ~> #table.set(TIX)
              ~> #tableCopy(TIX, TIY, N -Int 1, S, D)
                 ...
        </instrs>
      requires N >Int 0
       andBool D >Int S
```

#### `table.init`

```k
    rule [table.init]:
        <instrs> #table.init(TID, EID)
              => #elemCheckSizeGTE (EA, S +Int N)
              ~> #tableCheckSizeGTE(TA, D +Int N)
              ~> #tableInit(TID, N, D, dropListRef(S, ELEM))
                 ...
        </instrs>
        <valstack> <i32> N : <i32> S : <i32> D : REST => REST </valstack>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx>   CUR    </modIdx>
          <tabAddrs>  ... TID |-> TA ... </tabAddrs>
          <elemAddrs> ... EID |-> EA ... </elemAddrs>
          ...
        </moduleInst>
        <elemInst>
          <eAddr>  EA    </eAddr>
          <eValue> ELEM  </eValue>
          ...
        </elemInst>

    syntax Instr ::= #tableInit(tidx: Int, n: Int, d: Int, es: ListRef)
 // ----------------------------------------------------
    rule [tableInit-done]:
        <instrs> #tableInit(_, 0, _, _) => .K ... </instrs>

    rule [tableInit]:
        <instrs> #tableInit(TID, N, D, ListItem(R) RS)
              => #table.set(TID)
              ~> #tableInit(TID, N -Int 1, D +Int 1, RS)
                 ...
        </instrs>
        <valstack> STACK => R : <i32> D : STACK </valstack>
      requires N >Int 0

```

#### `elem.drop`

```k
    rule [elem.drop]:
        <instrs> #elem.drop(EID) => .K ... </instrs>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx>   CUR    </modIdx>
          <elemAddrs> ... EID |-> EA ... </elemAddrs>
          ...
        </moduleInst>
        <elemInst>
          <eAddr>  EA          </eAddr>
          <eValue> _  => .ListRef </eValue>
          ...
        </elemInst>

```

#### Misc

```k
    syntax Instr ::= #tableCheckSizeGTE(addr: Int, n: Int)
 // -------------------------------------------------------
    rule [tableCheckSizeGTE-pass]:
        <instrs> #tableCheckSizeGTE(ADDR, N) => .K ... </instrs>
        <tabInst>
          <tAddr> ADDR </tAddr>
          <tdata> TDATA </tdata>
          ...
        </tabInst>
      requires N <=Int size(TDATA)

    rule [tableCheckSizeGTE-fail]:
        <instrs> #tableCheckSizeGTE(_, _) => trap ... </instrs>
      [owise]


    syntax Instr ::= #elemCheckSizeGTE(addr: Int, n: Int)
 // -------------------------------------------------------
    rule [elemCheckSizeGTE-pass]:
        <instrs> #elemCheckSizeGTE(ADDR, N) => .K ... </instrs>
        <elemInst>
          <eAddr>  ADDR </eAddr>
          <eValue> ELEM </eValue>
          ...
        </elemInst>
      requires N <=Int size(ELEM)

    rule [elemCheckSizeGTE-fail]:
        <instrs> #elemCheckSizeGTE(_, _) => trap ... </instrs>
      [owise]
```

### Reference Instructions

- [Structure](https://webassembly.github.io/spec/core/syntax/instructions.html#reference-instructions)
- [Execution](https://webassembly.github.io/spec/core/exec/instructions.html#reference-instructions)

```k
    syntax Instr ::= "#ref.is_null"               [symbol(aRef.is_null)]
                   | "#ref.func" "(" Int ")"    [symbol(aRef.func)]
 // ------------------------------------------------------------------------

    rule [ref.null.func]:
        <instrs> ref.null func => <funcref> null ... </instrs>
    rule [ref.null.extern]:
        <instrs> ref.null extern => <externref> null ... </instrs>

    rule [ref.isNull-true]:
        <instrs> #ref.is_null => i32.const 1 ... </instrs>
        <valstack> <_:RefValType> null : STACK => STACK </valstack>

    rule [ref.isNull-false]:
        <instrs> #ref.is_null => i32.const 0 ... </instrs>
        <valstack> <_:RefValType> _:Int : STACK => STACK </valstack>

    rule [ref.func]:
        <instrs> #ref.func(IDX) => (<funcref> FUNCADDRS {{ IDX }} orDefault 0 )  ... </instrs>
        <curModIdx> CUR </curModIdx>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <funcAddrs> FUNCADDRS </funcAddrs>
          ...
        </moduleInst>
      requires isListIndex(IDX, FUNCADDRS)
```

Types
-----

### Type Gathering

This defines helper functions that gathers function together.
The function `gatherTypes` keeps the `TypeDecl`s that have the same `TypeKeyWord` as we need and throws away the `TypeDecl` having different `TypeKeyWord`.

```k
    syntax VecType ::=  gatherTypes ( TypeKeyWord , TypeDecls )            [function]
                     | #gatherTypes ( TypeKeyWord , TypeDecls , ValTypes ) [function]
 // ---------------------------------------------------------------------------------
    rule  gatherTypes(TKW , TDECLS:TypeDecls) => #gatherTypes(TKW, TDECLS, .ValTypes)

    rule #gatherTypes( _  ,                                   .TypeDecls , TYPES) => [ TYPES ]
    rule #gatherTypes(TKW , TKW':TypeKeyWord _:ValTypes TDECLS:TypeDecls , TYPES) => #gatherTypes(TKW, TDECLS, TYPES) requires TKW =/=K TKW'
    rule #gatherTypes(TKW , TKW         TYPES':ValTypes TDECLS:TypeDecls , TYPES)
      => #gatherTypes(TKW ,                             TDECLS:TypeDecls , TYPES + TYPES')
    rule #gatherTypes(result , param _ID:Identifier     _:ValType TDECLS:TypeDecls , TYPES) => #gatherTypes(result , TDECLS , TYPES)
    rule #gatherTypes(param  , param _ID:Identifier VTYPE:ValType TDECLS:TypeDecls , TYPES) => #gatherTypes(param  , TDECLS , TYPES + VTYPE .ValTypes)
```

### Type Use

A type use is a reference to a type definition.
It may optionally be augmented by explicit inlined parameter and result declarations.
A type use should start with `'(' 'type' x:typeidx ')'` followed by a group of inlined parameter or result declarations.

```k
    syntax FuncType ::= asFuncType ( TypeDecls )         [function, symbol(TypeDeclsAsFuncType)]
                      | asFuncType ( Map, Map, TypeUse ) [function, symbol(TypeUseAsFuncType)  ]
 // --------------------------------------------------------------------------------------------
    rule asFuncType(TDECLS:TypeDecls)                       => gatherTypes(param, TDECLS) -> gatherTypes(result, TDECLS)
    rule asFuncType(   _   ,   _  , TDECLS:TypeDecls)       => asFuncType(TDECLS)
    rule asFuncType(TYPEIDS, TYPES, (type TFIDX ))          => {TYPES[#ContextLookup(TYPEIDS ,TFIDX)]}:>FuncType
    rule asFuncType(TYPEIDS, TYPES, (type TFIDX ) TDECLS )  => asFuncType(TDECLS)
      requires TYPES[#ContextLookup(TYPEIDS, TFIDX)] ==K asFuncType(TDECLS)
```

### Type Declaration

Type could be declared explicitly and could optionally bind with an identifier.
`identifier` for `param` will be used only when the function type is declared when defining a function.
When defining `TypeDefn`, the `identifier` for `param` will be ignored and will not be saved into the module instance.

```k
    syntax TypeDefn ::= #type(type: FuncType, metadata: OptionalId) [symbol(aTypeDefn)]
    syntax Alloc    ::= alloctype (OptionalId, FuncType)
 // ----------------------------------------------------
    rule <instrs> #type(... type: TYPE, metadata: OID) => alloctype(OID, TYPE) ... </instrs>

    rule <instrs> alloctype(OID, TYPE) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> IDS => #saveId(IDS, OID, NEXTIDX) </typeIds>
           <nextTypeIdx> NEXTIDX => NEXTIDX +Int 1 </nextTypeIdx>
           <types> TYPES => TYPES [NEXTIDX <- TYPE] </types>
           ...
         </moduleInst>
```

Function Declaration and Invocation
-----------------------------------

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we allow for an "abstract" function declaration using syntax `func_::___`, and a more concrete one which allows arbitrary order of declaration of parameters, locals, and results.
The `FuncSpec` production is used to define all ways that a global can specified.
A function can either be specified by giving a type, what locals it allocates, and a function body; or by an import and it's expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax FuncDefn ::= #func(type: Int, locals: VecType, body: Instrs, metadata: FuncMetadata) [symbol(aFuncDefn)]
    syntax Alloc    ::= allocfunc ( Int , Int , FuncType , VecType , Instrs , FuncMetadata )
 // ----------------------------------------------------------------------------------------
    rule <instrs> #func(... type: TYPIDX, locals: LOCALS, body: INSTRS, metadata: META) => allocfunc(CUR, NEXTADDR, TYPE, LOCALS, INSTRS, META) ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <types>  ... TYPIDX |-> TYPE ... </types>
           <nextFuncIdx> NEXTIDX => NEXTIDX +Int 1 </nextFuncIdx>
           <funcAddrs> ADDRS => setExtend(ADDRS, NEXTIDX, NEXTADDR, -1) </funcAddrs>
           ...
         </moduleInst>
         <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>

    rule <instrs> allocfunc(MOD, ADDR, TYPE, LOCALS, INSTRS, #meta(... id: OID, localIds: LIDS)) => .K ... </instrs>
         <funcs>
           ( .Bag
          => <funcDef>
               <fAddr>    ADDR </fAddr>
               <fCode>    INSTRS   </fCode>
               <fType>    TYPE     </fType>
               <fLocal>   LOCALS   </fLocal>
               <fModInst> MOD      </fModInst>
               <funcMetadata>
                 <funcId> OID </funcId>
                 <localIds> LIDS </localIds>
                 ...
               </funcMetadata>
             </funcDef>
           )
           ...
         </funcs>

    syntax FuncMetadata ::= #meta(id: OptionalId, localIds: Map) [symbol(funcMeta)]
 // ---------------------------------------------------------------------------------------
```

### Function Invocation/Return

Frames are used to store function return points.
Similar to labels, they sit on the instruction stack (the `<instrs>` cell), and `return` consumes things following it until hitting it.
Unlike labels, only one frame can be "broken" through at a time.

```k
    syntax Frame ::= "frame" Int ValTypes ValStack List
 // ---------------------------------------------------
    rule <instrs> frame MODIDX' TRANGE VALSTACK' LOCAL' => .K ... </instrs>
         <valstack> VALSTACK => #take(lengthValTypes(TRANGE), VALSTACK) ++ VALSTACK' </valstack>
         <locals> _ => LOCAL' </locals>
         <curModIdx> _ => MODIDX' </curModIdx>
```

When we invoke a function, the element on the top of the stack will become the last parameter of the function.
For example, when we call `(invoke "foo" (i64.const 100) (i64.const 43) (i32.const 22))`, `(i32.const 22)` will be on the top of `<valstack>`, but it will be the last parameter of this function invocation if this function takes 3 parameters.
That is, whenever we want to `#take` or `#drop` an array of `params`, we need to reverse the array of `params` to make the type of the last parameter matching with the type of the value on the top of stack.
The `#take` function will return the parameter stack in the reversed order, then we need to reverse the stack again to get the actual parameter array we want.

```k
    syntax Instr ::= "(" "invoke" Int ")"
 // -------------------------------------
    rule <instrs> ( invoke FADDR )
               => init_locals #revs(#take(lengthValTypes(TDOMAIN), VALSTACK)) ++ #zero(TLOCALS)
               ~> #block([TRANGE], INSTRS, .Int)
               ~> frame MODIDX TRANGE #drop(lengthValTypes(TDOMAIN), VALSTACK) LOCAL
               ...
         </instrs>
         <valstack>  VALSTACK => .ValStack </valstack>
         <locals> LOCAL </locals>
         <curModIdx> MODIDX => MODIDX' </curModIdx>
         <funcDef>
           <fAddr>    FADDR                     </fAddr>
           <fCode>    INSTRS                    </fCode>
           <fType>    [ TDOMAIN ] -> [ TRANGE ] </fType>
           <fLocal>   [ TLOCALS ]               </fLocal>
           <fModInst> MODIDX'                   </fModInst>
           ...
         </funcDef>

    rule <instrs> return ~> (_S:Stmt  => .K)  ... </instrs>
    rule <instrs> return ~> (_L:Label => .K)  ... </instrs>
    rule <instrs> (return => .K) ~> _FR:Frame ... </instrs>
```

### Function Call

`call funcidx` and `call_indirect tableidx typeuse` are 2 control instructions that invoke a function in the current frame.

```k
    syntax Instr ::= #call(Int) [symbol(aCall)]
 // ---------------------------------------------------
    rule <instrs> #call(IDX) => ( invoke FUNCADDRS {{ IDX }} orDefault 0 ) ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcAddrs> FUNCADDRS </funcAddrs>
           ...
         </moduleInst>
        requires isListIndex(IDX, FUNCADDRS)
```

```k
    syntax Instr ::= "#call_indirect" "(" Int "," TypeUse ")" [symbol(aCall_indirect)]
 // ------------------------------------------------------------------------------
```

TODO: This is kept for compatibility with the text format.
The `TypeUses` should be desugared to use a type-index instead.
But this requires a recursive descent into all the instructions of a function, with feedback up to the top level.
The types need to be inserted at the definitions level, if a previously undeclared type is present in a `call_indirect` function.

```k
    rule [call-indirect-getRef]:
        <instrs> #call_indirect(TIDX:Int,TUSE:TypeUse)
              => #callIndirect(
                    getRefOrNull(TDATA, IDX),
                    asFuncType(TYPEIDS, TYPES, TUSE)
                  ) ...
        </instrs>
        <curModIdx> CUR </curModIdx>
        <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>
        <moduleInst>
          <modIdx> CUR </modIdx>
          <typeIds> TYPEIDS </typeIds>
          <types> TYPES </types>
          <tabAddrs> ... TIDX |-> ADDR ... </tabAddrs>
          ...
        </moduleInst>
        <tabInst>
          <tAddr> ADDR </tAddr>
          <tdata> TDATA </tdata>
          ...
        </tabInst>


    syntax Instr ::= #callIndirect(RefVal, FuncType)
 // ------------------------------------------
    rule [callIndirect-invoke]:
        <instrs> #callIndirect(<funcref> FADDR, ETYPE)
              => ( invoke FADDR ) ...
        </instrs>
        <funcDef>
          <fAddr> FADDR </fAddr>
          <fType> FTYPE </fType>
          ...
        </funcDef>
      requires ETYPE ==K FTYPE

    rule [callIndirect-wrong-type]:
        <instrs> #callIndirect(<funcref> FADDR, ETYPE)
              => trap ...
        </instrs>
        <funcDef>
          <fAddr> FADDR </fAddr>
          <fType> FTYPE </fType>
          ...
        </funcDef>
      requires ETYPE =/=K FTYPE

    rule [callIndirect-null-ref]:
        <instrs> #callIndirect(<_> null, _) => trap ... </instrs>

```

Table
-----

The allocation of a new `tableinst`.
Currently at most one table may be defined or imported in a single module.
The only allowed `TableElemType` is "funcref", so we ignore this term in the reducted sort.
The table values are addresses into the store of functions.
The `TableSpec` production is used to define all ways that a global can specified.
A table can either be specified by giving its type (limits and `funcref`); by specifying a vector of its initial `elem`ents; or by an import and its expected type.
The specification can also include export directives.
The importing and exporting parts of specifications are dealt with in the respective sections for import and export.

```k
    syntax TableDefn ::= #table (limits: Limits, type: RefValType, metadata: OptionalId) [symbol(aTableDefn)]
    syntax Alloc ::= alloctable (OptionalId, Int, OptionalInt, RefValType)
 // --------------------------------------------------------------------
    rule <instrs> #table(... limits: #limitsMin(MIN), type: TYP, metadata: OID)   => alloctable(OID, MIN, .Int, TYP) ... </instrs>
      requires MIN <=Int #maxTableSize()
    rule <instrs> #table(... limits: #limits(MIN, MAX), type: TYP, metadata: OID) => alloctable(OID, MIN, MAX, TYP) ... </instrs>
      requires MIN <=Int #maxTableSize()
       andBool MAX <=Int #maxTableSize()

    rule <instrs> alloctable(ID, MIN, MAX, TYP) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS => #saveId(IDS, ID, NEXTIDX) </tabIds>
           <tabAddrs> ADDRS => ADDRS [ NEXTIDX <- NEXTADDR] </tabAddrs>
           <nextTabIdx> NEXTIDX => NEXTIDX +Int 1 </nextTabIdx>
           ...
         </moduleInst>
         <nextTabAddr> NEXTADDR => NEXTADDR +Int 1 </nextTabAddr>
         <tabs>
           ( .Bag
          => <tabInst>
               <tAddr> NEXTADDR </tAddr>
               <tmax>  MAX      </tmax>
               <tdata>
                makeListRefTotal(MIN, <TYP> null)
               </tdata>
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
[Memory Instructions](https://webassembly.github.io/spec/core/exec/instructions.html#memory-instructions)

```k
    syntax MemoryDefn ::= #memory(limits: Limits, metadata: OptionalId) [symbol(aMemoryDefn)]
    syntax Alloc ::= allocmemory (OptionalId, Int, OptionalInt)
    syntax KItem ::= memInst(mmax: OptionalInt, msize: Int, mdata: SparseBytes)
 // ---------------------------------------------------------------------------
    rule <instrs> #memory(... limits: #limitsMin(MIN),   metadata: OID) => allocmemory(OID, MIN, .Int) ... </instrs>
      requires MIN <=Int #maxMemorySize()
    rule <instrs> #memory(... limits: #limits(MIN, MAX), metadata: OID) => allocmemory(OID, MIN, MAX)  ... </instrs>
      requires MIN <=Int #maxMemorySize()
       andBool MAX <=Int #maxMemorySize()

    rule <instrs> allocmemory(ID, MIN, MAX) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS => #saveId(IDS, ID, 0) </memIds>
           <memAddrs> .List => ListItem(size(MEMS)) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS => MEMS ListItem(memInst(MAX, MIN, .SparseBytes)) </mems>
```

The assorted store operations take an address of type `i32` and a value.
The `storeX` operations first wrap the the value to be stored to the bit wdith `X`.
The value is encoded as bytes and stored at the "effective address", which is the address given on the stack plus offset.
[Store Instructions](https://webassembly.github.io/spec/core/exec/instructions.html#t-mathsf-xref-syntax-instructions-syntax-instr-memory-mathsf-store-xref-syntax-instructions-syntax-memarg-mathit-memarg-and-t-mathsf-xref-syntax-instructions-syntax-instr-memory-mathsf-store-n-xref-syntax-instructions-syntax-memarg-mathit-memarg)

```k
    syntax Instr ::= #store(ValType, StoreOp, offset : Int) [symbol(aStore)]
                   | IValType "." StoreOp Int Int
 //                | FValType "." StoreOp Int Float
                   | "store" "{" IWidth Int Number "}"
                   | "store" "{" IWidth Int Number Int "}"
 // -----------------------------------------------
    rule <instrs> #store(ITYPE:IValType, SOP, OFFSET) => ITYPE . SOP (IDX +Int OFFSET) VAL ... </instrs>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>

    rule <instrs> store { WIDTH EA VAL } => store { WIDTH EA VAL ADDR } ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>

    rule <instrs> store { WIDTH EA VAL ADDR } => .K ... </instrs>
         <mems> MEMS => MEMS [ ADDR <- #let memInst(MAX, SIZE, DATA) = MEMS[ADDR] #in memInst(MAX, SIZE, #setRange(DATA, EA, VAL, #numBytes(WIDTH))) ] </mems>
         requires ADDR <Int size(MEMS)
           andBool (EA +Int #numBytes(WIDTH)) <=Int (msize(MEMS[ADDR]) *Int #pageSize())
         [preserves-definedness]
    // Preserving definedness:
    //   - #setRange is total
    //   - map updates (memInst) preserve definedness.

    rule <instrs> store { WIDTH  EA  _ ADDR } => trap ... </instrs>
         <mems> MEMS </mems>
         requires ADDR <Int size(MEMS)
           andBool (EA +Int #numBytes(WIDTH)) >Int (msize(MEMS[ADDR]) *Int #pageSize())

    rule <instrs> ITYPE . store   EA VAL => store { ITYPE EA VAL           } ... </instrs>
    rule <instrs> _     . store8  EA VAL => store { i8    EA #wrap(1, VAL) } ... </instrs>
    rule <instrs> _     . store16 EA VAL => store { i16   EA #wrap(2, VAL) } ... </instrs>
    rule <instrs> i64   . store32 EA VAL => store { i32   EA #wrap(4, VAL) } ... </instrs>
```

The assorted load operations take an address of type `i32`.
The `loadX_sx` operations loads `X` bits from memory, and extend it to the right length for the return value, interpreting the bytes as either signed or unsigned according to `sx`.
The value is fetched from the "effective address", which is the address given on the stack plus offset.
Sort `Signedness` is defined in module `BYTES`.
[Load Instructions](https://webassembly.github.io/spec/core/exec/instructions.html#t-mathsf-xref-syntax-instructions-syntax-instr-memory-mathsf-load-xref-syntax-instructions-syntax-memarg-mathit-memarg-and-t-mathsf-xref-syntax-instructions-syntax-instr-memory-mathsf-load-n-mathsf-xref-syntax-instructions-syntax-sx-mathit-sx-xref-syntax-instructions-syntax-memarg-mathit-memarg)

```k
    syntax Instr ::= #load(ValType, LoadOp, offset : Int) [symbol(aLoad)]
                   | "load" "{" IValType IWidth Int Signedness"}"
                   | "load" "{" IValType IWidth Int Signedness Int"}"
                   | "load" "{" IValType IWidth Int Signedness SparseBytes"}"
                   | IValType "." LoadOp Int
 // ----------------------------------------
    rule <instrs> #load(ITYPE:IValType, LOP, OFFSET) => ITYPE . LOP (IDX +Int OFFSET)  ... </instrs>
         <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>

    rule <instrs> ITYPE . load     EA:Int => load { ITYPE ITYPE EA Unsigned } ... </instrs>
    rule <instrs> ITYPE . load8_u  EA:Int => load { ITYPE i8    EA Unsigned } ... </instrs>
    rule <instrs> ITYPE . load16_u EA:Int => load { ITYPE i16   EA Unsigned } ... </instrs>
    rule <instrs> i64   . load32_u EA:Int => load { i64   i32   EA Unsigned } ... </instrs>
    rule <instrs> ITYPE . load8_s  EA:Int => load { ITYPE i8    EA Signed   } ... </instrs>
    rule <instrs> ITYPE . load16_s EA:Int => load { ITYPE i16   EA Signed   } ... </instrs>
    rule <instrs> i64   . load32_s EA:Int => load { i64   i32   EA Signed   } ... </instrs>

    rule <instrs> load { ITYPE WIDTH EA SIGN } => load { ITYPE WIDTH EA SIGN ADDR:Int } ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>

    rule <instrs> load { ITYPE WIDTH EA SIGN ADDR:Int} => load { ITYPE WIDTH EA SIGN mdata(MEMS[ADDR]) } ... </instrs>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
        andBool (EA +Int #numBytes(WIDTH)) <=Int (msize(MEMS[ADDR]) *Int #pageSize())

    rule <instrs> load { _ WIDTH EA _ ADDR:Int} => trap ... </instrs>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
        andBool (EA +Int #numBytes(WIDTH)) >Int (msize(MEMS[ADDR]) *Int #pageSize())

    rule <instrs> load { ITYPE WIDTH EA   Signed DATA:SparseBytes } => #chop(< ITYPE > #signed(WIDTH, #getRange(DATA, EA, #numBytes(WIDTH)))) ... </instrs>
        [preserves-definedness]
        // #signed(WIDTH, N) is defined for 0 <= N <= #pow(WIDTH)
        // #pow(WIDTH) == 2 ^ #width(WIDTH) == 2 ^ (#numBytes(WIDTH) * 8)
        // and #getRange(_, _, SIZE) < 2 ^ (SIZE * 8)

    rule <instrs> load { ITYPE WIDTH EA Unsigned DATA:SparseBytes } => < ITYPE > #getRange(DATA, EA, #numBytes(WIDTH)) ... </instrs>
```

The `size` operation returns the size of the memory, measured in pages.
[Memory Size](https://webassembly.github.io/spec/core/exec/instructions.html#xref-syntax-instructions-syntax-instr-memory-mathsf-memory-size)

```k
    rule <instrs> memory.size => < i32 > msize(MEMS[ADDR]) ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
```

`grow` increases the size of memory in units of pages.
Failure to grow is indicated by pushing -1 to the stack.
Success is indicated by pushing the previous memory size to the stack.
`grow` is non-deterministic and may fail either due to trying to exceed explicit max values, or because the embedder does not have resources available.
By setting the `<deterministicMemoryGrowth>` field in the configuration to `true`, the sematnics ensure memory growth only fails if the memory in question would exceed max bounds.
[Memory Grow](https://webassembly.github.io/spec/core/exec/instructions.html#xref-syntax-instructions-syntax-instr-memory-mathsf-memory-grow)

```k
    syntax Instr ::= "grow" Int
 // ---------------------------
    rule <instrs> memory.grow => grow N ... </instrs>
         <valstack> < i32 > N : VALSTACK => VALSTACK </valstack>

    rule <instrs> grow N => < i32 > msize(MEMS[ADDR]) ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS => #let memInst(MAX, SIZE, DATA) = MEMS[ADDR] #in MEMS[ADDR <- memInst(MAX, SIZE +Int N, DATA)] </mems>
      requires ADDR <Int size(MEMS)
        andBool (#let memInst(MAX, SIZE, _) = MEMS[ADDR] #in #growthAllowed(SIZE +Int N, MAX))

    rule <instrs> grow N => < i32 > #unsigned(i32, -1) ... </instrs>
         <deterministicMemoryGrowth> DET:Bool </deterministicMemoryGrowth>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
        andBool (#let memInst(MAX, SIZE, _) = MEMS[ADDR] #in (notBool DET
        orBool notBool #growthAllowed(SIZE +Int N, MAX)))

    syntax Bool ::= #growthAllowed(Int, OptionalInt) [function, total]
 // -----------------------------------------------------------
    rule #growthAllowed(SIZE, .Int ) => SIZE <=Int #maxMemorySize()
    rule #growthAllowed(SIZE, I:Int) => #growthAllowed(SIZE, .Int) andBool SIZE <=Int I
```

However, the absolute max allowed size if 2^16 pages.
Incidentally, the page size is 2^16 bytes.
The maximum of table size is 2^32 bytes.

```k
    rule #pageSize()      => 65536
    rule #maxMemorySize() => 65536
    rule #maxTableSize()  => 4294967296
```

`fill` fills a contiguous section of memory with a value.
When the section specified goes beyond the bounds of the memory region, that causes a trap.
If the section has length 0, nothing happens.
The spec states that this is really a sequence of `i32.store8` instructions, but we use `replaceAt` here.
[Memory Fill](https://webassembly.github.io/spec/core/exec/instructions.html#xref-syntax-instructions-syntax-instr-memory-mathsf-memory-fill)

```k
    syntax Instr ::= "fillTrap" Int Int Int
                   | "fill"     Int Int Int
 // ---------------------------------------
    rule <instrs> memory.fill => fillTrap N VAL D ... </instrs>
         <valstack> < i32 > N : < i32 > VAL : < i32 > D : VALSTACK => VALSTACK </valstack>

    rule <instrs> fillTrap N _VAL D => trap ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
       andBool (#let memInst(_, SIZE, _) = MEMS[ADDR] #in N +Int D >Int SIZE *Int #pageSize())

    rule <instrs> fillTrap N VAL D => fill N VAL D ... </instrs> [owise]

    rule <instrs> fill 0 _VAL _D => .K ... </instrs>

    rule <instrs> fill N VAL D => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS => MEMS [ ADDR <- #let memInst(MAX, SIZE, DATA) = MEMS[ADDR] #in memInst(MAX, SIZE, replaceAt(DATA, D, padRightBytes(.Bytes, N, VAL))) ] </mems>
      requires ADDR <Int size(MEMS) andBool notBool N ==Int 0
```

`copy` will copy a section of memory from one location to another.
The source and destination segments may overlap.
Similar to `fill`, we perform the entire copy in one internal operation as opposed to
performing a series of load and store operations as stated in the spec.
[Memory Copy](https://webassembly.github.io/spec/core/exec/instructions.html#xref-syntax-instructions-syntax-instr-memory-mathsf-memory-copy)

```k
    syntax Instr ::= "copyTrap" Int Int Int
                   | "copy" Int Int Int
 // ---------------------------------------
    rule <instrs> memory.copy => copyTrap N S D ... </instrs>
         <valstack> < i32 > N : < i32 > S : < i32 > D : VALSTACK => VALSTACK </valstack>

    rule <instrs> copyTrap N S D => trap ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
       andBool (#let memInst(_, SIZE, _) = MEMS[ADDR] #in D +Int N >Int SIZE *Int #pageSize()
        orBool S +Int N >Int SIZE *Int #pageSize())

    rule <instrs> copyTrap N S D => copy N S D ... </instrs> [owise]

    rule <instrs> copy 0 _S _D => .K ... </instrs>

    rule <instrs> copy N S D => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS => MEMS [ ADDR <- #let memInst(MAX, SIZE, DATA) = MEMS[ADDR] #in memInst(MAX, SIZE, replaceAt(DATA, D, #getBytesRange(DATA, S, N))) ] </mems>
      requires ADDR <Int size(MEMS) andBool notBool N ==Int 0
```

Element Segments
----------------

```k
    syntax ElemDefn ::= #elem(type: RefValType, elemSegment: ListRef, mode: ElemMode, oid: OptionalId)  [symbol(aElemDefn)]
                      | #elemAux(segmentLen: Int, mode: ElemMode)
    syntax ElemMode ::= #elemActive(table: Int, offset: Instrs)                           [symbol(aElemActive)]
                      | "#elemPassive"        [symbol(aElemPassive)]
                      | "#elemDeclarative"    [symbol(aElemDeclarative)]

    syntax Alloc ::= allocelem(RefValType, ListRef, OptionalId)
 // -----------------------------------------------------
    rule [elem-active]:
        <instrs> #elem(TYPE:RefValType, INIT:ListRef, MODE:ElemMode, OID:OptionalId)
              => allocelem(TYPE, INIT, OID)
              ~> #elemAux(size(INIT), MODE)
                 ...
        </instrs>

    rule [elem-active-aux]:
        <instrs> #elemAux(LEN:Int, #elemActive(... table: TID, offset: OFFSET))
              => sequenceInstrs(OFFSET)
              ~> i32.const 0
              ~> i32.const LEN
              ~> #table.init(TID, IDX)
              ~> #elem.drop(IDX)
                 ...
        </instrs>
        <valstack> <i32> IDX : S => S </valstack>

    rule [elem-declarative-aux]:
        <instrs> #elemAux(_LEN:Int, #elemDeclarative)
              => #elem.drop(IDX)
                 ...
        </instrs>
        <valstack> <i32> IDX : S => S </valstack>

    rule [elem-passive-aux]:
        <instrs> #elemAux(_LEN:Int, #elemPassive)
              => .K ...
        </instrs>
        <valstack> <i32> _IDX : S => S </valstack>

    rule [allocelem]:
      <instrs> allocelem(TYPE, ELEMS, OID) => i32.const NEXTIDX ... </instrs>
      <curModIdx> CUR </curModIdx>
      <moduleInst>
        <modIdx> CUR </modIdx>
        <funcAddrs> FADDRS </funcAddrs>
        <elemAddrs> ADDRS => ADDRS [ NEXTIDX <- NEXTADDR ] </elemAddrs>
        <nextElemIdx> NEXTIDX => NEXTIDX +Int 1   </nextElemIdx>
        <elemIds>     IDS => #saveId(IDS, OID, 0) </elemIds>
        ...
      </moduleInst>
      <nextElemAddr> NEXTADDR => NEXTADDR +Int 1 </nextElemAddr>
      (.Bag => <elemInst>
                  <eAddr>  NEXTADDR </eAddr>
                  <eType>  TYPE     </eType>
                  <eValue> resolveAddrs(FADDRS, ELEMS) </eValue>
                </elemInst>)

    syntax ListRef ::= resolveAddrs(ListInt, ListRef)  [function]
 // -----------------------------------------------------------
    rule resolveAddrs(_, .ListRef) => .ListRef
    rule resolveAddrs(FADDRS, ListItem(<TYP> I) IS)
      => ListItem(<TYP> FADDRS {{ I }} orDefault -1) resolveAddrs(FADDRS, IS)
    rule resolveAddrs(FADDRS, ListItem(<TYP> null) IS)
      => ListItem(<TYP> null)                        resolveAddrs(FADDRS, IS)

```

Data Segments
-------------

Memories can be initialized with data, specified as a list of bytes together with an offset.
The `data` initializer simply puts these bytes into the specified memory, starting at the offset.

```k
    syntax DataDefn ::= #data(index : Int, offset : Instrs, data : Bytes) [symbol(aDataDefn)]
                      | "data" "{" Int Bytes "}"
 // --------------------------------------------
    // Default to memory 0.
    rule <instrs> #data(IDX, IS, DATA) => sequenceInstrs(IS) ~> data { IDX DATA } ... </instrs>

    rule <instrs> data { 0 DSBYTES } => trap ... </instrs>
         <valstack> < i32 > OFFSET : _STACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS </mems>
      requires ADDR <Int size(MEMS)
       andBool (#let memInst(_, SIZE, _) = MEMS[ADDR] #in OFFSET +Int lengthBytes(DSBYTES) >Int SIZE *Int #pageSize())

    // For now, deal only with memory 0.
    rule <instrs> data { 0 DSBYTES } => .K ... </instrs>
         <valstack> < i32 > OFFSET : STACK => STACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> ListItem(ADDR) </memAddrs>
           ...
         </moduleInst>
         <mems> MEMS => #let memInst(MAX, SIZE, DATA) = MEMS[ADDR] #in MEMS [ ADDR <- memInst(MAX, SIZE, #setRange(DATA, OFFSET, Bytes2Int(DSBYTES, LE, Unsigned), lengthBytes(DSBYTES))) ] </mems>
      requires ADDR <Int size(MEMS)
      [owise]

    syntax Int ::= Int "up/Int" Int [function]
 // ------------------------------------------
    rule I1 up/Int I2 => (I1 +Int (I2 -Int 1)) /Int I2 requires I2 >Int 0
```

Start Function
--------------

The `start` component of a module declares the function index of a `start function` that is automatically invoked when the module is instantiated, after `tables` and `memories` have been initialized.

```k
    syntax StartDefn ::= #start(Int) [symbol(aStartDefn)]
 // -------------------------------------------------------------
    rule <instrs> #start(IDX) => ( invoke FUNCADDRS {{ IDX }} orDefault -1 ) ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcAddrs> FUNCADDRS </funcAddrs>
           ...
         </moduleInst>
        requires isListIndex(IDX, FUNCADDRS)
```

Export
------

Exports make functions, tables, memories and globals available for importing into other modules.

```k
    syntax ExportDefn ::= #export(name : WasmString, index : Int) [symbol(aExportDefn)]
    syntax Alloc ::= ExportDefn
 // ---------------------------
    rule <instrs> #export(ENAME, IDX) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <exports> EXPORTS => EXPORTS [ ENAME <- IDX ] </exports>
           ...
         </moduleInst>
```

Imports
-------

Imports need to describe the type of what is imported.
That an import is really a subtype of the declared import needs to be checked at instantiation time.
The value of a global gets copied when it is imported.

```k
    syntax ImportDefn ::= #import(mod : WasmString, name : WasmString, ImportDesc) [symbol(aImportDefn)]
                        | #importHelper(ImportDesc, importedAddr:Int) [symbol(aImportDefnHelper)]
    syntax ImportDesc ::= #funcDesc   (id: OptionalId, type: Int)                  [symbol(aFuncDesc)]
                        | #globalDesc (id: OptionalId, type: GlobalType)           [symbol(aGlobalDesc)]
                        | #tableDesc  (id: OptionalId, type: Limits)               [symbol(aTableDesc)]
                        | #memoryDesc (id: OptionalId, type: Limits)               [symbol(aMemoryDesc)]
    syntax Alloc      ::= ImportDefn
 // --------------------------------
    rule <instrs> #import(MOD, NAME, #funcDesc(...) #as FD ) => #importHelper(FD, FS2 {{ IDX }} orDefault -1) ... </instrs>
         <moduleRegistry> ... MOD |-> MODIDX ... </moduleRegistry>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <funcAddrs> FS2 </funcAddrs>
           <exports>   ... NAME |-> IDX ... </exports>
           ...
         </moduleInst>
      requires isListIndex(IDX, FS2)

    rule <instrs> #importHelper(#funcDesc(... type: TIDX), IMPORTEDADDR ) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <types> TYPES </types>
           <funcAddrs> FS => setExtend(FS, NEXT, IMPORTEDADDR, -1) </funcAddrs>
           <nextFuncIdx> NEXT => NEXT +Int 1 </nextFuncIdx>
           ...
         </moduleInst>
         <funcDef>
           <fAddr> IMPORTEDADDR </fAddr>
           <fType> FTYPE </fType>
           ...
         </funcDef>
      requires FTYPE ==K TYPES[TIDX]

    rule <instrs> #import(MOD, NAME, #tableDesc(... id: OID, type: LIM) ) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS => #saveId(IDS, OID, 0) </tabIds>
           <tabAddrs> TABADDRS => TABADDRS[NEXT <- ADDR] </tabAddrs>
           <nextTabIdx> NEXT => NEXT +Int 1 </nextTabIdx>
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
           <tdata> TDATA </tdata>
           ...
         </tabInst>
       requires #limitsMatchImport(size(TDATA), MAX, LIM)

    rule <instrs> #import(MOD, NAME, #memoryDesc(... id: OID, type: LIM) ) => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS => #saveId(IDS, OID, 0) </memIds>
           <memAddrs> .List => ListItem(ADDRS[#ContextLookup(IDS', TFIDX)]) </memAddrs>
           ...
         </moduleInst>
         <moduleRegistry> ... MOD |-> MODIDX ... </moduleRegistry>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <memIds> IDS' </memIds>
           <memAddrs> ADDRS </memAddrs>
           <exports>  ... NAME |-> TFIDX                        ... </exports>
           ...
         </moduleInst>
         <mems> MEMS </mems>
       requires #ContextLookup(IDS', TFIDX) <Int size(ADDRS)
         andBool {ADDRS[#ContextLookup(IDS', TFIDX)]}:>Int <Int size(MEMS)
         andBool (#let memInst(MAX, SIZE, _) = MEMS[{ADDRS[#ContextLookup(IDS', TFIDX)]}:>Int] #in #limitsMatchImport(SIZE, MAX, LIM))

    rule <instrs> #import(MOD, NAME, #globalDesc(... id: OID, type: MUT TYP) ) => .K ... </instrs>
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
           <gAddr>  ADDR </gAddr>
           <gValue> GVAL </gValue>
           <gMut>   MUT  </gMut>
         </globalInst>
      requires #typeMatches(TYP, GVAL)
```

Tables and memories have proper subtyping, unlike globals and functions where a type is only a subtype of itself.
Subtyping is determined by whether the limits of one table/memory fit in the limits of another.
The following function checks if the limits in the first parameter *match*, i.e. is a subtype of, the limits in the second.

```k
    syntax Bool ::= #limitsMatchImport(Int, OptionalInt, Limits) [function]
 // -----------------------------------------------------------------------
    rule #limitsMatchImport(L1,      _, #limitsMin(L2:Int )) => L1 >=Int L2
    rule #limitsMatchImport( _,   .Int, #limits( _:Int,  _)) => false
    rule #limitsMatchImport(L1, U1:Int, #limits(L2:Int, U2)) => L1 >=Int L2 andBool U1 <=Int U2
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
    syntax ModuleDecl ::= #module ( types: Defns, funcs: Defns, tables: Defns, mems: Defns, globals: Defns, elem: Defns, data: Defns, start: Defns, importDefns: Defns, exports: Defns, metadata: ModuleMetadata) [symbol(aModuleDecl)]
 // -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    syntax ModuleDecl ::= #emptyModule(OptionalId) [function, total]
 // ---------------------------------------------------------------------
    rule #emptyModule(OID) =>  #module (... types: .Defns, funcs: .Defns, tables: .Defns, mems: .Defns, globals: .Defns, elem: .Defns, data: .Defns, start: .Defns, importDefns: .Defns, exports: .Defns, metadata: #meta(... id: OID, funcIds: .Map, filename: .String))

    syntax ModuleMetadata ::= #meta(id: OptionalId, funcIds: Map, filename : OptionalString) [symbol(moduleMeta)]
    syntax OptionalString ::= ".String" [symbol(.String)] | String
 // ----------------------------------------------------------------------
```

A new module instance gets allocated.
Then, the surrounding `module` tag is discarded, and the definitions are executed, putting them into the module currently being defined.

```k
    rule [newModule]:
         <instrs> #module(... types: TS, funcs: FS, tables: TABS, mems: MS, globals: GS, elem: EL, data: DAT, start: S,  importDefns: IS, exports: ES,
                         metadata: #meta(... id: OID, funcIds: FIDS, filename: FILE))
               => sequenceDefns(TS)
               ~> sequenceDefns(IS)
               ~> sequenceDefns(FS)
               ~> sequenceDefns(GS)
               ~> sequenceDefns(MS)
               ~> sequenceDefns(TABS)
               ~> sequenceDefns(ES)
               ~> sequenceDefns(EL)
               ~> sequenceDefns(DAT)
               ~> sequenceDefns(S)
               ...
         </instrs>
         <curModIdx> _ => NEXT </curModIdx>
         <nextModuleIdx> NEXT => NEXT +Int 1 </nextModuleIdx>
         <moduleIds> IDS => #saveId(IDS, OID, NEXT) </moduleIds>
         <moduleInstances>
           ( .Bag
          => <moduleInst>
               <modIdx> NEXT </modIdx>
               <moduleMetadata>
                 <moduleFileName> FILE </moduleFileName>
                 <moduleId> OID </moduleId>
                 <funcIds> FIDS </funcIds>
                 ...
               </moduleMetadata>
               ...
             </moduleInst>
           )
           ...
         </moduleInstances>
```

After a module is instantiated, it should be saved somewhere.
How this is done is up to the embedder.

```k
endmodule
```
