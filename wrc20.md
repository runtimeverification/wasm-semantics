WRC20
=====

```k
requires "kwasm-lemmas.k"
```

Lemmas
------

```k
module WRC20-LEMMAS [symbolic]
    imports WRC20
    imports KWASM-LEMMAS
```

These conversions turns out to be helpful in this particular proof, but we don't want to apply it on all KWasm proofs.

```k
    rule X /Int N => X >>Int 8  requires N ==Int 256 [simplification]
```

TODO: The following theorems should be generalized and proven, and moved to the set of general lemmas.
Perhaps using `requires N ==Int 2 ^Int log2Int(N)`?
Also, some of these have concrete integers on the LHS.
It may be better to use a symbolic value as a side condition, e.g. `rule N => foo requires N ==Int 8`, because simplifications rely on exact matching of the LHS.

```k
    rule X *Int 256 >>Int N => (X >>Int (N -Int 8))   requires  N >=Int 8 [simplification]

    rule (Y +Int X *Int 256) >>Int N => (Y >>Int N) +Int (X >>Int (N -Int 8))   requires  N >=Int 8 [simplification]

    rule (X <<Int 8) +Int (Y <<Int 16) => (X +Int (Y <<Int 8)) <<Int 8 [simplification]

    rule (X <<Int N) +Int (Y <<Int M) => (X +Int (Y <<Int (M -Int N))) <<Int N
      requires N <=Int M
      [simplification]

    rule (X <<Int N) +Int (Y <<Int M) => ((X <<Int (N -Int M)) +Int Y) <<Int M
      requires N >Int M
      [simplification]

    rule (X +Int (Y <<Int M)) modInt N => X +Int ((Y <<Int M) modInt N)
      requires N ==Int (1 <<Int log2Int(N))
       andBool N >=Int 256
       andBool 0 <=Int X
       andBool X <Int 256
       andBool M >=Int 8
      [simplification]
```

```k
endmodule
```

Macros
------

The following module gives macros for the wrc20 code so that its parts can be expressed succinctly in proofs.

```k
module WRC20
    imports WASM-TEXT
```

A module of shorthand commands for the WRC20 module.

```k
    syntax ModuleDecl ::= "#wrc20"
    syntax Defns      ::= "#wrc20Body"
    syntax Defns      ::= "#wrc20Imports"
    syntax Defns      ::= "#wrc20Functions_fastBalance"
    syntax Defns      ::= "#wrc20ReverseBytes"
    syntax TypeDecls  ::= "#wrc20ReverseBytesTypeDecls"
 // ---------------------------------------------------
    rule #wrc20 => ( module #wrc20Body ) [macro]

    rule #wrc20Body => #wrc20Imports ++Defns #wrc20Functions_fastBalance [macro]

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

    rule #wrc20Functions_fastBalance =>
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
          call String2Identifier("$i64.reverse_bytes")
          local.set 1
          i32.const 32
          i32.const 64
          call String2Identifier("$storageLoad")
          i32.const 64
          i64.load
          call String2Identifier("$i64.reverse_bytes")
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
          call String2Identifier("$i64.reverse_bytes")
          i64.store
          i32.const 0
          i32.const 64
          call String2Identifier("$storageStore")
          i32.const 64
          local.get 2
          call String2Identifier("$i64.reverse_bytes")
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
