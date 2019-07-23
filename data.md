WebAssembly Data
================

```k
require "domains.k"
```

```k
module WASM-SYNTAX
    imports WASM-TOKEN-SYNTAX
    imports WASM-DATA
endmodule
```

`WASM-TOKEN-SYNTAX` module defines the tokens used in parsing programs.

```k
module WASM-TOKEN-SYNTAX
```

### Strings

In WebAssembly, strings are defined differently to K's built-in strings, so we have to write the definition of WebAssembly `WasmString` in a separate module, and use the module just for parsing the program.
Note that you cannot use a normal K `String` in any production definitions, because the definitions of `String` and `WasmString` overlap, and the K tokenizer does not support ambiguity.

```k
    syntax WasmString ::= r"\\\"(([^\\\"\\\\])|(\\\\[0-9a-fA-F]{2})|(\\\\t)|(\\\\n)|(\\\\r)|(\\\\\\\")|(\\\\')|(\\\\\\\\)|(\\\\u\\{[0-9a-fA-F]{1,6}\\}))*\\\"" [token]
 // -----------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

### Identifiers

In WebAssembly, identifiers are defined by the regular expression below.

```k
    syntax Identifier ::= r"\\$[0-9a-zA-Z!$%&'*+/<>?_`|~=:\\@^.-]+" [token]
 // -----------------------------------------------------------------------
```

### Integers

In WebAssembly, integers could be represented in either the decimal form or hexadecimal form.
In both cases, digits can optionally be separated by underscores.

```k
    syntax WasmInt ::= r"[\\+-]?[0-9]+(_[0-9]+)+"               [token]
                     | r"[\\+-]?0x[0-9a-fA-F]+(_[0-9a-fA-F]+)*" [token]
 // -------------------------------------------------------------------
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

`WASM-DATA` module

```k
module WASM-DATA
    imports INT
    imports BOOL
    imports STRING
    imports LIST
    imports MAP
    imports FLOAT
    imports BYTES
```

In `KWASM` rules, we use `#freshId ( Int )` to generate a fresh identifier based on the element index in the current module.
And we use `OptionalId` to handle the case where an identifier could be omitted.

```k
    syntax Identifier ::= #freshId ( Int )
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

```

### Text Format Conventions

The text format allows the use of symbolic identifiers in place of indices.
To store these identifiers into concrete indices, some grammar productions are indexed by an identifier context `I` as a synthesized attribute that records the declared identifiers in each index space.
To lookup an index from a `TextFormatIdx`, which may be either an identifer or a concrete index, we provide the operation `#ContextLookup`.
It resolves to a concrete index if the input is a concrete index.
If the the input is an identifier, the corresponding index is looked up in the supplied Map.

```k
    syntax Int ::= #ContextLookup ( Map , TextFormatIdx ) [function]
 // ----------------------------------------------------------------
    rule #ContextLookup(IDS:Map, I:Int) => I
    rule #ContextLookup(IDS:Map, ID:Identifier) => {IDS [ ID ]}:>Int
      requires ID in_keys(IDS)
```

### ElemSegment

Element Segment is a list of indices.
It is used when initializing a WebAssembly table, or used as the parameter of the `br_table` function.

```k
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

In some cases, an integer is optional, such as when either giving or omitting the max bound when defining a table or memory.
The sort `OptionalInt` provides this potentially "undefined" `Int`.

```k
    syntax OptionalInt ::= Int | ".Int"
 // -----------------------------------
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

Here we define the rules about integer parsing.
**TODO**: Symbolic reasoning for sort `WasmInt` not tested yet. In the future should investigate which direction the subsort should go. (`WasmInt` under `Int`/`Int` under `WasmInt`)

```k
    syntax WasmInt
    syntax String ::= #parseWasmIntToken ( WasmInt ) [function, functional, hook(STRING.token2string)]
    syntax Int    ::= #parseWasmInt      ( String )  [function]
                    | WasmInt
 // -------------------------
    rule #parseWasmInt(S) => String2Base(replaceFirst(S, "0x", ""), 16) requires findString(S, "0x", 0) =/=Int -1
    rule #parseWasmInt(S) => String2Base(                        S, 10) requires findString(S, "0x", 0)  ==Int -1
    rule WINT:WasmInt     => #parseWasmInt(replaceAll(#parseWasmIntToken(WINT), "_", "")) [macro]
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

In `K` all `Float` numbers are of 64-bits width by default, so we need to downcast a `f32` float to 32-bit manually.
The `#round` function casts a `f64` float to a `f32` float.
`f64` floats has 1 bit for the sign, 53 bits for the value and 11 bits for exponent.
`f32` floats has 1 bit for the sign, 23 bits for the value and 8 bits for exponent.

```k
    syntax FVal ::= #round ( FValType , Number ) [function]
 // -------------------------------------------------------
    rule #round( f64 , N:Float) => < f64 > roundFloat(N, 53, 11) [concrete]
    rule #round( f32 , N:Float) => < f32 > roundFloat(N, 24, 8)  [concrete]
    rule #round( f64 , N:Int  ) => < f64 >  Int2Float(N, 53, 11) [concrete]
    rule #round( f32 , N:Int  ) => < f32 >  Int2Float(N, 24, 8)  [concrete]
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

Wasm uses a different character escape rule with K, so we need to define the `unescape` function ourselves.

```k
    syntax String ::= unescape(String)              [function]
                    | unescape(String, Int, String) [function, klabel(unescapeAux)]
 // -------------------------------------------------------------------------------
    rule unescape(S         ) => unescape(S, 1, "")
    rule unescape(S, IDX, SB) => SB                 requires IDX ==Int lengthString(S) -Int 1
```

Unescaped characters just directly gets added to the output.
The escaped character starts with a "\" and followed by 2 hexdigits will be converted to a unescaped character before stored.

```k
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 1, SB +String substrString(S, IDX, IDX +Int 1))
      requires IDX <Int lengthString(S) -Int 1
       andBool substrString(S, IDX, IDX +Int 1) =/=K "\\"
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 3, SB +String chrChar(String2Base(substrString(S, IDX +Int 1, IDX +Int 3), 16)))
      requires IDX <Int lengthString(S) -Int 3
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool (findChar("0123456789abcdefABCDEF", substrString(S, IDX +Int 1, IDX +Int 2), 0) =/=Int -1 )
```

The characters "\t", "\n", "\r", """, "'", and "\" are interpreted as regular escaped ascii symbols.

```k
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 2, SB +String chrChar(String2Base("09", 16)))
      requires IDX <Int lengthString(S) -Int 2
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "t"
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 2, SB +String chrChar(String2Base("0A", 16)))
      requires IDX <Int lengthString(S) -Int 2
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "n"
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 2, SB +String chrChar(String2Base("0D", 16)))
      requires IDX <Int lengthString(S) -Int 2
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "r"
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 2, SB +String chrChar(String2Base("22", 16)))
      requires IDX <Int lengthString(S) -Int 2
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "\""
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 2, SB +String chrChar(String2Base("27", 16)))
      requires IDX <Int lengthString(S) -Int 2
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "'"
    rule unescape(S, IDX, SB) => unescape(S, IDX +Int 2, SB +String chrChar(String2Base("5C", 16)))
      requires IDX <Int lengthString(S) -Int 2
       andBool substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "\\"
```

Longer byte sequences can be encoded as escaped "Unicode", with `\u{<hexdigit>+}`.
The implementation is not correct for now because the UTF-8 encoding is not implemented.

```k
    syntax Int ::= #idxCloseBracket ( String, Int ) [function]
 // ----------------------------------------------------------
    rule #idxCloseBracket ( S, I ) => I                                requires substrString(S, I, I +Int 1)  ==String "}"
    rule #idxCloseBracket ( S, I ) => #idxCloseBracket ( S, I +Int 1 ) requires substrString(S, I, I +Int 1) =/=String "}"

    syntax Bytes ::= #encodeUTF8 ( Int, Endianness ) [function]
 // -----------------------------------------------------------
    rule #encodeUTF8 (I, E) => Int2Bytes(I, BE, Unsigned) requires I <=Int 127
    rule #encodeUTF8 (I, E) => Int2Bytes(((((I &Int 1984) >>Int 6) +Int 192) <<Int 8) +Int ((I &Int 63) +Int 128), BE, Unsigned)
      requires I >=Int 128   andBool I <=Int 2047
    rule #encodeUTF8 (I, E) => Int2Bytes(((((I &Int 61440) >>Int 12) +Int 224) <<Int 16) +Int ((((I &Int 4032) >>Int 6) +Int 128) <<Int 8) +Int ((I &Int 63) +Int 128), BE, Unsigned)
      requires I >=Int 2048  andBool I <=Int 65535
    rule #encodeUTF8 (I, E) => Int2Bytes(((((I &Int 1835008) >>Int 18) +Int 240) <<Int 24) +Int ((((I &Int 258048) >>Int 12) +Int 128) <<Int 16) +Int ((((I &Int 4032) >>Int6) +Int 128) <<Int 8) +Int ((I &Int 63) +Int 128), BE, Unsigned)
      requires I >=Int 65536 andBool I <=Int 1114111

    rule unescape(S, IDX, SB) => unescape(S, #idxCloseBracket(S, IDX) +Int 1, SB +String Bytes2String(#encodeUTF8(String2Base(substrString(S, IDX +Int 3, #idxCloseBracket(S, IDX +Int 3)), 16), BE)))
      requires substrString(S, IDX, IDX +Int 1) ==K "\\"
       andBool substrString(S, IDX +Int 1, IDX +Int 2) ==K "u"
```

Wasm memories can be initialized with a segment of data, sepcified as a string.
The string considered to represent the sequence of UTF-8 bytes that encode it.
The exception is for characters that are explicitly escaped which can represent bytes in hexadecimal form.
To avoid dealing with these data strings in K, we use a list of integers as an initializer.

```k
    syntax WasmString ::= ".WasmString"
    syntax String     ::= #parseWasmString ( WasmString ) [function, functional, hook(STRING.token2string)]
    syntax DataString ::= List{WasmString, ""}            [klabel(listWasmString)]
 // ------------------------------------------------------------------------------
```

`DataString`, as is defined in the wasm semantics, is a list of `WasmString`s.
`#concatDS` concatenates them together into a single string.
The strings to connect needs to be unescaped before concatenated, because the `unescape` function removes the quote sign `"` before and after each substring.

```k
    syntax String ::= #concatDS ( DataString )         [function]
                    | #concatDS ( DataString, String ) [function, klabel(#concatDSAux)]
 // -----------------------------------------------------------------------------------
    rule #concatDS ( DS ) => #concatDS ( DS, "" )
    rule #concatDS ( .DataString , S ) => S
    rule #concatDS (  WS DS      , S ) => #concatDS ( DS , S +String unescape(#parseWasmString(WS)) )
```

`#DS2Bytes` converts a `DataString` to a K builtin `Bytes`.

```k
    syntax Bytes ::= #DS2Bytes (DataString) [function]
 // --------------------------------------------------
    rule #DS2Bytes(DS) => String2Bytes(#concatDS(DS))
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
