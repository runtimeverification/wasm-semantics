WASM Data
=========

```k
require "domains.k"

module WASM-DATA
   imports DOMAINS
   imports BYTES
   imports COLLECTIONS
```

Layout
------

WASM allows for block comments using `(;` and `;)`, and line comments using `;;`.
Additionally, white-space is skipped/ignored.

```k
    syntax #Layout ::= r"(\\(;([^;]|(;+([^;\\)])))*;\\))"
                     | r"(;;[^\\n\\r]*)"
                     | r"([\\ \\n\\r\\t])"
 // --------------------------------------
```

WASM Types
----------

### Base Types

WASM has four basic types, for 32 and 64 bit integers and floats.

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
    syntax Int ::= #width ( IValType ) [function]
 // ---------------------------------------------
    rule #width(i32) => 32
    rule #width(i64) => 64
```

`2 ^Int 32` and `2 ^Int 64` are used often enough to warrant providing helpers for them.

```k
    syntax Int ::= #pow  ( IValType ) [function] /* 2 ^Int #width(T)          */
                 | #pow1 ( IValType ) [function] /* 2 ^Int (#width(T) -Int 1) */
 // ----------------------------------------------------------------------------
    rule #pow1(i32) => 2147483648
    rule #pow (i32) => 4294967296
    rule #pow1(i64) => 9223372036854775808
    rule #pow (i64) => 18446744073709551616
```

Values
------

### Basic Values

WASM values are either integers or floating-point numbers, of 32- or 64-bit widths.

```k
    syntax Number ::= Int | Float
 // -----------------------------
```

Proper values are numbers annotated with their types.

```k
    syntax IVal ::= "<" IValType ">" Int
    syntax FVal ::= "<" FValType ">" Float
    syntax  Val ::= "<"  ValType ">" Number
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

```k
    syntax IVal ::= #chop ( IVal ) [function]
 // -----------------------------------------
    rule #chop(< ITYPE > N) => < ITYPE > (N modInt #pow(ITYPE))
```

### Signed Interpretation

Functions `#signed` and `#unsigned` allow for easier operation on twos-complement numbers.

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

WASM is a stack-machine, so here we provide the stack to operate over.
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
Byte Map
--------

WASM memory is held as a bounded finite maps.
We are using the polymorphic `Map` sort for this byte maps.

-   `BM [ N := BS ]` assigns a contiguous chunk of `BS` to `BM` starting at position $N$.
-   `#asMapBytes` converts `Bytes` to a `Map`.
-   `#range(M, START, WIDTH)` reads off `WIDTH` elements from `BM` beginning at position $START$ (padding with zeros as needed).

```k
    syntax Map ::= Map "[" Int ":=" Bytes "]" [function]
 // --------------------------------------------------------
    rule BM[ N := nilBytes ] => BM
    rule BM[ N := B : BS     ] => (BM[N <- B])[N +Int 1 := BS] //[concrete]

    syntax Map ::= #asMapBytes ( Bytes ) [function]
 // -------------------------------------------------------
    rule #asMapBytes(BS:Bytes) => .Map [ 0 := BS ]

    syntax Bytes ::= #range ( Map , Int , Int )        [function]
    syntax Bytes ::= #range ( Map , Int , Int , Bytes) [function, klabel(#rangeAux)]
 // ----------------------------------------------------------------------------------------
    rule #range(BM:Map, START, WIDTH) => #range(BM, START +Int WIDTH -Int 1, WIDTH, nilBytes) //[concrete]

    rule #range(BM,           END, WIDTH, BS) => BS                                           requires WIDTH ==Int 0
    rule #range(BM,           END, WIDTH, BS) => #range(BM, END -Int 1, WIDTH -Int 1, 0 : BS) requires (WIDTH >Int 0) andBool notBool END in_keys(BM)
    rule #range(END |-> B BM, END, WIDTH, BS) => #range(BM, END -Int 1, WIDTH -Int 1, B : BS) requires (WIDTH >Int 0)
```

-   `#removeZeros` removes any entries in a map with zero values.

```k
    syntax Map ::= #removeZeros ( Map ) [function]
                 | #removeZeros ( List , Map ) [function, klabel(#removeZerosAux)]
 // ------------------------------------------------------------------------------
    rule #removeZeros( M )                                   => #removeZeros(Set2List(keys(M)), M)
    rule #removeZeros( .List, .Map )                         => .Map
    rule #removeZeros( ListItem(KEY) L, KEY |-> 0 REST )     => #removeZeros(L, REST)
    rule #removeZeros( ListItem(KEY) L, KEY |-> VALUE REST ) => KEY |-> VALUE #removeZeros(L, REST) requires VALUE =/=K 0
```

-   `#lookup` looks up a key in a map and returns 0 if the key doesn't exist, otherwise returning its value.

```k
/*    syntax Byte ::= #lookup ( Map , Int ) [function]
 // -----------------------------------------------
    rule #lookup( (KEY |-> VAL) M, KEY ) => VAL                               //[concrete]
    rule #lookup(               M, KEY ) => 0 requires notBool KEY in_keys(M) //[concrete]

    syntax Map ::= #update ( Map , Int , Byte ) [function]
 // -----------------------------------------------
    rule #update( M, KEY, VAL ) => M [ KEY <- VAL ] //[concrete]
*/

    syntax Strings ::= List{String, ""}
    syntax String  ::= "Flatten" "(" Strings ")"
    rule Flatten(.String) => ""
    rule Flatten(A:String) => A
    rule Flatten(A:String BC:Strings) => A +String Flatten(BC)
    
    syntax Int ::= "pow16"
    rule pow16  => 65536 [macro]

endmodule
```
