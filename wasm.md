WebAssembly State and Semantics
===============================

```k
require "data.k"

module WASM
    imports WASM-DATA
```

Configuration
-------------

```k
    configuration
      <k> $PGM:Stmts </k>
      <deterministicMemoryGrowth> true </deterministicMemoryGrowth>
      <valstack> .ValStack </valstack>
      <curFrame>
        <locals> .Map </locals>
        <curModIdx> .K </curModIdx>
      </curFrame>
      <nextFreshId> 0 </nextFreshId>
      <moduleInstances>
        <moduleInst multiplicity="*" type="Map">
          <modIdx>        0    </modIdx>
          <typeIds>       .Map </typeIds>
          <funcIds>       .Map </funcIds>
          <tabIds>        .Map </tabIds>
          <memIds>        .Map </memIds>
          <globIds>       .Map </globIds>
          <nextTypeIdx>   0    </nextTypeIdx>
          <nextFuncIdx>   0    </nextFuncIdx>
          <nextGlobIdx>   0    </nextGlobIdx>
          <types>         .Map </types>
          <funcIndices>   .Map </funcIndices>
          <tabIndices>    .Map </tabIndices>
          <memIndices>    .Map </memIndices>
          <globalIndices> .Map </globalIndices>
          <exports>       .Map </exports>
        </moduleInst>
      </moduleInstances>
      <moduleIds> .Map </moduleIds>
      <nextModuleIdx> 0 </nextModuleIdx>
      <moduleRegistry> .Map </moduleRegistry>
      <mainStore>
        <nextFuncAddr> 0 </nextFuncAddr>
        <funcs>
          <funcDef multiplicity="*" type="Map">
            <fAddr>    0              </fAddr>
            <fCode>    .Instrs:Instrs </fCode>
            <fType>    .Type          </fType>
            <fLocal>   .Type          </fLocal>
            <fModInst> 0              </fModInst>
          </funcDef>
        </funcs>
        <nextTabAddr> 0 </nextTabAddr>
        <tabs>
          <tabInst multiplicity="*" type="Map">
            <tAddr>   0         </tAddr>
            <tmax>    .MaxBound </tmax>
            <tsize>   0         </tsize>
            <tdata>   .Map      </tdata>
          </tabInst>
        </tabs>
        <nextMemAddr> 0 </nextMemAddr>
        <mems>
          <memInst multiplicity="*" type="Map">
            <mAddr>   0         </mAddr>
            <mmax>    .MaxBound </mmax>
            <msize>   0         </msize>
            <mdata>   .Map      </mdata>
          </memInst>
        </mems>
        <nextGlobAddr> 0 </nextGlobAddr>
        <globals>
          <globalInst multiplicity="*" type="Map">
            <gAddr>  0         </gAddr>
            <gValue> undefined </gValue>
            <gMut>   .Mut      </gMut>
          </globalInst>
        </globals>
      </mainStore>
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

According to the WebAssembly semantics there are 3 categories of instructions.

-  Plain Instructions (`PlainInstr`): Most instructions are plain instructions. They could be wrapped in parentheses and optionally includes nested folded instructions to indicate its operands.
-  Structured control instructions (`BlockInstr`): Structured control instructions are used to control the program flow. They can be annotated with a symbolic label identifier.
-  Folded Instructions (`FoldedInstr`): Folded Instructions describes the rules of desugaring plain instructions and block instructions.

Also in our definition, there are some helper instructions not directly used in programs but will help us define the rules, they are directly subsorted into `Instr`.

```k
    syntax Instr ::= PlainInstr | BlockInstr | FoldedInstr
 // ------------------------------------------------------

    syntax FoldedInstr ::= "(" PlainInstr Instrs ")"
                         | "(" PlainInstr        ")" [prefer]
 // ---------------------------------------------------------
    rule <k> ( PI:PlainInstr IS:Instrs ):FoldedInstr => IS ~> PI ... </k>
    rule <k> ( PI:PlainInstr           ):FoldedInstr =>       PI ... </k>
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

```k
    syntax PlainInstr ::= IValType "." "const" Int
                        | FValType "." "const" Float
 // ------------------------------------------------
    rule <k> ITYPE:IValType . const VAL => #chop(< ITYPE > VAL) ... </k>
    rule <k> FTYPE:FValType . const VAL => < FTYPE > VAL        ... </k>
```

### Text Format Conventions

The text format allows the use of symbolic `identifiers` in place of `indices`.
To resolve these `identifiers` into concrete `indices`, some grammar production are indexed by an identifier context `I` as a synthesized attribute that records the declared identifiers in each index space. We call this operation `ICov`.

```k
    syntax Int ::= #ContextLookup ( Map , TextFormatIdx ) [function]
 // ----------------------------------------------------------------
    rule #ContextLookup(IDS:Map, I:Int) => I
    rule #ContextLookup(IDS:Map, ID:Identifier) => {IDS [ ID ]}:>Int
```

### Unary Operators

When a unary operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.
An `*UnOp` operator always produces a result of the same type as its operand.

```k
    syntax PlainInstr ::= IValType "." IUnOp
                        | FValType "." FUnOp
 // ----------------------------------------

    syntax Instr ::= IValType "." IUnOp Int
                   | IValType "." IUnOp Float
 // -----------------------------------------
    rule <k> ITYPE . UOP:IUnOp => ITYPE . UOP C1 ... </k>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>

    rule <k> FTYPE . UOP:FUnOp => ITYPE . UOP C1 ... </k>
         <valstack> < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Binary Operators

When a binary operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.
A `*BinOp` operator always produces a result of the same type as its operands.

```k
    syntax PlainInstr ::= IValType "." IBinOp
                        | FValType "." FBinOp
 // -----------------------------------------

    syntax Instr ::= IValType "." IBinOp Int   Int
                   | FValType "." FBinOp Float Float
 // ------------------------------------------------
    rule <k> ITYPE . BOP:IBinOp => ITYPE . BOP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>

    rule <k> FTYPE . BOP:FBinOp => FTYPE . BOP C1 C2 ... </k>
         <valstack> < FTYPE > C2 : < FTYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Test Operations

When a test operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.
Test operations consume one operand and produce a bool, which is an `i32` value.

```k
    syntax PlainInstr ::= IValType "." ITestOp
 //                     | FValType "." FTestOp
 // ------------------------------------------

    syntax Instr ::= IValType "." ITestOp Int
 //                | FValType "." FTestOp Float
 // -------------------------------------------
    rule <k> ITYPE . TOP:ITestOp => ITYPE . TOP C1 ... </k>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Comparison Operations

When a comparison operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.
Comparisons consume two operands and produce a bool, which is an `i32` value.

```k
    syntax PlainInstr ::= IValType "." IRelOp
 //                     | FValType "." FRelOp
 // -----------------------------------------

    syntax Instr ::= IValType "." IRelOp Int   Int
 //                | FValType "." FRelOp Float Float
 // ------------------------------------------------
    rule <k> ITYPE . ROP:IRelOp => ITYPE . ROP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK  </valstack>
```

### Conversion Operations

Conversion operators always take a single argument as input and cast it to another type.
For each element added to `ConvOp`, functions `#convSourceType` and `#convOp` must be defined over it.

These operators convert constant elements at the top of the stack to another type.
The target type is before the `.`, and the source type is after the `_`.

```k
    syntax PlainInstr ::= IValType "." ConvOp
 //                     | FValType "." ConvOp
 // -----------------------------------------

    syntax Instr ::= IValType "." ConvOp Int
 //                | FValType "." ConvOp Float
 // ------------------------------------------
    rule <k> ITYPE . CONVOP:ConvOp => ITYPE . CONVOP C1  ... </k>
         <valstack> < SRCTYPE > C1 : VALSTACK => VALSTACK </valstack>
      requires #convSourceType(CONVOP) ==K SRCTYPE

    syntax IValType ::= #convSourceType ( ConvOp ) [function]
 // ---------------------------------------------------------
```

### Integer Arithmetic

`add`, `sub`, and `mul` are given semantics by lifting the correct K operators through the `#chop` function.

```k
    syntax IBinOp ::= "add" | "sub" | "mul"
 // ---------------------------------------
    rule <k> ITYPE . add I1 I2 => #chop(< ITYPE > I1 +Int I2) ... </k>
    rule <k> ITYPE . sub I1 I2 => #chop(< ITYPE > I1 -Int I2) ... </k>
    rule <k> ITYPE . mul I1 I2 => #chop(< ITYPE > I1 *Int I2) ... </k>
```

`div_*` and `rem_*` have extra side-conditions about when they are defined or not.
Note that we do not need to call `#chop` on the results here.

```k
    syntax IBinOp ::= "div_u" | "rem_u"
 // -----------------------------------
    rule <k> ITYPE . div_u I1 I2 => < ITYPE > I1 /Int I2 ... </k> requires I2 =/=Int 0
    rule <k> ITYPE . div_u I1 I2 => undefined            ... </k> requires I2  ==Int 0

    rule <k> ITYPE . rem_u I1 I2 => < ITYPE > I1 %Int I2 ... </k> requires I2 =/=Int 0
    rule <k> ITYPE . rem_u I1 I2 => undefined            ... </k> requires I2  ==Int 0

    syntax IBinOp ::= "div_s" | "rem_s"
 // -----------------------------------
    rule <k> ITYPE . div_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2)) ... </k>
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) =/=Int #pow1(ITYPE)

    rule <k> ITYPE . div_s I1 I2 => undefined ... </k>
      requires I2 ==Int 0

    rule <k> ITYPE . div_s I1 I2 => undefined ... </k>
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) ==Int #pow1(ITYPE)

    rule <k> ITYPE . rem_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2)) ... </k>
      requires I2 =/=Int 0

    rule <k> ITYPE . rem_s I1 I2 => undefined ... </k> requires I2 ==Int 0
```

### Floating Point Arithmetic

**TODO**: Unimplemented

```k
    syntax FUnOp ::= "neg" | "sqrt" | "floor" | "ceil" | "trunc" | "nearest" | "load"
 // ---------------------------------------------------------------------------------

    syntax FBinOp ::= "add" | "sub" | "mul" | "div" | "min" | "max" | "store"
 // -------------------------------------------------------------------------
```

### Predicates

`eqz` checks wether its operand is 0.

```k
    syntax ITestOp ::= "eqz"
 // ------------------------
    rule <k> _ . eqz I => < i32 > #bool(I ==Int 0) ... </k>
```

The comparisons test for equality and different types of inequalities between numbers.

```k
    syntax IRelOp ::= "eq" | "ne"
 // -----------------------------
    rule <k> _ . eq I1 I2 => < i32 > #bool(I1 ==Int   I2) ... </k>
    rule <k> _ . ne I1 I2 => < i32 > #bool(I1 =/=Int  I2) ... </k>

    syntax IRelOp ::= "lt_u" | "gt_u" | "lt_s" | "gt_s"
 // ---------------------------------------------------
    rule <k> _     . lt_u I1 I2 => < i32 > #bool(I1 <Int I2) ... </k>
    rule <k> _     . gt_u I1 I2 => < i32 > #bool(I1 >Int I2) ... </k>

    rule <k> ITYPE . lt_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) <Int #signed(ITYPE, I2)) ... </k>
    rule <k> ITYPE . gt_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) >Int #signed(ITYPE, I2)) ... </k>

    syntax IRelOp ::= "le_u" | "ge_u" | "le_s" | "ge_s"
 // ---------------------------------------------------
    rule <k> _     . le_u I1 I2 => < i32 > #bool(I1 <=Int I2) ... </k>
    rule <k> _     . ge_u I1 I2 => < i32 > #bool(I1 >=Int I2) ... </k>

    rule <k> ITYPE . le_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) <=Int #signed(ITYPE, I2)) ... </k>
    rule <k> ITYPE . ge_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) >=Int #signed(ITYPE, I2)) ... </k>
```

Bitwise Operations
------------------

Of the bitwise operators, `and` will not overflow, but `or` and `xor` could.
These simply are the lifted K operators.

```k
    syntax IBinOp ::= "and" | "or" | "xor"
 // --------------------------------------
    rule <k> ITYPE . and I1 I2 =>       < ITYPE > I1 &Int   I2  ... </k>
    rule <k> ITYPE . or  I1 I2 => #chop(< ITYPE > I1 |Int   I2) ... </k>
    rule <k> ITYPE . xor I1 I2 => #chop(< ITYPE > I1 xorInt I2) ... </k>
```

Similarly, K bitwise shift operators are lifted for `shl` and `shr_u`.
Careful attention is made for the signed version `shr_s`.

```k
    syntax IBinOp ::= "shl" | "shr_u" | "shr_s"
 // -------------------------------------------
    rule <k> ITYPE . shl   I1 I2 => #chop(< ITYPE > I1 <<Int (I2 %Int #width(ITYPE))) ... </k>
    rule <k> ITYPE . shr_u I1 I2 =>       < ITYPE > I1 >>Int (I2 %Int #width(ITYPE))  ... </k>

    rule <k> ITYPE . shr_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) >>Int (I2 %Int #width(ITYPE))) ... </k>
```

The rotation operators `rotl` and `rotr` do not have appropriate K builtins, and so are built with a series of shifts.

```k
    syntax IBinOp ::= "rotl" | "rotr"
 // ---------------------------------
    rule <k> ITYPE . rotl I1 I2 => #chop(< ITYPE > (I1 <<Int (I2 %Int #width(ITYPE))) +Int (I1 >>Int (#width(ITYPE) -Int (I2 %Int #width(ITYPE))))) ... </k>
    rule <k> ITYPE . rotr I1 I2 => #chop(< ITYPE > (I1 >>Int (I2 %Int #width(ITYPE))) +Int (I1 <<Int (#width(ITYPE) -Int (I2 %Int #width(ITYPE))))) ... </k>
```

The bit counting operators also lack appropriate K builtins, and are implemented by using width-agnostic helper functions.

`clz` counts the number of leading zero-bits, with 0 having all leading zero-bits.
`ctz` counts the number of trailing zero-bits, with 0 having all trailing zero-bits.
`popcnt` counts the number of non-zero bits.

Note: The actual `ctz` operator considers the integer 0 to have *all* zero-bits, whereas the `#ctz` helper function considers it to have *no* zero-bits, in order for it to be width-agnostic.

```k
    syntax IUnOp ::= "clz" | "ctz" | "popcnt"
 // -----------------------------------------
    rule <k> ITYPE . clz    I1 => < ITYPE > #width(ITYPE) -Int #minWidth(I1)                      ... </k>
    rule <k> ITYPE . ctz    I1 => < ITYPE > #if I1 ==Int 0 #then #width(ITYPE) #else #ctz(I1) #fi ... </k>
    rule <k> ITYPE . popcnt I1 => < ITYPE > #popcnt(I1)                                           ... </k>

    syntax Int ::= #minWidth ( Int ) [function]
                 | #ctz      ( Int ) [function]
                 | #popcnt   ( Int ) [function]
 // -------------------------------------------
    rule #minWidth(0) => 0
    rule #minWidth(N) => 1 +Int #minWidth(N >>Int 1)                                 requires N =/=Int 0

    rule #ctz(0) => 0
    rule #ctz(N) => #if N modInt 2 ==Int 1 #then 0 #else 1 +Int #ctz(N >>Int 1) #fi  requires N =/=Int 0

    rule #popcnt(0) => 0
    rule #popcnt(N) => #bool(N modInt 2 ==Int 1) +Int #popcnt(N >>Int 1)             requires N =/=Int 0
```

Conversions
-----------

Wrapping cuts of the 32 most significant bits of an `i64` value.

```k
    syntax ConvOp ::= "wrap_i64"
 // ----------------------------
    rule <k> i32 . wrap_i64 I => #chop(< i32 > I) ... </k>

    rule #convSourceType(wrap_i64) => i64
```

Extension turns an `i32` type value into the corresponding `i64` type value.

```k
    syntax ConvOp ::= "extend_i32_u" | "extend_i32_s"
 // -------------------------------------------------
    rule <k> i64 . extend_i32_u I => < i64 > I                               ... </k>
    rule <k> i64 . extend_i32_s I => < i64 > #unsigned(i64, #signed(i32, I)) ... </k>

    rule #convSourceType(extend_i32_u) => i32
    rule #convSourceType(extend_i32_s) => i32
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
         <valstack> < i32 > C : < TYPE > V2:Number : < TYPE > V1:Number : VALSTACK
              => < TYPE > #if C =/=Int 0 #then V1 #else V2 #fi       : VALSTACK
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

```k
    syntax Label ::= "label" VecType "{" Instrs "}" ValStack
 // --------------------------------------------------------
    rule <k> label [ TYPES ] { _ } VALSTACK' => . ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>

    syntax FoldedInstr ::= "(" "block" TypeDecls Instrs ")"
    syntax BlockInstr  ::= "block" TypeDecls Instrs "end"
 // -----------------------------------------------------
    rule <k> ( block FDECLS:TypeDecls INSTRS:Instrs )
          => block FDECLS INSTRS end
         ...
         </k>

    rule <k> block FDECLS IS end => IS ~> label gatherTypes(result, FDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
```

The `br*` instructions search through the instruction stack (the `<k>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WebAssembly specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax PlainInstr ::= "br" Int
 // ------------------------------
    rule <k> br N ~> (SS:Stmts => .) ... </k>
    rule <k> br N ~> label [ TYPES ] { IS } VALSTACK' => IS ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>
      requires N ==Int 0
    rule <k> br N ~> L:Label => br N -Int 1 ... </k>
      requires N >Int 0

    syntax PlainInstr ::= "br_if" Int
 // ---------------------------------
    rule <k> br_if N => br N ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL =/=Int 0
    rule <k> br_if N => .    ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL  ==Int 0
```

Finally, we have the conditional and loop instructions.

```k
    syntax FoldedInstr ::= "(" "if" TypeDecls Instrs "(" "then" Instrs ")" ")"
                         | "(" "if" TypeDecls Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
    syntax BlockInstr  ::= "if" TypeDecls Instrs "else" Instrs "end"
                         | "if" TypeDecls Instrs               "end"
 // ----------------------------------------------------------------
    rule <k> ( if TDECLS C:Instrs ( then IS ) )              => C ~> ( if TDECLS IS else .Instrs end )  ... </k>
    rule <k> ( if TDECLS C:Instrs ( then IS ) ( else IS' ) ) => C ~> ( if TDECLS IS else IS'     end )  ... </k>

    rule <k> if TDECLS IS          end => if TDECLS IS else .Instrs end                                 ... </k>
    rule <k> if TDECLS IS else IS' end => IS  ~> label gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
       requires VAL =/=Int 0
    rule <k> if TDECLS IS else IS' end => IS' ~> label gatherTypes(result, TDECLS) { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
       requires VAL  ==Int 0

    syntax FoldedInstr ::=  "(" "loop" TypeDecls Instrs ")"
    syntax BlockInstr  ::= "loop" TypeDecls Instrs "end"
 // ----------------------------------------------------
    rule <k> ( loop TDECLS IS ) => loop TDECLS IS end ... </k>

    rule <k> loop TDECLS IS end => IS ~> label [ .ValTypes ] { loop TDECLS IS end } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
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

The `*_local` instructions are defined here.

```k
    syntax PlainInstr ::= "local.get" Int
                        | "local.set" Int
                        | "local.tee" Int
 //--------------------------------------
    rule <k> local.get INDEX => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> local.set INDEX => . ... </k>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>

    rule <k> local.tee INDEX => . ... </k>
         <valstack> VALUE : VALSTACK </valstack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>
```

### Globals

When globals are declared, they must also be given a constant initialization value.

**TODO**: Import and export.

```k
    syntax TextGlobalType ::= ValType | "(" "mut" ValType ")"
 // ---------------------------------------------------------

    syntax GlobalType ::= Mut ValType
                      | asGMut (TextGlobalType) [function]
 // ------------------------------------------------------
    rule asGMut ( (mut T:ValType ) ) => var   T
    rule asGMut (      T:ValType   ) => const T

    syntax Defn       ::= GlobalDefn
    syntax GlobalDefn ::= "(" "global" OptionalId TextGlobalType Instr ")"
                        |     "global" GlobalType
 // ---------------------------------------------
    rule <k> ( global ID:OptionalId TYP:TextGlobalType IS:Instr ) => IS ~> global asGMut(TYP) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS => #saveId(IDS, ID, NEXTIDX) </globIds>
           <nextGlobIdx> NEXTIDX                      </nextGlobIdx>
           ...
         </moduleInst>

    rule <k> global MUT:Mut TYP:ValType => . ... </k>
         <valstack> < TYP > VAL : STACK => STACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <nextGlobIdx>   NEXTIDX => NEXTIDX +Int 1                </nextGlobIdx>
           <globalIndices> GLOBS   => GLOBS [ NEXTIDX <- NEXTADDR ] </globalIndices>
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
    syntax PlainInstr ::= "global.get" TextFormatIdx
                        | "global.set" TextFormatIdx
 // ------------------------------------------------
    rule <k> global.get TFIDX => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS </globIds>
           <globalIndices> ... #ContextLookup(IDS , TFIDX) |-> GADDR ... </globalIndices>
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
           <globalIndices> ... #ContextLookup(IDS , TFIDX) |-> GADDR ... </globalIndices>
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

```k
    syntax TypeKeyWord ::= "param" | "result"
 // -----------------------------------------

    syntax TypeDecl  ::= "(" TypeDecl ")"     [bracket]
                       | TypeKeyWord ValTypes
    syntax TypeDecls ::= List{TypeDecl , ""} [klabel(listTypeDecl)]
 // ---------------------------------------------------------------

    syntax VecType ::=  gatherTypes ( TypeKeyWord , TypeDecls )            [function]
                     | #gatherTypes ( TypeKeyWord , TypeDecls , ValTypes ) [function]
 // ---------------------------------------------------------------------------------
    rule  gatherTypes(TKW , TDECLS:TypeDecls) => #gatherTypes(TKW, TDECLS, .ValTypes)

    rule #gatherTypes( _  , .TypeDecls                         , TYPES) => [ TYPES ]
    rule #gatherTypes(TKW , TKW':TypeKeyWord _:ValTypes TDECLS , TYPES) => #gatherTypes(TKW, TDECLS, TYPES) requires TKW =/=K TKW'
    rule #gatherTypes(TKW , TKW TYPES'                  TDECLS , TYPES)
      => #gatherTypes(TKW ,                             TDECLS , TYPES + TYPES')
```

### Type Use

A type use is a reference to a type definition.
It may optionally be augmented by explicit inlined parameter and result declarations.
A type use should start with `'(' 'type' x:typeidx ')'` followed by a group of inlined parameter or result declarations.

```k
    syntax TypeUse ::= TypeDecls
                     | "(type" TextFormatIdx ")"           [prefer]
                     | "(type" TextFormatIdx ")" TypeDecls
 // ------------------------------------------------------

    syntax FuncType ::= asFuncType ( TypeDecls )         [function, klabel(TypeDeclsAsFuncType)]
                      | asFuncType ( Map, Map, TypeUse ) [function, klabel(TypeUseAsFuncType)  ]
 // --------------------------------------------------------------------------------------------
    rule asFuncType(TDECLS:TypeDecls)                      => gatherTypes(param, TDECLS) -> gatherTypes(result, TDECLS)
    rule asFuncType(   _   ,   _  , TDECLS:TypeDecls)      => asFuncType(TDECLS)
    rule asFuncType(TYPEIDS, TYPES, (type TFIDX ))         => { TYPES [ #ContextLookup(TYPEIDS , TFIDX) ] }:>FuncType
    rule asFuncType(TYPEIDS, TYPES, (type TFIDX ) TDECLS ) => { TYPES [ #ContextLookup(TYPEIDS , TFIDX) ] }:>FuncType
      requires TYPES [ #ContextLookup(TYPEIDS , TFIDX) ] ==K asFuncType(TDECLS)
```

### Type Declaration

Type could be declared explicitly and could optionally bind with an identifier.

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
           <types> TYPES => TYPES [NEXTIDX <- asFuncType(TDECLS)] </types>
           ...
         </moduleInst>
```

Function Declaration and Invocation
-----------------------------------

### Function Export Definition

This section introduce how we expand the folded form of function export.
Currently, in the expanded form, the `export`s will come after the definition of function.

```k
    syntax FuncExport  ::= "(" "export" String ")"
    syntax FuncExports ::= List{FuncExport, ""} [klabel(listFuncExport)]
 // --------------------------------------------------------------------
```

### Function Local Declaration

```k
    syntax LocalDecl  ::= "(" LocalDecl ")"    [bracket]
                        | "local" ValTypes
    syntax LocalDecls ::= List{LocalDecl , ""} [klabel(listLocalDecl)]
 // ------------------------------------------------------------------

    syntax VecType ::=  asLocalType ( LocalDecls            ) [function]
                     | #asLocalType ( LocalDecls , ValTypes ) [function]
 // -------------------------------------------------------------------
    rule  asLocalType(LDECLS) => #asLocalType(LDECLS, .ValTypes)

    rule #asLocalType(.LocalDecls          , VTYPES) => [ VTYPES ]
    rule #asLocalType(local VTYPES' LDECLS , VTYPES) => #asLocalType(LDECLS , VTYPES + VTYPES')
```

### Function Implicit Type Declaration

It could also be declared implicitly when a `TypeUse` is a `TypeDecls`, in this case it will allocate a type when the type is not in the current module instance.

```k
    syntax Instr ::= #checkTypeUse ( TypeUse )
 // ------------------------------------------
    rule <k> #checkTypeUse ( TDECLS:TypeDecls )
       => #if   notBool asFuncType(TDECLS) in values(TYPES)
          #then (type (func TDECLS))
          #else .K
          #fi
         ...
         </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <types> TYPES </types>
           ...
         </moduleInst>
    rule <k> #checkTypeUse ( (type TFIDF) )        => . ... </k>
    rule <k> #checkTypeUse ( (type TFIDF) TDECLS ) => . ... </k>
```

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we allow for an "abstract" function declaration using syntax `func_::___`, and a more concrete one which allows arbitrary order of declaration of parameters, locals, and results.

```k
    syntax Defn     ::= FuncDefn
    syntax FuncDefn ::= "(" "func" OptionalId FuncExports TypeUse LocalDecls Instrs ")"
 // -----------------------------------------------------------------------------------
    rule <k> ( func FEXPO:FuncExports TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs )
          => ( func #freshId(NEXTID) FEXPO TUSE LDECLS INSTRS )
          ...
         </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( func FNAME:Identifier ( export ENAME ) FEXPO:FuncExports TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs )
          => ( export ENAME ( func FNAME ) )
          ~> ( func FNAME FEXPO TUSE LDECLS INSTRS )
          ...
         </k>

    rule <k> ( func FNAME:Identifier .FuncExports TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs ) => #checkTypeUse ( TUSE ) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> TYPEIDS </typeIds>
           <types>   TYPES   </types>
           <funcIds> IDS => #saveId(IDS, FNAME, NEXTIDX) </funcIds>
           <nextFuncIdx> NEXTIDX => NEXTIDX +Int 1 </nextFuncIdx>
           <funcIndices> INDICES => INDICES [ NEXTIDX <- NEXTADDR ] </funcIndices>
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
    syntax Frame ::= "frame" Int ValTypes ValStack Map
 // --------------------------------------------------
    rule <k> frame MODIDX' TRANGE VALSTACK' LOCAL' => . ... </k>
         <valstack> VALSTACK => #take(TRANGE, VALSTACK) ++ VALSTACK' </valstack>
         <locals> _ => LOCAL' </locals>
         <curModIdx> _ => MODIDX' </curModIdx>
```

When we invoke a function, the element on the top of the stack will become the last parameter of the function.
For example, when we call `(invoke "foo" (i64.const 100) (i64.const 43) (i32.const 22))`, `(i32.const 22)` will be on the top of `<valstack>`, but it will be the last parameter of this function invocation if this function takes 3 parameters.
That is, whenever we want to `#take` or `#drop` an array of `params`, we need to reverse the array of `params` to make the type of the last parameter matching with the type of the valur on the top of stack.
The `#take` function will return the parameter stack in the reversed order, then we need to reverse the stack again to get the actual parameter array we want.

```k
    syntax Instr ::= "(" "invoke" Int ")"
 // -------------------------------------
    rule <k> ( invoke FADDR )
          => init_locals #revs(#take(#revt(TDOMAIN), VALSTACK)) ++ #zero(TLOCALS)
          ~> INSTRS
          ~> frame MODIDX TRANGE #drop(#revt(TDOMAIN), VALSTACK) LOCAL
          ...
          </k>
         <valstack>  VALSTACK => .ValStack </valstack>
         <locals> LOCAL => .Map </locals>
         <curModIdx> MODIDX => MODIDX' </curModIdx>
         <funcDef>
           <fAddr>    FADDR                     </fAddr>
           <fCode>    INSTRS                    </fCode>
           <fType>    [ TDOMAIN ] -> [ TRANGE ] </fType>
           <fLocal>   [ TLOCALS ]               </fLocal>
           <fModInst> MODIDX'                   </fModInst>
         </funcDef>

    syntax PlainInstr ::= "return"
 // ------------------------------
    rule <k> return ~> (SS:Stmts => .)    ... </k>
    rule <k> return ~> (L:Label  => .)    ... </k>
    rule <k> (return => .) ~> FR:Frame    ... </k>
```

### Function Call

`call funcidx` and `call_indirect typeidx` are 2 control instructions that invokes a function in the current frame.

```k
    syntax PlainInstr ::= "call" TextFormatIdx
 // ------------------------------------------
    rule <k> call TFIDX => ( invoke FADDR:Int ) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcIds> IDS </funcIds>
           <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
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
           <tabIndices> 0 |-> ADDR </tabIndices>
           <funcIds> IDS </funcIds>
           <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
           ...
         </moduleInst>
         <tabInst>
           <tAddr> ADDR </tAddr>
           <tdata> ... IDX |-> TFIDX ... </tdata>
           ...
         </tabInst>
         <funcDef>
           <fAddr> FADDR </fAddr>
           <fType> FTYPE </fType>
           ...
         </funcDef> requires asFuncType(TYPEIDS, TYPES, TUSE) ==K FTYPE
```

### Export

Now it contains only Function exports. The exported functions should be able to called using `invoke String` by its assigned name.

```k
    syntax Defn       ::= ExportDefn
    syntax ExportDefn ::= "(" "export" String "(" Externval ")" ")"
 // ---------------------------------------------------------------
    rule <k> ( export ENAME ( func FUNCIDX ) ) => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <exports> EXPORTS => EXPORTS [ ENAME <- FUNCIDX ] </exports>
           ...
         </moduleInst>
```

Table
-----

When implementing a table, we first need to define the `TableElemType` type to define the type of elements inside a `tableinst`.
Currently there is only one possiblt value for it which is "funcref".

```k
    syntax TableElemType ::= "funcref"
 // ----------------------------------
```

The allocation of a new `tableinst`.
Currently at most one table may be defined or imported in a single module.
The only allowed `TableElemType` is "funcref", so we ignore this term in the reducted sort.

```k
    syntax Defn      ::= TableDefn
    syntax TableDefn ::= "(" "table"     OptionalId Limits TableElemType ")"
                       | "(" "table"     OptionalId        TableElemType "(" "elem" ElemSegment ")" ")"
                       |     "table" "{" OptionalId Int MaxBound "}"
 // ----------------------------------------------------------------
    rule <k> ( table ID:OptionalId MIN:Int         funcref ) => table { ID MIN .MaxBound } ... </k>
      requires MIN <=Int #maxTableSize()
    rule <k> ( table ID:OptionalId MIN:Int MAX:Int funcref ) => table { ID MIN MAX       } ... </k>
      requires MIN <=Int #maxTableSize()
       andBool MAX <=Int #maxTableSize()
    rule <k> ( table funcref ( elem ES ) ) => ( table #freshId(NEXTID) funcref (elem ES) ) ... </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>
    rule <k> ( table ID:Identifier funcref ( elem ES ) )
          =>  table { ID #lengthElemSegment(ES) #lengthElemSegment(ES) }
          ~> ( elem ID (i32.const 0) ES )
          ...
         </k>

    rule <k> table { _ _ _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIndices> MAP </tabIndices>
           ...
         </moduleInst>
       requires MAP =/=K .Map

    rule <k> table { ID MIN MAX } => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS => #saveId(IDS, ID, 0) </tabIds>
           <tabIndices> .Map => (0 |-> NEXTADDR) </tabIndices>
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

**TODO**: Allow instantiation with an identifier and inline export and import.

```k
    syntax Defn       ::= MemoryDefn
    syntax MemoryDefn ::= "(" "memory" OptionalId Limits                     ")"
                        | "(" "memory" OptionalId "(" "data" DataStrings ")" ")"
                        |     "memory" "{" OptionalId Int MaxBound "}"
 // ------------------------------------------------------------------
    rule <k> ( memory ID:OptionalId MIN:Int         ) => memory { ID MIN .MaxBound } ... </k>
      requires MIN <=Int #maxMemorySize()
    rule <k> ( memory ID:OptionalId MIN:Int MAX:Int ) => memory { ID MIN MAX       } ... </k>
      requires MIN <=Int #maxMemorySize()
       andBool MAX <=Int #maxMemorySize()
    rule <k> ( memory ( data DS ) ) => ( memory #freshId(NEXTID) (data DS) ) ... </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>
    rule <k> ( memory ID:Identifier ( data DS ) )
          =>  memory { ID #lengthDataPages(DS) #lengthDataPages(DS) }
          ~> ( data ID (i32.const 0) DS ) ... </k>
      requires #lengthDataPages(DS) <=Int #maxMemorySize()
       andBool isIdentifier(ID)

    rule <k> memory { _ _ _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> MAP </memIndices>
           ...
         </moduleInst>
      requires MAP =/=K .Map

    rule <k> memory { ID MIN MAX } => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS => #saveId(IDS, ID, 0) </memIds>
           <memIndices> .Map => (0 |-> NEXTADDR) </memIndices>
           ...
         </moduleInst>
         <nextMemAddr> NEXTADDR => NEXTADDR +Int 1 </nextMemAddr>
         <mems>
           ( .Bag
          => <memInst>
               <mAddr>   NEXTADDR </mAddr>
               <mmax>    MAX      </mmax>
               <msize>   MIN      </msize>
               <mdata>   .Map     </mdata>
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
 //                     | FValType  "." StoreOpM
 // --------------------------------------------

    syntax StoreOpM ::= StoreOp | StoreOp MemArg
 // --------------------------------------------
    rule <k> ITYPE . SOP:StoreOp               => ITYPE . SOP  IDX                          VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>
    rule <k> ITYPE . SOP:StoreOp MEMARG:MemArg => ITYPE . SOP (IDX +Int #getOffset(MEMARG)) VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>

    rule <k> store { WIDTH EA VAL } => . ... </k>
         <memIndices> 0 |-> ADDR </memIndices>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA => #clearRange(DATA, EA, EA +Int WIDTH) [EA := VAL ] </mdata>
           ...
         </memInst>
         requires (EA +Int WIDTH) <=Int (SIZE *Int #pageSize())

    rule <k> store { WIDTH  EA  _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> 0 |-> ADDR </memIndices>
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

```k
    syntax Instr ::= "load" "{" IValType Int Int Signedness"}"
 // ----------------------------------------------------------

    syntax PlainInstr ::= IValType "." LoadOpM
 //                     | FValType "." LoadOpM
                        | IValType "." LoadOp Int
 // ---------------------------------------------

    syntax Signedness ::= "Signed" | "Unsigned"
 // -------------------------------------------

    syntax LoadOpM ::= LoadOp | LoadOp MemArg
 // -----------------------------------------
    rule <k> ITYPE . LOP:LoadOp               => ITYPE . LOP  IDX                          ... </k>
         <valstack> < i32 > IDX : VALSTACK    => VALSTACK </valstack>
    rule <k> ITYPE . LOP:LoadOp MEMARG:MemArg => ITYPE . LOP (IDX +Int #getOffset(MEMARG)) ... </k>
         <valstack> < i32 > IDX : VALSTACK    => VALSTACK </valstack>

    rule <k> load { ITYPE WIDTH EA SIGN }
          => < ITYPE > #if SIGN ==K Signed
                           #then #signedWidth(WIDTH, #range(DATA, EA, WIDTH))
                           #else #range(DATA, EA, WIDTH)
                       #fi
         ...
         </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> 0 |-> ADDR </memIndices>
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
           <memIndices> 0 |-> ADDR </memIndices>
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
           <memIndices> 0 |-> ADDR </memIndices>
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

    rule <k> grow N => < i32 > #if #growthAllowed(SIZE +Int N, MAX) #then SIZE #else #unsigned(i32, -1) #fi ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> 0 |-> ADDR </memIndices>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <mmax>    MAX  </mmax>
           <msize>   SIZE => #if #growthAllowed(SIZE +Int N, MAX) #then SIZE +Int N #else SIZE #fi </msize>
           ...
         </memInst>

    rule <k> grow N => < i32 > #unsigned(i32, -1) </k>
         <deterministicMemoryGrowth> false </deterministicMemoryGrowth>

    syntax Bool ::= #growthAllowed(Int, MaxBound) [function]
 // --------------------------------------------------------
    rule #growthAllowed(SIZE, .MaxBound) => SIZE <=Int #maxMemorySize()
    rule #growthAllowed(SIZE, I:Int)     => #growthAllowed(SIZE, .MaxBound) andBool SIZE <=Int I
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

The `elem` and `data` initializers take an offset, which is an instruction.
This is not optional.
The offset can either be specified explicitly with the `offset` key word, or be a single instruction.

```k
    syntax Offset ::= "(" "offset" Instr ")"
                    | Instr
```

### Element Segments

Tables can be initialized with element and the element type is always `funcref".
The initialization of a table needs an offset and a list of function indices.
A table index is optional and will be default to zero.

```k
    syntax Defn     ::= ElemDefn
    syntax ElemDefn ::= "(" "elem"     TextFormatIdx Offset ElemSegment ")"
                      | "(" "elem"                   Offset ElemSegment ")"
                      |     "elem" "{" TextFormatIdx        ElemSegment "}"
    syntax Stmt     ::= #initElements ( Int, Int, ElemSegment )
 // -----------------------------------------------------------
    // Default to table with index 0.
    rule <k> ( elem        OFFSET      ELEMSEGMENT ) =>     ( elem 0 OFFSET ELEMSEGMENT ) ... </k>
    rule <k> ( elem TABIDX IS:Instr    ELEMSEGMENT ) => IS ~> elem { TABIDX ELEMSEGMENT } ... </k>
    rule <k> ( elem TABIDX (offset IS) ELEMSEGMENT ) => IS ~> elem { TABIDX ELEMSEGMENT } ... </k>

    rule <k> elem { TABIDX ELEMSEGMENT } => #initElements ( ADDR, OFFSET, ELEMSEGMENT ) ... </k>
         <curModIdx> CUR </curModIdx>
         <valstack> < i32 > OFFSET : STACK => STACK </valstack>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS </tabIds>
           <tabIndices> #ContextLookup(IDS, TABIDX) |-> ADDR </tabIndices>
           ...
         </moduleInst>

    rule <k> #initElements ( ADDR, OFFSET, .ElemSegment ) => . ... </k>
    rule <k> #initElements ( ADDR, OFFSET,  E ES        ) => #initElements ( ADDR, OFFSET +Int 1, ES ) ... </k>
         <tabInst>
           <tAddr> ADDR </tAddr>
           <tdata> DATA => DATA [ OFFSET <- E ] </tdata>
           ...
         </tabInst>
```

### Data Segments

Memories can be initialized with data, specified as a list of bytes together with an offset.
The `data` initializer simply puts these bytes into the specified memory, starting at the offset.

```k
    syntax Defn     ::= DataDefn
    syntax DataDefn ::= "(" "data"     TextFormatIdx Offset DataStrings ")"
                      | "(" "data"                   Offset DataStrings ")"
                      |     "data" "{" TextFormatIdx        DataStrings "}"
 // -----------------------------------------------------------------------
    // Default to memory 0.
    rule <k> ( data       OFFSET      STRINGS ) =>     ( data 0 OFFSET STRINGS ) ... </k>
    rule <k> ( data MEMID IS:Instr    STRINGS ) => IS ~> data { MEMID  STRINGS } ... </k>
    rule <k> ( data MEMID (offset IS) STRINGS ) => IS ~> data { MEMID  STRINGS } ... </k>

    // For now, deal only with memory 0.
    rule <k> data { MEMIDX STRING } => . ... </k>
         <valstack> < i32 > OFFSET : STACK => STACK </valstack>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS </memIds>
           <memIndices> #ContextLookup(IDS, MEMIDX) |-> ADDR </memIndices>
           ...
         </moduleInst>
         <memInst>
           <mAddr> ADDR </mAddr>
           <mdata> DATA
                  => #clearRange(DATA, OFFSET, OFFSET +Int #dataStringsLength(STRING)) [ OFFSET := #dataStrings2int(STRING)]
           </mdata>
           ...
         </memInst>

    syntax Int ::= #lengthDataPages ( DataStrings ) [function]
 // ----------------------------------------------------------
    rule #lengthDataPages(DS:DataStrings) => #dataStringsLength(DS) up/Int #pageSize()

    syntax Int ::= Int "up/Int" Int [function]
 // ------------------------------------------
    rule I1 up/Int I2 => (I1 +Int (I2 -Int 1)) /Int I2 requires I2 >Int 0
```

Start Function
--------------

```k
    syntax Defn      ::= StartDefn
    syntax StartDefn ::= "(" "start" TextFormatIdx ")"
 // --------------------------------------------------
    rule <k> ( start TFIDX ) => ( invoke FADDR ) ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcIds> IDS </funcIds>
           <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
           ...
         </moduleInst>
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

`structureModule` takes a list of definitions and returns a map with different groups of definitions, preserving the order within each group.
The groups are chosen to represent different stages of allocation and instantiation.

```k
    syntax Map ::=  structureModule (     Defns) [function]
                 | #structureModule (Map, Defns) [function]
                 | #initialMap ()                [function]
 // -------------------------------------------------------
    rule #initialMap ()
      => "typeDecls" |-> .Defns
         "imports"   |-> .Defns
         "allocs"    |-> .Defns
         "exports"   |-> .Defns
         "inits"     |-> .Defns
         "start"     |-> .Defns

    rule structureModule(DS) => #structureModule(#initialMap (), #reverse(DS, .Defns))

    rule #structureModule(M,                  .Defns) => M
    rule #structureModule(M, (T:TypeDefn   DS:Defns)) => #structureModule(M ["typeDecls" <- (T {M ["typeDecls"]}:>Defns)], DS)

    // TODO.
 // rule #structureModule(M, (I:ImportDefn DS:Defns)) => #structureModule(M ["imports"   <- (I {M ["imports"  ]}:>Defns)], DS)

    rule #structureModule(M, (A:FuncDefn   DS:Defns)) => #structureModule(M ["allocs"    <- (A {M ["allocs"   ]}:>Defns)], DS)
    rule #structureModule(M, (A:TableDefn  DS:Defns)) => #structureModule(M ["allocs"    <- (A {M ["allocs"   ]}:>Defns)], DS)
    rule #structureModule(M, (A:MemoryDefn DS:Defns)) => #structureModule(M ["allocs"    <- (A {M ["allocs"   ]}:>Defns)], DS)
    rule #structureModule(M, (A:GlobalDefn DS:Defns)) => #structureModule(M ["allocs"    <- (A {M ["allocs"   ]}:>Defns)], DS)

    rule #structureModule(M, (E:ExportDefn DS:Defns)) => #structureModule(M ["exports"   <- (E {M ["exports"  ]}:>Defns)], DS)

    rule #structureModule(M, (I:DataDefn   DS:Defns)) => #structureModule(M ["inits"     <- (I {M ["inits"    ]}:>Defns)], DS)
    rule #structureModule(M, (I:ElemDefn   DS:Defns)) => #structureModule(M ["inits"     <- (I {M ["inits"    ]}:>Defns)], DS)

    rule #structureModule(M, (S:StartDefn  DS:Defns)) => #structureModule(M ["start"     <- (S .Defns)],                   DS)

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
    rule <k> ( module OID:OptionalId DEFNS ) => module OID structureModule(DEFNS) ... </k>

    rule <k> module OID:OptionalId MOD
          => MOD["typeDecls"]
          ~> MOD["imports"  ]
          ~> MOD["allocs"   ]
          ~> MOD["exports"  ]
          ~> MOD["inits"    ]
          ~> MOD["start"    ]
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
         <curModIdx> .K </curModIdx>
```

After a module is instantiated, it should be saved somewhere.
How this is done is up to the embedder.

```k
endmodule
```
