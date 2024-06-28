Arithmetic normalization
========================

The normal form of an arithmetic expression is less well defined.

* there are no '-' operations, `A +Int -1 *Int B` is used instead of
  `A -Int B
* Addition is grouped to the left, i.e.,
  `((..((A +Int B) +Int C) +Int ...) +Int Z)`
* Only the last element of an addition is concrete, i.e. `(A +Int B) +Int 7`
  is normal, `(A +Int 7) +Int 8` and `(A +Int 7) +Int C` are not.
* Multiplication is grouped to the right, i.e.,
  `(Z *Int (... *Int (C *Int (A *Int B)) ...))`
* Only the fist element of multiplication is concrete, i.e., `7 *Int (A *Int B)`
  is normal, `8 *Int (7 *Int A)` and `C *Int (7*Int B)` are not.
* Multiplication with constants is always distributed, i.e.,
  `7 *Int A +Int 7 *Int B` is normal, `7 *Int (A +Int B)` is not.
* (Not fully enforced): Constants multiplied with the same symbolic term, then
  added, are merged, i.e., `(7 *Int A +Int B) +Int 8 *Int A` is not normal and
  will be transformed to `15 *Int A +Int B`
```k
module WASM-INT-ARITHMETIC-NORMALIZATION
  imports INT

  // The rules below complement the ones in INT-KORE

```
-Int elimination
----------------
```k
  
  rule X -Int Y => X +Int (-1 *Int Y)  [simplification]

```
+Int
----

* associativity
```k
  rule X +Int (Y +Int Z) => (X +Int Y) +Int Z  [simplification]

```
* constants
```k
  rule I +Int X => X +Int I  [simplification, symbolic(X), concrete(I)]
  rule (X +Int I) +Int Y => (X +Int Y) +Int I  [simplification, symbolic(X, Y), concrete(I)]
```
*Int
----

* associativity
```k
  rule (X *Int Y) *Int Z => X *Int (Y *Int Z)  [simplification]

```
* constants
```k
  rule X *Int I => I *Int X  [simplification, symbolic(X), concrete(I)]
  rule X *Int (I *Int Y) => I *Int (X *Int Y)  [simplification, symbolic(X, Y), concrete(I)]
  rule I1 *Int (I2 *Int X) => (I1 *Int I2) *Int X  [simplification, symbolic(X), concrete(I1, I2)]

  rule 1 *Int X => X  [simplification]
  rule 0 *Int _ => 0  [simplification]

```
Distributivity for *Int and +Int
--------------------------------

* Multiplication with constants
```k
  rule I *Int (X +Int Y) => I *Int X +Int I *Int Y
      [simplification, symbolic(X), concrete(I)]
  rule I *Int (X +Int Y) => I *Int X +Int I *Int Y
      [simplification, symbolic(Y), concrete(I)]
```
* Reverse distributivity for different-constants * same-term.
```k
  // It would be really nice if the backend would check the equality for the
  // two occurrences of X by matching. The next best option is to make these
  // rules low-priority, so they are applied only after the formula has already
  // stabilized (including normalization).
  rule X +Int X => 2 *Int X  [simplification(200)]
  rule X +Int I *Int X => (1 +Int I) *Int X  [simplification(200), concrete(I)]
  rule I *Int X +Int X => (1 +Int I) *Int X  [simplification(200), concrete(I)]
  rule I1 *Int X +Int I2 *Int X => (I1 +Int I2) *Int X  [simplification(200), concrete(I1, I2)]
```
* Generalized reverse distributivity
```k
  // The backends do not allow to do meta-manipulation of terms (e.g. to sort
  // them by some criteria), so this is an attempt to catch the most common
  // non-basic cases for reverse distributivity:

  // Distance 1:
  rule (X +Int Y) +Int X => 2 *Int X +Int Y
      [simplification(200)]
  rule (X +Int Y) +Int I *Int X => (1 +Int I) *Int X +Int Y
      [simplification(200), concrete(I)]
  rule (I *Int X +Int Y) +Int X => (1 +Int I) *Int X +Int Y
      [simplification(200), concrete(I)]
  rule (I1 *Int X +Int Y) +Int I2 *Int X => (I1 +Int I2) *Int X +Int Y
      [simplification(200), symbolic(X), concrete(I1, I2)]

  rule (Y +Int X) +Int X => Y +Int 2 *Int X
      [simplification(200)]
  rule (Y +Int X) +Int I *Int X => Y +Int (1 +Int I) *Int X
      [simplification(200), concrete(I)]
  rule (Y +Int I *Int X) +Int X => Y +Int (1 +Int I) *Int X
      [simplification(200), concrete(I)]
  rule (Y +Int I1 *Int X) +Int I2 *Int X => Y +Int (I1 +Int I2) *Int X
      [simplification(200), concrete(I1, I2)]

  // Distance 2:
  rule ((X +Int Y) +Int Z) +Int X => (2 *Int X +Int Y) +Int Z
      [simplification(200)]
  rule ((X +Int Y) +Int Z) +Int I *Int X => ((1 +Int I) *Int X +Int Y) +Int Z
      [simplification(200), concrete(I)]
  rule ((I *Int X +Int Y) +Int Z) +Int X => ((1 +Int I) *Int X +Int Y) +Int Z
      [simplification(200), concrete(I)]
  rule ((I1 *Int X +Int Y) +Int Z) +Int I2 *Int X => ((I1 +Int I2) *Int X +Int Y) +Int Z
      [simplification(200), symbolic(X), concrete(I1, I2)]

  rule ((Y +Int X) +Int Z) +Int X => (Y +Int 2 *Int X) +Int Z
      [simplification(200)]
  rule ((Y +Int X) +Int Z) +Int I *Int X => (Y +Int (1 +Int I) *Int X) +Int Z
      [simplification(200), concrete(I)]
  rule ((Y +Int I *Int X) +Int Z) +Int X => (Y +Int (1 +Int I) *Int X) +Int Z
      [simplification(200), concrete(I)]
  rule ((Y +Int I1 *Int X) +Int Z) +Int I2 *Int X => (Y +Int (I1 +Int I2) *Int X) +Int Z
      [simplification(200), concrete(I1, I2)]

  // Distance 3:
  rule (((X +Int Y) +Int Z) +Int T) +Int X => ((2 *Int X +Int Y) +Int Z) +Int T
      [simplification(200)]
  rule (((X +Int Y) +Int Z) +Int T) +Int I *Int X => (((1 +Int I) *Int X +Int Y) +Int Z) +Int T
      [simplification(200), concrete(I)]
  rule (((I *Int X +Int Y) +Int Z) +Int T) +Int X => (((1 +Int I) *Int X +Int Y) +Int T) +Int Z
      [simplification(200), concrete(I)]
  rule (((I1 *Int X +Int Y) +Int Z) +Int T) +Int I2 *Int X => (((I1 +Int I2) *Int X +Int Y) +Int T) +Int Z
      [simplification(200), symbolic(X), concrete(I1, I2)]

  rule (((Y +Int X) +Int Z) +Int T) +Int X => ((Y +Int 2 *Int X) +Int Z) +Int T
      [simplification(200)]
  rule (((Y +Int X) +Int Z) +Int T) +Int I *Int X => ((Y +Int (1 +Int I) *Int X) +Int Z) +Int T
      [simplification(200), concrete(I)]
  rule (((Y +Int I *Int X) +Int Z) +Int T) +Int X => ((Y +Int (1 +Int I) *Int X) +Int Z) +Int T
      [simplification(200), concrete(I)]
  rule (((Y +Int I1 *Int X) +Int Z) +Int T) +Int I2 *Int X => ((Y +Int (I1 +Int I2) *Int X) +Int Z) +Int T
      [simplification(200), concrete(I1, I2)]

  // Distance 4:
  rule ((((X +Int Y) +Int Z) +Int T) +Int S) +Int X => (((2 *Int X +Int Y) +Int Z) +Int T) +Int S
      [simplification(200)]
  rule ((((X +Int Y) +Int Z) +Int T) +Int S) +Int I *Int X => ((((1 +Int I) *Int X +Int Y) +Int Z) +Int T) +Int S
      [simplification(200), concrete(I)]
  rule ((((I *Int X +Int Y) +Int Z) +Int T) +Int S) +Int X => ((((1 +Int I) *Int X +Int Y) +Int T) +Int S) +Int Z
      [simplification(200), concrete(I)]
  rule ((((I1 *Int X +Int Y) +Int Z) +Int T) +Int S) +Int I2 *Int X => ((((I1 +Int I2) *Int X +Int Y) +Int T) +Int S) +Int Z
      [simplification(200), symbolic(X), concrete(I1, I2)]

  rule ((((Y +Int X) +Int Z) +Int T) +Int S) +Int X => (((Y +Int 2 *Int X) +Int Z) +Int S) +Int T
      [simplification(200)]
  rule ((((Y +Int X) +Int Z) +Int T) +Int S) +Int I *Int X => (((Y +Int (1 +Int I) *Int X) +Int Z) +Int T) +Int S
      [simplification(200), concrete(I)]
  rule ((((Y +Int I *Int X) +Int Z) +Int T) +Int S) +Int X => (((Y +Int (1 +Int I) *Int X) +Int Z) +Int T) +Int S
      [simplification(200), concrete(I)]
  rule ((((Y +Int I1 *Int X) +Int Z) +Int T) +Int S) +Int I2 *Int X => (((Y +Int (I1 +Int I2) *Int X) +Int Z) +Int T) +Int S
      [simplification(200), concrete(I1, I2)]
endmodule

```