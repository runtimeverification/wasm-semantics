WebAssembly State and Semantics
===============================

```k
require "data.k"
require "numeric.k"

module WASM
    imports WASM-DATA
    imports WASM-NUMERIC
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
                        | FValType "." "const" Number
 // -------------------------------------------------
    rule <k> ITYPE:IValType . const VAL => #chop (< ITYPE > VAL) ... </k>
    rule <k> FTYPE:FValType . const VAL => #round(  FTYPE , VAL) ... </k>
```

Structured Control Flow
-----------------------

`nop` does nothing.

```k
    syntax PlainInstr ::= "nop"
 // ---------------------------
    rule <k> nop => . ... </k>
```

`unreachable` causes an immediate `trap`.

```k
    syntax PlainInstr ::= "unreachable"
 // -----------------------------------
    rule <k> unreachable => trap ... </k>
```

Memory
------


The assorted store operations take an address of type `i32` and a value.
The `storeX` operations first wrap the the value to be stored to the bit wdith `X`.
The value is encoded as bytes and stored at the "effective address", which is the address given on the stack plus offset.

```k
    syntax Instr ::= IValType "." StoreOp Int Int
 //                | FValType "." StoreOp Int Float
                   | "store" "{" Int Int Number "}"
 // -----------------------------------------------

    syntax PlainInstr ::= IValType  "." StoreOpM
                        | FValType  "." StoreOpM
 // --------------------------------------------

    syntax StoreOpM ::= StoreOp | StoreOp MemArg
 // --------------------------------------------
    rule <k> ITYPE . SOP:StoreOp               => ITYPE . SOP  IDX                          VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>
    rule <k> ITYPE . SOP:StoreOp MEMARG:MemArg => ITYPE . SOP (IDX +Int #getOffset(MEMARG)) VAL ... </k>
         <valstack> < ITYPE > VAL : < i32 > IDX : VALSTACK => VALSTACK </valstack>

    rule <k> store { WIDTH EA VAL } => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA => #clearRange(DATA, EA, EA +Int WIDTH) [EA := VAL ] </mdata>
           ...
         </memInst>
         requires (EA +Int WIDTH) <=Int (SIZE *Int #pageSize())

    rule <k> store { WIDTH  EA  _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
         requires (EA +Int WIDTH) >Int (SIZE *Int #pageSize())

    syntax StoreOp ::= "store" | "store8" | "store16" | "store32"
 // -------------------------------------------------------------
    rule <k> ITYPE . store   EA VAL => store { #numBytes(ITYPE) EA VAL            } ... </k>
    rule <k> _     . store8  EA VAL => store { 1                EA #wrap(8,  VAL) } ... </k>
    rule <k> _     . store16 EA VAL => store { 2                EA #wrap(16, VAL) } ... </k>
    rule <k> i64   . store32 EA VAL => store { 4                EA #wrap(32, VAL) } ... </k>
```

The assorted load operations take an address of type `i32`.
The `loadX_sx` operations loads `X` bits from memory, and extend it to the right length for the return value, interpreting the bytes as either signed or unsigned according to `sx`.
The value is fetched from the "effective address", which is the address given on the stack plus offset.
Sort `Signedness` is defined in module `BYTES`.

```k
    syntax Instr ::= "load" "{" IValType Int Int Signedness"}"
 // ----------------------------------------------------------

    syntax PlainInstr ::= IValType "." LoadOpM
                        | FValType "." LoadOpM
                        | IValType "." LoadOp Int
 // ---------------------------------------------

    syntax LoadOpM ::= LoadOp | LoadOp MemArg
 // -----------------------------------------
    rule <k> ITYPE . LOP:LoadOp               => ITYPE . LOP  IDX                          ... </k>
         <valstack> < i32 > IDX : VALSTACK    => VALSTACK </valstack>
    rule <k> ITYPE . LOP:LoadOp MEMARG:MemArg => ITYPE . LOP (IDX +Int #getOffset(MEMARG)) ... </k>
         <valstack> < i32 > IDX : VALSTACK    => VALSTACK </valstack>

    rule <k> load { ITYPE WIDTH EA SIGN }
          => < ITYPE > #if SIGN ==K Signed
                           #then #signedWidth(WIDTH, #range(DATA, EA, WIDTH))
                           #else #range(DATA, EA, WIDTH)
                       #fi
         ...
         </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           <mdata>   DATA </mdata>
           ...
         </memInst>
      requires (EA +Int WIDTH) <=Int (SIZE *Int #pageSize())

    rule <k> load { _ WIDTH EA _ } => trap ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
      requires (EA +Int WIDTH) >Int (SIZE *Int #pageSize())

    syntax LoadOp ::= "load"
                    | "load8_u" | "load16_u" | "load32_u"
                    | "load8_s" | "load16_s" | "load32_s"
 // -----------------------------------------------------
    rule <k> ITYPE . load     EA:Int => load { ITYPE #numBytes(ITYPE) EA Unsigned } ... </k>
    rule <k> ITYPE . load8_u  EA:Int => load { ITYPE 1                EA Unsigned } ... </k>
    rule <k> ITYPE . load16_u EA:Int => load { ITYPE 2                EA Unsigned } ... </k>
    rule <k> i64   . load32_u EA:Int => load { i64   4                EA Unsigned } ... </k>
    rule <k> ITYPE . load8_s  EA:Int => load { ITYPE 1                EA Signed   } ... </k>
    rule <k> ITYPE . load16_s EA:Int => load { ITYPE 2                EA Signed   } ... </k>
    rule <k> i64   . load32_s EA:Int => load { i64   4                EA Signed   } ... </k>
```

`MemArg`s can optionally be passed to `load` and `store` operations.
The `offset` parameter is added to the the address given on the stack, resulting in the "effective address" to store to or load from.
The `align` parameter is for optimization only and is not allowed to influence the semantics, so we ignore it.

```k
    syntax MemArg ::= OffsetArg | AlignArg | OffsetArg AlignArg
 // -----------------------------------------------------------

    syntax OffsetArg ::= "offset=" Int
    syntax AlignArg  ::= "align="  Int
 // ----------------------------------

    syntax Int ::= #getOffset ( MemArg ) [function]
 // -----------------------------------------------
    rule #getOffset(           _:AlignArg) => 0
    rule #getOffset(offset= OS           ) => OS
    rule #getOffset(offset= OS _:AlignArg) => OS
```

The `size` operation returns the size of the memory, measured in pages.

```k
    syntax PlainInstr ::= "memory.size"
 // -----------------------------------
    rule <k> memory.size => < i32 > SIZE ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <memInst>
           <mAddr>   ADDR </mAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
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
