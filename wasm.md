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
      </curFrame>
      <nextFreshId> 0 </nextFreshId>
      <moduleInst>
        <typeIds>       .Map </typeIds>
        <funcIds>       .Map </funcIds> //this is mapping from identifier to index
        <nextTypeIdx>   0    </nextTypeIdx>
        <nextFuncIdx>   0    </nextFuncIdx>
        <nextGlobalIdx> 0    </nextGlobalIdx>
        <types>         .Map </types>
        <funcIndices>   .Map </funcIndices> //this is mapping from index to address
        <tabIndices>    .Map </tabIndices>
        <memIndices>    .Map </memIndices>
        <globalIndices> .Map </globalIndices>
        <exports>       .Map </exports>
      </moduleInst>
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

    syntax EmptyStmts ::= List{EmptyStmt, ""} [klabel(listStmt)]
    syntax Instrs     ::= List{Instr, ""}     [klabel(listStmt)]
    syntax Defns      ::= List{Defn , ""}     [klabel(listStmt)]
    syntax Stmts      ::= List{Stmt , ""}     [klabel(listStmt)]
 // ------------------------------------------------------------

    syntax Instrs ::= EmptyStmts
    syntax Defns  ::= EmptyStmts
    syntax Stmts  ::= Instrs | Defns
 // --------------------------------
    rule          <k> .Stmts          => .       ... </k>
    rule          <k> (S:Stmt .Stmts) => S       ... </k>
    rule [step] : <k> (S:Stmt SS)     => S ~> SS ... </k> requires SS =/=K .Stmts
```

### Traps

When a single value ends up on the instruction stack (the `<k>` cell), it is moved over to the value stack (the `<valstack>` cell).
If the value is the special `undefined`, then `trap` is generated instead.

```k
    syntax Instr ::= "trap"
 // -----------------------
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
    syntax Instr ::= "(" IValType "." "const" Int   ")"
                   | "(" FValType "." "const" Float ")"
 // ---------------------------------------------------
    rule <k> ( ITYPE:IValType . const VAL ) => #chop(< ITYPE > VAL) ... </k>
    rule <k> ( FTYPE:FValType . const VAL ) => < FTYPE > VAL        ... </k>
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
A `UnOp` operator always produces a result of the same type as its operand.

```k
    syntax UnOp ::= IUnOp
 //               | FUnOp
 // ---------------------

    syntax Instr ::= "(" IValType "." IUnOp ")" | "(" IValType "." IUnOp Instr ")" | IValType "." IUnOp Int
 //                | "(" FValType "." FUnOp ")" | "(" FValType "." FUnOp Instr ")" | FValType "." FUnOp Float
 // ---------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . UOP:IUnOp I:Instr ) => I ~> ( ITYPE . UOP ) ... </k>

    rule <k> ( ITYPE . UOP:IUnOp ) => ITYPE . UOP C1 ... </k>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Binary Operators

When a binary operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.
A `BinOp` operator always produces a result of the same type as its operands.

```k
    syntax BinOp ::= IBinOp
 //                | FBinOp
 // -----------------------

    syntax Instr ::= "(" IValType "." IBinOp ")" | "(" IValType "." IBinOp Instr Instr ")" | IValType "." IBinOp Int   Int
 //                | "(" FValType "." FBinOp ")" | "(" FValType "." FBinOp Instr Instr ")" | FValType "." FBinOp Float Float
 // ------------------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . BOP:IBinOp I:Instr I':Instr ) => I ~> I' ~> ( ITYPE . BOP ) ... </k>

    rule <k> ( ITYPE . BOP:IBinOp ) => ITYPE . BOP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Test Operations

When a test operator is the next instruction, the single argument is loaded from the `<valstack>` automatically.
Test operations consume one operand and produce a bool, which is an `i32` value.

```k
    syntax Instr ::= "(" IValType "." ITestOp ")" | "(" IValType "." ITestOp Instr ")" | IValType "." ITestOp Int
 // -------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . TOP:ITestOp I:Instr ) => I ~> ( ITYPE . TOP ) ... </k>

    rule <k> ( ITYPE . TOP:ITestOp ) => ITYPE . TOP C1 ... </k>
         <valstack> < ITYPE > C1 : VALSTACK => VALSTACK </valstack>
```

### Comparison Operations

When a comparison operator is the next instruction, the two arguments are loaded from the `<valstack>` automatically.
Comparisons consume two operands and produce a bool, which is an `i32` value.


```k
    syntax RelOp ::= IRelOp
 //                | FRelOp
 // -----------------------

    syntax Instr ::= "(" IValType "." IRelOp ")" | "(" IValType "." IRelOp Instr Instr ")" | IValType "." IRelOp Int   Int
 //                  "(" FValType "." FRelOp ")" | "(" IValType "." FRelOp Instr Instr ")" | IValType "." FRelOp Float Float
 // ------------------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . ROP:IRelOp I:Instr I':Instr ) => I ~> I' ~> ( ITYPE . ROP ) ... </k>

    rule <k> ( ITYPE . ROP:IRelOp ) => ITYPE . ROP C1 C2 ... </k>
         <valstack> < ITYPE > C2 : < ITYPE > C1 : VALSTACK => VALSTACK  </valstack>
```

### Conversion Operations

Conversion operators always take a single argument as input and cast it to another type.
For each element added to `ConvOp`, functions `#convSourceType` and `#convOp` must be defined over it.

These operators convert constant elements at the top of the stack to another type.
The target type is before the `.`, and the source type is after the `_`.

```k
    syntax Instr ::= "(" IValType "." ConvOp ")" | "(" IValType "." ConvOp Instr ")" | IValType "." ConvOp Int
 // ----------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . CONVOP:ConvOp I:Instr ) => I ~> ( ITYPE . CONVOP ) ... </k>

    rule <k> ( ITYPE . CONVOP:ConvOp ) => ITYPE . CONVOP C1  ... </k>
         <valstack> < SRCTYPE > C1 : VALSTACK => VALSTACK </valstack>
      requires #convSourceType(CONVOP) ==K SRCTYPE

    syntax IValType ::= #convSourceType ( ConvOp ) [function]
 // ---------------------------------------------------------
```

Numeric Operators
-----------------

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
    rule <k> ITYPE . div_s I1 I2
          => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2)) ... </k>
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) =/=Int #pow1(ITYPE)
    // Division by 0.
    rule <k> ITYPE . div_s I1 I2 => undefined ... </k>
      requires I2 ==Int 0
    // Division overflow.
    rule <k> ITYPE . div_s I1 I2 => undefined ... </k>
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) ==Int #pow1(ITYPE)

    rule <k> ITYPE . rem_s I1 I2
          => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2)) ... </k>
      requires I2 =/=Int 0
    rule <k> ITYPE . rem_s I1 I2 => undefined ... </k> requires I2 ==Int 0
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
    syntax Instr ::= "(" "drop" Instr ")"
                   | "(" "drop"       ")"
 // -------------------------------------
    rule <k> ( drop I ) => I ~> ( drop ) ... </k>

    rule <k> ( drop ) => . ... </k>
         <valstack> _ : VALSTACK => VALSTACK </valstack>

    syntax Instr ::= "(" "select" Instr Instr Instr ")"
                   | "(" "select"                   ")"
 // ---------------------------------------------------
    rule <k> ( select B1 B2 C ) => B1 ~> B2 ~> C ~> ( select ) ... </k>

    rule <k> ( select ) => . ... </k>
         <valstack> < i32 > C : < TYPE > V2:Number : < TYPE > V1:Number : VALSTACK
              => < TYPE > #if C =/=Int 0 #then V1 #else V2 #fi       : VALSTACK
         </valstack>
```

Structured Control Flow
-----------------------

`nop` does nothing.

```k
    syntax Instr ::= "nop"
 // ----------------------
    rule <k> nop => . ... </k>
```

`unreachable` causes an immediate `trap`.

```k
    syntax Instr ::= "(" "unreachable" ")"
 // --------------------------------------
    rule <k> ( unreachable ) => trap ... </k>
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

    syntax Instr ::= "(" "block" TypeDecls Instrs ")"
                   | "block" VecType Instrs "end"
 // ---------------------------------------------
    rule <k> ( block FDECLS:TypeDecls INSTRS:Instrs )
          => block gatherTypes(result, FDECLS) INSTRS end
         ...
         </k>

    rule <k> block VTYPE IS end => IS ~> label VTYPE { .Instrs } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
```

The `br*` instructions search through the instruction stack (the `<k>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WebAssembly specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax Instr ::= "(" "br" Int ")"
 // ---------------------------------
    rule <k> ( br N ) ~> (SS:Stmts => .) ... </k>
    rule <k> ( br N ) ~> label [ TYPES ] { IS } VALSTACK' => IS ... </k>
         <valstack> VALSTACK => #take(TYPES, VALSTACK) ++ VALSTACK' </valstack>
      requires N ==Int 0
    rule <k> ( br N ) ~> L:Label => ( br N -Int 1 ) ... </k>
      requires N >Int 0

    syntax Instr ::= "(" "br_if" Int Instr ")"
                   | "(" "br_if" Int       ")"
 // ------------------------------------------
    rule <k> ( br_if N I:Instr ) => I ~> ( br_if N ) ... </k>
    rule <k> ( br_if N ) => ( br N ) ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL =/=Int 0
    rule <k> ( br_if N ) => . ... </k>
         <valstack> < TYPE > VAL : VALSTACK => VALSTACK </valstack>
      requires VAL  ==Int 0
```

Finally, we have the conditional and loop instructions.

```k
    syntax Instr ::= "(" "if" VecType Instrs "else" Instrs "end" ")"
                   | "(" "if" VecType Instrs "(" "then" Instrs ")" ")"
                   | "(" "if" VecType Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
                   | "(" "if"         Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
 // ----------------------------------------------------------------------------------------
    rule <k> ( if VTYPE C:Instrs ( then IS ) )              => C ~> ( if VTYPE IS else .Instrs end ) ... </k>
    rule <k> ( if VTYPE C:Instrs ( then IS ) ( else IS' ) ) => C ~> ( if VTYPE IS else IS'     end ) ... </k>
    rule <k> ( if       C:Instrs ( then IS ) ( else IS' ) ) => C ~> ( if [ .ValTypes ] IS else IS' end ) ... </k>

    rule <k> ( if VTYPE IS else IS' end ) => IS  ~> label VTYPE { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
       requires VAL =/=Int 0
    rule <k> ( if VTYPE IS else IS' end ) => IS' ~> label VTYPE { .Instrs } VALSTACK ... </k>
         <valstack> < i32 > VAL : VALSTACK => VALSTACK </valstack>
       requires VAL  ==Int 0

    syntax Instr ::= "loop" VecType Instrs "end"
                   | "(" "loop" VecType Instrs ")"
 // ----------------------------------------------
    rule <k> ( loop FDECLS IS ) => loop FDECLS IS end ... </k>

    rule <k> loop VTYPE IS end => IS ~> label [ .ValTypes ] { loop VTYPE IS end } VALSTACK ... </k>
         <valstack> VALSTACK => .ValStack </valstack>
```

Memory Operators
----------------

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
    syntax Instr ::= "(" "local.get" Int ")"
                   | "(" "local.set" Int ")" | "(" "local.set" Int Instr ")"
                   | "(" "local.tee" Int ")" | "(" "local.tee" Int Instr ")"
 //-------------------------------------------------------------------------
    rule <k> ( local.get INDEX ) => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> ( local.set INDEX I) => I ~> ( local.set INDEX ) ... </k>
    rule <k> ( local.set INDEX ) => . ... </k>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>

    rule <k> ( local.tee INDEX I) => I ~> ( local.tee INDEX ) ... </k>
    rule <k> ( local.tee INDEX ) => . ... </k>
         <valstack> VALUE : VALSTACK </valstack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>
```

### Globals

```k
    syntax Instr ::= "(" "global.get" Int       ")"
                   | "(" "global.set" Int       ")"
                   | "(" "global.set" Int Instr ")"
 // -----------------------------------------------
    rule <k> ( global.get INDEX ) => . ... </k>
         <valstack> VALSTACK => VALUE : VALSTACK </valstack>
         <globalIndices> ... INDEX |-> GADDR ... </globalIndices>
         <globalInst>
           <gAddr>  GADDR </gAddr>
           <gValue> VALUE </gValue>
           ...
         </globalInst>

    rule <k> ( global.set INDEX ) => . ... </k>
         <valstack> VALUE : VALSTACK => VALSTACK </valstack>
         <globalIndices> ... INDEX |-> GADDR ... </globalIndices>
         <globalInst>
           <gAddr>  GADDR      </gAddr>
           <gValue> _ => VALUE </gValue>
           ...
         </globalInst>

    rule <k> ( global.set INDEX INSTR ) => INSTR ~> ( global.set INDEX ) ... </k>
```

Types
-----

### Type Gathering

This defines helper functions that gathers function together.

```k
    syntax TypeKeyWord  ::= "param" | "result"
 // ------------------------------------------

    syntax TypeDecl      ::= "(" TypeDecl ")"     [bracket]
                           | TypeKeyWord ValTypes
    syntax TypeDecls     ::= List{TypeDecl , ""} [klabel(listTypeDecl)]
 // -------------------------------------------------------------------

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
    syntax TypeDefn ::= "(type" "(" "func" TypeDecls ")" ")"
                      | "(type" Identifier "(" "func" TypeDecls ")" ")"
 // -------------------------------------------------------------------
    rule <k> (type (func TDECLS:TypeDecls)) => . ... </k>
         <nextTypeIdx> NEXTIDX => NEXTIDX +Int 1 </nextTypeIdx>
         <types>       TYPES   => TYPES [NEXTIDX <- asFuncType(TDECLS)]   </types>
    rule <k> (type ID:Identifier (func TDECLS:TypeDecls)) => . ... </k>
         <typeIds>     IDS     => IDS   [ ID <- NEXTIDX ]                 </typeIds>
         <nextTypeIdx> NEXTIDX => NEXTIDX +Int 1                          </nextTypeIdx>
         <types>       TYPES   => TYPES [ NEXTIDX <- asFuncType(TDECLS) ] </types>
```

Function Declaration and Invocation
-----------------------------------

### Function Export Definition

This section introduce how we expand the folded form of function export.
Currently, in the expanded form, the `export`s will come after the definition of function.

```k
    syntax FuncExport  ::= "(" "export" String ")"
    syntax FuncExports ::= List{FuncExport, ""} [klabel(listFuncExport)]
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
         <types> TYPES </types>
    rule <k> #checkTypeUse ( (type TFIDF) )        => . ... </k>
    rule <k> #checkTypeUse ( (type TFIDF) TDECLS ) => . ... </k>
```

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we allow for an "abstract" function declaration using syntax `func_::___`, and a more concrete one which allows arbitrary order of declaration of parameters, locals, and results.

```k
    syntax Defn     ::= FuncDefn
    syntax FuncDefn ::= "(" "func"            FuncExports TypeUse LocalDecls Instrs ")"
                      | "(" "func" Identifier FuncExports TypeUse LocalDecls Instrs ")"
 // -----------------------------------------------------------------------------------
    rule <k> ( func FEXPO:FuncExports TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs )
          => ( func #freshId(NEXTID) FEXPO TUSE LDECLS INSTRS ) ...
         </k>
         <nextFreshId> NEXTID => NEXTID +Int 1 </nextFreshId>

    rule <k> ( func FNAME:Identifier ( export ENAME ) FEXPO:FuncExports TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs )
          => ( export ENAME ( func FNAME ) )
          ~> ( func FNAME FEXPO TUSE LDECLS INSTRS )
          ...
         </k>

    rule <k> ( func FNAME:Identifier .FuncExports TUSE:TypeUse LDECLS:LocalDecls INSTRS:Instrs ) => #checkTypeUse ( TUSE ) ... </k>
         <typeIds> TYPEIDS </typeIds>
         <types>   TYPES   </types>
         <funcIds> IDS => IDS [ FNAME <- NEXTIDX ] </funcIds>
         <nextFuncIdx> NEXTIDX => NEXTIDX +Int 1 </nextFuncIdx>
         <funcIndices> INDICES => INDICES [ NEXTIDX <- NEXTADDR ] </funcIndices>
         <nextFuncAddr> NEXTADDR => NEXTADDR +Int 1 </nextFuncAddr>
         <funcs>
           ( .Bag
          => <funcDef>
               <fAddr>  NEXTADDR                             </fAddr>
               <fCode>  INSTRS                               </fCode>
               <fType>  asFuncType  ( TYPEIDS, TYPES, TUSE ) </fType>
               <fLocal> asLocalType ( LDECLS )               </fLocal>
               ...
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
    syntax Frame ::= "frame" ValTypes ValStack Map
 // ----------------------------------------------
    rule <k> frame TRANGE VALSTACK' LOCAL' => . ... </k>
         <valstack> VALSTACK => #take(TRANGE, VALSTACK) ++ VALSTACK' </valstack>
         <locals> _ => LOCAL' </locals>

    syntax Instr ::= "(" "invoke" Int ")"
 // -------------------------------------
    rule <k> ( invoke FADDR )
          => init_locals #take(TDOMAIN, VALSTACK) ++ #zero(TLOCALS)
          ~> INSTRS
          ~> frame TRANGE #drop(TDOMAIN, VALSTACK) LOCAL
          ...
          </k>
         <valstack>  VALSTACK => .ValStack </valstack>
         <curFrame>
           <locals> LOCAL => .Map </locals>
           ...
         </curFrame>
         <funcDef>
           <fAddr>  FADDR                     </fAddr>
           <fCode>  INSTRS                    </fCode>
           <fType>  [ TDOMAIN ] -> [ TRANGE ] </fType>
           <fLocal> [ TLOCALS ]               </fLocal>
           ...
         </funcDef>

    syntax Instr ::= "(" "return" ")"
 // ---------------------------------
    rule <k> (return) ~> (SS:Stmts => .)  ... </k>
    rule <k> (return) ~> (L:Label  => .)  ... </k>
    rule <k> ((return) => .) ~> FR:Frame ... </k>
```

### Function Call

`call funcidx` and `call_indirect typeidx` are 2 control instructions that invokes a function in the current frame.

```k
    syntax Instr ::= "(" "call" TextFormatIdx ")"
 // ---------------------------------------------
    rule <k> ( call TFIDX ) => ( invoke FADDR:Int ) ... </k>
         <funcIds> IDS </funcIds>
         <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
```

### Export

Now it contains only Function exports. The exported functions should be able to called using `invoke String` by its assigned name.

```k
    syntax Defn       ::= ExportDefn
    syntax ExportDefn ::= "(" "export" String "(" Externval ")" ")"
 // ---------------------------------------------------------------
    rule <k> ( export ENAME ( func FUNCIDX ) ) => . ... </k>
         <exports> EXPORTS => EXPORTS [ ENAME <- FUNCIDX ] </exports>
```

Table
-----

When implementing a table, we need a `FuncElem` type to define the type of elements inside a `tableinst`.

```k
    syntax FuncElem ::= ".FuncElem" | Int
 // -------------------------------------
```

The allocation of a new `tableinst`. Currently at most one table may be defined or imported in a single module.

```k
    syntax Defn      ::= TableDefn
    syntax TableDefn ::= "(" "table"                  ")"
                       | "(" "table"     Int          ")" // Size only
                       | "(" "table"     Int Int      ")" // Min and max.
                       |     "table" "{" Int MaxBound "}"
 // -----------------------------------------------------
    rule <k> ( table                 )       => table { 0   .MaxBound } ... </k>
    rule <k> ( table MIN:Int         ):Defn  => table { MIN .MaxBound } ... </k>
      requires MIN <=Int #maxTableSize()
    rule <k> ( table MIN:Int MAX:Int )       => table { MIN MAX       } ... </k>
      requires MIN <=Int #maxTableSize()
       andBool MAX <=Int #maxTableSize()

    rule <k> table { _ _ } => trap ... </k>
         <tabIndices> MAP </tabIndices> requires MAP =/=K .Map

    rule <k> table { MIN MAX } => . ... </k>
         <tabIndices> .Map => (0 |-> NEXTADDR) </tabIndices>
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
    syntax MemoryDefn ::= "(" "memory"                            ")"
                        | "(" "memory"     Int                    ")" // Size only
                        | "(" "memory"     Int Int                ")" // Min and max.
                        | "(" "memory" "(" "data" DataStrings ")" ")"
                        |     "memory" "{" Int MaxBound "}"
 // -------------------------------------------------------
    rule <k> ( memory                 ) => memory { 0   .MaxBound } ... </k>
    rule <k> ( memory MIN:Int         ) => memory { MIN .MaxBound } ... </k>
      requires MIN <=Int #maxMemorySize()
    rule <k> ( memory MIN:Int MAX:Int ) => memory { MIN MAX       } ... </k>
      requires MIN <=Int #maxMemorySize()
       andBool MAX <=Int #maxMemorySize()
    rule <k> ( memory ( data DS ) )
          =>  memory { #lengthDataPages(DS) #lengthDataPages(DS) }
          ~> ( data (i32.const 0) DS ) ... </k>
      requires #lengthDataPages(DS) <=Int #maxMemorySize()

    rule <k> memory { _ _ } => trap ... </k>
         <memIndices> MAP </memIndices> requires MAP =/=K .Map

    rule <k> memory { MIN MAX } => . ... </k>
         <memIndices> .Map => (0 |-> NEXTADDR) </memIndices>
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
    syntax Instr ::= "(" IValType "." StoreOpM Instr Instr ")" | "(" IValType  "." StoreOpM ")"
 //                | "(" FValType "." StoreOpM Instr Instr ")" | "(" FValType  "." StoreOpM ")"
                   | IValType "." StoreOp Int Int
 //                | FValType "." StoreOp Int Float
                   | "store" "{" Int Int Number "}"
    syntax StoreOpM ::= StoreOp | StoreOp MemArg
 // --------------------------------------------
    rule <k> ( ITYPE . SOPM:StoreOpM I:Instr I':Instr) => I ~> I' ~> ( ITYPE . SOPM ) ... </k>

    rule <k> ( ITYPE . SOP:StoreOp               ) => ITYPE . SOP  IDX                          VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>
    rule <k> ( ITYPE . SOP:StoreOp MEMARG:MemArg ) => ITYPE . SOP (IDX +Int #getOffset(MEMARG)) VAL ... </k>
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
         <memIndices> 0 |-> ADDR </memIndices>
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
    syntax Instr ::= "(" IValType  "." LoadOpM Instr ")" | "(" IValType  "." LoadOpM ")"
 //                | "(" FValType  "." LoadOpM Instr ")" | "(" FValType  "." LoadOpM ")"
                   | IValType "." LoadOp Int
                   | "load" "{" IValType Int Int Signedness"}"
    syntax LoadOpM ::= LoadOp | LoadOp MemArg
    syntax Signedness ::= "Signed" | "Unsigned"
 // -------------------------------------------
    rule <k> ( ITYPE . LOPM:LoadOpM I:Instr ) => I ~> ( ITYPE . LOPM ) ... </k>

    rule <k> ( ITYPE . LOP:LoadOp              ) => ITYPE . LOP  IDX                          ... </k>
         <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>
    rule <k> ( ITYPE . LOP:LoadOp MEMARG:MemArg) => ITYPE . LOP (IDX +Int #getOffset(MEMARG)) ... </k>
         <valstack> < i32 > IDX : VALSTACK => VALSTACK </valstack>

    rule <k> load { ITYPE WIDTH EA SIGN }
          => < ITYPE > #if SIGN ==K Signed
                           #then #signedWidth(WIDTH, #range(DATA, EA, WIDTH))
                           #else #range(DATA, EA, WIDTH)
                       #fi
         ...
         </k>
         <memIndices> 0 |-> ADDR </memIndices>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA </mdata>
           ...
         </memInst>
      requires (EA +Int WIDTH) <=Int (SIZE *Int #pageSize())

    rule <k> load { _ WIDTH EA _ } => trap ... </k>
         <memIndices> 0 |-> ADDR </memIndices>
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
    syntax Instr ::= "(" "memory.size" ")"
 // --------------------------------------
    rule <k> ( memory.size ) => < i32 > SIZE ... </k>
         <memIndices> 0 |-> ADDR </memIndices>
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
    syntax Instr ::= "(" "memory.grow" ")" | "(" "memory.grow" Instr ")" | "grow" Int
 // ---------------------------------------------------------------------------------
    rule <k> ( memory.grow I:Instr ) => I ~> ( memory.grow ) ... </k>
    rule <k> ( memory.grow ) => grow N ... </k>
         <valstack> < i32 > N : VALSTACK => VALSTACK </valstack>

    rule <k> grow N => < i32 > #if #growthAllowed(SIZE +Int N, MAX) #then SIZE #else #unsigned(i32, -1) #fi ... </k>
         <memIndices> 0 |-> ADDR </memIndices>
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

Memories can optionally have a max size which the memory may not grow beyond.

```k
    syntax MaxBound ::= Int | ".MaxBound"
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

### Data Segments

Memories can be initialized with data, specified as a list of bytes together with an offset.
The `data` initializer simply puts these bytes into the specified memory, starting at the offset.

```k
    syntax Defn  ::= DataDefn
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
         <memIndices> MEMIDX |-> ADDR </memIndices>
         <memInst>
           <mAddr> ADDR </mAddr>
           <mdata>   DATA
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
    syntax Instr ::= "(" "start" TextFormatIdx ")"
 // ----------------------------------------------
    rule <k> ( start TFIDX ) => ( invoke FADDR ) ... </k>
         <funcIds> IDS </funcIds>
         <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
```

Module Declaration
------------------

Currently, we support a single module.
The surronding `module` tag is discarded, and the inner portions are run like they are instructions.

```k
    syntax Stmt ::= "(" "module" Defns ")"
 // --------------------------------------
    rule <k> ( module DEFNS ) => DEFNS ... </k>
```

```k
endmodule
```
