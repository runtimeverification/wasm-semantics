WebAssembly Data
================

```k
require "domains.k"

module WASM-DATA
    imports DOMAINS
    imports BYTES
//    imports COLLECTIONS
```

Parsing
-------

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

### Identifiers

As defined in the WebAssembly spec, the syntax of identifiers is as follows.

**TODO**: Unsupported characters: `.:^@`

```k
    syntax Identifier ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=-]*" [avoid, token]
 // ------------------------------------------------------------------------
```

WebAssembly Types
-----------------

### Base Types

WebAssembly has four basic types, for 32 and 64 bit integers and floats.

```k
    syntax IValType ::= "i32" | "i64"
    syntax FValType ::= "f32" | "f64"
    syntax  ValType ::= IValType | FValType
 // ---------------------------------------
```

### Type Constructors

There are two basic type-constructors: sequencing (`[_]`) and function spaces (`_->_`).

```k
    syntax ValTypes ::= List{ValType, ""}
    syntax VecType  ::= "[" ValTypes "]"
 // ------------------------------------

    syntax FuncType ::= VecType "->" VecType
 // ----------------------------------------
```

All told, a `Type` can be a value type, vector of types, or function type.

```k
    syntax Type ::= ".Type" | ValType | VecType | FuncType
 // ------------------------------------------------------
```

We can append two `ValTypes`s with the `_+_` operator.

```k
    syntax ValTypes ::= ValTypes "+" ValTypes [function]
 // ----------------------------------------------------
    rule .ValTypes + VTYPES            => VTYPES
    rule (VT:ValType VTYPES) + VTYPES' => VT (VTYPES + VTYPES')
```

### Type Information

The `#width` function returns the bit-width of a given `IValType`.

```k
    syntax Int ::= #width    ( IValType ) [function]
    syntax Int ::= #numBytes ( IValType ) [function]
 // ---------------------------------------------
    rule #width(i32) => 32
    rule #width(i64) => 64

    rule #numBytes(ITYPE) => #width(ITYPE) /Int 8
```

`2 ^Int 32` and `2 ^Int 64` are used often enough to warrant providing helpers for them.

```k
    syntax Int ::= #pow  ( IValType ) [function, smtlib(pow )] /* 2 ^Int #width(T)          */
                 | #pow1 ( IValType ) [function, smtlib(pow1)] /* 2 ^Int (#width(T) -Int 1) */
 // ------------------------------------------------------------------------------------------
    rule #pow1(i32) => 2147483648
    rule #pow (i32) => 4294967296
    rule #pow1(i64) => 9223372036854775808
    rule #pow (i64) => 18446744073709551616
```

Values
------

### Basic Values

WebAssembly values are either integers or floating-point numbers, of 32- or 64-bit widths.

```k
    syntax Number ::= Int | Float
 // -----------------------------
```

Proper values are numbers annotated with their types.

```k
    syntax IVal ::= "<" IValType ">" Int    [klabel(<_>_)]
    syntax FVal ::= "<" FValType ">" Float  [klabel(<_>_)]
    syntax  Val ::= "<"  ValType ">" Number [klabel(<_>_)]
                  | IVal | FVal
 // ---------------------------
```

We also add `undefined` as a value, which makes many partial functions in the semantics total.

```k
    syntax Val ::= "undefined"
 // --------------------------
```

### Value Operations

The `#chop` function will ensure that an integer value is wrapped to the correct bit-width.
The `#wrap` function wraps an integer to a given bit width.

```k
    syntax IVal ::= #chop ( IVal ) [function]
 // -----------------------------------------
    rule #chop(< ITYPE > N) => < ITYPE > (N modInt #pow(ITYPE)) [concrete]

    syntax Int  ::= #wrap(Int, Int) [function]
 // ------------------------------------------
    rule #wrap(WIDTH, N) => N modInt (1 <<Int WIDTH) [concrete]
```

### Signed Interpretation

Functions `#signed` and `#unsigned` allow for easier operation on twos-complement numbers.
These functions assume that the argument integer is in the valid range of signed and unsigned values of the respective type, so they will not correctly map arbitrary integers into the corret range.

```k
    syntax Int ::= #signed   ( IValType , Int ) [function]
                 | #unsigned ( IValType , Int ) [function]
 // ------------------------------------------------------
    rule #signed(ITYPE, N) => N                  requires 0            <=Int N andBool N <Int #pow1(ITYPE)
    rule #signed(ITYPE, N) => N -Int #pow(ITYPE) requires #pow1(ITYPE) <=Int N andBool N <Int #pow (ITYPE)

    rule #unsigned(ITYPE, N) => N +Int #pow(ITYPE) requires N  <Int 0
    rule #unsigned(ITYPE, N) => N                  requires 0 <=Int N
```

### Boolean Interpretation

Function `#bool` converts a `Bool` into an `Int`.

```k
    syntax Int ::= #bool ( Bool ) [function]
 // ----------------------------------------
    rule #bool( B:Bool ) => 1 requires B
    rule #bool( B:Bool ) => 0 requires notBool B
```

Data Structures
---------------

WebAssembly is a stack-machine, so here we provide the stack to operate over.
Operator `_++_` implements an append operator for sort `Stack`.

```k
    syntax StackItem ::= Val
    syntax Stack     ::= ".Stack"
                       | StackItem ":" Stack
                       | Stack "++" Stack    [function]
 // ---------------------------------------------------
    rule .Stack       ++ STACK' => STACK'
    rule (SI : STACK) ++ STACK' => SI : (STACK ++ STACK')
```

`#zero` will create a specified stack of zero values in a given type.
`#take` will take the prefix of a given stack, checking that the value types match the supplied type-sequence.
`#drop` will drop the prefix of a given stack, checking that the value types match the supplied type-sequence.

```k
    syntax Stack ::= #zero ( ValTypes )         [function]
                   | #take ( ValTypes , Stack ) [function]
                   | #drop ( ValTypes , Stack ) [function]
 // ------------------------------------------------------
    rule #zero(.ValTypes)             => .Stack
    rule #zero(ITYPE:IValType VTYPES) => < ITYPE > 0 : #zero(VTYPES)

    rule #take(.ValTypes,   _)                           => .Stack
    rule #take(TYPE VTYPES, < TYPE > VAL:Number : STACK) => < TYPE > VAL : #take(VTYPES, STACK)

    rule #drop(.ValTypes,   STACK)                       => STACK
    rule #drop(TYPE VTYPES, < TYPE > VAL:Number : STACK) => #drop(VTYPES, STACK)
```

Hexadecimals
------------

Some data, such as memory offsets, can be specified in hexadecimal form.

```k
    syntax HexNum ::= "0x" String
    syntax Int    ::= #hexToInt ( HexNum ) [function]
 // -------------------------------------------------
    rule #hexToInt(0x H) => String2Base(H, 16) requires H =/=String ""
```

Byte Map
--------

Wasm memory is held as a bounded finite maps of bytes.
`BM [ N := BS ]` assigns a contiguous chunk of `BS` to `BM` starting at position $N$.

```k
    syntax Map ::= Map "[" Int ":=" Bytes "]" [function]
    syntax Map ::= #insertBytes (Map, Int, Bytes, Int, Int) [function]
 // ------------------------------------------------------------------
    rule BM [ IDX := BS ] => #insertBytes(BM, IDX, BS, 0, lengthBytes(BS))

    rule #insertBytes(BM, MEMIDX, BS, BSIDX, LEN) => BM  requires BSIDX ==Int LEN
    rule #insertBytes(BM, MEMIDX, BS, BSIDX, LEN) =>
      #insertBytes(
        // Don't insert 0 bytes.
        #if substrBytes(BS, BSIDX, BSIDX +Int 1) ==K #zeroByte()
          #then BM
          #else BM [MEMIDX <- substrBytes(BS, BSIDX, BSIDX +Int 1)]
        #fi
        , MEMIDX +Int 1
        , BS
        , BSIDX +Int 1
        , LEN)
      requires BSIDX <Int LEN

    syntax Bytes ::= #zeroByte() [function]
 // ---------------------------------------
    rule #zeroByte() => String2Bytes("\x00")
```

`#range(BM, START, WIDTH)` reads off `WIDTH` elements from `BM` beginning at position `START`.

```k
    syntax Bytes ::= #range ( Map , Int , Int ) [function]
 // ------------------------------------------------------
    rule #range(BM:Map, START, 0    ) => .Bytes
    rule #range(BM:Map, START, WIDTH) => #lookup(BM, START) +Bytes #range(BM, START +Int 1, WIDTH -Int 1)
      requires WIDTH >Int 0 [concrete]
```

`#lookup` looks up a key in a map, defaulting to a `#zeroByte()` is the map does not contain the key.

```k
    syntax Bytes ::= #lookup ( Map , Int ) [function]
 // -------------------------------------------------
    rule #lookup( (KEY |-> VAL) M, KEY ) => VAL                                         [concrete]
    rule #lookup(               M, KEY ) => #zeroByte() requires notBool KEY in_keys(M) [concrete]
```

```k
endmodule
```
