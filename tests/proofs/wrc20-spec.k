requires "kwasm-lemmas.k"

// This is the "fast transfer" version of the WRC20 spec by pauld.

// There is no specified behavior yet.
// As long as the program parses correctly, the spec will pass.

module WRC20-SPEC
  imports KWASM-LEMMAS

  rule <k>
    ( module
      
      (func DOLLAR__REVERT:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"revert\"") ) param i32 i32 .ValTypes .TypeDecls ) 
      (func DOLLAR__FINISH:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"finish\"") ) param i32 i32 .ValTypes .TypeDecls ) 
      (func DOLLAR__GETCALLDATASIZE:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"getCallDataSize\"") ) result i32 .ValTypes .TypeDecls ) 
      (func DOLLAR__CALLDATACOPY:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"callDataCopy\"") ) param i32 i32 i32 .ValTypes .TypeDecls ) 
      (func DOLLAR__STORAGELOAD:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"storageLoad\"") ) param i32 i32 .ValTypes .TypeDecls ) 
      (func DOLLAR__STORAGESTORE:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"storageStore\"") ) param i32 i32 .ValTypes .TypeDecls ) 
      (func DOLLAR__GETCALLER:Identifier ( import #unparseWasmString("\"ethereum\"") #unparseWasmString("\"getCaller\"") ) param i32 .ValTypes .TypeDecls )
      ( memory ( export #unparseWasmString("\"memory\"") ) 1 )

      (func ( export #unparseWasmString("\"main\"") ) .TypeDecls .LocalDecls 
        block .TypeDecls 
          block .TypeDecls
            call DOLLAR__GETCALLDATASIZE:Identifier 
            i32.const 4
            i32.ge_u
            br_if 0 
            i32.const 0 
            i32.const 0
            call DOLLAR__REVERT:Identifier
            br 1
            .EmptyStmts
          end 
          i32.const 0 
          i32.const 0 
          i32.const 4
          call DOLLAR__CALLDATACOPY:Identifier 
          block .TypeDecls 
            i32.const 0
            i32.load 
            i32.const 436376473:Int
            i32.eq 
            i32.eqz 
            br_if 0
            call DOLLAR__DO_BALANCE:Identifier
            br 1
            .EmptyStmts
          end 
          block .TypeDecls 
            i32.const 0 i32.load 
            i32.const 3181327709:Int
            i32.eq
            i32.eqz 
            br_if 0
            call DOLLAR__DO_TRANSFER:Identifier
            br 1
            .EmptyStmts
          end 
          i32.const 0 
          i32.const 0
          call DOLLAR__REVERT:Identifier
          .EmptyStmts
        end
        .EmptyStmts
      ) 

      (func DOLLAR__DO_BALANCE:Identifier .TypeDecls .LocalDecls 
        block .TypeDecls 
          block .TypeDecls
            call DOLLAR__GETCALLDATASIZE:Identifier 
            i32.const 24
            i32.eq 
            br_if 0 
            i32.const 0 
            i32.const 0
            call DOLLAR__REVERT:Identifier
            br 1
            .EmptyStmts
          end 
          i32.const 0 
          i32.const 4 
          i32.const 20
          call DOLLAR__CALLDATACOPY:Identifier 
          i32.const 0 
          i32.const 32
          call DOLLAR__STORAGELOAD:Identifier 
          i32.const 32 
          i32.const 32
          i64.load
          call DOLLAR__I64__DOT__REVERSE_BYTES:Identifier
          i64.store 
          i32.const 32 
          i32.const 8
          call DOLLAR__FINISH:Identifier 
          .EmptyStmts
        end 
        .EmptyStmts ) 

      (func DOLLAR__DO_TRANSFER:Identifier .TypeDecls local i64 i64 i64 .ValTypes .LocalDecls 
        block .TypeDecls 
          block .TypeDecls
            call DOLLAR__GETCALLDATASIZE:Identifier 
            i32.const 32
            i32.eq 
            br_if 0 
            i32.const 0 
            i32.const 0
            call DOLLAR__REVERT:Identifier
            br 1 
            .EmptyStmts
          end 
          i32.const 0
          call DOLLAR__GETCALLER:Identifier 
          i32.const 32 
          i32.const 4 
          i32.const 20
          call DOLLAR__CALLDATACOPY:Identifier 
          i32.const 64 
          i32.const 24 
          i32.const 8
          call DOLLAR__CALLDATACOPY:Identifier 
          i32.const 64
          i64.load
          call DOLLAR__I64__DOT__REVERSE_BYTES:Identifier 
          local.set 0 
          i32.const 0 
          i32.const 64
          call DOLLAR__STORAGELOAD:Identifier 
          i32.const 64
          i64.load 
          local.set 1 
          i32.const 32 
          i32.const 64
          call DOLLAR__STORAGELOAD:Identifier 
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
            call DOLLAR__REVERT:Identifier
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
          call DOLLAR__STORAGESTORE:Identifier 
          i32.const 64
          local.get 2
          i64.store 
          i32.const 32 
          i32.const 64
          call DOLLAR__STORAGESTORE:Identifier 
          .EmptyStmts
        end 
        .EmptyStmts
      ) 

      (func DOLLAR__I64__DOT__REVERSE_BYTES:Identifier param i64 .ValTypes result i64 .ValTypes .TypeDecls local i64 i64 .ValTypes .LocalDecls 
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

    .EmptyStmts
    ) 

    .EmptyStmts
      </k>

endmodule
