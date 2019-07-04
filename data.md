WebAssembly Data
================

```k
require "domains.k"

module WASM-DATA
    imports DOMAINS
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
Also we use `#freshId ( Int )` to generate a fresh identifier based on the element index in the current module.

**TODO**: Unsupported characters: `.:^@`

```k
    syntax Identifier ::= #freshId ( Int )
                        | r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=-]*" [avoid, token]
 // ------------------------------------------------------------------------

    syntax OptionalId ::= "" [klabel(.Identifier)]
                        | Identifier
 // --------------------------------
```

In KWasm we store identifiers in maps from `Identifier` to `Int`, the `Int` being an index.
This rule handles adding an `OptionalId` as a map key, but only when it is a proper identifier.

```k
    syntax Map ::= #saveId (Map, OptionalId, Int) [function]
 // -------------------------------------------------------
    rule #saveId (MAP, ID:OptionalId, _)   => MAP             requires notBool isIdentifier(ID)
    rule #saveId (MAP, ID:Identifier, IDX) => MAP [ID <- IDX]
```

### Text Format Indices

Indices in the text format could be either an `address` or an `identifier.
When we are initializing a table with element segment, we need to define a list of Text Format Indices and calculate the length of it.

```k
    syntax TextFormatIdx ::= Int | Identifier
 // -----------------------------------------

    syntax ElemSegment ::= List{TextFormatIdx, ""} [klabel(listTextFormatIdx)]
 // --------------------------------------------------------------------------

    syntax Int           ::= #lenElemSegment (ElemSegment)      [function]
    syntax TextFormatIdx ::= #getElemSegment (ElemSegment, Int) [function]
 // ----------------------------------------------------------------------
    rule #lenElemSegment(.ElemSegment) => 0
    rule #lenElemSegment(TFIDX     ES) => 1 +Int #lenElemSegment(ES)

    rule #getElemSegment(E ES, 0) => E
    rule #getElemSegment(E ES, I) => #getElemSegment(ES, I -Int 1) requires I >Int 0
```

Memories/tables can optionally have a max size which the memory may not grow beyond.
The sort `MaxBound` provides a potentially "infinite" `Int`.

```k
    syntax MaxBound ::= Int | ".MaxBound"
 // -------------------------------------
```

WebAssembly Types
-----------------

### Base Types

WebAssembly has four basic types, for 32 and 64 bit integers and floats.
Here we define `AValType` which stands for `anonymous valtype`, representing values that doesn't have an identifier associated to it.
Also we define `NValType` which stands for `named valtype`, representing values that has an identifier associated to it.
`ValType` is the aggregation of `AValType` and `NValType`.

```k
    syntax IValType ::= "i32" | "i64"
    syntax FValType ::= "f32" | "f64"
    syntax AValType ::= IValType | FValType
    syntax NValType ::= "{" Identifier AValType "}"
    syntax ValType  ::= AValType | NValType
 // ---------------------------------------
```

### Type Constructors

There are two basic type-constructors: sequencing (`[_]`) and function spaces (`_->_`).

```k
    syntax ValTypes ::= List{ValType, ""} [klabel(listValTypes)]
    syntax VecType  ::= "[" ValTypes "]"
 // ------------------------------------

    syntax FuncType ::= VecType "->" VecType
 // ----------------------------------------
```

We need helper functions to remove the identifiers from `FuncType`.

```k
    syntax FuncType ::= unnameFuncType ( FuncType ) [function]
 // ----------------------------------------------------------
    rule unnameFuncType ( [ V1 ]->[ V2 ] ) => [ unnameValTypes ( V1 ) ]->[ V2 ]
```

We need helper functions to remove all the identifiers from a `ValTypes`.

```k
    syntax ValTypes ::= unnameValTypes ( ValTypes ) [function]
 // ----------------------------------------------------------
    rule unnameValTypes ( .ValTypes     ) => .ValTypes
    rule unnameValTypes ( V:AValType VS ) => V unnameValTypes ( VS )
    rule unnameValTypes ( { ID V } VS )   => V unnameValTypes ( VS )
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

Also we can reverse a `ValTypes` with `#revt`

```k
    syntax ValTypes ::= #revt ( ValTypes )            [function]
                      | #revt ( ValTypes , ValTypes ) [function, klabel(#revtAux)]
 // ------------------------------------------------------------------------------
    rule #revt(VT) => #revt(VT, .ValTypes)

    rule #revt(.ValTypes, VT') => VT'
    rule #revt(V VT     , VT') => #revt(VT, V VT')
```

### Type Information

The `#width` function returns the bit-width of a given `IValType`.

```k
    syntax Int ::= #width    ( IValType ) [function]
    syntax Int ::= #numBytes ( IValType ) [function]
 // ------------------------------------------------
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

### Type Mutability

```k
    syntax Mut ::= ".Mut" | "const" | "var"
 // ---------------------------------------
```

### Limits

Tables and memories have limits, defined as either a sinlge `Int` or two `Int`s, representing min and max bounds.

```k
    syntax Limits ::= Int | Int Int
 // -------------------------------
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
    syntax  Val ::= "<" AValType ">" Number [klabel(<_>_)]
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
Some operations extend integers from 1, 2, or 4 bytes, so a special function with a bit width argument helps with the conversion.

```k
    syntax Int ::= #signed      ( IValType , Int ) [function]
                 | #unsigned    ( IValType , Int ) [function]
                 | #signedWidth ( Int      , Int ) [function]
 // ---------------------------------------------------------
    rule #signed(ITYPE, N) => N                  requires 0            <=Int N andBool N <Int #pow1(ITYPE)
    rule #signed(ITYPE, N) => N -Int #pow(ITYPE) requires #pow1(ITYPE) <=Int N andBool N <Int #pow (ITYPE)

    rule #unsigned(ITYPE, N) => N +Int #pow(ITYPE) requires N  <Int 0
    rule #unsigned(ITYPE, N) => N                  requires 0 <=Int N

    rule #signedWidth(1, N) => N            requires 0     <=Int N andBool N <Int 128
    rule #signedWidth(1, N) => N -Int 256   requires 128   <=Int N andBool N <Int 256
    rule #signedWidth(2, N) => N            requires 0     <=Int N andBool N <Int 32768
    rule #signedWidth(2, N) => N -Int 65536 requires 32768 <=Int N andBool N <Int 65536
    rule #signedWidth(4, N) => #signed(i32, N)
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
Operator `_++_` implements an append operator for sort `ValStack`.

```k
    syntax ValStack ::= ".ValStack"
                   | Val      ":"  ValStack
                   | ValStack "++" ValStack [function]
 // --------------------------------------------------
    rule .ValStack       ++ VALSTACK' => VALSTACK'
    rule (SI : VALSTACK) ++ VALSTACK' => SI : (VALSTACK ++ VALSTACK')
```

`#zero` will create a specified stack of zero values in a given type.
`#take` will take the prefix of a given stack, checking that the value types match the supplied type-sequence.
`#drop` will drop the prefix of a given stack, checking that the value types match the supplied type-sequence.
One needs to unname the `ValTypes` first before calling the `#take` or `#drop` function.

```k
    syntax ValStack ::= #zero ( ValTypes )            [function]
                      | #take ( ValTypes , ValStack ) [function]
                      | #drop ( ValTypes , ValStack ) [function]
                      | #revs ( ValStack )            [function]
                      | #revs ( ValStack , ValStack ) [function, klabel(#revsAux)]
 // ------------------------------------------------------------------------------
    rule #zero(.ValTypes)             => .ValStack
    rule #zero(ITYPE:IValType VTYPES) => < ITYPE > 0 : #zero(VTYPES)

    rule #take(.ValTypes,   _)                              => .ValStack
    rule #take(TYPE:AValType VTYPES, < TYPE > VAL:Number : VALSTACK) => < TYPE > VAL : #take(VTYPES, VALSTACK)

    rule #drop(.ValTypes,   VALSTACK)                       => VALSTACK
    rule #drop(TYPE:AValType VTYPES, < TYPE > VAL:Number : VALSTACK) => #drop(VTYPES, VALSTACK)

    rule #revs(VS) => #revs(VS, .ValStack)

    rule #revs(.ValStack, VS') => VS'
    rule #revs(V : VS   , VS') => #revs(VS, V : VS')
```

Strings
-------

Wasm memories can be initialized with a segment of data, sepcified as a string.
The string considered to represent the sequence of UTF-8 bytes that encode it.
The exception is for characters that are explicitly escaped which can represent bytes in hexadecimal form.
To avoid dealing with these data strings in K, we use a list of integers as an initializer.

**TODO:** Either convert from strings to integers directly in K or with a pre-processor.

```k
    syntax DataStrings ::= List{Int, ""}
    syntax Int ::= #dataStrings2int   (DataStrings) [function]
    syntax Int ::= #dataStringsLength (DataStrings) [function]
 // ----------------------------------------------------------
    rule #dataStringsLength(  .DataStrings) => 0
    rule #dataStringsLength(I DS          ) => 1 +Int #dataStringsLength(DS)

    rule #dataStrings2int(  .DataStrings) => 0
    rule #dataStrings2int(I DS          ) => I +Int (256 *Int #dataStrings2int(DS))
```

Byte Map
--------

Wasm memories are byte arrays, sized in pages of 65536 bytes, initialized to be all zero bytes.
To avoid storing many zeros in what may be sparse memory, we implement memory as maps, and store only non-zero bytes.
The maps store integers, but maintains the invariant that each stored integer is between 1 and 255, inclusive.
`BM [ N := I ]` writes the integer `I` to memory as bytes (little-endian), starting at index `N`.

```k
    syntax Map ::= Map "[" Int ":=" Int "]" [function]
 // --------------------------------------------------
    rule BM [ IDX := 0  ] => BM
    rule BM [ IDX := VAL] => BM [IDX <- VAL modInt 256 ] [ IDX +Int 1 := VAL /Int 256 ]
      requires VAL modInt 256 =/=Int 0
       andBool VAL >Int 0
    // Don't store 0 bytes.
    rule BM [ IDX := VAL] => BM [IDX <- undef          ] [ IDX +Int 1 := VAL /Int 256 ]
      requires VAL modInt 256 ==Int 0
       andBool VAL >Int 0
```

`#range(BM, START, WIDTH)` reads off `WIDTH` elements from `BM` beginning at position `START`, and converts it into an unsigned integer.
The function interprets the range of bytes as little-endian.

```k
    syntax Int ::= #range ( Map , Int , Int ) [function]
 // ----------------------------------------------------
    rule #range(BM:Map, START, WIDTH) => 0
      requires WIDTH ==Int 0
    rule #range(BM:Map, START, WIDTH) => #lookup(BM, START) +Int (#range(BM, START +Int 1, WIDTH -Int 1) *Int 256)
      requires WIDTH >Int 0 [concrete]
```

`#lookup` looks up a key in a map, defaulting to 0 if the map does not contain the key.

```k
    syntax Int ::= #lookup ( Map , Int ) [function]
 // -----------------------------------------------
    rule #lookup( (KEY |-> VAL) M, KEY ) => VAL                               [concrete]
    rule #lookup(               M, KEY ) => 0 requires notBool KEY in_keys(M) [concrete]
```

`#clearRange(MAP, START, END)` removes all entries in the map from `START` (inclusive) to `END` (exclusive).

```k
    syntax Map ::= #clearRange(Map, Int, Int) [function]
 // ----------------------------------------------------
    rule #clearRange(M, START, END) => M
      requires START >=Int END
    rule #clearRange(M, START, END) => #clearRange(M [START <- undef], START +Int 1, END)
      requires START <Int  END
```

External Values
---------------

An `external value` is the runtime representation of an entity that can be `imported` or `exported`.
It is an `address` denoting either a `function instance`, `table instance`, `memory instance`, or `global instances` in the shared store.

```k
    syntax AllocatedKind ::= "func" | "table" | "memory" | "global"
    syntax Externval     ::= AllocatedKind TextFormatIdx
 // ----------------------------------------------------
```

```k
endmodule
```
