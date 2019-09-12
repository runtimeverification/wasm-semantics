WebAssembly State and Semantics
===============================

```k
module WASM-SYNTAX
    imports WASM-DATA
endmodule
```

```k
module WASM-DATA
    imports INT
    imports BOOL
    imports STRING
    imports LIST
    imports MAP
    imports FLOAT
    imports BYTES
```


```k
    syntax OptionalInt ::= Int | ".Int"
 // -----------------------------------

    syntax IValType ::= "i32" | "i64"
    syntax ValType  ::= IValType
 // ----------------------------

    syntax Int ::= #pow  ( IValType ) [function, smtlib(pow )] /* 2 ^Int #width(T)          */
                 | #pow1 ( IValType ) [function, smtlib(pow1)] /* 2 ^Int (#width(T) -Int 1) */
 // ------------------------------------------------------------------------------------------
    rule #pow1(i32) => 2147483648
    rule #pow (i32) => 4294967296
    rule #pow1(i64) => 9223372036854775808
    rule #pow (i64) => 18446744073709551616
```

Values
------

### Basic Values

WebAssembly values are either integers or floating-point numbers, of 32- or 64-bit widths.

```k
    syntax Number ::= Int | Float
 // -----------------------------
```

Proper values are numbers annotated with their types.

```k
    syntax IVal ::= "<" IValType ">" Int    [klabel(<_>_)]
    syntax  Val ::= IVal
 // --------------------
```

We also add `undefined` as a value, which makes many partial functions in the semantics total.

```k
    syntax Val ::= "undefined"
 // --------------------------
```

### Value Operations

The `#chop` function will ensure that an integer value is wrapped to the correct bit-width.
The `#wrap` function wraps an integer to a given bit width.

```k
    syntax IVal ::= #chop ( IVal ) [function]
 // -----------------------------------------
    rule #chop(< ITYPE > N) => < ITYPE > (N modInt #pow(ITYPE)) [concrete]

    syntax Int  ::= #wrap(Int, Int) [function]
 // ------------------------------------------
    rule #wrap(WIDTH, N) => N modInt (1 <<Int WIDTH) [concrete]
```

### Signed Interpretation

Functions `#signed` and `#unsigned` allow for easier operation on twos-complement numbers.
These functions assume that the argument integer is in the valid range of signed and unsigned values of the respective type, so they will not correctly map arbitrary integers into the corret range.
Some operations extend integers from 1, 2, or 4 bytes, so a special function with a bit width argument helps with the conversion.

```k
    syntax Int ::= #signed      ( IValType , Int ) [function]
                 | #unsigned    ( IValType , Int ) [function]
                 | #signedWidth ( Int      , Int ) [function]
 // ---------------------------------------------------------
    rule #unsigned(ITYPE, N) => N +Int #pow(ITYPE) requires N  <Int 0
    rule #unsigned(ITYPE, N) => N                  requires 0 <=Int N
```

Data Structures
---------------

WebAssembly is a stack-machine, so here we provide the stack to operate over.
Operator `_++_` implements an append operator for sort `ValStack`.

```k
    syntax ValStack ::= ".ValStack"
                   | Val      ":"  ValStack
                   | ValStack "++" ValStack [function]
 // --------------------------------------------------
    rule .ValStack       ++ VALSTACK' => VALSTACK'
    rule (SI : VALSTACK) ++ VALSTACK' => SI : (VALSTACK ++ VALSTACK')
```


Byte Map
--------

Wasm memories are byte arrays, sized in pages of 65536 bytes, initialized to be all zero bytes.
To avoid storing many zeros in what may be sparse memory, we implement memory as maps, and store only non-zero bytes.
The maps store integers, but maintains the invariant that each stored integer is between 1 and 255, inclusive.
`BM [ N := I ]` writes the integer `I` to memory as bytes (little-endian), starting at index `N`.

```k
    syntax Map ::= Map "[" Int ":=" Int "]" [function]
 // --------------------------------------------------
    rule BM [ IDX := 0  ] => BM
    rule BM [ IDX := VAL] => BM [IDX <- VAL modInt 256 ] [ IDX +Int 1 := VAL /Int 256 ]
      requires VAL modInt 256 =/=Int 0
       andBool VAL >Int 0
    // Don't store 0 bytes.
    rule BM [ IDX := VAL] => BM [IDX <- undef          ] [ IDX +Int 1 := VAL /Int 256 ]
      requires VAL modInt 256 ==Int 0
       andBool VAL >Int 0
```

`#range(BM, START, WIDTH)` reads off `WIDTH` elements from `BM` beginning at position `START`, and converts it into an unsigned integer.
The function interprets the range of bytes as little-endian.

```k
    syntax Int ::= #range ( Map , Int , Int ) [function]
 // ----------------------------------------------------
    rule #range(BM:Map, START, WIDTH) => 0
      requires WIDTH ==Int 0
    rule #range(BM:Map, START, WIDTH) => #lookup(BM, START) +Int (#range(BM, START +Int 1, WIDTH -Int 1) *Int 256)
      requires WIDTH >Int 0 [concrete]
```

`#lookup` looks up a key in a map, defaulting to 0 if the map does not contain the key.

```k
    syntax Int ::= #lookup ( Map , Int ) [function]
 // -----------------------------------------------
    rule #lookup( (KEY |-> VAL) M, KEY ) => VAL                               [concrete]
    rule #lookup(               M, KEY ) => 0 requires notBool KEY in_keys(M) [concrete]
```

`#clearRange(MAP, START, END)` removes all entries in the map from `START` (inclusive) to `END` (exclusive).

```k
    syntax Map ::= #clearRange(Map, Int, Int) [function]
 // ----------------------------------------------------
    rule #clearRange(M, START, END) => M
      requires START >=Int END
    rule #clearRange(M, START, END) => #clearRange(M [START <- undef], START +Int 1, END)
      requires START <Int  END
```


```k
endmodule
```

```k
module WASM
    imports WASM-DATA
```

Configuration
-------------

```k
    configuration
      <wasm>
        <k> $PGM:Stmts </k>
        <valstack> .ValStack </valstack>
        <curFrame>
          <curModIdx> .Int </curModIdx>
        </curFrame>
        <moduleInstances>
          <moduleInst multiplicity="*" type="Map">
            <modIdx>      0    </modIdx>
            <memAddrs>    .Map </memAddrs>
          </moduleInst>
        </moduleInstances>
        <nextModuleIdx> 0 </nextModuleIdx>
        <mainStore>
          <mems>
            <memInst multiplicity="*" type="Map">
              <mAddr> 0    </mAddr>
              <mmax>  .Int </mmax>
              <msize> 0    </msize>
              <mdata> .Map </mdata>
            </memInst>
          </mems>
        </mainStore>
      </wasm>
```

```k
    syntax Instr ::= PlainInstr
 // ---------------------------
```
```k
    syntax EmptyStmt
 // ----------------

    syntax Instr ::= EmptyStmt
    syntax Defn  ::= EmptyStmt
    syntax Stmt  ::= Instr | Defn
 // -----------------------------

    syntax EmptyStmts ::= List{EmptyStmt , ""} [klabel(listStmt)]
    syntax Instrs     ::= List{Instr     , ""} [klabel(listStmt)]
    syntax Defns      ::= List{Defn      , ""} [klabel(listStmt)]
    syntax Stmts      ::= List{Stmt      , ""} [klabel(listStmt)]
 // -------------------------------------------------------------

    syntax Instrs ::= EmptyStmts
    syntax Defns  ::= EmptyStmts
    syntax Stmts  ::= Instrs | Defns
 // --------------------------------
    rule          <k> .Stmts          => .       ... </k>
    rule          <k> (S:Stmt .Stmts) => S       ... </k>
    rule [step] : <k> (S:Stmt SS)     => S ~> SS ... </k> requires SS =/=K .Stmts
```
```k
    syntax Instr ::= "trap"
 // -----------------------
    rule <k> trap ~> (I:Instr   => .) ... </k>
    rule <k> trap ~> (IS:Instrs => .) ... </k>
    rule <k> trap ~> (D:Defn    => .) ... </k>
    rule <k> trap ~> (DS:Defns  => .) ... </k>

    rule <k> trap ~> (S:Stmt SS:Stmts => S ~> SS) ... </k>
```
```k
    rule <k> undefined => trap ... </k>
    rule <k>        V:Val    => .        ... </k>
         <valstack> VALSTACK => V : VALSTACK </valstack>
      requires V =/=K undefined
```
```k
    syntax PlainInstr ::= IValType "." "const" Int
 // -------------------------------------------------
    rule <k> ITYPE:IValType . const VAL => #chop (< ITYPE > VAL) ... </k>
```
```k
    syntax Int ::= #pageSize()      [function]
    syntax Int ::= #maxMemorySize() [function]
    syntax Int ::= #maxTableSize()  [function]
 // ------------------------------------------
    rule #pageSize()      => 65536
    rule #maxMemorySize() => 65536
    rule #maxTableSize()  => 4294967296
```


```k
endmodule
```
