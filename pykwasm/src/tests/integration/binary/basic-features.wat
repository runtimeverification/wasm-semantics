(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (param i32 i64)))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func (param i32 i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (type (;6;) (func (param i32) (result i32)))
  (type (;7;) (func (result i64)))
  (type (;8;) (func (param i64) (result i32)))
  (type (;9;) (func (param i64 i32 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func))
  (type (;11;) (func (param i32 i32 i32) (result i32)))
  (type (;12;) (func (param i32 i32 i64 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i64 i32)))
  (type (;14;) (func (param i32) (result i64)))
  (type (;15;) (func (param i64)))
  (type (;16;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;17;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;18;) (func (param i32 i32 i32 i32 i32 i32 i32)))
  (type (;19;) (func (param i32 i32 i32 i32 i32)))
  (type (;20;) (func (param i32 i32 i64 i32 i32 i32 i32 i32 i32 i32 i32)))
  (type (;21;) (func (param i32 i32 i32 i32)))
  (type (;22;) (func (param i32 i32 i64 i32)))
  (type (;23;) (func (param i32 i32 i64 i32 i32 i32)))
  (type (;24;) (func (param i32 i64 i32)))
  (type (;25;) (func (param i64 i32 i32) (result i32)))
  (type (;26;) (func (param i32 i32 i64) (result i32)))
  (type (;27;) (func (param i32 i32) (result i64)))
  (type (;28;) (func (param i32 i32 i32) (result i64)))
  (type (;29;) (func (param i64 i32)))
  (type (;30;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;31;) (func (param i32 i64) (result i32)))
  (type (;32;) (func (param i64) (result i64)))
  (type (;33;) (func (param i32 i32 i32 i64)))
  (type (;34;) (func (param i32 i64 i32 i32)))
  (import "env" "managedSignalError" (func $managedSignalError (type 0)))
  (import "env" "bigIntSetInt64" (func $bigIntSetInt64 (type 1)))
  (import "env" "bigIntAdd" (func $bigIntAdd (type 2)))
  (import "env" "signalError" (func $signalError (type 3)))
  (import "env" "mBufferNew" (func $mBufferNew (type 4)))
  (import "env" "mBufferAppend" (func $mBufferAppend (type 5)))
  (import "env" "mBufferEq" (func $mBufferEq (type 5)))
  (import "env" "mBufferStorageStore" (func $mBufferStorageStore (type 5)))
  (import "env" "mBufferFinish" (func $mBufferFinish (type 6)))
  (import "env" "getGasLeft" (func $getGasLeft (type 7)))
  (import "env" "managedSCAddress" (func $managedSCAddress (type 0)))
  (import "env" "bigIntNew" (func $bigIntNew (type 8)))
  (import "env" "managedExecuteOnDestContext" (func $managedExecuteOnDestContext (type 9)))
  (import "env" "cleanReturnData" (func $cleanReturnData (type 10)))
  (import "env" "mBufferAppendBytes" (func $mBufferAppendBytes (type 11)))
  (import "env" "managedMultiTransferESDTNFTExecute" (func $managedMultiTransferESDTNFTExecute (type 12)))
  (import "env" "managedCaller" (func $managedCaller (type 0)))
  (import "env" "managedGetOriginalTxHash" (func $managedGetOriginalTxHash (type 0)))
  (import "env" "mBufferGetLength" (func $mBufferGetLength (type 6)))
  (import "env" "mBufferGetBytes" (func $mBufferGetBytes (type 5)))
  (import "env" "bigIntGetESDTExternalBalance" (func $bigIntGetESDTExternalBalance (type 13)))
  (import "env" "managedOwnerAddress" (func $managedOwnerAddress (type 0)))
  (import "env" "bigIntGetCallValue" (func $bigIntGetCallValue (type 0)))
  (import "env" "managedGetMultiESDTCallValue" (func $managedGetMultiESDTCallValue (type 0)))
  (import "env" "mBufferGetArgument" (func $mBufferGetArgument (type 5)))
  (import "env" "getNumESDTTransfers" (func $getNumESDTTransfers (type 4)))
  (import "env" "getArgumentLength" (func $getArgumentLength (type 6)))
  (import "env" "bigIntGetSignedArgument" (func $bigIntGetSignedArgument (type 3)))
  (import "env" "bigIntGetUnsignedArgument" (func $bigIntGetUnsignedArgument (type 3)))
  (import "env" "smallIntGetUnsignedArgument" (func $smallIntGetUnsignedArgument (type 14)))
  (import "env" "smallIntGetSignedArgument" (func $smallIntGetSignedArgument (type 14)))
  (import "env" "getNumArguments" (func $getNumArguments (type 4)))
  (import "env" "smallIntFinishUnsigned" (func $smallIntFinishUnsigned (type 15)))
  (import "env" "bigIntFinishUnsigned" (func $bigIntFinishUnsigned (type 0)))
  (import "env" "bigIntSub" (func $bigIntSub (type 2)))
  (import "env" "mBufferSetBytes" (func $mBufferSetBytes (type 11)))
  (import "env" "ellipticCurveGetValues" (func $ellipticCurveGetValues (type 16)))
  (import "env" "getCurveLengthEC" (func $getCurveLengthEC (type 6)))
  (import "env" "createEC" (func $createEC (type 5)))
  (import "env" "mBufferCopyByteSlice" (func $mBufferCopyByteSlice (type 17)))
  (import "env" "bigIntShl" (func $bigIntShl (type 2)))
  (import "env" "bigIntShr" (func $bigIntShr (type 2)))
  (import "env" "mBufferFromBigIntSigned" (func $mBufferFromBigIntSigned (type 5)))
  (import "env" "mBufferToBigIntSigned" (func $mBufferToBigIntSigned (type 5)))
  (import "env" "bigIntPow" (func $bigIntPow (type 2)))
  (import "env" "mBufferFromBigIntUnsigned" (func $mBufferFromBigIntUnsigned (type 5)))
  (import "env" "mBufferToBigIntUnsigned" (func $mBufferToBigIntUnsigned (type 5)))
  (import "env" "bigIntSqrt" (func $bigIntSqrt (type 3)))
  (import "env" "validateTokenIdentifier" (func $validateTokenIdentifier (type 6)))
  (import "env" "mBufferStorageLoad" (func $mBufferStorageLoad (type 5)))
  (import "env" "mBufferStorageLoadFromAddress" (func $mBufferStorageLoadFromAddress (type 2)))
  (import "env" "managedTransferValueExecute" (func $managedTransferValueExecute (type 12)))
  (import "env" "bigIntCmp" (func $bigIntCmp (type 5)))
  (import "env" "isSmartContract" (func $isSmartContract (type 6)))
  (import "env" "managedWriteLog" (func $managedWriteLog (type 3)))
  (import "env" "finish" (func $finish (type 3)))
  (import "env" "checkNoPayment" (func $checkNoPayment (type 10)))
  (import "env" "bigIntLog2" (func $bigIntLog2 (type 6)))
  (import "env" "bigIntFinishSigned" (func $bigIntFinishSigned (type 0)))
  (import "env" "smallIntFinishSigned" (func $smallIntFinishSigned (type 15)))
  (import "env" "bigIntAbs" (func $bigIntAbs (type 3)))
  (import "env" "bigIntNeg" (func $bigIntNeg (type 3)))
  (import "env" "bigIntMul" (func $bigIntMul (type 2)))
  (import "env" "bigIntTDiv" (func $bigIntTDiv (type 2)))
  (import "env" "bigIntTMod" (func $bigIntTMod (type 2)))
  (import "env" "bigIntAnd" (func $bigIntAnd (type 2)))
  (import "env" "bigIntOr" (func $bigIntOr (type 2)))
  (import "env" "bigIntXor" (func $bigIntXor (type 2)))
  (import "env" "getBlockTimestamp" (func $getBlockTimestamp (type 7)))
  (import "env" "getBlockNonce" (func $getBlockNonce (type 7)))
  (import "env" "getBlockRound" (func $getBlockRound (type 7)))
  (import "env" "getBlockEpoch" (func $getBlockEpoch (type 7)))
  (import "env" "managedGetBlockRandomSeed" (func $managedGetBlockRandomSeed (type 0)))
  (import "env" "getPrevBlockTimestamp" (func $getPrevBlockTimestamp (type 7)))
  (import "env" "getPrevBlockNonce" (func $getPrevBlockNonce (type 7)))
  (import "env" "getPrevBlockRound" (func $getPrevBlockRound (type 7)))
  (import "env" "getPrevBlockEpoch" (func $getPrevBlockEpoch (type 7)))
  (import "env" "managedGetPrevBlockRandomSeed" (func $managedGetPrevBlockRandomSeed (type 0)))
  (import "env" "getShardOfAddress" (func $getShardOfAddress (type 6)))
  (import "env" "managedGetStateRootHash" (func $managedGetStateRootHash (type 0)))
  (import "env" "managedSha256" (func $managedSha256 (type 5)))
  (import "env" "managedKeccak256" (func $managedKeccak256 (type 5)))
  (import "env" "managedRipemd160" (func $managedRipemd160 (type 5)))
  (import "env" "managedVerifyBLS" (func $managedVerifyBLS (type 11)))
  (import "env" "managedVerifyEd25519" (func $managedVerifyEd25519 (type 11)))
  (import "env" "managedVerifySecp256k1" (func $managedVerifySecp256k1 (type 11)))
  (import "env" "managedVerifyCustomSecp256k1" (func $managedVerifyCustomSecp256k1 (type 17)))
  (import "env" "managedEncodeSecp256k1DerSignature" (func $managedEncodeSecp256k1DerSignature (type 11)))
  (import "env" "managedCreateEC" (func $managedCreateEC (type 6)))
  (import "env" "getPrivKeyByteLengthEC" (func $getPrivKeyByteLengthEC (type 6)))
  (import "env" "addEC" (func $addEC (type 18)))
  (import "env" "doubleEC" (func $doubleEC (type 19)))
  (import "env" "isOnCurveEC" (func $isOnCurveEC (type 11)))
  (import "env" "managedScalarMultEC" (func $managedScalarMultEC (type 16)))
  (import "env" "managedScalarBaseMultEC" (func $managedScalarBaseMultEC (type 17)))
  (import "env" "managedMarshalEC" (func $managedMarshalEC (type 17)))
  (import "env" "managedMarshalCompressedEC" (func $managedMarshalCompressedEC (type 17)))
  (import "env" "managedUnmarshalEC" (func $managedUnmarshalEC (type 17)))
  (import "env" "managedUnmarshalCompressedEC" (func $managedUnmarshalCompressedEC (type 17)))
  (import "env" "managedGenerateKeyEC" (func $managedGenerateKeyEC (type 17)))
  (import "env" "mBufferSetRandom" (func $mBufferSetRandom (type 5)))
  (import "env" "mBufferSetByteSlice" (func $mBufferSetByteSlice (type 17)))
  (import "env" "managedGetESDTTokenData" (func $managedGetESDTTokenData (type 20)))
  (import "env" "bigIntIsInt64" (func $bigIntIsInt64 (type 6)))
  (import "env" "bigIntGetInt64" (func $bigIntGetInt64 (type 14)))
  (import "env" "bigIntSign" (func $bigIntSign (type 6)))
  (import "env" "mBufferGetByteSlice" (func $mBufferGetByteSlice (type 17)))
  (import "env" "managedAsyncCall" (func $managedAsyncCall (type 21)))
  (func $_ZN100_$LT$B$u20$as$u20$multiversx_sc..contract_base..wrappers..error_helper..IntoSignalError$LT$M$GT$$GT$25signal_error_with_message17h18fbfd937aecaafdE (type 0) (param i32)
    local.get 0
    call $managedSignalError
    unreachable)
  (func $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E (type 4) (result i32)
    i32.const 131072
    i32.const 15
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E (type 5) (param i32 i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $mBufferSetBytes
    drop
    local.get 2)
  (func $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E (type 6) (param i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    i64.const 0
    call $bigIntSetInt64
    local.get 1
    local.get 1
    local.get 0
    call $bigIntAdd
    local.get 1)
  (func $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E (type 4) (result i32)
    (local i32)
    i32.const 0
    i32.const 0
    i32.load offset=133864
    i32.const -1
    i32.add
    local.tee 0
    i32.store offset=133864
    local.get 0)
  (func $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    i32.const 131087
    i32.const 22
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h9de743fff1b457ccE
    local.get 0
    local.get 1
    i64.load offset=8
    i64.store align=4
    local.get 0
    local.get 2
    i32.store offset=8
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage11storage_get11storage_get17h9de743fff1b457ccE (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 1
      call $_ZN143_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h5b4d28b09ba2cb61E
      local.tee 1
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$8is_empty17hc5b24e8932ff9064E
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        call $mBufferGetLength
        i32.const 7
        i32.ne
        br_if 0 (;@2;)
        local.get 2
        i32.const 0
        i32.store offset=11 align=1
        local.get 2
        i32.const 0
        i32.store offset=8
        local.get 1
        i32.const 0
        local.get 2
        i32.const 8
        i32.add
        i32.const 7
        call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
        drop
        i32.const 1
        local.set 3
        local.get 2
        i32.const 8
        i32.add
        i32.const 7
        i32.const 132987
        i32.const 7
        call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17hc097d12abfadd2f6E
        br_if 1 (;@1;)
      end
      i32.const 2
      local.set 3
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN106_$LT$$RF$str$u20$as$u20$multiversx_sc..contract_base..wrappers..error_helper..IntoSignalError$LT$M$GT$$GT$25signal_error_with_message17hf446268c4424ccd4E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $signalError
    unreachable)
  (func $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h0984fdd29b92c143E (type 19) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.le_u
        br_if 1 (;@1;)
        local.get 2
        local.get 4
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
        unreachable
      end
      local.get 1
      local.get 2
      call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
      unreachable
    end
    local.get 0
    local.get 2
    local.get 1
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 3
    local.get 1
    i32.add
    i32.store)
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E (type 3) (param i32 i32)
    call $_ZN4core9panicking9panic_fmt17h47d05d49c60428e4E
    unreachable)
  (func $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h749f83e2af55068fE (type 19) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 4
        i32.le_u
        br_if 1 (;@1;)
        local.get 2
        local.get 4
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
        unreachable
      end
      local.get 1
      local.get 2
      call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
      unreachable
    end
    local.get 0
    local.get 2
    local.get 1
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 3
    local.get 1
    i32.add
    i32.store)
  (func $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE (type 6) (param i32) (result i32)
    (local i32)
    call $mBufferNew
    local.tee 1
    local.get 0
    call $mBufferAppend
    drop
    local.get 1)
  (func $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $mBufferEq
    i32.const 0
    i32.gt_s)
  (func $_ZN120_$LT$multiversx_sc..types..io..sc_error_static..StaticSCError$u20$as$u20$multiversx_sc..types..io..sc_error..SCError$GT$10finish_err17h9cf5f96d0b57ad69E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $signalError
    unreachable)
  (func $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E (type 3) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 3
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      i32.const 8
      i32.add
      local.get 1
      i32.load offset=4
      local.tee 4
      i32.load
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E
      local.get 1
      local.get 2
      i32.load offset=12
      i32.store
      i32.const 1
      local.set 1
      local.get 4
      i32.load
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$9get_value17he2a99ce07db1f8ebE
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    i32.const 131965
    i32.const 11
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E
    call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 2
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 1
    block  ;; label = @1
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$9get_value17he2a99ce07db1f8ebE (type 5) (param i32 i32) (result i32)
    local.get 0
    i32.const 131976
    i32.const 6
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE)
  (func $_ZN124_$LT$multiversx_sc..storage..mappers..token..token_mapper_state..TokenMapperState$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h1bc1edb4a433f0ddE (type 5) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
      drop
    end
    local.get 0)
  (func $_ZN126_$LT$multiversx_sc..storage..mappers..map_mapper..Iter$LT$SA$C$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he1f9d2d5c0507b34E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.get 1
    call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.load offset=8
      local.tee 1
      i32.load
      local.get 1
      i32.const 8
      i32.add
      i32.load
      local.get 2
      i32.load offset=12
      local.tee 1
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
      local.get 2
      i32.load offset=4
      local.set 3
      local.get 2
      i32.load
      call $_ZN4core6option15Option$LT$T$GT$6unwrap17h8f0d08bef36ac9d5E
      local.get 0
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 0
      local.get 1
      i32.store offset=4
      i32.const 1
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE (type 21) (param i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 3
        call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      i32.const 1
      local.set 1
      local.get 2
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$16get_mapped_value17h70e47702f7bc3f7dE
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN4core6option15Option$LT$T$GT$6unwrap17h8f0d08bef36ac9d5E (type 0) (param i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      call $_ZN4core9panicking5panic17h6b6c6cd2a60c4adfE
      unreachable
    end)
  (func $_ZN129_$LT$basic_features..types..codec_err_test_type..CodecErrorTestType$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h18d78dc9048fea70E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    i32.const 131163
    i32.const 27
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE (type 21) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 1
    local.get 2
    local.get 3
    call $mBufferAppendBytes
    drop
    local.get 1
    call $managedSignalError
    unreachable)
  (func $_ZN130_$LT$multiversx_sc..storage..mappers..linked_list_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha10b25a1f26ba234E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=4
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 2
      i32.const 24
      i32.add
      i32.const 12
      i32.add
      local.get 1
      i32.const 16
      i32.add
      i64.load align=4
      i64.store align=4
      i32.const 1
      local.set 3
      local.get 2
      i32.const 1
      i32.store offset=24
      local.get 2
      local.get 1
      i32.const 8
      i32.add
      i64.load align=4
      i64.store offset=28 align=4
      local.get 2
      i32.const 8
      i32.add
      local.get 2
      i32.const 24
      i32.add
      call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
      local.get 1
      i32.const 4
      i32.add
      local.get 1
      i32.load
      i32.load
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.tee 1
      i32.load
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
      local.get 0
      i32.const 12
      i32.add
      local.get 1
      i64.load
      i64.store align=4
      local.get 0
      local.get 2
      i64.load offset=8
      i64.store offset=4 align=4
    end
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE (type 3) (param i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load
      br_if 0 (;@1;)
      call $_ZN4core9panicking5panic17h6b6c6cd2a60c4adfE
      unreachable
    end
    local.get 0
    local.get 1
    i64.load offset=4 align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    i32.const 12
    i32.add
    i64.load align=4
    i64.store align=4)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E (type 2) (param i32 i32 i32)
    (local i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
      i32.const 1
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store)
  (func $_ZN131_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h5370e55cfc79f94dE (type 3) (param i32 i32)
    local.get 1
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E
    call $mBufferStorageStore
    drop)
  (func $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E (type 6) (param i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    local.get 0
    call $mBufferFromBigIntUnsigned
    drop
    local.get 1)
  (func $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        i32.const 0
        i32.load8_u offset=143880
        local.tee 2
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store8 offset=143880
        i32.const 0
        i32.const 0
        i32.store offset=143876
        local.get 1
        i32.const 8
        i32.add
        i32.const 0
        call $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h9dbc76a3bdcb0cc7E
        local.get 1
        i32.load offset=8
        local.get 1
        i32.load offset=12
        i32.const 133776
        i32.const 0
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 3
        br 1 (;@1;)
      end
      i32.const 133776
      i32.const 0
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
      local.set 3
    end
    local.get 0
    local.get 3
    i32.store
    local.get 0
    local.get 2
    i32.const 1
    i32.xor
    i32.store8 offset=4
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h9dbc76a3bdcb0cc7E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    i32.const 133876
    i32.const 10000
    local.get 1
    call $_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17h1e8900fb63b80d25E
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 0
    local.get 2
    i32.load offset=8
    i32.store
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E (type 21) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 3
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      call $memcpy
      drop
      return
    end
    local.get 1
    local.get 3
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
    unreachable)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE (type 4) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    i32.const 133776
    i32.const 0
    call $mBufferSetBytes
    drop
    local.get 0)
  (func $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$19into_managed_buffer17h322974a5182f9d48E
    call $mBufferFinish
    drop)
  (func $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$19into_managed_buffer17h322974a5182f9d48E (type 5) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store8 offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$23flush_to_managed_buffer17hebc9a18647d7e80dE
    local.get 2
    i32.load offset=8
    local.set 1
    block  ;; label = @1
      local.get 2
      i32.load8_u offset=12
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE)
  (func $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E (type 6) (param i32) (result i32)
    (local i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $mBufferGetArgument
    drop
    local.get 1)
  (func $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE (type 3) (param i32 i32)
    (local i32)
    local.get 1
    call $mBufferGetLength
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    i32.const 0
    i32.store8
    local.get 0
    i32.const 12
    i32.add
    local.get 2
    i32.store
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store)
  (func $_ZN135_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hbd81a1bd02b4df5cE (type 3) (param i32 i32)
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$25to_signed_bytes_be_buffer17hbdc86e5a6e67f375E
    local.get 1
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E)
  (func $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$25to_signed_bytes_be_buffer17hbdc86e5a6e67f375E (type 6) (param i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    local.get 0
    call $mBufferFromBigIntSigned
    drop
    local.get 1)
  (func $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.tee 3
    i32.const 24
    i32.shl
    local.get 3
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 3
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 3
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$5write17hbbfae198c088673eE
    local.get 1
    local.get 0
    call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$16push_specialized17h200a00375dde9872E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E (type 3) (param i32 i32)
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E
    local.get 1
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E)
  (func $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$17to_managed_buffer17h7bc5b32b90e7913eE
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE)
  (func $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$17to_managed_buffer17h7bc5b32b90e7913eE (type 6) (param i32) (result i32)
    (local i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $mBufferStorageLoad
    drop
    local.get 1)
  (func $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$20into_max_size_buffer17h92d1c03c3f72e84cE (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$17to_managed_buffer17h7bc5b32b90e7913eE
    local.get 2
    call $_ZN13multiversx_sc5types7managed10codec_util27managed_buffer_top_de_input164_$LT$impl$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$20into_max_size_buffer17h562f19004f9e1bc8E
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 3
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc5types7managed10codec_util27managed_buffer_top_de_input164_$LT$impl$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$20into_max_size_buffer17h562f19004f9e1bc8E (type 2) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      call $mBufferGetLength
      local.tee 4
      i32.const 8
      i32.gt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 4
      call $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h9176a726c0b668b5E
      local.get 1
      i32.const 0
      local.get 3
      i32.load offset=8
      local.tee 2
      local.get 3
      i32.load offset=12
      local.tee 4
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
      drop
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN106_$LT$$RF$str$u20$as$u20$multiversx_sc..contract_base..wrappers..error_helper..IntoSignalError$LT$M$GT$$GT$25signal_error_with_message17hf446268c4424ccd4E
    unreachable)
  (func $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h5a1ba8e2bfc9a074E (type 0) (param i32)
    local.get 0
    call $_ZN100_$LT$B$u20$as$u20$multiversx_sc..contract_base..wrappers..error_helper..IntoSignalError$LT$M$GT$$GT$25signal_error_with_message17h18fbfd937aecaafdE
    unreachable)
  (func $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$11direct_esdt17h0311394dfe63b205E (type 22) (param i32 i32 i64 i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    call $_ZN13multiversx_sc13contract_base8wrappers16send_raw_wrapper23SendRawWrapper$LT$A$GT$25transfer_esdt_nft_execute17h536a668b4c30ec13E)
  (func $_ZN13multiversx_sc13contract_base8wrappers16send_raw_wrapper23SendRawWrapper$LT$A$GT$25transfer_esdt_nft_execute17h536a668b4c30ec13E (type 23) (param i32 i32 i64 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 7
    local.get 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 1
    local.get 3
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.set 3
    local.get 6
    local.get 2
    i64.const 56
    i64.shl
    local.get 2
    i64.const 65280
    i64.and
    i64.const 40
    i64.shl
    i64.or
    local.get 2
    i64.const 16711680
    i64.and
    i64.const 24
    i64.shl
    local.get 2
    i64.const 4278190080
    i64.and
    i64.const 8
    i64.shl
    i64.or
    i64.or
    local.get 2
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 2
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 2
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 2
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    i64.store offset=4 align=4
    local.get 6
    local.get 1
    i32.const 24
    i32.shl
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 1
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store
    local.get 6
    local.get 3
    i32.const 24
    i32.shl
    local.get 3
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 3
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 3
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 7
    local.get 6
    i32.const 16
    call $mBufferAppendBytes
    drop
    local.get 0
    local.get 7
    i64.const 0
    local.get 4
    local.get 5
    call $managedMultiTransferESDTNFTExecute
    drop
    local.get 6
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$15esdt_local_burn17h93be7b6fb6123224E (type 24) (param i32 i64 i32)
    (local i32 i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 3
    local.get 0
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        i32.const 131256
        local.set 0
        i32.const 13
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      local.get 1
      call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hbbbaf08a03eeeb90E
      i32.const 131245
      local.set 0
      i32.const 11
      local.set 4
    end
    local.get 3
    local.get 2
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hfddc284684a25f8fE
    call $getGasLeft
    local.get 0
    local.get 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 3
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$33call_local_esdt_built_in_function17h092cfe1bb2ef03c7E
    drop)
  (func $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E (type 3) (param i32 i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 0
    local.get 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hbbbaf08a03eeeb90E (type 1) (param i32 i64)
    (local i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 2
    local.get 1
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hfa3da52b93bb8b38E
    local.get 0
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hfddc284684a25f8fE (type 3) (param i32 i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$33call_local_esdt_built_in_function17h092cfe1bb2ef03c7E (type 25) (param i64 i32 i32) (result i32)
    (local i32)
    i32.const -25
    call $managedSCAddress
    local.get 0
    i32.const -25
    i64.const 0
    call $bigIntNew
    local.get 1
    local.get 2
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 3
    call $managedExecuteOnDestContext
    drop
    call $cleanReturnData
    local.get 3)
  (func $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$15esdt_local_mint17h6d2f871c4ea177e6E (type 24) (param i32 i64 i32)
    (local i32 i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 3
    local.get 0
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        i32.const 131287
        local.set 0
        i32.const 13
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      local.get 1
      call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hbbbaf08a03eeeb90E
      i32.const 131269
      local.set 0
      i32.const 18
      local.set 4
    end
    local.get 3
    local.get 2
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hfddc284684a25f8fE
    call $getGasLeft
    local.get 0
    local.get 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 3
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$33call_local_esdt_built_in_function17h092cfe1bb2ef03c7E
    drop)
  (func $_ZN13multiversx_sc13contract_base8wrappers16send_raw_wrapper23SendRawWrapper$LT$A$GT$14async_call_raw17hc38dd1da9c6abe77E (type 21) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_ZN26multiversx_sc_wasm_adapter3api13send_api_node127_$LT$impl$u20$multiversx_sc..api..send_api..SendApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$14async_call_raw17h35d09f0ec2afe17dE
    unreachable)
  (func $_ZN26multiversx_sc_wasm_adapter3api13send_api_node127_$LT$impl$u20$multiversx_sc..api..send_api..SendApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$14async_call_raw17h35d09f0ec2afe17dE (type 21) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $managedAsyncCall
    unreachable)
  (func $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$10get_caller17hd6bfca50036c0966E (type 4) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedCaller
    local.get 0)
  (func $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$11get_tx_hash17he6041bc1912ff91bE (type 4) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedGetOriginalTxHash
    local.get 0)
  (func $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$16get_esdt_balance17h5cf2e2cb12b5913bE (type 26) (param i32 i32 i64) (result i32)
    (local i32 i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.set 3
    local.get 1
    call $mBufferGetLength
    local.set 4
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node26unsafe_buffer_load_address17hf4a797f35e9550ebE
    local.get 1
    i32.const 143920
    call $mBufferGetBytes
    drop
    i32.const 143888
    i32.const 143920
    local.get 4
    local.get 2
    local.get 3
    call $bigIntGetESDTExternalBalance
    local.get 3)
  (func $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node26unsafe_buffer_load_address17hf4a797f35e9550ebE (type 0) (param i32)
    local.get 0
    i32.const 143888
    call $mBufferGetBytes
    drop)
  (func $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$17get_owner_address17h2bb02a5145214c17E (type 4) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedOwnerAddress
    local.get 0)
  (func $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$10egld_value17h96645c8318260081E (type 4) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=133868
      local.tee 0
      i32.const 2147483647
      i32.ne
      br_if 0 (;@1;)
      i32.const -11
      local.set 0
      i32.const 0
      i32.const -11
      i32.store offset=133868
      i32.const -11
      call $bigIntGetCallValue
    end
    local.get 0)
  (func $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$11single_esdt17h61d1bb6da76ff2a0E (type 0) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$18all_esdt_transfers17h44369989367028d0E
        local.tee 2
        call $mBufferGetLength
        i32.const -16
        i32.and
        i32.const 16
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 3
        i32.const 1
        local.set 4
        local.get 2
        call $mBufferGetLength
        local.set 5
        local.get 1
        i32.const 16
        i32.add
        local.set 6
        i32.const 0
        local.set 7
        loop  ;; label = @3
          local.get 3
          local.set 8
          local.get 7
          i32.const 16
          i32.add
          local.tee 9
          local.get 5
          i32.gt_u
          br_if 2 (;@1;)
          local.get 6
          i64.const 0
          i64.store
          local.get 1
          i64.const 0
          i64.store offset=8
          local.get 2
          local.get 7
          local.get 1
          i32.const 8
          i32.add
          i32.const 16
          call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
          drop
          local.get 1
          i32.const 0
          i32.store offset=28
          i32.const 1
          local.set 3
          local.get 4
          i32.const 1
          i32.and
          local.set 10
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          i32.const 28
          i32.add
          call $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17hbb82ce74e82cb65eE
          local.set 11
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          i32.const 28
          i32.add
          call $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17h9805ebbc78b5072fE
          local.set 12
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          i32.const 28
          i32.add
          call $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17hbb82ce74e82cb65eE
          local.set 13
          i32.const 0
          local.set 4
          local.get 9
          local.set 7
          local.get 10
          br_if 0 (;@3;)
        end
        local.get 8
        i32.const 1
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
        unreachable
      end
      i32.const 131345
      i32.const 34
      call $signalError
      unreachable
    end
    local.get 0
    local.get 13
    i32.store offset=12
    local.get 0
    local.get 11
    i32.store offset=8
    local.get 0
    local.get 12
    i64.store
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$18all_esdt_transfers17h44369989367028d0E (type 4) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=133872
      local.tee 0
      i32.const 2147483647
      i32.ne
      br_if 0 (;@1;)
      i32.const -21
      local.set 0
      i32.const 0
      i32.const -21
      i32.store offset=133872
      i32.const -21
      call $managedGetMultiESDTCallValue
    end
    local.get 0)
  (func $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E (type 17) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 3
    local.get 2
    call $mBufferGetByteSlice
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17hbb82ce74e82cb65eE (type 5) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 0
    i32.store offset=12
    local.get 2
    local.get 1
    i32.load
    local.tee 3
    local.get 3
    i32.const 4
    i32.add
    local.tee 3
    local.get 0
    i32.const 16
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h0984fdd29b92c143E
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E
    local.get 1
    local.get 3
    i32.store
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1
    i32.const 24
    i32.shl
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 1
    i32.const 24
    i32.shr_u
    i32.or
    i32.or)
  (func $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17h9805ebbc78b5072fE (type 27) (param i32 i32) (result i64)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 2
    local.get 1
    i32.load
    local.tee 3
    local.get 3
    i32.const 8
    i32.add
    local.tee 3
    local.get 0
    i32.const 16
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h0984fdd29b92c143E
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E
    local.get 1
    local.get 3
    i32.store
    local.get 2
    i64.load offset=8
    local.set 4
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
    i64.const 56
    i64.shl
    local.get 4
    i64.const 65280
    i64.and
    i64.const 40
    i64.shl
    i64.or
    local.get 4
    i64.const 16711680
    i64.and
    i64.const 24
    i64.shl
    local.get 4
    i64.const 4278190080
    i64.and
    i64.const 8
    i64.shl
    i64.or
    i64.or
    local.get 4
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 4
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 4
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 4
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or)
  (func $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E (type 21) (param i32 i32 i32 i32)
    (local i32)
    i32.const 131379
    i32.const 23
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 4
    local.get 0
    local.get 1
    call $mBufferAppendBytes
    drop
    local.get 4
    i32.const 131402
    i32.const 3
    call $mBufferAppendBytes
    drop
    local.get 4
    local.get 2
    local.get 3
    call $mBufferAppendBytes
    drop
    local.get 4
    call $managedSignalError
    unreachable)
  (func $_ZN13multiversx_sc2io15call_value_init12payable_egld17he6fc7aa766a1fbe7E (type 10)
    block  ;; label = @1
      call $getNumESDTTransfers
      br_if 0 (;@1;)
      return
    end
    i32.const 131405
    i32.const 37
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h004cd527dbf37b4fE (type 11) (param i32 i32 i32) (result i32)
    (local i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        i32.const 0
        i32.load offset=143884
        i32.ge_s
        br_if 1 (;@1;)
        local.get 3
        local.get 0
        local.get 1
        local.get 2
        call $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17h9ed36c40ec24cf79E
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    local.get 3)
  (func $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17h9ed36c40ec24cf79E (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN155_$LT$multiversx_sc..io..arg_loader_multi..EndpointDynArgLoader$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h6c0f57f3d5fb1817E
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E)
  (func $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.const 24
    i32.shl
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 1
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 0
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call $mBufferAppendBytes
    drop
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h2f105596805625f1E (type 0) (param i32)
    local.get 0
    i32.const 0
    i32.load offset=143884
    i32.store)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h4526c6edd7c81527E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.const 132951
        i32.const 6
        call $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17hf3de3fecbce23dbaE
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 28523
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.load
            i32.const 0
            i32.load offset=143884
            i32.lt_s
            br_if 0 (;@4;)
            call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
            local.set 1
            br 1 (;@3;)
          end
          local.get 1
          i32.const 132951
          i32.const 6
          call $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17h9ed36c40ec24cf79E
          local.set 1
        end
        local.get 2
        local.get 3
        i32.store offset=4
        local.get 2
        i32.const 1
        i32.store
        i32.const 8
        local.set 3
        br 1 (;@1;)
      end
      local.get 1
      i32.const 132951
      i32.const 6
      call $_ZN155_$LT$multiversx_sc..io..arg_loader_multi..EndpointDynArgLoader$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h6c0f57f3d5fb1817E
      call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
      local.set 1
      local.get 2
      i32.const 0
      i32.store
      i32.const 4
      local.set 3
    end
    local.get 2
    local.get 3
    i32.add
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i64.load
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17hf3de3fecbce23dbaE (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN155_$LT$multiversx_sc..io..arg_loader_multi..EndpointDynArgLoader$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h6c0f57f3d5fb1817E
    local.get 1
    local.get 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u32$GT$24top_decode_or_handle_err17h6e41eb96f69560c9E)
  (func $_ZN155_$LT$multiversx_sc..io..arg_loader_multi..EndpointDynArgLoader$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h6c0f57f3d5fb1817E (type 11) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 3
      i32.const 0
      i32.load offset=143884
      i32.lt_s
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.const 131442
      i32.const 17
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0
    local.get 3
    i32.const 1
    i32.add
    i32.store
    local.get 3)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h55bb0e59e98ef0eeE (type 21) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 2
        local.get 3
        call $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17hf3de3fecbce23dbaE
        local.tee 5
        br_if 0 (;@2;)
        br 1 (;@1;)
      end
      local.get 5
      i32.const 28523
      i32.eq
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.load
        i32.const 0
        i32.load offset=143884
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 6
        br 1 (;@1;)
      end
      i32.const 1
      local.set 4
      local.get 1
      local.get 2
      local.get 3
      call $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17h9ed36c40ec24cf79E
      local.set 6
    end
    local.get 0
    local.get 6
    i32.store offset=8
    local.get 0
    local.get 5
    i32.store offset=4
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h88c28712539b864dE (type 3) (param i32 i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        i32.const 0
        i32.load offset=143884
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      i32.const 132731
      i32.const 8
      call $_ZN155_$LT$multiversx_sc..io..arg_loader_multi..EndpointDynArgLoader$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h6c0f57f3d5fb1817E
      i32.const 132731
      i32.const 8
      call $_ZN147_$LT$multiversx_sc..types..managed..wrapped..managed_address..ManagedAddress$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h6e1359333b64160bE
      local.set 1
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_ZN147_$LT$multiversx_sc..types..managed..wrapped..managed_address..ManagedAddress$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h6e1359333b64160bE (type 11) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
      local.tee 0
      call $mBufferGetLength
      i32.const 32
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.const 132994
      i32.const 16
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hb1d799c60d2da9f3E (type 6) (param i32) (result i32)
    (local i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        i32.const 0
        i32.load offset=143884
        i32.ge_s
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        i32.const 132456
        i32.const 1
        call $_ZN19multiversx_sc_codec5multi18top_de_multi_input19TopDecodeMultiInput10next_value17hf3de3fecbce23dbaE
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    local.get 1)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hd1d4754dbaacf90fE (type 6) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 133071
      i32.const 14
      call $_ZN165_$LT$multiversx_sc..io..managed_result_arg_loader..ManagedResultArgLoader$LT$A$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h8169e17663e95d18E
      call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
      local.tee 0
      call $mBufferGetLength
      i32.const 32
      i32.eq
      br_if 0 (;@1;)
      i32.const 133071
      i32.const 14
      i32.const 132994
      i32.const 16
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0)
  (func $_ZN165_$LT$multiversx_sc..io..managed_result_arg_loader..ManagedResultArgLoader$LT$A$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h8169e17663e95d18E (type 11) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 0
    i32.load
    local.get 0
    i32.load offset=8
    local.tee 4
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$7try_get17h72d9f1c2392d0496E
    block  ;; label = @1
      local.get 3
      i32.load offset=8
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.set 2
      local.get 0
      local.get 4
      i32.const 1
      i32.add
      i32.store offset=8
      local.get 2
      call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
      local.set 0
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 0
      return
    end
    local.get 1
    local.get 2
    i32.const 131442
    i32.const 17
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hda7d99d60bad8f97E (type 6) (param i32) (result i32)
    local.get 0
    i32.const 132825
    i32.const 11
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_de_multi..TopDecodeMulti$GT$26multi_decode_or_handle_err17hf400af9472610542E)
  (func $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_de_multi..TopDecodeMulti$GT$26multi_decode_or_handle_err17hf400af9472610542E (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN165_$LT$multiversx_sc..io..managed_result_arg_loader..ManagedResultArgLoader$LT$A$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h8169e17663e95d18E
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hdd0b4d4dc8b44b18E (type 3) (param i32 i32)
    (local i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        i32.const 0
        i32.load offset=143884
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 1
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      i32.const 132980
      i32.const 3
      call $_ZN155_$LT$multiversx_sc..io..arg_loader_multi..EndpointDynArgLoader$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h6c0f57f3d5fb1817E
      i32.const 132980
      i32.const 3
      call $_ZN19multiversx_sc_codec14impl_for_types15impl_num_signed80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$i32$GT$24top_decode_or_handle_err17hcbec4ba9d29056b6E
      local.set 1
    end
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_ZN19multiversx_sc_codec14impl_for_types15impl_num_signed80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$i32$GT$24top_decode_or_handle_err17hcbec4ba9d29056b6E (type 11) (param i32 i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 0
      call $smallIntGetSignedArgument
      local.tee 3
      i64.const -2147483648
      i64.add
      i64.const -4294967296
      i64.lt_u
      br_if 0 (;@1;)
      local.get 3
      i32.wrap_i64
      return
    end
    local.get 1
    local.get 2
    i32.const 133053
    i32.const 18
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h0b99cb8659559dcbE (type 4) (result i32)
    i32.const 0
    i32.const 132730
    i32.const 1
    call $_ZN19multiversx_sc_codec14impl_for_types15impl_num_signed80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$i32$GT$24top_decode_or_handle_err17hcbec4ba9d29056b6E)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h125c60d8f1115c49E (type 4) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        local.get 0
        i32.const 8
        i32.add
        call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$12read_big_int17h56df155113b4a90fE
        local.tee 1
        i32.const 24
        i32.shl
        local.get 1
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 1
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        i32.store offset=28
        local.get 2
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $mBufferAppendBytes
        drop
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.const 24
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$12read_big_int17h56df155113b4a90fE (type 6) (param i32) (result i32)
    local.get 0
    i32.const 132453
    i32.const 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE
    call $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$27from_signed_bytes_be_buffer17h1eefc215c613e1faE)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h192e1e0d9c3387b1E (type 4) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        i32.const 3
        call $getArgumentLength
        br_if 0 (;@2;)
        i32.const 0
        local.set 0
        br 1 (;@1;)
      end
      i32.const 3
      i32.const 132538
      i32.const 9
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u8$GT$24top_decode_or_handle_err17h72a3ff4f1eb55361E
      local.tee 0
      i32.const 255
      i32.and
      i32.const 5
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 132538
      i32.const 9
      i32.const 131123
      i32.const 13
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u8$GT$24top_decode_or_handle_err17h72a3ff4f1eb55361E (type 11) (param i32 i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 0
      call $smallIntGetUnsignedArgument
      local.tee 3
      i64.const 255
      i64.gt_u
      br_if 0 (;@1;)
      local.get 3
      i32.wrap_i64
      return
    end
    local.get 1
    local.get 2
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h253fccc17b7ddac6E (type 4) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
      local.tee 1
      call $mBufferGetLength
      i32.const 4
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store offset=12
      local.get 1
      i32.const 0
      local.get 0
      i32.const 12
      i32.add
      i32.const 4
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
      drop
      i32.const 2147483646
      local.get 1
      local.get 0
      i32.const 12
      i32.add
      i32.const 4
      i32.const 131893
      i32.const 4
      call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17hc097d12abfadd2f6E
      select
      local.set 1
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17hc097d12abfadd2f6E (type 17) (param i32 i32 i32 i32) (result i32)
    (local i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      local.get 3
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      local.get 1
      call $memcmp
      i32.eqz
      local.set 4
    end
    local.get 4)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u32$GT$24top_decode_or_handle_err17h6e41eb96f69560c9E)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u32$GT$24top_decode_or_handle_err17h6e41eb96f69560c9E (type 11) (param i32 i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 0
      call $smallIntGetUnsignedArgument
      local.tee 3
      i64.const 4294967295
      i64.gt_u
      br_if 0 (;@1;)
      local.get 3
      i32.wrap_i64
      return
    end
    local.get 1
    local.get 2
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE (type 6) (param i32) (result i32)
    (local i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $bigIntGetSignedArgument
    local.get 1)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E (type 6) (param i32) (result i32)
    (local i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $bigIntGetUnsignedArgument
    local.get 1)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE (type 14) (param i32) (result i64)
    local.get 0
    call $smallIntGetUnsignedArgument)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h4685fcac918fa746E (type 4) (result i32)
    i32.const 132730
    i32.const 1
    call $_ZN19multiversx_sc_codec14impl_for_types15impl_num_signed79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$i8$GT$24top_decode_or_handle_err17h2556b75b81a09b10E)
  (func $_ZN19multiversx_sc_codec14impl_for_types15impl_num_signed79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$i8$GT$24top_decode_or_handle_err17h2556b75b81a09b10E (type 5) (param i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      i32.const 0
      call $smallIntGetSignedArgument
      local.tee 2
      i64.const -128
      i64.add
      i64.const -256
      i64.lt_u
      br_if 0 (;@1;)
      local.get 2
      i32.wrap_i64
      return
    end
    local.get 0
    local.get 1
    i32.const 133053
    i32.const 18
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h47bb5879ee050567E (type 6) (param i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    local.get 1
    i32.const 8
    i32.add
    i32.const 132959
    i32.const 10
    call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
    local.set 0
    local.get 1
    i32.const 8
    i32.add
    i32.const 132959
    i32.const 10
    call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
    local.set 2
    local.get 1
    i32.const 8
    i32.add
    i32.const 132959
    i32.const 10
    call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 8
        i32.add
        i32.const 16
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 3
      i32.const 16
      i32.shl
      local.get 2
      i32.const 255
      i32.and
      i32.const 8
      i32.shl
      i32.or
      local.get 0
      i32.const 255
      i32.and
      i32.or
      return
    end
    i32.const 132959
    i32.const 10
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E (type 11) (param i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 0
    i32.store8 offset=15
    local.get 0
    local.get 3
    i32.const 15
    i32.add
    i32.const 1
    local.get 1
    local.get 2
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17haf87e5817b8fef8dE
    local.get 3
    i32.load8_u offset=15
    local.set 2
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h649d0947d3a71e32E (type 4) (result i32)
    i32.const 0
    i32.const 132730
    i32.const 1
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u8$GT$24top_decode_or_handle_err17h72a3ff4f1eb55361E)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h7fc3864e8589c721E (type 4) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    i32.const 2
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 0 (;@2;)
        i32.const 2
        local.set 1
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 8
              i32.add
              i32.const 132730
              i32.const 1
              call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
              i32.const 255
              i32.and
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 132730
            i32.const 1
            i32.const 131123
            i32.const 13
            call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
            unreachable
          end
          i32.const 0
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 8
              i32.add
              i32.const 132730
              i32.const 1
              call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
              i32.const 255
              i32.and
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 132730
            i32.const 1
            i32.const 131123
            i32.const 13
            call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
            unreachable
          end
          i32.const 1
          local.set 1
        end
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.ne
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      i32.const 32
      i32.add
      global.set $__stack_pointer
      local.get 1
      return
    end
    i32.const 132730
    i32.const 1
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h82a6e7d4b0acc1dbE (type 4) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        local.get 0
        i32.const 8
        i32.add
        i32.const 132465
        i32.const 2
        call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE
        local.tee 1
        i32.const 24
        i32.shl
        local.get 1
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 1
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        i32.store offset=28
        local.get 2
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $mBufferAppendBytes
        drop
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.const 24
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    local.get 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$27read_managed_buffer_of_size17hedb9cfb787916136E)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8a096bbd58ed5564E (type 5) (param i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          call $smallIntGetUnsignedArgument
          local.tee 2
          i64.const 1
          i64.gt_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          local.get 2
          i32.wrap_i64
          br_table 2 (;@1;) 1 (;@2;) 2 (;@1;)
        end
        local.get 1
        i32.const 1
        i32.const 133053
        i32.const 18
        call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
        unreachable
      end
      i32.const 1
      local.set 0
    end
    local.get 0)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8cec285dd44f2a18E (type 4) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 8
        i32.add
        i32.const 132465
        i32.const 2
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
        local.set 3
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            local.get 3
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            local.get 0
            i32.const 8
            i32.add
            i32.const 132465
            i32.const 2
            call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
            local.tee 1
            i32.const 24
            i32.shl
            local.get 1
            i32.const 65280
            i32.and
            i32.const 8
            i32.shl
            i32.or
            local.get 1
            i32.const 8
            i32.shr_u
            i32.const 65280
            i32.and
            local.get 1
            i32.const 24
            i32.shr_u
            i32.or
            i32.or
            i32.store offset=28
            local.get 4
            local.get 0
            i32.const 28
            i32.add
            i32.const 4
            call $mBufferAppendBytes
            drop
            local.get 3
            i32.const -1
            i32.add
            local.set 3
            br 0 (;@4;)
          end
        end
        local.get 0
        local.get 4
        i32.const 24
        i32.shl
        local.get 4
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 4
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 4
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        i32.store offset=28
        local.get 2
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $mBufferAppendBytes
        drop
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.const 24
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E (type 11) (param i32 i32 i32) (result i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 3
    i32.const 12
    i32.add
    i32.const 4
    local.get 1
    local.get 2
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17haf87e5817b8fef8dE
    local.get 3
    i32.const 12
    i32.add
    i32.const 4
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 4
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
    i32.wrap_i64)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8f8c85dc6cf304bfE (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    i32.const 0
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    local.get 1
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$12read_big_int17h56df155113b4a90fE
    local.set 2
    local.get 1
    i32.const 8
    i32.add
    i32.const 132453
    i32.const 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 132453
    i32.const 1
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h91598548c021c288E (type 4) (result i32)
    (local i64)
    block  ;; label = @1
      i32.const 0
      call $smallIntGetSignedArgument
      local.tee 0
      i64.const -2147483648
      i64.add
      i64.const -4294967297
      i64.gt_u
      br_if 0 (;@1;)
      i32.const 132730
      i32.const 1
      i32.const 133053
      i32.const 18
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0
    i32.wrap_i64)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h96b66bc9a55b0369E (type 2) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    i32.const 2
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$13read_big_uint17he258beb4da35d703E
    local.set 1
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    i32.const 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
    local.set 4
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    i32.const 2
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE
    local.set 5
    block  ;; label = @1
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 5
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 2
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$13read_big_uint17he258beb4da35d703E (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$20from_bytes_be_buffer17h7cff4839a171a78bE)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h982bee2cdb389f5aE (type 21) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    local.get 1
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    local.get 4
    i32.const 32
    i32.add
    i32.const 4
    i32.or
    local.set 5
    i32.const 0
    local.set 6
    i32.const 5
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 6
          i32.const 5
          i32.ge_u
          br_if 2 (;@1;)
          local.get 2
          local.get 3
          i32.const 133018
          i32.const 18
          call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
          unreachable
        end
        local.get 4
        i32.const 8
        i32.add
        local.get 2
        local.get 3
        call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
        local.set 7
        block  ;; label = @3
          local.get 6
          i32.const 4
          i32.gt_u
          local.tee 8
          br_if 0 (;@3;)
          local.get 5
          local.get 6
          i32.add
          local.get 7
          i32.store8
          local.get 6
          i32.const 1
          i32.add
          local.set 6
        end
        local.get 8
        local.get 7
        call $_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h828c2cece8715797E
        local.get 1
        i32.const -1
        i32.add
        local.set 1
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 4
      i32.load offset=12
      local.get 4
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      local.get 4
      i64.load offset=36 align=4
      local.set 9
      block  ;; label = @2
        local.get 4
        i32.const 8
        i32.add
        i32.const 16
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 9
      i32.wrap_i64
      local.tee 1
      i32.store16 align=1
      local.get 0
      local.get 9
      i64.const 24
      i64.shr_u
      i64.store16 offset=3 align=1
      local.get 0
      i32.const 2
      i32.add
      local.get 1
      i32.const 16
      i32.shr_u
      i32.store8
      local.get 4
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    local.get 3
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h828c2cece8715797E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 2
    i32.const 15
    i32.add
    call $_ZN4core6result13unwrap_failed17h4407f62b32d5ff84E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN147_$LT$multiversx_sc..types..managed..wrapped..managed_address..ManagedAddress$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h6e1359333b64160bE)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9e63dca59b1167f8E (type 4) (result i32)
    (local i32)
    i32.const 0
    local.set 0
    block  ;; label = @1
      i32.const 0
      call $getArgumentLength
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 132976
      i32.const 2
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u8$GT$24top_decode_or_handle_err17h72a3ff4f1eb55361E
      local.tee 0
      i32.const 255
      i32.and
      i32.const 3
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 132976
      i32.const 2
      i32.const 131123
      i32.const 13
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9ed6b475c1151372E (type 3) (param i32 i32)
    (local i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    local.get 2
    i32.const 132959
    i32.const 10
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$13read_big_uint17he258beb4da35d703E
    local.set 3
    local.get 2
    i64.const 0
    i64.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.const 8
    i32.const 132959
    i32.const 10
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17haf87e5817b8fef8dE
    local.get 2
    i32.const 24
    i32.add
    i32.const 8
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 4
    local.get 2
    i32.const 132959
    i32.const 10
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 5
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        local.get 2
        i32.const 132959
        i32.const 10
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        local.get 1
        i32.const -1
        i32.add
        local.set 1
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 2
      i32.load offset=4
      local.get 2
      i32.load
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 5
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 4
      i64.store
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 132959
    i32.const 10
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17haf87e5817b8fef8dE (type 19) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc5types7managed7wrapped24preloaded_managed_buffer31PreloadedManagedBuffer$LT$M$GT$10load_slice17h5ed0773220526e6eE
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 4
      call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9peek_into28_$u7b$$u7b$closure$u7d$$u7d$17h0ff6e5dd3ee69bdfE
      unreachable
    end
    local.get 0
    local.get 0
    i32.load
    local.get 2
    i32.add
    i32.store)
  (func $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E (type 28) (param i32 i32 i32) (result i64)
    (local i64)
    i64.const 0
    local.set 3
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load8_s
        i32.const 7
        i32.shr_s
        i64.extend_i32_s
        local.set 3
      end
      loop  ;; label = @2
        local.get 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.const -1
        i32.add
        local.set 1
        local.get 3
        i64.const 8
        i64.shl
        local.get 0
        i64.load8_u
        i64.or
        local.set 3
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 0 (;@2;)
      end
    end
    local.get 3)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9fc43ecad140aab8E (type 4) (result i32)
    (local i32)
    i32.const 0
    i32.const 2
    i32.const 1
    i32.const 132530
    i32.const 4
    call $_ZN19multiversx_sc_codec14impl_for_types15impl_num_signed79_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$i8$GT$24top_decode_or_handle_err17h2556b75b81a09b10E
    local.tee 0
    i32.const 255
    i32.and
    select
    local.get 0
    i32.extend8_s
    i32.const 0
    i32.lt_s
    select)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17ha191c8156287074fE (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    local.get 1
    i32.const 8
    i32.add
    i32.const 0
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=12
        local.get 1
        i32.load offset=8
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.const 8
              i32.add
              i32.const 132453
              i32.const 1
              call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
              i32.const 255
              i32.and
              local.tee 2
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 132453
            i32.const 1
            i32.const 131123
            i32.const 13
            call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
            unreachable
          end
          local.get 1
          i32.const 8
          i32.add
          call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$12read_big_int17h56df155113b4a90fE
          local.set 3
          i32.const 1
          local.set 2
        end
        local.get 1
        i32.load offset=12
        local.get 1
        i32.load offset=8
        i32.ne
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 1
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 1
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 132453
    i32.const 1
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17had40e05ecc0a5223E (type 4) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 1
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.const 8
        i32.add
        i32.const 132457
        i32.const 3
        call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$19read_managed_buffer17h689d8439f230ccebE
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.const 24
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hbffdb41f00cfa277E (type 0) (param i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store offset=36
    local.get 1
    i32.const 40
    i32.add
    i32.const 0
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    local.get 1
    i32.const 24
    i32.add
    local.set 2
    i32.const 1
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.load offset=44
        local.get 1
        i32.load offset=40
        i32.eq
        br_if 1 (;@1;)
        local.get 1
        i32.const 0
        i32.store offset=8
        local.get 1
        i32.const 40
        i32.add
        local.get 1
        i32.const 8
        i32.add
        i32.const 4
        i32.const 132974
        i32.const 2
        call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17haf87e5817b8fef8dE
        local.get 1
        i32.const 8
        i32.add
        i32.const 4
        i32.const 1
        call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
        local.set 4
        block  ;; label = @3
          local.get 3
          i32.const 4
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          local.get 4
          i64.store32
          local.get 2
          i32.const 4
          i32.add
          local.set 2
          local.get 1
          local.get 3
          i32.store offset=36
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          br 1 (;@2;)
        end
      end
      i32.const 132974
      i32.const 2
      i32.const 133036
      i32.const 17
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 1
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.store
    local.get 1
    local.get 1
    i64.load offset=24
    i64.store offset=8
    block  ;; label = @1
      local.get 1
      i32.const 56
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 0
    local.get 1
    i64.load offset=8
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 3
    i64.load
    i64.store align=4
    local.get 1
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hc30b1262ec24a38aE (type 4) (result i32)
    (local i32)
    block  ;; label = @1
      i32.const 0
      i32.const 132978
      i32.const 2
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned80_$LT$impl$u20$multiversx_sc_codec..single..top_de..TopDecode$u20$for$u20$u32$GT$24top_decode_or_handle_err17h6e41eb96f69560c9E
      local.tee 0
      br_if 0 (;@1;)
      i32.const 132978
      i32.const 2
      i32.const 131123
      i32.const 13
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 0)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcd0355bb3829d176E (type 14) (param i32) (result i64)
    local.get 0
    call $smallIntGetSignedArgument)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E (type 4) (result i32)
    i32.const 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hd8dbda0a8e51e14bE (type 0) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    local.set 2
    local.get 1
    i32.const 0
    call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
    i32.const 32
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          local.get 2
          i32.const 32
          i32.ge_u
          br_if 2 (;@1;)
          i32.const 132820
          i32.const 5
          i32.const 133018
          i32.const 18
          call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
          unreachable
        end
        local.get 1
        i32.const 132820
        i32.const 5
        call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
        local.set 4
        block  ;; label = @3
          local.get 2
          i32.const 31
          i32.gt_u
          local.tee 5
          br_if 0 (;@3;)
          local.get 1
          i32.const 56
          i32.add
          local.get 2
          i32.add
          local.get 4
          i32.store8
          local.get 2
          i32.const 1
          i32.add
          local.set 2
        end
        local.get 5
        local.get 4
        call $_ZN4core6result19Result$LT$T$C$E$GT$6unwrap17h828c2cece8715797E
        local.get 3
        i32.const -1
        i32.add
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 1
    i32.const 24
    i32.add
    i32.const 24
    i32.add
    local.tee 3
    local.get 1
    i32.const 56
    i32.add
    i32.const 24
    i32.add
    i64.load
    i64.store
    local.get 1
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    local.tee 2
    local.get 1
    i32.const 56
    i32.add
    i32.const 16
    i32.add
    i64.load
    i64.store
    local.get 1
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    local.tee 4
    local.get 1
    i32.const 56
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.store
    local.get 1
    local.get 1
    i64.load offset=56
    i64.store offset=24
    block  ;; label = @1
      local.get 1
      i32.load offset=4
      local.get 1
      i32.load
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      i64.load offset=24
      i64.store align=1
      local.get 0
      i32.const 24
      i32.add
      local.get 3
      i64.load
      i64.store align=1
      local.get 0
      i32.const 16
      i32.add
      local.get 2
      i64.load
      i64.store align=1
      local.get 0
      i32.const 8
      i32.add
      local.get 4
      i64.load
      i64.store align=1
      block  ;; label = @2
        local.get 1
        i32.const 16
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 1
      i32.const 96
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 132820
    i32.const 5
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE (type 11) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    local.set 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 0
    local.get 3
    i32.const 8
    i32.add
    local.get 4
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.load offset=12
        local.get 3
        i32.load offset=8
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.const 8
        i32.add
        local.get 1
        local.get 2
        call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$13read_big_uint17he258beb4da35d703E
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 3
      i32.const 24
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hed5e28bdd5130fd2E (type 2) (param i32 i32 i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          call $getArgumentLength
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        local.get 3
        i32.const 8
        i32.add
        i32.const 0
        call $_ZN135_$LT$multiversx_sc..io..arg_de_input..ArgDecodeInput$LT$AA$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h8606f65aacd86eaeE
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 3
                  i32.const 8
                  i32.add
                  local.get 1
                  local.get 2
                  call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h6a4a0877cd6ac176E
                  i32.const 255
                  i32.and
                  local.tee 4
                  br_table 4 (;@3;) 1 (;@6;) 2 (;@5;) 3 (;@4;) 0 (;@7;)
                end
                local.get 1
                local.get 2
                i32.const 131123
                i32.const 13
                call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
                unreachable
              end
              local.get 3
              i32.const 8
              i32.add
              local.get 1
              local.get 2
              call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
              i64.extend_i32_u
              local.set 5
              i32.const 1
              local.set 4
              br 2 (;@3;)
            end
            local.get 3
            i32.const 8
            i32.add
            local.get 1
            local.get 2
            call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
            local.set 4
            local.get 3
            i32.const 8
            i32.add
            local.get 1
            local.get 2
            call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 4
            i64.extend_i32_u
            i64.or
            local.set 5
            i32.const 2
            local.set 4
            br 1 (;@3;)
          end
          local.get 3
          i32.const 8
          i32.add
          local.get 1
          local.get 2
          call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17h2693480ec8f9e288E
          i64.extend_i32_u
          local.set 5
          i32.const 3
          local.set 4
        end
        local.get 3
        i32.load offset=12
        local.get 3
        i32.load offset=8
        i32.ne
        br_if 1 (;@1;)
        local.get 3
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 5
      i64.store offset=4 align=4
      local.get 0
      local.get 4
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    local.get 1
    local.get 2
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hf5800e0d7c0af2c6E (type 4) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    call $_ZN13multiversx_sc2io12arg_de_input24ArgDecodeInput$LT$AA$GT$17to_managed_buffer17h7244fc041e210187E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.const 8
        i32.add
        i32.const 32
        i32.const 132465
        i32.const 2
        call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$27read_managed_buffer_of_size17hedb9cfb787916136E
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 0
      i32.const 24
      i32.add
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$27read_managed_buffer_of_size17hedb9cfb787916136E (type 17) (param i32 i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load
    local.tee 5
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10copy_slice17hda333ad172527088E
    block  ;; label = @1
      local.get 4
      i32.load offset=8
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 4
      i32.load offset=12
      local.set 3
      local.get 0
      local.get 5
      local.get 1
      i32.add
      i32.store
      local.get 4
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 3
      return
    end
    local.get 2
    local.get 3
    i32.const 131784
    i32.const 15
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE (type 0) (param i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=143884
      local.get 0
      i32.gt_s
      br_if 0 (;@1;)
      return
    end
    i32.const 131459
    i32.const 18
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h576ea351e7d6f4f8E (type 3) (param i32 i32)
    block  ;; label = @1
      local.get 1
      local.get 0
      i32.lt_u
      br_if 0 (;@1;)
      return
    end
    i32.const 131459
    i32.const 18
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E (type 0) (param i32)
    block  ;; label = @1
      call $getNumArguments
      local.get 0
      i32.ne
      br_if 0 (;@1;)
      return
    end
    i32.const 131477
    i32.const 25
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E (type 0) (param i32)
    block  ;; label = @1
      i32.const 0
      i32.load offset=143884
      local.get 0
      i32.lt_s
      br_if 0 (;@1;)
      return
    end
    i32.const 131442
    i32.const 17
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE (type 10)
    i32.const 0
    call $getNumArguments
    i32.store offset=143884)
  (func $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E (type 3) (param i32 i32)
    (local i32)
    local.get 1
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$3len17h44caac58d4f30d45E
    local.set 2
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$3len17h44caac58d4f30d45E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    i32.const 2
    i32.shr_u)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17h2511762708e48e25E (type 0) (param i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      i32.load
      local.get 0
      i32.const 8
      i32.add
      i32.load
      call $_ZN120_$LT$multiversx_sc..types..io..sc_error_static..StaticSCError$u20$as$u20$multiversx_sc..types..io..sc_error..SCError$GT$10finish_err17h9cf5f96d0b57ad69E
      unreachable
    end
    local.get 0
    i32.const 4
    i32.add
    i32.load
    local.get 0
    i32.const 8
    i32.add
    i32.load
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E)
  (func $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        br_if 0 (;@2;)
        i32.const 133776
        i32.const 0
        call $finish
        br 1 (;@1;)
      end
      local.get 2
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 2
      local.get 2
      i32.load8_u offset=4
      i32.store8 offset=12
      local.get 2
      local.get 2
      i32.load
      i32.store offset=8
      local.get 2
      i32.const 8
      i32.add
      i32.const 1
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 1
      local.get 2
      i32.const 8
      i32.add
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
      local.get 2
      i32.load offset=8
      local.get 2
      i32.load8_u offset=12
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17h25b3306e4de308e4E (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.set 2
    local.get 1
    local.get 0
    i32.store offset=24
    local.get 1
    local.get 2
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store offset=16
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const 8
        i32.add
        local.get 1
        i32.const 16
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 1
        i32.load offset=8
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load offset=12
        call $mBufferFinish
        drop
        br 0 (;@2;)
      end
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE (type 6) (param i32) (result i32)
    local.get 0
    call $mBufferGetLength)
  (func $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE (type 3) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 1
        i32.load offset=4
        i32.le_u
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.load offset=8
      local.set 5
      local.get 2
      i32.const 0
      i32.store offset=12
      local.get 5
      i32.load
      local.get 3
      local.get 2
      i32.const 12
      i32.add
      i32.const 4
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
      drop
      local.get 2
      i32.load offset=12
      local.set 3
      local.get 1
      local.get 4
      i32.store
      local.get 3
      i32.const 24
      i32.shl
      local.get 3
      i32.const 65280
      i32.and
      i32.const 8
      i32.shl
      i32.or
      local.get 3
      i32.const 8
      i32.shr_u
      i32.const 65280
      i32.and
      local.get 3
      i32.const 24
      i32.shr_u
      i32.or
      i32.or
      local.set 3
      i32.const 1
      local.set 1
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17h3c00942bcaedb188E (type 10)
    i32.const 131502
    i32.const 30
    i32.const 131163
    i32.const 27
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17h42b96b194f9e823aE (type 0) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 1
    local.get 1
    i32.load8_u offset=12
    i32.store8 offset=20
    local.get 1
    local.get 1
    i32.load offset=8
    i32.store offset=16
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.set 2
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 1
        i32.const 0
        i32.store offset=28
        local.get 0
        local.get 3
        local.get 1
        i32.const 28
        i32.add
        i32.const 4
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
        drop
        local.get 1
        i32.load offset=28
        local.tee 3
        i32.const 24
        i32.shl
        local.get 3
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 3
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 3
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        local.get 1
        i32.const 16
        i32.add
        call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
        local.get 4
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 1
    i32.load offset=16
    local.get 1
    i32.load8_u offset=20
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE (type 17) (param i32 i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE (type 3) (param i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      local.get 1
      i64.extend_i32_u
      call $smallIntFinishUnsigned
    end)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E (type 3) (param i32 i32)
    local.get 0
    call $bigIntFinishUnsigned
    local.get 1
    call $bigIntFinishUnsigned)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 1
    local.get 1
    i32.load8_u offset=4
    i32.store8 offset=12
    local.get 1
    local.get 1
    i32.load
    i32.store offset=8
    local.get 0
    i32.load offset=8
    local.get 1
    i32.const 8
    i32.add
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E
    local.get 0
    i64.load
    local.get 1
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17haf0e4ddeee76cd59E
    local.get 0
    i32.load offset=12
    local.get 1
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 1
    i32.load offset=8
    local.get 1
    i32.load8_u offset=12
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17haf0e4ddeee76cd59E (type 29) (param i64 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i64.const 56
    i64.shl
    local.get 0
    i64.const 65280
    i64.and
    i64.const 40
    i64.shl
    i64.or
    local.get 0
    i64.const 16711680
    i64.and
    i64.const 24
    i64.shl
    local.get 0
    i64.const 4278190080
    i64.and
    i64.const 8
    i64.shl
    i64.or
    i64.or
    local.get 0
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 0
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 0
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 0
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    i64.store offset=8
    local.get 1
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$5write17hbbfae198c088673eE
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17hd567ac77fcf8089dE (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;) 0 (;@5;)
            end
            i64.const 0
            call $smallIntFinishUnsigned
            br 3 (;@1;)
          end
          local.get 1
          call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
          local.get 1
          local.get 1
          i32.load8_u offset=4
          i32.store8 offset=28
          local.get 1
          local.get 1
          i32.load
          i32.store offset=24
          local.get 1
          i32.const 24
          i32.add
          i32.const 1
          call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
          local.get 0
          i32.load offset=4
          local.get 1
          i32.const 24
          i32.add
          call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
          local.get 1
          i32.load offset=24
          local.get 1
          i32.load8_u offset=28
          call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
          br 2 (;@1;)
        end
        local.get 1
        i32.const 8
        i32.add
        call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
        local.get 1
        local.get 1
        i32.load8_u offset=12
        i32.store8 offset=28
        local.get 1
        local.get 1
        i32.load offset=8
        i32.store offset=24
        local.get 1
        i32.const 24
        i32.add
        i32.const 2
        call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
        local.get 0
        i32.load offset=4
        local.get 1
        i32.const 24
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 0
        i32.load offset=8
        local.get 1
        i32.const 24
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 1
        i32.load offset=24
        local.get 1
        i32.load8_u offset=28
        call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
        br 1 (;@1;)
      end
      local.get 1
      i32.const 16
      i32.add
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 1
      local.get 1
      i32.load8_u offset=20
      i32.store8 offset=28
      local.get 1
      local.get 1
      i32.load offset=16
      i32.store offset=24
      local.get 1
      i32.const 24
      i32.add
      i32.const 3
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 24
      i32.add
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
      local.get 1
      i32.load offset=24
      local.get 1
      i32.load8_u offset=28
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store8 offset=15
    local.get 0
    local.get 2
    i32.const 15
    i32.add
    i32.const 1
    call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$5write17hbbfae198c088673eE
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.const 24
    i32.shl
    local.get 0
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$5write17hbbfae198c088673eE
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc2io6finish12finish_multi17he91a121729dbcadcE (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 1
    local.get 1
    i32.load8_u offset=4
    i32.store8 offset=12
    local.get 1
    local.get 1
    i32.load
    i32.store offset=8
    local.get 0
    i32.load
    local.get 1
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 0
    i32.load offset=4
    local.get 1
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 0
    i32.load offset=8
    local.get 1
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 0
    i32.load offset=12
    local.get 1
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 0
    i32.load offset=16
    local.get 1
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 0
    i32.load offset=20
    local.get 1
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 1
    i32.load offset=8
    local.get 1
    i32.load8_u offset=12
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc3api13managed_types11big_int_api13BigIntApiImpl15bi_sub_unsigned17h0c7cb5fdc5f347b4E (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $bigIntSub
    block  ;; label = @1
      local.get 0
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$7bi_sign17h13575f02ac73399cE
      i32.const 255
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      return
    end
    i32.const 131532
    i32.const 48
    call $signalError
    unreachable)
  (func $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$7bi_sign17h13575f02ac73399cE (type 6) (param i32) (result i32)
    i32.const 0
    i32.const 2
    i32.const 1
    local.get 0
    call $bigIntSign
    local.tee 0
    select
    local.get 0
    i32.const 0
    i32.lt_s
    select)
  (func $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE (type 21) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types11interaction19contract_call_trait12ContractCall17push_raw_argument17h07bfeeb52dc76984E
    local.get 0
    i32.const 133568
    i32.const 133572
    local.get 3
    select
    i32.const 4
    i32.const 5
    local.get 3
    select
    call $_ZN13multiversx_sc5types11interaction19contract_call_trait12ContractCall17push_raw_argument17h07bfeeb52dc76984E)
  (func $_ZN13multiversx_sc5types11interaction19contract_call_trait12ContractCall17push_raw_argument17h07bfeeb52dc76984E (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc4esdt15system_sc_proxy38ESDTSystemSmartContractProxy$LT$SA$GT$14issue_fungible17h77e732bd02defb48E (type 30) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 5
    i32.load8_u offset=11
    local.set 6
    local.get 5
    i32.load8_u offset=10
    local.set 7
    local.get 5
    i32.load8_u offset=9
    local.set 8
    local.get 5
    i32.load8_u offset=8
    local.set 9
    local.get 5
    i32.load8_u offset=7
    local.set 10
    local.get 5
    i32.load8_u offset=6
    local.set 11
    local.get 5
    i32.load8_u offset=5
    local.set 12
    local.get 5
    i32.load8_u offset=4
    local.set 13
    local.get 5
    i32.load
    local.set 14
    local.get 0
    i32.const 131674
    call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$14new_from_bytes17hcae76b0eaf4182bfE
    i32.const 131741
    i32.const 5
    call $_ZN13multiversx_sc5types11interaction24contract_call_no_payment48ContractCallNoPayment$LT$SA$C$OriginalResult$GT$3new17h6ab62a5b02ab110cE
    local.get 0
    local.get 1
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    i32.load
    local.tee 5
    local.get 2
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    local.get 5
    local.get 3
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 5
    local.get 4
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    local.get 5
    local.get 14
    call $_ZN13multiversx_sc5types11interaction19contract_call_trait12ContractCall9proxy_arg17h06061d0ad76dbabdE
    local.get 5
    i32.const 131580
    i32.const 9
    local.get 13
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131589
    i32.const 7
    local.get 12
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131596
    i32.const 8
    local.get 11
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131604
    i32.const 7
    local.get 10
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131611
    i32.const 7
    local.get 9
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131618
    i32.const 14
    local.get 8
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131632
    i32.const 10
    local.get 7
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE
    local.get 5
    i32.const 131642
    i32.const 18
    local.get 6
    call $_ZN13multiversx_sc4esdt15system_sc_proxy18set_token_property17hf923d763ec15286aE)
  (func $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$14new_from_bytes17hcae76b0eaf4182bfE (type 6) (param i32) (result i32)
    local.get 0
    i32.const 32
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E)
  (func $_ZN13multiversx_sc5types11interaction24contract_call_no_payment48ContractCallNoPayment$LT$SA$C$OriginalResult$GT$3new17h6ab62a5b02ab110cE (type 21) (param i32 i32 i32 i32)
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.set 3
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    i32.store offset=16
    local.get 0
    local.get 3
    i32.store offset=12
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 0
    i64.const -1
    i64.store)
  (func $_ZN13multiversx_sc5types11interaction19contract_call_trait12ContractCall9proxy_arg17h06061d0ad76dbabdE (type 3) (param i32 i32)
    (local i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 2
    local.get 1
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hfa3da52b93bb8b38E
    local.get 0
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc4esdt15system_sc_proxy38ESDTSystemSmartContractProxy$LT$SA$GT$23issue_and_set_all_roles17hd45cbc9b55abb1b6E (type 19) (param i32 i32 i32 i32 i32)
    local.get 0
    i32.const 131674
    call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$14new_from_bytes17hcae76b0eaf4182bfE
    i32.const 131706
    i32.const 22
    call $_ZN13multiversx_sc5types11interaction24contract_call_no_payment48ContractCallNoPayment$LT$SA$C$OriginalResult$GT$3new17h6ab62a5b02ab110cE
    local.get 0
    local.get 1
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    i32.load
    local.tee 0
    local.get 2
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    local.get 0
    local.get 3
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    local.get 4
    i32.const 255
    i32.and
    i32.const 2
    i32.shl
    local.tee 1
    i32.const 133448
    i32.add
    i32.load
    local.set 2
    local.get 1
    i32.const 133468
    i32.add
    i32.load
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 3
    local.get 1
    local.get 2
    call $mBufferSetBytes
    drop
    local.get 0
    local.get 3
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    local.get 0
    i32.const 0
    call $_ZN13multiversx_sc5types11interaction19contract_call_trait12ContractCall9proxy_arg17h06061d0ad76dbabdE)
  (func $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$13call_and_exit17h2472bbcf2b3e8dbbE (type 0) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=16
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      call $_ZN13multiversx_sc5types11interaction16callback_closure22cb_closure_storage_key17haa11cf0815740a67E
      local.set 3
      local.get 1
      i32.const 16
      i32.add
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 1
      local.get 1
      i32.load8_u offset=20
      i32.store8 offset=28
      local.get 1
      local.get 1
      i32.load offset=16
      i32.store offset=24
      local.get 0
      i32.const 20
      i32.add
      i32.load
      local.tee 4
      local.get 1
      i32.const 24
      i32.add
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E
      local.get 1
      i32.const 24
      i32.add
      local.get 2
      local.get 4
      call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$5write17hbbfae198c088673eE
      local.get 0
      i32.const 24
      i32.add
      local.tee 2
      i32.load
      local.tee 4
      call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$3len17h44caac58d4f30d45E
      local.get 1
      i32.const 24
      i32.add
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E
      local.get 4
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
      local.set 4
      local.get 1
      local.get 2
      i32.store offset=40
      local.get 1
      local.get 4
      i32.store offset=36
      local.get 1
      i32.const 0
      i32.store offset=32
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const 8
          i32.add
          local.get 1
          i32.const 32
          i32.add
          call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
          local.get 1
          i32.load offset=8
          i32.eqz
          br_if 1 (;@2;)
          local.get 1
          i32.load offset=12
          local.get 1
          i32.const 24
          i32.add
          call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E
          br 0 (;@3;)
        end
      end
      local.get 3
      local.get 1
      i32.load offset=24
      local.get 1
      i32.load8_u offset=28
      call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
    end
    local.get 0
    call $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$29call_and_exit_ignore_callback17hb6f04bb42018d47eE
    unreachable)
  (func $_ZN13multiversx_sc5types11interaction16callback_closure22cb_closure_storage_key17haa11cf0815740a67E (type 4) (result i32)
    (local i32 i32)
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$11get_tx_hash17he6041bc1912ff91bE
    local.set 0
    i32.const 131774
    i32.const 10
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 1
    local.get 0
    call $mBufferAppend
    drop
    local.get 1)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE)
  (func $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$5write17hbbfae198c088673eE (type 2) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=4
          i32.eqz
          br_if 0 (;@3;)
          i32.const 10000
          i32.const 0
          i32.load offset=143876
          local.tee 4
          i32.sub
          local.get 2
          i32.lt_u
          br_if 1 (;@2;)
          local.get 3
          i32.const 8
          i32.add
          local.get 4
          local.get 4
          local.get 2
          i32.add
          local.tee 0
          call $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h249e2d44497ee715E
          local.get 3
          i32.load offset=8
          local.get 3
          i32.load offset=12
          local.get 1
          local.get 2
          call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E
          i32.const 0
          local.get 0
          i32.store offset=143876
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.get 1
        local.get 2
        call $mBufferAppendBytes
        drop
        br 1 (;@1;)
      end
      local.get 0
      call $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$23flush_to_managed_buffer17hebc9a18647d7e80dE
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call $mBufferAppendBytes
      drop
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$19into_managed_buffer17h322974a5182f9d48E
    call $mBufferStorageStore
    drop)
  (func $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$29call_and_exit_ignore_callback17hb6f04bb42018d47eE (type 0) (param i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc13contract_base8wrappers16send_raw_wrapper23SendRawWrapper$LT$A$GT$14async_call_raw17hc38dd1da9c6abe77E
    unreachable)
  (func $_ZN13multiversx_sc5types11interaction16callback_closure31CallbackClosureMatcher$LT$_$GT$12name_matches17h16dca0204b5d2ecaE (type 11) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 0
      i32.load offset=32
      local.get 2
      i32.ne
      br_if 0 (;@1;)
      local.get 3
      i32.const 8
      i32.add
      i32.const 0
      local.get 2
      local.get 0
      i32.const 32
      call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17h0984fdd29b92c143E
      local.get 3
      i32.load offset=8
      local.get 3
      i32.load offset=12
      local.get 1
      local.get 2
      call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17hc097d12abfadd2f6E
      local.set 4
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN13multiversx_sc5types11interaction16callback_closure32CallbackClosureForDeser$LT$M$GT$7matcher17h575e96b74ad96fe9E (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 16
    i32.add
    i32.const 24
    i32.add
    local.tee 3
    i64.const 0
    i64.store
    local.get 2
    i32.const 16
    i32.add
    i32.const 16
    i32.add
    local.tee 4
    i64.const 0
    i64.store
    local.get 2
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    local.tee 5
    i64.const 0
    i64.store
    local.get 2
    i64.const 0
    i64.store offset=16
    local.get 2
    i32.const 8
    i32.add
    local.get 2
    i32.const 16
    i32.add
    i32.const 32
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.tee 6
    call $_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17h1e8900fb63b80d25E
    local.get 1
    i32.const 0
    local.get 2
    i32.load offset=8
    local.get 2
    i32.load offset=12
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
    drop
    local.get 0
    local.get 6
    i32.store offset=32
    local.get 0
    i32.const 24
    i32.add
    local.get 3
    i64.load
    i64.store align=1
    local.get 0
    i32.const 16
    i32.add
    local.get 4
    i64.load
    i64.store align=1
    local.get 0
    i32.const 8
    i32.add
    local.get 5
    i64.load
    i64.store align=1
    local.get 0
    local.get 2
    i64.load offset=16
    i64.store align=1
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17h1e8900fb63b80d25E (type 21) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    i32.const 0
    local.get 3
    local.get 1
    local.get 2
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h749f83e2af55068fE
    local.get 4
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 4
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hfa3da52b93bb8b38E (type 1) (param i32 i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 2
    local.get 1
    i32.const 0
    local.get 2
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec8num_conv17top_encode_number17h8b96cc408e6940ecE
    local.get 0
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call $_ZN13multiversx_sc5types7managed10codec_util28managed_buffer_top_en_output178_$LT$impl$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$u20$for$u20$$RF$mut$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$12set_slice_u817hced223e0f71ecaf9E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h9176a726c0b668b5E (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    i32.const 8
    local.get 2
    call $_ZN4core5slice5index77_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u5d$$GT$9index_mut17h1e8900fb63b80d25E
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 3
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE (type 3) (param i32 i32)
    (local i32)
    i32.const 132431
    i32.const 22
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    local.get 0
    local.get 1
    call $mBufferAppendBytes
    drop
    local.get 2
    call $managedSignalError
    unreachable)
  (func $_ZN13multiversx_sc5types7managed10codec_util27managed_buffer_top_de_input164_$LT$impl$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$20into_max_size_buffer17hb636494537abd78fE (type 2) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      call $mBufferGetLength
      local.tee 4
      i32.const 8
      i32.gt_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 8
      i32.add
      local.get 2
      local.get 4
      call $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h9176a726c0b668b5E
      local.get 1
      i32.const 0
      local.get 3
      i32.load offset=8
      local.tee 2
      local.get 3
      i32.load offset=12
      local.tee 4
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
      drop
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 133010
    i32.const 8
    i32.const 131109
    i32.const 14
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN13multiversx_sc5types7managed10codec_util28managed_buffer_top_en_output178_$LT$impl$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$u20$for$u20$$RF$mut$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$12set_slice_u817hced223e0f71ecaf9E (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $mBufferSetBytes
    drop)
  (func $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$27from_signed_bytes_be_buffer17h1eefc215c613e1faE (type 6) (param i32) (result i32)
    (local i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $mBufferToBigIntSigned
    drop
    local.get 1)
  (func $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$20from_bytes_be_buffer17h7cff4839a171a78bE (type 6) (param i32) (result i32)
    (local i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $mBufferToBigIntUnsigned
    drop
    local.get 1)
  (func $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$27read_managed_buffer_of_size17hb54e1755dce8da03E (type 5) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load
    local.tee 3
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10copy_slice17hda333ad172527088E
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 2
      i32.load offset=12
      local.set 4
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      return
    end
    i32.const 131784
    i32.const 15
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10copy_slice17hda333ad172527088E (type 21) (param i32 i32 i32 i32)
    (local i32)
    local.get 1
    local.get 2
    local.get 3
    call $mBufferNew
    local.tee 4
    call $mBufferCopyByteSlice
    local.set 3
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 3
    i32.eqz
    i32.store)
  (func $_ZN13multiversx_sc5types7managed10codec_util31managed_buffer_nested_en_output172_$LT$impl$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$5write17hb8eb2060dc4f7718E (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $mBufferAppendBytes
    drop)
  (func $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE (type 3) (param i32 i32)
    local.get 1
    local.get 0
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h78a333583657639dE)
  (func $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h78a333583657639dE (type 3) (param i32 i32)
    (local i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 2
    local.get 0
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hfa3da52b93bb8b38E
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc5types7managed5basic11big_num_cmp7cmp_i6417hc1f887b18de47759E (type 31) (param i32 i64) (result i32)
    block  ;; label = @1
      local.get 1
      i64.const 0
      i64.ne
      br_if 0 (;@1;)
      local.get 0
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$7bi_sign17h13575f02ac73399cE
      i32.const -1
      i32.add
      return
    end
    i32.const -14
    local.get 1
    call $bigIntSetInt64
    local.get 0
    i32.const -14
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$6bi_cmp17h9f5e1c81ea1f6e99E)
  (func $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$6bi_cmp17h9f5e1c81ea1f6e99E (type 5) (param i32 i32) (result i32)
    i32.const -1
    local.get 0
    local.get 1
    call $bigIntCmp
    local.tee 1
    i32.const 0
    i32.ne
    local.get 1
    i32.const 0
    i32.lt_s
    select)
  (func $_ZN13multiversx_sc5types7managed5basic11cast_to_i6411cast_to_i6417h3f74e676decaadcfE (type 32) (param i64) (result i64)
    block  ;; label = @1
      local.get 0
      i64.const -1
      i64.gt_s
      br_if 0 (;@1;)
      i32.const 131799
      i32.const 17
      call $signalError
      unreachable
    end
    local.get 0)
  (func $_ZN13multiversx_sc5types7managed5basic12big_uint_cmp115_$LT$impl$u20$core..cmp..PartialEq$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$2eq17h7b6d694a544a5437E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$6bi_cmp17h9f5e1c81ea1f6e99E
    i32.const 255
    i32.and
    i32.eqz)
  (func $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$10get_values17h6cceec556ca6a650E (type 3) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i64.const 0
    call $bigIntNew
    local.tee 2
    i64.const 0
    call $bigIntNew
    local.tee 3
    i64.const 0
    call $bigIntNew
    local.tee 4
    i64.const 0
    call $bigIntNew
    local.tee 5
    i64.const 0
    call $bigIntNew
    local.tee 6
    call $ellipticCurveGetValues
    drop
    local.get 0
    local.get 1
    call $getCurveLengthEC
    i32.store offset=20
    local.get 0
    local.get 6
    i32.store offset=16
    local.get 0
    local.get 5
    i32.store offset=12
    local.get 0
    local.get 4
    i32.store offset=8
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E (type 3) (param i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 224
          i32.ne
          br_if 0 (;@3;)
          i32.const 131828
          local.set 2
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 1
          i32.const 521
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.const 384
            i32.eq
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 1
              i32.const 256
              i32.eq
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              br 4 (;@1;)
            end
            i32.const 131824
            local.set 2
            br 2 (;@2;)
          end
          i32.const 131820
          local.set 2
          br 1 (;@2;)
        end
        i32.const 131816
        local.set 2
      end
      i32.const 1
      local.set 1
      local.get 2
      i32.const 4
      call $createEC
      local.set 2
    end
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$6append17h1fadaad7ded68adcE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $mBufferAppend
    drop)
  (func $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$8is_empty17hc5b24e8932ff9064E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    i32.eqz)
  (func $_ZN13multiversx_sc5types7managed5basic17big_int_operators114_$LT$impl$u20$core..ops..arith..Add$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17hcf7081b25b87fea7E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 0
    local.get 1
    call $bigIntAdd
    local.get 0)
  (func $_ZN13multiversx_sc5types7managed5basic17big_int_operators192_$LT$impl$u20$core..ops..arith..Add$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17h61e1e6f40900f842E (type 5) (param i32 i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntAdd
    local.get 2)
  (func $_ZN13multiversx_sc5types7managed5basic17big_int_operators194_$LT$impl$u20$core..ops..arith..AddAssign$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$10add_assign17h109fbe5240173903E (type 3) (param i32 i32)
    local.get 0
    local.get 0
    local.get 1
    call $bigIntAdd)
  (func $_ZN13multiversx_sc5types7managed5basic17big_int_operators194_$LT$impl$u20$core..ops..arith..SubAssign$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$10sub_assign17h644c256208b47b5eE (type 3) (param i32 i32)
    local.get 0
    local.get 0
    local.get 1
    call $bigIntSub)
  (func $_ZN13multiversx_sc5types7managed5basic18big_uint_operators133_$LT$impl$u20$core..ops..bit..ShlAssign$LT$usize$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$10shl_assign17h860a5ed45a2722e5E (type 3) (param i32 i32)
    local.get 0
    local.get 0
    local.get 1
    call $bigIntShl)
  (func $_ZN13multiversx_sc5types7managed5basic18big_uint_operators133_$LT$impl$u20$core..ops..bit..ShrAssign$LT$usize$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$10shr_assign17h3238fb0d06e183b8E (type 3) (param i32 i32)
    local.get 0
    local.get 0
    local.get 1
    call $bigIntShr)
  (func $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$3pow17h9218ad83017013c6E (type 5) (param i32 i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9make_temp17hdce4b600b1e7c34dE
    call $bigIntPow
    local.get 2)
  (func $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9make_temp17hdce4b600b1e7c34dE (type 6) (param i32) (result i32)
    i32.const -14
    local.get 0
    i64.extend_i32_u
    call $bigIntSetInt64
    i32.const -14)
  (func $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4sqrt17ha2c170221850f6daE (type 6) (param i32) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    local.get 0
    call $bigIntSqrt
    local.get 1)
  (func $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E (type 4) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    i64.const 0
    call $bigIntSetInt64
    local.get 0)
  (func $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9set_value17h8e043dcc138efba4E (type 1) (param i32 i64)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic11cast_to_i6411cast_to_i6417h3f74e676decaadcfE
    call $bigIntSetInt64)
  (func $_ZN13multiversx_sc5types7managed7wrapped11managed_ref23ManagedRef$LT$M$C$T$GT$11clone_value17h059ee3f32c3cec90E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E)
  (func $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4find17h74f8d6aa9705f250E (type 2) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.set 5
    i32.const 0
    local.set 6
    i32.const 0
    local.set 7
    loop  ;; label = @1
      local.get 6
      local.set 8
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 7
            i32.const 4
            i32.add
            local.tee 9
            local.get 5
            i32.le_u
            br_if 0 (;@4;)
            local.get 10
            local.set 8
            br 1 (;@3;)
          end
          local.get 3
          i32.const 0
          i32.store offset=12
          local.get 1
          local.get 7
          local.get 3
          i32.const 12
          i32.add
          i32.const 4
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
          drop
          local.get 3
          i32.load offset=12
          local.tee 7
          i32.const 24
          i32.shl
          local.get 7
          i32.const 65280
          i32.and
          i32.const 8
          i32.shl
          i32.or
          local.get 7
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 7
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          local.get 2
          call $_ZN13multiversx_sc5types7managed5basic12big_uint_cmp115_$LT$impl$u20$core..cmp..PartialEq$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$2eq17h7b6d694a544a5437E
          i32.eqz
          br_if 1 (;@2;)
          i32.const 1
          local.set 4
        end
        local.get 0
        local.get 8
        i32.store offset=4
        local.get 0
        local.get 4
        i32.store
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 8
      i32.const 1
      i32.add
      local.set 6
      local.get 9
      local.set 7
      local.get 8
      local.set 10
      br 0 (;@1;)
    end)
  (func $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$5slice17h4a82b818a0176763E (type 21) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    local.get 1
    local.get 2
    i32.const 2
    i32.shl
    local.get 3
    local.get 2
    i32.sub
    i32.const 2
    i32.shl
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10copy_slice17hda333ad172527088E
    local.get 4
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 4
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$7try_get17h72d9f1c2392d0496E (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 0
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 2
    i32.shl
    local.get 3
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
    local.set 1
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.const 1
    i32.xor
    i32.store
    local.get 0
    local.get 2
    i32.const 24
    i32.shl
    local.get 2
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 2
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 2
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=4
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$4zero17h214ab0caab2b8b09E (type 4) (result i32)
    i32.const 131313
    call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$14new_from_bytes17hcae76b0eaf4182bfE)
  (func $_ZN13multiversx_sc5types7managed7wrapped16token_identifier24TokenIdentifier$LT$M$GT$24is_valid_esdt_identifier17hddb8bf3558d37511E (type 6) (param i32) (result i32)
    local.get 0
    call $validateTokenIdentifier
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc5types7managed7wrapped24preloaded_managed_buffer31PreloadedManagedBuffer$LT$M$GT$10load_slice17h5ed0773220526e6eE (type 17) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=8
          br_if 0 (;@3;)
          local.get 0
          i32.load
          local.tee 5
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
          local.tee 6
          i32.const 10000
          i32.gt_u
          br_if 1 (;@2;)
          i32.const 0
          i32.load8_u offset=143880
          i32.const 255
          i32.and
          br_if 1 (;@2;)
          i32.const 0
          local.get 6
          i32.store offset=143876
          i32.const 0
          i32.const 1
          i32.store8 offset=143880
          local.get 4
          i32.const 8
          i32.add
          local.get 6
          call $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h9dbc76a3bdcb0cc7E
          local.get 5
          i32.const 0
          local.get 4
          i32.load offset=8
          local.get 4
          i32.load offset=12
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
          drop
          local.get 0
          i32.const 1
          i32.store8 offset=8
        end
        i32.const 1
        local.set 0
        local.get 3
        local.get 1
        i32.add
        local.tee 5
        i32.const 0
        i32.load offset=143876
        i32.gt_u
        br_if 1 (;@1;)
        local.get 4
        local.get 1
        local.get 5
        call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17hc6489111951cb72cE
        local.get 2
        local.get 3
        local.get 4
        i32.load
        local.get 4
        i32.load offset=4
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E
        i32.const 0
        local.set 0
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store8 offset=8
      local.get 5
      local.get 1
      local.get 2
      local.get 3
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
      local.set 0
    end
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17hc6489111951cb72cE (type 2) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 1
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        i32.const 10000
        i32.le_u
        br_if 1 (;@1;)
        local.get 2
        i32.const 10000
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
        unreachable
      end
      local.get 1
      local.get 2
      call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
      unreachable
    end
    local.get 0
    local.get 2
    local.get 1
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 1
    i32.const 133876
    i32.add
    i32.store)
  (func $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$23flush_to_managed_buffer17hebc9a18647d7e80dE (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load8_u offset=4
    local.set 2
    local.get 0
    i32.const 0
    i32.store8 offset=4
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const 8
      i32.add
      i32.const 0
      i32.const 0
      i32.load offset=143876
      call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$5index17hc6489111951cb72cE
      local.get 0
      i32.load
      local.get 1
      i32.load offset=8
      local.get 1
      i32.load offset=12
      call $mBufferAppendBytes
      drop
      i32.const 0
      i32.const 0
      i32.store offset=143876
      i32.const 0
      i32.const 0
      i32.store8 offset=143880
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE (type 6) (param i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 0
      call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h6ed55561773af550E
      local.tee 1
      i64.const 4294967296
      i64.lt_u
      br_if 0 (;@1;)
      i32.const 131109
      i32.const 14
      call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
      unreachable
    end
    local.get 1
    i32.wrap_i64)
  (func $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h6ed55561773af550E (type 14) (param i32) (result i64)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i64.const 0
    i64.store offset=8
    local.get 1
    local.get 0
    local.get 1
    i32.const 8
    i32.add
    call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$20into_max_size_buffer17h92d1c03c3f72e84cE
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN13multiversx_sc7storage11storage_get11storage_get17h737c80571f8d47c6E (type 6) (param i32) (result i32)
    (local i64)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h6ed55561773af550E
          local.tee 1
          i64.const 1
          i64.gt_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 0
          local.get 1
          i32.wrap_i64
          br_table 2 (;@1;) 1 (;@2;) 2 (;@1;)
        end
        i32.const 133053
        i32.const 18
        call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
        unreachable
      end
      i32.const 1
      local.set 0
    end
    local.get 0)
  (func $_ZN143_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h5b4d28b09ba2cb61E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$17to_managed_buffer17h7bc5b32b90e7913eE)
  (func $_ZN13multiversx_sc7storage11storage_get11storage_get17hb86693f2ec665886E (type 6) (param i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 0
      call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h6ed55561773af550E
      local.tee 1
      i64.const 256
      i64.lt_u
      br_if 0 (;@1;)
      i32.const 131109
      i32.const 14
      call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
      unreachable
    end
    local.get 1
    i32.wrap_i64)
  (func $_ZN13multiversx_sc7storage11storage_get11storage_get17hba1405c72ada0b45E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$17to_managed_buffer17h7bc5b32b90e7913eE
    call $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$27from_signed_bytes_be_buffer17h1eefc215c613e1faE)
  (func $_ZN13multiversx_sc7storage11storage_get11storage_get17hc334ccdf02674fc3E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$17to_managed_buffer17h7bc5b32b90e7913eE
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$20from_bytes_be_buffer17h7cff4839a171a78bE)
  (func $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$23load_len_managed_buffer17hee3eac868855d798E)
  (func $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$23load_len_managed_buffer17hee3eac868855d798E (type 6) (param i32) (result i32)
    local.get 0
    i32.const -25
    call $mBufferStorageLoad
    drop
    i32.const -25
    call $mBufferGetLength)
  (func $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE (type 2) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        i32.const 133776
        i32.const 0
        local.get 0
        call $_ZN19multiversx_sc_codec14impl_for_types11impl_string84_$LT$impl$u20$multiversx_sc_codec..single..top_en..TopEncode$u20$for$u20$$RF$str$GT$24top_encode_or_handle_err17hb8610d11d1269291E
        return
      end
      i32.const 132987
      i32.const 7
      local.get 0
      call $_ZN19multiversx_sc_codec14impl_for_types11impl_string84_$LT$impl$u20$multiversx_sc_codec..single..top_en..TopEncode$u20$for$u20$$RF$str$GT$24top_encode_or_handle_err17hb8610d11d1269291E
      return
    end
    local.get 0
    local.get 2
    call $_ZN13multiversx_sc7storage11storage_set25StorageSetOutput$LT$A$GT$18set_managed_buffer17h3564e74a02be71bbE)
  (func $_ZN19multiversx_sc_codec14impl_for_types11impl_string84_$LT$impl$u20$multiversx_sc_codec..single..top_en..TopEncode$u20$for$u20$$RF$str$GT$24top_encode_or_handle_err17hb8610d11d1269291E (type 2) (param i32 i32 i32)
    local.get 2
    local.get 0
    local.get 1
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE)
  (func $_ZN13multiversx_sc7storage11storage_set25StorageSetOutput$LT$A$GT$18set_managed_buffer17h3564e74a02be71bbE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $mBufferStorageStore
    drop)
  (func $_ZN13multiversx_sc7storage11storage_set11storage_set17h928a09f00b89c410E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$25to_signed_bytes_be_buffer17hbdc86e5a6e67f375E
    call $mBufferStorageStore
    drop)
  (func $_ZN13multiversx_sc7storage11storage_set11storage_set17ha6231ce99e421824E (type 0) (param i32)
    local.get 0
    i32.const 133776
    i32.const 0
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE)
  (func $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $mBufferStorageStore
    drop)
  (func $_ZN13multiversx_sc7storage11storage_set11storage_set17haa050e4e558e005eE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage11storage_set25StorageSetOutput$LT$A$GT$18set_managed_buffer17h3564e74a02be71bbE)
  (func $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E (type 0) (param i32)
    i32.const -20
    i32.const 133776
    i32.const 0
    call $mBufferSetBytes
    drop
    local.get 0
    i32.const -20
    call $mBufferStorageStore
    drop)
  (func $_ZN13multiversx_sc7storage24storage_get_from_address28storage_get_len_from_address17h1dde8b4d26c0591bE (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    i32.const -25
    call $mBufferStorageLoadFromAddress
    i32.const -25
    call $mBufferGetLength)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h10d6cde70efcba7fE (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        br_if 0 (;@2;)
        local.get 2
        i32.const 8
        i32.add
        local.get 1
        i32.load offset=4
        local.get 1
        i32.const 8
        i32.add
        i32.load
        i32.const 0
        call $_ZN13multiversx_sc7storage7mappers10map_mapper29VacantEntry$LT$SA$C$K$C$V$GT$6insert17hd79f47863aab386aE
        local.get 2
        i32.load offset=12
        local.set 3
        local.get 2
        i32.load offset=8
        local.set 1
        br 1 (;@1;)
      end
      local.get 1
      i32.const 8
      i32.add
      i32.load
      local.set 3
      local.get 1
      i32.load offset=4
      local.set 1
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper29VacantEntry$LT$SA$C$K$C$V$GT$6insert17hd79f47863aab386aE (type 21) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    local.get 2
    local.get 1
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$15build_named_key17h7435686f566f7ef5E (type 5) (param i32 i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 131945
    i32.const 7
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE
    local.get 0)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.const 24
    i32.shl
    local.get 0
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 0
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 0
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN13multiversx_sc5types7managed10codec_util31managed_buffer_nested_en_output172_$LT$impl$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$5write17hb8eb2060dc4f7718E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$16get_mapped_value17h70e47702f7bc3f7dE (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$15build_named_key17h7435686f566f7ef5E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$18clear_mapped_value17h79c77a5cea91deddE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$15build_named_key17h7435686f566f7ef5E
    call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E)
  (func $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$11get_node_id17h8788e8ee3bb1eb85E
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E (type 2) (param i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
        br_if 0 (;@2;)
        local.get 0
        local.get 2
        i32.store offset=4
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      local.get 2
      i32.store offset=4
      i32.const 1
      local.set 2
    end
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 1
    i32.store offset=8)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE (type 21) (param i32 i32 i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    local.get 1
    i32.load
    local.tee 5
    local.get 1
    i32.const 8
    i32.add
    i32.load
    local.tee 6
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
    local.get 4
    i64.load offset=8
    local.set 7
    local.get 6
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$15build_named_key17h7435686f566f7ef5E
    local.get 3
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
    local.get 5
    local.get 1
    i32.const 4
    i32.add
    i32.load
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6insert17hf8c674998b013d90E
    drop
    local.get 0
    local.get 7
    i64.store
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE (type 1) (param i32 i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 2
    local.get 1
    i32.const 0
    local.get 2
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec8num_conv17top_encode_number17h8b96cc408e6940ecE
    local.get 0
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6insert17hf8c674998b013d90E (type 11) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
      local.tee 3
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$17push_back_node_id17h5907f24270b21d06E
      local.set 1
      local.get 0
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$21build_named_value_key17he0bad4cf728134caE
      local.get 1
      i64.extend_i32_u
      call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
    end
    local.get 3
    i32.const 1
    i32.xor)
  (func $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE (type 5) (param i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.get 1
    i32.load
    local.get 1
    i32.const 8
    i32.add
    i32.load
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
    local.get 2
    i32.load offset=12
    local.set 1
    local.get 2
    i32.load offset=8
    call $_ZN4core6option15Option$LT$T$GT$6unwrap17h8f0d08bef36ac9d5E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$11get_node_id17h8788e8ee3bb1eb85E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$21build_named_value_key17he0bad4cf728134caE
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE)
  (func $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$21build_named_value_key17he0bad4cf728134caE (type 5) (param i32 i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 131952
    i32.const 8
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$13clear_node_id17h975595fd4690aa62E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$21build_named_value_key17he0bad4cf728134caE
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17ha6231ce99e421824E)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$17push_back_node_id17h5907f24270b21d06E (type 5) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 16
    i32.add
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 2
    local.get 2
    i32.load offset=28
    i32.const 1
    i32.add
    local.tee 3
    i32.store offset=28
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.load offset=16
        local.tee 4
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.store offset=20
        i32.const 0
        local.set 5
        br 1 (;@1;)
      end
      local.get 2
      i32.const 8
      i32.add
      local.get 0
      local.get 2
      i32.load offset=24
      local.tee 5
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E
      local.get 0
      local.get 5
      local.get 2
      i32.load offset=8
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_node17hf40464b0d2e9afc4E
    end
    local.get 0
    local.get 3
    local.get 5
    i32.const 0
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_node17hf40464b0d2e9afc4E
    local.get 2
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    local.tee 5
    local.get 3
    i32.store
    local.get 0
    i32.const 131976
    i32.const 6
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E
    local.get 1
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
    local.get 2
    local.get 4
    i32.const 1
    i32.add
    i32.store offset=16
    local.get 2
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 5
    i64.load
    i64.store
    local.get 2
    local.get 2
    i64.load offset=16
    i64.store offset=32
    local.get 0
    local.get 2
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6remove17h39982222b32934abE (type 11) (param i32 i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$11get_node_id17h8788e8ee3bb1eb85E
      local.tee 4
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 8
      i32.add
      local.get 1
      local.get 4
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$17remove_by_node_id17h96102b4c021b2eddE
      local.get 0
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$13clear_node_id17h975595fd4690aa62E
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$17remove_by_node_id17h96102b4c021b2eddE (type 2) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 24
      i32.add
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E
      local.get 3
      i32.load offset=28
      local.set 4
      local.get 3
      i32.load offset=24
      local.set 5
      local.get 3
      i32.const 32
      i32.add
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 16
          i32.add
          local.get 1
          local.get 5
          call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E
          local.get 1
          local.get 5
          local.get 3
          i32.load offset=16
          local.get 4
          call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_node17hf40464b0d2e9afc4E
          br 1 (;@2;)
        end
        local.get 3
        local.get 4
        i32.store offset=36
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.const 8
          i32.add
          local.get 1
          local.get 4
          call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E
          local.get 1
          local.get 4
          local.get 5
          local.get 3
          i32.load offset=12
          call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_node17hf40464b0d2e9afc4E
          br 1 (;@2;)
        end
        local.get 3
        local.get 5
        i32.store offset=40
      end
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$10clear_node17h85f25e59675df613E
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$9get_value17he2a99ce07db1f8ebE
      local.set 4
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$11clear_value17hdcc4a95241c535b5E
      local.get 3
      local.get 3
      i32.load offset=32
      i32.const -1
      i32.add
      i32.store offset=32
      local.get 3
      i32.const 48
      i32.add
      i32.const 8
      i32.add
      local.get 3
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      i64.load
      i64.store
      local.get 3
      local.get 3
      i64.load offset=32
      i64.store offset=48
      local.get 1
      local.get 3
      i32.const 48
      i32.add
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
      i32.const 1
      local.set 1
    end
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$13get_unchecked17h02a31a6bd2b6ad4fE (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$8item_key17h3bc772177fe82250E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE)
  (func $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$8item_key17h3bc772177fe82250E (type 5) (param i32 i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 131960
    i32.const 5
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h70cc52a0636bead3E
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$14len_at_address17hc738efff9db16961E (type 5) (param i32 i32) (result i32)
    (local i64)
    block  ;; label = @1
      local.get 1
      local.get 0
      call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h500d9516707dafa6E
      local.tee 2
      i64.const 4294967296
      i64.lt_u
      br_if 0 (;@1;)
      i32.const 131109
      i32.const 14
      call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
      unreachable
    end
    local.get 2
    i32.wrap_i64)
  (func $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h500d9516707dafa6E (type 27) (param i32 i32) (result i64)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 0
    local.get 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 3
    call $mBufferStorageLoadFromAddress
    local.get 2
    local.get 3
    local.get 2
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc5types7managed10codec_util27managed_buffer_top_de_input164_$LT$impl$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$20into_max_size_buffer17h562f19004f9e1bc8E
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 4
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$3len17h77deb63241d065dcE (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE)
  (func $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$3set17h7ba50ad051491842E (type 21) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$3len17h77deb63241d065dcE
      local.get 2
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$8item_key17h3bc772177fe82250E
      local.get 3
      i64.extend_i32_u
      call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
      return
    end
    i32.const 133577
    i32.const 18
    call $signalError
    unreachable)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h70cc52a0636bead3E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$10clear_node17h85f25e59675df613E (type 3) (param i32 i32)
    local.get 0
    i32.const 131965
    i32.const 11
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17ha6231ce99e421824E)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E (type 17) (param i32 i32 i32 i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    local.get 1
    local.get 2
    call $mBufferAppendBytes
    drop
    local.get 3
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$11clear_value17hdcc4a95241c535b5E (type 3) (param i32 i32)
    local.get 0
    i32.const 131976
    i32.const 6
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17ha6231ce99e421824E)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$14build_name_key17hf9527ff2fe24fa26E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 131982
    i32.const 5
    call $mBufferAppendBytes
    drop
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE (type 3) (param i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$14build_name_key17hf9527ff2fe24fa26E
          local.tee 1
          call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$23load_len_managed_buffer17hee3eac868855d798E
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          i32.const 0
          local.set 3
          i32.const 0
          local.set 4
          i32.const 0
          local.set 5
          br 1 (;@2;)
        end
        local.get 2
        i32.const 8
        i32.add
        local.get 1
        call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
        local.set 1
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
        local.set 3
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
        local.set 4
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
        local.set 5
        local.get 2
        i32.load offset=12
        local.get 2
        i32.load offset=8
        i32.ne
        br_if 1 (;@1;)
        local.get 2
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 5
      i32.store offset=12
      local.get 0
      local.get 4
      i32.store offset=8
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 1
      i32.store
      local.get 2
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_node17hf40464b0d2e9afc4E (type 21) (param i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 0
    i32.const 131965
    i32.const 11
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$23build_node_id_named_key17he7d6eaf156574665E
    local.set 1
    local.get 4
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 4
    local.get 4
    i32.load8_u offset=4
    i32.store8 offset=12
    local.get 4
    local.get 4
    i32.load
    i32.store offset=8
    local.get 2
    local.get 4
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 3
    local.get 4
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 1
    local.get 4
    i32.load offset=8
    local.get 4
    i32.load8_u offset=12
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$14build_name_key17hf9527ff2fe24fa26E
    local.set 0
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
        local.get 2
        local.get 2
        i32.load8_u offset=4
        i32.store8 offset=12
        local.get 2
        local.get 2
        i32.load
        i32.store offset=8
        local.get 3
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 1
        i32.load offset=4
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 1
        i32.load offset=8
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 1
        i32.load offset=12
        local.get 2
        i32.const 8
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 0
        local.get 2
        i32.load offset=8
        local.get 2
        i32.load8_u offset=12
        call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
        br 1 (;@1;)
      end
      local.get 0
      i32.const 133776
      i32.const 0
      call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.load
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 2
    i32.load offset=4
    local.set 3
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E (type 6) (param i32) (result i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h8c0acebb347076f9E
    local.get 1
    i32.const 12
    i32.add
    i32.const 4
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.wrap_i64)
  (func $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$23set_internal_mapper_len17h4a6b3ac4ab8185eeE (type 3) (param i32 i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 132002
    i32.const 4
    call $mBufferAppendBytes
    drop
    local.get 0
    local.get 1
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE)
  (func $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3get17h24947d503de9919aE (type 11) (param i32 i32 i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$3len17h77deb63241d065dcE
        local.get 2
        i32.ge_u
        br_if 1 (;@1;)
      end
      i32.const 133577
      i32.const 18
      call $signalError
      unreachable
    end
    local.get 0
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$8item_key17h3bc772177fe82250E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    local.tee 1
    local.get 2
    local.get 1
    select)
  (func $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3set17h061fc0c935544b80E (type 21) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    i32.const 0
    local.get 3
    local.get 2
    local.get 3
    i32.eq
    select
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$3set17h7ba50ad051491842E)
  (func $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$19contains_at_address17hadd3e477e50dbdafE (type 11) (param i32 i32 i32) (result i32)
    local.get 1
    local.get 0
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$21build_mapper_for_item17hcefd869fbc364a86E
    call $_ZN13multiversx_sc7storage24storage_get_from_address28storage_get_len_from_address17h1dde8b4d26c0591bE
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$21build_mapper_for_item17hcefd869fbc364a86E (type 5) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d62025df94d87e4E
    local.get 0)
  (func $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d62025df94d87e4E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.tee 3
    i32.const 24
    i32.shl
    local.get 3
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 3
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 3
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    local.get 1
    local.get 2
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN13multiversx_sc5types7managed10codec_util31managed_buffer_nested_en_output172_$LT$impl$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$5write17hb8eb2060dc4f7718E
    local.get 1
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$6append17h1fadaad7ded68adcE
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$8contains17h34c0d10949f7e852E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$21build_mapper_for_item17hcefd869fbc364a86E
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$11remove_node17h670376a1bb118cf9E (type 3) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.load offset=4
      local.tee 3
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E
      br_if 0 (;@1;)
      local.get 2
      local.get 0
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=12
          local.tee 4
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 16
          i32.add
          local.get 0
          local.get 4
          call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
          local.get 2
          local.get 1
          i32.load offset=8
          local.tee 1
          i32.store offset=24
          local.get 0
          local.get 4
          local.get 2
          i32.const 16
          i32.add
          call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
          br 1 (;@2;)
        end
        local.get 2
        local.get 1
        i32.load offset=8
        local.tee 1
        i32.store offset=4
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 16
          i32.add
          local.get 0
          local.get 1
          call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
          local.get 2
          local.get 4
          i32.store offset=28
          local.get 0
          local.get 1
          local.get 2
          i32.const 16
          i32.add
          call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
          br 1 (;@2;)
        end
        local.get 2
        local.get 4
        i32.store offset=8
      end
      local.get 0
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$23build_node_id_named_key17ha311ee24026ab3c6E
      i32.const 1
      i32.const 0
      call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE
      local.get 2
      local.get 2
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 2
      i32.const 16
      i32.add
      i32.const 8
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i64.load
      i64.store
      local.get 2
      local.get 2
      i64.load
      i64.store offset=16
      local.get 0
      local.get 2
      i32.const 16
      i32.add
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
    end
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$23build_node_id_named_key17ha311ee24026ab3c6E
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i32.eqz)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE (type 2) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$23build_node_id_named_key17ha311ee24026ab3c6E
    call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 2
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 1
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 4
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 5
    block  ;; label = @1
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 3
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 5
      i32.store offset=12
      local.get 0
      local.get 4
      i32.store offset=8
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 0
      local.get 2
      i32.store
      local.get 3
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$23build_node_id_named_key17ha311ee24026ab3c6E
    local.set 1
    local.get 3
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 3
    local.get 3
    i32.load8_u offset=4
    i32.store8 offset=12
    local.get 3
    local.get 3
    i32.load
    i32.store offset=8
    local.get 2
    i32.load
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 2
    i32.load offset=4
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 2
    i32.load offset=8
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 2
    i32.load offset=12
    local.get 3
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
    local.get 1
    local.get 3
    i32.load offset=8
    local.get 3
    i32.load8_u offset=12
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$23build_node_id_named_key17ha311ee24026ab3c6E (type 5) (param i32 i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 132006
    i32.const 5
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14set_node_value17he4ff803fe8d55807E (type 2) (param i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      local.get 1
      i32.load offset=4
      local.tee 3
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      i32.store
      local.get 0
      local.get 3
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
    end)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$17remove_node_by_id17hdef7e27a5f2b5c1eE (type 2) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E
      br_if 0 (;@1;)
      local.get 3
      i32.const 24
      i32.add
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
      local.get 3
      i32.const 8
      i32.add
      local.get 3
      i32.const 24
      i32.add
      call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
      local.get 1
      local.get 3
      i32.const 8
      i32.add
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$11remove_node17h670376a1bb118cf9E
      local.get 0
      i32.const 12
      i32.add
      local.get 3
      i32.const 16
      i32.add
      i64.load
      i64.store align=4
      local.get 0
      local.get 3
      i64.load offset=8
      i64.store offset=4 align=4
      i32.const 1
      local.set 4
    end
    local.get 0
    local.get 4
    i32.store
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$5front17h5b4a1e2f903707b6E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    local.get 1
    local.get 2
    i32.load offset=4
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers18map_storage_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h320e522439c99b2aE (type 3) (param i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load
        br_if 0 (;@2;)
        local.get 1
        i32.const 8
        i32.add
        i32.load
        local.tee 2
        i32.load
        local.get 2
        i32.const 4
        i32.add
        i32.load
        local.get 1
        i32.load offset=4
        local.tee 1
        call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6insert17hf8c674998b013d90E
        drop
        br 1 (;@1;)
      end
      local.get 1
      i32.const 8
      i32.add
      i32.load
      local.set 2
      local.get 1
      i32.load offset=4
      local.set 1
    end
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN13multiversx_sc7storage7mappers18map_storage_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17h6d14ea0f43547547E (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.load
    local.get 2
    i32.const 8
    i32.add
    i32.load
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E
    local.get 0
    local.get 3
    call $_ZN4core6option15Option$LT$T$GT$6unwrap17h325328b8dfa53392E
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E (type 21) (param i32 i32 i32 i32)
    (local i32)
    i32.const 0
    local.set 4
    block  ;; label = @1
      local.get 1
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      local.get 2
      local.get 3
      call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$24get_mapped_storage_value17h8ffeb03c4ee7d558E
      i32.const 1
      local.set 4
    end
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN4core6option15Option$LT$T$GT$6unwrap17h325328b8dfa53392E (type 3) (param i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load
      br_if 0 (;@1;)
      call $_ZN4core9panicking5panic17h6b6c6cd2a60c4adfE
      unreachable
    end
    local.get 0
    local.get 1
    i64.load offset=4 align=4
    i64.store align=4
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    i32.const 12
    i32.add
    i32.load
    i32.store)
  (func $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$24get_mapped_storage_value17h8ffeb03c4ee7d558E (type 2) (param i32 i32 i32)
    local.get 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 1
    i32.const 132011
    i32.const 8
    call $mBufferAppendBytes
    drop
    local.get 2
    local.get 1
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE
    local.get 0
    local.get 1
    call $_ZN157_$LT$multiversx_sc..storage..mappers..map_mapper..MapMapper$LT$SA$C$K$C$V$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17hf3732ec6cda8c889E)
  (func $_ZN157_$LT$multiversx_sc..storage..mappers..map_mapper..MapMapper$LT$SA$C$K$C$V$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17hf3732ec6cda8c889E (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 3
    local.get 2
    i32.const 8
    i32.add
    local.get 1
    call $_ZN153_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17h123fe8b523d03a5bE
    local.get 0
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$15raw_byte_length17h60bcbbde430cc6e1E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE)
  (func $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hb404350c984485d8E (type 0) (param i32)
    local.get 0
    i64.const 1
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE)
  (func $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE (type 1) (param i32 i64)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i64.const 0
    i64.store offset=8
    local.get 2
    local.get 1
    i32.const 1
    local.get 2
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec8num_conv17top_encode_number17h8b96cc408e6940ecE
    local.get 0
    local.get 2
    i32.load
    local.get 2
    i32.load offset=4
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hf2db335a83e0842bE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17h928a09f00b89c410E)
  (func $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$8is_empty17h4953e8b6d13380e9E (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$15raw_byte_length17h60bcbbde430cc6e1E
    i32.eqz)
  (func $_ZN13multiversx_sc7storage7mappers5token12token_mapper13check_not_set17h743a9fde09f89782E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h9de743fff1b457ccE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=8
          br_table 0 (;@3;) 1 (;@2;) 2 (;@1;) 0 (;@3;)
        end
        local.get 1
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 132039
      i32.const 24
      call $signalError
      unreachable
    end
    i32.const 132019
    i32.const 20
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper14get_sc_address17h47b974f167790997E (type 4) (result i32)
    (local i32)
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedSCAddress
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper15set_local_roles17h212856cd0e2cd002E (type 2) (param i32 i32 i32)
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper14get_sc_address17h47b974f167790997E
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper27set_local_roles_for_address17hb7e5b07c691413f1E
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper27set_local_roles_for_address17hb7e5b07c691413f1E (type 21) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      i32.load
      call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper8is_empty17h44cbef184c4fb8aeE
      br_if 0 (;@1;)
      local.get 0
      call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
      local.set 0
      local.get 4
      i32.const 40
      i32.add
      i32.const 131674
      call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$14new_from_bytes17hcae76b0eaf4182bfE
      i32.const 131660
      i32.const 14
      call $_ZN13multiversx_sc5types11interaction24contract_call_no_payment48ContractCallNoPayment$LT$SA$C$OriginalResult$GT$3new17h6ab62a5b02ab110cE
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
      drop
      local.get 0
      i32.load
      call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
      local.set 0
      local.get 4
      i32.load offset=56
      local.tee 5
      local.get 0
      call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
      local.get 1
      local.get 5
      call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h47e31fb5e645d095E
      i32.const 0
      local.set 0
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.const 2
          i32.eq
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 2
            local.get 0
            i32.add
            i32.load8_u
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            local.get 1
            i32.const 2
            i32.shl
            local.tee 1
            i32.const 133828
            i32.add
            i32.load
            local.get 1
            i32.const 133792
            i32.add
            i32.load
            call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
            call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
          end
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          br 0 (;@3;)
        end
      end
      call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
      local.set 0
      local.get 4
      i32.const 0
      i32.store offset=24
      local.get 4
      local.get 5
      i32.store offset=20
      local.get 4
      local.get 0
      i32.store offset=12
      local.get 4
      local.get 4
      i32.load offset=52
      i32.store offset=16
      local.get 4
      local.get 4
      i32.load offset=48
      local.tee 0
      i32.store offset=8
      block  ;; label = @2
        local.get 3
        i32.load
        i32.eqz
        br_if 0 (;@2;)
        local.get 4
        i32.const 24
        i32.add
        local.tee 1
        local.get 3
        i64.load align=4
        i64.store align=4
        local.get 1
        i32.const 8
        i32.add
        local.get 3
        i32.const 8
        i32.add
        i32.load
        i32.store
        local.get 4
        local.get 0
        i32.store offset=8
      end
      local.get 4
      i32.const 8
      i32.add
      call $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$13call_and_exit17h2472bbcf2b3e8dbbE
      unreachable
    end
    i32.const 132100
    i32.const 32
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper8is_empty17h44cbef184c4fb8aeE (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i32.eqz)
  (func $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E (type 6) (param i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.load
      i32.const 2
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.const 4
      i32.add
      return
    end
    i32.const 132063
    i32.const 16
    call $signalError
    unreachable)
  (func $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h47e31fb5e645d095E (type 3) (param i32 i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 1
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E)
  (func $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$23issue_and_set_all_roles17h03e8bec7db1fe316E (type 19) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper13check_not_set17h743a9fde09f89782E
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load
        br_if 0 (;@2;)
        local.get 5
        local.get 0
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$28default_callback_closure_obj17h8f4c8f3d3f4349b1E
        br 1 (;@1;)
      end
      local.get 5
      i32.const 8
      i32.add
      local.get 4
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 5
      local.get 4
      i64.load align=4
      i64.store
    end
    local.get 0
    i32.const 1
    local.get 5
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
    local.get 5
    i32.const 48
    i32.add
    local.get 1
    local.get 2
    local.get 3
    i32.const 0
    call $_ZN13multiversx_sc4esdt15system_sc_proxy38ESDTSystemSmartContractProxy$LT$SA$GT$23issue_and_set_all_roles17hd45cbc9b55abb1b6E
    local.get 5
    i32.const 40
    i32.add
    local.get 5
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 5
    local.get 5
    i64.load
    i64.store offset=32
    local.get 5
    local.get 5
    i64.load offset=60 align=4
    i64.store offset=24
    local.get 5
    local.get 5
    i32.load offset=72
    i32.store offset=20
    local.get 5
    local.get 5
    i32.load offset=56
    i32.store offset=16
    local.get 5
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$13call_and_exit17h2472bbcf2b3e8dbbE
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$28default_callback_closure_obj17h8f4c8f3d3f4349b1E (type 2) (param i32 i32 i32)
    (local i32 i32)
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$10get_caller17hd6bfca50036c0966E
    local.set 3
    local.get 2
    call $_ZN4core3cmp10PartialOrd2gt17h91d47ae8b32d5acfE
    local.set 2
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 4
    i32.store offset=8
    local.get 0
    i32.const 28
    i32.const 16
    local.get 2
    select
    i32.store offset=4
    local.get 0
    i32.const 132132
    i32.const 132160
    local.get 2
    select
    i32.store
    local.get 3
    local.get 4
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h47e31fb5e645d095E
    local.get 4
    local.get 1
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E)
  (func $_ZN4core3cmp10PartialOrd2gt17h91d47ae8b32d5acfE (type 6) (param i32) (result i32)
    local.get 0
    i64.const 0
    call $_ZN13multiversx_sc5types7managed5basic11big_num_cmp7cmp_i6417hc1f887b18de47759E
    i32.const 255
    i32.and
    i32.const 1
    i32.eq)
  (func $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$4mint17h776729043b73506cE (type 21) (param i32 i32 i32 i32)
    local.get 1
    local.get 2
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12get_token_id17h8110bef35cbac080E
    local.tee 2
    i64.const 0
    local.get 3
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$15esdt_local_mint17h6d2f871c4ea177e6E
    local.get 0
    local.get 3
    i32.store offset=12
    local.get 0
    i64.const 0
    i64.store
    local.get 0
    local.get 2
    i32.store offset=8)
  (func $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12get_token_id17h8110bef35cbac080E (type 5) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 0
      i32.const 2
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
      return
    end
    i32.const 132063
    i32.const 16
    call $signalError
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$5clear17h816f6e1a80bff7a4E (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h9de743fff1b457ccE
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$5issue17h486fab84a065764cE (type 30) (param i32 i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper13check_not_set17h743a9fde09f89782E
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.load
        br_if 0 (;@2;)
        local.get 6
        local.get 0
        local.get 4
        call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$28default_callback_closure_obj17h8f4c8f3d3f4349b1E
        br 1 (;@1;)
      end
      local.get 6
      i32.const 8
      i32.add
      local.get 5
      i32.const 8
      i32.add
      i32.load
      i32.store
      local.get 6
      local.get 5
      i64.load align=4
      i64.store
    end
    local.get 6
    i64.const 72340168526332161
    i64.store offset=20 align=4
    local.get 6
    i32.const 0
    i32.store offset=16
    local.get 0
    i32.const 1
    local.get 6
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
    local.get 6
    i32.const 64
    i32.add
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 6
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc4esdt15system_sc_proxy38ESDTSystemSmartContractProxy$LT$SA$GT$14issue_fungible17h77e732bd02defb48E
    local.get 6
    i32.const 56
    i32.add
    local.get 6
    i32.const 8
    i32.add
    i32.load
    i32.store
    local.get 6
    local.get 6
    i64.load
    i64.store offset=48
    local.get 6
    local.get 6
    i64.load offset=76 align=4
    i64.store offset=40
    local.get 6
    local.get 6
    i32.load offset=88
    i32.store offset=36
    local.get 6
    local.get 6
    i32.load offset=72
    i32.store offset=32
    local.get 6
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$13call_and_exit17h2472bbcf2b3e8dbbE
    unreachable)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_mapping17hfaaed8249d7ebe81E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hb86693f2ec665886E)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_mapping17hfaaed8249d7ebe81E (type 5) (param i32 i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 132235
    i32.const 8
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d62025df94d87e4E
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E (type 5) (param i32 i32) (result i32)
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_mapping17hfaaed8249d7ebe81E
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i32.const 0
    i32.ne)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_attr_value17ha05544d098c5e26cE (type 26) (param i32 i32 i64) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 132222
    i32.const 5
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u8$GT$24dep_encode_or_handle_err17h0695f211263f8eb3E
    local.get 2
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17h6f8610d6b96877abE
    local.get 0)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u8$GT$24dep_encode_or_handle_err17h0695f211263f8eb3E (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store8 offset=15
    local.get 1
    local.get 2
    i32.const 15
    i32.add
    i32.const 1
    call $_ZN13multiversx_sc5types7managed10codec_util31managed_buffer_nested_en_output172_$LT$impl$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$5write17hb8eb2060dc4f7718E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17h6f8610d6b96877abE (type 29) (param i64 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i64.const 56
    i64.shl
    local.get 0
    i64.const 65280
    i64.and
    i64.const 40
    i64.shl
    i64.or
    local.get 0
    i64.const 16711680
    i64.and
    i64.const 24
    i64.shl
    local.get 0
    i64.const 4278190080
    i64.and
    i64.const 8
    i64.shl
    i64.or
    i64.or
    local.get 0
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 0
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 0
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 0
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    i64.store offset=8
    local.get 1
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    call $_ZN13multiversx_sc5types7managed10codec_util31managed_buffer_nested_en_output172_$LT$impl$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$5write17hb8eb2060dc4f7718E
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_counter17h7c65f14fbb83c6dfE (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 132227
    i32.const 8
    call $mBufferAppendBytes
    drop
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26get_token_attributes_value17h724467a1cba2c2b7E (type 33) (param i32 i32 i32 i64)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 1
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_attr_value17ha05544d098c5e26cE
    call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE
    local.get 4
    local.get 4
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$27read_managed_buffer_of_size17hb54e1755dce8da03E
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$20from_bytes_be_buffer17h7cff4839a171a78bE
    local.set 5
    local.get 4
    i64.const 0
    i64.store offset=24
    local.get 4
    local.get 4
    i32.const 24
    i32.add
    i32.const 8
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h8c0acebb347076f9E
    local.get 4
    i32.const 24
    i32.add
    i32.const 8
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 3
    local.get 4
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
    local.set 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 4
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        local.get 2
        i32.const -1
        i32.add
        local.set 2
        br 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 4
      i32.load offset=4
      local.get 4
      i32.load
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 4
        i32.const 16
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 5
      i32.store offset=8
      local.get 0
      local.get 3
      i64.store
      local.get 4
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h8c0acebb347076f9E (type 2) (param i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc5types7managed7wrapped24preloaded_managed_buffer31PreloadedManagedBuffer$LT$M$GT$10load_slice17h5ed0773220526e6eE
      i32.eqz
      br_if 0 (;@1;)
      call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9peek_into28_$u7b$$u7b$closure$u7d$$u7d$17h5737ba80cf0d371cE
      unreachable
    end
    local.get 0
    local.get 0
    i32.load
    local.get 2
    i32.add
    i32.store)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26has_token_attributes_value17h47f6e78dffc5fe10E (type 26) (param i32 i32 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31is_empty_token_attributes_value17h72ffcdaf28da131bE
    i32.const 1
    i32.xor)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31is_empty_token_attributes_value17h72ffcdaf28da131bE (type 26) (param i32 i32 i64) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_attr_value17ha05544d098c5e26cE
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i32.eqz)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26set_token_attributes_value17h0bf19cdc875039feE (type 22) (param i32 i32 i64 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_attr_value17ha05544d098c5e26cE
    local.set 1
    local.get 4
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 4
    local.get 4
    i32.load8_u offset=4
    i32.store8 offset=12
    local.get 4
    local.get 4
    i32.load
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.get 4
    i32.const 8
    i32.add
    call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
    local.get 3
    i64.load
    local.get 4
    i32.const 8
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17haf0e4ddeee76cd59E
    local.get 3
    i32.const 12
    i32.add
    local.get 4
    i32.const 8
    i32.add
    call $_ZN149_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d48d6aae08a804eE
    local.get 1
    local.get 4
    i32.load offset=8
    local.get 4
    i32.load8_u offset=12
    call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN149_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d48d6aae08a804eE (type 3) (param i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 3
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$3len17h44caac58d4f30d45E
    local.get 1
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E
    local.get 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.set 3
    local.get 2
    local.get 0
    i32.store offset=24
    local.get 2
    local.get 3
    i32.store offset=20
    local.get 2
    i32.const 0
    i32.store offset=16
    loop  ;; label = @1
      local.get 2
      i32.const 8
      i32.add
      local.get 2
      i32.const 16
      i32.add
      call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
      block  ;; label = @2
        local.get 2
        i32.load offset=8
        br_if 0 (;@2;)
        local.get 2
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 2
      i32.load offset=12
      local.get 1
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
      br 0 (;@1;)
    end)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31build_key_attr_to_nonce_mapping17ha72c60a9d5e5584aE (type 11) (param i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 0
    i32.const 132243
    i32.const 6
    call $mBufferAppendBytes
    drop
    local.get 1
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u8$GT$24dep_encode_or_handle_err17h0695f211263f8eb3E
    local.get 2
    i32.load offset=8
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E
    local.get 0
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d62025df94d87e4E
    local.get 2
    i64.load
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17h6f8610d6b96877abE
    local.get 2
    i32.load offset=12
    local.tee 1
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$3len17h44caac58d4f30d45E
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h70cc52a0636bead3E
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.set 1
    local.get 3
    local.get 2
    i32.const 12
    i32.add
    i32.store offset=24
    local.get 3
    local.get 1
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=16
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 8
        i32.add
        local.get 3
        i32.const 16
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 3
        i32.load offset=8
        i32.eqz
        br_if 1 (;@1;)
        local.get 3
        i32.load offset=12
        local.get 0
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hdd67cf2f68962d2dE
        br 0 (;@2;)
      end
    end
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31set_attributes_to_nonce_mapping17h6a8bd573bad1a718E (type 33) (param i32 i32 i32 i64)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31build_key_attr_to_nonce_mapping17ha72c60a9d5e5584aE
    local.get 3
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE)
  (func $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$33clear_attributes_to_nonce_mapping17he7d378473610a5ecE (type 2) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31build_key_attr_to_nonce_mapping17ha72c60a9d5e5584aE
    call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E)
  (func $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$10nft_create17h54d794faba160b53E (type 19) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 1
    local.get 2
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12get_token_id17h8110bef35cbac080E
    local.set 6
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
    local.set 7
    local.get 5
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 8
    i32.store offset=28
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 1
    local.get 6
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    local.get 1
    local.get 3
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hfddc284684a25f8fE
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    local.get 1
    local.get 7
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17hfddc284684a25f8fE
    local.get 1
    local.get 8
    call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 2
    local.get 4
    i32.load8_u
    local.get 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u8$GT$24dep_encode_or_handle_err17h0695f211263f8eb3E
    local.get 4
    i32.load8_u offset=1
    local.get 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u8$GT$24dep_encode_or_handle_err17h0695f211263f8eb3E
    local.get 4
    i32.load8_u offset=2
    local.get 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u8$GT$24dep_encode_or_handle_err17h0695f211263f8eb3E
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    block  ;; label = @1
      block  ;; label = @2
        local.get 8
        call $mBufferGetLength
        i32.eqz
        br_if 0 (;@2;)
        local.get 5
        local.get 8
        call $mBufferGetLength
        i32.store offset=36
        local.get 5
        i32.const 0
        i32.store offset=32
        local.get 5
        local.get 5
        i32.const 28
        i32.add
        i32.store offset=40
        loop  ;; label = @3
          local.get 5
          i32.const 16
          i32.add
          local.get 5
          i32.const 32
          i32.add
          call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
          local.get 5
          i32.load offset=16
          i32.eqz
          br_if 2 (;@1;)
          local.get 5
          i32.load offset=20
          local.set 2
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
          drop
          local.get 1
          local.get 2
          call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
          call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
          br 0 (;@3;)
        end
      end
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
      local.tee 2
      i32.const 133776
      i32.const 0
      call $mBufferSetBytes
      drop
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    end
    local.get 5
    i32.const 8
    i32.add
    call $getGasLeft
    i32.const 131300
    i32.const 13
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 1
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$33call_local_esdt_built_in_function17h092cfe1bb2ef03c7E
    i32.const 0
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$7try_get17h72d9f1c2392d0496E
    i64.const 0
    local.set 9
    block  ;; label = @1
      local.get 5
      i32.load offset=8
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=12
      local.tee 1
      call $mBufferGetLength
      local.tee 2
      i32.const 8
      i32.gt_u
      br_if 0 (;@1;)
      i64.const 0
      local.set 9
      local.get 5
      i64.const 0
      i64.store offset=32
      local.get 1
      i32.const 0
      local.get 5
      i32.const 32
      i32.add
      local.get 2
      i32.sub
      i32.const 8
      i32.add
      local.get 2
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
      br_if 0 (;@1;)
      local.get 5
      i64.load offset=32
      local.tee 9
      i64.const 56
      i64.shl
      local.get 9
      i64.const 65280
      i64.and
      i64.const 40
      i64.shl
      i64.or
      local.get 9
      i64.const 16711680
      i64.and
      i64.const 24
      i64.shl
      local.get 9
      i64.const 4278190080
      i64.and
      i64.const 8
      i64.shl
      i64.or
      i64.or
      local.get 9
      i64.const 8
      i64.shr_u
      i64.const 4278190080
      i64.and
      local.get 9
      i64.const 24
      i64.shr_u
      i64.const 16711680
      i64.and
      i64.or
      local.get 9
      i64.const 40
      i64.shr_u
      i64.const 65280
      i64.and
      local.get 9
      i64.const 56
      i64.shr_u
      i64.or
      i64.or
      i64.or
      local.set 9
    end
    local.get 0
    local.get 3
    i32.store offset=12
    local.get 0
    local.get 9
    i64.store
    local.get 0
    local.get 6
    i32.store offset=8
    local.get 5
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$12send_payment17h0f13ef3af5c23b07E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    i32.load offset=8
    local.get 1
    i64.load
    local.get 1
    i32.load offset=12
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$11direct_esdt17h0311394dfe63b205E)
  (func $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$16nft_add_quantity17h180892f51dfa2f45E (type 13) (param i32 i32 i32 i64 i32)
    local.get 1
    local.get 2
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12get_token_id17h8110bef35cbac080E
    local.tee 2
    local.get 3
    local.get 4
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$15esdt_local_mint17h6d2f871c4ea177e6E
    local.get 0
    local.get 4
    i32.store offset=12
    local.get 0
    local.get 3
    i64.store
    local.get 0
    local.get 2
    i32.store offset=8)
  (func $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$23issue_and_set_all_roles17ha298e6199f5b93deE (type 19) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 8
    i32.add
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h9de743fff1b457ccE
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 5
          i32.load offset=8
          br_table 2 (;@1;) 0 (;@3;) 1 (;@2;) 2 (;@1;)
        end
        i32.const 132039
        i32.const 24
        call $signalError
        unreachable
      end
      i32.const 132019
      i32.const 20
      call $signalError
      unreachable
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.load
        local.tee 6
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$10get_caller17hd6bfca50036c0966E
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.tee 7
        call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h47e31fb5e645d095E
        local.get 7
        local.get 0
        call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
        i32.const 132160
        local.set 6
        i32.const 16
        local.set 4
        br 1 (;@1;)
      end
      local.get 4
      i32.load offset=8
      local.set 7
      local.get 4
      i32.load offset=4
      local.set 4
    end
    local.get 0
    i32.const 1
    local.get 5
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
    local.get 5
    i32.const 48
    i32.add
    local.get 1
    local.get 2
    local.get 3
    i32.const 3
    call $_ZN13multiversx_sc4esdt15system_sc_proxy38ESDTSystemSmartContractProxy$LT$SA$GT$23issue_and_set_all_roles17hd45cbc9b55abb1b6E
    local.get 5
    i32.const 40
    i32.add
    local.get 7
    i32.store
    local.get 5
    i32.const 36
    i32.add
    local.get 4
    i32.store
    local.get 5
    local.get 6
    i32.store offset=32
    local.get 5
    local.get 5
    i64.load offset=60 align=4
    i64.store offset=24
    local.get 5
    local.get 5
    i32.load offset=72
    i32.store offset=20
    local.get 5
    local.get 5
    i32.load offset=56
    i32.store offset=16
    local.get 5
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc5types11interaction10async_call19AsyncCall$LT$SA$GT$13call_and_exit17h2472bbcf2b3e8dbbE
    unreachable)
  (func $_ZN13multiversx_sc8log_util23event_topic_accumulator17hcfa9d1ba707c7018E (type 5) (param i32 i32) (result i32)
    (local i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 2
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    local.get 2)
  (func $_ZN146_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageClearable$GT$5clear17h7533420ad96c9fe6E (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 24
    i32.add
    local.get 0
    i32.const 4
    i32.add
    local.tee 2
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 1
    local.get 1
    i64.load offset=24
    i64.store offset=48
    loop  ;; label = @1
      local.get 1
      i32.const 16
      i32.add
      local.get 1
      i32.const 48
      i32.add
      call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
      block  ;; label = @2
        local.get 1
        i32.load offset=16
        br_if 0 (;@2;)
        local.get 1
        i32.const 32
        i32.add
        local.get 2
        i32.load
        call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
        local.get 1
        i32.load offset=36
        local.set 0
        block  ;; label = @3
          loop  ;; label = @4
            local.get 0
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            i32.const 8
            i32.add
            local.get 2
            i32.load
            local.get 0
            call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_node17ha5b9e58885699a71E
            local.get 1
            i32.load offset=12
            local.set 3
            local.get 2
            i32.load
            local.get 0
            call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$10clear_node17h85f25e59675df613E
            local.get 2
            i32.load
            local.get 0
            call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$11clear_value17hdcc4a95241c535b5E
            local.get 3
            local.set 0
            br 0 (;@4;)
          end
        end
        local.get 1
        i32.const 56
        i32.add
        i64.const 0
        i64.store
        local.get 1
        i64.const 0
        i64.store offset=48
        local.get 2
        i32.load
        local.get 1
        i32.const 48
        i32.add
        call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
        local.get 1
        i32.const 64
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 0
      i32.load
      local.get 1
      i32.load offset=20
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$13clear_node_id17h975595fd4690aa62E
      br 0 (;@1;)
    end)
  (func $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de..NestedDecode$GT$24dep_decode_or_handle_err17h0a916b4c9325dd9eE (type 6) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$usize$GT$24dep_decode_or_handle_err17hcec92b37a17bac60E
    local.set 2
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load
    local.tee 3
    local.get 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10copy_slice17hda333ad172527088E
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.const 1
      i32.eq
      br_if 0 (;@1;)
      i32.const 131220
      i32.const 25
      i32.const 131784
      i32.const 15
      call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
      unreachable
    end
    local.get 1
    i32.load offset=12
    local.set 4
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$usize$GT$24dep_decode_or_handle_err17hcec92b37a17bac60E (type 6) (param i32) (result i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.const 12
    i32.add
    i32.const 4
    i32.const 131220
    i32.const 25
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h1eab4bf15ca8bfc2E
    local.get 1
    i32.const 12
    i32.add
    i32.const 4
    i32.const 0
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    local.set 2
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.wrap_i64)
  (func $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$16push_specialized17h200a00375dde9872E (type 3) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.load8_u offset=4
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
          local.set 3
          i32.const 10000
          i32.const 0
          i32.load offset=143876
          local.tee 4
          i32.sub
          local.get 3
          i32.lt_u
          br_if 1 (;@2;)
          local.get 2
          i32.const 8
          i32.add
          local.get 4
          local.get 4
          local.get 3
          i32.add
          local.tee 0
          call $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h249e2d44497ee715E
          local.get 1
          i32.const 0
          local.get 2
          i32.load offset=8
          local.get 2
          i32.load offset=12
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10load_slice17hbf842605b52a58bfE
          drop
          i32.const 0
          local.get 0
          i32.store offset=143876
          br 2 (;@1;)
        end
        local.get 0
        i32.load
        local.get 1
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$6append17h1fadaad7ded68adcE
        br 1 (;@1;)
      end
      local.get 0
      call $_ZN13multiversx_sc5types7managed7wrapped29managed_buffer_cached_builder35ManagedBufferCachedBuilder$LT$M$GT$23flush_to_managed_buffer17hebc9a18647d7e80dE
      local.get 0
      i32.load
      local.get 1
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$6append17h1fadaad7ded68adcE
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN150_$LT$multiversx_sc..storage..mappers..map_mapper..MapMapper$LT$SA$C$K$C$V$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageClearable$GT$5clear17h020950ea0eca9897E (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 16
    i32.add
    local.get 0
    i32.const 4
    i32.add
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 1
    local.get 1
    i64.load offset=16
    i64.store offset=24
    local.get 0
    i32.const 8
    i32.add
    local.set 2
    loop  ;; label = @1
      local.get 1
      i32.const 8
      i32.add
      local.get 1
      i32.const 24
      i32.add
      call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
      block  ;; label = @2
        local.get 1
        i32.load offset=8
        br_if 0 (;@2;)
        local.get 0
        call $_ZN146_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageClearable$GT$5clear17h7533420ad96c9fe6E
        local.get 1
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 2
      i32.load
      local.get 1
      i32.load offset=12
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$18clear_mapped_value17h79c77a5cea91deddE
      br 0 (;@1;)
    end)
  (func $_ZN153_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17h123fe8b523d03a5bE (type 3) (param i32 i32)
    (local i32)
    local.get 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_ZN179_$LT$multiversx_sc..types..managed..multi_value..multi_value_managed_vec..MultiValueManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17hb44aa107f8425fc0E (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3len17h528bd94fcf1ec36bE
    local.set 2
    local.get 1
    local.get 0
    i32.store offset=24
    local.get 1
    local.get 2
    i32.store offset=20
    local.get 1
    i32.const 0
    i32.store offset=16
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        i32.const 8
        i32.add
        local.get 1
        i32.const 16
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 1
        i32.load offset=8
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        i32.load offset=12
        i64.extend_i32_u
        call $smallIntFinishUnsigned
        br 0 (;@2;)
      end
    end
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core5array88_$LT$impl$u20$core..ops..index..IndexMut$LT$I$GT$$u20$for$u20$$u5b$T$u3b$$u20$N$u5d$$GT$9index_mut17h249e2d44497ee715E (type 2) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    local.get 2
    i32.const 133876
    i32.const 10000
    call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h749f83e2af55068fE
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 3
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12set_token_id17h312c53b1a2101da0E (type 3) (param i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.const 4
        i32.add
        i32.load
        call $_ZN124_$LT$multiversx_sc..storage..mappers..token..token_mapper_state..TokenMapperState$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h1bc1edb4a433f0ddE
        i32.const 2
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        call $_ZN13multiversx_sc5types7managed7wrapped16token_identifier24TokenIdentifier$LT$M$GT$24is_valid_esdt_identifier17hddb8bf3558d37511E
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=8
        i32.const 2
        local.get 1
        call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
        call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
        local.get 0
        i32.const 4
        i32.add
        local.get 1
        i32.store
        local.get 0
        i32.const 2
        i32.store
        return
      end
      i32.const 132019
      i32.const 20
      call $signalError
      unreachable
    end
    i32.const 132063
    i32.const 16
    call $signalError
    unreachable)
  (func $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9peek_into28_$u7b$$u7b$closure$u7d$$u7d$17h0ff6e5dd3ee69bdfE (type 3) (param i32 i32)
    local.get 0
    local.get 1
    i32.const 131784
    i32.const 15
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9peek_into28_$u7b$$u7b$closure$u7d$$u7d$17h5737ba80cf0d371cE (type 10)
    i32.const 131784
    i32.const 15
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9peek_into28_$u7b$$u7b$closure$u7d$$u7d$17hd5c9441a24ef5fa6E (type 3) (param i32 i32)
    local.get 0
    local.get 1
    i32.const 131784
    i32.const 15
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h1eab4bf15ca8bfc2E (type 19) (param i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.const 8
      i32.add
      local.get 0
      i32.load
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc5types7managed7wrapped24preloaded_managed_buffer31PreloadedManagedBuffer$LT$M$GT$10load_slice17h5ed0773220526e6eE
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 4
      call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9peek_into28_$u7b$$u7b$closure$u7d$$u7d$17hd5c9441a24ef5fa6E
      unreachable
    end
    local.get 0
    local.get 0
    i32.load
    local.get 2
    i32.add
    i32.store)
  (func $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u8$GT$24dep_decode_or_handle_err17h6c68fd250646181aE (type 6) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store8 offset=15
    local.get 0
    local.get 1
    i32.const 15
    i32.add
    i32.const 1
    i32.const 131861
    i32.const 32
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h1eab4bf15ca8bfc2E
    local.get 1
    i32.load8_u offset=15
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN19multiversx_sc_codec5multi12top_en_multi31multi_encode_iter_or_handle_err17h58dbdf45f9b1b4faE (type 3) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=8
    loop  ;; label = @1
      local.get 2
      local.get 2
      i32.const 8
      i32.add
      call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
      block  ;; label = @2
        local.get 2
        i32.load
        br_if 0 (;@2;)
        local.get 2
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 2
      i32.load offset=4
      i64.extend_i32_u
      call $smallIntFinishUnsigned
      br 0 (;@1;)
    end)
  (func $_ZN19multiversx_sc_codec8num_conv17top_encode_number17h8b96cc408e6940ecE (type 34) (param i32 i64 i32 i32)
    (local i64 i32 i32 i32 i32)
    local.get 3
    local.get 1
    i64.const 56
    i64.shl
    local.get 1
    i64.const 65280
    i64.and
    i64.const 40
    i64.shl
    i64.or
    local.get 1
    i64.const 16711680
    i64.and
    i64.const 24
    i64.shl
    local.get 1
    i64.const 4278190080
    i64.and
    i64.const 8
    i64.shl
    i64.or
    i64.or
    local.get 1
    i64.const 8
    i64.shr_u
    i64.const 4278190080
    i64.and
    local.get 1
    i64.const 24
    i64.shr_u
    i64.const 16711680
    i64.and
    i64.or
    local.get 1
    i64.const 40
    i64.shr_u
    i64.const 65280
    i64.and
    local.get 1
    i64.const 56
    i64.shr_u
    i64.or
    i64.or
    i64.or
    local.tee 4
    i64.store align=1
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i64.eqz
        i32.eqz
        br_if 0 (;@2;)
        i32.const 133776
        local.set 5
        i32.const 0
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i64.const -1
            i64.ne
            br_if 0 (;@4;)
            local.get 2
            br_if 1 (;@3;)
          end
          i32.const 0
          local.set 5
          i32.const 0
          local.get 4
          i32.wrap_i64
          i32.const 7
          i32.shr_u
          local.get 2
          i32.and
          local.tee 6
          i32.sub
          i32.const 255
          i32.and
          local.set 7
          br 1 (;@2;)
        end
        local.get 3
        i32.const 7
        i32.add
        local.set 5
        i32.const 1
        local.set 3
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          loop  ;; label = @4
            local.get 5
            i32.const 8
            i32.eq
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 3
              local.get 5
              i32.add
              i32.load8_u
              local.tee 8
              local.get 7
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              i32.const 1
              i32.add
              local.set 5
              br 1 (;@4;)
            end
          end
          local.get 5
          local.get 8
          i32.const 7
          i32.shr_u
          local.get 6
          i32.ne
          local.get 2
          i32.and
          local.tee 7
          i32.sub
          local.tee 8
          i32.const 9
          i32.ge_u
          br_if 1 (;@2;)
          i32.const 0
          local.get 7
          i32.sub
          local.get 5
          i32.add
          local.tee 7
          local.get 3
          i32.add
          local.set 5
          i32.const 8
          local.get 7
          i32.sub
          local.set 3
          br 2 (;@1;)
        end
        i32.const 8
        i32.const 8
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17len_mismatch_fail17he5e0d98fe848cfe0E
        unreachable
      end
      local.get 8
      call $_ZN4core5slice5index26slice_start_index_len_fail17hf0083ebddc6be988E
      unreachable
    end
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 5
    i32.store)
  (func $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h0ab872217a9bb32eE (type 6) (param i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store8 offset=15
    local.get 0
    local.get 1
    i32.const 15
    i32.add
    i32.const 1
    call $_ZN198_$LT$multiversx_sc..types..managed..codec_util..managed_buffer_nested_de_input..ManagedBufferNestedDecodeInput$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de_input..NestedDecodeInput$GT$9read_into17h8c0acebb347076f9E
    local.get 1
    i32.load8_u offset=15
    local.set 0
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN21multiversx_sc_modules23default_issue_callbacks16EndpointWrappers17callback_selector17hc9011f4612dec156E (type 2) (param i32 i32 i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types11interaction16callback_closure32CallbackClosureForDeser$LT$M$GT$7matcher17h575e96b74ad96fe9E
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        i32.load offset=40
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 8
            i32.add
            i32.const 132160
            i32.const 16
            call $_ZN13multiversx_sc5types11interaction16callback_closure31CallbackClosureMatcher$LT$_$GT$12name_matches17h16dca0204b5d2ecaE
            br_if 0 (;@4;)
            local.get 3
            i32.const 8
            i32.add
            i32.const 132132
            i32.const 28
            call $_ZN13multiversx_sc5types11interaction16callback_closure31CallbackClosureMatcher$LT$_$GT$12name_matches17h16dca0204b5d2ecaE
            br_if 1 (;@3;)
            local.get 0
            local.get 1
            i32.store offset=4
            local.get 0
            i32.const 1
            i32.store
            local.get 0
            i32.const 8
            i32.add
            local.get 2
            i32.store
            br 3 (;@1;)
          end
          call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
          i32.const 0
          call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
          local.get 3
          i32.const 0
          i32.store offset=48
          local.get 3
          i32.const 64
          i32.add
          local.get 3
          i32.const 48
          i32.add
          call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h4526c6edd7c81527E
          local.get 3
          i32.load offset=48
          call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
          local.get 3
          i32.load offset=64
          local.set 1
          local.get 3
          i32.load offset=68
          local.set 4
          local.get 3
          i32.const 48
          i32.add
          local.get 2
          call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
          call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
          local.get 3
          i32.const 48
          i32.add
          call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hd1d4754dbaacf90fE
          local.set 5
          local.get 3
          i32.const 64
          i32.add
          i32.const 8
          i32.add
          local.tee 2
          local.get 3
          i32.const 48
          i32.add
          i32.const 8
          i32.add
          i32.load
          i32.store
          local.get 3
          local.get 3
          i64.load offset=48
          i64.store offset=64
          local.get 3
          i32.const 64
          i32.add
          call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hda7d99d60bad8f97E
          local.set 6
          local.get 3
          i32.load offset=68
          local.get 2
          i32.load
          call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h576ea351e7d6f4f8E
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            local.get 6
            i32.const 2
            local.get 4
            call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
            br 2 (;@2;)
          end
          local.get 5
          call $_ZN21multiversx_sc_modules23default_issue_callbacks27DefaultIssueCallbacksModule25return_failed_issue_funds17hbfea7b0c7fac2e53E
          local.get 6
          call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E
          br 1 (;@2;)
        end
        call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
        i32.const 0
        call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
        local.get 3
        i32.const 0
        i32.store offset=48
        local.get 3
        i32.const 64
        i32.add
        local.get 3
        i32.const 48
        i32.add
        i32.const 132951
        i32.const 6
        call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h55bb0e59e98ef0eeE
        local.get 3
        i32.load offset=48
        call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
        local.get 3
        i32.load offset=64
        local.set 1
        local.get 3
        i32.const 48
        i32.add
        local.get 2
        call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
        call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
        local.get 3
        i32.const 48
        i32.add
        call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hd1d4754dbaacf90fE
        local.set 5
        local.get 3
        i32.const 64
        i32.add
        i32.const 8
        i32.add
        local.tee 2
        local.get 3
        i32.const 48
        i32.add
        i32.const 8
        i32.add
        i32.load
        i32.store
        local.get 3
        local.get 3
        i64.load offset=48
        i64.store offset=64
        local.get 3
        i32.const 64
        i32.add
        call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hda7d99d60bad8f97E
        local.set 6
        local.get 3
        i32.load offset=68
        local.get 2
        i32.load
        call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h576ea351e7d6f4f8E
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 3
          i32.const 64
          i32.add
          call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$11single_esdt17h61d1bb6da76ff2a0E
          local.get 6
          i32.const 2
          local.get 3
          i32.load offset=72
          call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
          br 1 (;@2;)
        end
        local.get 5
        call $_ZN21multiversx_sc_modules23default_issue_callbacks27DefaultIssueCallbacksModule25return_failed_issue_funds17hbfea7b0c7fac2e53E
        local.get 6
        call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E
      end
      local.get 0
      i32.const 0
      i32.store
    end
    local.get 3
    i32.const 80
    i32.add
    global.set $__stack_pointer)
  (func $_ZN21multiversx_sc_modules23default_issue_callbacks27DefaultIssueCallbacksModule25return_failed_issue_funds17hbfea7b0c7fac2e53E (type 0) (param i32)
    (local i32)
    block  ;; label = @1
      call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$10egld_value17h96645c8318260081E
      local.tee 1
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$7bi_sign17h13575f02ac73399cE
      i32.const 255
      i32.and
      i32.const 2
      i32.ne
      br_if 0 (;@1;)
      i32.const -25
      i32.const 133776
      i32.const 0
      call $mBufferSetBytes
      drop
      local.get 0
      local.get 1
      i64.const 0
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
      i32.const -25
      call $managedTransferValueExecute
      drop
    end)
  (func $_ZN241_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi_output..TopEncodeMultiOutput$GT$17push_single_value17h593676c36aba78cfE (type 3) (param i32 i32)
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 0
    local.get 1
    call $_ZN129_$LT$basic_features..types..codec_err_test_type..CodecErrorTestType$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h18d78dc9048fea70E
    unreachable)
  (func $_ZN26multiversx_sc_wasm_adapter3api19blockchain_api_node139_$LT$impl$u20$multiversx_sc..api..blockchain_api..BlockchainApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$17is_smart_contract17hcbe45051a717253aE (type 6) (param i32) (result i32)
    local.get 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node26unsafe_buffer_load_address17hf4a797f35e9550ebE
    i32.const 143888
    call $isSmartContract
    i32.const 0
    i32.gt_s)
  (func $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2ne17h54a502195d29870dE (type 5) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    i32.load
    call $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E
    i32.const 1
    i32.xor)
  (func $_ZN4core9panicking5panic17h6b6c6cd2a60c4adfE (type 10)
    call $_ZN4core9panicking9panic_fmt17h47d05d49c60428e4E
    unreachable)
  (func $_ZN4core6result13unwrap_failed17h4407f62b32d5ff84E (type 0) (param i32)
    call $_ZN4core9panicking9panic_fmt17h47d05d49c60428e4E
    unreachable)
  (func $_ZN67_$LT$C$u20$as$u20$basic_features..event_features..EventFeatures$GT$7event_a17h9702129cc67526ceE (type 0) (param i32)
    (local i32 i32)
    i32.const 133085
    i32.const 7
    call $_ZN13multiversx_sc8log_util23event_topic_accumulator17hcfa9d1ba707c7018E
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.tee 2
    local.get 0
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hfa3da52b93bb8b38E
    local.get 1
    local.get 2
    call $managedWriteLog)
  (func $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE (type 0) (param i32)
    local.get 0
    i32.const 133184
    i32.const 10
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN157_$LT$multiversx_sc..storage..mappers..map_mapper..MapMapper$LT$SA$C$K$C$V$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17hf3732ec6cda8c889E)
  (func $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_set..SetMapperFeatures$GT$10set_mapper17h24b9928a871b4adaE (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    i32.const 133194
    i32.const 10
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN153_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17h123fe8b523d03a5bE
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.load offset=8
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E (type 0) (param i32)
    (local i32 i32)
    i32.const 133204
    i32.const 10
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 2
    i32.const 132002
    i32.const 4
    call $mBufferAppendBytes
    drop
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_de_multi..TopDecodeMulti$GT$26multi_decode_or_handle_err17h4999e8b802f6e50aE (type 6) (param i32) (result i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.const 133010
    i32.const 8
    call $_ZN165_$LT$multiversx_sc..io..managed_result_arg_loader..ManagedResultArgLoader$LT$A$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h8169e17663e95d18E
    local.set 0
    local.get 1
    i64.const 0
    i64.store offset=8
    local.get 1
    local.get 0
    local.get 1
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc5types7managed10codec_util27managed_buffer_top_de_input164_$LT$impl$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$20into_max_size_buffer17hb636494537abd78fE
    block  ;; label = @1
      local.get 1
      i32.load
      local.get 1
      i32.load offset=4
      i32.const 0
      call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
      local.tee 2
      i64.const 4294967296
      i64.lt_u
      br_if 0 (;@1;)
      i32.const 133010
      i32.const 8
      i32.const 131109
      i32.const 14
      call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
      unreachable
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2
    i32.wrap_i64)
  (func $_ZN79_$LT$C$u20$as$u20$basic_features..storage_mapper_queue..QueueMapperFeatures$GT$12queue_mapper17hdb5ebea532fe359cE (type 4) (result i32)
    i32.const 133285
    i32.const 12
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E)
  (func $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE (type 4) (result i32)
    i32.const 133336
    i32.const 22
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E)
  (func $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE (type 4) (result i32)
    i32.const 133358
    i32.const 11
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E)
  (func $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE (type 0) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 133369
    i32.const 18
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 3
    local.get 1
    i32.const 8
    i32.add
    local.get 2
    call $_ZN153_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageMapper$LT$SA$GT$$GT$3new17h123fe8b523d03a5bE
    local.get 0
    local.get 1
    i64.load offset=8
    i64.store align=4
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN93_$LT$C$u20$as$u20$basic_features..storage_mapper_unique_id_mapper..UniqueIdMapperFeatures$GT$16unique_id_mapper17h1518d81790d7a134E (type 0) (param i32)
    (local i32 i32 i32)
    i32.const 133387
    i32.const 16
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 2
    local.get 1
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.tee 3
    i32.const 132002
    i32.const 4
    call $mBufferAppendBytes
    drop
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=8)
  (func $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE (type 4) (result i32)
    i32.const 133403
    i32.const 15
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E)
  (func $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E (type 0) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 8
    i32.add
    i32.const 133418
    i32.const 19
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h9de743fff1b457ccE
    local.get 0
    local.get 1
    i64.load offset=8
    i64.store align=4
    local.get 0
    local.get 2
    i32.store offset=8
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $rust_begin_unwind (type 10)
    call $_ZN26multiversx_sc_wasm_adapter5panic9panic_fmt17h7fd000f5b8b7872dE
    unreachable)
  (func $_ZN26multiversx_sc_wasm_adapter5panic9panic_fmt17h7fd000f5b8b7872dE (type 10)
    i32.const 133776
    i32.const 14
    call $signalError
    unreachable)
  (func $init (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E)
  (func $panicWithMessage (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN4core9panicking9panic_fmt17h47d05d49c60428e4E
    unreachable)
  (func $_ZN4core9panicking9panic_fmt17h47d05d49c60428e4E (type 10)
    call $rust_begin_unwind
    unreachable)
  (func $count_ones (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    i64.popcnt
    call $smallIntFinishUnsigned)
  (func $endpoint_with_mutable_arg (type 10)
    (local i32 i64 i32)
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 1
    i32.const 2
    i32.const 132550
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const -14
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9set_value17h8e043dcc138efba4E
    local.get 0
    local.get 0
    i32.const -14
    call $bigIntAdd
    local.get 0
    local.get 0
    local.get 2
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9make_temp17hdce4b600b1e7c34dE
    call $bigIntAdd
    local.get 0
    call $bigIntFinishUnsigned)
  (func $sqrt_big_uint (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4sqrt17ha2c170221850f6daE
    call $bigIntFinishUnsigned)
  (func $log2_big_uint (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntLog2
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $pow_big_int (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$3pow17h9218ad83017013c6E
    call $bigIntFinishSigned)
  (func $pow_big_uint (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN13multiversx_sc5types7managed5basic7big_int15BigInt$LT$M$GT$3pow17h9218ad83017013c6E
    call $bigIntFinishUnsigned)
  (func $big_uint_to_u64 (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$9bi_to_i6417h42f10907feb11b50E
    block  ;; label = @1
      local.get 0
      i64.load
      i32.wrap_i64
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i64.load offset=8
      call $smallIntFinishUnsigned
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$9bi_to_i6417h42f10907feb11b50E (type 3) (param i32 i32)
    (local i64 i64)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        call $bigIntIsInt64
        i32.const 1
        i32.ge_s
        br_if 0 (;@2;)
        i64.const 0
        local.set 2
        br 1 (;@1;)
      end
      i64.const 1
      local.set 2
      local.get 1
      call $bigIntGetInt64
      local.set 3
    end
    local.get 0
    local.get 3
    i64.store offset=8
    local.get 0
    local.get 2
    i64.store)
  (func $biguint_overwrite_u64 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9set_value17h8e043dcc138efba4E
    local.get 0
    call $bigIntFinishUnsigned)
  (func $big_uint_zero (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
    call $bigIntFinishUnsigned)
  (func $big_uint_from_u64_1 (type 10)
    (local i64 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$9set_value17h8e043dcc138efba4E
    local.get 1
    call $bigIntFinishUnsigned)
  (func $biguint_from_u128 (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i64.const -1
    i64.store offset=8
    local.get 0
    i64.const -1
    i64.store
    i32.const -25
    local.get 0
    i32.const 16
    call $mBufferSetBytes
    drop
    i32.const -25
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    call $mBufferToBigIntUnsigned
    drop
    local.get 1
    call $bigIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $big_uint_from_managed_buffer (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$20from_bytes_be_buffer17h7cff4839a171a78bE
    call $bigIntFinishUnsigned)
  (func $big_int_zero (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    i64.const 0
    call $bigIntSetInt64
    local.get 0
    call $bigIntFinishSigned)
  (func $big_int_from_i64_1 (type 10)
    (local i64 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcd0355bb3829d176E
    local.set 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    local.get 0
    call $bigIntSetInt64
    local.get 1
    call $bigIntFinishSigned)
  (func $big_uint_eq_u64 (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    call $_ZN13multiversx_sc5types7managed5basic11cast_to_i6411cast_to_i6417h3f74e676decaadcfE
    call $_ZN13multiversx_sc5types7managed5basic11big_num_cmp7cmp_i6417hc1f887b18de47759E
    i32.const 255
    i32.and
    i32.eqz
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $big_int_to_i64 (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$9bi_to_i6417h42f10907feb11b50E
    block  ;; label = @1
      local.get 0
      i64.load
      i32.wrap_i64
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i64.load offset=8
      call $smallIntFinishSigned
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $bigint_overwrite_i64 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.tee 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcd0355bb3829d176E
    call $bigIntSetInt64
    local.get 0
    call $bigIntFinishSigned)
  (func $big_int_to_parts (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.tee 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$7bi_sign17h13575f02ac73399cE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    call $bigIntAbs
    local.get 1
    i64.extend_i32_u
    i64.const 255
    i64.and
    i64.const -1
    i64.add
    call $smallIntFinishSigned
    local.get 2
    call $bigIntFinishUnsigned)
  (func $big_int_from_biguint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9fc43ecad140aab8E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.const 255
      i32.and
      br_if 0 (;@1;)
      local.get 1
      local.get 1
      call $bigIntNeg
    end
    local.get 1
    call $bigIntFinishSigned)
  (func $add_big_int (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators114_$LT$impl$u20$core..ops..arith..Add$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17hcf7081b25b87fea7E
    call $bigIntFinishSigned)
  (func $add_big_int_big_uint (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators114_$LT$impl$u20$core..ops..arith..Add$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17hcf7081b25b87fea7E
    call $bigIntFinishSigned)
  (func $add_big_uint_big_int (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators114_$LT$impl$u20$core..ops..arith..Add$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17hcf7081b25b87fea7E
    call $bigIntFinishSigned)
  (func $add_big_int_big_uint_ref (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators192_$LT$impl$u20$core..ops..arith..Add$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17h61e1e6f40900f842E
    call $bigIntFinishSigned)
  (func $add_big_uint_big_int_ref (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators192_$LT$impl$u20$core..ops..arith..Add$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17h61e1e6f40900f842E
    call $bigIntFinishSigned)
  (func $add_big_int_ref (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators192_$LT$impl$u20$core..ops..arith..Add$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17h61e1e6f40900f842E
    call $bigIntFinishSigned)
  (func $add_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntAdd
    local.get 0
    call $bigIntFinishUnsigned)
  (func $add_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntAdd
    local.get 2
    call $bigIntFinishUnsigned)
  (func $sub_big_int (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $bigIntSub
    local.get 0
    call $bigIntFinishSigned)
  (func $sub_big_int_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntSub
    local.get 2
    call $bigIntFinishSigned)
  (func $sub_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc3api13managed_types11big_int_api13BigIntApiImpl15bi_sub_unsigned17h0c7cb5fdc5f347b4E
    local.get 0
    call $bigIntFinishUnsigned)
  (func $sub_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc3api13managed_types11big_int_api13BigIntApiImpl15bi_sub_unsigned17h0c7cb5fdc5f347b4E
    local.get 2
    call $bigIntFinishUnsigned)
  (func $mul_big_int (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $bigIntMul
    local.get 0
    call $bigIntFinishSigned)
  (func $mul_big_int_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntMul
    local.get 2
    call $bigIntFinishSigned)
  (func $mul_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntMul
    local.get 0
    call $bigIntFinishUnsigned)
  (func $mul_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntMul
    local.get 2
    call $bigIntFinishUnsigned)
  (func $div_big_int (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $bigIntTDiv
    local.get 0
    call $bigIntFinishSigned)
  (func $div_big_int_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntTDiv
    local.get 2
    call $bigIntFinishSigned)
  (func $div_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntTDiv
    local.get 0
    call $bigIntFinishUnsigned)
  (func $div_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntTDiv
    local.get 2
    call $bigIntFinishUnsigned)
  (func $rem_big_int (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $bigIntTMod
    local.get 0
    call $bigIntFinishSigned)
  (func $rem_big_int_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntTMod
    local.get 2
    call $bigIntFinishSigned)
  (func $rem_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntTMod
    local.get 0
    call $bigIntFinishUnsigned)
  (func $rem_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntTMod
    local.get 2
    call $bigIntFinishUnsigned)
  (func $add_assign_big_int (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntAdd
    local.get 0
    call $bigIntFinishSigned)
  (func $add_assign_big_int_ref (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators194_$LT$impl$u20$core..ops..arith..AddAssign$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$10add_assign17h109fbe5240173903E
    local.get 0
    call $bigIntFinishSigned)
  (func $add_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntAdd
    local.get 0
    call $bigIntFinishUnsigned)
  (func $sub_assign_big_int (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntSub
    local.get 0
    call $bigIntFinishSigned)
  (func $sub_assign_big_int_ref (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators194_$LT$impl$u20$core..ops..arith..SubAssign$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$10sub_assign17h644c256208b47b5eE
    local.get 0
    call $bigIntFinishSigned)
  (func $sub_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc3api13managed_types11big_int_api13BigIntApiImpl15bi_sub_unsigned17h0c7cb5fdc5f347b4E
    local.get 0
    call $bigIntFinishUnsigned)
  (func $mul_assign_big_int (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntMul
    local.get 0
    call $bigIntFinishSigned)
  (func $mul_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntMul
    local.get 0
    call $bigIntFinishUnsigned)
  (func $div_assign_big_int (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntTDiv
    local.get 0
    call $bigIntFinishSigned)
  (func $div_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntTDiv
    local.get 0
    call $bigIntFinishUnsigned)
  (func $rem_assign_big_int (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntTMod
    local.get 0
    call $bigIntFinishSigned)
  (func $rem_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntTMod
    local.get 0
    call $bigIntFinishUnsigned)
  (func $bit_and_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntAnd
    local.get 0
    call $bigIntFinishUnsigned)
  (func $bit_and_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntAnd
    local.get 2
    call $bigIntFinishUnsigned)
  (func $bit_or_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntOr
    local.get 0
    call $bigIntFinishUnsigned)
  (func $bit_or_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntOr
    local.get 2
    call $bigIntFinishUnsigned)
  (func $bit_xor_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntXor
    local.get 0
    call $bigIntFinishUnsigned)
  (func $bit_xor_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntXor
    local.get 2
    call $bigIntFinishUnsigned)
  (func $bit_and_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntAnd
    local.get 0
    call $bigIntFinishUnsigned)
  (func $bit_or_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntOr
    local.get 0
    call $bigIntFinishUnsigned)
  (func $bit_xor_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 0
    local.get 1
    call $bigIntXor
    local.get 0
    call $bigIntFinishUnsigned)
  (func $shr_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $bigIntShr
    local.get 0
    call $bigIntFinishUnsigned)
  (func $shr_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntShr
    local.get 2
    call $bigIntFinishUnsigned)
  (func $shl_big_uint (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 0
    local.get 0
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $bigIntShl
    local.get 0
    call $bigIntFinishUnsigned)
  (func $shl_big_uint_ref (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 2
    local.get 0
    local.get 1
    call $bigIntShl
    local.get 2
    call $bigIntFinishUnsigned)
  (func $shr_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic18big_uint_operators133_$LT$impl$u20$core..ops..bit..ShrAssign$LT$usize$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$10shr_assign17h3238fb0d06e183b8E
    local.get 0
    call $bigIntFinishUnsigned)
  (func $shl_assign_big_uint (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 0
    i32.const 1
    i32.const 132502
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    local.tee 0
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic18big_uint_operators133_$LT$impl$u20$core..ops..bit..ShlAssign$LT$usize$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$10shl_assign17h860a5ed45a2722e5E
    local.get 0
    call $bigIntFinishUnsigned)
  (func $get_block_timestamp (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getBlockTimestamp
    call $smallIntFinishUnsigned)
  (func $get_block_nonce (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getBlockNonce
    call $smallIntFinishUnsigned)
  (func $get_block_round (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getBlockRound
    call $smallIntFinishUnsigned)
  (func $get_block_epoch (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getBlockEpoch
    call $smallIntFinishUnsigned)
  (func $get_block_random_seed (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedGetBlockRandomSeed
    local.get 0
    call $mBufferFinish
    drop)
  (func $get_prev_block_timestamp (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getPrevBlockTimestamp
    call $smallIntFinishUnsigned)
  (func $get_prev_block_nonce (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getPrevBlockNonce
    call $smallIntFinishUnsigned)
  (func $get_prev_block_round (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getPrevBlockRound
    call $smallIntFinishUnsigned)
  (func $get_prev_block_epoch (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getPrevBlockEpoch
    call $smallIntFinishUnsigned)
  (func $get_prev_block_random_seed (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedGetPrevBlockRandomSeed
    local.get 0
    call $mBufferFinish
    drop)
  (func $get_caller (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$10get_caller17hd6bfca50036c0966E
    call $mBufferFinish
    drop)
  (func $get_owner_address (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$17get_owner_address17h2bb02a5145214c17E
    call $mBufferFinish
    drop)
  (func $get_shard_of_address (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node26unsafe_buffer_load_address17hf4a797f35e9550ebE
    i32.const 143888
    call $getShardOfAddress
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $is_smart_contract (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    call $_ZN26multiversx_sc_wasm_adapter3api19blockchain_api_node139_$LT$impl$u20$multiversx_sc..api..blockchain_api..BlockchainApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$17is_smart_contract17hcbe45051a717253aE
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $get_state_root_hash (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedGetStateRootHash
    local.get 0
    call $mBufferFinish
    drop)
  (func $get_tx_hash (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$11get_tx_hash17he6041bc1912ff91bE
    call $mBufferFinish
    drop)
  (func $get_gas_left (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $getGasLeft
    call $smallIntFinishUnsigned)
  (func $get_cumulated_validator_rewards (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const -25
    i32.const 133615
    i32.const 12
    call $mBufferSetBytes
    drop
    i32.const -25
    i32.const -26
    call $mBufferStorageLoad
    drop
    i32.const -26
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $mBufferToBigIntUnsigned
    drop
    local.get 0
    call $bigIntFinishUnsigned)
  (func $codec_err_finish (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io6finish12finish_multi17h3c00942bcaedb188E
    unreachable)
  (func $codec_err_storage_key (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133128
    i32.const 17
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    drop
    i32.const 131897
    i32.const 26
    i32.const 131190
    i32.const 30
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $codec_err_storage_get (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133145
    i32.const 19
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    drop
    i32.const 131136
    i32.const 27
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $codec_err_storage_set (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133164
    i32.const 20
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    drop
    i32.const 131923
    i32.const 22
    i32.const 131163
    i32.const 27
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $codec_err_event_topic (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133113
    i32.const 15
    call $_ZN13multiversx_sc8log_util23event_topic_accumulator17hcfa9d1ba707c7018E
    drop
    i32.const 132382
    i32.const 24
    call $_ZN241_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi_output..TopEncodeMultiOutput$GT$17push_single_value17h593676c36aba78cfE
    unreachable)
  (func $codec_err_event_data (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133099
    i32.const 14
    call $_ZN13multiversx_sc8log_util23event_topic_accumulator17hcfa9d1ba707c7018E
    drop
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    i32.const 132359
    i32.const 23
    call $_ZN129_$LT$basic_features..types..codec_err_test_type..CodecErrorTestType$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h18d78dc9048fea70E
    unreachable)
  (func $codec_err_contract_init (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
    drop
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    i32.const 131746
    i32.const 28
    call $_ZN241_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi_output..TopEncodeMultiOutput$GT$17push_single_value17h593676c36aba78cfE
    unreachable)
  (func $codec_err_contract_call (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$4zero17h214ab0caab2b8b09E
      local.tee 1
      i32.const 2147483646
      i32.ne
      br_if 0 (;@1;)
      i32.const 132406
      i32.const 25
      call $signalError
      unreachable
    end
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    i32.const 132467
    i32.const 19
    call $_ZN13multiversx_sc5types11interaction24contract_call_no_payment48ContractCallNoPayment$LT$SA$C$OriginalResult$GT$3new17h6ab62a5b02ab110cE
    i32.const 131746
    i32.const 28
    call $_ZN241_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi_output..TopEncodeMultiOutput$GT$17push_single_value17h593676c36aba78cfE
    unreachable)
  (func $compute_sha256 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedSha256
    drop
    local.get 0
    call $mBufferFinish
    drop)
  (func $compute_keccak256 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedKeccak256
    drop
    local.get 0
    call $mBufferFinish
    drop)
  (func $compute_ripemd160 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedRipemd160
    drop
    local.get 0
    call $mBufferFinish
    drop)
  (func $verify_bls_signature (type 10)
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $managedVerifyBLS
    i32.eqz
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $verify_ed25519_signature (type 10)
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $managedVerifyEd25519
    drop)
  (func $verify_secp256k1_signature (type 10)
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $managedVerifySecp256k1
    i32.eqz
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $verify_custom_secp256k1_signature (type 10)
    call $checkNoPayment
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h192e1e0d9c3387b1E
    i32.const 255
    i32.and
    call $managedVerifyCustomSecp256k1
    i32.eqz
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $compute_secp256k1_der_signature (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $managedEncodeSecp256k1DerSignature
    drop
    local.get 0
    call $mBufferFinish
    drop)
  (func $echo_u64 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    call $smallIntFinishUnsigned)
  (func $echo_i64 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcd0355bb3829d176E
    call $smallIntFinishSigned)
  (func $echo_i32 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h0b99cb8659559dcbE
    i64.extend_i32_s
    call $smallIntFinishSigned)
  (func $echo_u32 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132730
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $echo_isize (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h91598548c021c288E
    i64.extend_i32_s
    call $smallIntFinishSigned)
  (func $echo_i8 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h4685fcac918fa746E
    i64.extend_i32_u
    i64.extend8_s
    call $smallIntFinishSigned)
  (func $echo_u8 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h649d0947d3a71e32E
    i64.extend_i32_u
    i64.const 255
    i64.and
    call $smallIntFinishUnsigned)
  (func $echo_bool (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132730
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8a096bbd58ed5564E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $echo_opt_bool (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      block  ;; label = @2
        call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h7fc3864e8589c721E
        local.tee 1
        i32.const 255
        i32.and
        i32.const 2
        i32.ne
        br_if 0 (;@2;)
        i32.const 133776
        i32.const 0
        call $finish
        br 1 (;@1;)
      end
      local.get 0
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 0
      local.get 0
      i32.load8_u offset=4
      i32.store8 offset=12
      local.get 0
      local.get 0
      i32.load
      i32.store offset=8
      local.get 0
      i32.const 8
      i32.add
      i32.const 1
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load8_u offset=12
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $echo_nothing (type 10)
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE)
  (func $echo_array_u8 (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 11
    i32.add
    i32.const 0
    i32.const 132537
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h982bee2cdb389f5aE
    local.get 0
    i32.const 11
    i32.add
    i32.const 5
    call $finish
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $echo_multi_value_u32 (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    i32.const 12
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hb1d799c60d2da9f3E
    local.set 1
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    local.get 1
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$3len17h44caac58d4f30d45E
    local.set 2
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store
    local.get 2
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 4
    i32.or
    call $_ZN179_$LT$multiversx_sc..types..managed..multi_value..multi_value_managed_vec..MultiValueManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17hb44aa107f8425fc0E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $echo_multi_value_tuples (type 10)
    (local i32 i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    local.get 0
    i32.const 0
    i32.store offset=32
    local.get 0
    i32.const 32
    i32.add
    i32.const 132456
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h004cd527dbf37b4fE
    local.set 1
    local.get 0
    i32.load offset=32
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 32
    i32.add
    local.get 1
    call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
    block  ;; label = @1
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load offset=40
          local.get 0
          i32.load offset=36
          i32.ge_u
          br_if 1 (;@2;)
          local.get 0
          i32.const 32
          i32.add
          i32.const 133010
          i32.const 8
          call $_ZN165_$LT$multiversx_sc..io..managed_result_arg_loader..ManagedResultArgLoader$LT$A$GT$$u20$as$u20$multiversx_sc_codec..multi..top_de_multi_input..TopDecodeMultiInput$GT$16next_value_input17h8169e17663e95d18E
          local.set 1
          local.get 0
          i64.const 0
          i64.store offset=24
          local.get 0
          i32.const 8
          i32.add
          local.get 1
          local.get 0
          i32.const 24
          i32.add
          call $_ZN13multiversx_sc5types7managed10codec_util27managed_buffer_top_de_input164_$LT$impl$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$u20$for$u20$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$GT$20into_max_size_buffer17hb636494537abd78fE
          local.get 0
          i32.load offset=8
          local.get 0
          i32.load offset=12
          i32.const 1
          call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
          local.tee 3
          i64.const -2147483648
          i64.add
          i64.const -4294967297
          i64.le_u
          br_if 2 (;@1;)
          local.get 0
          i32.const 32
          i32.add
          i32.const 133010
          i32.const 8
          call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_de_multi..TopDecodeMulti$GT$26multi_decode_or_handle_err17hf400af9472610542E
          local.set 4
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
          local.set 1
          local.get 0
          i64.const 0
          i64.store offset=24
          local.get 0
          local.get 3
          i32.const 1
          local.get 0
          i32.const 24
          i32.add
          call $_ZN19multiversx_sc_codec8num_conv17top_encode_number17h8b96cc408e6940ecE
          local.get 1
          local.get 0
          i32.load
          local.get 0
          i32.load offset=4
          call $mBufferSetBytes
          drop
          local.get 2
          local.get 1
          call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
          local.get 2
          local.get 4
          call $_ZN13multiversx_sc5types11interaction18managed_arg_buffer25ManagedArgBuffer$LT$M$GT$8push_arg17h27b0744493ef0094E
          br 0 (;@3;)
        end
      end
      local.get 0
      local.get 2
      i32.store offset=24
      local.get 0
      local.get 2
      call $mBufferGetLength
      i32.store offset=36
      local.get 0
      i32.const 0
      i32.store offset=32
      local.get 0
      local.get 0
      i32.const 24
      i32.add
      i32.store offset=40
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.const 16
          i32.add
          local.get 0
          i32.const 32
          i32.add
          call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
          local.get 0
          i32.load offset=16
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=20
          call $mBufferFinish
          drop
          br 0 (;@3;)
        end
      end
      local.get 0
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 133010
    i32.const 8
    i32.const 133053
    i32.const 18
    call $_ZN13multiversx_sc2io12signal_error19signal_arg_de_error17h48d575b7829b20e3E
    unreachable)
  (func $echo_ser_example_2 (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 132976
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hed5e28bdd5130fd2E
    local.get 0
    call $_ZN13multiversx_sc2io6finish12finish_multi17hd567ac77fcf8089dE
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $echo_simple_enum (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9e63dca59b1167f8E
    i64.extend_i32_u
    i64.const 255
    i64.and
    call $smallIntFinishUnsigned)
  (func $finish_simple_enum_variant_1 (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i64.const 1
    call $smallIntFinishUnsigned)
  (func $echo_non_zero_usize (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hc30b1262ec24a38aE
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $echo_some_args_ignore_others (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h0b99cb8659559dcbE
    local.set 1
    local.get 0
    i32.const 1
    i32.store offset=8
    local.get 0
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17hdd0b4d4dc8b44b18E
    local.get 0
    i32.load offset=4
    local.set 2
    local.get 0
    i32.load
    local.set 3
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=12
    local.get 0
    i32.const 12
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h2f105596805625f1E
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    local.get 1
    i64.extend_i32_s
    call $smallIntFinishSigned
    block  ;; label = @1
      local.get 3
      br_if 0 (;@1;)
      local.get 2
      i64.extend_i32_s
      call $smallIntFinishSigned
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $echo_arrayvec (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hbffdb41f00cfa277E
    local.get 0
    i32.load offset=20
    local.set 1
    local.get 0
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=4
    i32.store8 offset=28
    local.get 0
    local.get 0
    i32.load
    i32.store offset=24
    local.get 1
    i32.const 2
    i32.shl
    local.set 2
    i32.const 0
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        local.get 1
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        i32.const 8
        i32.add
        local.get 1
        i32.add
        i32.load
        local.get 0
        i32.const 24
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.load offset=24
    local.get 0
    i32.load8_u offset=28
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $echo_big_uint (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $bigIntFinishUnsigned)
  (func $echo_big_int (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    call $bigIntFinishSigned)
  (func $echo_managed_buffer (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $mBufferFinish
    drop)
  (func $echo_managed_address (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132454
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    call $mBufferFinish
    drop)
  (func $echo_big_int_managed_vec (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h125c60d8f1115c49E
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=12
    i32.store8 offset=20
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=16
    local.get 1
    call $mBufferGetLength
    local.set 2
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 1
        local.get 3
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
        drop
        local.get 0
        i32.load offset=28
        local.tee 3
        i32.const 24
        i32.shl
        local.get 3
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 3
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 3
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        local.get 0
        i32.const 16
        i32.add
        call $_ZN135_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hbd81a1bd02b4df5cE
        local.get 4
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load8_u offset=20
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $echo_big_int_tuple (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8f8c85dc6cf304bfE
    local.get 0
    i32.load offset=20
    local.set 1
    local.get 0
    i32.load offset=16
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=12
    i32.store8 offset=28
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=24
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    call $_ZN135_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hbd81a1bd02b4df5cE
    local.get 1
    local.get 0
    i32.const 24
    i32.add
    call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E
    local.get 0
    i32.load offset=24
    local.get 0
    i32.load8_u offset=28
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $echo_big_int_option (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17ha191c8156287074fE
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        br_if 0 (;@2;)
        i32.const 133776
        i32.const 0
        call $finish
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=20
      local.set 1
      local.get 0
      i32.const 8
      i32.add
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 0
      local.get 0
      i32.load8_u offset=12
      i32.store8 offset=28
      local.get 0
      local.get 0
      i32.load offset=8
      i32.store offset=24
      local.get 0
      i32.const 24
      i32.add
      i32.const 1
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 1
      local.get 0
      i32.const 24
      i32.add
      call $_ZN135_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hbd81a1bd02b4df5cE
      local.get 0
      i32.load offset=24
      local.get 0
      i32.load8_u offset=28
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $echo_tuple_into_multiresult (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132460
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    local.get 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17had40e05ecc0a5223E
    local.tee 2
    i32.store offset=20
    local.get 0
    local.get 1
    i32.store offset=16
    local.get 1
    call $mBufferFinish
    drop
    local.get 0
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=12
    i32.store8 offset=28
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=24
    local.get 2
    call $mBufferGetLength
    local.set 1
    local.get 0
    local.get 0
    i32.const 16
    i32.add
    i32.const 4
    i32.or
    i32.store offset=40
    local.get 0
    local.get 1
    i32.store offset=36
    local.get 0
    i32.const 0
    i32.store offset=32
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.const 32
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 0
        i32.load
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 0
        i32.const 24
        i32.add
        call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.load offset=24
    local.get 0
    i32.load8_u offset=28
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $echo_managed_vec_of_managed_vec (type 10)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8cec285dd44f2a18E
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=12
    i32.store8 offset=20
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=16
    local.get 1
    call $mBufferGetLength
    local.set 2
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 1
        local.get 3
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
        drop
        local.get 0
        i32.load offset=28
        local.tee 3
        i32.const 24
        i32.shl
        local.get 3
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 3
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 3
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        local.tee 6
        call $mBufferGetLength
        i32.const 2
        i32.shr_u
        local.get 0
        i32.const 16
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E
        local.get 6
        call $mBufferGetLength
        local.set 7
        loop  ;; label = @3
          block  ;; label = @4
            local.get 5
            i32.const 4
            i32.add
            local.tee 3
            local.get 7
            i32.le_u
            br_if 0 (;@4;)
            local.get 4
            local.set 3
            br 2 (;@2;)
          end
          local.get 0
          i32.const 0
          i32.store offset=28
          local.get 6
          local.get 5
          local.get 0
          i32.const 28
          i32.add
          i32.const 4
          call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
          drop
          local.get 0
          i32.load offset=28
          local.tee 5
          i32.const 24
          i32.shl
          local.get 5
          i32.const 65280
          i32.and
          i32.const 8
          i32.shl
          i32.or
          local.get 5
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 5
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          local.get 0
          i32.const 16
          i32.add
          call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E
          local.get 3
          local.set 5
          br 0 (;@3;)
        end
      end
    end
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load8_u offset=20
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $echo_managed_vec_of_token_identifier (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h82a6e7d4b0acc1dbE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=12
    i32.store8 offset=20
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=16
    local.get 1
    call $mBufferGetLength
    local.set 2
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 1
        local.get 3
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
        drop
        local.get 0
        i32.load offset=28
        local.tee 3
        i32.const 24
        i32.shl
        local.get 3
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 3
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 3
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        local.get 0
        i32.const 16
        i32.add
        call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17hb9df64006d1e7c09E
        local.get 4
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load8_u offset=20
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $echo_managed_async_result_empty (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    i32.const 132464
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h55bb0e59e98ef0eeE
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    block  ;; label = @1
      local.get 0
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=8
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h5a1ba8e2bfc9a074E
      unreachable
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $echo_varags_managed_sum (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    i32.const 16
    i32.add
    i32.const 132456
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h004cd527dbf37b4fE
    local.set 1
    local.get 0
    i32.load offset=16
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    local.get 1
    call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load offset=24
        local.get 0
        i32.load offset=20
        i32.ge_u
        br_if 1 (;@1;)
        local.get 0
        i32.const 16
        i32.add
        call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_de_multi..TopDecodeMulti$GT$26multi_decode_or_handle_err17h4999e8b802f6e50aE
        local.set 1
        local.get 0
        i32.const 16
        i32.add
        call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_de_multi..TopDecodeMulti$GT$26multi_decode_or_handle_err17h4999e8b802f6e50aE
        local.set 3
        local.get 1
        local.get 2
        call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h78a333583657639dE
        local.get 3
        local.get 2
        call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h78a333583657639dE
        local.get 3
        local.get 1
        i32.add
        local.get 2
        call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h78a333583657639dE
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 2
    call $mBufferGetLength
    i32.store offset=20
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=24
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.const 16
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 0
        i32.load
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=4
        call $mBufferFinish
        drop
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $compute_get_values (type 10)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 2
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 3
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 4
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 5
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 0
        local.get 5
        i32.store offset=24
        local.get 0
        local.get 4
        i32.store offset=20
        local.get 0
        local.get 3
        i32.store offset=16
        local.get 0
        local.get 2
        i32.store offset=12
        local.get 0
        local.get 1
        i32.store offset=8
        br 1 (;@1;)
      end
      local.get 0
      i32.const 8
      i32.add
      local.get 0
      i32.load offset=4
      call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$10get_values17h6cceec556ca6a650E
    end
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17he91a121729dbcadcE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $compute_create_ec (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $managedCreateEC
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$10get_values17h6cceec556ca6a650E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17he91a121729dbcadcE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $compute_get_ec_length (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.tee 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      call $getCurveLengthEC
      local.set 1
    end
    local.get 1
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_get_priv_key_byte_length (type 10)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        i64.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      call $getPrivKeyByteLengthEC
      i64.extend_i32_u
      local.set 1
    end
    local.get 1
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_ec_add (type 10)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 4
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 5
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 6
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 7
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 6
      local.get 7
      local.get 2
      local.get 3
      local.get 4
      local.get 5
      call $addEC
    end
    local.get 1
    local.get 6
    call $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_ec_double (type 10)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 4
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 5
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 4
      local.get 5
      local.get 2
      local.get 3
      call $doubleEC
    end
    local.get 1
    local.get 4
    call $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_is_on_curve_ec (type 10)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        i64.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.get 2
      local.get 3
      call $isOnCurveEC
      i32.const 0
      i32.gt_s
      i64.extend_i32_u
      local.set 4
    end
    local.get 4
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_scalar_mult (type 10)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 4
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 5
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 6
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 5
      local.get 6
      local.get 2
      local.get 3
      local.get 4
      call $managedScalarMultEC
      drop
    end
    local.get 1
    local.get 5
    call $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_scalar_base_mult (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 4
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 3
      local.get 4
      local.get 2
      call $managedScalarBaseMultEC
      drop
    end
    local.get 1
    local.get 3
    call $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_marshal_ec (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 3
      local.get 0
      i32.load offset=12
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
      local.tee 1
      call $managedMarshalEC
      drop
    end
    local.get 1
    call $mBufferFinish
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_marshal_compressed_ec (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 1
        br 1 (;@1;)
      end
      local.get 2
      local.get 3
      local.get 0
      i32.load offset=12
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
      local.tee 1
      call $managedMarshalCompressedEC
      drop
    end
    local.get 1
    call $mBufferFinish
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_unmarshal_ec (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 4
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 3
      local.get 4
      local.get 2
      call $managedUnmarshalEC
      drop
    end
    local.get 1
    local.get 3
    call $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_unmarshal_compressed_ec (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 4
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 3
      local.get 4
      local.get 2
      call $managedUnmarshalCompressedEC
      drop
    end
    local.get 1
    local.get 3
    call $_ZN13multiversx_sc2io6finish12finish_multi17h8acd31a3ab7c2f05E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $compute_generate_key_ec (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    i32.const 132767
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN13multiversx_sc5types7managed5basic14elliptic_curve22EllipticCurve$LT$M$GT$12from_bitsize17h89114936dc968678E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        br_if 0 (;@2;)
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 1
        call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$4zero17h596ac2db9253a843E
        local.set 2
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=12
      local.set 4
      i64.const 0
      call $bigIntNew
      local.tee 1
      i64.const 0
      call $bigIntNew
      local.tee 2
      local.get 4
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
      local.tee 3
      call $managedGenerateKeyEC
      drop
    end
    local.get 1
    call $bigIntFinishUnsigned
    local.get 2
    call $bigIntFinishUnsigned
    local.get 3
    call $mBufferFinish
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $logEventA (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132486
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN67_$LT$C$u20$as$u20$basic_features..event_features..EventFeatures$GT$7event_a17h9702129cc67526ceE)
  (func $logEventARepeat (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    local.set 0
    i32.const 0
    i32.const 132494
    i32.const 8
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 0
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        call $_ZN67_$LT$C$u20$as$u20$basic_features..event_features..EventFeatures$GT$7event_a17h9702129cc67526ceE
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 0 (;@2;)
      end
    end)
  (func $logEventB (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    i32.const 1
    i32.const 132490
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 2
    local.get 0
    i32.const 2
    i32.store offset=16
    local.get 0
    i32.const 16
    i32.add
    i32.const 132486
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h004cd527dbf37b4fE
    local.set 3
    local.get 0
    i32.load offset=16
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    i32.const 133092
    i32.const 7
    call $_ZN13multiversx_sc8log_util23event_topic_accumulator17hcfa9d1ba707c7018E
    local.set 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 4
    local.get 1
    call $_ZN13multiversx_sc5types7managed5basic8big_uint16BigUint$LT$M$GT$18to_bytes_be_buffer17h23cc2ff2dcfdfb01E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    drop
    local.get 4
    local.get 2
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    local.get 0
    local.get 3
    i32.store offset=12
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    local.set 1
    local.get 0
    local.get 3
    call $mBufferGetLength
    i32.store offset=20
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=24
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.const 16
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 0
        i32.load
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=4
        local.get 1
        call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d62025df94d87e4E
        br 0 (;@2;)
      end
    end
    local.get 4
    local.get 1
    call $managedWriteLog
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $only_owner_endpoint (type 10)
    call $checkNoPayment
    block  ;; label = @1
      call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$17get_owner_address17h2bb02a5145214c17E
      call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$10get_caller17hd6bfca50036c0966E
      call $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E
      br_if 0 (;@1;)
      i32.const 133488
      i32.const 36
      call $signalError
      unreachable
    end
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E)
  (func $only_user_account_endpoint (type 10)
    call $checkNoPayment
    i32.const -25
    call $managedCaller
    block  ;; label = @1
      i32.const -25
      call $_ZN26multiversx_sc_wasm_adapter3api19blockchain_api_node139_$LT$impl$u20$multiversx_sc..api..blockchain_api..BlockchainApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$17is_smart_contract17hcbe45051a717253aE
      i32.eqz
      br_if 0 (;@1;)
      i32.const 133524
      i32.const 44
      call $signalError
      unreachable
    end
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E)
  (func $require_equals (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      i32.const 0
      i32.const 132464
      i32.const 1
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
      i32.const 1
      i32.const 132502
      i32.const 1
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
      i32.eq
      br_if 0 (;@1;)
      i32.const 132503
      i32.const 14
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end)
  (func $sc_panic (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 132517
    i32.const 13
    call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
    unreachable)
  (func $maddress_from_array (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hd8dbda0a8e51e14bE
    local.get 0
    call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$14new_from_bytes17hcae76b0eaf4182bfE
    call $mBufferFinish
    drop
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $maddress_from_managed_buffer (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      i32.const 0
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
      local.tee 0
      call $mBufferGetLength
      i32.const 32
      i32.eq
      br_if 0 (;@1;)
      i32.const 132994
      i32.const 16
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 0
    call $mBufferFinish
    drop)
  (func $mbuffer_new (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    call $mBufferFinish
    drop)
  (func $mbuffer_concat (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.tee 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $mBufferAppend
    drop
    local.get 0
    call $mBufferFinish
    drop)
  (func $mbuffer_copy_slice (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    i32.const 132795
    i32.const 17
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    i32.const 2
    i32.const 132786
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$10copy_slice17hda333ad172527088E
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=12
      call $mBufferFinish
      drop
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $mbuffer_set_random (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132812
    i32.const 8
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 0
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 1
    local.get 0
    call $mBufferSetRandom
    drop
    local.get 1
    call $mBufferFinish
    drop)
  (func $mbuffer_eq (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $managed_address_zero (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed7wrapped15managed_address23ManagedAddress$LT$M$GT$4zero17h214ab0caab2b8b09E
    call $mBufferFinish
    drop)
  (func $managed_address_eq (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132783
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    i32.const 1
    i32.const 132780
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    call $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $managed_vec_new (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    call $_ZN13multiversx_sc2io6finish12finish_multi17h42b96b194f9e823aE)
  (func $managed_vec_biguint_push (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132465
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
    local.tee 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    local.get 0
    call $_ZN13multiversx_sc2io6finish12finish_multi17h42b96b194f9e823aE)
  (func $managed_vec_biguint_eq (type 10)
    (local i32 i64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i64.const 1
    local.set 1
    block  ;; label = @1
      i32.const 0
      i32.const 132708
      i32.const 3
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
      local.tee 2
      i32.const 1
      i32.const 132705
      i32.const 3
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
      local.tee 3
      call $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        call $mBufferGetLength
        local.tee 4
        local.get 3
        call $mBufferGetLength
        i32.ne
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        loop  ;; label = @3
          local.get 5
          local.get 4
          i32.ge_u
          br_if 2 (;@1;)
          local.get 0
          i32.const 0
          i32.store offset=8
          local.get 2
          local.get 5
          local.get 0
          i32.const 8
          i32.add
          i32.const 4
          call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
          drop
          local.get 0
          i32.load offset=8
          local.set 6
          local.get 0
          i32.const 0
          i32.store offset=12
          local.get 3
          local.get 5
          local.get 0
          i32.const 12
          i32.add
          i32.const 4
          call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
          drop
          local.get 6
          i32.const 24
          i32.shl
          local.get 6
          i32.const 65280
          i32.and
          i32.const 8
          i32.shl
          i32.or
          local.get 6
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 6
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          local.get 0
          i32.load offset=12
          local.tee 6
          i32.const 24
          i32.shl
          local.get 6
          i32.const 65280
          i32.and
          i32.const 8
          i32.shl
          i32.or
          local.get 6
          i32.const 8
          i32.shr_u
          i32.const 65280
          i32.and
          local.get 6
          i32.const 24
          i32.shr_u
          i32.or
          i32.or
          call $_ZN13multiversx_sc5types7managed5basic12big_uint_cmp115_$LT$impl$u20$core..cmp..PartialEq$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$2eq17h7b6d694a544a5437E
          i32.eqz
          br_if 1 (;@2;)
          local.get 5
          i32.const 4
          i32.add
          local.set 5
          br 0 (;@3;)
        end
      end
      i64.const 0
      local.set 1
    end
    local.get 1
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $managed_vec_address_push (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hf5800e0d7c0af2c6E
    local.tee 1
    i32.const 1
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
    local.get 0
    local.get 0
    i32.load8_u offset=12
    i32.store8 offset=20
    local.get 0
    local.get 0
    i32.load offset=8
    i32.store offset=16
    local.get 1
    call $mBufferGetLength
    local.set 2
    i32.const 0
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        i32.const 4
        i32.add
        local.tee 4
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.const 0
        i32.store offset=28
        local.get 1
        local.get 3
        local.get 0
        i32.const 28
        i32.add
        i32.const 4
        call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
        drop
        local.get 0
        i32.const 16
        i32.add
        local.get 0
        i32.load offset=28
        local.tee 3
        i32.const 24
        i32.shl
        local.get 3
        i32.const 65280
        i32.and
        i32.const 8
        i32.shl
        i32.or
        local.get 3
        i32.const 8
        i32.shr_u
        i32.const 65280
        i32.and
        local.get 3
        i32.const 24
        i32.shr_u
        i32.or
        i32.or
        call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$16push_specialized17h200a00375dde9872E
        local.get 4
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load8_u offset=20
    call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $managed_vec_set (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132465
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
    local.set 1
    i32.const 1
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.tee 3
    i32.const 24
    i32.shl
    local.get 3
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 3
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 3
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    i32.store offset=12
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.const 2
      i32.shl
      i32.const 4
      local.get 0
      i32.const 12
      i32.add
      call $mBufferSetByteSlice
      i32.eqz
      br_if 0 (;@1;)
      i32.const 132711
      i32.const 19
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 1
    call $_ZN13multiversx_sc2io6finish12finish_multi17h42b96b194f9e823aE
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $managed_vec_remove (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132465
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
    local.set 1
    i32.const 1
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          call $mBufferGetLength
          i32.const 2
          i32.shr_u
          local.tee 3
          local.get 2
          i32.le_u
          br_if 0 (;@3;)
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              br_if 0 (;@5;)
              call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
              local.set 4
              br 1 (;@4;)
            end
            local.get 0
            i32.const 8
            i32.add
            local.get 1
            i32.const 0
            local.get 2
            call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$5slice17h4a82b818a0176763E
            local.get 0
            i32.load offset=8
            i32.eqz
            br_if 2 (;@2;)
            local.get 0
            i32.load offset=12
            local.set 4
          end
          local.get 0
          local.get 1
          local.get 2
          i32.const 1
          i32.add
          local.get 3
          call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$5slice17h4a82b818a0176763E
          local.get 0
          i32.load
          i32.eqz
          br_if 2 (;@1;)
          local.get 4
          local.get 0
          i32.load offset=4
          call $mBufferAppend
          drop
          local.get 4
          call $_ZN13multiversx_sc2io6finish12finish_multi17h42b96b194f9e823aE
          local.get 0
          i32.const 16
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 131832
        i32.const 29
        call $signalError
        unreachable
      end
      i32.const 131832
      i32.const 29
      call $signalError
      unreachable
    end
    i32.const 131832
    i32.const 29
    call $signalError
    unreachable)
  (func $managed_vec_find (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    i32.const 0
    i32.const 132465
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4find17h74f8d6aa9705f250E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        br_if 0 (;@2;)
        i32.const 133776
        i32.const 0
        call $finish
        br 1 (;@1;)
      end
      local.get 0
      i32.load offset=20
      local.set 1
      local.get 0
      i32.const 8
      i32.add
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 0
      local.get 0
      i32.load8_u offset=12
      i32.store8 offset=28
      local.get 0
      local.get 0
      i32.load offset=8
      i32.store offset=24
      local.get 0
      i32.const 24
      i32.add
      i32.const 1
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 1
      local.get 0
      i32.const 24
      i32.add
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h71bce5da761e7ad6E
      local.get 0
      i32.load offset=24
      local.get 0
      i32.load8_u offset=28
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $managed_vec_contains (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    i32.const 132465
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4find17h74f8d6aa9705f250E
    local.get 0
    i32.load offset=8
    i32.const 0
    i32.ne
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $managed_vec_array_push (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    i32.const 4
    i32.or
    i32.const 1
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h982bee2cdb389f5aE
    local.get 0
    i32.const 24
    i32.add
    i32.const 4
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i32.load8_u
    i32.store8
    local.get 0
    local.get 0
    i32.load offset=12
    i32.store offset=24
    i32.const 0
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    i32.const 4
    i32.add
    i32.const 0
    i32.store8
    local.get 0
    i32.const 0
    i32.store offset=8
    block  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 5
        i32.eq
        br_if 1 (;@1;)
        local.get 0
        local.get 0
        i32.const 24
        i32.add
        local.get 2
        i32.add
        i32.load8_u
        i32.store8 offset=31
        local.get 0
        local.get 2
        local.get 2
        i32.const 1
        i32.add
        local.tee 3
        local.get 0
        i32.const 8
        i32.add
        i32.const 5
        call $_ZN106_$LT$core..ops..range..Range$LT$usize$GT$$u20$as$u20$core..slice..index..SliceIndex$LT$$u5b$T$u5d$$GT$$GT$9index_mut17h749f83e2af55068fE
        local.get 0
        i32.load
        local.get 0
        i32.load offset=4
        local.get 0
        i32.const 31
        i32.add
        i32.const 1
        call $_ZN4core5slice29_$LT$impl$u20$$u5b$T$u5d$$GT$15copy_from_slice17hadb7e60c03134007E
        local.get 3
        local.set 2
        br 0 (;@2;)
      end
    end
    local.get 1
    local.get 0
    i32.const 8
    i32.add
    i32.const 5
    call $mBufferAppendBytes
    drop
    local.get 1
    call $mBufferFinish
    drop
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $managed_ref_explicit (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132465
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hebe967a4eaa6c2abE
    local.set 1
    i32.const 1
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.const 2
      i32.shl
      local.get 0
      i32.const 12
      i32.add
      i32.const 4
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
      i32.eqz
      br_if 0 (;@1;)
      i32.const 131832
      i32.const 29
      call $signalError
      unreachable
    end
    local.get 0
    i32.load offset=12
    local.tee 1
    i32.const 24
    i32.shl
    local.get 1
    i32.const 65280
    i32.and
    i32.const 8
    i32.shl
    i32.or
    local.get 1
    i32.const 8
    i32.shr_u
    i32.const 65280
    i32.and
    local.get 1
    i32.const 24
    i32.shr_u
    i32.or
    i32.or
    call $_ZN101_$LT$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h111ce53467ea49a1E
    call $bigIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $storage_read_raw (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN143_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h5b4d28b09ba2cb61E
    call $mBufferFinish
    drop)
  (func $storage_write_raw (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17haa050e4e558e005eE)
  (func $storage_read_from_address (type 10)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    i32.const -25
    call $mBufferStorageLoadFromAddress
    i32.const -25
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    call $mBufferFinish
    drop)
  (func $load_bytes (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133214
    i32.const 13
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN143_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h5b4d28b09ba2cb61E
    call $mBufferFinish
    drop)
  (func $load_big_uint (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133244
    i32.const 8
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hc334ccdf02674fc3E
    call $bigIntFinishUnsigned)
  (func $load_big_int (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133237
    i32.const 7
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hba1405c72ada0b45E
    call $bigIntFinishSigned)
  (func $load_u64 (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133266
    i32.const 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h6ed55561773af550E
    call $smallIntFinishUnsigned)
  (func $load_usize (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133232
    i32.const 5
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $load_i64 (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133263
    i32.const 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.set 1
    local.get 0
    i64.const 0
    i64.store offset=8
    local.get 0
    local.get 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$20into_max_size_buffer17h92d1c03c3f72e84cE
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    i32.const 1
    call $_ZN19multiversx_sc_codec8num_conv23universal_decode_number17h2946ff1025518752E
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $load_bool (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133269
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h737c80571f8d47c6E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $load_addr (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      i32.const 132460
      i32.const 4
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
      call $_ZN143_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h5b4d28b09ba2cb61E
      local.tee 0
      call $mBufferGetLength
      i32.const 32
      i32.eq
      br_if 0 (;@1;)
      i32.const 132994
      i32.const 16
      call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
      unreachable
    end
    local.get 0
    call $mBufferFinish
    drop)
  (func $load_opt_addr (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    local.set 1
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 132731
    i32.const 8
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 8
              i32.add
              call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h0ab872217a9bb32eE
              i32.const 255
              i32.and
              local.tee 1
              br_table 2 (;@3;) 1 (;@4;) 0 (;@5;)
            end
            i32.const 131123
            i32.const 13
            call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
            unreachable
          end
          i32.const 1
          local.set 1
          local.get 0
          i32.const 8
          i32.add
          i32.const 32
          call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$27read_managed_buffer_of_size17hb54e1755dce8da03E
          local.set 2
        end
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.ne
        br_if 1 (;@1;)
      end
      block  ;; label = @2
        local.get 0
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        call $mBufferFinish
        drop
      end
      local.get 0
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $is_empty_opt_addr (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 132731
    i32.const 8
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i32.eqz
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $get_nr_to_clear (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133252
    i32.const 11
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $clear_storage_value (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 133252
    i32.const 11
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E)
  (func $load_ser_2 (type 10)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    local.set 1
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          i32.const 133227
          i32.const 5
          call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
          local.tee 2
          call $_ZN13multiversx_sc7storage11storage_get24StorageGetInput$LT$A$GT$23load_len_managed_buffer17hee3eac868855d798E
          br_if 0 (;@3;)
          br 1 (;@2;)
        end
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        call $_ZN139_$LT$multiversx_sc..storage..storage_get..StorageGetInput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_de_input..TopDecodeInput$GT$18into_nested_buffer17h68ab7719d176aa1dE
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 8
                  i32.add
                  call $_ZN19multiversx_sc_codec6single15nested_de_input17NestedDecodeInput9read_byte17h0ab872217a9bb32eE
                  i32.const 255
                  i32.and
                  local.tee 1
                  br_table 4 (;@3;) 1 (;@6;) 2 (;@5;) 3 (;@4;) 0 (;@7;)
                end
                i32.const 131123
                i32.const 13
                call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
                unreachable
              end
              local.get 0
              i32.const 8
              i32.add
              call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
              i64.extend_i32_u
              local.set 3
              i32.const 1
              local.set 1
              br 2 (;@3;)
            end
            local.get 0
            i32.const 8
            i32.add
            call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
            local.set 1
            local.get 0
            i32.const 8
            i32.add
            call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.get 1
            i64.extend_i32_u
            i64.or
            local.set 3
            i32.const 2
            local.set 1
            br 1 (;@3;)
          end
          local.get 0
          i32.const 8
          i32.add
          call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u32$GT$24dep_decode_or_handle_err17ha59b29767ba93804E
          i64.extend_i32_u
          local.set 3
          i32.const 3
          local.set 1
        end
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=8
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 24
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      local.get 3
      i64.store offset=12 align=4
      local.get 0
      local.get 1
      i32.store offset=8
      local.get 0
      i32.const 8
      i32.add
      call $_ZN13multiversx_sc2io6finish12finish_multi17hd567ac77fcf8089dE
      local.get 0
      i32.const 32
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131109
    i32.const 14
    call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
    unreachable)
  (func $load_map1 (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132460
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 133273
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 1
    local.get 0
    call $mBufferAppend
    drop
    local.get 1
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hc334ccdf02674fc3E
    call $bigIntFinishUnsigned)
  (func $load_map2 (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132700
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 1
    i32.const 132695
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    i32.const 133277
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    local.get 0
    call $mBufferAppend
    drop
    local.get 2
    local.get 1
    call $mBufferAppend
    drop
    local.get 2
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hc334ccdf02674fc3E
    call $bigIntFinishUnsigned)
  (func $load_map3 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132453
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    i32.const 133281
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 0
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h70cc52a0636bead3E
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h737c80571f8d47c6E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $load_from_address_raw (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types19static_var_api_node11next_handle17h95d97e183f7242d4E
    local.tee 0
    call $mBufferStorageLoadFromAddress
    local.get 0
    call $mBufferFinish
    drop)
  (func $store_bytes (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 0
    i32.const 133214
    i32.const 13
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17haa050e4e558e005eE)
  (func $store_big_uint (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    i32.const 133244
    i32.const 8
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN131_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h5370e55cfc79f94dE)
  (func $store_big_int (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    i32.const 133237
    i32.const 7
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17h928a09f00b89c410E)
  (func $store_usize (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132730
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 0
    i32.const 133232
    i32.const 5
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE)
  (func $store_i32 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h0b99cb8659559dcbE
    local.set 0
    i32.const 133333
    i32.const 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    i64.extend_i32_s
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE)
  (func $store_u64 (type 10)
    (local i64)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 0
    i32.const 133266
    i32.const 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE)
  (func $store_i64 (type 10)
    (local i64)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcd0355bb3829d176E
    local.set 0
    i32.const 133263
    i32.const 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE)
  (func $store_bool (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132730
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8a096bbd58ed5564E
    local.set 0
    i32.const 133269
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE)
  (func $store_addr (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132547
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 132460
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $mBufferStorageStore
    drop)
  (func $store_opt_addr (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 24
    i32.add
    call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h88c28712539b864dE
    local.get 0
    i32.load offset=20
    local.set 1
    local.get 0
    i32.load offset=16
    local.set 2
    local.get 0
    i32.load offset=24
    call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
    i32.const 132731
    i32.const 8
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 133776
        i32.const 0
        call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$12set_slice_u817h1ce0b1b53d8addedE
        br 1 (;@1;)
      end
      local.get 0
      i32.const 8
      i32.add
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 0
      local.get 0
      i32.load8_u offset=12
      i32.store8 offset=28
      local.get 0
      local.get 0
      i32.load offset=8
      i32.store offset=24
      local.get 0
      i32.const 24
      i32.add
      i32.const 1
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.const 24
      i32.add
      local.get 1
      call $_ZN192_$LT$multiversx_sc..types..managed..wrapped..managed_buffer_cached_builder..ManagedBufferCachedBuilder$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en_output..NestedEncodeOutput$GT$16push_specialized17h200a00375dde9872E
      local.get 3
      local.get 0
      i32.load offset=24
      local.get 0
      i32.load8_u offset=28
      call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $store_ser_2 (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 24
    i32.add
    i32.const 132547
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hed5e28bdd5130fd2E
    i32.const 133227
    i32.const 5
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.set 1
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load offset=24
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;) 0 (;@5;)
            end
            local.get 1
            i64.const 0
            call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
            br 3 (;@1;)
          end
          local.get 0
          call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
          local.get 0
          local.get 0
          i32.load8_u offset=4
          i32.store8 offset=44
          local.get 0
          local.get 0
          i32.load
          i32.store offset=40
          local.get 0
          i32.const 40
          i32.add
          i32.const 1
          call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
          local.get 0
          i32.load offset=28
          local.get 0
          i32.const 40
          i32.add
          call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
          local.get 1
          local.get 0
          i32.load offset=40
          local.get 0
          i32.load8_u offset=44
          call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
          br 2 (;@1;)
        end
        local.get 0
        i32.const 8
        i32.add
        call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
        local.get 0
        local.get 0
        i32.load8_u offset=12
        i32.store8 offset=44
        local.get 0
        local.get 0
        i32.load offset=8
        i32.store offset=40
        local.get 0
        i32.const 40
        i32.add
        i32.const 2
        call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
        local.get 0
        i32.load offset=28
        local.get 0
        i32.const 40
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 0
        i32.load offset=32
        local.get 0
        i32.const 40
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
        local.get 1
        local.get 0
        i32.load offset=40
        local.get 0
        i32.load8_u offset=44
        call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
        br 1 (;@1;)
      end
      local.get 0
      i32.const 16
      i32.add
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 0
      local.get 0
      i32.load8_u offset=20
      i32.store8 offset=44
      local.get 0
      local.get 0
      i32.load offset=16
      i32.store offset=40
      local.get 0
      i32.const 40
      i32.add
      i32.const 3
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.load offset=28
      local.get 0
      i32.const 40
      i32.add
      call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u32$GT$24dep_encode_or_handle_err17hf8b2adada22713dfE
      local.get 1
      local.get 0
      i32.load offset=40
      local.get 0
      i32.load8_u offset=44
      call $_ZN142_$LT$multiversx_sc..storage..storage_set..StorageSetOutput$LT$A$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17heb70abb43c7c3900E
    end
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $store_map1 (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132460
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    i32.const 133273
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    local.get 0
    call $mBufferAppend
    drop
    local.get 1
    local.get 2
    call $_ZN131_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h5370e55cfc79f94dE)
  (func $store_map2 (type 10)
    (local i32 i32 i32 i32)
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132700
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 1
    i32.const 132695
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    i32.const 133277
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 3
    local.get 0
    call $mBufferAppend
    drop
    local.get 3
    local.get 1
    call $mBufferAppend
    drop
    local.get 2
    local.get 3
    call $_ZN131_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h5370e55cfc79f94dE)
  (func $store_map3 (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132453
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 0
    i32.const 1
    i32.const 132502
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h8a096bbd58ed5564E
    local.set 1
    local.get 0
    i32.const 133281
    i32.const 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.tee 2
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$usize$GT$24dep_encode_or_handle_err17h70cc52a0636bead3E
    local.get 2
    local.get 1
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE)
  (func $store_reserved_i64 (type 10)
    (local i64)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcd0355bb3829d176E
    local.set 0
    i32.const 133297
    i32.const 9
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_i6417h643e76f0b6689dceE)
  (func $store_reserved_big_uint (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    i32.const 133320
    i32.const 13
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    call $_ZN131_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_en..TopEncode$GT$24top_encode_or_handle_err17h5370e55cfc79f94dE)
  (func $store_reserved_vec_u8 (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 0
    i32.const 133306
    i32.const 14
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
    local.get 0
    call $_ZN13multiversx_sc7storage11storage_set11storage_set17haa050e4e558e005eE)
  (func $getListMapper (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 1
    i32.store offset=12
    local.get 0
    i32.const 16
    i32.add
    i32.const 4
    i32.or
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$5front17h5b4a1e2f903707b6E
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=16
    local.get 0
    i32.const 40
    i32.add
    i32.const 16
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i32.const 16
    i32.add
    i64.load
    i64.store
    local.get 0
    i32.const 40
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=16
    i64.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 16
        i32.add
        local.get 0
        i32.const 40
        i32.add
        call $_ZN130_$LT$multiversx_sc..storage..mappers..linked_list_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha10b25a1f26ba234E
        local.get 0
        i32.load offset=16
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.load32_u offset=20
        call $smallIntFinishUnsigned
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $listMapperPushBack (type 10)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    local.set 1
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 3
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    local.get 0
    i32.load offset=28
    i32.const 1
    i32.add
    local.tee 4
    i32.store offset=28
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 5
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.store offset=20
        br 1 (;@1;)
      end
      local.get 0
      i32.const 32
      i32.add
      local.get 3
      local.get 0
      i32.load offset=24
      local.tee 1
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
      local.get 0
      local.get 4
      i32.store offset=40
      local.get 3
      local.get 1
      local.get 0
      i32.const 32
      i32.add
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
    end
    local.get 0
    local.get 1
    i32.store offset=12
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store
    local.get 3
    local.get 4
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
    local.get 0
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    local.tee 1
    local.get 4
    i32.store
    local.get 0
    local.get 5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get 0
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 1
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=16
    i64.store offset=32
    local.get 3
    local.get 0
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperPushFront (type 10)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    local.set 1
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 3
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    local.get 0
    i32.load offset=28
    i32.const 1
    i32.add
    local.tee 4
    i32.store offset=28
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 5
        br_if 0 (;@2;)
        local.get 0
        local.get 4
        i32.store offset=24
        br 1 (;@1;)
      end
      local.get 0
      i32.const 32
      i32.add
      local.get 3
      local.get 0
      i32.load offset=20
      local.tee 1
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
      local.get 0
      local.get 4
      i32.store offset=44
      local.get 3
      local.get 1
      local.get 0
      i32.const 32
      i32.add
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
    end
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 0
    local.get 4
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store
    local.get 3
    local.get 4
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
    local.get 0
    local.get 5
    i32.const 1
    i32.add
    i32.store offset=16
    local.get 0
    local.get 4
    i32.store offset=20
    local.get 0
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=16
    i64.store offset=32
    local.get 3
    local.get 0
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperPopFront (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 32
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    local.get 0
    i32.load offset=36
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$17remove_node_by_id17hdef7e27a5f2b5c1eE
    local.get 0
    i32.load offset=8
    i32.const 1
    i32.xor
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperPopBack (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 32
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    local.get 0
    i32.load offset=40
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$17remove_node_by_id17hdef7e27a5f2b5c1eE
    local.get 0
    i32.load offset=8
    i32.const 1
    i32.xor
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperFront (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$5front17h5b4a1e2f903707b6E
    local.get 0
    i32.load offset=8
    i32.const 1
    i32.xor
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $listMapperBack (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 32
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    local.get 0
    i32.load offset=40
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    local.get 0
    i32.load offset=8
    i32.const 1
    i32.xor
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperPushAfter (type 10)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 1
    local.set 1
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 1
    i32.const 132852
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 40
            i32.add
            i32.const 16
            i32.add
            local.get 0
            i32.const 16
            i32.add
            i32.load
            i32.store
            local.get 0
            i32.const 40
            i32.add
            i32.const 8
            i32.add
            local.get 0
            i32.const 8
            i32.add
            i64.load
            i64.store
            local.get 0
            local.get 0
            i64.load
            i64.store offset=40
            local.get 0
            i32.const 24
            i32.add
            local.get 0
            i32.const 40
            i32.add
            call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
            call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
            local.tee 4
            local.get 0
            i32.load offset=28
            local.tee 5
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E
            br_if 3 (;@1;)
            local.get 0
            i32.const 64
            i32.add
            local.get 4
            call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
            local.get 0
            local.get 0
            i32.load offset=76
            i32.const 1
            i32.add
            local.tee 1
            i32.store offset=76
            local.get 0
            i32.load offset=32
            local.set 2
            local.get 0
            local.get 1
            i32.store offset=32
            local.get 4
            local.get 5
            local.get 0
            i32.const 24
            i32.add
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 40
            i32.add
            local.get 4
            local.get 2
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
            local.get 0
            local.get 1
            i32.store offset=52
            local.get 4
            local.get 2
            local.get 0
            i32.const 40
            i32.add
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
            br 2 (;@2;)
          end
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        i32.store offset=72
      end
      local.get 0
      i32.const 80
      i32.add
      i32.const 8
      i32.add
      local.tee 6
      local.get 2
      i32.store
      local.get 0
      local.get 5
      i32.store offset=92
      local.get 0
      local.get 1
      i32.store offset=84
      local.get 0
      local.get 3
      i32.store offset=80
      local.get 4
      local.get 1
      local.get 0
      i32.const 80
      i32.add
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
      local.get 0
      local.get 0
      i32.load offset=64
      i32.const 1
      i32.add
      i32.store offset=64
      local.get 0
      i32.const 40
      i32.add
      i32.const 8
      i32.add
      local.get 0
      i32.const 64
      i32.add
      i32.const 8
      i32.add
      i64.load
      i64.store
      local.get 0
      local.get 0
      i64.load offset=64
      i64.store offset=40
      local.get 4
      local.get 0
      i32.const 40
      i32.add
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
      local.get 0
      i32.const 12
      i32.add
      local.get 6
      i64.load
      i64.store align=4
      local.get 0
      local.get 0
      i64.load offset=80
      local.tee 7
      i64.store offset=4 align=4
      local.get 7
      i32.wrap_i64
      local.set 2
      i32.const 0
      local.set 1
    end
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 96
    i32.add
    global.set $__stack_pointer)
  (func $listMapperPushBefore (type 10)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 1
    local.set 1
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 1
    i32.const 132852
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            i32.const 40
            i32.add
            i32.const 16
            i32.add
            local.get 0
            i32.const 16
            i32.add
            i32.load
            i32.store
            local.get 0
            i32.const 40
            i32.add
            i32.const 8
            i32.add
            local.get 0
            i32.const 8
            i32.add
            i64.load
            i64.store
            local.get 0
            local.get 0
            i64.load
            i64.store offset=40
            local.get 0
            i32.const 24
            i32.add
            local.get 0
            i32.const 40
            i32.add
            call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
            call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
            local.tee 4
            local.get 0
            i32.load offset=28
            local.tee 5
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$13is_empty_node17hdcaa38553dac3c42E
            br_if 3 (;@1;)
            local.get 0
            i32.const 64
            i32.add
            local.get 4
            call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
            local.get 0
            local.get 0
            i32.load offset=76
            i32.const 1
            i32.add
            local.tee 1
            i32.store offset=76
            local.get 0
            i32.load offset=36
            local.set 2
            local.get 0
            local.get 1
            i32.store offset=36
            local.get 4
            local.get 5
            local.get 0
            i32.const 24
            i32.add
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            local.get 0
            i32.const 40
            i32.add
            local.get 4
            local.get 2
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8get_node17h6ae3d2543dfc730aE
            local.get 0
            local.get 1
            i32.store offset=48
            local.get 4
            local.get 2
            local.get 0
            i32.const 40
            i32.add
            call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
            br 2 (;@2;)
          end
          i32.const 1
          local.set 1
          br 2 (;@1;)
        end
        local.get 0
        local.get 1
        i32.store offset=68
      end
      local.get 0
      i32.const 80
      i32.add
      i32.const 8
      i32.add
      local.tee 6
      local.get 5
      i32.store
      local.get 0
      local.get 2
      i32.store offset=92
      local.get 0
      local.get 1
      i32.store offset=84
      local.get 0
      local.get 3
      i32.store offset=80
      local.get 4
      local.get 1
      local.get 0
      i32.const 80
      i32.add
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$8set_node17h040f70363578cc03E
      local.get 0
      local.get 0
      i32.load offset=64
      i32.const 1
      i32.add
      i32.store offset=64
      local.get 0
      i32.const 40
      i32.add
      i32.const 8
      i32.add
      local.get 0
      i32.const 64
      i32.add
      i32.const 8
      i32.add
      i64.load
      i64.store
      local.get 0
      local.get 0
      i64.load offset=64
      i64.store offset=40
      local.get 4
      local.get 0
      i32.const 40
      i32.add
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8set_info17h45a0317ec06b5783E
      local.get 0
      i32.const 12
      i32.add
      local.get 6
      i64.load
      i64.store align=4
      local.get 0
      local.get 0
      i64.load offset=80
      local.tee 7
      i64.store offset=4 align=4
      local.get 7
      i32.wrap_i64
      local.set 2
      i32.const 0
      local.set 1
    end
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 96
    i32.add
    global.set $__stack_pointer)
  (func $listMapperRemoveNode (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    block  ;; label = @1
      local.get 0
      i32.load
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 40
      i32.add
      i32.const 16
      i32.add
      local.get 0
      i32.const 16
      i32.add
      i32.load
      i32.store
      local.get 0
      i32.const 40
      i32.add
      i32.const 8
      i32.add
      local.get 0
      i32.const 8
      i32.add
      i64.load
      i64.store
      local.get 0
      local.get 0
      i64.load
      i64.store offset=40
      local.get 0
      i32.const 24
      i32.add
      local.get 0
      i32.const 40
      i32.add
      call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
      call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
      local.get 0
      i32.const 24
      i32.add
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$11remove_node17h670376a1bb118cf9E
    end
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $listMapperRemoveNodeById (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$17remove_node_by_id17hdef7e27a5f2b5c1eE
    local.get 0
    i32.load offset=8
    i32.const 1
    i32.xor
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc2io6finish12finish_multi17h47df0ad14397ab0eE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $listMapperSetValue (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132836
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.const 8
    i32.add
    call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 0
    i32.const 32
    i32.add
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14set_node_value17he4ff803fe8d55807E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperSetValueById (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132836
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 3
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 40
      i32.add
      local.get 0
      i32.const 20
      i32.add
      i64.load align=4
      i64.store
      local.get 0
      local.get 0
      i64.load offset=12 align=4
      i64.store offset=32
      local.get 3
      local.get 0
      i32.const 32
      i32.add
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14set_node_value17he4ff803fe8d55807E
    end
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $listMapperIterateByHand (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 40
        i32.add
        i32.const 16
        i32.add
        local.get 0
        i32.const 16
        i32.add
        i32.load
        i32.store
        local.get 0
        i32.const 40
        i32.add
        i32.const 8
        i32.add
        local.get 0
        i32.const 8
        i32.add
        i64.load
        i64.store
        local.get 0
        local.get 0
        i64.load
        i64.store offset=40
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.const 40
        i32.add
        call $_ZN4core6option15Option$LT$T$GT$6unwrap17h0a56819b532d338cE
        local.get 2
        local.get 0
        i32.load offset=24
        call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
        local.get 0
        call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
        local.get 0
        i32.load offset=32
        call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 2
    i32.store offset=40
    local.get 0
    i32.const 40
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17h25b3306e4de308e4E
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $listMapperIterateByIter (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132845
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 2
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_linked_list..LinkedListMapperFeatures$GT$11list_mapper17h70ff5df8d5590a7dE
    local.tee 3
    i32.store offset=36
    local.get 0
    i32.const 8
    i32.add
    i32.const 4
    i32.or
    local.get 3
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18linked_list_mapper30LinkedListMapper$LT$SA$C$T$GT$14get_node_by_id17hc84031120a373083E
    local.get 0
    local.get 0
    i32.const 36
    i32.add
    i32.store offset=8
    local.get 0
    i32.const 40
    i32.add
    i32.const 16
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    i64.load
    i64.store
    local.get 0
    i32.const 40
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=8
    i64.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 8
        i32.add
        local.get 0
        i32.const 40
        i32.add
        call $_ZN130_$LT$multiversx_sc..storage..mappers..linked_list_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17ha10b25a1f26ba234E
        local.get 0
        i32.load offset=8
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 0
        i32.load offset=12
        call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    i32.const 4
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17h25b3306e4de308e4E
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $queue_mapper (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN79_$LT$C$u20$as$u20$basic_features..storage_mapper_queue..QueueMapperFeatures$GT$12queue_mapper17hdb5ebea532fe359cE
    i32.store offset=12
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN19multiversx_sc_codec5multi12top_en_multi31multi_encode_iter_or_handle_err17h58dbdf45f9b1b4faE
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $queue_mapper_push_back (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 0
    call $_ZN79_$LT$C$u20$as$u20$basic_features..storage_mapper_queue..QueueMapperFeatures$GT$12queue_mapper17hdb5ebea532fe359cE
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$17push_back_node_id17h5907f24270b21d06E
    drop)
  (func $queue_mapper_pop_front (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN79_$LT$C$u20$as$u20$basic_features..storage_mapper_queue..QueueMapperFeatures$GT$12queue_mapper17hdb5ebea532fe359cE
    local.tee 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    local.get 0
    i32.load offset=20
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$17remove_by_node_id17h96102b4c021b2eddE
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $queue_mapper_front (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN79_$LT$C$u20$as$u20$basic_features..storage_mapper_queue..QueueMapperFeatures$GT$12queue_mapper17hdb5ebea532fe359cE
    local.tee 1
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$8get_info17h5b69f12ed04312edE
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      local.tee 2
      br_if 0 (;@1;)
      i32.const 132739
      i32.const 12
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$9get_value17he2a99ce07db1f8ebE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper (type 10)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i32.const 4
    i32.or
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    local.get 0
    i64.load offset=8
    i64.store offset=32
    local.get 0
    local.get 0
    i32.const 16
    i32.add
    i32.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 48
        i32.add
        local.get 0
        i32.const 32
        i32.add
        call $_ZN126_$LT$multiversx_sc..storage..mappers..map_mapper..Iter$LT$SA$C$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he1f9d2d5c0507b34E
        local.get 0
        i32.load offset=48
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i64.load32_u offset=56
        local.set 1
        local.get 0
        i64.load32_u offset=52
        call $smallIntFinishUnsigned
        local.get 1
        call $smallIntFinishUnsigned
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_keys (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 1
    local.get 0
    i32.const 24
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 24
    i32.add
    i32.const 4
    i32.or
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    local.get 0
    i64.load offset=8
    i64.store offset=40
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.const 40
        i32.add
        call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
        local.get 0
        i32.load
        i32.eqz
        br_if 1 (;@1;)
        local.get 1
        local.get 0
        i32.load offset=4
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i32.store offset=20
    local.get 0
    i32.const 20
    i32.add
    call $_ZN179_$LT$multiversx_sc..types..managed..multi_value..multi_value_managed_vec..MultiValueManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17hb44aa107f8425fc0E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_values (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 1
    local.get 0
    i32.const 32
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 32
    i32.add
    i32.const 4
    i32.or
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    local.get 0
    i64.load offset=16
    i64.store offset=48
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    i32.store offset=56
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 8
        i32.add
        local.get 0
        i32.const 48
        i32.add
        call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
        local.get 0
        i32.load offset=8
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        local.get 0
        i32.load offset=56
        local.tee 2
        i32.load
        local.get 2
        i32.const 8
        i32.add
        i32.load
        local.get 0
        i32.load offset=12
        call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
        local.get 0
        i32.load offset=4
        local.set 2
        local.get 0
        i32.load
        call $_ZN4core6option15Option$LT$T$GT$6unwrap17h8f0d08bef36ac9d5E
        local.get 1
        local.get 2
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 1
    i32.store offset=28
    local.get 0
    i32.const 28
    i32.add
    call $_ZN179_$LT$multiversx_sc..types..managed..multi_value..multi_value_managed_vec..MultiValueManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17hb44aa107f8425fc0E
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_insert (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132640
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 16
    i32.add
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_contains_key (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.load
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_get (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=24
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_remove (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    local.set 1
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6remove17h39982222b32934abE
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=8
      local.tee 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$16get_mapped_value17h70e47702f7bc3f7dE
      local.set 3
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$18clear_mapped_value17h79c77a5cea91deddE
      i32.const 1
      local.set 1
    end
    local.get 1
    local.get 3
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_entry_or_default_update_increment (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132654
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 32
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 32
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc7storage7mappers10map_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h10d6cde70efcba7fE
    local.get 0
    i32.load offset=12
    local.set 1
    local.get 0
    i32.load offset=8
    local.set 3
    local.get 0
    local.get 1
    local.get 3
    local.get 2
    local.get 3
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE
    i32.add
    local.tee 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    local.get 2
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_entry_or_insert_default (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132663
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.const 16
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    local.get 0
    i32.load offset=40
    local.set 1
    local.get 0
    i32.load offset=36
    local.set 3
    block  ;; label = @1
      local.get 0
      i32.load offset=32
      br_if 0 (;@1;)
      local.get 0
      i32.const 8
      i32.add
      local.get 3
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers10map_mapper29VacantEntry$LT$SA$C$K$C$V$GT$6insert17hd79f47863aab386aE
      local.get 0
      i32.load offset=12
      local.set 1
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 3
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_entry_and_modify (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132654
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 2
    i32.const 132645
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    local.get 0
    i32.const 32
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 32
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        i32.load offset=20
        local.get 0
        i32.const 24
        i32.add
        i32.load
        local.get 3
        call $_ZN13multiversx_sc7storage7mappers10map_mapper29VacantEntry$LT$SA$C$K$C$V$GT$6insert17hd79f47863aab386aE
        local.get 0
        i32.load offset=4
        local.set 1
        local.get 0
        i32.load
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 24
      i32.add
      i32.load
      local.set 1
      local.get 0
      i32.load offset=20
      local.set 3
      local.get 0
      i32.const 8
      i32.add
      local.get 1
      local.get 3
      local.get 3
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE
      local.get 2
      i32.add
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    end
    local.get 3
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $map_mapper_entry_or_insert_with_key (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132670
    i32.const 13
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 32
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_map..MapMapperFeatures$GT$10map_mapper17h9e807147f6a8b57bE
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 32
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        br_if 0 (;@2;)
        local.get 0
        i32.const 8
        i32.add
        local.get 0
        i32.load offset=20
        local.tee 1
        local.get 0
        i32.const 24
        i32.add
        i32.load
        local.get 1
        local.get 2
        i32.add
        call $_ZN13multiversx_sc7storage7mappers10map_mapper29VacantEntry$LT$SA$C$K$C$V$GT$6insert17hd79f47863aab386aE
        local.get 0
        i32.load offset=12
        local.set 1
        local.get 0
        i32.load offset=8
        local.set 2
        br 1 (;@1;)
      end
      local.get 0
      i32.const 24
      i32.add
      i32.load
      local.set 1
      local.get 0
      i32.load offset=20
      local.set 2
    end
    local.get 2
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_view (type 10)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 1
    local.get 0
    i32.const 32
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 24
    i32.add
    local.get 0
    i32.const 32
    i32.add
    i32.const 4
    i32.or
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    local.get 0
    i64.load offset=24
    i64.store offset=48
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    i32.store offset=56
    local.get 0
    i32.const 80
    i32.add
    i32.const 4
    i32.or
    local.set 2
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.const 16
        i32.add
        local.get 0
        i32.const 48
        i32.add
        call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
        local.get 0
        i32.load offset=16
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 112
        i32.add
        local.get 0
        i32.load offset=56
        local.tee 3
        i32.load
        local.get 3
        i32.const 8
        i32.add
        i32.load
        local.get 0
        i32.load offset=20
        local.tee 4
        call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E
        local.get 0
        i32.const 64
        i32.add
        local.get 0
        i32.const 112
        i32.add
        call $_ZN4core6option15Option$LT$T$GT$6unwrap17h325328b8dfa53392E
        local.get 0
        i32.const 80
        i32.add
        i32.const 8
        i32.add
        local.get 0
        i32.const 64
        i32.add
        i32.const 8
        i32.add
        i32.load
        i32.store
        local.get 0
        local.get 0
        i64.load offset=64
        i64.store offset=80
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
        local.get 0
        local.get 0
        i64.load offset=8
        i64.store offset=96
        local.get 0
        local.get 0
        i32.const 80
        i32.add
        i32.store offset=104
        loop  ;; label = @3
          local.get 0
          i32.const 112
          i32.add
          local.get 0
          i32.const 96
          i32.add
          call $_ZN126_$LT$multiversx_sc..storage..mappers..map_mapper..Iter$LT$SA$C$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he1f9d2d5c0507b34E
          local.get 0
          i32.load offset=112
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=120
          local.set 3
          local.get 0
          i32.load offset=116
          local.set 5
          local.get 1
          local.get 4
          call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
          local.get 1
          local.get 5
          call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
          local.get 1
          local.get 3
          call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
          br 0 (;@3;)
        end
      end
    end
    local.get 0
    local.get 1
    i32.store offset=112
    local.get 0
    i32.const 112
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17h25b3306e4de308e4E
    local.get 0
    i32.const 128
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_insert_default (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6insert17hf8c674998b013d90E
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_contains_key (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.load
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_get (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=24
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E
    block  ;; label = @1
      local.get 0
      i32.load offset=32
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 56
      i32.add
      local.get 0
      i32.const 44
      i32.add
      i32.load
      i32.store
      local.get 0
      local.get 0
      i64.load offset=36 align=4
      i64.store offset=48
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
      local.set 1
      local.get 0
      local.get 0
      i32.const 48
      i32.add
      i32.const 4
      i32.or
      call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
      local.get 0
      local.get 0
      i64.load
      i64.store offset=64
      local.get 0
      local.get 0
      i32.const 48
      i32.add
      i32.store offset=72
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.const 80
          i32.add
          local.get 0
          i32.const 64
          i32.add
          call $_ZN126_$LT$multiversx_sc..storage..mappers..map_mapper..Iter$LT$SA$C$K$C$V$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17he1f9d2d5c0507b34E
          local.get 0
          i32.load offset=80
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.load offset=88
          local.set 2
          local.get 1
          local.get 0
          i32.load offset=84
          call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
          local.get 1
          local.get 2
          call $_ZN13multiversx_sc5types7managed11multi_value19multi_value_encoded30MultiValueEncoded$LT$M$C$T$GT$4push17hc9c78770913dfdeaE
          br 0 (;@3;)
        end
      end
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 0
      i32.const 12
      i32.add
      call $_ZN13multiversx_sc2io6finish12finish_multi17h25b3306e4de308e4E
      local.get 0
      i32.const 96
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 132864
    i32.const 11
    call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
    unreachable)
  (func $map_storage_mapper_insert_value (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132534
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 2
    i32.const 132640
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    local.get 0
    i32.const 32
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 48
    i32.add
    local.get 0
    i32.load offset=32
    local.get 0
    i32.load offset=40
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E
    block  ;; label = @1
      local.get 0
      i32.load offset=48
      br_if 0 (;@1;)
      i32.const 132864
      i32.const 11
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 0
    i32.const 72
    i32.add
    local.get 0
    i32.const 60
    i32.add
    i32.load
    i32.store
    local.get 0
    local.get 0
    i64.load offset=52 align=4
    i64.store offset=64
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 64
    i32.add
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    local.get 0
    i64.load offset=8
    i64.store offset=20 align=4
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17h2511762708e48e25E
    local.get 0
    i32.const 80
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_get_value (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132534
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 32
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 48
    i32.add
    local.get 0
    i32.load offset=32
    local.get 0
    i32.load offset=40
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E
    block  ;; label = @1
      local.get 0
      i32.load offset=48
      br_if 0 (;@1;)
      i32.const 132864
      i32.const 11
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=52
    local.get 0
    i32.const 60
    i32.add
    i32.load
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    local.get 0
    i64.load offset=8
    i64.store offset=20 align=4
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17h2511762708e48e25E
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_remove (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=4
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6remove17h39982222b32934abE
      local.tee 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      i32.add
      local.get 0
      i32.load offset=8
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$24get_mapped_storage_value17h8ffeb03c4ee7d558E
      local.get 0
      i32.const 16
      i32.add
      call $_ZN150_$LT$multiversx_sc..storage..mappers..map_mapper..MapMapper$LT$SA$C$K$C$V$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageClearable$GT$5clear17h020950ea0eca9897E
    end
    local.get 2
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_clear (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 16
    i32.add
    i32.const 4
    i32.or
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    local.get 0
    i64.load offset=8
    i64.store offset=32
    local.get 0
    local.get 0
    i32.const 16
    i32.add
    i32.store offset=40
    local.get 0
    i32.const 48
    i32.add
    i32.const 4
    i32.or
    local.set 1
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.const 32
        i32.add
        call $_ZN124_$LT$multiversx_sc..storage..mappers..queue_mapper..Iter$LT$SA$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17hd7d92a046b3b0145E
        local.get 0
        i32.load
        i32.const 1
        i32.ne
        br_if 1 (;@1;)
        local.get 0
        i32.const 64
        i32.add
        local.get 0
        i32.load offset=40
        local.tee 2
        i32.load
        local.get 2
        i32.const 8
        i32.add
        i32.load
        local.get 0
        i32.load offset=4
        call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper34MapStorageMapper$LT$SA$C$K$C$V$GT$3get17h105263cc24e54c39E
        local.get 1
        local.get 0
        i32.const 64
        i32.add
        call $_ZN4core6option15Option$LT$T$GT$6unwrap17h325328b8dfa53392E
        local.get 0
        i32.const 64
        i32.add
        i32.const 8
        i32.add
        local.get 1
        i32.const 8
        i32.add
        i32.load
        i32.store
        local.get 0
        local.get 1
        i64.load align=4
        i64.store offset=64
        local.get 0
        i32.const 64
        i32.add
        call $_ZN150_$LT$multiversx_sc..storage..mappers..map_mapper..MapMapper$LT$SA$C$K$C$V$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageClearable$GT$5clear17h020950ea0eca9897E
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 16
    i32.add
    call $_ZN146_$LT$multiversx_sc..storage..mappers..set_mapper..SetMapper$LT$SA$C$T$GT$$u20$as$u20$multiversx_sc..storage..mappers..mapper..StorageClearable$GT$5clear17h7533420ad96c9fe6E
    local.get 0
    i32.const 80
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_entry_or_default_update_increment (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132534
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 2
    i32.const 132654
    i32.const 9
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    local.get 0
    i32.const 48
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.const 48
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    local.get 0
    i32.const 24
    i32.add
    local.get 0
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h320e522439c99b2aE
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.load offset=24
    local.get 0
    i32.load offset=28
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17h6d14ea0f43547547E
    local.get 0
    i32.const 48
    i32.add
    local.get 0
    i32.const 32
    i32.add
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 48
    i32.add
    call $_ZN13multiversx_sc7storage7mappers10map_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h10d6cde70efcba7fE
    local.get 0
    i32.load offset=20
    local.set 1
    local.get 0
    i32.load offset=16
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    local.get 1
    local.get 2
    local.get 3
    local.get 2
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17hccd25bbce30d55fbE
    i32.add
    local.tee 3
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    local.get 3
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_entry_and_modify_increment_or_default (type 10)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    local.set 1
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 1
    i32.const 132534
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    i32.const 2
    i32.const 132640
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 4
    i32.const 3
    i32.const 132859
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 5
    local.get 0
    i32.const 64
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 48
    i32.add
    local.get 0
    i32.const 64
    i32.add
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=48
        br_if 0 (;@2;)
        local.get 0
        local.get 0
        i64.load offset=52 align=4
        i64.store offset=36 align=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 80
      i32.add
      local.get 0
      i32.load offset=52
      local.tee 1
      local.get 0
      i32.const 48
      i32.add
      i32.const 8
      i32.add
      i32.load
      local.tee 2
      call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17h6d14ea0f43547547E
      local.get 0
      i32.const 24
      i32.add
      local.get 0
      i32.const 80
      i32.add
      local.get 3
      local.get 4
      call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
      local.get 0
      i32.const 32
      i32.add
      i32.const 8
      i32.add
      local.get 2
      i32.store
      local.get 0
      local.get 1
      i32.store offset=36
      i32.const 1
      local.set 1
    end
    local.get 0
    local.get 1
    i32.store offset=32
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h320e522439c99b2aE
    local.get 0
    i32.const 80
    i32.add
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=20
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17h6d14ea0f43547547E
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=80
    local.get 0
    i32.load offset=88
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$3get17h7639c87c4b95cbadE
    local.get 0
    i32.load offset=12
    local.get 5
    local.get 0
    i32.load offset=8
    select
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 96
    i32.add
    global.set $__stack_pointer)
  (func $map_storage_mapper_entry_or_default_update (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132534
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    i32.const 2
    i32.const 132640
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 3
    local.get 0
    i32.const 16
    i32.add
    call $_ZN90_$LT$C$u20$as$u20$basic_features..storage_mapper_map_storage..MapStorageMapperFeatures$GT$18map_storage_mapper17hce7ff03848efcbdfE
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.const 16
    i32.add
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$5entry17h47bdebff7d922d19E
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper23Entry$LT$SA$C$K$C$V$GT$10or_default17h320e522439c99b2aE
    local.get 0
    i32.const 32
    i32.add
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc7storage7mappers18map_storage_mapper31OccupiedEntry$LT$SA$C$K$C$V$GT$3get17h6d14ea0f43547547E
    local.get 0
    local.get 0
    i32.const 32
    i32.add
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers10map_mapper27MapMapper$LT$SA$C$K$C$V$GT$6insert17ha243711d754d3b4eE
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN78_$LT$T$u20$as$u20$multiversx_sc_codec..multi..top_en_multi..TopEncodeMulti$GT$26multi_encode_or_handle_err17h9e3874665d568637E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $set_mapper (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_set..SetMapperFeatures$GT$10set_mapper17h24b9928a871b4adaE
    local.get 0
    local.get 0
    i64.load offset=16
    i64.store offset=24
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.const 24
    i32.add
    i32.const 4
    i32.or
    call $_ZN13multiversx_sc7storage7mappers12queue_mapper25QueueMapper$LT$SA$C$T$GT$4iter17h0c2cc3e51d76034fE
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    call $_ZN19multiversx_sc_codec5multi12top_en_multi31multi_encode_iter_or_handle_err17h58dbdf45f9b1b4faE
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $set_mapper_insert (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_set..SetMapperFeatures$GT$10set_mapper17h24b9928a871b4adaE
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6insert17hf8c674998b013d90E
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $set_mapper_contains (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_set..SetMapperFeatures$GT$10set_mapper17h24b9928a871b4adaE
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$8contains17h4b37bb1d1fed94bfE
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $set_mapper_remove (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_set..SetMapperFeatures$GT$10set_mapper17h24b9928a871b4adaE
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10set_mapper23SetMapper$LT$SA$C$T$GT$6remove17h39982222b32934abE
    i64.extend_i32_u
    call $smallIntFinishSigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $map_my_single_value_mapper (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hba1405c72ada0b45E
    call $bigIntFinishSigned)
  (func $my_single_value_mapper_increment_1 (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    local.set 1
    local.get 1
    local.get 1
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hba1405c72ada0b45E
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators114_$LT$impl$u20$core..ops..arith..Add$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$3add17hcf7081b25b87fea7E
    call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hf2db335a83e0842bE)
  (func $my_single_value_mapper_increment_2 (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    local.tee 1
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17hba1405c72ada0b45E
    local.tee 2
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators194_$LT$impl$u20$core..ops..arith..AddAssign$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$10add_assign17h109fbe5240173903E
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hf2db335a83e0842bE)
  (func $my_single_value_mapper_subtract_with_require (type 10)
    (local i32 i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    block  ;; label = @1
      call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
      local.tee 1
      call $_ZN13multiversx_sc7storage11storage_get11storage_get17hba1405c72ada0b45E
      local.tee 2
      local.get 0
      call $_ZN26multiversx_sc_wasm_adapter3api13managed_types16big_int_api_node147_$LT$impl$u20$multiversx_sc..api..managed_types..big_int_api..BigIntApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$6bi_cmp17h9f5e1c81ea1f6e99E
      i32.const 255
      i32.and
      i32.const 2
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 132751
      i32.const 16
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 2
    local.get 0
    call $_ZN13multiversx_sc5types7managed5basic17big_int_operators194_$LT$impl$u20$core..ops..arith..SubAssign$LT$$RF$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$$u20$for$u20$multiversx_sc..types..managed..basic..big_int..BigInt$LT$M$GT$$GT$10sub_assign17h644c256208b47b5eE
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hf2db335a83e0842bE)
  (func $my_single_value_mapper_set_if_empty (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2fac95f35e90ceacE
    local.set 0
    block  ;; label = @1
      call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
      local.tee 1
      call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$8is_empty17h4953e8b6d13380e9E
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      call $_ZN13multiversx_sc7storage11storage_set11storage_set17h928a09f00b89c410E
    end)
  (func $clear_single_value_mapper (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E)
  (func $get_from_address_single_value_mapper (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$8is_empty17h4953e8b6d13380e9E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $is_empty_at_address_single_value_mapper (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    call $_ZN13multiversx_sc7storage24storage_get_from_address28storage_get_len_from_address17h1dde8b4d26c0591bE
    i32.eqz
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $raw_byte_length_single_value_mapper (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN86_$LT$C$u20$as$u20$basic_features..storage_mapper_single..SingleValueMapperFeatures$GT$26map_my_single_value_mapper17ha9faf19fe31a63ceE
    call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $vec_mapper (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E
    local.get 0
    i32.load offset=8
    local.set 1
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    local.set 2
    i32.const 1
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 3
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 1
        local.get 3
        call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$13get_unchecked17h02a31a6bd2b6ad4fE
        i64.extend_i32_u
        call $smallIntFinishUnsigned
        local.get 3
        i32.const 1
        i32.add
        local.set 3
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $vec_mapper_push (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132636
    i32.const 4
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E
    local.get 0
    i32.load offset=8
    local.get 0
    i32.load offset=12
    local.tee 2
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    i32.const 1
    i32.add
    local.tee 3
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$8item_key17h3bc772177fe82250E
    local.get 1
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
    local.get 2
    local.get 3
    i64.extend_i32_u
    call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $vec_mapper_get (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=8
        local.set 2
        local.get 0
        i32.load offset=12
        call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
        local.get 1
        i32.ge_u
        br_if 1 (;@1;)
      end
      i32.const 133577
      i32.const 18
      call $signalError
      unreachable
    end
    local.get 2
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$13get_unchecked17h02a31a6bd2b6ad4fE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $vec_mapper_get_at_address (type 10)
    (local i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    i32.const 1
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=8
        local.set 3
        local.get 0
        i32.load offset=12
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$14len_at_address17hc738efff9db16961E
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$8item_key17h3bc772177fe82250E
        call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h500d9516707dafa6E
        local.tee 4
        i64.const 4294967296
        i64.lt_u
        br_if 1 (;@1;)
        i32.const 131109
        i32.const 14
        call $_ZN147_$LT$multiversx_sc..storage..storage_get..StorageGetErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17h1a9c83d48fd8bd2aE
        unreachable
      end
      i32.const 133577
      i32.const 18
      call $signalError
      unreachable
    end
    local.get 4
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $vec_mapper_len (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $vec_mapper_len_at_address (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN75_$LT$C$u20$as$u20$basic_features..storage_mapper_vec..VecMapperFeatures$GT$10vec_mapper17hd7eb0e05729b41c9E
    local.get 0
    i32.load offset=12
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$14len_at_address17hc738efff9db16961E
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $token_attributes_set (type 10)
    (local i32 i32 i64 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 2
    local.get 0
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9ed6b475c1151372E
    local.get 0
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 40
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=32
    i64.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E
            local.tee 3
            local.get 1
            call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E
            br_if 0 (;@4;)
            local.get 3
            call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_counter17h7c65f14fbb83c6dfE
            call $_ZN13multiversx_sc7storage11storage_get11storage_get17hb86693f2ec665886E
            local.tee 4
            i32.const 255
            i32.and
            i32.const 255
            i32.eq
            br_if 2 (;@2;)
            local.get 3
            local.get 1
            call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_mapping17hfaaed8249d7ebe81E
            local.get 4
            i32.const 1
            i32.add
            local.tee 1
            i64.extend_i32_u
            i64.const 255
            i64.and
            local.tee 5
            call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
            local.get 3
            call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_id_counter17h7c65f14fbb83c6dfE
            local.get 5
            call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hc4a717417c92c9ddE
            br 1 (;@3;)
          end
          local.get 3
          local.get 1
          call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E
          local.set 1
        end
        local.get 3
        local.get 1
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26has_token_attributes_value17h47f6e78dffc5fe10E
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        local.get 2
        local.get 0
        i32.const 8
        i32.add
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26set_token_attributes_value17h0bf19cdc875039feE
        local.get 3
        local.get 1
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31set_attributes_to_nonce_mapping17h6a8bd573bad1a718E
        local.get 0
        i32.const 48
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 132249
      i32.const 87
      call $signalError
      unreachable
    end
    i32.const 132336
    i32.const 23
    call $signalError
    unreachable)
  (func $token_attributes_update (type 10)
    (local i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 2
    local.get 0
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9ed6b475c1151372E
    local.get 0
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=32
    i64.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        call $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E
        local.tee 3
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 3
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E
        local.tee 1
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26has_token_attributes_value17h47f6e78dffc5fe10E
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 24
        i32.add
        local.get 3
        local.get 1
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26get_token_attributes_value17h724467a1cba2c2b7E
        local.get 3
        local.get 1
        local.get 0
        i32.const 24
        i32.add
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$33clear_attributes_to_nonce_mapping17he7d378473610a5ecE
        local.get 3
        local.get 1
        local.get 2
        local.get 0
        i32.const 8
        i32.add
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26set_token_attributes_value17h0bf19cdc875039feE
        local.get 3
        local.get 1
        local.get 0
        i32.const 8
        i32.add
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31set_attributes_to_nonce_mapping17h6a8bd573bad1a718E
        local.get 0
        i32.const 48
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 132176
      i32.const 16
      call $signalError
      unreachable
    end
    i32.const 132192
    i32.const 30
    call $signalError
    unreachable)
  (func $token_attributes_get_attributes (type 10)
    (local i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        call $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E
        local.tee 3
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 3
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E
        local.tee 1
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26has_token_attributes_value17h47f6e78dffc5fe10E
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.const 8
        i32.add
        local.get 3
        local.get 1
        local.get 2
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26get_token_attributes_value17h724467a1cba2c2b7E
        local.get 0
        call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
        local.get 0
        local.get 0
        i32.load8_u offset=4
        i32.store8 offset=28
        local.get 0
        local.get 0
        i32.load
        i32.store offset=24
        local.get 0
        i32.load offset=16
        local.get 0
        i32.const 24
        i32.add
        call $_ZN137_$LT$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h4d49730846728635E
        local.get 0
        i64.load offset=8
        local.get 0
        i32.const 24
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned86_$LT$impl$u20$multiversx_sc_codec..single..nested_en..NestedEncode$u20$for$u20$u64$GT$24dep_encode_or_handle_err17haf0e4ddeee76cd59E
        local.get 0
        i32.const 20
        i32.add
        local.get 0
        i32.const 24
        i32.add
        call $_ZN149_$LT$multiversx_sc..types..managed..wrapped..managed_vec..ManagedVec$LT$M$C$T$GT$$u20$as$u20$multiversx_sc_codec..single..nested_en..NestedEncode$GT$24dep_encode_or_handle_err17h6d48d6aae08a804eE
        local.get 0
        i32.load offset=24
        local.get 0
        i32.load8_u offset=28
        call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
        local.get 0
        i32.const 32
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 132176
      i32.const 16
      call $signalError
      unreachable
    end
    i32.const 132192
    i32.const 30
    call $signalError
    unreachable)
  (func $token_attributes_get_nonce (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    local.get 0
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9ed6b475c1151372E
    local.get 0
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.get 0
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    i64.load
    i64.store
    local.get 0
    local.get 0
    i64.load offset=32
    i64.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        call $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E
        local.tee 2
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 2
        local.get 1
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E
        local.tee 1
        local.get 0
        i32.const 8
        i32.add
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31build_key_attr_to_nonce_mapping17ha72c60a9d5e5584aE
        call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        local.get 1
        local.get 0
        i32.const 8
        i32.add
        call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31build_key_attr_to_nonce_mapping17ha72c60a9d5e5584aE
        call $_ZN19multiversx_sc_codec6single12top_de_input14TopDecodeInput8into_u6417h6ed55561773af550E
        call $smallIntFinishUnsigned
        local.get 0
        i32.const 48
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 132176
      i32.const 16
      call $signalError
      unreachable
    end
    i32.const 132192
    i32.const 30
    call $signalError
    unreachable)
  (func $token_attributes_clear (type 10)
    (local i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 2
    block  ;; label = @1
      call $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E
      local.tee 3
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 3
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E
      local.tee 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26has_token_attributes_value17h47f6e78dffc5fe10E
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26get_token_attributes_value17h724467a1cba2c2b7E
      local.get 3
      local.get 1
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$26build_key_token_attr_value17ha05544d098c5e26cE
      call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E
      local.get 3
      local.get 1
      local.get 0
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$33clear_attributes_to_nonce_mapping17he7d378473610a5ecE
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $token_attributes_has_attributes (type 10)
    (local i64 i32 i64 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i64.const 1
    local.set 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 2
    block  ;; label = @1
      call $_ZN100_$LT$C$u20$as$u20$basic_features..storage_mapper_token_attributes..TokenAttributesMapperFeatures$GT$16token_attributes17h5b763cfc168babb4E
      local.tee 3
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17has_mapping_value17h213142450efe7d23E
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 3
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$17get_mapping_value17h58b73d0abcb9be06E
      local.get 2
      call $_ZN13multiversx_sc7storage7mappers5token23token_attributes_mapper31TokenAttributesMapper$LT$SA$GT$31is_empty_token_attributes_value17h72ffcdaf28da131bE
      i64.extend_i32_u
      local.set 0
    end
    local.get 0
    call $smallIntFinishSigned)
  (func $add_to_whitelist (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 0
    call $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$21build_mapper_for_item17hcefd869fbc364a86E
    call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hb404350c984485d8E)
  (func $remove_from_whitelist (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 0
    call $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$21build_mapper_for_item17hcefd869fbc364a86E
    call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E)
  (func $check_contains (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 0
    call $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$8contains17h34c0d10949f7e852E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $check_contains_at_address (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 1
    call $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE
    local.get 0
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$19contains_at_address17hadd3e477e50dbdafE
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $require_contains (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 0
    block  ;; label = @1
      call $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE
      local.get 0
      call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$8contains17h34c0d10949f7e852E
      br_if 0 (;@1;)
      i32.const 133595
      i32.const 20
      call $signalError
      unreachable
    end)
  (func $require_contains_at_address (type 10)
    (local i32 i32)
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132688
    i32.const 7
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 1
    block  ;; label = @1
      call $_ZN94_$LT$C$u20$as$u20$basic_features..storage_mapper_whitelist..StorageMapperWhitelistFeatures$GT$16whitelist_mapper17hed023334c272409eE
      local.get 0
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers16whitelist_mapper29WhitelistMapper$LT$SA$C$T$GT$19contains_at_address17hadd3e477e50dbdafE
      br_if 0 (;@1;)
      i32.const 133595
      i32.const 20
      call $signalError
      unreachable
    end)
  (func $issue_fungible_default_callback (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $_ZN13multiversx_sc2io15call_value_init12payable_egld17he6fc7aa766a1fbe7E
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$10egld_value17h96645c8318260081E
    local.set 3
    local.get 0
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 3
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_ref23ManagedRef$LT$M$C$T$GT$11clone_value17h059ee3f32c3cec90E
    local.set 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 4
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    i32.load offset=8
    local.get 3
    local.get 4
    local.get 1
    local.get 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$5issue17h486fab84a065764cE
    unreachable)
  (func $issue_fungible_custom_callback (type 10)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $_ZN13multiversx_sc2io15call_value_init12payable_egld17he6fc7aa766a1fbe7E
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$10egld_value17h96645c8318260081E
    local.set 3
    local.get 2
    call $_ZN4core3cmp10PartialOrd2gt17h91d47ae8b32d5acfE
    local.set 4
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 5
    local.get 0
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 3
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_ref23ManagedRef$LT$M$C$T$GT$11clone_value17h059ee3f32c3cec90E
    local.set 3
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 6
    local.get 0
    local.get 5
    i32.store offset=24
    local.get 0
    i32.const 31
    i32.const 27
    local.get 4
    select
    i32.store offset=20
    local.get 0
    i32.const 132920
    i32.const 132893
    local.get 4
    select
    i32.store offset=16
    local.get 0
    i32.load offset=8
    local.get 3
    local.get 6
    local.get 1
    local.get 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$5issue17h486fab84a065764cE
    unreachable)
  (func $issue_and_set_all_roles_fungible (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $_ZN13multiversx_sc2io15call_value_init12payable_egld17he6fc7aa766a1fbe7E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 1
    call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$10egld_value17h96645c8318260081E
    local.set 2
    local.get 0
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_ref23ManagedRef$LT$M$C$T$GT$11clone_value17h059ee3f32c3cec90E
    local.set 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 3
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    i32.load offset=8
    local.get 2
    local.get 3
    local.get 1
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$23issue_and_set_all_roles17h03e8bec7db1fe316E
    unreachable)
  (func $set_local_roles_fungible (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 513
    i32.store16 offset=14 align=1
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 0
    local.get 1
    i32.store offset=40
    local.get 0
    i32.const 18
    i32.store offset=36
    local.get 0
    i32.const 132875
    i32.store offset=32
    local.get 0
    i32.const 16
    i32.add
    local.get 0
    i32.const 14
    i32.add
    local.get 0
    i32.const 32
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper15set_local_roles17h212856cd0e2cd002E
    unreachable)
  (func $mint_fungible (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    i32.const 16
    i32.add
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 0
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=20
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$4mint17h776729043b73506cE
    local.get 0
    call $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $mint_and_send_fungible (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132957
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 0
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=20
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$4mint17h776729043b73506cE
    local.get 1
    local.get 0
    i32.load offset=8
    i64.const 0
    local.get 0
    i32.load offset=12
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$11direct_esdt17h0311394dfe63b205E
    local.get 0
    call $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $burn_fungible (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 0
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
    i32.load
    i64.const 0
    local.get 1
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$15esdt_local_burn17h93be7b6fb6123224E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $get_balance_fungible (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper14get_sc_address17h47b974f167790997E
    local.get 0
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
    i32.load
    i64.const 0
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$16get_esdt_balance17h5cf2e2cb12b5913bE
    call $bigIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $require_same_token_fungible (type 10)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$11single_esdt17h61d1bb6da76ff2a0E
    local.get 0
    local.get 0
    i32.load offset=24
    i32.store offset=12
    local.get 0
    i32.const 16
    i32.add
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    block  ;; label = @1
      local.get 0
      i32.const 16
      i32.add
      call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
      local.get 0
      i32.const 12
      i32.add
      call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2ne17h54a502195d29870dE
      i32.eqz
      br_if 0 (;@1;)
      i32.const 132079
      i32.const 21
      call $signalError
      unreachable
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $require_all_same_token_fungible (type 10)
    (local i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$18all_esdt_transfers17h44369989367028d0E
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    local.get 0
    i32.const 32
    i32.add
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
    local.set 3
    local.get 1
    call $mBufferGetLength
    local.set 4
    i32.const 0
    local.set 5
    block  ;; label = @1
      loop  ;; label = @2
        local.get 5
        i32.const 16
        i32.add
        local.tee 6
        local.get 4
        i32.gt_u
        br_if 1 (;@1;)
        local.get 2
        i64.const 0
        i64.store
        local.get 0
        i64.const 0
        i64.store offset=24
        local.get 1
        local.get 5
        local.get 0
        i32.const 24
        i32.add
        i32.const 16
        call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
        drop
        local.get 0
        i32.const 0
        i32.store offset=44
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.const 44
        i32.add
        call $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17hbb82ce74e82cb65eE
        local.set 5
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.const 44
        i32.add
        call $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17h9805ebbc78b5072fE
        local.set 7
        local.get 0
        local.get 0
        i32.const 24
        i32.add
        local.get 0
        i32.const 44
        i32.add
        call $_ZN13multiversx_sc5types7managed7wrapped18esdt_token_payment27managed_vec_item_from_slice17hbb82ce74e82cb65eE
        i32.store offset=36
        local.get 0
        local.get 5
        i32.store offset=32
        local.get 0
        local.get 7
        i64.store offset=24
        block  ;; label = @3
          local.get 3
          local.get 2
          call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2ne17h54a502195d29870dE
          br_if 0 (;@3;)
          local.get 6
          local.set 5
          br 1 (;@2;)
        end
      end
      i32.const 132079
      i32.const 21
      call $signalError
      unreachable
    end
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $getFungibleTokenId (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper8is_empty17h44cbef184c4fb8aeE
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.get 0
        i32.load offset=4
        call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12get_token_id17h8110bef35cbac080E
        local.set 1
        br 1 (;@1;)
      end
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
      local.set 1
    end
    local.get 1
    call $mBufferFinish
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $issue_and_set_all_roles_meta (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $_ZN13multiversx_sc2io15call_value_init12payable_egld17he6fc7aa766a1fbe7E
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    local.set 1
    call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$10egld_value17h96645c8318260081E
    local.set 2
    local.get 0
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    local.get 2
    call $_ZN13multiversx_sc5types7managed7wrapped11managed_ref23ManagedRef$LT$M$C$T$GT$11clone_value17h059ee3f32c3cec90E
    local.set 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 3
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    i32.load offset=8
    local.get 2
    local.get 3
    local.get 1
    local.get 0
    i32.const 16
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$23issue_and_set_all_roles17ha298e6199f5b93deE
    unreachable)
  (func $mapper_nft_set_token_id (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17hcff0c3cf1fd54d06E
    local.set 1
    local.get 0
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=4
        call $_ZN124_$LT$multiversx_sc..storage..mappers..token..token_mapper_state..TokenMapperState$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h1bc1edb4a433f0ddE
        i32.const 2
        i32.eq
        br_if 0 (;@2;)
        local.get 1
        call $_ZN13multiversx_sc5types7managed7wrapped16token_identifier24TokenIdentifier$LT$M$GT$24is_valid_esdt_identifier17hddb8bf3558d37511E
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=8
        i32.const 2
        local.get 1
        call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
        call $_ZN13multiversx_sc7storage11storage_set11storage_set17h3807f0ebd9eb569fE
        local.get 0
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 132019
      i32.const 20
      call $signalError
      unreachable
    end
    i32.const 132063
    i32.const 16
    call $signalError
    unreachable)
  (func $mapper_nft_create (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 1
    local.get 0
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h47bb5879ee050567E
    local.tee 2
    i32.const 16
    i32.shr_u
    i32.store8 offset=26
    local.get 0
    local.get 2
    i32.store16 offset=24
    local.get 0
    i32.const 32
    i32.add
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=32
    local.get 0
    i32.load offset=36
    local.get 1
    local.get 0
    i32.const 24
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$10nft_create17h54d794faba160b53E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $mapper_nft_create_and_send (type 10)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132957
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    local.get 0
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h47bb5879ee050567E
    local.tee 3
    i32.const 16
    i32.shr_u
    i32.store8 offset=26
    local.get 0
    local.get 3
    i32.store16 offset=24
    local.get 0
    i32.const 32
    i32.add
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    local.get 0
    i32.const 8
    i32.add
    local.get 0
    i32.load offset=32
    local.get 0
    i32.load offset=36
    local.get 2
    local.get 0
    i32.const 24
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$10nft_create17h54d794faba160b53E
    local.get 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$12send_payment17h0f13ef3af5c23b07E
    local.get 0
    i32.const 8
    i32.add
    call $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E
    local.get 0
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $mapper_nft_add_quantity (type 10)
    (local i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    local.get 0
    i32.const 16
    i32.add
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    local.get 0
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$16nft_add_quantity17h180892f51dfa2f45E
    local.get 0
    call $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $mapper_nft_add_quantity_and_send (type 10)
    (local i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132957
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9d6e2343a475882dE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 2
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 3
    local.get 0
    i32.const 16
    i32.add
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    local.get 0
    local.get 0
    i32.load offset=16
    local.get 0
    i32.load offset=20
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$16nft_add_quantity17h180892f51dfa2f45E
    local.get 1
    local.get 0
    call $_ZN13multiversx_sc7storage7mappers5token25non_fungible_token_mapper32NonFungibleTokenMapper$LT$SA$GT$12send_payment17h0f13ef3af5c23b07E
    local.get 0
    call $_ZN13multiversx_sc2io6finish12finish_multi17hb13075b3cb540031E
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $mapper_nft_burn (type 10)
    (local i32 i64 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 1
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h3e032062ac602271E
    local.set 2
    local.get 0
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    local.get 0
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
    i32.load
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc13contract_base8wrappers12send_wrapper20SendWrapper$LT$A$GT$15esdt_local_burn17h93be7b6fb6123224E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $mapper_nft_get_balance (type 10)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 1
    local.get 0
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper14get_sc_address17h47b974f167790997E
    local.get 0
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
    i32.load
    local.get 1
    call $_ZN13multiversx_sc13contract_base8wrappers18blockchain_wrapper26BlockchainWrapper$LT$A$GT$16get_esdt_balance17h5cf2e2cb12b5913bE
    call $bigIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $mapper_get_token_attributes (type 10)
    (local i32 i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h450e71b1ca7211deE
    local.set 1
    local.get 0
    i32.const 8
    i32.add
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    call $_ZN13multiversx_sc7storage7mappers5token12token_mapper19StorageTokenWrapper14get_sc_address17h47b974f167790997E
    local.set 2
    local.get 0
    i32.const 8
    i32.add
    call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$16get_token_id_ref17h082d125424947754E
    local.set 3
    i64.const 0
    call $bigIntNew
    local.set 4
    call $mBufferNew
    local.set 5
    call $mBufferNew
    local.set 6
    call $mBufferNew
    local.set 7
    call $mBufferNew
    local.set 8
    call $mBufferNew
    local.set 9
    i64.const 0
    call $bigIntNew
    local.set 10
    call $mBufferNew
    local.set 11
    local.get 2
    local.get 3
    i32.load
    local.get 1
    local.get 4
    local.get 5
    local.get 6
    local.get 7
    local.get 8
    local.get 9
    local.get 10
    local.get 11
    call $managedGetESDTTokenData
    block  ;; label = @1
      local.get 9
      call $mBufferGetLength
      br_if 0 (;@1;)
      local.get 9
      i32.const 131313
      i32.const 32
      call $mBufferSetBytes
      drop
    end
    local.get 0
    i32.const 0
    i32.store16 offset=24
    local.get 5
    i32.const 0
    local.get 0
    i32.const 24
    i32.add
    i32.const 2
    call $_ZN26multiversx_sc_wasm_adapter3api13managed_types23managed_buffer_api_node161_$LT$impl$u20$multiversx_sc..api..managed_types..managed_buffer_api..ManagedBufferApiImpl$u20$for$u20$multiversx_sc_wasm_adapter..api..vm_api_node..VmApiImpl$GT$13mb_load_slice17hc2edb9396bd3c947E
    drop
    local.get 0
    i32.const 24
    i32.add
    local.get 8
    call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
    call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
    local.get 0
    i32.const 24
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u8$GT$24dep_decode_or_handle_err17h6c68fd250646181aE
    local.set 9
    local.get 0
    i32.const 24
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u8$GT$24dep_decode_or_handle_err17h6c68fd250646181aE
    local.set 5
    local.get 0
    i32.const 24
    i32.add
    call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned85_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$u8$GT$24dep_decode_or_handle_err17h6c68fd250646181aE
    local.set 8
    block  ;; label = @1
      local.get 0
      i32.load offset=28
      local.get 0
      i32.load offset=24
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.const 40
        i32.add
        i32.load8_u
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.const 0
        i32.store offset=143876
        i32.const 0
        i32.const 0
        i32.store8 offset=143880
      end
      local.get 0
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$19start_nested_encode17h2395acee2d704d51E
      local.get 0
      local.get 0
      i32.load8_u offset=4
      i32.store8 offset=28
      local.get 0
      local.get 0
      i32.load
      i32.store offset=24
      local.get 0
      i32.const 24
      i32.add
      local.get 9
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.const 24
      i32.add
      local.get 5
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.const 24
      i32.add
      local.get 8
      call $_ZN19multiversx_sc_codec6single16nested_en_output18NestedEncodeOutput9push_byte17h6368672468123b02E
      local.get 0
      i32.load offset=24
      local.get 0
      i32.load8_u offset=28
      call $_ZN133_$LT$multiversx_sc..io..finish..ApiOutputAdapter$LT$FA$GT$$u20$as$u20$multiversx_sc_codec..single..top_en_output..TopEncodeOutput$GT$22finalize_nested_encode17he0350917a19bf54eE
      local.get 0
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131861
    i32.const 32
    i32.const 131109
    i32.const 14
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $getNonFungibleTokenId (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN103_$LT$C$u20$as$u20$basic_features..storage_mapper_non_fungible_token..NonFungibleTokenMapperFeatures$GT$25non_fungible_token_mapper17h044667341d94fcb8E
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=8
        call $_ZN13multiversx_sc7storage11storage_get15storage_get_len17h8f84d83164c85b9eE
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load
        local.get 0
        i32.load offset=4
        call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12get_token_id17h8110bef35cbac080E
        local.set 1
        br 1 (;@1;)
      end
      call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
      local.set 1
    end
    local.get 1
    call $mBufferFinish
    drop
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $init_unique_id_mapper (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132971
    i32.const 3
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN93_$LT$C$u20$as$u20$basic_features..storage_mapper_unique_id_mapper..UniqueIdMapperFeatures$GT$16unique_id_mapper17h1518d81790d7a134E
    block  ;; label = @1
      local.get 0
      i32.load offset=4
      call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
      i32.eqz
      br_if 0 (;@1;)
      i32.const 131987
      i32.const 15
      call $signalError
      unreachable
    end
    local.get 0
    i32.load offset=8
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$23set_internal_mapper_len17h4a6b3ac4ab8185eeE
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $unique_id_mapper_get (type 10)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN93_$LT$C$u20$as$u20$basic_features..storage_mapper_unique_id_mapper..UniqueIdMapperFeatures$GT$16unique_id_mapper17h1518d81790d7a134E
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3get17h24947d503de9919aE
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $unique_id_mapper_swap_remove (type 10)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    local.get 0
    call $_ZN93_$LT$C$u20$as$u20$basic_features..storage_mapper_unique_id_mapper..UniqueIdMapperFeatures$GT$16unique_id_mapper17h1518d81790d7a134E
    local.get 0
    i32.load offset=4
    local.tee 2
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    local.set 3
    local.get 0
    i32.load
    local.tee 4
    local.get 2
    local.get 3
    call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3get17h24947d503de9919aE
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        local.get 1
        i32.ne
        br_if 0 (;@2;)
        local.get 5
        local.set 6
        br 1 (;@1;)
      end
      local.get 4
      local.get 2
      local.get 1
      call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3get17h24947d503de9919aE
      local.set 6
      local.get 4
      local.get 2
      local.get 1
      local.get 5
      call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3set17h061fc0c935544b80E
    end
    local.get 4
    local.get 2
    local.get 3
    i32.const 0
    call $_ZN13multiversx_sc7storage7mappers10vec_mapper23VecMapper$LT$SA$C$T$GT$3set17h7ba50ad051491842E
    local.get 0
    i32.load offset=8
    local.get 3
    i32.const -1
    i32.add
    call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$23set_internal_mapper_len17h4a6b3ac4ab8185eeE
    local.get 6
    i64.extend_i32_u
    call $smallIntFinishUnsigned
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $unique_id_mapper_set (type 10)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132683
    i32.const 5
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 1
    i32.const 1
    i32.const 132969
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    local.set 2
    local.get 0
    call $_ZN93_$LT$C$u20$as$u20$basic_features..storage_mapper_unique_id_mapper..UniqueIdMapperFeatures$GT$16unique_id_mapper17h1518d81790d7a134E
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    local.get 2
    call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3set17h061fc0c935544b80E
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $unique_id_mapper (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    call $_ZN93_$LT$C$u20$as$u20$basic_features..storage_mapper_unique_id_mapper..UniqueIdMapperFeatures$GT$16unique_id_mapper17h1518d81790d7a134E
    local.get 0
    i32.load offset=4
    local.tee 1
    call $_ZN13multiversx_sc7storage11storage_get11storage_get17h03f15cb174c8db5eE
    local.set 2
    local.get 0
    i32.load
    local.set 3
    i32.const 1
    local.set 4
    block  ;; label = @1
      loop  ;; label = @2
        local.get 4
        local.get 2
        i32.gt_u
        br_if 1 (;@1;)
        local.get 3
        local.get 1
        local.get 4
        call $_ZN13multiversx_sc7storage7mappers16unique_id_mapper24UniqueIdMapper$LT$SA$GT$3get17h24947d503de9919aE
        i64.extend_i32_u
        call $smallIntFinishUnsigned
        local.get 4
        i32.const 1
        i32.add
        local.set 4
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $managed_struct_eq (type 10)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 2
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    local.get 0
    i32.const 8
    i32.add
    i32.const 0
    i32.const 132985
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h96b66bc9a55b0369E
    local.get 0
    i32.const 20
    i32.add
    i32.const 1
    i32.const 132983
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h96b66bc9a55b0369E
    local.get 0
    i32.const 28
    i32.add
    i32.load
    local.set 1
    local.get 0
    i32.const 24
    i32.add
    i32.load
    local.set 2
    local.get 0
    i32.load offset=16
    local.set 3
    local.get 0
    i32.load offset=12
    local.set 4
    i64.const 0
    local.set 5
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=20
      call $_ZN13multiversx_sc5types7managed5basic12big_uint_cmp115_$LT$impl$u20$core..cmp..PartialEq$u20$for$u20$multiversx_sc..types..managed..basic..big_uint..BigUint$LT$M$GT$$GT$2eq17h7b6d694a544a5437E
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      local.get 2
      i32.ne
      br_if 0 (;@1;)
      local.get 3
      local.get 1
      call $_ZN117_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..cmp..PartialEq$GT$2eq17h2dc0ea5cb335dda1E
      i64.extend_i32_u
      local.set 5
    end
    local.get 5
    call $smallIntFinishSigned
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $token_identifier_egld (type 10)
    call $checkNoPayment
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 131893
    i32.const 4
    call $finish)
  (func $token_identifier_is_valid_1 (type 10)
    (local i64 i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i64.const 1
    local.set 0
    block  ;; label = @1
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h253fccc17b7ddac6E
      local.tee 1
      i32.const 2147483646
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      call $_ZN13multiversx_sc5types7managed7wrapped16token_identifier24TokenIdentifier$LT$M$GT$24is_valid_esdt_identifier17hddb8bf3558d37511E
      i64.extend_i32_u
      local.set 0
    end
    local.get 0
    call $smallIntFinishSigned)
  (func $token_identifier_is_valid_2 (type 10)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h9bc4ed95022484c2E
    call $_ZN13multiversx_sc5types7managed7wrapped16token_identifier24TokenIdentifier$LT$M$GT$24is_valid_esdt_identifier17hddb8bf3558d37511E
    i64.extend_i32_u
    call $smallIntFinishSigned)
  (func $non_zero_usize_iter (type 10)
    (local i32 i64 i64 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    i32.const 0
    i32.const 132622
    i32.const 8
    call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
    i64.extend_i32_u
    local.set 1
    i64.const 0
    local.set 2
    call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
    local.set 3
    block  ;; label = @1
      loop  ;; label = @2
        local.get 1
        local.get 2
        i64.eq
        br_if 1 (;@1;)
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.tee 4
        local.get 2
        i64.const 1
        i64.add
        local.tee 2
        call $_ZN19multiversx_sc_codec6single13top_en_output15TopEncodeOutput7set_u6417hfa3da52b93bb8b38E
        local.get 3
        local.get 4
        call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
        br 0 (;@2;)
      end
    end
    local.get 0
    local.get 3
    i32.store offset=12
    local.get 0
    local.get 3
    call $mBufferGetLength
    i32.store offset=20
    local.get 0
    i32.const 0
    i32.store offset=16
    local.get 0
    local.get 0
    i32.const 12
    i32.add
    i32.store offset=24
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.get 0
        i32.const 16
        i32.add
        call $_ZN159_$LT$multiversx_sc..types..managed..wrapped..managed_vec_owned_iter..ManagedVecOwnedIterator$LT$M$C$T$GT$$u20$as$u20$core..iter..traits..iterator..Iterator$GT$4next17h24ffb2906048217eE
        local.get 0
        i32.load
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load offset=4
        call $mBufferFinish
        drop
        br 0 (;@2;)
      end
    end
    local.get 0
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $non_zero_usize_macro (type 10)
    (local i32)
    call $checkNoPayment
    i32.const 1
    call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_eq17hc1a196bd95309707E
    block  ;; label = @1
      i32.const 0
      i32.const 132630
      i32.const 6
      call $_ZN13multiversx_sc2io16arg_nested_tuple15load_single_arg17h2ac0dcb9cf23cf9bE
      local.tee 0
      br_if 0 (;@1;)
      i32.const 132608
      i32.const 14
      call $_ZN13multiversx_sc13contract_base8wrappers12error_helper20ErrorHelper$LT$M$GT$25signal_error_with_message17h056b0675ff56d523E
      unreachable
    end
    local.get 0
    i64.extend_i32_u
    call $smallIntFinishUnsigned)
  (func $callBack (type 10)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 96
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        call $_ZN13multiversx_sc5types11interaction16callback_closure22cb_closure_storage_key17haa11cf0815740a67E
        local.tee 1
        call $_ZN143_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..top_de..TopDecode$GT$24top_decode_or_handle_err17h5b4d28b09ba2cb61E
        local.tee 2
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$8is_empty17hc5b24e8932ff9064E
        br_if 0 (;@2;)
        local.get 0
        i32.const 56
        i32.add
        local.get 2
        call $_ZN115_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$core..clone..Clone$GT$5clone17h79948630dace1c5dE
        call $_ZN13multiversx_sc5types7managed10codec_util30managed_buffer_nested_de_input39ManagedBufferNestedDecodeInput$LT$M$GT$3new17h501d3b614ca2f3dbE
        local.get 0
        i32.const 56
        i32.add
        call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de..NestedDecode$GT$24dep_decode_or_handle_err17h0a916b4c9325dd9eE
        local.set 3
        local.get 0
        i32.const 56
        i32.add
        call $_ZN19multiversx_sc_codec14impl_for_types17impl_num_unsigned88_$LT$impl$u20$multiversx_sc_codec..single..nested_de..NestedDecode$u20$for$u20$usize$GT$24dep_decode_or_handle_err17hcec92b37a17bac60E
        local.set 2
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$3new17hd41c5609eb6460ccE
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            local.get 2
            i32.eqz
            br_if 1 (;@3;)
            local.get 4
            local.get 0
            i32.const 56
            i32.add
            call $_ZN149_$LT$multiversx_sc..types..managed..basic..managed_buffer..ManagedBuffer$LT$M$GT$$u20$as$u20$multiversx_sc_codec..single..nested_de..NestedDecode$GT$24dep_decode_or_handle_err17h0a916b4c9325dd9eE
            call $_ZN13multiversx_sc5types7managed7wrapped11managed_vec23ManagedVec$LT$M$C$T$GT$4push17h39df64f74eb73b39E
            local.get 2
            i32.const -1
            i32.add
            local.set 2
            br 0 (;@4;)
          end
        end
        local.get 0
        i32.load offset=60
        local.get 0
        i32.load offset=56
        i32.ne
        br_if 1 (;@1;)
        block  ;; label = @3
          local.get 0
          i32.const 72
          i32.add
          i32.load8_u
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          i32.const 0
          i32.store offset=143876
          i32.const 0
          i32.const 0
          i32.store8 offset=143880
        end
        local.get 1
        call $_ZN13multiversx_sc7storage11storage_set13storage_clear17h16905629b1865214E
        local.get 0
        local.get 3
        call $_ZN13multiversx_sc5types11interaction16callback_closure32CallbackClosureForDeser$LT$M$GT$7matcher17h575e96b74ad96fe9E
        local.get 0
        i32.load offset=32
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 56
        i32.add
        local.get 3
        call $_ZN13multiversx_sc5types11interaction16callback_closure32CallbackClosureForDeser$LT$M$GT$7matcher17h575e96b74ad96fe9E
        local.get 0
        i32.load offset=88
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 56
              i32.add
              i32.const 132893
              i32.const 27
              call $_ZN13multiversx_sc5types11interaction16callback_closure31CallbackClosureMatcher$LT$_$GT$12name_matches17h16dca0204b5d2ecaE
              br_if 0 (;@5;)
              local.get 0
              i32.const 56
              i32.add
              i32.const 132920
              i32.const 31
              call $_ZN13multiversx_sc5types11interaction16callback_closure31CallbackClosureMatcher$LT$_$GT$12name_matches17h16dca0204b5d2ecaE
              br_if 1 (;@4;)
              local.get 0
              i32.const 56
              i32.add
              i32.const 132875
              i32.const 18
              call $_ZN13multiversx_sc5types11interaction16callback_closure31CallbackClosureMatcher$LT$_$GT$12name_matches17h16dca0204b5d2ecaE
              br_if 2 (;@3;)
              local.get 0
              i32.const 40
              i32.add
              local.get 3
              local.get 4
              call $_ZN21multiversx_sc_modules23default_issue_callbacks16EndpointWrappers17callback_selector17hc9011f4612dec156E
              local.get 0
              i32.load offset=40
              i32.eqz
              br_if 3 (;@2;)
              local.get 0
              i32.const 48
              i32.add
              i32.load
              local.set 2
              local.get 0
              i32.const 56
              i32.add
              local.get 0
              i32.load offset=44
              local.tee 4
              call $_ZN13multiversx_sc5types11interaction16callback_closure32CallbackClosureForDeser$LT$M$GT$7matcher17h575e96b74ad96fe9E
              local.get 0
              i32.load offset=88
              i32.eqz
              br_if 3 (;@2;)
              local.get 0
              i32.const 40
              i32.add
              local.get 4
              local.get 2
              call $_ZN21multiversx_sc_modules23default_issue_callbacks16EndpointWrappers17callback_selector17hc9011f4612dec156E
              local.get 0
              i32.load offset=40
              i32.eqz
              br_if 3 (;@2;)
              local.get 0
              i32.const 56
              i32.add
              local.get 0
              i32.load offset=44
              local.get 0
              i32.const 48
              i32.add
              i32.load
              call $_ZN21multiversx_sc_modules23default_issue_callbacks16EndpointWrappers17callback_selector17hc9011f4612dec156E
              local.get 0
              i32.load offset=56
              i32.eqz
              br_if 3 (;@2;)
              i32.const 132554
              i32.const 54
              call $signalError
              unreachable
            end
            call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
            i32.const 0
            call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
            local.get 0
            i32.const 0
            i32.store offset=36
            local.get 0
            i32.const 40
            i32.add
            local.get 0
            i32.const 36
            i32.add
            call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h4526c6edd7c81527E
            local.get 0
            i32.load offset=36
            call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
            local.get 0
            i32.load offset=40
            local.set 2
            local.get 0
            i32.load offset=44
            local.set 1
            local.get 0
            i32.const 40
            i32.add
            local.get 4
            call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
            call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
            local.get 0
            i32.load offset=44
            local.get 0
            i32.load offset=48
            call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h576ea351e7d6f4f8E
            block  ;; label = @5
              local.get 2
              br_if 0 (;@5;)
              local.get 0
              i32.const 40
              i32.add
              call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
              local.get 0
              i32.const 40
              i32.add
              local.get 1
              call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12set_token_id17h312c53b1a2101da0E
              br 3 (;@2;)
            end
            local.get 0
            i32.const 40
            i32.add
            call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
            local.get 0
            i32.load offset=48
            call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$5clear17h816f6e1a80bff7a4E
            br 2 (;@2;)
          end
          call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
          i32.const 0
          call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
          local.get 0
          i32.const 0
          i32.store offset=36
          local.get 0
          i32.const 40
          i32.add
          local.get 0
          i32.const 36
          i32.add
          i32.const 132951
          i32.const 6
          call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h55bb0e59e98ef0eeE
          local.get 0
          i32.load offset=36
          call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
          local.get 0
          i32.load offset=40
          local.set 2
          local.get 0
          i32.const 40
          i32.add
          local.get 4
          call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
          call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
          local.get 0
          i32.load offset=44
          local.get 0
          i32.load offset=48
          call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h576ea351e7d6f4f8E
          block  ;; label = @4
            local.get 2
            br_if 0 (;@4;)
            local.get 0
            i32.const 40
            i32.add
            call $_ZN13multiversx_sc13contract_base8wrappers18call_value_wrapper25CallValueWrapper$LT$A$GT$11single_esdt17h61d1bb6da76ff2a0E
            local.get 0
            i32.load offset=48
            local.set 2
            local.get 0
            i32.const 40
            i32.add
            call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
            local.get 0
            i32.const 40
            i32.add
            local.get 2
            call $_ZN196_$LT$multiversx_sc..storage..mappers..token..fungible_token_mapper..FungibleTokenMapper$LT$SA$GT$$u20$as$u20$multiversx_sc..storage..mappers..token..token_mapper..StorageTokenWrapper$LT$SA$GT$$GT$12set_token_id17h312c53b1a2101da0E
            br 2 (;@2;)
          end
          local.get 0
          i32.const 40
          i32.add
          call $_ZN96_$LT$C$u20$as$u20$basic_features..storage_mapper_fungible_token..FungibleTokenMapperFeatures$GT$21fungible_token_mapper17hdd81d5feaab950f9E
          local.get 0
          i32.load offset=48
          call $_ZN13multiversx_sc7storage7mappers5token21fungible_token_mapper29FungibleTokenMapper$LT$SA$GT$5clear17h816f6e1a80bff7a4E
          br 1 (;@2;)
        end
        call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
        i32.const 0
        call $_ZN13multiversx_sc2io16arg_nested_tuple22check_num_arguments_ge17h77bcffb465488a98E
        local.get 0
        i32.const 0
        i32.store offset=36
        local.get 0
        i32.const 40
        i32.add
        local.get 0
        i32.const 36
        i32.add
        i32.const 132951
        i32.const 6
        call $_ZN13multiversx_sc2io16arg_nested_tuple14load_multi_arg17h55bb0e59e98ef0eeE
        local.get 0
        i32.load offset=36
        call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h2d30c346928e462aE
        local.get 0
        i32.load offset=40
        local.set 2
        local.get 0
        i32.const 40
        i32.add
        local.get 4
        call $_ZN13multiversx_sc2io25managed_result_arg_loader31ManagedResultArgLoader$LT$A$GT$3new17h37a66d41c99eb040E
        call $_ZN13multiversx_sc2io16arg_nested_tuple26init_arguments_static_data17h05aa664ddd45250eE
        local.get 0
        i32.load offset=44
        local.get 0
        i32.load offset=48
        call $_ZN13multiversx_sc2io16arg_nested_tuple18check_no_more_args17h576ea351e7d6f4f8E
        local.get 2
        br_if 0 (;@2;)
        i32.const 133437
        i32.const 8
        call $_ZN13multiversx_sc5types7managed5basic14managed_buffer22ManagedBuffer$LT$M$GT$14new_from_bytes17h8238d1f0b9563447E
        call $_ZN13multiversx_sc7storage7mappers19single_value_mapper31SingleValueMapper$LT$SA$C$T$GT$3set17hb404350c984485d8E
      end
      local.get 0
      i32.const 96
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 131220
    i32.const 25
    i32.const 131109
    i32.const 14
    call $_ZN161_$LT$multiversx_sc..contract_base..wrappers..serializer..ExitCodecErrorHandler$LT$M$GT$$u20$as$u20$multiversx_sc_codec..codec_err_handler..DecodeErrorHandler$GT$12handle_error17hc2107bbb6a898b5eE
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail17hf0083ebddc6be988E (type 0) (param i32)
    call $_ZN4core9panicking9panic_fmt17h47d05d49c60428e4E
    unreachable)
  (func $memcmp (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN17compiler_builtins3mem6memcmp17hc545bf3ea09f80eaE)
  (func $_ZN17compiler_builtins3mem6memcpy17h4070dce568878abcE (type 11) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 15
        i32.gt_u
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 4
      i32.add
      local.set 5
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.set 3
        local.get 1
        local.set 6
        loop  ;; label = @3
          local.get 3
          local.get 6
          i32.load8_u
          i32.store8
          local.get 6
          i32.const 1
          i32.add
          local.set 6
          local.get 3
          i32.const 1
          i32.add
          local.tee 3
          local.get 5
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 5
      local.get 2
      local.get 4
      i32.sub
      local.tee 7
      i32.const -4
      i32.and
      local.tee 8
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          local.get 4
          i32.add
          local.tee 9
          i32.const 3
          i32.and
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 1
          i32.lt_s
          br_if 1 (;@2;)
          local.get 9
          i32.const -4
          i32.and
          local.tee 10
          i32.const 4
          i32.add
          local.set 1
          i32.const 0
          local.get 6
          i32.const 3
          i32.shl
          local.tee 2
          i32.sub
          i32.const 24
          i32.and
          local.set 4
          local.get 10
          i32.load
          local.set 6
          loop  ;; label = @4
            local.get 5
            local.get 6
            local.get 2
            i32.shr_u
            local.get 1
            i32.load
            local.tee 6
            local.get 4
            i32.shl
            i32.or
            i32.store
            local.get 1
            i32.const 4
            i32.add
            local.set 1
            local.get 5
            i32.const 4
            i32.add
            local.tee 5
            local.get 3
            i32.lt_u
            br_if 0 (;@4;)
            br 2 (;@2;)
          end
        end
        local.get 8
        i32.const 1
        i32.lt_s
        br_if 0 (;@2;)
        local.get 9
        local.set 1
        loop  ;; label = @3
          local.get 5
          local.get 1
          i32.load
          i32.store
          local.get 1
          i32.const 4
          i32.add
          local.set 1
          local.get 5
          i32.const 4
          i32.add
          local.tee 5
          local.get 3
          i32.lt_u
          br_if 0 (;@3;)
        end
      end
      local.get 7
      i32.const 3
      i32.and
      local.set 2
      local.get 9
      local.get 8
      i32.add
      local.set 1
    end
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      local.get 2
      i32.add
      local.set 5
      loop  ;; label = @2
        local.get 3
        local.get 1
        i32.load8_u
        i32.store8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        i32.const 1
        i32.add
        local.tee 3
        local.get 5
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $_ZN17compiler_builtins3mem6memcmp17hc545bf3ea09f80eaE (type 11) (param i32 i32 i32) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      local.get 2
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        loop  ;; label = @3
          local.get 0
          i32.load8_u
          local.tee 4
          local.get 1
          i32.load8_u
          local.tee 5
          i32.ne
          br_if 1 (;@2;)
          local.get 0
          i32.const 1
          i32.add
          local.set 0
          local.get 1
          i32.const 1
          i32.add
          local.set 1
          local.get 2
          i32.const -1
          i32.add
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          br 0 (;@3;)
        end
      end
      local.get 4
      local.get 5
      i32.sub
      local.set 3
    end
    local.get 3)
  (func $memcpy (type 11) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN17compiler_builtins3mem6memcpy17h4070dce568878abcE)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 3)
  (global $__stack_pointer (mut i32) (i32.const 131072))
  (global (;1;) i32 (i32.const 143952))
  (global (;2;) i32 (i32.const 143952))
  (export "memory" (memory 0))
  (export "init" (func $init))
  (export "panicWithMessage" (func $panicWithMessage))
  (export "count_ones" (func $count_ones))
  (export "endpoint_with_mutable_arg" (func $endpoint_with_mutable_arg))
  (export "sqrt_big_uint" (func $sqrt_big_uint))
  (export "log2_big_uint" (func $log2_big_uint))
  (export "pow_big_int" (func $pow_big_int))
  (export "pow_big_uint" (func $pow_big_uint))
  (export "big_uint_to_u64" (func $big_uint_to_u64))
  (export "biguint_overwrite_u64" (func $biguint_overwrite_u64))
  (export "big_uint_zero" (func $big_uint_zero))
  (export "big_uint_from_u64_1" (func $big_uint_from_u64_1))
  (export "biguint_from_u128" (func $biguint_from_u128))
  (export "big_uint_from_managed_buffer" (func $big_uint_from_managed_buffer))
  (export "big_int_zero" (func $big_int_zero))
  (export "big_int_from_i64_1" (func $big_int_from_i64_1))
  (export "big_uint_eq_u64" (func $big_uint_eq_u64))
  (export "big_int_to_i64" (func $big_int_to_i64))
  (export "bigint_overwrite_i64" (func $bigint_overwrite_i64))
  (export "big_int_to_parts" (func $big_int_to_parts))
  (export "big_int_from_biguint" (func $big_int_from_biguint))
  (export "add_big_int" (func $add_big_int))
  (export "add_big_int_big_uint" (func $add_big_int_big_uint))
  (export "add_big_uint_big_int" (func $add_big_uint_big_int))
  (export "add_big_int_big_uint_ref" (func $add_big_int_big_uint_ref))
  (export "add_big_uint_big_int_ref" (func $add_big_uint_big_int_ref))
  (export "add_big_int_ref" (func $add_big_int_ref))
  (export "add_big_uint" (func $add_big_uint))
  (export "add_big_uint_ref" (func $add_big_uint_ref))
  (export "sub_big_int" (func $sub_big_int))
  (export "sub_big_int_ref" (func $sub_big_int_ref))
  (export "sub_big_uint" (func $sub_big_uint))
  (export "sub_big_uint_ref" (func $sub_big_uint_ref))
  (export "mul_big_int" (func $mul_big_int))
  (export "mul_big_int_ref" (func $mul_big_int_ref))
  (export "mul_big_uint" (func $mul_big_uint))
  (export "mul_big_uint_ref" (func $mul_big_uint_ref))
  (export "div_big_int" (func $div_big_int))
  (export "div_big_int_ref" (func $div_big_int_ref))
  (export "div_big_uint" (func $div_big_uint))
  (export "div_big_uint_ref" (func $div_big_uint_ref))
  (export "rem_big_int" (func $rem_big_int))
  (export "rem_big_int_ref" (func $rem_big_int_ref))
  (export "rem_big_uint" (func $rem_big_uint))
  (export "rem_big_uint_ref" (func $rem_big_uint_ref))
  (export "add_assign_big_int" (func $add_assign_big_int))
  (export "add_assign_big_int_ref" (func $add_assign_big_int_ref))
  (export "add_assign_big_uint" (func $add_assign_big_uint))
  (export "sub_assign_big_int" (func $sub_assign_big_int))
  (export "sub_assign_big_int_ref" (func $sub_assign_big_int_ref))
  (export "sub_assign_big_uint" (func $sub_assign_big_uint))
  (export "mul_assign_big_int" (func $mul_assign_big_int))
  (export "mul_assign_big_uint" (func $mul_assign_big_uint))
  (export "div_assign_big_int" (func $div_assign_big_int))
  (export "div_assign_big_uint" (func $div_assign_big_uint))
  (export "rem_assign_big_int" (func $rem_assign_big_int))
  (export "rem_assign_big_uint" (func $rem_assign_big_uint))
  (export "bit_and_big_uint" (func $bit_and_big_uint))
  (export "bit_and_big_uint_ref" (func $bit_and_big_uint_ref))
  (export "bit_or_big_uint" (func $bit_or_big_uint))
  (export "bit_or_big_uint_ref" (func $bit_or_big_uint_ref))
  (export "bit_xor_big_uint" (func $bit_xor_big_uint))
  (export "bit_xor_big_uint_ref" (func $bit_xor_big_uint_ref))
  (export "bit_and_assign_big_uint" (func $bit_and_assign_big_uint))
  (export "bit_or_assign_big_uint" (func $bit_or_assign_big_uint))
  (export "bit_xor_assign_big_uint" (func $bit_xor_assign_big_uint))
  (export "shr_big_uint" (func $shr_big_uint))
  (export "shr_big_uint_ref" (func $shr_big_uint_ref))
  (export "shl_big_uint" (func $shl_big_uint))
  (export "shl_big_uint_ref" (func $shl_big_uint_ref))
  (export "shr_assign_big_uint" (func $shr_assign_big_uint))
  (export "shl_assign_big_uint" (func $shl_assign_big_uint))
  (export "get_block_timestamp" (func $get_block_timestamp))
  (export "get_block_nonce" (func $get_block_nonce))
  (export "get_block_round" (func $get_block_round))
  (export "get_block_epoch" (func $get_block_epoch))
  (export "get_block_random_seed" (func $get_block_random_seed))
  (export "get_prev_block_timestamp" (func $get_prev_block_timestamp))
  (export "get_prev_block_nonce" (func $get_prev_block_nonce))
  (export "get_prev_block_round" (func $get_prev_block_round))
  (export "get_prev_block_epoch" (func $get_prev_block_epoch))
  (export "get_prev_block_random_seed" (func $get_prev_block_random_seed))
  (export "get_caller" (func $get_caller))
  (export "get_owner_address" (func $get_owner_address))
  (export "get_shard_of_address" (func $get_shard_of_address))
  (export "is_smart_contract" (func $is_smart_contract))
  (export "get_state_root_hash" (func $get_state_root_hash))
  (export "get_tx_hash" (func $get_tx_hash))
  (export "get_gas_left" (func $get_gas_left))
  (export "get_cumulated_validator_rewards" (func $get_cumulated_validator_rewards))
  (export "codec_err_finish" (func $codec_err_finish))
  (export "codec_err_storage_key" (func $codec_err_storage_key))
  (export "codec_err_storage_get" (func $codec_err_storage_get))
  (export "codec_err_storage_set" (func $codec_err_storage_set))
  (export "codec_err_event_topic" (func $codec_err_event_topic))
  (export "codec_err_event_data" (func $codec_err_event_data))
  (export "codec_err_contract_init" (func $codec_err_contract_init))
  (export "codec_err_contract_call" (func $codec_err_contract_call))
  (export "compute_sha256" (func $compute_sha256))
  (export "compute_keccak256" (func $compute_keccak256))
  (export "compute_ripemd160" (func $compute_ripemd160))
  (export "verify_bls_signature" (func $verify_bls_signature))
  (export "verify_ed25519_signature" (func $verify_ed25519_signature))
  (export "verify_secp256k1_signature" (func $verify_secp256k1_signature))
  (export "verify_custom_secp256k1_signature" (func $verify_custom_secp256k1_signature))
  (export "compute_secp256k1_der_signature" (func $compute_secp256k1_der_signature))
  (export "echo_u64" (func $echo_u64))
  (export "echo_i64" (func $echo_i64))
  (export "echo_i32" (func $echo_i32))
  (export "echo_u32" (func $echo_u32))
  (export "echo_isize" (func $echo_isize))
  (export "echo_i8" (func $echo_i8))
  (export "echo_u8" (func $echo_u8))
  (export "echo_bool" (func $echo_bool))
  (export "echo_opt_bool" (func $echo_opt_bool))
  (export "echo_nothing" (func $echo_nothing))
  (export "echo_array_u8" (func $echo_array_u8))
  (export "echo_multi_value_u32" (func $echo_multi_value_u32))
  (export "echo_multi_value_tuples" (func $echo_multi_value_tuples))
  (export "echo_ser_example_2" (func $echo_ser_example_2))
  (export "echo_simple_enum" (func $echo_simple_enum))
  (export "finish_simple_enum_variant_1" (func $finish_simple_enum_variant_1))
  (export "echo_non_zero_usize" (func $echo_non_zero_usize))
  (export "echo_some_args_ignore_others" (func $echo_some_args_ignore_others))
  (export "echo_arrayvec" (func $echo_arrayvec))
  (export "echo_big_uint" (func $echo_big_uint))
  (export "echo_big_int" (func $echo_big_int))
  (export "echo_managed_buffer" (func $echo_managed_buffer))
  (export "echo_managed_address" (func $echo_managed_address))
  (export "echo_big_int_managed_vec" (func $echo_big_int_managed_vec))
  (export "echo_big_int_tuple" (func $echo_big_int_tuple))
  (export "echo_big_int_option" (func $echo_big_int_option))
  (export "echo_tuple_into_multiresult" (func $echo_tuple_into_multiresult))
  (export "echo_managed_vec_of_managed_vec" (func $echo_managed_vec_of_managed_vec))
  (export "echo_managed_vec_of_token_identifier" (func $echo_managed_vec_of_token_identifier))
  (export "echo_managed_async_result_empty" (func $echo_managed_async_result_empty))
  (export "echo_varags_managed_sum" (func $echo_varags_managed_sum))
  (export "compute_get_values" (func $compute_get_values))
  (export "compute_create_ec" (func $compute_create_ec))
  (export "compute_get_ec_length" (func $compute_get_ec_length))
  (export "compute_get_priv_key_byte_length" (func $compute_get_priv_key_byte_length))
  (export "compute_ec_add" (func $compute_ec_add))
  (export "compute_ec_double" (func $compute_ec_double))
  (export "compute_is_on_curve_ec" (func $compute_is_on_curve_ec))
  (export "compute_scalar_mult" (func $compute_scalar_mult))
  (export "compute_scalar_base_mult" (func $compute_scalar_base_mult))
  (export "compute_marshal_ec" (func $compute_marshal_ec))
  (export "compute_marshal_compressed_ec" (func $compute_marshal_compressed_ec))
  (export "compute_unmarshal_ec" (func $compute_unmarshal_ec))
  (export "compute_unmarshal_compressed_ec" (func $compute_unmarshal_compressed_ec))
  (export "compute_generate_key_ec" (func $compute_generate_key_ec))
  (export "logEventA" (func $logEventA))
  (export "logEventARepeat" (func $logEventARepeat))
  (export "logEventB" (func $logEventB))
  (export "only_owner_endpoint" (func $only_owner_endpoint))
  (export "only_user_account_endpoint" (func $only_user_account_endpoint))
  (export "require_equals" (func $require_equals))
  (export "sc_panic" (func $sc_panic))
  (export "maddress_from_array" (func $maddress_from_array))
  (export "maddress_from_managed_buffer" (func $maddress_from_managed_buffer))
  (export "mbuffer_new" (func $mbuffer_new))
  (export "mbuffer_concat" (func $mbuffer_concat))
  (export "mbuffer_copy_slice" (func $mbuffer_copy_slice))
  (export "mbuffer_set_random" (func $mbuffer_set_random))
  (export "mbuffer_eq" (func $mbuffer_eq))
  (export "managed_address_zero" (func $managed_address_zero))
  (export "managed_address_eq" (func $managed_address_eq))
  (export "managed_vec_new" (func $managed_vec_new))
  (export "managed_vec_biguint_push" (func $managed_vec_biguint_push))
  (export "managed_vec_biguint_eq" (func $managed_vec_biguint_eq))
  (export "managed_vec_address_push" (func $managed_vec_address_push))
  (export "managed_vec_set" (func $managed_vec_set))
  (export "managed_vec_remove" (func $managed_vec_remove))
  (export "managed_vec_find" (func $managed_vec_find))
  (export "managed_vec_contains" (func $managed_vec_contains))
  (export "managed_vec_array_push" (func $managed_vec_array_push))
  (export "managed_ref_explicit" (func $managed_ref_explicit))
  (export "storage_read_raw" (func $storage_read_raw))
  (export "storage_write_raw" (func $storage_write_raw))
  (export "storage_read_from_address" (func $storage_read_from_address))
  (export "load_bytes" (func $load_bytes))
  (export "load_big_uint" (func $load_big_uint))
  (export "load_big_int" (func $load_big_int))
  (export "load_u64" (func $load_u64))
  (export "load_usize" (func $load_usize))
  (export "load_i64" (func $load_i64))
  (export "load_bool" (func $load_bool))
  (export "load_addr" (func $load_addr))
  (export "load_opt_addr" (func $load_opt_addr))
  (export "is_empty_opt_addr" (func $is_empty_opt_addr))
  (export "get_nr_to_clear" (func $get_nr_to_clear))
  (export "clear_storage_value" (func $clear_storage_value))
  (export "load_ser_2" (func $load_ser_2))
  (export "load_map1" (func $load_map1))
  (export "load_map2" (func $load_map2))
  (export "load_map3" (func $load_map3))
  (export "load_from_address_raw" (func $load_from_address_raw))
  (export "store_bytes" (func $store_bytes))
  (export "store_big_uint" (func $store_big_uint))
  (export "store_big_int" (func $store_big_int))
  (export "store_usize" (func $store_usize))
  (export "store_i32" (func $store_i32))
  (export "store_u64" (func $store_u64))
  (export "store_i64" (func $store_i64))
  (export "store_bool" (func $store_bool))
  (export "store_addr" (func $store_addr))
  (export "store_opt_addr" (func $store_opt_addr))
  (export "store_ser_2" (func $store_ser_2))
  (export "store_map1" (func $store_map1))
  (export "store_map2" (func $store_map2))
  (export "store_map3" (func $store_map3))
  (export "store_reserved_i64" (func $store_reserved_i64))
  (export "store_reserved_big_uint" (func $store_reserved_big_uint))
  (export "store_reserved_vec_u8" (func $store_reserved_vec_u8))
  (export "getListMapper" (func $getListMapper))
  (export "listMapperPushBack" (func $listMapperPushBack))
  (export "listMapperPushFront" (func $listMapperPushFront))
  (export "listMapperPopFront" (func $listMapperPopFront))
  (export "listMapperPopBack" (func $listMapperPopBack))
  (export "listMapperFront" (func $listMapperFront))
  (export "listMapperBack" (func $listMapperBack))
  (export "listMapperPushAfter" (func $listMapperPushAfter))
  (export "listMapperPushBefore" (func $listMapperPushBefore))
  (export "listMapperRemoveNode" (func $listMapperRemoveNode))
  (export "listMapperRemoveNodeById" (func $listMapperRemoveNodeById))
  (export "listMapperSetValue" (func $listMapperSetValue))
  (export "listMapperSetValueById" (func $listMapperSetValueById))
  (export "listMapperIterateByHand" (func $listMapperIterateByHand))
  (export "listMapperIterateByIter" (func $listMapperIterateByIter))
  (export "queue_mapper" (func $queue_mapper))
  (export "queue_mapper_push_back" (func $queue_mapper_push_back))
  (export "queue_mapper_pop_front" (func $queue_mapper_pop_front))
  (export "queue_mapper_front" (func $queue_mapper_front))
  (export "map_mapper" (func $map_mapper))
  (export "map_mapper_keys" (func $map_mapper_keys))
  (export "map_mapper_values" (func $map_mapper_values))
  (export "map_mapper_insert" (func $map_mapper_insert))
  (export "map_mapper_contains_key" (func $map_mapper_contains_key))
  (export "map_mapper_get" (func $map_mapper_get))
  (export "map_mapper_remove" (func $map_mapper_remove))
  (export "map_mapper_entry_or_default_update_increment" (func $map_mapper_entry_or_default_update_increment))
  (export "map_mapper_entry_or_insert_default" (func $map_mapper_entry_or_insert_default))
  (export "map_mapper_entry_and_modify" (func $map_mapper_entry_and_modify))
  (export "map_mapper_entry_or_insert_with_key" (func $map_mapper_entry_or_insert_with_key))
  (export "map_storage_mapper_view" (func $map_storage_mapper_view))
  (export "map_storage_mapper_insert_default" (func $map_storage_mapper_insert_default))
  (export "map_storage_mapper_contains_key" (func $map_storage_mapper_contains_key))
  (export "map_storage_mapper_get" (func $map_storage_mapper_get))
  (export "map_storage_mapper_insert_value" (func $map_storage_mapper_insert_value))
  (export "map_storage_mapper_get_value" (func $map_storage_mapper_get_value))
  (export "map_storage_mapper_remove" (func $map_storage_mapper_remove))
  (export "map_storage_mapper_clear" (func $map_storage_mapper_clear))
  (export "map_storage_mapper_entry_or_default_update_increment" (func $map_storage_mapper_entry_or_default_update_increment))
  (export "map_storage_mapper_entry_and_modify_increment_or_default" (func $map_storage_mapper_entry_and_modify_increment_or_default))
  (export "map_storage_mapper_entry_or_default_update" (func $map_storage_mapper_entry_or_default_update))
  (export "set_mapper" (func $set_mapper))
  (export "set_mapper_insert" (func $set_mapper_insert))
  (export "set_mapper_contains" (func $set_mapper_contains))
  (export "set_mapper_remove" (func $set_mapper_remove))
  (export "map_my_single_value_mapper" (func $map_my_single_value_mapper))
  (export "my_single_value_mapper_increment_1" (func $my_single_value_mapper_increment_1))
  (export "my_single_value_mapper_increment_2" (func $my_single_value_mapper_increment_2))
  (export "my_single_value_mapper_subtract_with_require" (func $my_single_value_mapper_subtract_with_require))
  (export "my_single_value_mapper_set_if_empty" (func $my_single_value_mapper_set_if_empty))
  (export "clear_single_value_mapper" (func $clear_single_value_mapper))
  (export "get_from_address_single_value_mapper" (func $get_from_address_single_value_mapper))
  (export "is_empty_at_address_single_value_mapper" (func $is_empty_at_address_single_value_mapper))
  (export "raw_byte_length_single_value_mapper" (func $raw_byte_length_single_value_mapper))
  (export "vec_mapper" (func $vec_mapper))
  (export "vec_mapper_push" (func $vec_mapper_push))
  (export "vec_mapper_get" (func $vec_mapper_get))
  (export "vec_mapper_get_at_address" (func $vec_mapper_get_at_address))
  (export "vec_mapper_len" (func $vec_mapper_len))
  (export "vec_mapper_len_at_address" (func $vec_mapper_len_at_address))
  (export "token_attributes_set" (func $token_attributes_set))
  (export "token_attributes_update" (func $token_attributes_update))
  (export "token_attributes_get_attributes" (func $token_attributes_get_attributes))
  (export "token_attributes_get_nonce" (func $token_attributes_get_nonce))
  (export "token_attributes_clear" (func $token_attributes_clear))
  (export "token_attributes_has_attributes" (func $token_attributes_has_attributes))
  (export "add_to_whitelist" (func $add_to_whitelist))
  (export "remove_from_whitelist" (func $remove_from_whitelist))
  (export "check_contains" (func $check_contains))
  (export "check_contains_at_address" (func $check_contains_at_address))
  (export "require_contains" (func $require_contains))
  (export "require_contains_at_address" (func $require_contains_at_address))
  (export "issue_fungible_default_callback" (func $issue_fungible_default_callback))
  (export "issue_fungible_custom_callback" (func $issue_fungible_custom_callback))
  (export "issue_and_set_all_roles_fungible" (func $issue_and_set_all_roles_fungible))
  (export "set_local_roles_fungible" (func $set_local_roles_fungible))
  (export "mint_fungible" (func $mint_fungible))
  (export "mint_and_send_fungible" (func $mint_and_send_fungible))
  (export "burn_fungible" (func $burn_fungible))
  (export "get_balance_fungible" (func $get_balance_fungible))
  (export "require_same_token_fungible" (func $require_same_token_fungible))
  (export "require_all_same_token_fungible" (func $require_all_same_token_fungible))
  (export "getFungibleTokenId" (func $getFungibleTokenId))
  (export "issue_and_set_all_roles_meta" (func $issue_and_set_all_roles_meta))
  (export "mapper_nft_set_token_id" (func $mapper_nft_set_token_id))
  (export "mapper_nft_create" (func $mapper_nft_create))
  (export "mapper_nft_create_and_send" (func $mapper_nft_create_and_send))
  (export "mapper_nft_add_quantity" (func $mapper_nft_add_quantity))
  (export "mapper_nft_add_quantity_and_send" (func $mapper_nft_add_quantity_and_send))
  (export "mapper_nft_burn" (func $mapper_nft_burn))
  (export "mapper_nft_get_balance" (func $mapper_nft_get_balance))
  (export "mapper_get_token_attributes" (func $mapper_get_token_attributes))
  (export "getNonFungibleTokenId" (func $getNonFungibleTokenId))
  (export "init_unique_id_mapper" (func $init_unique_id_mapper))
  (export "unique_id_mapper_get" (func $unique_id_mapper_get))
  (export "unique_id_mapper_swap_remove" (func $unique_id_mapper_swap_remove))
  (export "unique_id_mapper_set" (func $unique_id_mapper_set))
  (export "unique_id_mapper" (func $unique_id_mapper))
  (export "managed_struct_eq" (func $managed_struct_eq))
  (export "token_identifier_egld" (func $token_identifier_egld))
  (export "token_identifier_is_valid_1" (func $token_identifier_is_valid_1))
  (export "token_identifier_is_valid_2" (func $token_identifier_is_valid_2))
  (export "non_zero_usize_iter" (func $non_zero_usize_iter))
  (export "non_zero_usize_macro" (func $non_zero_usize_macro))
  (export "callBack" (func $callBack))
  (export "echo_varags_managed_eager" (func $echo_multi_value_u32))
  (export "big_uint_from_u64_2" (func $big_uint_from_u64_1))
  (export "big_int_from_i64_2" (func $big_int_from_i64_1))
  (export "is_empty_single_value_mapper" (func $get_from_address_single_value_mapper))
  (export "echo_usize" (func $echo_u32))
  (export "log2_big_uint_ref" (func $log2_big_uint))
  (export "add_assign_big_uint_ref" (func $add_assign_big_uint))
  (export "sub_assign_big_uint_ref" (func $sub_assign_big_uint))
  (export "mul_assign_big_int_ref" (func $mul_assign_big_int))
  (export "mul_assign_big_uint_ref" (func $mul_assign_big_uint))
  (export "div_assign_big_int_ref" (func $div_assign_big_int))
  (export "div_assign_big_uint_ref" (func $div_assign_big_uint))
  (export "rem_assign_big_int_ref" (func $rem_assign_big_int))
  (export "rem_assign_big_uint_ref" (func $rem_assign_big_uint))
  (export "bit_and_assign_big_uint_ref" (func $bit_and_assign_big_uint))
  (export "bit_or_assign_big_uint_ref" (func $bit_or_assign_big_uint))
  (export "bit_xor_assign_big_uint_ref" (func $bit_xor_assign_big_uint))
  (export "shr_assign_big_uint_ref" (func $shr_assign_big_uint))
  (export "shl_assign_big_uint_ref" (func $shl_assign_big_uint))
  (export "sqrt_big_uint_ref" (func $sqrt_big_uint))
  (export "big_uint_from_managed_buffer_ref" (func $big_uint_from_managed_buffer))
  (export "pow_big_int_ref" (func $pow_big_int))
  (export "pow_big_uint_ref" (func $pow_big_uint))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data $.rodata (i32.const 131072) "TokenAttributesnonFungibleTokenMapperinput too longinvalid valuedeliberate top decode errordeliberate top encode errordeliberate nested encode errorserializer decode error: ESDTNFTBurnESDTLocalBurnESDTNFTAddQuantityESDTLocalMintESDTNFTCreate\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00incorrect number of ESDT transfersargument decode error (): function does not accept ESDT paymenttoo few argumentstoo many argumentswrong number of argumentsendpoint result encode error: cannot subtract because result would be negativecanFreezecanWipecanPausecanMintcanBurncanChangeOwnercanUpgradecanAddSpecialRolessetSpecialRole\00\00\00\00\00\00\00\00\00\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\02\ff\ffregisterAndSetAllRolesMETASFTNFTFNGissuecontract call encode error: CB_CLOSUREinput too shortcast to i64 errorp521p384p256p224ManagedVec index out of rangeerror decoding ESDT attributes: EGLDstorage key encode error: storage encode error: .mapped.node_id.item.node_links.value.infolen already set.len.node.storageToken ID already setIssue was already calledInvalid token IDInvalid payment tokenMust issue or set token ID firstdefault_issue_init_supply_cbdefault_issue_cbUnknown token idA value was not previously set.attr.counter.mapping.nonceCounter overflow. This module can hold evidence for maximum u8::MAX different token IDsA value was already setlog data encode error: log topic encode error: recipient address not setstorage decode error: xmamvecaddramvencode_error_methoddataarg2num_logsba must equal bsc_panic testsignkeyshash_typeargarg3no callback function with that name exists in contractwants non-zerohow_manynumberitemvalueotherwiseincrementdefaultkey_incrementindexaddressaddr2addr1mv2mv1index out of boundsiopt_addrQueue empty!not enough fundscurve_bitsizemb2mb1slice_lenstarting_positionnr_bytesarraystorage_keynew_valuenode_idelementotherNo storage!set_roles_callbackcustom_issue_zero_supply_cbcustom_issue_non_zero_supply_cbresulttoattributesidlenavsenzopts2s1pendingbad array lengthvar argsarray decode errorcapacity exceededinput out of rangeinitial_callerevent_aevent_bevent_err_dataevent_err_topicload_with_key_errload_with_value_errstore_with_value_errmap_mapperset_mappervec_mapperstorage_bytesser_2usizebig_intbig_uintnr_to_cleari64u64boolmap1map2map3queue_mapperELRONDi64ELRONDreservedELRONDBigUinti32my_single_value_mapperlist_mappermap_storage_mapperunique_id_mapperwhitelistMapperfungibleTokenMapperrolesSet\00\00\00\03\00\00\00\03\00\00\00\03\00\00\00\04\00\00\00\00\00\00\00\9a\02\02\00\97\02\02\00\94\02\02\00\90\02\02\00\90\0a\02\00Endpoint can only be called by ownerEndpoint can only be called by user accountstruefalseindex out of rangeItem not whitelistedELRONDrewardESDTRoleLocalMintESDTRoleLocalBurnESDTRoleNFTCreateESDTRoleNFTAddQuantityESDTRoleNFTBurnESDTRoleNFTAddURIESDTRoleNFTUpdateAttributesESDTTransferRole\00panic occurred\00\00\00\00\00\00\11\00\00\00\11\00\00\00\11\00\00\00\16\00\00\00\0f\00\00\00\11\00\00\00\1b\00\00\00\10\00\00\00\90\0a\02\00\fb\09\02\00\0c\0a\02\00\1d\0a\02\00.\0a\02\00D\0a\02\00S\0a\02\00d\0a\02\00\7f\0a\02\00")
  (data $.data (i32.const 133864) "\9c\ff\ff\ff\ff\ff\ff\7f\ff\ff\ff\7f"))
