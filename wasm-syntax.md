WASM Data
=========

```k
// Copyright (c) 2015 K Team. All Rights Reserved.
require "domains.k"

module WASM-DATA
    imports DOMAINS
```

### Special Powers

$2^32$ and $2^64$ are used often enough to warrant providing macros for them.

**TODO**: Offer `#pow : IValType -> Int` and `#pow1 : IValType -> Int` function/macros.
          Would simplify `#chop`, `#signed`, `div_s`, and `rem_s`.

```k
    syntax Int ::= "#pow31" [function] /* 2 ^Int 31 */
                 | "#pow32" [function] /* 2 ^Int 32 */
                 | "#pow63" [function] /* 2 ^Int 63 */
                 | "#pow64" [function] /* 2 ^Int 64 */
 // --------------------------------------------------
    rule #pow31 => 2147483648           [macro]
    rule #pow32 => 4294967296           [macro]
    rule #pow63 => 9223372036854775808  [macro]
    rule #pow64 => 18446744073709551616 [macro]
```

### Types

WASM has four basic types, for 32 and 64 bit integers and floats.
There are two basic type-constructors: sequencing (`[_]`) and function spaces (`_->_`).

```k
    syntax IValType ::= "i32" | "i64"
    syntax FValType ::= "f32" | "f64"
    syntax  ValType ::= IValType | FValType
 // ---------------------------------------

    syntax ValTypes ::= List{ValType, ""}
    syntax VecType  ::= "[" ValTypes "]"
 // ------------------------------------

    syntax FuncType ::= VecType "->" VecType
 // ----------------------------------------

    syntax Type ::= ".Type" | ValType | VecType | FuncType
 // ------------------------------------------------------
```

The `#width` function returns the bit-width of a given `IValType`.

```k
    syntax Int ::= #width ( IValType ) [function]
 // ---------------------------------------------
    rule #width(i32) => 32
    rule #width(i64) => 64
```

### Values

WASM values are either integers or floating-point numbers, of 32- or 64-bit widths.
First, the type of values is built, then values annotated with their types are provided.

```k
    syntax Number ::= Int | Float
 // -----------------------------

    syntax IVal ::= "<" IValType ">" Int
    syntax FVal ::= "<" FValType ">" Float
    syntax  Val ::= "<"  ValType ">" Number
                  | IVal | FVal
 // ---------------------------
```

The `#chop` function will ensure that an integer value is wrapped to the correct bit-width.

```k
    syntax IVal ::= #chop ( IVal ) [function]
 // -----------------------------------------
    rule #chop(< i32 > N) => < i32 > (N modInt #pow32)
    rule #chop(< i64 > N) => < i64 > (N modInt #pow64)
```

### Signed Interpretation

Functions `#signed` and `#unsigned` allow for easier operation on twos-complement numbers.

```k
    syntax Int ::= #signed   ( IValType , Int ) [function]
                 | #unsigned ( IValType , Int ) [function]
 // ------------------------------------------------------
    rule #signed(i32, N) => N             requires 0      <=Int N andBool N <Int #pow31
    rule #signed(i32, N) => N -Int #pow32 requires #pow31 <=Int N andBool N <Int #pow32
    rule #signed(i64, N) => N             requires 0      <=Int N andBool N <Int #pow63
    rule #signed(i64, N) => N -Int #pow64 requires #pow63 <=Int N andBool N <Int #pow64

    rule #unsigned(i32, N) => N +Int #pow32 requires N <Int  0
    rule #unsigned(i32, N) => N             requires 0 <=Int N
    rule #unsigned(i64, N) => N +Int #pow64 requires N <Int  0
    rule #unsigned(i64, N) => N             requires 0 <=Int N
```

### Boolean Interpretation

Function `#bool` converts a `Bool` into an `Int`.

```k
    syntax Int ::= #bool ( Bool ) [function]
 // ----------------------------------------
    rule #bool( B:Bool ) => 1 requires B
    rule #bool( B:Bool ) => 0 requires notBool B
```

### Stack Machine Data

WASM is a stack-machine, so here we provide the stack to operate over.

```k
    syntax StackItem ::= Val
    syntax Stack     ::= ".Stack"
                       | StackItem ":" Stack
 // ----------------------------------------
```

Operator `_++_` implements an append operator for sort `Stack`.
Operator `#take` will take the prefix of a given stack, checking that the value types match the supplied type-sequence.

```k
    syntax Stack ::= Stack "++" Stack           [function]
                   | #take ( ValTypes , Stack ) [function]
 // ------------------------------------------------------
    rule .Stack       ++ STACK' => STACK'
    rule (SI : STACK) ++ STACK' => SI : (STACK ++ STACK')

    rule #take(.ValTypes,   _)                           => .Stack
    rule #take(TYPE VTYPES, < TYPE > VAL:Number : STACK) => < TYPE > VAL : #take(VTYPES, STACK)
endmodule
```

WASM Instructions
=================

```k
module WASM-BASIC-INSTRUCTIONS
    imports WASM-DATA

    syntax Instr ::= "(" Instr ")" [bracket]
 // ----------------------------------------

    syntax Instrs ::= List{Instr, ""}
 // ---------------------------------
    rule .Instrs           => .K
    rule I:Instr IS:Instrs => I ~> IS
```

Operator Evaluation
-------------------

In the semantics, the correct `#eval<T><AR>Op` function is called based on the arity of the called operator.
This allows us to give purely functional semantics to a large portion of the WASM opcodes.

### Constants

Constants do not need an evaluation function.

```k
    syntax Instr ::= IValType "." "const" Int
                   | FValType "." "const" Float
 // -------------------------------------------
```

### Unary Operators

When a unary operator is the next instruction, `#eval<T>UnOp` will be called on the operator and its arguments.

```k
    syntax UnOp ::= IUnOp
 //               | FUnOp
 // ---------------------

    syntax Instr ::= IValType "." IUnOp
 //                | FValType "." FUnOp
 // -----------------------------------

    syntax Val ::= #evalIUnOp ( Instr , Int   ) [function]
 //              | #evalFUnOp ( Instr , Float ) [function]
 // ------------------------------------------------------
```

### Binary Operators

When a binary operator is the next instruction, `#eval<T>BinOp` will be called on the operator and its two arguments.

```k
    syntax BinOp ::= IBinOp
 //                | FBinOp
 // -----------------------

    syntax Instr ::= IValType "." IBinOp
 //                | FValType "." FBinOp
 // ------------------------------------

    syntax Val ::= #evalIBinOp ( Instr , Int   , Int   ) [function]
 //              | #evalFBinOp ( Instr , Float , Float ) [function]
 // ---------------------------------------------------------------
```

Numeric Operators
-----------------

A large portion of the available opcodes are pure arithmetic.

### Integer Arithmetic

```k
    syntax IBinOp ::= "add" | "sub" | "mul"
 // ---------------------------------------
    rule #evalIBinOp(TYPE . add, I1, I2) => #chop(< TYPE > (I1 +Int I2))
    rule #evalIBinOp(TYPE . sub, I1, I2) => #chop(< TYPE > (I1 -Int I2))
    rule #evalIBinOp(TYPE . mul, I1, I2) => #chop(< TYPE > (I1 *Int I2))

    syntax IBinOp ::= "div_u" | "rem_u"
 // -----------------------------------
    rule #evalIBinOp(TYPE . div_u, I1, I2) => < TYPE > (I1 /Int I2) requires I2 =/=Int 0
    rule #evalIBinOp(TYPE . rem_u, I1, I2) => < TYPE > (I1 %Int I2) requires I2 =/=Int 0

    syntax IBinOp ::= "div_s" | "rem_s"
 // -----------------------------------
    rule #evalIBinOp(i32 . div_s, I1, I2) => < i32 > #unsigned(i32, #signed(i32, I1) /Int #signed(i32, I2))
      requires I2 =/=Int 0 andBool (I1 =/=Int #pow31 orBool (I2 =/=Int #pow32 -Int 1))
    rule #evalIBinOp(i64 . div_s, I1, I2) => < i64 > #unsigned(i64, #signed(i64, I1) /Int #signed(i64, I2))
      requires I2 =/=Int 0 andBool (I1 =/=Int #pow63 orBool (I2 =/=Int #pow64 -Int 1))

    rule #evalIBinOp(TYPE . rem_s, I1, I2) => < TYPE > #unsigned(TYPE, #signed(TYPE, I1) %Int #signed(TYPE, I2))
      requires I2 =/=Int 0
```

**TODO**: Handle undefined cases.

### Bitwise Operations

```k
    syntax IBinOp ::= "and" | "or" | "xor"
 // --------------------------------------
    rule #evalIBinOp(TYPE . and, I1, I2) => #chop(< TYPE > (I1 &Int   I2))
    rule #evalIBinOp(TYPE . or,  I1, I2) => #chop(< TYPE > (I1 |Int   I2))
    rule #evalIBinOp(TYPE . xor, I1, I2) => #chop(< TYPE > (I1 xorInt I2))

    syntax IBinOp ::= "shl" | "shr_u" | "shr_s"
 // -------------------------------------------
    rule #evalIBinOp(TYPE . shl,   I1, I2) => #chop(< TYPE > I1 <<Int (I2 %Int #width(TYPE)))
    rule #evalIBinOp(TYPE . shr_u, I1, I2) =>       < TYPE > I1 >>Int (I2 %Int #width(TYPE))

    rule #evalIBinOp(TYPE . shr_s, I1, I2) => < TYPE > #unsigned(TYPE, #signed(TYPE, I1) >>Int (I2 %Int #width(TYPE)))

    syntax IBinOp ::= "rotl" | "rotr"
 // ---------------------------------
    rule #evalIBinOp(TYPE . rotl, I1, I2) => #chop(< TYPE > (I1 <<Int (I2 %Int #width(TYPE))) +Int (I1 >>Int (#width(TYPE) -Int (I2 %Int #width(TYPE)))))
    rule #evalIBinOp(TYPE . rotr, I1, I2) => #chop(< TYPE > (I1 >>Int (I2 %Int #width(TYPE))) +Int (I1 <<Int (#width(TYPE) -Int (I2 %Int #width(TYPE)))))
```

**TODO**: `clz`, `ctz`, `popcnt`.

### Comparison Operations

```k
    syntax IUnOp ::= "eqz"
 // ----------------------
    rule #evalIUnOp(TYPE . eqz, I1) => < TYPE > 1 requires I1 ==Int 0
    rule #evalIUnOp(TYPE . eqz, I1) => < TYPE > 0 requires I1 =/=Int 0

    syntax IBinOp ::= "eq" | "ne"
 // -----------------------------
    rule #evalIBinOp(TYPE . eq, I1, I2) => < TYPE > 1 requires I1 ==Int  I2
    rule #evalIBinOp(TYPE . eq, I1, I2) => < TYPE > 0 requires I1 =/=Int I2
    rule #evalIBinOp(TYPE . ne, I1, I2) => < TYPE > 1 requires I1 =/=Int I2
    rule #evalIBinOp(TYPE . ne, I1, I2) => < TYPE > 0 requires I1 ==Int  I2

    syntax IBinOp ::= "lt_u" | "gt_u" | "lt_s" | "gt_s"
 // ---------------------------------------------------
    rule #evalIBinOp(TYPE . lt_u, I1, I2) => < TYPE > #bool(I1 <Int I2)
    rule #evalIBinOp(TYPE . gt_u, I1, I2) => < TYPE > #bool(I1 >Int I2)

    rule #evalIBinOp(TYPE . lt_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) <Int #signed(TYPE, I2))
    rule #evalIBinOp(TYPE . gt_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) >Int #signed(TYPE, I2))

    syntax IBinOp ::= "le_u" | "ge_u" | "le_s" | "ge_s"
 // ---------------------------------------------------
    rule #evalIBinOp(TYPE . le_u, I1, I2) => < TYPE > #bool(I1 <=Int I2)
    rule #evalIBinOp(TYPE . ge_u, I1, I2) => < TYPE > #bool(I1 >=Int I2)

    rule #evalIBinOp(TYPE . le_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) <=Int #signed(TYPE, I2))
    rule #evalIBinOp(TYPE . ge_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) >=Int #signed(TYPE, I2))
```

```k
endmodule
```
