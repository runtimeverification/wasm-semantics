KWASM Lemmas
============

These lemmas aid in verifying WebAssembly programs behavior.
They are part of the *trusted* base, and so should be scrutinized carefully.

```k
module KWASM-LEMMAS
    imports WASM-TEXT
    imports WRC20
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

```k
    rule X modInt N => X
      requires 0 <=Int X
       andBool X  <Int N
      [simplification]
```

`modInt` selects the least non-negative representative of a congruence class modulo `N`.

```k
    rule (X modInt M) modInt N => X modInt M
      requires M >Int 0
       andBool M <=Int N
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

We want Z3 to understand what a bit-shift is.

```k
    rule (X >>Int N)          => 0 requires X <Int 2 ^Int N [simplification]
    rule (X <<Int N) modInt M => 0 requires M <Int 2 ^Int N [simplification]

    rule (X >>Int N) >>Int M => X >>Int (N +Int M) [simplification]
    rule (X <<Int N) <<Int M => X <<Int (N +Int M) [simplification]

    // The Haskell and Java backend accept negative shifts (the LLVM and OCaml backends do not).
    // So removing the side conditions and keeping one of each rule here could give faster symbolic execution.
    rule (X <<Int N) >>Int M => X <<Int (N -Int M)   requires          N >=Int M  [simplification]
    rule (X <<Int N) >>Int M => X >>Int (M -Int N)   requires notBool (N >=Int M) [simplification]
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

We can now state the intended semantics of `#get`.

```k
    rule 0              <=Int #get(BM, ADDR) => true requires #isByteMap(BM) [simplification]
    rule #get(BM, ADDR)  <Int 256            => true requires #isByteMap(BM) [simplification]
```

With this invariant encoded, we can introduce the following lemma.

```k
    rule #isByteMap(BMAP) impliesBool (0 <=Int #get(BMAP, IDX) andBool #get(BMAP, IDX) <Int 256) => true [smt-lemma]
```

From the semantics, it should be clear that setting the index in a bytemap to the value already contained there will leave the map unchanged.
Conversely, setting an index in a map to a value `VAL` and then retrieving the value at that index will yield `VAL`.
A getting operation can safeley ignore setting operation on unrelated indices.

```k
    rule #set(BMAP, IDX, #get(BMAP, IDX)) => BMAP [smt-lemma]

    rule #get(#set(BMAP, IDX', VAL), IDX) => VAL             requires         IDX ==Int IDX'
    rule #get(#set(BMAP, IDX', VAL), IDX) => #get(BMAP, IDX) requires notBool IDX ==Int IDX'
```

TODO: We should inspect the two functions `#getRange` and `#setRange` closer.
They are non-trivial in their implementation, but the following should obviously hold from the intended semantics.

```k
    rule #setRange(BM, EA, #getRange(BM, EA, WIDTH), WIDTH) => BM
```

```k
endmodule
```

Specialized Lemmas
==================

The following are lemmas that should not be included in every proof, but are necessary for certain proofs.

Concrete Memory
---------------

```k
module MEMORY-CONCRETE-TYPE-LEMMAS
    imports KWASM-LEMMAS
```

TODO: Maybe rewrite `#getRange` in terms of bit shifts.

```k
    rule #getRange(BM, START, WIDTH) => 0
      requires notBool (WIDTH >Int 0)
      [simplification]
    rule #getRange(BM, START, WIDTH) => #get(BM, START) +Int (#getRange(BM, START +Int 1, WIDTH -Int 1) *Int 256)
      requires          WIDTH >Int 0
       andBool #isByteMap(BM)
      ensures  0 <=Int #get(BM, START)
       andBool #get(BM, START) <Int 256
      [simplification]

    rule #wrap(WIDTH, N) => N modInt (1 <<Int WIDTH)
      [simplification]

endmodule
```

WRC20
-----

### Lemmas

```k
module WRC20-LEMMAS
    imports KWASM-LEMMAS
```

Z3 is slow to reason about modular arithmetic for symbolic congruence classes, but can be quite efficient for specific values.
Since memory mostly uses modulo 256, we add special cases for this.

```k
    rule X *Int 256 >>Int N => (X >>Int (N -Int 8))   requires  N >=Int 8 [simplification]
```

The following is valid because there can be no carry from the addition of the least 8 bits, since they are all 0 in the case of X * 256.

```k
    rule (Y +Int X *Int 256) >>Int N => (Y >>Int N) +Int (X >>Int (N -Int 8))   requires  N >=Int 8 [simplification]
```

TODO: Maybe rewrite `#setRange` in terms of bit shifts.

```k
    rule X /Int 256 => X >>Int 8


//Experimental:

    rule #getRange(BM, ADDR, WIDTH)  >>Int N => #getRange(BM, ADDR +Int 1, WIDTH -Int 1)  >>Int (N -Int 8)
      requires N >=Int 8 andBool WIDTH >Int 1

    rule #getRange(BM, ADDR, WIDTH) modInt 256 => #get(BM, ADDR)
      requires WIDTH =/=Int 0
       andBool #isByteMap(BM)
      ensures 0 <=Int #get(BM, ADDR)
       andBool #get(BM, ADDR) <Int 256

    rule #getRange(BM, ADDR, WIDTH) => #get(BM, ADDR)
      requires WIDTH ==Int 1
       ensures 0 <=Int #get(BM, ADDR)
       andBool #get(BM, ADDR) <Int 256

    rule (#get(BM, ADDR) +Int (X +Int Y)) modInt 256 => (#get(BM, ADDR) +Int ((X +Int Y) modInt 256)) modInt 256
    rule (#get(BM, ADDR) +Int X)           >>Int 8   => X >>Int 8 requires X modInt 256 ==Int 0 andBool #isByteMap(BM)

    //rule (#isByteMap(BM) andBool N >=Int 8) impliesBool (((#get(BM, ADDR) <<Int N) +Int X >=Int 256 orBool (#get(BM, ADDR) <<Int N) +Int X ==Int 0) ==Bool X >=Int 256 orBool X ==Int 0) => true [smt-lemma]

// TODO: Generalize
    rule (X <<Int 8) +Int (Y <<Int 16) => (X +Int (Y <<Int 8)) <<Int 8
    rule (#get(BM, IDX) +Int (X <<Int 8)) >>Int N => X >>Int (N -Int 8) requires #isByteMap(BM) andBool N >=Int 8

// DANGER: UNSOUND
//    rule (#get(BM, ADDR) +Int X) >>Int 8 => X >>Int 8

    rule ((X <<Int M) +Int Y) >>Int N => (X <<Int (M -Int N)) +Int (Y >>Int N) requires M >=Int N

    rule 0 <=Int X impliesBool 0 <=Int (X <<Int N) => true [smt-lemma]
    rule 0 <=Int X impliesBool 0 <=Int (X >>Int N) => true [smt-lemma]

endmodule
```

### Macros

The following module gives macros for the wrc20 code so that its parts can be expressed succinctly in proofs.

```k
module WRC20
    imports WASM-TEXT
```

A module of shorthand commands for the WRC20 module.

```k
    syntax Stmts     ::= "#wrc20"
    syntax Defns     ::= "#wrc20Body"
    syntax Defns     ::= "#wrc20Imports"
    syntax Defns     ::= "#wrc20Functions"
    syntax Defns     ::= "#wrc20ReverseBytes"
    syntax TypeDecls ::= "#wrc20ReverseBytesTypeDecls"
 // --------------------------------------------------
    rule #wrc20 => ( module #wrc20Body ) .EmptyStmts [macro]

    rule #wrc20Body => #wrc20Imports ++Defns #wrc20Functions [macro]

    rule #wrc20Imports =>
      (func String2Identifier("$revert")          ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"revert\"") )          param i32 i32 .ValTypes .TypeDecls )
      (func String2Identifier("$finish")          ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"finish\"") )          param i32 i32 .ValTypes .TypeDecls )
      (func String2Identifier("$getCallDataSize") ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"getCallDataSize\"") ) result i32 .ValTypes .TypeDecls )
      (func String2Identifier("$callDataCopy")    ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"callDataCopy\"") )    param i32 i32 i32 .ValTypes .TypeDecls )
      (func String2Identifier("$storageLoad")     ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"storageLoad\"") )     param i32 i32 .ValTypes .TypeDecls )
      (func String2Identifier("$storageStore")    ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"storageStore\"") )    param i32 i32 .ValTypes .TypeDecls )
      (func String2Identifier("$getCaller")       ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"getCaller\"") )       param i32 .ValTypes .TypeDecls )
      ( memory ( export #unparseWasmString("\"memory\"") ) 1 )
      .Defns
      [macro]

    rule #wrc20Functions =>
      (func ( export #unparseWasmString("\"main\"") ) .TypeDecls .LocalDecls
        block .TypeDecls
          block .TypeDecls
            call String2Identifier("$getCallDataSize")
            i32.const 4
            i32.ge_u
            br_if 0
            i32.const 0
            i32.const 0
            call String2Identifier("$revert")
            br 1
            .EmptyStmts
          end
          i32.const 0
          i32.const 0
          i32.const 4
          call String2Identifier("$callDataCopy")
          block .TypeDecls
            i32.const 0
            i32.load
            i32.const 436376473:Int
            i32.eq
            i32.eqz
            br_if 0
            call String2Identifier("$do_balance")
            br 1
            .EmptyStmts
          end
          block .TypeDecls
            i32.const 0 i32.load
            i32.const 3181327709:Int
            i32.eq
            i32.eqz
            br_if 0
            call String2Identifier("$do_transfer")
            br 1
            .EmptyStmts
          end
          i32.const 0
          i32.const 0
          call String2Identifier("$revert")
          .EmptyStmts
        end
        .EmptyStmts
      )

      (func String2Identifier("$do_balance") .TypeDecls .LocalDecls
        block .TypeDecls
          block .TypeDecls
            call String2Identifier("$getCallDataSize")
            i32.const 24
            i32.eq
            br_if 0
            i32.const 0
            i32.const 0
            call String2Identifier("$revert")
            br 1
            .EmptyStmts
          end
          i32.const 0
          i32.const 4
          i32.const 20
          call String2Identifier("$callDataCopy")
          i32.const 0
          i32.const 32
          call String2Identifier("$storageLoad")
          i32.const 32
          i32.const 32
          i64.load
          call String2Identifier("$i64.reverse_bytes")
          i64.store
          i32.const 32
          i32.const 8
          call String2Identifier("$finish")
          .EmptyStmts
        end
        .EmptyStmts )

      (func String2Identifier("$do_transfer") .TypeDecls local i64 i64 i64 .ValTypes .LocalDecls
        block .TypeDecls
          block .TypeDecls
            call String2Identifier("$getCallDataSize")
            i32.const 32
            i32.eq
            br_if 0
            i32.const 0
            i32.const 0
            call String2Identifier("$revert")
            br 1
            .EmptyStmts
          end
          i32.const 0
          call String2Identifier("$getCaller")
          i32.const 32
          i32.const 4
          i32.const 20
          call String2Identifier("$callDataCopy")
          i32.const 64
          i32.const 24
          i32.const 8
          call String2Identifier("$callDataCopy")
          i32.const 64
          i64.load
          call String2Identifier("$i64.reverse_bytes")
          local.set 0
          i32.const 0
          i32.const 64
          call String2Identifier("$storageLoad")
          i32.const 64
          i64.load
          local.set 1
          i32.const 32
          i32.const 64
          call String2Identifier("$storageLoad")
          i32.const 64
          i64.load
          local.set 2
          block .TypeDecls
            local.get 0
            local.get 1
            i64.le_u
            br_if 0
            i32.const 0
            i32.const 0
            call String2Identifier("$revert")
            br 1
            .EmptyStmts
          end
          local.get 1
          local.get 0
          i64.sub
          local.set 1
          local.get 2
          local.get 0
          i64.add
          local.set 2
          i32.const 64
          local.get 1
          i64.store
          i32.const 0
          i32.const 64
          call String2Identifier("$storageStore")
          i32.const 64
          local.get 2
          i64.store
          i32.const 32
          i32.const 64
          call String2Identifier("$storageStore")
          .EmptyStmts
        end
        .EmptyStmts
      )

      #wrc20ReverseBytes
      [macro]

    rule #wrc20ReverseBytesTypeDecls => param i64 .ValTypes result i64 .ValTypes .TypeDecls [macro]

    rule #wrc20ReverseBytes =>
      (func String2Identifier("$i64.reverse_bytes") #wrc20ReverseBytesTypeDecls local i64 i64 .ValTypes .LocalDecls
        block .TypeDecls
          loop .TypeDecls
            local.get 1
            i64.const 8
            i64.ge_u
            br_if 1
            local.get 0
            i64.const 56
            local.get 1
            i64.const 8
            i64.mul
            i64.sub
            i64.shl
            i64.const 56
            i64.shr_u
            i64.const 56
            i64.const 8
            local.get 1
            i64.mul
            i64.sub
            i64.shl
            local.get 2
            i64.add
            local.set 2
            local.get 1
            i64.const 1
            i64.add
            local.set 1
            br 0
            .EmptyStmts
          end
          .EmptyStmts
        end
        local.get 2
        .EmptyStmts
        )
      .Defns
      [macro]

    syntax Defns ::= Defns "++Defns" Defns [function, functional]
 // -------------------------------------------------------------
    rule .Defns ++Defns DS' => DS'
    rule (D DS) ++Defns DS' => D (DS ++Defns DS')
```

```k
endmodule
```

TODO: Upstream these, but don't commit them with the WRC20 proof (they aren't needed).

```k
module GENERAL-ARITHMETIC-LEMMAS
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
