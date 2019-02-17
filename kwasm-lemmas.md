KWASM Lemmas
============

These lemmas aid in verifying WASM programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS
    imports WASM
```

When reasoning about `#chop`, it's often the case that the precondition to the proof contains the information needed to indicate no overflow.
In this case, it's simpler (and safe) to simply discard the `#chop`, instead of evaluating it.

```k
    rule #chop(< ITYPE:IValType > N) => < ITYPE > N requires N <Int #pow(ITYPE)
```

```k
endmodule
```
