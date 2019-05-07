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
      <k> $PGM:Instrs </k>
      <deterministicMemoryGrowth> true </deterministicMemoryGrowth>
      <stack> .Stack </stack>
      <curFrame>
        <addrs>  .Map </addrs>
        <locals> .Map </locals>
        <moduleInst>
          <globals>  .Map  </globals>
          <memAddrs> .Map  </memAddrs>
        </moduleInst>
      </curFrame>
      <mainStore>
        <funcs>
          <funcDef multiplicity="*" type="Map">
            <fname>  .FunctionName  </fname>
            <fcode>  .Instrs:Instrs </fcode>
            <ftype>  .Type          </ftype>
            <flocal> .Type          </flocal>
            <faddrs> .Map           </faddrs>
          </funcDef>
        </funcs>
        <nextMemAddr> 0 </nextMemAddr>
        <mems>
          <memInst multiplicity="*" type="Map">
            <memAddr> 0         </memAddr>
            <mmax>    .MemBound </mmax>
            <msize>   0         </msize>
            <mdata>   .Map      </mdata>
          </memInst>
        </mems>
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

WebAssembly instructions are space-separated lists of instructions.

```k
    syntax Instrs ::= List{Instr, ""} [klabel(listInstr)]
 // -----------------------------------------------------
    rule          <k> .Instrs           => .       ... </k>
    rule          <k> I:Instr .Instrs   => I       ... </k>
    rule [step] : <k> I:Instr IS:Instrs => I ~> IS ... </k> requires IS =/=K .List
```

### Traps

When a single value ends up on the instruction stack (the `<k>` cell), it is moved over to the value stack (the `<stack>` cell).
If the value is the special `undefined`, then `trap` is generated instead.

```k
    syntax Instr ::= "trap"
 // -----------------------
    rule <k> undefined => trap ... </k>
    rule <k> V:Val     => .    ... </k>
         <stack> STACK => V : STACK </stack>
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

### Unary Operators

When a unary operator is the next instruction, the single argument is loaded from the `<stack>` automatically.
A `UnOp` operator always produces a result of the same type as its operand.

```k
    syntax UnOp ::= IUnOp
 // ---------------------

    syntax Instr ::= "(" IValType "." IUnOp ")" | "(" IValType "." IUnOp Instr ")" | IValType "." IUnOp Int
 // ---------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . UOP:IUnOp I:Instr ) => I ~> ( ITYPE . UOP ) ... </k>

    rule <k> ( ITYPE . UOP:IUnOp ) => ITYPE . UOP C1 ... </k>
         <stack> < ITYPE > C1 : STACK => STACK </stack>
```

**TODO**: Unimplemented.

```k
    syntax UnOp ::= FUnOp
 // ---------------------

    syntax Instr ::= "(" FValType "." FUnOp ")" | "(" FValType "." FUnOp Instr ")" | FValType "." FUnOp Float
 // ---------------------------------------------------------------------------------------------------------
```

### Binary Operators

When a binary operator is the next instruction, the two arguments are loaded from the `<stack>` automatically.
A `BinOp` operator always produces a result of the same type as its operands.

```k
    syntax BinOp ::= IBinOp
 // -----------------------

    syntax Instr ::= "(" IValType "." IBinOp ")" | "(" IValType "." IBinOp Instr Instr ")" | IValType "." IBinOp Int   Int
 // ------------------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . BOP:IBinOp I:Instr I':Instr ) => I ~> I' ~> ( ITYPE . BOP ) ... </k>

    rule <k> ( ITYPE . BOP:IBinOp ) => ITYPE . BOP C1 C2 ... </k>
         <stack> < ITYPE > C2 : < ITYPE > C1 : STACK => STACK </stack>
```

**TODO**: Unimplemented.

```k
    syntax BinOp ::= FBinOp
 // -----------------------

    syntax Instr ::= "(" FValType "." FBinOp ")" | "(" FValType "." FBinOp Instr Instr ")" | FValType "." FBinOp Float Float
 // ------------------------------------------------------------------------------------------------------------------------
```

### Test Operations

When a test operator is the next instruction, the single argument is loaded from the `<stack>` automatically.
Test operations consume one operand and produce a bool, which is an `i32` value.

```k
    syntax Instr ::= "(" IValType "." ITestOp ")" | "(" IValType "." ITestOp Instr ")" | IValType "." ITestOp Int
 // -------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . TOP:ITestOp I:Instr ) => I ~> ( ITYPE . TOP ) ... </k>

    rule <k> ( ITYPE . TOP:ITestOp ) => ITYPE . TOP C1 ... </k>
         <stack> < ITYPE > C1 : STACK => STACK </stack>
```

### Comparison Operations

When a comparison operator is the next instruction, the two arguments are loaded from the `<stack>` automatically.
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
         <stack> < ITYPE > C2 : < ITYPE > C1 : STACK => STACK  </stack>
```

### Conversion Operations

Conversion operators always take a single argument as input and cast it to another type.
For each element added to `ConvOp`, functions `#convSourceType` and `#convOp` must be defined over it.

These operators convert constant elements at the top of the stack to another type.
The target type is before the `.`, and the source type is after the `_`.

```k
    syntax Instr ::= "(" ValType "." ConvOp ")" | "(" ValType "." ConvOp Instr ")" | ValType "." ConvOp Int
 // -------------------------------------------------------------------------------------------------------
    rule <k> ( TYPE . CONVOP:ConvOp I:Instr ) => I ~> ( TYPE . CONVOP ) ... </k>

    rule <k> ( TYPE . CONVOP:ConvOp ) => TYPE . CONVOP C1  ... </k>
         <stack> < SRCTYPE > C1 : STACK => STACK </stack>
      requires #convSourceType(CONVOP) ==K SRCTYPE

    syntax ValType ::= #convSourceType ( ConvOp ) [function]
 // --------------------------------------------------------
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
    rule <k> ITYPE . div_u I1 I2 => #if I2 =/=Int 0 #then < ITYPE > (I1 /Int I2) #else undefined #fi ... </k>
    rule <k> ITYPE . rem_u I1 I2 => #if I2 =/=Int 0 #then < ITYPE > (I1 %Int I2) #else undefined #fi ... </k>

    syntax IBinOp ::= "div_s" | "rem_s"
 // -----------------------------------
    rule <k> ITYPE . div_s I1 I2
          => #if I2 =/=Int 0 andBool (I1 =/=Int #pow1(ITYPE) orBool (I2 =/=Int #pow(ITYPE) -Int 1))
                #then < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2))
                #else undefined
             #fi
         ...
         </k>

    rule <k> ITYPE . rem_s I1 I2
          => #if I2 =/=Int 0
                #then < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2))
                #else undefined
             #fi
         ...
         </k>
```

### Floating Point Arithmetic

**TODO**: Unimplemented

```k
    syntax FUnOp ::= "neg" | "sqrt" | "floor" | "ceil" | "trunc" | "nearest" | "load"
 // ---------------------------------------------------------------------------------

    syntax FBinOp ::= "add" | "sub" | "mul" | "div" | "min" | "max" | "store"
                    | "lt" | "gt" | "le" | "ge" | "eq" | "ne"
 // ---------------------------------------------------------
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
    rule <k> _:IValType . eq I1 I2 => < i32 > #bool(I1 ==Int   I2) ... </k>
    rule <k> _:IValType . ne I1 I2 => < i32 > #bool(I1 =/=Int  I2) ... </k>

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

**TODO**: Unimplemented.

```k
    syntax ConvOp ::= "extend_i32_s" | "promote_f32" | "demote_f64"
                    | "trunc_f32_u"     | "trunc_f64_u"     | "trunc_f32_s"     | "trunc_f64_s"
                    | "convert_i64_u"   | "convert_i32_u"   | "convert_i64_s"   | "convert_i32_s"
                    | "reinterpret_i32" | "reinterpret_i64" | "reinterpret_f32" | "reinterpret_f64"
 // -----------------------------------------------------------------------------------------------
```

Stack Operations
----------------

Operator `drop` removes a single item from the `<stack>`.
The `select` operator picks one of the second or third stack values based on the first.

```k
    syntax Instr ::= "(" "drop" Instr ")"
                   | "(" "drop"       ")"
 // -------------------------------------
    rule <k> ( drop I ) => I ~> ( drop ) ... </k>

    rule <k> ( drop ) => . ... </k>
         <stack> _ : STACK => STACK </stack>

    syntax Instr ::= "(" "select" Instr Instr Instr ")"
                   | "(" "select"                   ")"
 // ---------------------------------------------------
    rule <k> ( select B1 B2 C ) => B1 ~> B2 ~> C ~> ( select ) ... </k>

    rule <k> ( select ) => . ... </k>
         <stack> < i32 > C : < TYPE > V2:Number : < TYPE > V1:Number : STACK
              => < TYPE > #if C =/=Int 0 #then V1 #else V2 #fi       : STACK
         </stack>
```

Structured Control Flow
-----------------------

`nop` does nothing.

```k
    syntax Instr ::= "(" "nop" ")"
 // ------------------------------
    rule <k> ( nop ) => . ... </k>
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
    syntax Label ::= "label" VecType "{" Instrs "}" Stack
 // -----------------------------------------------------
    rule <k> label [ TYPES ] { IS } STACK' => IS ... </k>
         <stack> STACK => #take(TYPES, STACK) ++ STACK' </stack>

    syntax Instr ::= "(" "block" FuncDecls Instrs ")"
                   | "block" VecType Instrs "end"
 // ---------------------------------------------
    rule <k> ( block FDECLS:FuncDecls INSTRS:Instrs )
          => block gatherTypes(result, FDECLS) INSTRS end
         ...
         </k>

    rule <k> block VTYPE IS end => IS ~> label VTYPE { .Instrs } STACK ... </k>
         <stack> STACK => .Stack </stack>
```

**TODO**: Unimplemented.

```k
    syntax Instr ::= "(" "block" VarIdentifier FuncDecls Instrs ")"
 // ---------------------------------------------------------------
```

The `br*` instructions search through the instruction stack (the `<k>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WebAssembly specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax Instr ::= "(" "br" Int ")" [prefer]
 // ------------------------------------------
    rule <k> ( br N ) ~> (IS:Instrs => .) ... </k>
    rule <k> ( br N ) ~> L:Label => #if N ==Int 0 #then L #else ( br N -Int 1 ) #fi ... </k>

    syntax Instr ::= "(" "br_if" Int ")" [prefer]
 // ---------------------------------------------
    rule <k> ( br_if N ) => #if VAL =/=Int 0 #then ( br N ) #else .K #fi ... </k>
         <stack> < TYPE > VAL : STACK => STACK </stack>
```

**TODO**: Unimplemented.

```k
    syntax VarIdentifiers ::= List{VarIdentifier, ""}
 // -------------------------------------------------

    syntax Instr ::= "(" "br"    VarIdentifier Instrs ")"
                   | "(" "br_if" VarIdentifier Instrs ")"
                   | "(" "br_table" VarIdentifiers Instrs ")"
 // ---------------------------------------------------------
```

Finally, we have the conditional and loop instructions.

```k
    syntax Instr ::= "(" "if" VecType Instrs "else" Instrs "end" ")"
                   | "(" "if" VecType Instrs "(" "then" Instrs ")" ")"
                   | "(" "if" VecType Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
 // ----------------------------------------------------------------------------------------
    rule <k> ( if VTYPE C:Instrs ( then IS ) )              => C ~> ( if VTYPE IS else .Instrs end ) ... </k>
    rule <k> ( if VTYPE C:Instrs ( then IS ) ( else IS' ) ) => C ~> ( if VTYPE IS else IS'     end ) ... </k>

    rule <k> ( if VTYPE IS else IS' end )
          => #if VAL =/=Int 0 #then IS #else IS' #fi
          ~> label VTYPE { .Instrs } STACK
         ...
         </k>
         <stack> < i32 > VAL : STACK => .Stack </stack>

    syntax Instr ::= "loop" VecType Instrs "end"
                   | "(" "loop" VecType Instrs ")"
 // ----------------------------------------------
    rule <k> ( loop FDECLS IS ) => loop FDECLS IS end ... </k>

    rule <k> loop VTYPE IS end => IS ~> label [ .ValTypes ] { loop VTYPE IS end } STACK ... </k>
         <stack> STACK => .Stack </stack>
```

**TODO**: Unimplemented.

```k
    syntax Instr ::= "(" "if"          Instrs "(" "then" Instrs ")" ")"
                   | "(" "if"          Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
                   | "(" "if" FuncDecl Instrs "(" "then" Instrs ")" ")"
                   | "(" "if" FuncDecl Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
 // -----------------------------------------------------------------------------------------

    syntax Instr ::= "(" "loop" Instrs          ")"
                   | "(" "loop" FuncDecl Instrs ")"
 // -----------------------------------------------
```

Memory Operators
----------------

### Locals

The various `init_local` variants assist in setting up the `locals` cell.

```k
    syntax Instr ::=  "init_local"  Int Val
                   |  "init_locals"     Stack
                   | "#init_locals" Int Stack
 // -----------------------------------------
    rule <k> init_local INDEX VALUE => . ... </k>
         <locals> LOCALS => LOCALS [ INDEX <- VALUE ] </locals>

    rule <k> init_locals VALUES => #init_locals 0 VALUES ... </k>

    rule <k> #init_locals _ .Stack => . ... </k>
    rule <k> #init_locals N (VALUE : STACK)
          => init_local N VALUE
          ~> #init_locals (N +Int 1) STACK
          ...
          </k>
```

The `*_local` instructions are defined here.

```k
    syntax Instr ::= "(" "local.get" VarIdentifier ")"
                   | "(" "local.set" VarIdentifier ")"
                   | "(" "local.tee" VarIdentifier ")"
 // --------------------------------------------------
    rule <k> ( local.get INDEX ) => . ... </k>
         <stack> STACK => VALUE : STACK </stack>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> ( local.set INDEX ) => . ... </k>
         <stack> VALUE : STACK => STACK </stack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>

    rule <k> ( local.tee INDEX ) => . ... </k>
         <stack> VALUE : STACK </stack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>
```

**TODO**: Unimplemented.

```k
    syntax Instr ::= "(" "local.get" VarIdentifier Instr ")"
                   | "(" "local.set" VarIdentifier Instr ")"
                   | "(" "local.tee" VarIdentifier Instr ")"
 // --------------------------------------------------------
```

### Globals

```k
    syntax Instr ::= "init_global" Int Val
                   | "(" "global.get" VarIdentifier ")"
                   | "(" "global.set" VarIdentifier ")"
 // ---------------------------------------------------
    rule <k> init_global INDEX VALUE => . ... </k>
         <globals> GLOBALS => GLOBALS [ INDEX <- VALUE ] </globals>

    rule <k> ( global.get INDEX ) => . ... </k>
         <stack> STACK => VALUE : STACK </stack>
         <globals> ... INDEX |-> VALUE ... </globals>

    rule <k> ( global.set INDEX ) => . ... </k>
         <stack> VALUE : STACK => STACK </stack>
         <globals> ... INDEX |-> (_ => VALUE) ... </globals>
```

**TODO**: Unimplemented.

```k
    syntax TypeKeyWord ::= "mut"
 // ----------------------------

    syntax Instr ::= "(" "global" VarIdentifier FuncDecl Instr         ")"
                   | "(" "global"                        Instr ValType ")"
                   | "(" "global" VarIdentifier          Instr ValType ")"
 // ----------------------------------------------------------------------

    syntax Instr ::= "(" "global.get" VarIdentifier Instr ")"
                   | "(" "global.set" VarIdentifier Instr ")"
 // ---------------------------------------------------------
```

Function Declaration and Invocation
-----------------------------------

### Type Declaration

**TODO**: Inimplemented. Token "type" causes problems?

```k
 //   syntax Instr ::= "(" "type" VarIdentifier Instr ")"
 // ---------------------------------------------------
```

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we allow for an "abstract" function declaration using syntax `func_::___`, and a more concrete one which allows arbitrary order of declaration of parameters, locals, and results.

```k
    syntax FunctionName ::= ".FunctionName" | Int | Identifier | String
 // -------------------------------------------------------------------

    syntax TypeKeyWord ::= "param" | "result" | "local"
 // ---------------------------------------------------

    syntax FuncDecl  ::= "(" FuncDecl ")"     [bracket]
                       | TypeKeyWord ValTypes
                       | "export" FunctionName
    syntax FuncDecls ::= List{FuncDecl, ""} [klabel(listFuncDecl)]
 // --------------------------------------------------------------

    syntax Instr ::= "(" "func"              FuncDecls Instrs ")"
                   | "(" "func" FunctionName FuncDecls Instrs ")"
                   | "func" FunctionName "::" FuncType VecType "{" Instrs "}"
 // -------------------------------------------------------------------------
    rule <k> ( func FDECLS INSTRS )
          => func gatherExportedName(FDECLS) :: gatherFuncType(FDECLS) gatherTypes(local, FDECLS) { INSTRS }
         ...
         </k>

    rule <k> ( func FNAME FDECLS INSTRS )
          => func FNAME :: gatherFuncType(FDECLS) gatherTypes(local, FDECLS) { INSTRS }
         ...
         </k>

    rule <k> func FNAME :: FTYPE LTYPE { INSTRS } => . ... </k>
         <funcs>
           ( .Bag
          => <funcDef>
               <fname>  FNAME  </fname>
               <fcode>  INSTRS </fcode>
               <ftype>  FTYPE  </ftype>
               <flocal> LTYPE  </flocal>
               ...
             </funcDef>
           )
           ...
         </funcs>

    syntax FunctionName ::= gatherExportedName ( FuncDecls ) [function]
 // -------------------------------------------------------------------
    rule gatherExportedName(export FNAME   FDECLS:FuncDecls) => FNAME
    rule gatherExportedName(FDECL:FuncDecl FDECLS:FuncDecls) => gatherExportedName(FDECLS) [owise]

    syntax FuncType ::= gatherFuncType ( FuncDecls ) [function]
 // -----------------------------------------------------------
    rule gatherFuncType(FDECLS) => gatherTypes(param, FDECLS) -> gatherTypes(result, FDECLS)

    syntax VecType ::=  gatherTypes ( TypeKeyWord , FuncDecls )            [function]
                     | #gatherTypes ( TypeKeyWord , FuncDecls , ValTypes ) [function]
 // ---------------------------------------------------------------------------------
    rule gatherTypes(TKW, FDECLS) => #gatherTypes(TKW, FDECLS, .ValTypes)

    rule #gatherTypes(TKW , .FuncDecls            , TYPES) => [ TYPES ]
    rule #gatherTypes(TKW , FDECL:FuncDecl FDECLS , TYPES) => #gatherTypes(TKW, FDECLS, TYPES) [owise]

    rule #gatherTypes(TKW , TKW VTYPES' FDECLS:FuncDecls , VTYPES)
      => #gatherTypes(TKW ,             FDECLS           , VTYPES + VTYPES')
```

**TODO**: Unimplemented.

```k

    syntax NamedValType ::= VarIdentifier ValType
 // ---------------------------------------------

    syntax NamedValTypes ::= List{NamedValType, ""}
 // -----------------------------------------------

    syntax FuncDecl ::= TypeKeyWord NamedValTypes
 // ---------------------------------------------

    syntax Instr ::= "(" "export" FunctionName              Instr        ")"
                   | "(" "import" FunctionName FunctionName              ")"
                   | "(" "import" FunctionName FunctionName FunctionName ")"
                   | "(" "import" FunctionName FunctionName Instr        ")"
 // ------------------------------------------------------------------------

 //   syntax Instr ::=  "(" "func" FunctionName Instrs FuncDecl ")"
    syntax Instr ::=  "(" "func" FunctionName Instrs "(" "param" IValType ")" ")"
 // -----------------------------------------------------------------------------
```

### Function Invocation/Return

Frames are used to store function return points.
Similar to labels, they sit on the instruction stack (the `<k>` cell), and `return` consumes things following it until hitting it.
Unlike labels, only one frame can be "broken" through at a time.

```k
    syntax Frame ::= "frame" ValTypes Stack Map
 // -------------------------------------------
    rule <k> frame TRANGE STACK' LOCAL' => . ... </k>
         <stack> STACK => #take(TRANGE, STACK) ++ STACK' </stack>
         <locals> _ => LOCAL' </locals>

    syntax Instr ::= "invoke" FunctionName
 // --------------------------------------
    rule <k> invoke FNAME
          => init_locals #take(TDOMAIN, STACK) ++ #zero(TLOCALS)
          ~> INSTRS
          ~> frame TRANGE #drop(TDOMAIN, STACK) LOCAL
          ...
          </k>
         <stack>  STACK => .Stack </stack>
         <curFrame>
           <addrs> _ => ADDRS </addrs>
           <locals> LOCAL => .Map </locals>
           ...
         </curFrame>
         <funcDef>
           <fname>  FNAME                     </fname>
           <fcode>  INSTRS                    </fcode>
           <ftype>  [ TDOMAIN ] -> [ TRANGE ] </ftype>
           <flocal> [ TLOCALS ]               </flocal>
           <faddrs> ADDRS                     </faddrs>
           ...
         </funcDef>

    syntax Instr ::= "(" "return" ")"
 // ---------------------------------
    rule <k> ( return ) ~> (IS:Instrs => .) ... </k>
    rule <k> ( return ) ~> (L:Label   => .) ... </k>
    rule <k> (( return ) => .) ~> FR:Frame  ... </k>
```

**TODO**: Unimplemented.
**TODO**: Figure out why the "type" token is not liked by K.
**TODO**: Make regression out of error message that adding this `invoke` rule makes.

```k
    syntax Instr ::= "(" "call" VarIdentifier Instrs ")"
 // ----------------------------------------------------

 //   syntax Instr ::= "(" "call_indirect" "(" "type" VarIdentifier ")" Instrs ")"
 // ----------------------------------------------------------------------------

    syntax Instr ::= "(" "invoke" FunctionName  Instrs ")"
                   | "(" "invoke" VarIdentifier String ")"
 // ------------------------------------------------------
//    rule <k> ( invoke FNAME:FunctionName IS:Instrs ) => IS ~> invoke FNAME ... </k>

    syntax Instr ::= "(" "return" Instr ")"
 // ---------------------------------------
    rule <k> ( return INSTR ) => INSTR ~> ( return ) ... </k>
```

Memory
------

When memory is allocated, it is put into the store at the next available index.
Memory can only grow in size, so the minimum size is the initial value.
Currently, only one memory may be accessible to a module, and thus the `<memAddrs>` cell is an array with at most one value, at index 0.

**TODO**: Allow instantiation with data, and with an identifier and inline export and import.

```k
    syntax Instr ::= "(" "memory"                  ")"
                   | "(" "memory"     Int          ")" // Size only
                   | "(" "memory"     Int Int      ")" // Min and max.
                   |     "memory" "{" Int MemBound "}"
 // --------------------------------------------------
    rule <k> ( memory                 ) => memory { 0   .MemBound } ... </k>
    rule <k> ( memory MIN:Int         ) => memory { MIN .MemBound } ... </k>
      requires MIN <=Int #maxMemorySize()
    rule <k> ( memory MIN:Int MAX:Int ) => memory { MIN MAX       } ... </k>
      requires MIN <=Int #maxMemorySize()
       andBool MAX <=Int #maxMemorySize()

    rule <k> memory { _ _ } => trap ... </k>
         <memAddrs> MAP </memAddrs> requires MAP =/=K .Map

    rule <k> memory { MIN MAX } => . ... </k>
         <memAddrs>    .Map => (0 |-> NEXT)  </memAddrs>
         <nextMemAddr> NEXT => NEXT +Int 1 </nextMemAddr>
         <mems>
           ( .Bag
          => <memInst>
               <memAddr> NEXT </memAddr>
               <mmax>    MAX  </mmax>
               <msize>   MIN  </msize>
               <mdata>   .Map </mdata>
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
         <stack> < ITYPE > VAL : < i32 > IDX : STACK => STACK </stack>
    rule <k> ( ITYPE . SOP:StoreOp MEMARG:MemArg ) => ITYPE . SOP (IDX +Int #getOffset(MEMARG)) VAL ... </k>
         <stack> < ITYPE > VAL : < i32 > IDX : STACK => STACK </stack>

    rule <k> store { WIDTH EA VAL } => . ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR </memAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA => #clearRange(DATA, EA, EA +Int WIDTH -Int 1) [EA := VAL ] </mdata>
           ...
         </memInst>
         requires (EA +Int WIDTH /Int 8) <=Int (SIZE *Int #pageSize())

    rule <k> store { WIDTH  EA  _ } => trap ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR </memAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
         requires (EA +Int WIDTH /Int 8) >Int (SIZE *Int #pageSize())

    syntax StoreOp ::= "store" | "store8" | "store16" | "store32"
 // -------------------------------------------------------------
    rule <k> ITYPE . store   EA VAL => store { #numBytes(ITYPE) EA VAL            } ... </k>
    rule <k> _     . store8  EA VAL => store { 8                EA #wrap(8,  VAL) } ... </k>
    rule <k> _     . store16 EA VAL => store { 16               EA #wrap(16, VAL) } ... </k>
    rule <k> i64   . store32 EA VAL => store { 32               EA #wrap(32, VAL) } ... </k>
```

The assorted load operations take an address of type `i32`.
The `loadX_sx` operations loads `X` bits from memory, and extend it to the right length for the return value, interpreting the bytes as either signed or unsigned according to `sx`.
The value is fethced from the "effective address", which is the address given on the stack plus offset.

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
         <stack> < i32 > IDX : STACK => STACK </stack>
    rule <k> ( ITYPE . LOP:LoadOp MEMARG:MemArg) => ITYPE . LOP (IDX +Int #getOffset(MEMARG)) ... </k>
         <stack> < i32 > IDX : STACK => STACK </stack>

    rule <k> load { ITYPE WIDTH EA SIGN }
          => < ITYPE > #if SIGN ==K Signed
                           #then #signedWidth(WIDTH, #range(DATA, EA, WIDTH /Int 8))
                           #else #range(DATA, EA, WIDTH /Int 8)
                       #fi
         ...
         </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR </memAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA </mdata>
           ...
         </memInst>
      requires (EA +Int WIDTH /Int 8) <=Int (SIZE *Int #pageSize())

    rule <k> load { _ WIDTH EA _ } => trap ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR </memAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
      requires (EA +Int WIDTH /Int 8) >Int (SIZE *Int #pageSize())

    syntax LoadOp ::= "load"
                    | "load8_u" | "load16_u" | "load32_u"
                    | "load8_s" | "load16_s" | "load32_s"
 // -----------------------------------------------------
    rule <k> ITYPE . load     EA:Int => load { ITYPE #numBytes(ITYPE) EA Unsigned } ... </k>
    rule <k> ITYPE . load8_u  EA:Int => load { ITYPE 8                EA Unsigned } ... </k>
    rule <k> ITYPE . load16_u EA:Int => load { ITYPE 16               EA Unsigned } ... </k>
    rule <k> i64   . load32_u EA:Int => load { i64   32               EA Unsigned } ... </k>
    rule <k> ITYPE . load8_s  EA:Int => load { ITYPE 8                EA Signed   } ... </k>
    rule <k> ITYPE . load16_s EA:Int => load { ITYPE 16               EA Signed   } ... </k>
    rule <k> i64   . load32_s EA:Int => load { i64   32               EA Signed   } ... </k>
```

`MemArg`s can optionally be passed to `load` and `store` operations.
The `offset` parameter is added to the the address given on the stack, resulting in the "effective address" to store to or load from.
The `align` parameter is for optimization only and is not allowed to influence the semantics, so we ignore it.

```k
    syntax MemArg ::= Offset | Align | Offset Align
    syntax Offset ::= "offset" "=" Int
    syntax Align  ::= "align"  "=" Int
 // ----------------------------------

    syntax Int ::= #getOffset ( MemArg ) [function]
 // -----------------------------------------------
    rule #getOffset(           _:Align) => 0
    rule #getOffset(offset= OS        ) => OS
    rule #getOffset(offset= OS _:Align) => OS
```

The `size` operation returns the size of the memory, measured in pages.

```k
    syntax Instr ::= "(" "memory.size" ")"
 // --------------------------------------
    rule <k> ( memory.size ) => < i32 > SIZE ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR </memAddr>
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
         <stack> < i32 > N : STACK => STACK </stack>

    rule <k> grow N => < i32 > #if #growthAllowed(SIZE +Int N, MAX) #then SIZE #else #unsigned(i32, -1) #fi ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR  </memAddr>
           <mmax>    MAX  </mmax>
           <msize>   SIZE => #if #growthAllowed(SIZE +Int N, MAX) #then SIZE +Int N #else SIZE #fi </msize>
           ...
         </memInst>

    rule <k> grow N => < i32 > #unsigned(i32, -1) </k>
         <deterministicMemoryGrowth> false </deterministicMemoryGrowth>

    syntax Bool ::= #growthAllowed(Int, MemBound) [function]
 // --------------------------------------------------------
    rule #growthAllowed(SIZE, .MemBound) => SIZE <=Int #maxMemorySize()
    rule #growthAllowed(SIZE, I:Int)     => #growthAllowed(SIZE, .MemBound) andBool SIZE <=Int I
```

Memories can optionally have a max size which the memory may not grow beyond.

```k
    syntax MemBound ::= Int | ".MemBound"
 // -------------------------------------
```

However, the absolute max allowed size if 2^16 pages.
Incidentally, the page size is 2^16 bytes.

```k
    syntax Int ::= #pageSize()      [function]
    syntax Int ::= #maxMemorySize() [function]
 // ------------------------------------------
    rule #maxMemorySize() => 65536
    rule #pageSize()      => 65536
```

**TODO**: Unimplemented.

```k
    syntax HexString ::= r"[\\\"](\\\\?[0-9a-fA-F])*[\\\"]" [token]
 // ---------------------------------------------------------------

    syntax Instr ::= "(" "memory" "(" "data" HexString ")" ")"
 // ----------------------------------------------------------
```

Tables
------

**TODO**: Unimplemented.

```k
    syntax Instr ::= "(" "offset" Instrs ")"
 // ----------------------------------------

    syntax Instr ::= "(" "elem"               Instr VarIdentifiers ")"
                   | "(" "elem" VarIdentifier Instr VarIdentifiers ")"
 // ------------------------------------------------------------------

    syntax TableIdentifier ::= "[a-zA-Z0-9]*" [token]
 // -------------------------------------------------

    syntax Instr ::= "(" "table" VarIdentifiers TableIdentifier Instrs ")"
 // ----------------------------------------------------------------------
```

Module Declaration
------------------

**TODO**: Unimplemented.

```k
    syntax Instr ::= "(" "start" VarIdentifier ")"
 // ----------------------------------------------

    syntax Instr ::= "(" "module"               Instrs ")"
                   | "(" "module" VarIdentifier Instrs ")"
 // ------------------------------------------------------
    rule <k> ( module INSTRS ) => INSTRS ... </k>

    syntax Instr ::= "(" "register" FunctionName VarIdentifier ")"
 // --------------------------------------------------------------
```

```k
endmodule
```
