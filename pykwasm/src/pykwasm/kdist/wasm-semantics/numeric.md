Numeric Instructions
--------------------

In this file we implement the numeric rules specified in section `4.3 Numerics` of the offical WebAssembly specification.

In the notations of some operators, `sx` is the signedness of the operator and could be either `s` (signed) or `u` (unsigned), which indicates whether the operands should be interpreted as signed integer or unsigned integer.

```k
requires "wasm-data.md"

module WASM-NUMERIC-SYNTAX

    syntax IUnOp ::= "clz"    [symbol(aClz)]
                   | "ctz"    [symbol(aCtz)]
                   | "popcnt" [symbol(aPopcnt)]
 // ---------------------------------------------------

    syntax FUnOp ::= "abs"     [symbol(aAbs)]
                   | "neg"     [symbol(aNeg)]
                   | "sqrt"    [symbol(aSqrt)]
                   | "floor"   [symbol(aFloor)]
                   | "ceil"    [symbol(aCeil)]
                   | "trunc"   [symbol(aTrunc)]
                   | "nearest" [symbol(aNearest)]
 // -----------------------------------------------------

    syntax ExtendS ::= "extend8_s"   [symbol(aExtend8_s)]
                     | "extend16_s"  [symbol(aExtend16_s)]
                     | "extend32_s"  [symbol(aExtend32_s)]
 // ---------------------------------------------------------------

    syntax IBinOp ::= "add" [symbol(intAdd)]
                    | "sub" [symbol(intSub)]
                    | "mul" [symbol(intMul)]
                    | "div_u" [symbol(intDiv_u)]
                    | "rem_u" [symbol(intRem_u)]
                    | "div_s" [symbol(intDiv_s)]
                    | "rem_s" [symbol(intRem_s)]
                    | "and" [symbol(intAnd)]
                    | "or" [symbol(intOr)]
                    | "xor" [symbol(intXor)]
                    | "shl" [symbol(intShl)]
                    | "shr_u" [symbol(intShr_u)]
                    | "shr_s" [symbol(intShr_s)]
                    | "rotl" [symbol(intRotl)]
                    | "rotr" [symbol(intRotr)]
 // --------------------------------------------------

    syntax FBinOp ::= "add" [symbol(floatAdd)]
                    | "sub" [symbol(floatSub)]
                    | "mul" [symbol(floatMul)]
                    | "div" [symbol(floatDiv)]
                    | "min" [symbol(floatMin)]
                    | "max" [symbol(floatMax)]
                    | "copysign" [symbol(floatCopysign)]
 // ------------------------------------------------------------

    syntax TestOp ::= "eqz" [symbol(aEqz)]
 // ----------------------------------------------

    syntax IRelOp ::= "eq" [symbol(intEq)]
                    | "ne" [symbol(intNe)]
                    | "lt_u" [symbol(intLt_u)]
                    | "gt_u" [symbol(intGt_u)]
                    | "lt_s" [symbol(intLt_s)]
                    | "gt_s" [symbol(intGt_s)]
                    | "le_u" [symbol(intLe_u)]
                    | "ge_u" [symbol(intGe_u)]
                    | "le_s" [symbol(intLe_s)]
                    | "ge_s" [symbol(intGe_s)]
 // --------------------------------------------------

    syntax FRelOp ::= "lt" [symbol(floatLt)]
                    | "gt" [symbol(floatGt)]
                    | "le" [symbol(floatLe)]
                    | "ge" [symbol(floatGe)]
                    | "eq" [symbol(floatEq)]
                    | "ne" [symbol(floatNe)]
 // ------------------------------------------------

    syntax CvtOp ::= Cvti32Op | Cvti64Op | Cvtf32Op | Cvtf64Op
 // ----------------------------------------------------------

    syntax Cvti32Op ::= "extend_i32_u" [symbol(aExtend_i32_u)]
                      | "extend_i32_s" [symbol(aExtend_i32_s)]
                      | "convert_i32_s" [symbol(aConvert_i32_s)]
                      | "convert_i32_u" [symbol(aConvert_i32_u)]
 // --------------------------------------------------------------------

    syntax Cvti64Op ::= "wrap_i64" [symbol(aWrap_i64)]
                      | "convert_i64_s" [symbol(aConvert_i64_s)]
                      | "convert_i64_u" [symbol(aConvert_i64_u)]
 // --------------------------------------------------------------------

    syntax Cvtf32Op ::= "promote_f32" [symbol(aPromote_f32)]
                      | "trunc_f32_s" [symbol(aTrunc_f32_s)]
                      | "trunc_f32_u" [symbol(aTrunc_f32_u)]
 // ----------------------------------------------------------------

    syntax Cvtf64Op ::= "demote_f64" [symbol(aDemote_f64)]
                      | "trunc_f64_s" [symbol(aTrunc_f64_s)]
                      | "trunc_f64_u" [symbol(aTrunc_f64_u)]
 // ----------------------------------------------------------------

endmodule

module WASM-NUMERIC
    imports WASM-NUMERIC-SYNTAX
    imports WASM-DATA

```

### Unary Operators

`*UnOp` takes one oprand and returns a `Val`.

```k
    syntax Val ::= IValType "." IUnOp   Int   [symbol(intUnOp)    , function, total]
                 | FValType "." FUnOp   Float [symbol(floatUnOp)  , function]
                 | IValType "." ExtendS Int   [symbol(extendSUnOp), function, total]
 // ---------------------------------------------------------------------------
```

#### Unary Operators for Integers

There three unary operators for integers: `clz`, `ctz` and `popcnt`.

- `clz` counts the number of leading zero-bits, with 0 having all leading zero-bits.
- `ctz` counts the number of trailing zero-bits, with 0 having all trailing zero-bits.
- `popcnt` counts the number of non-zero bits.

Note: The actual `ctz` operator considers the integer 0 to have *all* zero-bits, whereas the `#ctz` helper function considers it to have *no* zero-bits, in order for it to be width-agnostic.

```k
    rule ITYPE . clz    I1 => < ITYPE > #width(ITYPE) -Int #minWidth(I1)
      requires 0 <=Int I1
    rule ITYPE . ctz    I1 => < ITYPE > #if I1 ==Int 0 #then #width(ITYPE) #else #ctz(I1) #fi
      requires 0 <=Int I1
    rule ITYPE . popcnt I1 => < ITYPE > #popcnt(I1)
      requires 0 <=Int I1
    rule _:IValType . _:IUnOp I1 => undefined
      requires I1 <Int 0

    syntax Int ::= #minWidth ( Int ) [function, total]
                 | #ctz      ( Int ) [function, total]
                 | #popcnt   ( Int ) [function, total]
 // -------------------------------------------
    rule #minWidth(N) => 0                                                           requires N ==Int 0
    rule #minWidth(N) => 1 +Int #minWidth(N >>Int 1)                                 requires N >Int 0
    rule [minWidth-invalid]:
         #minWidth(N) => -1                                                          requires N <Int 0

    rule #ctz(N) => 0                                                                requires N ==Int 0
    rule #ctz(N) => 0                                                                requires N >Int 0 andBool N &Int 1 ==Int 1
    rule #ctz(N) => 1 +Int #ctz(N >>Int 1)                                           [owise]
    rule [ctz-invalid]:
         #ctz(N) => -1                                                               requires N <Int 0

    rule #popcnt(N) => 0                                                             requires N ==Int 0
    rule #popcnt(N) => #bool(N &Int 1 ==Int 1) +Int #popcnt(N >>Int 1)               requires N >Int 0
    rule [popcnt-invalid]:
         #popcnt(N) => -1                                                            requires N <Int 0
```

Before we implement the rule for float point numbers, we first need to define a helper function.

- `#isInfinityOrNaN` judges whether a `float` is infinity or NaN.

```k
    syntax Bool ::= #isInfinityOrNaN ( Float ) [function]
 // -----------------------------------------------------
    rule #isInfinityOrNaN ( F ) => (isNaN(F) orBool isInfinite(F))
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
    rule FTYPE . abs     F => < FTYPE >   absFloat (F)
    rule FTYPE . neg     F => < FTYPE >    --Float  F
    rule FTYPE . sqrt    F => < FTYPE >  sqrtFloat (F)
    rule FTYPE . floor   F => < FTYPE > floorFloat (F)
    rule FTYPE . ceil    F => < FTYPE >  ceilFloat (F)
    rule FTYPE . trunc   F => < FTYPE > truncFloat (F)
    rule FTYPE . nearest F => < FTYPE >  F                requires          #isInfinityOrNaN (F)
    rule FTYPE . nearest F => #round(FTYPE, Float2Int(F)) requires (notBool #isInfinityOrNaN (F)) andBool notBool (Float2Int(F) ==Int 0 andBool signFloat(F))
    rule FTYPE . nearest F => < FTYPE > -0.0              requires (notBool #isInfinityOrNaN (F)) andBool          Float2Int(F) ==Int 0 andBool signFloat(F)
```

#### Sign-extension Operators for Integers

There are 3 sign-extension operators for integers.

- `extend8_s`
- `extend16_s`
- `extend32_s`

```k
    rule ITYPE . extend8_s I  => #extends(ITYPE, i8, #wrap(1, I)) 
    rule ITYPE . extend16_s I => #extends(ITYPE, i16, #wrap(2, I))
    rule ITYPE . extend32_s I => #extends(ITYPE, i32, #wrap(4, I))
```

### Binary Operators

`*BinOp` takes two oprands and returns a `Val`.
A `*BinOp` operator always produces a result of the same type as its operands.

```k
    syntax Val ::= IValType "." IBinOp Int   Int   [symbol(intBinOp), function, total]
                 | FValType "." FBinOp Float Float [symbol(floatBinOp), function]
 // -----------------------------------------------------------------------------
```

Make intBinOp total

```k

rule _:IValType . _:IBinOp _:Int _:Int => undefined [owise]

```

#### Binary Operators for Integers

There are 12 binary operators for integers: `add`, `sub`, `mul`, `div_sx`, `rem_sx`, `and`, `or`, `xor`, `shl`, `shr_sx`, `rotl`, `rotr`.


- `add` returns the result of adding up the 2 given integers modulo 2^N.
- `sub` returns the result of substracting the second oprand from the first oprand modulo 2^N.
- `mul` returns the result of multiplying the 2 given integers modulo 2^N.

`add`, `sub`, and `mul` are given semantics by lifting the correct K operators through the `#chop` function.

```k
    rule ITYPE:IValType . add I1 I2 => #chop(< ITYPE > I1 +Int I2)
    rule ITYPE:IValType . sub I1 I2 => #chop(< ITYPE > I1 -Int I2)
    rule ITYPE:IValType . mul I1 I2 => #chop(< ITYPE > I1 *Int I2)
```

- `div_sx` returns the result of dividing the first operand by the second oprand, truncated toward zero.
- `rem_sx` returns the remainder of dividing the first operand by the second oprand.

`div_sx` and `rem_sx` have extra side-conditions about when they are defined or not.

```k
    rule  ITYPE . div_u  I1 I2 => < ITYPE > I1 /Int I2 requires I2 =/=Int 0
    rule _ITYPE . div_u _I1 I2 => undefined            requires I2  ==Int 0

    rule  ITYPE . rem_u  I1 I2 => < ITYPE > I1 %Int I2 requires I2 =/=Int 0
    rule _ITYPE . rem_u _I1 I2 => undefined            requires I2  ==Int 0

    rule ITYPE . div_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2))
      requires I2 =/=Int 0
       andBool definedSigned(ITYPE, I1) andBool definedSigned(ITYPE, I2)
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) =/=Int #pow1(ITYPE)

    rule _ITYPE . div_s _I1 I2 => undefined
      requires I2 ==Int 0

    rule ITYPE . div_s I1 I2 => undefined
      requires I2 =/=Int 0
       andBool #signed(ITYPE, I1) /Int #signed(ITYPE, I2) ==Int #pow1(ITYPE)

    rule ITYPE . rem_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2))
      requires I2 =/=Int 0
       andBool definedSigned(ITYPE, I1) andBool definedSigned(ITYPE, I2)

    rule _ITYPE . rem_s _I1 I2 => undefined
      requires I2 ==Int 0
```

- `and` returns the bitwise conjunction of the 2 given floats.
- `or` returns the bitwise disjunction of the 2 given floats.
- `xor` returns the bitwise exclusive disjunction of the 2 given floats.

Of the bitwise operators, `and` will not overflow, but `or` and `xor` could.
These simply are the lifted K operators.

```k
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
    rule ITYPE . shl   I1 I2 => #chop(< ITYPE > I1 <<Int (I2 %Int #width(ITYPE)))
    rule ITYPE . shr_u I1 I2 =>       < ITYPE > I1 >>Int (I2 %Int #width(ITYPE))

    rule ITYPE . shr_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) >>Int (I2 %Int #width(ITYPE)))
      requires definedSigned(ITYPE, I1)
```

- `rotl` returns the result of rotating the first operand left by k bits, in which k is the second operand modulo N.
- `rotr` returns the result of rotating the first operand right by k bits, in which k is the second operand modulo N.

The rotation operators `rotl` and `rotr` do not have appropriate K builtins, and so are built with a series of shifts.

```k
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
    rule FTYPE:FValType . add      F1 F2 => < FTYPE > F1 +Float F2
    rule FTYPE:FValType . sub      F1 F2 => < FTYPE > F1 -Float F2
    rule FTYPE:FValType . mul      F1 F2 => < FTYPE > F1 *Float F2
    rule FTYPE          . div      F1 F2 => < FTYPE > F1 /Float F2
    rule FTYPE          . min      F1 F2 => < FTYPE > minFloat (F1, F2)
    rule FTYPE          . max      F1 F2 => < FTYPE > maxFloat (F1, F2)
    rule FTYPE          . copysign F1 F2 => < FTYPE > F1                requires signFloat (F1) ==Bool  signFloat (F2)
    rule FTYPE          . copysign F1 F2 => < FTYPE > --Float  F1       requires signFloat (F1) =/=Bool signFloat (F2)
```

### Test Operators

Test operations consume one operand and produce a bool, which is an `i32` value.
There is no test operation for float numbers.

```k
    syntax Val ::= IValType "." TestOp Int [symbol(intTestOp), function, total]
 // --------------------------------------------------------------------
```

#### Test Operators for Integers

- `eqz` checks wether its operand is 0.

```k
    rule _ . eqz I => < i32 > #bool(I ==Int 0)
```

### Relationship Operators

Relationship Operators consume two operands and produce a bool, which is an `i32` value.

```k
    syntax Val ::= IValType "." IRelOp Int   Int   [symbol(intRelOp), function, total]
                 | FValType "." FRelOp Float Float [symbol(floatRelOp), function]
 // -----------------------------------------------------------------------------
```

Make intRelOp total.

```k

rule _:IValType . _:IRelOp _:Int _:Int => undefined  [owise]

```

### Relationship Operators for Integers

There are 6 relationship operators for integers: `eq`, `ne`, `lt_sx`, `gt_sx`, `le_sx` and `ge_sx`.

- `eq` returns 1 if the 2 given integers are equal, 0 otherwise.
- `eq` returns 1 if the 2 given integers are not equal, 0 otherwise.

```k
    rule _:IValType . eq I1 I2 => < i32 > #bool(I1 ==Int  I2)
    rule _:IValType . ne I1 I2 => < i32 > #bool(I1 =/=Int I2)
```

- `lt_sx` returns 1 if the first oprand is less than the second opeand, 0 otherwise.
- `gt_sx` returns 1 if the first oprand is greater than the second opeand, 0 otherwise.

```k
    rule _     . lt_u I1 I2 => < i32 > #bool(I1 <Int I2)
    rule _     . gt_u I1 I2 => < i32 > #bool(I1 >Int I2)

    rule ITYPE . lt_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) <Int #signed(ITYPE, I2))
      requires definedSigned(ITYPE, I1) andBool definedSigned(ITYPE, I2)
    rule ITYPE . gt_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) >Int #signed(ITYPE, I2))
      requires definedSigned(ITYPE, I1) andBool definedSigned(ITYPE, I2)
```

- `le_sx` returns 1 if the first oprand is less than or equal to the second opeand, 0 otherwise.
- `ge_sx` returns 1 if the first oprand is greater than or equal to the second opeand, 0 otherwise.

```k
    rule _     . le_u I1 I2 => < i32 > #bool(I1 <=Int I2)
    rule _     . ge_u I1 I2 => < i32 > #bool(I1 >=Int I2)

    rule ITYPE . le_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) <=Int #signed(ITYPE, I2))
      requires definedSigned(ITYPE, I1) andBool definedSigned(ITYPE, I2)
    rule ITYPE . ge_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) >=Int #signed(ITYPE, I2))
      requires definedSigned(ITYPE, I1) andBool definedSigned(ITYPE, I2)
```

### Relationship Operators for Floats

There are 6 relationship operators for floats: `eq`, `ne`, `lt`, `gt`, `le` and `ge`.

- `eq` returns 1 if the 2 given floats are equal, 0 otherwise.
- `ne` returns 1 if the 2 given floats are not equal, 0 otherwise.
- `lt` returns 1 if the first oprand is less than the second opeand, 0 otherwise.
- `gt` returns 1 if the first oprand is greater than the second opeand, 0 otherwise.
- `le` returns 1 if the first oprand is less than or equal to the second opeand, 0 otherwise.
- `ge` returns 1 if the first oprand is greater than or equal to the second opeand, 0 otherwise.

```k
    rule _          . lt F1 F2 => < i32 > #bool(F1 <Float   F2)
    rule _          . gt F1 F2 => < i32 > #bool(F1 >Float   F2)
    rule _          . le F1 F2 => < i32 > #bool(F1 <=Float  F2)
    rule _          . ge F1 F2 => < i32 > #bool(F1 >=Float  F2)
    rule _:FValType . eq F1 F2 => < i32 > #bool(F1 ==Float  F2)
    rule _:FValType . ne F1 F2 => < i32 > #bool(F1 =/=Float F2)
```

### Conversion Operators

Conversion operators always take a single argument as input and cast it to another type.
The operators are further broken down into subsorts for their input type, for simpler type-checking.

```k
    syntax Val ::= ValType "." CvtOp Number [symbol(numberCvtOp), function, total]
 // -----------------------------------------------------------------------
    rule _:ValType . _:CvtOp _:Number => undefined      [owise]
```

There are 7 conversion operators: `wrap`, `extend`, `trunc`, `convert`, `demote` ,`promote` and `reinterpret`.

- `wrap` takes an `i64` value, cuts of the 32 most significant bits and returns an `i32` value.

```k
    rule i32 . wrap_i64 I => #chop(< i32 > I)
```

- `extend` takes an `i32` type value, converts its type into the `i64` and returns the result.

```k
    rule i64 . extend_i32_u I:Int => < i64 > I
    rule i64 . extend_i32_s I:Int => #extends(i64, i32, I)

    syntax Val ::= #extends(to: IValType, width: IWidth, val: Int)    [function, total, symbol(extends)]
 // ----------------------------------------------------------------------------------------------------
    rule #extends(ITYPE, WIDTH, VAL) => < ITYPE > #unsigned(ITYPE, #signed(WIDTH, VAL))
      requires #numBytes(WIDTH) <=Int #numBytes(ITYPE)
       andBool definedSigned(WIDTH, VAL)

    rule #extends(_, _, _) => undefined     [owise]

```

- `convert` takes an `int` type value and convert it to the nearest `float` type value.

```k
    rule FTYPE . convert_i32_s I:Int => #round( FTYPE , #signed(i32, I) )  requires definedSigned(i32, I)
    rule FTYPE . convert_i32_u I:Int => #round( FTYPE , I )

    rule FTYPE . convert_i64_s I:Int => #round( FTYPE , #signed(i64, I) )  requires definedSigned(i32, I)
    rule FTYPE . convert_i64_u I:Int => #round( FTYPE , I )
```

- `demote` turns an `f64` type value to the nearest `f32` type value.
- `promote` turns an `f32` type value to the nearest `f64` type value:

```k
    rule f64 . promote_f32 F => #round( f64 , F )

    rule f32 . demote_f64  F => #round( f32 , F )
```

- `trunc` first truncates a float value, then convert the result to the nearest ineger value.

```k
    rule ITYPE . trunc_f32_s F => undefined
      requires #isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow1(ITYPE)) orBool (0 -Int Float2Int(truncFloat(F)) >Int #pow1 (ITYPE))
    rule ITYPE . trunc_f32_u F => undefined
      requires #isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow (ITYPE)) orBool (Float2Int(truncFloat(F)) <Int 0)

    rule ITYPE . trunc_f32_s F => <ITYPE> #unsigned(ITYPE, Float2Int(truncFloat(F)))
      requires notBool (#isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow1(ITYPE)) orBool (0 -Int Float2Int(truncFloat(F)) >Int #pow1 (ITYPE)))
    rule ITYPE . trunc_f32_u F => <ITYPE> Float2Int(truncFloat(F))
      requires notBool (#isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow (ITYPE)) orBool (Float2Int(truncFloat(F)) <Int 0))

    rule ITYPE . trunc_f64_s F => undefined
      requires #isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow1(ITYPE)) orBool (0 -Int Float2Int(truncFloat(F)) >Int #pow1 (ITYPE))
    rule ITYPE . trunc_f64_u F => undefined
      requires #isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow (ITYPE)) orBool (Float2Int(truncFloat(F)) <Int 0)

    rule ITYPE . trunc_f64_s F => <ITYPE> #unsigned(ITYPE, Float2Int(truncFloat(F)))
      requires notBool (#isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow1(ITYPE)) orBool (0 -Int Float2Int(truncFloat(F)) >Int #pow1 (ITYPE)))
    rule ITYPE . trunc_f64_u F => <ITYPE> Float2Int(truncFloat(F))
      requires notBool (#isInfinityOrNaN (F) orBool (Float2Int(truncFloat(F)) >=Int #pow (ITYPE)) orBool (Float2Int(truncFloat(F)) <Int 0))
```

**TODO**: Unimplemented: `inn.reinterpret_fnn`,  `fnn.reinterpret_inn`.

```k
endmodule
```
