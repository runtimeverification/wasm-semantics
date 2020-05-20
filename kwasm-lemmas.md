KWASM Lemmas
============

These lemmas aid in verifying WebAssembly programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS [symbolic]
    imports WASM-TEXT
```

Basic logic
-----------

```k
    rule #bool(P) ==Int 0 => notBool P
```

Basic arithmetic
----------------

// TODO: Upstream the lemmas in this section into K.

### Modular Arithmetic

Z3 is slow and unreliable in reasoning about modular arithmetic.
Therefore we want to make structural simplifications wherever possible.

`X modInt N` is undefined for `N ==Int 0`, so we must take care to check that `N =/=Int 0`.
At the same time, we don't want to impose unnecessary side-conditions, so the non-zero condition can be implied by the other conditions.
For example, `X modInt N ==Int Y` implies `N =/=Int 0`, because only non-zero `N` could have the right-hand side resolve to an `Int`.
For simplicity, we impose that `N >Int 0`.
Not however that K defines `X modInt N ==Int X modInt (-N)`.

#### Rules for Expressions With Only Modulus

These are given in pure modulus form, and in form with `#wrap`, which is modulus with a power of 2 for positive `N`.

```k
    rule X modInt N => X
      requires 0 <=Int X
       andBool X  <Int N
      [simplification]

    rule #wrap(N, X) => X
      requires 0 <=Int N
       andBool 0 <=Int X
       andBool X  <Int (1 <<Int (N *Int 8))
      [simplification]

    rule X modInt 1 => 0
      [simplification]
```

`modInt` selects the least non-negative representative of a congruence class modulo `N`.

```k
    rule (X modInt M) modInt N => X modInt M
      requires M >Int 0
       andBool M <=Int N
      [simplification]

    rule #wrap(N, #wrap(M, X)) => #wrap(M, X)
      requires M <=Int N
      [simplification]
```

Proof:

```
Since 0 <= x mod m < m <= n, (x mod m) mod n = x mod m
```

```k
    rule (X modInt M) modInt N => X modInt N
      requires M >Int 0
       andBool N >Int 0
       andBool M modInt N ==Int 0
      [simplification]

    rule #wrap(N, #wrap(M, X)) => #wrap(N, X)
      requires notBool (M <=Int N)
      [simplification]
```

Proof:

```
Assume m = n * k for some k > 0.
x = m * q + r, for a unique q and r s.t. 0 <= r < m
(x mod m) mod n
 = r mod n
 = (n * ( k * q) + r) mod n
 = m * q + r mod n
 = x mod n
```

#### Modulus Over Addition

```k
    rule (X *Int M +Int Y) modInt N => Y modInt N
      requires M >Int 0
       andBool N >Int 0
       andBool M modInt N ==Int 0
      [simplification]

    rule (Y +Int X *Int M) modInt N => Y modInt N
      requires M >Int 0
       andBool N >Int 0
       andBool M modInt N ==Int 0
      [simplification]

    rule #wrap(N, (X <<Int M) +Int Y) => #wrap(N, Y)
      requires 0 <=Int M
       andBool (N *Int 8) <=Int M
      [simplification]

    rule #wrap(N, Y +Int (X <<Int M)) => #wrap(N, Y)
      requires 0 <=Int M
       andBool (N *Int 8) <=Int M
      [simplification]
```

Proof:

```
Assume m = k * n for some k (side condition).
x * m + y mod n = x * (k * n) + y mod n = y mod n
```

```k
    rule ((X modInt M) +Int Y) modInt N => (X +Int Y) modInt N
      requires M >Int 0
       andBool N >Int 0
       andBool M modInt N ==Int 0
      [simplification]

    rule (X +Int (Y modInt M)) modInt N => (X +Int Y) modInt N
      requires M >Int 0
       andBool N >Int 0
       andBool M modInt N ==Int 0
      [simplification]

    rule #wrap(N, #wrap(M, X) +Int Y) => #wrap(N, X +Int Y)
      requires N <=Int M
      [simplification]

    rule #wrap(N, X +Int #wrap(M, Y)) => #wrap(N, X +Int Y)
      requires N <=Int M
      [simplification]
```

Proof:

```
Assume m = l * n
x = k * m + r, r < m
x mod m + y = r + y
(x + y) mod n
  = k * m + r + y mod n
  = k * l * n + r + y mod n
  = r + y mod n
  = (x mod m + y) mod n
```

#### Bit Shifting

We want K to understand what a bit-shift is.

```k
    rule (X <<Int N) modInt M => 0
      requires (2 ^Int N) modInt M ==Int 0
      [simplification]

    rule #wrap(M, X <<Int N) => 0
      requires (M *Int 8) <=Int N
      [simplification]

    rule (X >>Int N)          => 0 requires X <Int 2 ^Int N [simplification]
    rule (X <<Int N) modInt M => 0 requires M <Int 2 ^Int N [simplification]

    rule (X >>Int N) >>Int M => X >>Int (N +Int M) [simplification]
    rule (X <<Int N) <<Int M => X <<Int (N +Int M) [simplification]

    // The Haskell backend accepts negative shifts (the LLVM backend does not).
    // So removing the side conditions and keeping one of each rule here could give faster symbolic execution.
    rule (X <<Int N) >>Int M => X <<Int (N -Int M)   requires          N >=Int M  [simplification]
    rule (X <<Int N) >>Int M => X >>Int (M -Int N)   requires notBool (N >=Int M) [simplification]
```

```k
    rule ((X <<Int M) +Int Y) >>Int N => (X <<Int (M -Int N)) +Int (Y >>Int N) requires M >=Int N [simplification]
    rule (Y +Int (X <<Int M)) >>Int N => (X <<Int (M -Int N)) +Int (Y >>Int N) requires M >=Int N [simplification]
```

Proof:

```
Let x' = x << m
=> The least m bits of x' are 0.
=> The least m bits of x' + y are the same as the least m bits of y, and there can be no carry in adding the least m bits.
=> The least (m-n) bits of (x' + y) >> n are the same as the least (m-n) bits of (y >> n), or y[n..], and there can be no carry in adding the least (m-n) bits.
=> ((x << m) + y) >> n is the same as adding x to the m'th and higher bits of y, and then concatenating the lesat (m-n) bytes of y[n..]
=> ((x << m) + y) >> n = y[n..(m-1)] : (x + y[m..])
=> ((x << m) + y) >> n
 = ((x + y[m..]) << (m-n)) + y[n..(m-1)]
 = (x << (m-n)) + (y[m..] << (m-n)) + y[n..(m-1)]
 = (x << (m-n)) + (y[n..(m-1)] : y[m..])
 = (x << (m-n)) + (y >> n)
```

The following rules decrease the modulus by rearranging it around a shift.

```k
    rule (X modInt POW) >>Int N => (X >>Int N) modInt (POW /Int (2 ^Int N))
      requires N  >=Int 0
       andBool POW >Int 0
       andBool POW modInt (2 ^Int N) ==Int 0
      [simplification]

    rule (X <<Int N) modInt POW => (X modInt (POW /Int (2 ^Int N))) <<Int N
      requires N  >=Int 0
       andBool POW >Int 0
       andBool POW modInt (2 ^Int N) ==Int 0
      [simplification]
```

Proof sketch: Taking modulo `2^n * k` can only affect the the `n`-th and higher bits.
A shift right by `n` bits can only erase bits up to the `n-1`-th bit.
Therefore, we may as well shift first and then take the modulus, only we need to make sure the modulus acts on the shifted bits, by taking modulo `k` instead.
The argument for the left shift is similar.

```k
    rule (X +Int (Y <<Int N)) modInt POW => X modInt POW
      requires N  >=Int 0
       andBool POW >Int 0
       andBool (2 ^Int N) modInt POW ==Int 0
      [simplification]

    rule ((Y <<Int N) +Int X) modInt POW => X modInt POW
      requires N  >=Int 0
       andBool POW >Int 0
       andBool (2 ^Int N) modInt POW ==Int 0
      [simplification]
```

Proof: These follow from the fact that shifting left by `n` bits is simply multiplying by `2^n`, and from previously proven rules of modular arithmetic.

### Basic Operations

```k
    rule X  +Int 0 => X [simplification]
    rule 0  +Int X => X [simplification]
    rule X <<Int 0 => X [simplification]
    rule 0 <<Int X => 0 [simplification]
    rule X >>Int 0 => X [simplification]
    rule 0 >>Int X => 0 [simplification]

    rule (X +Int N) +Int M => X +Int (N +Int M) [concrete(N, M), symbolic(X), simplification]
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

Lookups
-------

```k
    rule (MAP:Map [KEY <- VAL])[KEY] => VAL
```

Memory
------

Memory is represented by a byte map, where each key is an index and each entry either empty (0) or a byte (1 to 255).
This invariant must be maintained by the semantics, and any failure to maintain it is a breach of the Wasm specification.
We want to make the variant explicit, so we introduce the following helper, which simply signifies that we assume a well-formed byte map:

```k
    syntax Bool ::= #isByteMap ( ByteMap ) [function, functional, smtlib(isByteMap)]
    syntax Bool ::= #isByte    ( KItem   ) [function, functional, smtlib(isByte)]
 // -----------------------------------------------------------------------------
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

Bounds on `#getRange`:

```k
    rule 0 <=Int #getRange(_, _, _) => true                                             [simplification]
    rule 0 <=Int VAL <<Int SHIFT    => true requires 0 <=Int VAL  andBool 0 <=Int SHIFT [simplification]
    rule 0 <=Int VAL1 +Int VAL2     => true requires 0 <=Int VAL1 andBool 0 <=Int VAL2  [simplification]

    rule #getRange(_, _, WIDTH)             <Int MAX => true requires 2 ^Int (8 *Int WIDTH) <=Int MAX                                       [simplification]
    rule #getRange(_, _, WIDTH) <<Int SHIFT <Int MAX => true requires 2 ^Int ((8 *Int WIDTH) +Int SHIFT) <=Int MAX                          [simplification]
    rule VAL1 +Int VAL2                     <Int MAX => true requires VAL1 <Int MAX andBool VAL2 <Int MAX andBool #distinctBits(VAL1, VAL2) [simplification]

    syntax Bool ::= #distinctBits ( Int , Int ) [function]
 // ------------------------------------------------------
    rule #distinctBits(#getRange(_, _, WIDTH), #getRange(_, _, _) <<Int SHIFT) => true requires WIDTH *Int 8 <=Int SHIFT
```

`#wrap` over `#getRange`:

```k
    rule #wrap(MAX_WIDTH, #getRange(BM, ADDR, WIDTH)) => #getRange(BM, ADDR, minInt(MAX_WIDTH, WIDTH))
      requires #isByteMap(BM)
      [simplification]
```

Arithmetic over `#getRange`:

```k
    rule #getRange(BM, ADDR, WIDTH) >>Int SHIFT => #getRange(BM, ADDR +Int 1, WIDTH -Int 1) >>Int (SHIFT -Int 8)
      requires 0 <=Int ADDR
       andBool 0  <Int WIDTH
       andBool 8 <=Int SHIFT
       andBool #isByteMap(BM)
      [simplification]

    rule #getRange(BM, ADDR, WIDTH) modInt MAX => #getRange(BM, ADDR, WIDTH -Int 1) modInt MAX
      requires 0 <Int MAX andBool 0 <Int WIDTH
       andBool 2 ^Int (8 *Int (WIDTH -Int 1)) modInt MAX ==Int 0
       andBool #isByteMap(BM)
      [simplification]
```

`#getRange` over `#setRange`:

```k
    rule #getRange(#setRange(BM, ADDR, VAL, WIDTH), ADDR', WIDTH') => #getRange(BM, ADDR', WIDTH') requires ADDR' +Int WIDTH' <=Int ADDR  [simplification]
    rule #getRange(#setRange(BM, ADDR, VAL, WIDTH), ADDR', WIDTH') => #getRange(BM, ADDR', WIDTH') requires ADDR  +Int WIDTH  <=Int ADDR' [simplification]
    rule #getRange(#setRange(BM, ADDR, VAL, WIDTH), ADDR', WIDTH') => VAL
      requires 0 <=Int ADDR
       andBool 0  <Int WIDTH
       andBool 0 <=Int VAL andBool VAL <Int 2 ^Int (8 *Int WIDTH)
       andBool ADDR'  ==Int ADDR
       andBool WIDTH' ==Int WIDTH
       [simplification]
```

`#setRange` over `#getRange`

```k
    rule #setRange(BM, ADDR, #getRange(BM, ADDR, WIDTH), WIDTH) => BM [simplification]
    rule #setRange(BM, ADDR, (#getRange(_, _, WIDTH1) #as VAL1) +Int (VAL2 <<Int SHIFT), WIDTH)
      => #setRange(#setRange(BM, ADDR, VAL1, minInt(WIDTH1, WIDTH)), ADDR +Int WIDTH1, VAL2, WIDTH -Int WIDTH1)
      requires 0 <=Int ADDR
       andBool 0  <Int WIDTH
       andBool WIDTH1 *Int 8 ==Int SHIFT
      [simplification]
```

```k
endmodule
```

Specialized Lemmas
==================

Arithmetic Lemmas
-----------------

```k
module GENERAL-ARITHMETIC-LEMMAS [symbolic]
    imports WASM-TEXT
```

Integer division can not in general be distributed over addition.
However, when one of the addends is a multiple of the divisior, it is safe.

```k
    rule (Y +Int X *Int M) /Int N => (Y /Int N) +Int (X *Int (M /Int N))   requires M modInt N ==Int 0 [simplification]
```

Proof:

```
m mod n = 0 => m = k * n
y = l * n + r, where 0 <= r < n
(y + x * m) / n
  = (l * n + r + x * k * n) / n
  = ((l + x * k) * n + r) / n
  = l + x * k
  = y / n + x * (m / n)
```

The more general cases for distributing division follow:

```k
    rule (X +Int Y) /Int Z =>        X /Int Z +Int Y /Int Z
      requires         (X modInt Z) +Int (Y modInt Z) <Int Z
      [simplification]

    rule (X +Int Y) /Int Z => 1 +Int X /Int Z +Int Y /Int Z
      requires notBool (X modInt Z) +Int (Y modInt Z) <Int Z
      [simplification]
```

Proof:

```
x = k * z + r with 0 <= r < z
y = l * z + s with 0 <= s < z
Assumption:
r + s < z
Then
(x + y) / z
  = (k * z + r + l * z + s) / z
  = ((k + l) * z + (r + s)) / z
  = k + l
  = (k * z + r) / z + (l * z + s) / z
  = x / z + y / z

If instead (r + s) >= z, then z <= (r + s) < 2z.
Let t = r + s - z, so that 0 <= t < z
Then
(x + y) / z
  = ((k + l) * z + (r + s)) / z
  = ((k + l) * z + (r + s ) - z + z) / z
  = ((k + l + 1) * z + t) / z
  = k + l + 1
  = x / z + y / z + 1
```

The next rules consider (some) cases where integers with disjoint 1-bits are added together.

```k
// TODO: These rules turn out to not be necessary for the wrc20 proof. Keep?
    rule (X +Int Y) >>Int N => (Y >>Int N)
      requires N  >=Int 0
       andBool 0  <=Int X
       andBool X   <Int 2 ^Int N
       andBool Y modInt 2 ^Int N ==Int 0
    [simplification]

    rule (Y +Int X) >>Int N => (Y >>Int N)
      requires N  >=Int 0
       andBool 0  <=Int X
       andBool X   <Int 2 ^Int N
       andBool Y modInt 2 ^Int N ==Int 0
      [simplification]
```

Proof sketch: The side conditions guarantee that the addition causes no carries, so that `x + y = x | y`, `|` being a bitwise `or`.

```k
endmodule
```
