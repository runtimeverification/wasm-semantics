KWASM Lemmas
============

These lemmas aid in verifying WebAssembly programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS
    imports WASM-TEXT
```

Basic logic
-----------

```k
    rule #bool(P) ==Int 0 => notBool P
```

Basic arithmetic
----------------

```k
//  rule (0 +Int X) => X [simplification]
//  rule (X +Int 0) => X [simplification]

//     rule (X +Int (Y *Int N)) modInt N => X modInt N
//       requires N >=Int 1
//       [simplification]
//  rule (X +Int (Y *Int N)) /Int N   => (X /Int N) +Int Y
//    requires N =/=Int 0
//    [simplification]

    rule X modInt N => X
      requires 0 <=Int X
       andBool X  <Int N
      [simplification]
```

When reasoning about `#chop`, it's often the case that the precondition to the proof contains the information needed to indicate no overflow.
In this case, it's simpler (and safe) to simply discard the `#chop`, instead of evaluating it.

```k
    rule X modInt #pow(ITYPE) => #unsigned(ITYPE, X)
      requires #inSignedRange (ITYPE, X)
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
    syntax Bool ::= #isByteMap ( ByteMap ) [function, smtlib(isByteMap)]
    syntax Bool ::= #isByte    ( KItem   ) [function, smtlib(isByte)]
 // -----------------------------------------------------------------
    rule #isByteMap(ByteMap <| .Map         |>) => true
    rule #isByteMap(ByteMap <| (_ |-> V) M  |>) => #isByte(V) andBool #isByteMap(ByteMap <| M |>)
    rule #isByteMap(ByteMap <| M [ _ <- V ] |>) => #isByte(V) andBool #isByteMap(ByteMap <| M |>)

    rule #isByte(I:Int) => true
      requires 0 <=Int I
       andBool I <=Int 255
    rule #isByte(I:Int) => false
      requires notBool (0 <=Int I
                        andBool I <=Int 255)
    rule #isByte(I:KItem) => false
      requires notBool isInt(I)
```

With this invariant encoded, we can introduce the following simplifications.

```k
    rule #get(BMAP, IDX) modInt 256 => #get(BMAP, IDX)
      requires #isByteMap(BMAP)
    rule #get(BMAP, IDX) /Int   256 => 0
      requires #isByteMap(BMAP)
```

From the semantics, it should be clear that setting the index in a bytemap to the value already contained there will leave the map unchanged.
Conversely, setting an index in a map to a value `VAL` and then retrieving the value at that index will yield `VAL`.

```k
    rule #get(#set(BMAP, IDX, VAL), IDX)  => VAL
    rule #set(BMAP, IDX, #get(BMAP, IDX)) => BMAP
```

TODO: We should inspect the two functions `#getRange` and `#setRange` closer.
They are non-trivial in their implementation, but the following should obviously hold from the intended semantics.

```k
    rule #setRange(BM, EA, #getRange(BM, EA, WIDTH), WIDTH) => BM
```

```k
endmodule
```
