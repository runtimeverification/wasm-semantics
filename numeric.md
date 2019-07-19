Numeric Instructions
--------------------

In this file we implement the numeric rules specified in section `4.3 Numerics` of the offical WebAssembly specification.

```k
require "data.k"

module WASM-NUMERIC
    imports WASM-DATA

```

### Unary Operators

`*UnOp` takes one oprand and returns a `Val`.

```k
    syntax Val ::= IValType "." IUnOp Int   [klabel(intUnOp)  , function]
                 | FValType "." FUnOp Float [klabel(floatUnOp), function]
 // ---------------------------------------------------------------------
```

#### Unary Operators for Integers

There three unary operators for integers: `clz`, `ctz` and `popcnt`.

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

Before we implement the rule for float point numbers, we first need to define 2 helper functions.

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

#### Unary Operators for Floats

There are 7 unary operators for floats: `abs`, `neg`, `sqrt`, `floor`, `ceil`, `trunc` and `nearest`.

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

### Binary Operators

`*BinOp` takes two oprands and returns a `Val`.
A `*BinOp` operator always produces a result of the same type as its operands.

```k
    syntax Val ::= IValType "." IBinOp Int   Int   [klabel(intBinOp)  , function]
                 | FValType "." FBinOp Float Float [klabel(floatBinOp), function]
 // -----------------------------------------------------------------------------
```

#### Binary Operators for Integers

There are 12 binary operators for integers: `add`, `sub`, `mul`, `div_sx`, `rem_sx`, `and`, `or`, `xor`, `shl`, `shr_sx`, `rotl`, `rotr`.

In the operators above, `sx` indicates the signedness of the operator and could be either `s` (signed) or `u` (unsigned).
It decides whether the operands should be interpreted as signed integer or unsigned integer.

- `add` returns the result of adding up the 2 given integers modulo 2^N.
- `sub` returns the result of substracting the second oprand from the first oprand modulo 2^N.
- `mul` returns the result of multiplying the 2 given integers modulo 2^N.

`add`, `sub`, and `mul` are given semantics by lifting the correct K operators through the `#chop` function.

```k
    syntax IBinOp ::= "add" | "sub" | "mul"
 // ---------------------------------------
    rule ITYPE:IValType . add I1 I2 => #chop(< ITYPE > I1 +Int I2)
    rule ITYPE:IValType . sub I1 I2 => #chop(< ITYPE > I1 -Int I2)
    rule ITYPE:IValType . mul I1 I2 => #chop(< ITYPE > I1 *Int I2)
```

- `div_sx` returns the result of dividing the first operand by the second oprand, truncated toward zero.
- `rem_sx` returns the remainder of dividing the first operand by the second oprand.

`div_sx` and `rem_sx` have extra side-conditions about when they are defined or not.

```k
    syntax IBinOp ::= "div_u" | "rem_u"
 // -----------------------------------
    rule ITYPE . div_u I1 I2 => < ITYPE > I1 /Int I2 requires I2 =/=Int 0
    rule ITYPE . div_u I1 I2 => undefined            requires I2  ==Int 0

    rule ITYPE . rem_u I1 I2 => < ITYPE > I1 %Int I2 requires I2 =/=Int 0
    rule ITYPE . rem_u I1 I2 => undefined            requires I2  ==Int 0

    syntax IBinOp ::= "div_s" | "rem_s"
 // -----------------------------------
    rule ITYPE . div_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2))
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) =/=Int #pow1(ITYPE)

    rule ITYPE . div_s I1 I2 => undefined
      requires I2 ==Int 0

    rule ITYPE . div_s I1 I2 => undefined
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) ==Int #pow1(ITYPE)

    rule ITYPE . rem_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2))
      requires I2 =/=Int 0

    rule ITYPE . rem_s I1 I2 => undefined
      requires I2 ==Int 0
```

- `and` returns the bitwise conjunction of the 2 given floats.
- `or` returns the bitwise disjunction of the 2 given floats.
- `xor` returns the bitwise exclusive disjunction of the 2 given floats.

Of the bitwise operators, `and` will not overflow, but `or` and `xor` could.
These simply are the lifted K operators.

```k
    syntax IBinOp ::= "and" | "or" | "xor"
 // --------------------------------------
    rule ITYPE . and I1 I2 =>       < ITYPE > I1 &Int   I2
    rule ITYPE . or  I1 I2 => #chop(< ITYPE > I1 |Int   I2)
    rule ITYPE . xor I1 I2 => #chop(< ITYPE > I1 xorInt I2)
```

- `shl` returns the result of shifting the first operand left by k bits modulo 2^N, in which k is the second operand modulo N.
- `shr_u` returns the result of shifting the first operand right by k bits, and extended with 0 bits.
- `shr_s` returns the result of shifting the first operand right by k bits, and  extended with the most significant bit of the original value

Similarly, K bitwise shift operators are lifted for `shl` and `shr_u`.
Careful attention is made for the signed version `shr_s`.

```k
    syntax IBinOp ::= "shl" | "shr_u" | "shr_s"
 // -------------------------------------------
    rule ITYPE . shl   I1 I2 => #chop(< ITYPE > I1 <<Int (I2 %Int #width(ITYPE)))
    rule ITYPE . shr_u I1 I2 =>       < ITYPE > I1 >>Int (I2 %Int #width(ITYPE))

    rule ITYPE . shr_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) >>Int (I2 %Int #width(ITYPE)))
```

- `rotl` returns the result of rotating the first operand left by k bits, in which k is the second operand modulo N.
- `rotr` returns the result of rotating the first operand right by k bits, in which k is the second operand modulo N.

The rotation operators `rotl` and `rotr` do not have appropriate K builtins, and so are built with a series of shifts.

```k
    syntax IBinOp ::= "rotl" | "rotr"
 // ---------------------------------
    rule ITYPE . rotl I1 I2 => #chop(< ITYPE > (I1 <<Int (I2 %Int #width(ITYPE))) +Int (I1 >>Int (#width(ITYPE) -Int (I2 %Int #width(ITYPE)))))
    rule ITYPE . rotr I1 I2 => #chop(< ITYPE > (I1 >>Int (I2 %Int #width(ITYPE))) +Int (I1 <<Int (#width(ITYPE) -Int (I2 %Int #width(ITYPE)))))
```

#### Binary Operators for Floats

There are 7 binary operators for integers: `add`, `sub`, `mul`, `div`, `min`, `max`, `copysign`.

- `add` returns the result of adding the 2 given floats and rounded to the nearest representable value.
- `sub` returns the result of substracting the second oprand from the first oprand and rounded to the nearest representable value.
- `mul` returns the result of multiplying the 2 given floats and rounded to the nearest representable value.
- `div` returns the result of dividing the first oprand by the second oprand and rounded to the nearest representable value.
- `min` returns the smaller value of the 2 given floats.
- `max` returns the bigger value of the 2 given floats.
- `copysign` returns the first oprand if the 2 given floats have the same sign, otherwise returns the first oprand with negated sign.

Note: For operators that defined under both sorts `IXXOp` and `FXXOp`, we need to give it a `klabel` and define it as a `symbol` to prevent parsing issue.

```k
    syntax FBinOp ::= "add" [klabel(floatAdd), symbol]
                    | "sub" [klabel(floatSub), symbol]
                    | "mul" [klabel(floatMul), symbol]
                    | "div"
                    | "min"
                    | "max"
                    | "copysign"
 // ----------------------------
    rule FTYPE:FValType . add      F1 F2 => < FTYPE > F1 +Float F2
    rule FTYPE:FValType . sub      F1 F2 => < FTYPE > F1 -Float F2
    rule FTYPE:FValType . mul      F1 F2 => < FTYPE > F1 *Float F2
    rule FTYPE          . div      F1 F2 => < FTYPE > F1 /Float F2
    rule FTYPE          . min      F1 F2 => < FTYPE > minFloat (F1, F2)
    rule FTYPE          . max      F1 F2 => < FTYPE > maxFloat (F1, F2)
    rule FTYPE          . copysign F1 F2 => < FTYPE > F1                requires signFloat (F1) ==Bool  signFloat (F2)
    rule FTYPE          . copysign F1 F2 => < FTYPE > --Float  F1       requires signFloat (F1) =/=Bool signFloat (F2)
```

```k
endmodule
```
