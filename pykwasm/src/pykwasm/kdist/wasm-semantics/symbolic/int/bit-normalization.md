Int bit normalization
=====================

The normal form of an int expression based on bit operations is defined by:

```
or-operand  = ((non-bit-int-expression &Int mask) >>Int shift)
            | ((non-bit-int-expression &Int mask) <<Int shift)
bit-based-expression = or-operand |Int or-operand |Int ...
```

where any of the mask and the shift may be missing, and the int-expression
may have only one or-operand.

In `&Int` and `|Int` expressions, the concrete operand (if any), is second.

Additionally, `bit-expression modInt power-of-2` is transformed to a bit expression.

The normalization below works properly if
* In `A &Int B` and `A |Int B`, at least one of the operands is concrete
* The second operand of `A >>Int B` and `A <<Int B` is concrete and less than 64

```k
module WASM-INT-BIT-NORMALIZATION-LEMMAS  [symbolic]
    imports CEILS-SYNTAX
    imports INT
    imports WASM-INT-COMMON

    rule _A &Int 0 => 0
    rule A &Int B => A
        requires 0 <=Int A
          andBool A <=Int B
          andBool isFullMask(B)
        [simplification, concrete(B)]
    rule (A &Int B) => 0
        requires 0 <=Int A
          andBool (
              ( A <=Int fullMask(8)
                andBool B &Int fullMask(8) ==Int 0
              )
              orBool ( A <=Int fullMask(16)
                andBool B &Int fullMask(16) ==Int 0
              )
              orBool ( A <=Int fullMask(32)
                andBool B &Int fullMask(32) ==Int 0
              )
          )
        [simplification]
    rule A &Int B => B &Int A
        [simplification, concrete(A), symbolic(B)]
    rule (A &Int B) &Int C => A &Int (B &Int C)
        [simplification, concrete(B, C)]
    rule A &Int (B &Int C) => (A &Int B) &Int C
        [simplification, symbolic(A, B)]

    rule (A <<IntTotal B) &Int M
          => (A &Int (M >>Int B)) <<IntTotal B
        requires 0 <=Int B
            andBool 1 <<Int B <=Int M +Int 1
        [simplification, concrete(M, B)]
    rule (_A <<IntTotal B) &Int M => 0
        requires 0 <=Int M
            andBool 0 <=Int B
            andBool M <Int (1 <<Int B)
        [simplification]
    rule (A >>IntTotal B) &Int M
          => (A &Int (M <<Int B)) >>IntTotal B
        requires 0 <=Int B
        [simplification, concrete(M, B)]

    rule (A <<IntTotal 0) => A
        [simplification]
    rule (A >>IntTotal 0) => A
        [simplification]
    rule (A >>IntTotal B) => 0
        requires 0 <=Int A andBool 0 <Int B andBool A <=Int fullMask(B)
        [simplification, concrete(B)]
    rule (A >>IntTotal B) >>IntTotal C => A >>IntTotal (B +Int C)
        [simplification, concrete(B, C)]
    rule (A <<IntTotal B) <<IntTotal C => A <<IntTotal (B +Int C)
        [simplification, concrete(B, C)]
    rule (A <<IntTotal B) >>IntTotal C => A <<IntTotal (B -Int C)
        requires C <=Int B
        [simplification, concrete(B, C)]
    rule (A <<IntTotal B) >>IntTotal C => A >>IntTotal (C -Int B)
        requires B <Int C
        [simplification, concrete(B, C)]
    rule (A >>IntTotal B) <<IntTotal C
        => (A >>IntTotal (B -Int C))
          &Int (fullMask(64) -Int fullMask(C))
        requires 0 <=Int C
            andBool C <=Int B
            andBool B <=Int 64
            andBool 0 <=Int A
            andBool A <Int (1 <<Int 64)
        [simplification, concrete(B, C)]
    rule (A >>IntTotal B) <<IntTotal C
        => (A <<IntTotal (C -Int B))
          &Int (fullMask(64) -Int fullMask(C))
        requires 0 <=Int B
            andBool B <Int C
            andBool C <=Int 64
            andBool 0 <=Int A
            andBool A <Int (1 <<Int (64 -Int (C -Int B)))
        [simplification, concrete(B, C)]

    rule A |Int 0 => A
        [simplification]
    rule A |Int B => B |Int A
        [simplification, concrete(A), symbolic(B)]
    rule (A |Int B) |Int C => A |Int (B |Int C)
        [simplification, concrete(B, C)]
    rule A |Int (B |Int C) => (A |Int B) |Int C
        [simplification, symbolic(A, B)]

    rule (A |Int B) &Int C => (A &Int C) |Int (B &Int C)
        [simplification]
    rule A &Int (B |Int C) => (A |Int C) &Int (B |Int C)
        [simplification, symbolic(B)]
    rule A &Int (B |Int C) => (A |Int C) &Int (B |Int C)
        [simplification, symbolic(C)]
    rule (A &Int B) |Int (A &Int C)
        => A &Int (B |Int C)
        [simplification, concrete(B, C)]
    rule (A |Int B) >>IntTotal C => (A >>IntTotal C) |Int (B >>IntTotal C)
        requires 0 <=Int C
        [simplification]
    rule (A |Int B) <<IntTotal C => (A <<IntTotal C) |Int (B <<IntTotal C)
        requires 0 <=Int C
        [simplification]

    rule (A &Int B) modIntTotal M => (A &Int B) &Int (M -Int 1)
        requires (0 <=Int A orBool 0 <=Int B)
          andBool isPowerOf2(M)
        [simplification]
    rule (A >>IntTotal B) modIntTotal M => (A >>IntTotal B) &Int (M -Int 1)
        requires 0 <=Int A
          andBool isPowerOf2(M)
        [simplification]
    rule (A <<IntTotal B) modIntTotal M => (A <<IntTotal B) &Int (M -Int 1)
        requires 0 <=Int A
          andBool isPowerOf2(M)
        [simplification]
    rule (A |Int B) modIntTotal M => (A |Int B) &Int (M -Int 1)
        requires 0 <=Int A
          andBool 0 <=Int B
          andBool isPowerOf2(M)
        [simplification]

    rule (A modIntTotal M) &Int B => (A &Int (M -Int 1)) &Int B
        requires (0 <=Int A orBool 0 <=Int B)
          andBool isPowerOf2(M)
        [simplification]
    rule (A modIntTotal M) >>IntTotal B => (A &Int (M -Int 1)) >>IntTotal B
        requires 0 <=Int A
          andBool isPowerOf2(M)
        [simplification]
    rule (A modIntTotal M) <<IntTotal B => (A &Int (M -Int 1)) <<IntTotal B
        requires 0 <=Int A
          andBool isPowerOf2(M)
        [simplification]
    rule (A modIntTotal M) |Int B => (A &Int (M -Int 1)) |Int B
        requires 0 <=Int A
          andBool 0 <=Int B
          andBool isPowerOf2(M)
        [simplification]

    // Rules for having saner masks.
    rule A &Int B => A &Int (B &Int fullMask(8))
        requires fullMask(8) <Int B andBool 0 <=Int A andBool A <=Int fullMask(8)
        [simplification, concrete(B)]
    rule A &Int B => A &Int (B &Int fullMask(16))
        requires fullMask(16) <Int B andBool 0 <=Int A andBool A <=Int fullMask(16)
        [simplification, concrete(B)]
    rule A &Int B => A &Int (B &Int fullMask(24))
        requires fullMask(24) <Int B andBool 0 <=Int A andBool A <=Int fullMask(24)
        [simplification, concrete(B)]
    rule A &Int B => A &Int (B &Int fullMask(32))
        requires fullMask(32) <Int B andBool 0 <=Int A andBool A <=Int fullMask(32)
        [simplification, concrete(B)]
    rule A &Int B => A &Int (B &Int fullMask(40))
        requires fullMask(40) <Int B andBool 0 <=Int A andBool A <=Int fullMask(40)
        [simplification, concrete(B)]
    rule A &Int B => A &Int (B &Int fullMask(48))
        requires fullMask(48) <Int B andBool 0 <=Int A andBool A <=Int fullMask(48)
        [simplification, concrete(B)]
    rule A &Int B => A &Int (B &Int fullMask(56))
        requires fullMask(56) <Int B andBool 0 <=Int A andBool A <=Int fullMask(56)
        [simplification, concrete(B)]

  rule {0 #Equals (A &Int B) >>IntTotal C }
      => { 0 #Equals A &Int B }
      requires B &Int fullMask(C) ==Int 0
      [simplification, concrete(B, C)]
endmodule
```