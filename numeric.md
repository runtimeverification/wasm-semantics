Numeric Instructions
--------------------

In this file we implement the numeric rules specified in section `4.3 Numerics` of the offical WebAssembly specification.

```k
require "data.k"

module WASM-NUMERIC
    imports WASM-DATA

```

- `UnOp` takes one oprand and returns a `Val`.

```k
    syntax Val ::= IValType "." IUnOp Int   [klabel(intUnOp)  , function]
                 | FValType "." FUnOp Float [klabel(floatUnOp), function]
 // ---------------------------------------------------------------------
```

We have three unary operators for integers: `clz`, `ctz` and `popcnt`.

- `clz` counts the number of leading zero-bits, with 0 having all leading zero-bits.
- `ctz` counts the number of trailing zero-bits, with 0 having all trailing zero-bits.
- `popcnt` counts the number of non-zero bits.

Note: The actual `ctz` operator considers the integer 0 to have *all* zero-bits, whereas the `#ctz` helper function considers it to have *no* zero-bits, in order for it to be width-agnostic.

```k
    syntax IUnOp ::= "clz" | "ctz" | "popcnt"
 // -----------------------------------------
    rule ITYPE . clz    I1 => < ITYPE > #width(ITYPE) -Int #minWidth(I1)
    rule ITYPE . ctz    I1 => < ITYPE > #if I1 ==Int 0 #then #width(ITYPE) #else #ctz(I1) #fi
    rule ITYPE . popcnt I1 => < ITYPE > #popcnt(I1)

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

Before we implement the rule for `float`s, we first need to define 2 helper functions.

- `#isInfinityOrNaN` judges whether a `float` is infinity or NaN.
- `truncFloat` truncates a `float` by keeping its integer part and discards its fractional part.

```k
    syntax Bool ::= #isInfinityOrNaN ( Float ) [function]
 // -----------------------------------------------------
    rule #isInfinityOrNaN ( F ) => (isNaN(F) orBool isInfinite(F))

    syntax Float ::= truncFloat ( Float ) [function]
 // ------------------------------------------------
    rule truncFloat ( F ) => floorFloat (F) requires notBool signFloat(F)
    rule truncFloat ( F ) => ceilFloat  (F) requires         signFloat(F)
```

We have 7 unary operators for floats: `abs`, `neg`, `sqrt`, `floor`, `ceil`, `trunc` and `nearest`.

- `abs` returns the absolute value of the given float point number.
- `neg` returns the additive inverse value of the given float point number.
- `sqrt` returns the square root of the given float point number.
- `floor` returns the greatest integer less than or equal to the given float point number.
- `ceil` returns the least integer greater than or equal to the given float point number.
- `trunc` returns the integral value by discarding the fractional part of the given float.
- `nearest` returns the integral value that is nearest to the given float number; if two values are equally near, returns the even one.

```k
    syntax FUnOp ::= "abs" | "neg" | "sqrt" | "floor" | "ceil" | "trunc" | "nearest"
 // --------------------------------------------------------------------------------
    rule FTYPE . abs     F => < FTYPE >   absFloat (F)
    rule FTYPE . neg     F => < FTYPE >    --Float  F
    rule FTYPE . sqrt    F => < FTYPE >  sqrtFloat (F)
    rule FTYPE . floor   F => < FTYPE > floorFloat (F)
    rule FTYPE . ceil    F => < FTYPE >  ceilFloat (F)
    rule FTYPE . trunc   F => < FTYPE > truncFloat (F)
    rule FTYPE . nearest F => < FTYPE >  F                requires #isInfinityOrNaN (F)
    rule FTYPE . nearest F => #round(FTYPE, Float2Int(F)) requires (notBool #isInfinityOrNaN (F)) andBool (Float2Int(F) =/=Int 0 orBool notBool signFloat(F))
    rule FTYPE . nearest F => < FTYPE > -0.0              requires (notBool #isInfinityOrNaN (F)) andBool Float2Int(F) ==Int 0 andBool signFloat(F)
```

```k
endmodule
```
