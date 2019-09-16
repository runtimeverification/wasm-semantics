KWASM Lemmas
============

These lemmas aid in verifying WebAssembly programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS
    imports WASM-TEXT
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

Memory
------

TODO: We should inspect these two functions closer.
They are non-trivial in their implementation, but the following should obviously hold from the intended semantics.

```k
    rule #get(#set(MAP, IDX, VAL), IDX) => VAL
    rule #set(MAP, IDX, #get(MAP, IDX)) => MAP

    rule (X +Int (Y *Int N)) modInt N => X modInt N
      requires N >=Int 1
    rule (X +Int (Y *Int N)) /Int N   => X /Int N
      requires N =/=Int 0
```

```k
endmodule
```
