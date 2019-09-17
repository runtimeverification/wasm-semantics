KWASM Lemmas
============

These lemmas aid in verifying WebAssembly programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS
    imports WASM-TEXT
```

Basic arithmetic
----------------

```k
    rule (0 +Int X) => X
    rule (X +Int 0) => X

    rule (X +Int (Y *Int N)) modInt N => X modInt N
      requires N >=Int 1
    rule (X +Int (Y *Int N)) /Int N   => (X /Int N) +Int Y
      requires N =/=Int 0
```

When reasoning about `#chop`, it's often the case that the precondition to the proof contains the information needed to indicate no overflow.
In this case, it's simpler (and safe) to simply discard the `#chop`, instead of evaluating it.

```k
    rule #chop(< ITYPE:IValType > N) => < ITYPE > N
      requires #inUnsignedRange(ITYPE, N)
      [simplification]
    rule #chop(< ITYPE > N) => < ITYPE > #unsigned(ITYPE, N)
      requires #inSignedRange (ITYPE, N)
      [simplification]

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

Memory is represented by a byte map, where each key is an index and each entry either empty (0) or a byte (1 to 255).
This invariant must be maintained by the semantics, and any failure to maintain it is a breach of the Wasm specification.
We want to make the variant explicit, so we introduce the following helper, which simply signifies that we assume a well-formed byte map:

```k
    syntax Bool ::= "#isWellFormedByteMap" "(" ByteMap ")" [function, smtlib(isWellFormedByteMap)]
 // ----------------------------------------------------------------------------------------------
```

With this invariant encoded, we can introduce the following simplifications.

```k
    rule #get(BMAP, IDX) modInt 256 => #get(BMAP, IDX)
      requires #isWellFormedByteMap(BMAP)
    rule #get(BMAP, IDX) /Int   256 => 0
      requires #isWellFormedByteMap(BMAP)
```

From the semantics, it should be clear that setting the index in a bytemap to the value already contained there will leave the map unchanged.
Conversely, setting an index in a map to a value `VAL` and then retrieving the value at that index will yield `VAL`.

```k
    rule #get(#set(BMAP, IDX, VAL), IDX)  => VAL
    rule #set(BMAP, IDX, #get(BMAP, IDX)) => BMAP
```

```k
endmodule
```
