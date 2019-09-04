KWASM Lemmas
============

These lemmas aid in verifying WebAssembly programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS
    imports WASM-TEXT
```

Z3 can't reason about values tagged with type as if they were numbers.
This lemma helps unpack values.

```k
rule <TYPE> N:Int ==K <TYPE'> N':Int => TYPE ==K TYPE' andBool N ==Int N'
rule <TYPE> N:Int ==K #chop(<TYPE'> N':Int) => TYPE ==K TYPE' andBool N ==Int (N' modInt #pow(ITYPE))
```

When reasoning about `#chop`, it's often the case that the precondition to the proof contains the information needed to indicate no overflow.
In this case, it's simpler (and safe) to simply discard the `#chop`, instead of evaluating it.

```k
    rule #chop(< ITYPE:IValType > N) => < ITYPE > N
      requires #inUnsignedRange(ITYPE, N)
    rule #chop(< ITYPE > N) => < ITYPE > #unsigned(ITYPE, N)
      requires #inSignedRange (ITYPE, N)

    syntax Bool ::= #inUnsignedRange (IValType, Int) [function]
    syntax Bool ::= #inSignedRange   (IValType, Int) [function]
 // -----------------------------------------------------------
    rule #inUnsignedRange (ITYPE, I) => 0                 <=Int I andBool I <Int #pow (ITYPE)
    rule #inSignedRange   (ITYPE, I) => #minSigned(ITYPE) <=Int I andBool I <Int #pow1(ITYPE)

    syntax Int ::= #minSigned  ( IValType ) [function]
 // --------------------------------------------------
    rule #minSigned(ITYPE) => 0 -Int #pow1(ITYPE)
```

```k
endmodule
```
