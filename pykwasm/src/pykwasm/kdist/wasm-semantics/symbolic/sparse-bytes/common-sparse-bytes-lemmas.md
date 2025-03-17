Lemmas for SparseBytes
======================

This file is trying to solve the following problem:

We have several functions for updating the memory and several functions for
retrieving data from memory that may occur unevaluated in the logs.
When this was written, these functions included: `getBytesRange`, `getRange`
and `substrSparseBytes` for extracting data and `setRange` and `replaceAt`
for updating data.

There are a lot of combinations between these functions (e.g. calling `setRange`
for a chunk of memory that contains an unevaluated `replaceAt`), and also a lot
of interactions between these and the underlying data representation.

We would like to handle these in an uniform way, with as few lemmas as possible.

We make the following assumptions:
* Almost always, when we are reading data from an address `A` with a size `N`,
  that data was written as an update at the same address `A`, with the same size,
  `N`. Known exceptions (some of them might not apply after version 0.48.0 of the
  MultiversX SDK, which reimplements data encoding):
  - It may happen (e.g. when encoding data) that we are writing several small
    pieces of data in the memory, then reading all of them at once.
  - It may happen (e.g. when decoding data) that we are moving a large chunk of
    memory around, writing it as a single piece, then we are reading from the
    new location. However, we expect that the data we read was originally
    written as a single chunk of memory of the same size.
  - It may happen that we are reading data from a larger chunk of memory that
    is not composed of smaller pieces (e.g. the initial contract memory).
    However, in this case, the memory will always be concrete, the address
    will resolve to a concrete location in this chunk and the size will be
    concrete.
* Almost always, when we are writing data to an address, we are either writing
  over a piece of memory that was not updated since the contract started, or
  we are writing over a piece of memory that had an update with the same size
  and address. The exceptions are the similar to the above. One particular
  exception to note (which should occur less or not at all after SDK 0.48.0)
  was that one could encode some data in a buffer, then reuse that buffer to
  encode another data, whose size is symbolic, and for which we can't know
  which of the previous chunks it overlaps.

To handle these functions in an uniform way, we transform them in calls to
two generic functions (`updateSparseBytes` and `extractSparseBytes`) as
described below.

```k

module COMMON-SPARSE-BYTES-LEMMAS-SYNTAX
    imports SPARSE-BYTES-LEMMAS-BASIC

```

For each function that updates memory that we want to handle with
`updateSparseBytes`, you should add a constructor to `SBSetFunction`. This
constructor should hold all the update data not handled by `updateSparseBytes`.

```k

    syntax SBSetFunction

```

In a similar way, add a constructor for each getter to `SBGetFunction`.

In order to avoid cycles, `substrSparseBytes` needs to be handled separately,
so it gets its own entry here instead of a separate file like the other getters.

```k

    syntax SBGetFunction ::= "substr"

    syntax SBFunction ::= SBSetFunction | SBGetFunction

```

For each updating function, you must add rules that convert to/from
`updateSparseBytes`. In general, you should always convert symbolic data to
`updateSparseBytes`, and you should convert back to the original function only
when it can be evaluated with its definition rules (e.g. for concrete inputs).
You should also handle the cases where the update can be easily solved (mainly
the update size is the same as the updated data size).

```k

    syntax SparseBytes ::= updateSparseBytes(
            SBSetFunction, SparseBytes, start:Int, size:Int
        )  [function, total, symbol(updateSparseBytes), no-evaluators]

```

This should return true iff the function works "as expected", i.e. it
updates some chunk of memory at the address provided.
As an example, for certain input values, `setRange` will leave the memory
untouched, in which case `functionSparseBytesWellDefined` should return `false`.

You should add an entry for each update function.

```k

    syntax Bool ::= functionSparseBytesWellDefined(
            SBSetFunction, start:Int, size:Int
        )  [function, total, symbol(functionSparseBytesWellDefined), no-evaluators]

```

Given the size of the `SparseBytes` object in `updateSparseBytes`,
`updateSparseBytesSize` should return the size of the memory _after_ the update.

You should add an entry for each update function.

```k

    syntax Int ::= updateSparseBytesSize(
            SBSetFunction, sbSize:Int, start:Int, size:Int
        )  [function, total, symbol(updateSparseBytesSize), no-evaluators]

```

`getReplacementSparseBytes` should return the bytes that should be written to
the memory.

You should add an entry for each update function.

```k

    syntax SparseBytes ::= getReplacementSparseBytes(
            SBSetFunction, start:Int, size:Int
        )  [function, total, symbol(getReplacementSparseBytes), no-evaluators]

```

For each getter, you must add rules that convert to/from
`extractSparseBytes`. In general, you should always convert symbolic data to
`extractSparseBytes`, and you should convert back to the original function only
when it can be evaluated with its definition rules (e.g. for concrete inputs).
You should also handle the cases where the update can be easily solved (mainly
when the extract size is the same as the size of the `SparseBytes`).

```k

    syntax SparseBytes ::= extractSparseBytes(
            SBGetFunction, SparseBytes, start:Int, size:Int
        )
        [function, total, symbol(extractSparseBytes), no-evaluators]

```

`splitSparseBytesFunction` and `canSplitSparseBytes` are trying to solve the
following problem:

Let's say that we have an update over some SB, with a (perhaps) known start and
with a symbolic size. We would like to simplify `update(SB, Start, Size)` to
`concat(update(SB1, Start, Size), SB2)` where `SB == concat(SB1, SB2)`. However,
since `Size` is symbolic, we don't actually know where to do the split. In
general, `SB` will be composed of three parts, `S1`, `S2` and `S3` such that:
* We can tell that `S1` ends before `Start + Size`;
* For any split point `T` in `S2`, we can't tell whether
  `concat(S1, S2[0:T])` ends before or after `Start + Size`;
* We can tell that `concat(S1, S2[0:T])` ends after `Start + Size`.

This means that it's hard to find exactly where to split `SB`, i.e. it's hard
to find the exact split point between `S2` and `S3`. Mind you, it's not
impossible, it's just hard, and involves a solution somewhat more complex than
the two functions below.

Note that with a normal `List` implementation, in principle, one could just
match on the chunks at the end of the SB and attempt to move them out of the
update. However, that does not seem to work with the current symbolic backends.

So, the current solution is something like this: whenever we have two updates
on top of each other, e.g. update(update(SB, Start1, Width1), Start2, Width2),
we call `canSplitSparseBytes` to verify if `Start2` is a reasonable split point
for `SB`, and, if that's the case, we call `splitSparseBytesFunction`.

Note that one should not call `splitSparseBytesFunction` without checking
`canSplitSparseBytes` first, because that would risk leaving
`splitSparseBytesFunction` unevaluated, and having to handle it would
significantly increase the complexity of the lemmas.

See the `SPLIT-SPARSE-BYTES` module for details on how this is implemented.

```k

    syntax SparseBytes ::= splitSparseBytes(
            toSplit:SparseBytes, prefix:SparseBytes, addr:Int
        )
        [function, total, no-evaluators]

    syntax Bool ::= canSplitSparseBytes(
                        SBSetFunction, SparseBytes,
                        addr:Int, innerAddr:Int, innerWidth:Int
                    )  [function, total, no-evaluators]
                  | #canSplitSparseBytes(SparseBytes, SparseBytes)  [function, total, no-evaluators]

    syntax SparseBytes ::= splitSparseBytesFunction(
            function:SparseBytes, SBSetFunction, toSplit:SparseBytes,
            addr:Int, innerAddr:Int, innerWidth:Int
        )
        [function, total, no-evaluators]
    syntax SparseBytes ::= #splitSparseBytesFunction(
            function:SparseBytes, toSplit:SparseBytes, splitter:SparseBytes, addr:Int
        )
        [function, total, no-evaluators]

    syntax Bool ::= empty(SparseBytes)  [function, total]
endmodule

module COMMON-SPARSE-BYTES-LEMMAS
    imports private COMMON-SPARSE-BYTES-LEMMAS-SYNTAX
    imports private COMMON-SPARSE-BYTES-LEMMAS-DEFINITIONS
    imports private COMMON-SPARSE-BYTES-LEMMAS-SYMBOLIC
    imports private EXTRACT-SPARSE-BYTES-LEMMAS
    imports private UPDATE-SPARSE-BYTES-LEMMAS
    imports private SPLIT-SPARSE-BYTES
endmodule

module COMMON-SPARSE-BYTES-LEMMAS-DEFINITIONS
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

    rule empty(.SparseBytes) => true
    rule empty(SBChunk(#bytes(B)) _SB:SparseBytes) => false requires lengthBytes(B) >Int 0
    rule empty(SBChunk(#bytes(B)) SB:SparseBytes) => empty(SB) requires lengthBytes(B) ==Int 0
    rule empty(SBChunk(#empty(N)) _SB:SparseBytes) => false requires N >Int 0
    rule empty(SBChunk(#empty(N)) SB:SparseBytes) => empty(SB) requires N <=Int 0
endmodule

module COMMON-SPARSE-BYTES-LEMMAS-SYMBOLIC  [symbolic]
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

    rule empty(concat(SB1, _SB2)) => false requires notBool empty(SB1)  [simplification]
    rule empty(concat(SB1, SB2)) => empty(SB2) requires empty(SB1)  [simplification]
    rule empty(merge(SB1, _SB2)) => false requires notBool empty(SB1)  [simplification]
    rule empty(merge(SB1, SB2)) => empty(SB2) requires empty(SB1)  [simplification]
    rule empty(updateSparseBytes(_Fn:SBSetFunction, SB:SparseBytes, Start:Int, Width:Int)) => false
        requires (0 <=Int Start)
          andBool (notBool empty(SB) orBool 0 <Int Width)
        [simplification]
    rule empty(updateSparseBytes(_Fn:SBSetFunction, SB:SparseBytes, Start:Int, Width:Int)) => true
        requires 0 <=Int Start
          andBool empty(SB) andBool 0 ==Int Width
        [simplification]
endmodule

module SPLIT-SPARSE-BYTES  [symbolic]
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

```

We have the following goals:
* All functions must be well defined, i.e. they must evaluate to values that
  depend only on the values passed as arguments, and not on the unevaluated
  functions present in the arguments.
* Evaluate `canSplitSparseBytes` to `true` only for arguments for which
  `splitSparseBytesFunction` will fully evaluate

The first goal can be achieved by having `canSplitSparseBytes` as a function
that is always true (but may stay unevaluated sometimes), and having
`splitSparseBytesFunction` always equal to the first argument (may also
stay unevaluated sometimes).

We achieve the second goal by having an additional `splitSparseBytes` function
that takes three arguments: a suffix, a prefix, and an Addr. This function
is equal to the concatenation of the suffix and the prefix, but is never
actually evaluated. Instead, it changes its internal representation by moving
bytes from the suffix to the prefix, and removing the size of those bytes from
Addr, until the addr becomes 0 (if possible).

Then we can evaluate `canSplitSparseBytes(..., Addr)` to
`#canSplitSparseBytes(... splitSparseBytes(..., Addr) ...)` and then evaluate
`#canSplitSparseBytes(... splitSparseBytes(..., Addr=0) ...)` to `true`, as
sown below, in order to see if we can split the given bytes in a prefix and a
suffix at the exact `Addr` point.

In a similar way, we can evaluate `splitSparseBytesFunction(...)` to
`#splitSparseBytesFunction(... splitSparseBytes(...) ...)` and then evaluate
`#splitSparseBytesFunction(... splitSparseBytes(...) ...)` to an actual split.

Using exactly the same `splitSparseBytes(...)` call for both
`canSplitSparseBytes` and `splitSparseBytesFunction`, together with a requires
clause that is more restrictive for `canSplitSparseBytes` ensures that
`splitSparseBytesFunction` will always fully evaluate.

```k

    rule canSplitSparseBytes(_F:SBSetFunction, SB, Addr, InnerAddr:Int, InnerWidth:Int)
        => #canSplitSparseBytes(SB, splitSparseBytes(SB, .SparseBytes, Addr))
        requires 0 <Int Addr
            andBool InnerAddr +Int InnerWidth <=Int Addr
    rule #canSplitSparseBytes(_, splitSparseBytes(Suffix, _, 0)) => true
        requires 0 <Int size(Suffix)
        [simplification]

    rule splitSparseBytesFunction(Function:SparseBytes, _F:SBSetFunction, ToSplit:SparseBytes, Addr:Int, InnerAddr:Int, InnerWidth:Int)
        => #splitSparseBytesFunction(
            Function, ToSplit, splitSparseBytes(ToSplit, .SparseBytes, Addr), Addr
        )
        requires InnerAddr +Int InnerWidth <=Int Addr
    rule #splitSparseBytesFunction(
            updateSparseBytes(Fn:SBSetFunction, _:SparseBytes, Addr:Int, Width:Int),
            _:SparseBytes,
            splitSparseBytes(Suffix:SparseBytes, Prefix:SparseBytes, 0),
            _:Int
        )
        => concat(updateSparseBytes(Fn, Prefix, Addr, Width), Suffix)
        requires Addr +Int Width <=Int size(Prefix)
        [simplification]


    rule splitSparseBytes(SBI:SBItemChunk SB:SparseBytes, Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes(SB, concat(Prefix, SBI), Addr -Int size(SBI))
        requires size(SBI) <=Int Addr
        [simplification]
    rule splitSparseBytes(concat(SB1:SparseBytes, SB2:SparseBytes), Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes(SB2, concat(Prefix, SB1), Addr -Int size(SB1))
        requires size(SB1) <=Int Addr
        [simplification]
    rule splitSparseBytes(merge(SB1, SB2:SparseBytes), Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes(SB2, concat(Prefix, SB1), Addr -Int size(SB1))
        requires size(SB1) <=Int Addr
        [simplification]

    rule splitSparseBytes(SBChunk(#bytes(A +Bytes B)) SB:SparseBytes, Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes(SBChunk(#bytes(B)) SB, concat(Prefix, SBChunk(#bytes(A))), Addr -Int lengthBytes(A))
        requires lengthBytes(A) <=Int Addr
        [simplification]

    rule splitSparseBytes(SBChunk(#bytes(A +Bytes B)) SB:SparseBytes, Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes(SBChunk(#bytes(A)) SBChunk(#bytes(B)) SB, Prefix, Addr)
        requires 0 <Int Addr andBool Addr <Int lengthBytes(A)
        [simplification]
    rule splitSparseBytes(SBChunk(#bytes(A)) SB:SparseBytes, Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes
            ( SBChunk(#bytes(substrBytes(A, Addr, lengthBytes(A))))
              SB
            , concat(Prefix, SBChunk(#bytes(substrBytes(A, 0, Addr))))
            , 0
            )
        requires 0 <Int Addr andBool Addr <Int lengthBytes(A)
        [simplification, concrete(A, Addr)]
    rule splitSparseBytes(SBChunk(#empty(A)) SB:SparseBytes, Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes
            ( SBChunk(#empty(A -Int Addr))
              SB
            , concat(Prefix, SBChunk(#empty(Addr)))
            , 0
            )
        requires 0 <Int Addr andBool Addr <Int A
        [simplification, concrete(A, Addr)]

    rule splitSparseBytes(
              updateSparseBytes(
                  F:SBSetFunction, SB:SparseBytes, AddrF:Int, WidthF:Int),
              Prefix:SparseBytes, Addr:Int)
        => splitSparseBytes
            ( splitSparseBytesFunction
              ( updateSparseBytes(F, SB, AddrF, WidthF)
              , F, SB, Addr, AddrF, WidthF
              )
            , Prefix, Addr
            )
        requires canSplitSparseBytes(F, SB, Addr, AddrF, WidthF)
        [simplification]


    rule size(updateSparseBytes(Fn:SBSetFunction, SB:SparseBytes, Start:Int, Width:Int))
        => updateSparseBytesSize(Fn, size(SB), Start, Width)
        [simplification]
endmodule

module UPDATE-SPARSE-BYTES-LEMMAS  [symbolic]
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

```
    Evaluation schema for simplifying the basic SB representation
    Arguments: F, SB, Start, Len

    *This is not fully implemented.*

    * SB = .SparseBytes
        - replace SB with zeros
    * SB = chunk SB'
        * size(chunk) <= start
            - move the chunk before the update (1)
        * start < size(chunk)
            * SB' = .SparseBytes
                * size(chunk) < start + width
                    - add zeros at the end of the SB /
                * start + width <= size(chunk)
                    * 0 < start
                        * chunk = #bytes(A)
                            * concrete(A, Start)
                                - high priority rule to remove the prefix
                            * A = B + C
                                * len(B) <= start
                                    - remove
                                * start < len(B)
                                    * start + width <= len(B)
                                        - remove end
                                    * len(B) < start + width
                                        * concrete(B, Start)
                                            - high priority rule to remove the start
                                        * give up
                            * otherwise
                                - give up
                        * chunk = #empty(A)
                            - remove the prefix
                    * 0 == start
                        * chunk = #bytes(A)
                            * start + width = len(A)
                                - return result
                            * start + width < len(A)
                                * concrete(A, Width)
                                    - high priority rule to split
                                * A = B + C
                                    * Width <= len(B)
                                        - split
                                    * len(B) < width
                                        - give up
                                * otherwise
                                    - give up
                        * chunk = #empty(A)
                            * start + width = A
                                - return result
                            * start + width < A
                                - split
            * SB' = chunk2 SB'''
                * start + width <= size(chunk)
                    - remove SB' (2)
                * size(chunk) < start + width
                    * chunk = #bytes(A)
                        * chunk2 = #bytes(B)
                            - concatenate A + B
                            - with high priority, if s+w<len(A+B), concrete(s,w,b),
                              then split B
                        * chunk2 = #empty(B)
                            * start+width < len(A) + B
                                - split B
                            * len(A) + B <= start+width
                                - concatenate with zeros(B)
                    * chunk = #empty(A)
                        * 0 < start
                            - split A
                        * 0 == start
                            - replace with zeros(A)
```k

    // ----------------------------
    //    simplify concatenation
    // ----------------------------

    rule updateSparseBytes(
              F:SBSetFunction,
              SBI:SBItemChunk SB:SparseBytes,
              Start:Int, Width:Int)
        => concat(
            SBI,
            updateSparseBytes(F, SB, Start -Int size(SBI), Width))
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool size(SBI) <=Int Start
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBI:SBItemChunk SB:SparseBytes,
              Start:Int, Width:Int)
        => concat(
              updateSparseBytes(F, SBI, Start, Width),
              SB
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start +Int Width <=Int size(SBI)
            andBool notBool empty(SB)
        [simplification]

    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)) SB:SparseBytes,
              Start:Int, Width:Int)
        => concat(
              SBChunk(#bytes(substrBytes(A, 0, Start))),
              updateSparseBytes
                ( F
                , SBChunk(#bytes(substrBytes(A, Start, lengthBytes(A))))
                  SB
                , 0, Width
                )
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int lengthBytes(A)
            andBool 0 <Int Start
        [simplification, concrete(A, Start)]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#empty(A)) SB:SparseBytes,
              Start:Int, Width:Int)
        => concat(
              SBChunk(#empty(Start)),
              updateSparseBytes
                ( F
                , SBChunk(#empty(A -Int Start))
                  SB
                , 0, Width
                )
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int A
            andBool 0 <Int Start
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)) SBChunk(#bytes(B)) SB:SparseBytes,
              0, Width:Int)
        => updateSparseBytes(F, SBChunk(#bytes(A +Bytes B)) SB, 0, Width)
        requires functionSparseBytesWellDefined(F, 0, Width)
            andBool lengthBytes(A) <Int Width
        [simplification]

    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)) SBChunk(#bytes(B)) SB:SparseBytes,
              Start:Int, Width:Int)
        => updateSparseBytes(F, SBChunk(#bytes(A +Bytes B)) SB, Start, Width)
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool 0 <Int Start
            andBool Start <Int lengthBytes(A)
        [simplification, symbolic(A)]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)) SBChunk(#empty(B)) SB:SparseBytes,
              Start:Int, Width:Int)
        => updateSparseBytes
            ( F
            , SBChunk(#bytes(A +Bytes zeros(Start +Int Width -Int lengthBytes(A))))
              SBChunk(#empty(lengthBytes(A) +Int B -Int (Start +Int Width)))
              SB
            , Start, Width
            )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int lengthBytes(A)
            andBool lengthBytes(A) <Int Start +Int Width
            andBool Start +Int Width <Int lengthBytes(A) +Int B
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)) SBChunk(#empty(B)) SB:SparseBytes,
              Start:Int, Width:Int)
        => updateSparseBytes
            ( F
            , SBChunk(#bytes(A +Bytes zeros(B)))
              SB
            , Start, Width
            )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int lengthBytes(A)
            andBool lengthBytes(A) +Int B <=Int Start +Int Width
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#empty(A)) SB:SparseBytes,
              0, Width:Int)
        => updateSparseBytes
            ( F
            , SBChunk(#bytes(zeros(A)))
              SB
            , 0, Width
            )
        requires functionSparseBytesWellDefined(F, 0, Width)
            andBool 0 <Int A
            andBool A <Int Width
        [simplification]

    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A +Bytes B)),
              Start:Int, Width:Int)
        => concat(
              updateSparseBytes(F, SBChunk(#bytes(A)), Start, Width),
              SBChunk(#bytes(B))
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start +Int Width <=Int lengthBytes(A)
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A +Bytes B)),
              Start:Int, Width:Int)
        => concat(
              SBChunk(#bytes(A)),
              updateSparseBytes(F, SBChunk(#bytes(B)), Start -Int lengthBytes(A), Width)
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool lengthBytes(A) <=Int Start
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A +Bytes B)),
              Start:Int, Width:Int)
        => concat(
              SBChunk(#bytes(substrBytes(A, 0, Start))),
              updateSparseBytes(F, SBChunk(#bytes(substrBytes(A, Start, lengthBytes(A)) +Bytes B)), 0, Width)
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool 0 <Int Start
            andBool Start <Int lengthBytes(A)
            andBool lengthBytes(A) <Int Start +Int Width
        [simplification, concrete(A, Start)]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)),
              Start:Int, Width:Int)
        => concat(
              SBChunk(#bytes(substrBytes(A, 0, Start))),
              updateSparseBytes(F, SBChunk(#bytes(substrBytes(A, Start, lengthBytes(A)))), 0, Width)
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool 0 <Int Start
            andBool Start <Int lengthBytes(A)
        [simplification, concrete(A, Start)]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#bytes(A)),
              0, Width:Int)
        => concat(
              updateSparseBytes(F, SBChunk(#bytes(substrBytes(A, 0, Width))), 0, Width),
              SBChunk(#bytes(substrBytes(A, Width, lengthBytes(A))))
          )
        requires functionSparseBytesWellDefined(F, 0, Width)
            andBool Width <Int lengthBytes(A)
        [simplification, concrete(A)]
    // TODO: Make this work
    // rule updateSparseBytes(
    //           F:SBSetFunction,
    //           SBChunk(#bytes(A)) #as SB,
    //           0, Width:Int)
    //     => updateSparseBytes(
    //           F, splitSparseBytesItemNoFunction(SB, Width)),
    //           0, Width
    //       )
    //     requires functionSparseBytesWellDefined(F, 0, Width)
    //         andBool Width <Int lengthBytes(A)
    //         andBool canSplitSparseBytesItemNoFunction(F, SB, Width)
    //     [simplification, symbolic(A)]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#empty(A)),
              Start:Int, Width:Int)
        => concat(
              SBChunk(#empty(Start)),
              updateSparseBytes(F, SBChunk(#empty(A -Int Start)), 0, Width)
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool 0 <Int Start
            andBool Start <Int A
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              SBChunk(#empty(A)),
              0, Width:Int)
        => concat(
              updateSparseBytes(F, SBChunk(#empty(Width)), 0, Width),
              SBChunk(#empty(A -Int Width))
          )
        requires functionSparseBytesWellDefined(F, 0, Width)
            andBool 0 <Int Width
            andBool Width <Int A
        [simplification]

    rule updateSparseBytes(
              F:SBSetFunction,
              concat(SB1:SparseBytes, SB2:SparseBytes),
              Start:Int, Width:Int)
        => concat(
            SB1,
            updateSparseBytes(F, SB2, Start -Int size(SB1), Width))
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool size(SB1) <=Int Start
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              concat(SB1:SparseBytes, SB2:SparseBytes),
              Start:Int, Width:Int)
        => concat(
            updateSparseBytes(F, SB1, Start, Width),
            SB2)
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start +Int Width <=Int size(SB1)
        [simplification]

    rule updateSparseBytes(
              F:SBSetFunction,
              merge(SB1, SB2:SparseBytes),
              Start:Int, Width:Int)
        => merge(
            SB1,
            updateSparseBytes(F, SB2, Start -Int size(SB1), Width))
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool size(SB1) <=Int Start
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              merge(SB1, SB2:SparseBytes),
              Start:Int, Width:Int)
        => concat(
            updateSparseBytes(F, SB1, Start, Width),
            SB2)
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start +Int Width <=Int size(SB1)
        [simplification]

    rule updateSparseBytes(
              F:SBSetFunction,
              merge(SBChunk(#empty(B)), SB2:SparseBytes),
              Start:Int, Width:Int)
        => concat(
            SBChunk(#empty(Start)),
            updateSparseBytes(
              F:SBSetFunction,
              merge(
                  SBChunk(#empty(B -Int Start)),
                  SB2:SparseBytes
              ),
              0, Width)
          )
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int B
            andBool 0 <Int Start
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              merge(SBChunk(#bytes(B)), merge(SBChunk(#empty(A)), SB2:SparseBytes)),
              Start:Int, Width:Int)
        => updateSparseBytes(
              F:SBSetFunction,
              merge(
                  SBChunk(#bytes(B +Bytes zeros(Start +Int Width -Int lengthBytes(B)))),
                  merge(
                    SBChunk(#empty(A +Int lengthBytes(B) -Int Start -Int Width)),
                    SB2:SparseBytes
                  )
              ),
              Start:Int, Width:Int)
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int lengthBytes(B)
            andBool lengthBytes(B) <Int Start +Int Width
            andBool Start +Int Width <Int lengthBytes(B) +Int A
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              merge(SBChunk(#bytes(B)), merge(SBChunk(#empty(A)), SB2:SparseBytes)),
              Start:Int, Width:Int)
        => updateSparseBytes(
              F:SBSetFunction,
              merge(SBChunk(#bytes(B +Bytes zeros(A))), SB2:SparseBytes),
              Start:Int, Width:Int)
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool Start <Int lengthBytes(B)
            andBool lengthBytes(B) <Int Start +Int Width
            andBool lengthBytes(B) +Int A <=Int Start +Int Width
        [simplification]
    rule updateSparseBytes(
              F:SBSetFunction,
              merge(SBChunk(#bytes(A +Bytes B)), SB:SparseBytes),
              Start:Int, Width:Int)
        => merge(
              SBChunk(#bytes(A)),
              updateSparseBytes(
                  F:SBSetFunction,
                  merge(SBChunk(#bytes(B)), SB),
                  Start -Int lengthBytes(A), Width))
        requires functionSparseBytesWellDefined(F, Start, Width)
            andBool lengthBytes(A) <=Int Start
            andBool Start <Int lengthBytes(A) +Int lengthBytes(B)
        [simplification]

    // ----------------------------
    //      Disjoint ranges
    // ----------------------------

    rule updateSparseBytes(
              F1:SBSetFunction,
              updateSparseBytes(
                  F2:SBSetFunction,
                  SB:SparseBytes,
                  Start2:Int, Width2:Int),
              Start1:Int, Width1:Int)
        => updateSparseBytes(
              F1,
              splitSparseBytesFunction(
                  updateSparseBytes(F2, SB, Start2, Width2),
                  F2, SB, Start1, Start2, Width2
              ),
              Start1, Width1)
        requires disjontRanges(Start1, Width1, Start2, Width2)
          andBool canSplitSparseBytes(F2, SB, Start1, Start2, Width2)
        [simplification]

    // ----------------------------
    //  Included ranges cancelling
    // ----------------------------

    rule updateSparseBytes(
              F1:SBSetFunction,
              updateSparseBytes(
                  _F2:SBSetFunction,
                  SB:SparseBytes,
                  Start2:Int, Width2:Int),
              Start1:Int, Width1:Int)
        => updateSparseBytes(F1, SB, Start1, Width1)
        requires Start1 <=Int Start2 andBool Start2 +Int Width2 <=Int Start1 +Int Width1
        // Assumes that an update over the larger range cancels the narrower range.
      [simplification]

    // ----------------------------
    //     Overlapping ranges
    // ----------------------------

    // Not implemented yet
endmodule

module EXTRACT-SPARSE-BYTES-LEMMAS
    imports COMMON-SPARSE-BYTES-LEMMAS-SYNTAX

    // Final extraction
    rule extractSparseBytes(
              _F:SBGetFunction, SB:SparseBytes, 0, Len
          ) => SB
        requires Len ==Int size(SB)
    [simplification]


    // ------------------------------------------
    // Simplify concatenation - ignore first
    // ------------------------------------------
    rule extractSparseBytes(
              F:SBGetFunction,
              SBI:SBItemChunk SB:SparseBytes,
              Start:Int, Width:Int)
        => extractSparseBytes(F, SB, Start -Int size(SBI), Width)
        requires size(SBI) <=Int Start
        [simplification]

    rule extractSparseBytes(
              F:SBGetFunction,
              concat(SB1:SparseBytes, SB2:SparseBytes),
              Start:Int, Width:Int)
        => extractSparseBytes(F, SB2, Start -Int size(SB1), Width)
        requires size(SB1) <=Int Start
        [simplification]

    rule extractSparseBytes(
              F:SBGetFunction,
              merge(SB1, SB2:SparseBytes),
              Start:Int, Width:Int)
        => extractSparseBytes(F, SB2, Start -Int size(SB1), Width)
        requires size(SB1) <=Int Start
        [simplification]

    // ------------------------------------------
    // Simplify concatenation - included in first
    // ------------------------------------------
    rule extractSparseBytes(
              _F:SBGetFunction,
              SBI:SBItemChunk SB:SparseBytes,
              Start:Int, Width:Int)
        => substrSparseBytes(SBI, Start, Start +Int Width)
        requires Start +Int Width <=Int size(SBI)
            andBool notBool empty(SB)
        [simplification]

    rule extractSparseBytes(
              F:SBGetFunction,
              concat(SB1:SparseBytes, _SB2:SparseBytes),
              Start:Int, Width:Int)
        => extractSparseBytes(F, SB1, Start, Width)
        requires 0 <=Int Start
            andBool Start +Int Width <=Int size(SB1)
        [simplification]

    rule extractSparseBytes(
              F:SBGetFunction,
              merge(SB1, _SB2:SparseBytes),
              Start:Int, Width:Int)
        => extractSparseBytes(F, SB1, Start, Width)
        requires 0 <=Int Start
            andBool Start +Int Width <=Int size(SB1)
        [simplification]

    // ------------------------------------------
    // Simplify concatenation - only one chunk
    // ------------------------------------------

    rule extractSparseBytes(
              _F:SBGetFunction,
              SBChunk(#empty(A)),
              Start:Int, Width:Int)
        => SBChunk(#empty(Width))
        requires 0 <=Int Start
            andBool Start +Int Width <=Int A
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              SBChunk(#bytes(A +Bytes _B)),
              Start:Int, Width:Int)
        => extractSparseBytes(
              F,
              SBChunk(#bytes(A)),
              Start, Width)
        requires Start +Int Width <=Int lengthBytes(A)
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              SBChunk(#bytes(A +Bytes B)),
              Start:Int, Width:Int)
        => extractSparseBytes(
              F,
              SBChunk(#bytes(B)),
              Start -Int lengthBytes(A), Width)
        requires lengthBytes(A) <=Int Start
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              SBChunk(#bytes(A +Bytes B)),
              Start:Int, Width:Int)
        => extractSparseBytes(
              F,
              SBChunk(#bytes(substrBytes(A, Start, lengthBytes(A)) +Bytes B)),
              0, Width)
        requires 0 <Int Start
            andBool Start <Int lengthBytes(A)
            andBool lengthBytes(A) <Int Start +Int Width
        [simplification, concrete(A, Start)]
    rule extractSparseBytes(
              F:SBGetFunction,
              SBChunk(#bytes(_)) #as SBI:SBItemChunk,
              Start:Int, Width:Int)
        => substrSparseBytes(SBI, Start, Start +Int Width)
        requires 0 <Int Start
            andBool Start +Int Width <=Int size(SBI)
            andBool F =/=K substr
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              SBI:SBItemChunk,
              Start:Int, Width:Int)
        => substrSparseBytes(SBI, Start, Start +Int Width)
        requires 0 <Int Start
            andBool Start +Int Width <=Int size(SBI)
            andBool F =/=K substr
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              SBI:SBItemChunk,
              Start:Int, Width:Int)
        => substrSparseBytes(SBI, Start, Start +Int Width)
        requires 0 <=Int Start
            andBool Start +Int Width <Int size(SBI)
            andBool F =/=K substr
        [simplification]
    rule extractSparseBytes(
              _F:SBGetFunction,
              SBI:SBItemChunk _SB:SparseBytes,
              0, Width:Int)
        => SBI
        requires Width ==Int size(SBI)
        [simplification]

    // ------------------------------------------
    // Simplify concatenation - overlaps first
    // ------------------------------------------
    rule extractSparseBytes(
              F:SBGetFunction,
              SBI:SBItemChunk SB:SparseBytes,
              Start:Int, Width:Int)
        => concat(
              substrSparseBytes(SBI, Start, size(SBI)),
              extractSparseBytes(F, SB, 0, Width +Int Start -Int size(SBI))
          )
        requires Start <Int size(SBI)
            andBool size(SBI) <Int Start +Int Width
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              concat(SB1:SparseBytes, SB2:SparseBytes),
              Start:Int, Width:Int)
        => concat(
              substrSparseBytes(SB1, Start, size(SB1)),
              extractSparseBytes(F, SB2, 0, Width +Int Start -Int size(SB1))
          )
        requires Start <Int size(SB1)
            andBool size(SB1) <Int Start +Int Width
        [simplification]
    rule extractSparseBytes(
              F:SBGetFunction,
              merge(SB1, SB2:SparseBytes),
              Start:Int, Width:Int)
        => concat(
              substrSparseBytes(SB1, Start, size(SB1)),
              extractSparseBytes(F, SB2, 0, Width +Int Start -Int size(SB1))
          )
        requires Start <Int size(SB1)
            andBool size(SB1) <Int Start +Int Width
        [simplification]


    // -------------------------------------------
    // With update - Disjoint ranges
    // -------------------------------------------
    rule extractSparseBytes(
              F1:SBGetFunction,
              updateSparseBytes(
                  _F2:SBSetFunction,
                  SB:SparseBytes,
                  Start2:Int, Width2:Int),
              Start1:Int, Width1:Int)
        => extractSparseBytes(F1, SB, Start1, Width1)
        requires disjontRanges(Start1, Width1, Start2, Width2)
          andBool 0 <=Int Start1
        [simplification]

    // -------------------------------------------
    // With update - Included range - Skipping
    // -------------------------------------------
    rule extractSparseBytes(
              F1:SBGetFunction,
              updateSparseBytes(
                  F2:SBSetFunction,
                  _SB:SparseBytes,
                  Start2:Int, Width2:Int),
              Start1:Int, Width1:Int)
        => extractSparseBytes(
              F1,
              getReplacementSparseBytes(F2, Start2, Width2),
              Start1 -Int Start2, Width1
          )
        requires Start2 <=Int Start1 andBool Start1 +Int Width1 <=Int Start2 +Int Width2
        [simplification]

    // -------------------------------------------
    // With update - Overlapping ranges - Before
    // -------------------------------------------
    rule extractSparseBytes(
              F1:SBGetFunction,
              updateSparseBytes(
                  F2:SBSetFunction,
                  SB:SparseBytes,
                  Start2:Int, Width2:Int),
              Start1:Int, Width1:Int)
        => concat(
              extractSparseBytes(F1, SB, Start1, Start2 -Int Start1),
              extractSparseBytes(
                  F1, updateSparseBytes(F2, SB, Start2, Width2),
                  Start2, Start1 +Int Width1 -Int Start2)
          )
        requires Start1 <Int Start2 andBool Start2 <Int Start1 +Int Width1
        [simplification]

    // -------------------------------------------
    // With update - Overlapping ranges - After
    // -------------------------------------------
    rule extractSparseBytes(
              F1:SBGetFunction,
              updateSparseBytes(
                  F2:SBSetFunction,
                  SB:SparseBytes,
                  Start2:Int, Width2:Int),
              Start1:Int, Width1:Int)
        => concat(
              extractSparseBytes(
                  F1, updateSparseBytes(F2, SB, Start2, Width2),
                  Start1, Start2 +Int Width2 -Int Start1),
              extractSparseBytes(
                  F1, SB,
                  Start2 +Int Width2,
                  Start1 +Int Width1 -Int (Start2 +Int Width2))
          )
        requires Start2 <=Int Start1
          andBool Start1 <Int Start2 +Int Width2
          andBool Start2 +Int Width2 <Int Start1 +Int Width1
          andBool 0 <Int Start2 +Int Width2
        [simplification]

endmodule
```
