(module $erc20.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i64) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32)))
  (type (;7;) (func (param i32)))
  (type (;8;) (func (param i32 i32) (result i64)))
  (type (;9;) (func (param i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32)))
  (type (;11;) (func))
  (import "env" "decoderRegister" (func $decoderRegister (type 1)))
  (import "env" "decodeExtractBytes" (func $decodeExtractBytes (type 0)))
  (import "env" "SetAccountStorage" (func $SetAccountStorage (type 2)))
  (import "env" "GetAccountStorage" (func $GetAccountStorage (type 3)))
  (import "env" "fingerprint" (func $fingerprint (type 3)))
  (import "env" "fail" (func $fail (type 2)))
  (import "env" "signatureFingerprint" (func $signatureFingerprint (type 0)))
  (import "env" "bytesLength" (func $bytesLength (type 3)))
  (import "env" "bytesSubstr" (func $bytesSubstr (type 1)))
  (import "env" "encoderAddStr" (func $encoderAddStr (type 1)))
  (import "env" "Caller" (func $Caller (type 4)))
  (import "env" "newEncoder" (func $newEncoder (type 4)))
  (import "env" "u256FromU64" (func $u256FromU64 (type 5)))
  (import "env" "encoderAddU256" (func $encoderAddU256 (type 0)))
  (import "env" "encoderToBytes" (func $encoderToBytes (type 3)))
  (import "env" "decoderFromBuffer" (func $decoderFromBuffer (type 3)))
  (import "env" "decoderValueCount" (func $decoderValueCount (type 3)))
  (import "env" "isValidDecoder" (func $isValidDecoder (type 3)))
  (import "env" "Log3" (func $Log3 (type 6)))
  (import "env" "cmpBytes" (func $cmpBytes (type 0)))
  (import "env" "intSub" (func $intSub (type 0)))
  (import "env" "intAdd" (func $intAdd (type 0)))
  (import "env" "cmpInt" (func $cmpInt (type 0)))
  (import "env" "u256FromBytes" (func $u256FromBytes (type 3)))
  (import "env" "u160FromU64" (func $u160FromU64 (type 5)))
  (import "env" "u256FromIntId" (func $u256FromIntId (type 3)))
  (import "env" "u160FromIntId" (func $u160FromIntId (type 3)))
  (import "env" "CallData" (func $CallData (type 4)))
  (import "env" "SetOutput" (func $SetOutput (type 7)))
  (func $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17ha520517a84bd503dE (type 8) (param i32 i32) (result i64)
    (local i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    local.get 0
    i32.store8 offset=14
    local.get 4
    local.get 0
    i32.store8 offset=15
    i32.const 255
    local.set 5
    local.get 0
    local.get 5
    i32.and
    local.set 6
    local.get 6
    i64.extend_i32_u
    local.set 7
    local.get 7
    return)
  (func $_ZN4core3cmp10PartialOrd2le17hfb1b51b1ea888678E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN56_$LT$erc20..Balance$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17hb2fae59fcc783981E
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=7
    local.get 4
    i32.load8_u offset=7
    local.set 6
    i32.const 2
    local.set 7
    i32.const 255
    local.set 8
    local.get 6
    local.get 8
    i32.and
    local.set 9
    i32.const 255
    local.set 10
    local.get 7
    local.get 10
    i32.and
    local.set 11
    local.get 9
    local.get 11
    i32.eq
    local.set 12
    i32.const 0
    local.set 13
    i32.const 1
    local.set 14
    i32.const 1
    local.set 15
    local.get 12
    local.get 15
    i32.and
    local.set 16
    local.get 13
    local.get 14
    local.get 16
    select
    local.set 17
    i32.const 1
    local.set 18
    local.get 17
    local.set 19
    local.get 18
    local.set 20
    local.get 19
    local.get 20
    i32.eq
    local.set 21
    i32.const 1
    local.set 22
    local.get 21
    local.get 22
    i32.and
    local.set 23
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 23
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load8_u offset=7
          local.set 24
          i32.const 1
          local.set 25
          local.get 24
          local.get 25
          i32.add
          local.set 26
          i32.const 255
          local.set 27
          local.get 26
          local.get 27
          i32.and
          local.set 28
          local.get 28
          br_table 1 (;@2;) 1 (;@2;) 0 (;@3;) 1 (;@2;)
        end
        i32.const 0
        local.set 29
        local.get 4
        local.get 29
        i32.store8 offset=6
        br 1 (;@1;)
      end
      i32.const 1
      local.set 30
      local.get 4
      local.get 30
      i32.store8 offset=6
    end
    local.get 4
    i32.load8_u offset=6
    local.set 31
    i32.const 1
    local.set 32
    local.get 31
    local.get 32
    i32.and
    local.set 33
    i32.const 16
    local.set 34
    local.get 4
    local.get 34
    i32.add
    local.set 35
    local.get 35
    global.set $__stack_pointer
    local.get 33
    return
    unreachable)
  (func $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17h81d385e23c9ce041E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    i32.load
    local.set 5
    local.get 1
    i32.load
    local.set 6
    local.get 5
    local.get 6
    call $_ZN53_$LT$erc20..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h7229b5f4c1eac73eE
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $_ZN4core3cmp5impls70_$LT$impl$u20$core..cmp..PartialOrd$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2le17h7893402d7f08bc2cE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    i32.load
    local.set 5
    local.get 1
    i32.load
    local.set 6
    local.get 5
    local.get 6
    call $_ZN4core3cmp10PartialOrd2le17hfb1b51b1ea888678E
    local.set 7
    i32.const 1
    local.set 8
    local.get 7
    local.get 8
    i32.and
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h822be9ccc56f374aE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 0
    call $_ZN73_$LT$erc20..Address$u20$as$u20$core..convert..From$LT$erc20..U256$GT$$GT$4from17h87dfea67a5ffd4b2E
    local.set 5
    i32.const 16
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hde84e933e91bf7edE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 0
    call $_ZN73_$LT$erc20..Balance$u20$as$u20$core..convert..From$LT$erc20..U256$GT$$GT$4from17h9596f05c832def33E
    local.set 5
    i32.const 16
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN5erc207Decoder13register_data17h4228e2e97deedc7dE (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=24
    call $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h0fd9709117ad97f3E
    local.set 6
    call $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Decodable$GT$18is_variable_length17h09abd44c6a87fe98E
    local.set 7
    local.get 1
    local.get 6
    local.get 7
    call $decoderRegister
    local.set 8
    local.get 5
    local.get 8
    i32.store offset=28
    local.get 5
    local.get 8
    i32.store offset=12
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.load offset=12
    local.set 9
    local.get 5
    i32.load offset=16
    local.set 10
    local.get 0
    local.get 10
    i32.store offset=4
    local.get 0
    local.get 9
    i32.store
    i32.const 32
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return)
  (func $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=24
    call $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h69d4886d23477732E
    local.set 6
    call $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Decodable$GT$18is_variable_length17hf225d531e10fce03E
    local.set 7
    local.get 1
    local.get 6
    local.get 7
    call $decoderRegister
    local.set 8
    local.get 5
    local.get 8
    i32.store offset=28
    local.get 5
    local.get 8
    i32.store offset=12
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.load offset=12
    local.set 9
    local.get 5
    i32.load offset=16
    local.set 10
    local.get 0
    local.get 10
    i32.store offset=4
    local.get 0
    local.get 9
    i32.store
    i32.const 32
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return)
  (func $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=24
    local.get 1
    local.get 2
    call $decodeExtractBytes
    local.set 6
    local.get 6
    call $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E
    local.set 7
    local.get 5
    local.get 7
    i32.store offset=28
    i32.const 1
    local.set 8
    local.get 2
    local.get 8
    i32.add
    local.set 9
    local.get 9
    i32.eqz
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    block  ;; label = @1
      local.get 12
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 9
      i32.store offset=16
      local.get 7
      call $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Decodable$GT$6decode17h61e38eb6e5f4f37aE
      local.set 13
      local.get 0
      local.get 13
      i32.store
      local.get 5
      i32.load offset=12
      local.set 14
      local.get 5
      i32.load offset=16
      local.set 15
      local.get 0
      local.get 14
      i32.store offset=4
      local.get 0
      local.get 15
      i32.store offset=8
      i32.const 32
      local.set 16
      local.get 5
      local.get 16
      i32.add
      local.set 17
      local.get 17
      global.set $__stack_pointer
      return
    end
    i32.const 1048588
    local.set 18
    local.get 18
    call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hde776086e9d58b0fE
    unreachable)
  (func $_ZN5erc207Decoder6decode17h7885fdf65be1ce2bE (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=24
    local.get 1
    local.get 2
    call $decodeExtractBytes
    local.set 6
    local.get 6
    call $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E
    local.set 7
    local.get 5
    local.get 7
    i32.store offset=28
    i32.const 1
    local.set 8
    local.get 2
    local.get 8
    i32.add
    local.set 9
    local.get 9
    i32.eqz
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    block  ;; label = @1
      local.get 12
      br_if 0 (;@1;)
      local.get 5
      local.get 1
      i32.store offset=12
      local.get 5
      local.get 9
      i32.store offset=16
      local.get 7
      call $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Decodable$GT$6decode17he9ca7e9faed16cd6E
      local.set 13
      local.get 0
      local.get 13
      i32.store
      local.get 5
      i32.load offset=12
      local.set 14
      local.get 5
      i32.load offset=16
      local.set 15
      local.get 0
      local.get 14
      i32.store offset=4
      local.get 0
      local.get 15
      i32.store offset=8
      i32.const 32
      local.set 16
      local.get 5
      local.get 16
      i32.add
      local.set 17
      local.get 17
      global.set $__stack_pointer
      return
    end
    i32.const 1048588
    local.set 18
    local.get 18
    call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hde776086e9d58b0fE
    unreachable)
  (func $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3new17h7ae0a9a6819f444bE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    return)
  (func $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3set17h70ac12d78ca4dccfE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=4
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 1
    call $_ZN73_$LT$erc20..Balance$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h5b1f9130d880a772E
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=12
    local.get 0
    i32.load
    local.set 6
    local.get 6
    local.get 5
    call $SetAccountStorage
    i32.const 16
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $GetAccountStorage
    local.set 5
    local.get 3
    local.get 5
    i32.store offset=12
    local.get 5
    call $_ZN5erc204U2567from_id17h1e710ef193253ed0E
    local.set 6
    i32.const 1048604
    local.set 7
    local.get 6
    local.get 7
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hde84e933e91bf7edE
    local.set 8
    i32.const 16
    local.set 9
    local.get 3
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    local.get 8
    return)
  (func $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$3new17h13eec368398ed264E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 5
    local.get 5
    local.get 0
    local.get 1
    call $_ZN5erc207Encoder7add_str17h2ad348717df51f8bE
    local.set 6
    local.get 6
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$12from_encoder17he2c504dd6e852aabE
    local.set 7
    i32.const 16
    local.set 8
    local.get 4
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$12from_encoder17he2c504dd6e852aabE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    return)
  (func $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hd52e1f3e11f831c2E (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc207Encoder3add17h3f931a99b947504eE
    local.set 6
    local.get 6
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$12from_encoder17he2c504dd6e852aabE
    local.set 7
    i32.const 16
    local.set 8
    local.get 5
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$5build17hb2ec9ce02878c71aE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=4
    i32.const 4
    local.set 4
    local.get 3
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 6
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 7
    local.get 3
    local.get 7
    i32.store offset=8
    local.get 7
    call $fingerprint
    local.set 8
    local.get 3
    local.get 8
    i32.store offset=12
    local.get 8
    call $_ZN5erc204U2567from_id17h1e710ef193253ed0E
    local.set 9
    local.get 9
    call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3new17h7ae0a9a6819f444bE
    local.set 10
    i32.const 16
    local.set 11
    local.get 3
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    local.get 10
    return)
  (func $_ZN4core3ptr35drop_in_place$LT$erc20..Address$GT$17hb179604cdef5c068E (type 7) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    return)
  (func $_ZN4core3ptr35drop_in_place$LT$erc20..Balance$GT$17hd00972ed07fc92c1E (type 7) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    return)
  (func $_ZN5erc209ulm_hooks11failWrapper17h9cdd5286d3613c7fE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 0
    i32.store offset=16
    local.get 4
    local.get 1
    i32.store offset=20
    local.get 1
    local.set 5
    local.get 0
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=8
    local.get 4
    local.get 5
    i32.store offset=12
    local.get 4
    local.get 6
    i32.store offset=24
    local.get 4
    local.get 5
    i32.store offset=28
    local.get 6
    local.get 5
    call $fail
    unreachable)
  (func $_ZN5erc209ulm_hooks27signatureFingerprintWrapper17h625f92283221d6c6E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 0
    i32.store offset=16
    local.get 4
    local.get 1
    i32.store offset=20
    local.get 1
    local.set 5
    local.get 0
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=8
    local.get 4
    local.get 5
    i32.store offset=12
    local.get 4
    local.get 6
    i32.store offset=24
    local.get 4
    local.get 5
    i32.store offset=28
    local.get 6
    local.get 5
    call $signatureFingerprint
    local.set 7
    i32.const 32
    local.set 8
    local.get 4
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN5erc209ulm_hooks26endpointFingerprintWrapper17h2bacea3f2e6b46c0E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=4
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 0
    local.get 1
    call $_ZN5erc209ulm_hooks27signatureFingerprintWrapper17h625f92283221d6c6E
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=12
    local.get 5
    call $bytesLength
    local.set 6
    i32.const 4
    local.set 7
    local.get 6
    local.set 8
    local.get 7
    local.set 9
    local.get 8
    local.get 9
    i32.lt_u
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    block  ;; label = @1
      local.get 12
      br_if 0 (;@1;)
      i32.const 0
      local.set 13
      i32.const 4
      local.set 14
      local.get 5
      local.get 13
      local.get 14
      call $bytesSubstr
      local.set 15
      i32.const 16
      local.set 16
      local.get 4
      local.get 16
      i32.add
      local.set 17
      local.get 17
      global.set $__stack_pointer
      local.get 15
      return
    end
    i32.const 1048620
    local.set 18
    i32.const 19
    local.set 19
    local.get 18
    local.get 19
    call $_ZN5erc209ulm_hooks11failWrapper17h9cdd5286d3613c7fE
    unreachable)
  (func $_ZN5erc209ulm_hooks20encoderAddStrWrapper17h55165afa3106331eE (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 48
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store offset=16
    local.get 5
    local.get 2
    i32.store offset=20
    local.get 5
    local.get 1
    i32.store offset=32
    local.get 5
    local.get 2
    i32.store offset=36
    local.get 2
    local.set 6
    local.get 1
    local.set 7
    local.get 5
    local.get 7
    i32.store offset=24
    local.get 5
    local.get 6
    i32.store offset=28
    local.get 5
    local.get 7
    i32.store offset=40
    local.get 5
    local.get 6
    i32.store offset=44
    local.get 0
    local.get 7
    local.get 6
    call $encoderAddStr
    local.set 8
    i32.const 48
    local.set 9
    local.get 5
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    local.get 8
    return)
  (func $_ZN5erc204fail17h0b37b7c516e0a87dE (type 2) (param i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN5erc209ulm_hooks11failWrapper17h9cdd5286d3613c7fE
    unreachable)
  (func $rust_begin_unwind (type 7) (param i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    i32.const 1048639
    local.set 4
    i32.const 5
    local.set 5
    local.get 4
    local.get 5
    call $_ZN5erc204fail17h0b37b7c516e0a87dE
    unreachable)
  (func $_ZN5erc2013CallerWrapper17h7400b5be519d5a1eE (type 4) (result i32)
    (local i32 i32)
    call $Caller
    local.set 0
    local.get 0
    call $_ZN5erc207Address7from_id17h628003ca4e848340E
    local.set 1
    local.get 1
    return)
  (func $_ZN5erc207Address7from_id17h628003ca4e848340E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    return)
  (func $_ZN5erc207Encoder3new17h5e84c4db1c46934cE (type 4) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 16
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    call $newEncoder
    local.set 3
    local.get 2
    local.get 3
    i32.store offset=12
    local.get 2
    i32.load offset=12
    local.set 4
    i32.const 16
    local.set 5
    local.get 2
    local.get 5
    i32.add
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 4
    return)
  (func $_ZN5erc207Encoder3add17h3f931a99b947504eE (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 2
    i32.load offset=12
    local.set 6
    local.get 1
    local.get 0
    local.get 6
    call_indirect (type 0)
    local.set 7
    local.get 5
    local.get 7
    i32.store
    local.get 5
    i32.load
    local.set 8
    i32.const 16
    local.set 9
    local.get 5
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    local.get 8
    return)
  (func $_ZN5erc207Encoder8add_bool17heb4899fc014fe492E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i64 i64 i64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=24
    local.get 1
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=31
    local.get 1
    local.set 6
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        br_if 0 (;@2;)
        i64.const 0
        local.set 7
        local.get 4
        local.get 7
        i64.store offset=16
        br 1 (;@1;)
      end
      i64.const 1
      local.set 8
      local.get 4
      local.get 8
      i64.store offset=16
    end
    local.get 4
    i64.load offset=16
    local.set 9
    local.get 9
    call $u256FromU64
    local.set 10
    local.get 0
    local.get 10
    call $encoderAddU256
    local.set 11
    local.get 4
    local.get 11
    i32.store offset=12
    local.get 4
    i32.load offset=12
    local.set 12
    i32.const 32
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $_ZN5erc207Encoder6add_u817h2027993a587d64efE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i64 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store8 offset=15
    i32.const 1048656
    local.set 5
    local.get 1
    local.get 5
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17ha520517a84bd503dE
    local.set 6
    local.get 6
    call $u256FromU64
    local.set 7
    local.get 0
    local.get 7
    call $encoderAddU256
    local.set 8
    local.get 4
    local.get 8
    i32.store offset=4
    local.get 4
    i32.load offset=4
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $_ZN5erc207Encoder7add_str17h2ad348717df51f8bE (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc209ulm_hooks20encoderAddStrWrapper17h55165afa3106331eE
    local.set 6
    local.get 5
    local.get 6
    i32.store
    local.get 5
    i32.load
    local.set 7
    i32.const 16
    local.set 8
    local.get 5
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $encoderToBytes
    local.set 5
    local.get 5
    call $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E
    local.set 6
    i32.const 16
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    return)
  (func $_ZN5erc207Decoder11from_buffer17h15b7cedc27e58d09E (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 1
    call $decoderFromBuffer
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=4
    i32.const 0
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=8
    local.get 4
    i32.load offset=4
    local.set 7
    local.get 4
    i32.load offset=8
    local.set 8
    local.get 0
    local.get 8
    i32.store offset=4
    local.get 0
    local.get 7
    i32.store
    i32.const 16
    local.set 9
    local.get 4
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    return)
  (func $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E (type 7) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $decoderValueCount
    local.set 5
    local.get 3
    local.get 5
    i32.store offset=12
    local.get 0
    i32.load offset=4
    local.set 6
    local.get 6
    local.set 7
    local.get 5
    local.set 8
    local.get 7
    local.get 8
    i32.eq
    local.set 9
    i32.const 1
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    block  ;; label = @1
      local.get 11
      br_if 0 (;@1;)
      i32.const 16
      local.set 12
      local.get 3
      local.get 12
      i32.add
      local.set 13
      local.get 13
      global.set $__stack_pointer
      return
    end
    i32.const 1048672
    local.set 14
    i32.const 22
    local.set 15
    local.get 14
    local.get 15
    call $_ZN5erc204fail17h0b37b7c516e0a87dE
    unreachable)
  (func $_ZN5erc207Decoder13validate_data17h1cc0c11c868f15abE (type 7) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $isValidDecoder
    local.set 5
    i32.const 1
    local.set 6
    local.get 5
    local.get 6
    i32.and
    local.set 7
    local.get 3
    local.get 7
    i32.store8 offset=15
    i32.const 1
    local.set 8
    local.get 5
    local.get 8
    i32.and
    local.set 9
    block  ;; label = @1
      local.get 9
      br_if 0 (;@1;)
      i32.const 16
      local.set 10
      local.get 3
      local.get 10
      i32.add
      local.set 11
      local.get 11
      global.set $__stack_pointer
      return
    end
    i32.const 1048694
    local.set 12
    i32.const 17
    local.set 13
    local.get 12
    local.get 13
    call $_ZN5erc204fail17h0b37b7c516e0a87dE
    unreachable)
  (func $_ZN5erc204log317h83749ab9d4a48b25E (type 10) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 5
    i32.const 32
    local.set 6
    local.get 5
    local.get 6
    i32.sub
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 7
    local.get 0
    i32.store offset=12
    local.get 7
    local.get 1
    i32.store offset=16
    local.get 7
    local.get 2
    i32.store offset=20
    local.get 7
    local.get 3
    i32.store offset=24
    local.get 7
    local.get 4
    i32.store offset=28
    local.get 0
    local.get 1
    call $_ZN5erc209ulm_hooks27signatureFingerprintWrapper17h625f92283221d6c6E
    local.set 8
    local.get 4
    i32.load
    local.set 9
    local.get 8
    local.get 2
    local.get 3
    local.get 9
    call $Log3
    i32.const 32
    local.set 10
    local.get 7
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    return)
  (func $_ZN5erc205Bytes6length17h8afd472990701a45E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $bytesLength
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN5erc205Bytes6substr17hacf78dbf207976e6E (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 0
    i32.load
    local.set 6
    local.get 6
    local.get 1
    local.get 2
    call $bytesSubstr
    local.set 7
    local.get 7
    call $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E
    local.set 8
    i32.const 16
    local.set 9
    local.get 5
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    local.get 8
    return)
  (func $_ZN47_$LT$erc20..Bytes$u20$as$u20$core..cmp..Ord$GT$3cmp17h2710a52259725022E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=4
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 0
    i32.load
    local.set 5
    local.get 1
    i32.load
    local.set 6
    local.get 5
    local.get 6
    call $cmpBytes
    local.set 7
    local.get 4
    local.get 7
    i32.store offset=12
    i32.const 0
    local.set 8
    local.get 7
    local.set 9
    local.get 8
    local.set 10
    local.get 9
    local.get 10
    i32.lt_s
    local.set 11
    i32.const 1
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 13
            br_if 0 (;@4;)
            i32.const 0
            local.set 14
            local.get 7
            local.set 15
            local.get 14
            local.set 16
            local.get 15
            local.get 16
            i32.gt_s
            local.set 17
            i32.const 1
            local.set 18
            local.get 17
            local.get 18
            i32.and
            local.set 19
            local.get 19
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          i32.const 255
          local.set 20
          local.get 4
          local.get 20
          i32.store8 offset=3
          br 2 (;@1;)
        end
        i32.const 0
        local.set 21
        local.get 4
        local.get 21
        i32.store8 offset=3
        br 1 (;@1;)
      end
      i32.const 1
      local.set 22
      local.get 4
      local.get 22
      i32.store8 offset=3
    end
    local.get 4
    i32.load8_u offset=3
    local.set 23
    i32.const 16
    local.set 24
    local.get 4
    local.get 24
    i32.add
    local.set 25
    local.get 25
    global.set $__stack_pointer
    local.get 23
    return)
  (func $_ZN53_$LT$erc20..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h7229b5f4c1eac73eE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN47_$LT$erc20..Bytes$u20$as$u20$core..cmp..Ord$GT$3cmp17h2710a52259725022E
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=7
    i32.const 7
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    i32.const 1048711
    local.set 9
    local.get 8
    local.get 9
    call $_ZN60_$LT$core..cmp..Ordering$u20$as$u20$core..cmp..PartialEq$GT$2eq17h4f7e0e7136f3950eE
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $_ZN5erc204U2567from_id17h1e710ef193253ed0E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    return)
  (func $_ZN76_$LT$erc20..U256$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..U256$GT$$GT$3sub17hfe3585d2c7a143c5E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 1
    i32.load
    local.set 5
    local.get 0
    local.get 5
    call $intSub
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=4
    local.get 4
    i32.load offset=4
    local.set 7
    i32.const 16
    local.set 8
    local.get 4
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN76_$LT$erc20..U256$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..U256$GT$$GT$3add17h970bdc2f41aaa6ebE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 1
    i32.load
    local.set 5
    local.get 0
    local.get 5
    call $intAdd
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=4
    local.get 4
    i32.load offset=4
    local.set 7
    i32.const 16
    local.set 8
    local.get 4
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN46_$LT$erc20..U256$u20$as$u20$core..cmp..Ord$GT$3cmp17h723433a2610350a1E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=4
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 0
    i32.load
    local.set 5
    local.get 1
    i32.load
    local.set 6
    local.get 5
    local.get 6
    call $cmpInt
    local.set 7
    local.get 4
    local.get 7
    i32.store offset=12
    i32.const 0
    local.set 8
    local.get 7
    local.set 9
    local.get 8
    local.set 10
    local.get 9
    local.get 10
    i32.lt_s
    local.set 11
    i32.const 1
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 13
            br_if 0 (;@4;)
            i32.const 0
            local.set 14
            local.get 7
            local.set 15
            local.get 14
            local.set 16
            local.get 15
            local.get 16
            i32.gt_s
            local.set 17
            i32.const 1
            local.set 18
            local.get 17
            local.get 18
            i32.and
            local.set 19
            local.get 19
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          i32.const 255
          local.set 20
          local.get 4
          local.get 20
          i32.store8 offset=3
          br 2 (;@1;)
        end
        i32.const 0
        local.set 21
        local.get 4
        local.get 21
        i32.store8 offset=3
        br 1 (;@1;)
      end
      i32.const 1
      local.set 22
      local.get 4
      local.get 22
      i32.store8 offset=3
    end
    local.get 4
    i32.load8_u offset=3
    local.set 23
    i32.const 16
    local.set 24
    local.get 4
    local.get 24
    i32.add
    local.set 25
    local.get 25
    global.set $__stack_pointer
    local.get 23
    return)
  (func $_ZN53_$LT$erc20..U256$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h58b9f39ef47b1a24E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN46_$LT$erc20..U256$u20$as$u20$core..cmp..Ord$GT$3cmp17h723433a2610350a1E
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=7
    local.get 4
    i32.load8_u offset=7
    local.set 6
    i32.const 16
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN50_$LT$erc20..U256$u20$as$u20$core..clone..Clone$GT$5clone17h0232912bc5cac3feE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 5
    local.get 5
    return)
  (func $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Encodable$GT$6add_to17h090951f9f801e555E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    i32.load
    local.set 5
    local.get 1
    local.get 5
    call $encoderAddU256
    local.set 6
    i32.const 16
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$18is_variable_length17h08e7878431298215E (type 4) (result i32)
    (local i32 i32 i32)
    i32.const 0
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    return)
  (func $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h89e1868cbe08b658E (type 4) (result i32)
    (local i32)
    i32.const 32
    local.set 0
    local.get 0
    return)
  (func $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$6decode17he38c7c4108400c0bE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    call $u256FromBytes
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    local.get 3
    local.get 4
    i32.store offset=4
    local.get 3
    i32.load offset=4
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..Balance$GT$$GT$3sub17ha848b5075a9a4ef2E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN76_$LT$erc20..U256$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..U256$GT$$GT$3sub17hfe3585d2c7a143c5E
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=4
    local.get 4
    i32.load offset=4
    local.set 6
    i32.const 16
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..Balance$GT$$GT$3add17h6704e843e686e11fE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN76_$LT$erc20..U256$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..U256$GT$$GT$3add17h970bdc2f41aaa6ebE
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=4
    local.get 4
    i32.load offset=4
    local.set 6
    i32.const 16
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN73_$LT$erc20..Balance$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h5b1f9130d880a772E (type 3) (param i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    return)
  (func $_ZN73_$LT$erc20..Balance$u20$as$u20$core..convert..From$LT$erc20..U256$GT$$GT$4from17h9596f05c832def33E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 4
    local.get 4
    return)
  (func $_ZN53_$LT$erc20..Balance$u20$as$u20$core..clone..Clone$GT$5clone17h2767651bf9a05109E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    call $_ZN50_$LT$erc20..U256$u20$as$u20$core..clone..Clone$GT$5clone17h0232912bc5cac3feE
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=8
    local.get 3
    i32.load offset=8
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Encodable$GT$6add_to17h41814c5986643b6dE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Encodable$GT$6add_to17h090951f9f801e555E
    local.set 5
    i32.const 16
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Decodable$GT$18is_variable_length17h09abd44c6a87fe98E (type 4) (result i32)
    (local i32 i32 i32)
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$18is_variable_length17h08e7878431298215E
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    return)
  (func $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h0fd9709117ad97f3E (type 4) (result i32)
    (local i32)
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h89e1868cbe08b658E
    local.set 0
    local.get 0
    return)
  (func $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Decodable$GT$6decode17he9ca7e9faed16cd6E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$6decode17he38c7c4108400c0bE
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    i32.const 1048712
    local.set 5
    local.get 4
    local.get 5
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17hde84e933e91bf7edE
    local.set 6
    i32.const 16
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN5erc207Address4zero17hedd2c03198c84a3bE (type 4) (result i32)
    (local i32 i32 i32 i64 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 16
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    i64.const 0
    local.set 3
    local.get 3
    call $u160FromU64
    local.set 4
    local.get 2
    local.get 4
    i32.store offset=12
    local.get 2
    i32.load offset=12
    local.set 5
    i32.const 16
    local.set 6
    local.get 2
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN5erc207Address7is_zero17he26195ecac2cce46E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    call $_ZN5erc207Address4zero17hedd2c03198c84a3bE
    local.set 5
    local.get 4
    local.get 5
    call $cmpInt
    local.set 6
    i32.const 0
    local.set 7
    local.get 6
    local.set 8
    local.get 7
    local.set 9
    local.get 8
    local.get 9
    i32.eq
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 3
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $_ZN77_$LT$$RF$erc20..Address$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h29e5617d735823a7E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    i32.load
    local.set 4
    local.get 4
    call $u256FromIntId
    local.set 5
    local.get 5
    call $_ZN5erc204U2567from_id17h1e710ef193253ed0E
    local.set 6
    i32.const 16
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN73_$LT$erc20..Address$u20$as$u20$core..convert..From$LT$erc20..U256$GT$$GT$4from17h87dfea67a5ffd4b2E (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    call $u160FromIntId
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    local.get 3
    local.get 4
    i32.store offset=4
    local.get 3
    i32.load offset=4
    local.set 5
    i32.const 16
    local.set 6
    local.get 3
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Encodable$GT$6add_to17hde15938faf9b6a30E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    call $_ZN77_$LT$$RF$erc20..Address$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h29e5617d735823a7E
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=4
    i32.const 4
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    local.get 8
    local.get 1
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Encodable$GT$6add_to17h090951f9f801e555E
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Decodable$GT$18is_variable_length17hf225d531e10fce03E (type 4) (result i32)
    (local i32 i32 i32)
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$18is_variable_length17h08e7878431298215E
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    return)
  (func $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h69d4886d23477732E (type 4) (result i32)
    (local i32)
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$17encoded_head_size17h89e1868cbe08b658E
    local.set 0
    local.get 0
    return)
  (func $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Decodable$GT$6decode17h61e38eb6e5f4f37aE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 0
    call $_ZN48_$LT$erc20..U256$u20$as$u20$erc20..Decodable$GT$6decode17he38c7c4108400c0bE
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    i32.const 1048728
    local.set 5
    local.get 4
    local.get 5
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h822be9ccc56f374aE
    local.set 6
    i32.const 16
    local.set 7
    local.get 3
    local.get 7
    i32.add
    local.set 8
    local.get 8
    global.set $__stack_pointer
    local.get 6
    return)
  (func $_ZN5erc2014same_signature17hd58dc72482090d14E (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=12
    local.get 5
    local.get 1
    i32.store offset=24
    local.get 5
    local.get 2
    i32.store offset=28
    local.get 1
    local.get 2
    call $_ZN5erc209ulm_hooks26endpointFingerprintWrapper17h2bacea3f2e6b46c0E
    local.set 6
    local.get 6
    call $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E
    local.set 7
    local.get 5
    local.get 7
    i32.store offset=20
    i32.const 20
    local.set 8
    local.get 5
    local.get 8
    i32.add
    local.set 9
    local.get 9
    local.set 10
    local.get 5
    local.get 10
    i32.store offset=16
    i32.const 12
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    local.set 13
    i32.const 16
    local.set 14
    local.get 5
    local.get 14
    i32.add
    local.set 15
    local.get 15
    local.set 16
    local.get 13
    local.get 16
    call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17h81d385e23c9ce041E
    local.set 17
    i32.const 1
    local.set 18
    local.get 17
    local.get 18
    i32.and
    local.set 19
    i32.const 32
    local.set 20
    local.get 5
    local.get 20
    i32.add
    local.set 21
    local.get 21
    global.set $__stack_pointer
    local.get 19
    return)
  (func $dispatch (type 7) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 48
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 0
    local.set 4
    local.get 3
    local.get 4
    i32.store8 offset=31
    call $CallData
    local.set 5
    local.get 3
    local.get 5
    i32.store offset=32
    local.get 5
    call $_ZN5erc205Bytes7from_id17h2071f377be0ddbe7E
    local.set 6
    local.get 3
    local.get 6
    i32.store offset=20
    local.get 0
    local.set 7
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        local.get 7
                                        br_if 0 (;@18;)
                                        i32.const 20
                                        local.set 8
                                        local.get 3
                                        local.get 8
                                        i32.add
                                        local.set 9
                                        local.get 9
                                        local.set 10
                                        local.get 10
                                        call $_ZN5erc205Bytes6length17h8afd472990701a45E
                                        local.set 11
                                        i32.const 4
                                        local.set 12
                                        local.get 11
                                        local.set 13
                                        local.get 12
                                        local.set 14
                                        local.get 13
                                        local.get 14
                                        i32.le_u
                                        local.set 15
                                        i32.const 1
                                        local.set 16
                                        local.get 15
                                        local.get 16
                                        i32.and
                                        local.set 17
                                        local.get 17
                                        br_if 2 (;@16;)
                                        br 1 (;@17;)
                                      end
                                      local.get 3
                                      i32.load offset=20
                                      local.set 18
                                      local.get 3
                                      local.get 18
                                      call $_ZN5erc207Decoder11from_buffer17h15b7cedc27e58d09E
                                      local.get 3
                                      i32.load offset=4
                                      local.set 19
                                      local.get 3
                                      i32.load
                                      local.set 20
                                      local.get 20
                                      local.get 19
                                      call $_ZN5erc2010initCaller17hdf49b718f9bad110E
                                      br 16 (;@1;)
                                    end
                                    i32.const 20
                                    local.set 21
                                    local.get 3
                                    local.get 21
                                    i32.add
                                    local.set 22
                                    local.get 22
                                    local.set 23
                                    i32.const 0
                                    local.set 24
                                    i32.const 4
                                    local.set 25
                                    local.get 23
                                    local.get 24
                                    local.get 25
                                    call $_ZN5erc205Bytes6substr17hacf78dbf207976e6E
                                    local.set 26
                                    local.get 3
                                    local.get 26
                                    i32.store offset=24
                                    i32.const 20
                                    local.set 27
                                    local.get 3
                                    local.get 27
                                    i32.add
                                    local.set 28
                                    local.get 28
                                    local.set 29
                                    local.get 29
                                    call $_ZN5erc205Bytes6length17h8afd472990701a45E
                                    local.set 30
                                    i32.const 20
                                    local.set 31
                                    local.get 3
                                    local.get 31
                                    i32.add
                                    local.set 32
                                    local.get 32
                                    local.set 33
                                    i32.const 4
                                    local.set 34
                                    local.get 33
                                    local.get 34
                                    local.get 30
                                    call $_ZN5erc205Bytes6substr17hacf78dbf207976e6E
                                    local.set 35
                                    local.get 3
                                    local.get 35
                                    i32.store offset=36
                                    i32.const 8
                                    local.set 36
                                    local.get 3
                                    local.get 36
                                    i32.add
                                    local.set 37
                                    local.get 37
                                    local.get 35
                                    call $_ZN5erc207Decoder11from_buffer17h15b7cedc27e58d09E
                                    local.get 3
                                    i32.load offset=12
                                    local.set 38
                                    local.get 3
                                    i32.load offset=8
                                    local.set 39
                                    local.get 3
                                    local.get 39
                                    i32.store offset=40
                                    local.get 3
                                    local.get 38
                                    i32.store offset=44
                                    i32.const 24
                                    local.set 40
                                    local.get 3
                                    local.get 40
                                    i32.add
                                    local.set 41
                                    local.get 41
                                    local.set 42
                                    i32.const 1048744
                                    local.set 43
                                    i32.const 10
                                    local.set 44
                                    local.get 42
                                    local.get 43
                                    local.get 44
                                    call $_ZN5erc2014same_signature17hd58dc72482090d14E
                                    local.set 45
                                    i32.const 1
                                    local.set 46
                                    local.get 45
                                    local.get 46
                                    i32.and
                                    local.set 47
                                    local.get 47
                                    br_if 2 (;@14;)
                                    br 1 (;@15;)
                                  end
                                  i32.const 1048913
                                  local.set 48
                                  i32.const 33
                                  local.set 49
                                  local.get 48
                                  local.get 49
                                  call $_ZN5erc204fail17h0b37b7c516e0a87dE
                                  unreachable
                                end
                                i32.const 24
                                local.set 50
                                local.get 3
                                local.get 50
                                i32.add
                                local.set 51
                                local.get 51
                                local.set 52
                                i32.const 1048754
                                local.set 53
                                i32.const 13
                                local.set 54
                                local.get 52
                                local.get 53
                                local.get 54
                                call $_ZN5erc2014same_signature17hd58dc72482090d14E
                                local.set 55
                                i32.const 1
                                local.set 56
                                local.get 55
                                local.get 56
                                i32.and
                                local.set 57
                                local.get 57
                                br_if 2 (;@12;)
                                br 1 (;@13;)
                              end
                              local.get 39
                              local.get 38
                              call $_ZN5erc2014decimalsCaller17hb022778c09a659fdE
                              br 12 (;@1;)
                            end
                            i32.const 24
                            local.set 58
                            local.get 3
                            local.get 58
                            i32.add
                            local.set 59
                            local.get 59
                            local.set 60
                            i32.const 1048767
                            local.set 61
                            i32.const 18
                            local.set 62
                            local.get 60
                            local.get 61
                            local.get 62
                            call $_ZN5erc2014same_signature17hd58dc72482090d14E
                            local.set 63
                            i32.const 1
                            local.set 64
                            local.get 63
                            local.get 64
                            i32.and
                            local.set 65
                            local.get 65
                            br_if 2 (;@10;)
                            br 1 (;@11;)
                          end
                          local.get 39
                          local.get 38
                          call $_ZN5erc2017totalSupplyCaller17hd16492f9f371f72cE
                          br 10 (;@1;)
                        end
                        i32.const 24
                        local.set 66
                        local.get 3
                        local.get 66
                        i32.add
                        local.set 67
                        local.get 67
                        local.set 68
                        i32.const 1048785
                        local.set 69
                        i32.const 25
                        local.set 70
                        local.get 68
                        local.get 69
                        local.get 70
                        call $_ZN5erc2014same_signature17hd58dc72482090d14E
                        local.set 71
                        i32.const 1
                        local.set 72
                        local.get 71
                        local.get 72
                        i32.and
                        local.set 73
                        local.get 73
                        br_if 2 (;@8;)
                        br 1 (;@9;)
                      end
                      local.get 39
                      local.get 38
                      call $_ZN5erc2015balanceOfCaller17h49e8b06fc9501f2aE
                      br 8 (;@1;)
                    end
                    i32.const 24
                    local.set 74
                    local.get 3
                    local.get 74
                    i32.add
                    local.set 75
                    local.get 75
                    local.set 76
                    i32.const 1048810
                    local.set 77
                    i32.const 26
                    local.set 78
                    local.get 76
                    local.get 77
                    local.get 78
                    call $_ZN5erc2014same_signature17hd58dc72482090d14E
                    local.set 79
                    i32.const 1
                    local.set 80
                    local.get 79
                    local.get 80
                    i32.and
                    local.set 81
                    local.get 81
                    br_if 2 (;@6;)
                    br 1 (;@7;)
                  end
                  local.get 39
                  local.get 38
                  call $_ZN5erc2014transferCaller17h64f0e64f3f318c2fE
                  br 6 (;@1;)
                end
                i32.const 24
                local.set 82
                local.get 3
                local.get 82
                i32.add
                local.set 83
                local.get 83
                local.set 84
                i32.const 1048836
                local.set 85
                i32.const 24
                local.set 86
                local.get 84
                local.get 85
                local.get 86
                call $_ZN5erc2014same_signature17hd58dc72482090d14E
                local.set 87
                i32.const 1
                local.set 88
                local.get 87
                local.get 88
                i32.and
                local.set 89
                local.get 89
                br_if 2 (;@4;)
                br 1 (;@5;)
              end
              local.get 39
              local.get 38
              call $_ZN5erc2015allowanceCaller17hd309e502c85c8516E
              br 4 (;@1;)
            end
            i32.const 24
            local.set 90
            local.get 3
            local.get 90
            i32.add
            local.set 91
            local.get 91
            local.set 92
            i32.const 1048860
            local.set 93
            i32.const 37
            local.set 94
            local.get 92
            local.get 93
            local.get 94
            call $_ZN5erc2014same_signature17hd58dc72482090d14E
            local.set 95
            i32.const 1
            local.set 96
            local.get 95
            local.get 96
            i32.and
            local.set 97
            local.get 97
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          local.get 39
          local.get 38
          call $_ZN5erc2013approveCaller17h5682a86662c425a5E
          br 2 (;@1;)
        end
        i32.const 1048897
        local.set 98
        i32.const 16
        local.set 99
        local.get 98
        local.get 99
        call $_ZN5erc204fail17h0b37b7c516e0a87dE
        unreachable
      end
      local.get 39
      local.get 38
      call $_ZN5erc2018transferFromCaller17h7e7af6ea0a36ba3aE
    end
    i32.const 48
    local.set 100
    local.get 3
    local.get 100
    i32.add
    local.set 101
    local.get 101
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2010initCaller17hdf49b718f9bad110E (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.set 5
    local.get 5
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    call $_ZN5erc204init17hb8a1941cd966bca0E
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=8
    i32.const 8
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    local.get 9
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 10
    local.get 4
    local.get 10
    i32.store offset=12
    local.get 10
    call $SetOutput
    i32.const 16
    local.set 11
    local.get 4
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2014decimalsCaller17hb022778c09a659fdE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=16
    i32.const 12
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.set 7
    local.get 7
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    call $_ZN5erc208decimals17h59bf7db248d6ac72E
    local.set 8
    local.get 4
    local.get 8
    i32.store8 offset=27
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 9
    local.get 9
    local.get 8
    call $_ZN5erc207Encoder6add_u817h2027993a587d64efE
    local.set 10
    local.get 4
    local.get 10
    i32.store offset=20
    i32.const 20
    local.set 11
    local.get 4
    local.get 11
    i32.add
    local.set 12
    local.get 12
    local.set 13
    local.get 13
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 14
    local.get 4
    local.get 14
    i32.store offset=28
    local.get 14
    call $SetOutput
    i32.const 32
    local.set 15
    local.get 4
    local.get 15
    i32.add
    local.set 16
    local.get 16
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2017totalSupplyCaller17hd16492f9f371f72cE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 32
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    local.get 1
    i32.store offset=16
    i32.const 12
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.set 7
    local.get 7
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    call $_ZN5erc2012total_supply17h85d6b1e8b6991d9aE
    local.set 8
    local.get 4
    local.get 8
    i32.store offset=20
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 9
    i32.const 20
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.set 12
    i32.const 1049008
    local.set 13
    local.get 9
    local.get 12
    local.get 13
    call $_ZN5erc207Encoder3add17h3f931a99b947504eE
    local.set 14
    local.get 4
    local.get 14
    i32.store offset=24
    i32.const 24
    local.set 15
    local.get 4
    local.get 15
    i32.add
    local.set 16
    local.get 16
    local.set 17
    local.get 17
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 18
    local.get 4
    local.get 18
    i32.store offset=28
    local.get 18
    call $SetOutput
    i32.const 32
    local.set 19
    local.get 4
    local.get 19
    i32.add
    local.set 20
    local.get 20
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2015balanceOfCaller17h49e8b06fc9501f2aE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 64
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=52
    local.get 4
    local.get 1
    i32.store offset=56
    local.get 4
    local.get 0
    local.get 1
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=4
    local.set 5
    local.get 4
    i32.load
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=12
    local.get 4
    local.get 5
    i32.store offset=16
    i32.const 12
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    local.get 9
    call $_ZN5erc207Decoder13validate_data17h1cc0c11c868f15abE
    local.get 4
    i32.load offset=12
    local.set 10
    local.get 4
    i32.load offset=16
    local.set 11
    i32.const 32
    local.set 12
    local.get 4
    local.get 12
    i32.add
    local.set 13
    local.get 13
    local.set 14
    local.get 14
    local.get 10
    local.get 11
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=32
    local.set 15
    local.get 4
    local.get 15
    i32.store offset=20
    local.get 4
    i32.load offset=36
    local.set 16
    local.get 4
    i32.load offset=40
    local.set 17
    local.get 4
    local.get 16
    i32.store offset=24
    local.get 4
    local.get 17
    i32.store offset=28
    i32.const 24
    local.set 18
    local.get 4
    local.get 18
    i32.add
    local.set 19
    local.get 19
    local.set 20
    local.get 20
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    i32.const 20
    local.set 21
    local.get 4
    local.get 21
    i32.add
    local.set 22
    local.get 22
    local.set 23
    local.get 23
    call $_ZN5erc2010balance_of17h3869d273118af9aaE
    local.set 24
    local.get 4
    local.get 24
    i32.store offset=44
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 25
    i32.const 44
    local.set 26
    local.get 4
    local.get 26
    i32.add
    local.set 27
    local.get 27
    local.set 28
    i32.const 1049008
    local.set 29
    local.get 25
    local.get 28
    local.get 29
    call $_ZN5erc207Encoder3add17h3f931a99b947504eE
    local.set 30
    local.get 4
    local.get 30
    i32.store offset=48
    i32.const 48
    local.set 31
    local.get 4
    local.get 31
    i32.add
    local.set 32
    local.get 32
    local.set 33
    local.get 33
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 34
    local.get 4
    local.get 34
    i32.store offset=60
    local.get 34
    call $SetOutput
    i32.const 64
    local.set 35
    local.get 4
    local.get 35
    i32.add
    local.set 36
    local.get 36
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2014transferCaller17h64f0e64f3f318c2fE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 112
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=80
    local.get 4
    local.get 1
    i32.store offset=84
    i32.const 8
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.get 0
    local.get 1
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=12
    local.set 7
    local.get 4
    i32.load offset=8
    local.set 8
    local.get 4
    local.get 8
    i32.store offset=88
    local.get 4
    local.get 7
    i32.store offset=92
    i32.const 16
    local.set 9
    local.get 4
    local.get 9
    i32.add
    local.set 10
    local.get 10
    local.get 8
    local.get 7
    call $_ZN5erc207Decoder13register_data17h4228e2e97deedc7dE
    local.get 4
    i32.load offset=20
    local.set 11
    local.get 4
    i32.load offset=16
    local.set 12
    local.get 4
    local.get 12
    i32.store offset=28
    local.get 4
    local.get 11
    i32.store offset=32
    i32.const 28
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    local.set 15
    local.get 15
    call $_ZN5erc207Decoder13validate_data17h1cc0c11c868f15abE
    local.get 4
    i32.load offset=28
    local.set 16
    local.get 4
    i32.load offset=32
    local.set 17
    i32.const 40
    local.set 18
    local.get 4
    local.get 18
    i32.add
    local.set 19
    local.get 19
    local.set 20
    local.get 20
    local.get 16
    local.get 17
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=40
    local.set 21
    local.get 4
    local.get 21
    i32.store offset=36
    local.get 4
    i32.load offset=44
    local.set 22
    local.get 4
    i32.load offset=48
    local.set 23
    local.get 4
    local.get 22
    i32.store offset=96
    local.get 4
    local.get 23
    i32.store offset=100
    i32.const 64
    local.set 24
    local.get 4
    local.get 24
    i32.add
    local.set 25
    local.get 25
    local.set 26
    local.get 26
    local.get 22
    local.get 23
    call $_ZN5erc207Decoder6decode17h7885fdf65be1ce2bE
    local.get 4
    i32.load offset=64
    local.set 27
    local.get 4
    local.get 27
    i32.store offset=52
    local.get 4
    i32.load offset=68
    local.set 28
    local.get 4
    i32.load offset=72
    local.set 29
    local.get 4
    local.get 28
    i32.store offset=56
    local.get 4
    local.get 29
    i32.store offset=60
    i32.const 56
    local.set 30
    local.get 4
    local.get 30
    i32.add
    local.set 31
    local.get 31
    local.set 32
    local.get 32
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    i32.const 36
    local.set 33
    local.get 4
    local.get 33
    i32.add
    local.set 34
    local.get 34
    local.set 35
    i32.const 52
    local.set 36
    local.get 4
    local.get 36
    i32.add
    local.set 37
    local.get 37
    local.set 38
    local.get 35
    local.get 38
    call $_ZN5erc208transfer17h08e8f7f198135a6cE
    local.set 39
    i32.const 1
    local.set 40
    local.get 39
    local.get 40
    i32.and
    local.set 41
    local.get 4
    local.get 41
    i32.store8 offset=107
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 42
    i32.const 1
    local.set 43
    local.get 39
    local.get 43
    i32.and
    local.set 44
    local.get 42
    local.get 44
    call $_ZN5erc207Encoder8add_bool17heb4899fc014fe492E
    local.set 45
    local.get 4
    local.get 45
    i32.store offset=76
    i32.const 76
    local.set 46
    local.get 4
    local.get 46
    i32.add
    local.set 47
    local.get 47
    local.set 48
    local.get 48
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 49
    local.get 4
    local.get 49
    i32.store offset=108
    local.get 49
    call $SetOutput
    i32.const 112
    local.set 50
    local.get 4
    local.get 50
    i32.add
    local.set 51
    local.get 51
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2015allowanceCaller17hd309e502c85c8516E (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 112
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=84
    local.get 4
    local.get 1
    i32.store offset=88
    i32.const 8
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.get 0
    local.get 1
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=12
    local.set 7
    local.get 4
    i32.load offset=8
    local.set 8
    local.get 4
    local.get 8
    i32.store offset=92
    local.get 4
    local.get 7
    i32.store offset=96
    i32.const 16
    local.set 9
    local.get 4
    local.get 9
    i32.add
    local.set 10
    local.get 10
    local.get 8
    local.get 7
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=20
    local.set 11
    local.get 4
    i32.load offset=16
    local.set 12
    local.get 4
    local.get 12
    i32.store offset=28
    local.get 4
    local.get 11
    i32.store offset=32
    i32.const 28
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    local.set 15
    local.get 15
    call $_ZN5erc207Decoder13validate_data17h1cc0c11c868f15abE
    local.get 4
    i32.load offset=28
    local.set 16
    local.get 4
    i32.load offset=32
    local.set 17
    i32.const 40
    local.set 18
    local.get 4
    local.get 18
    i32.add
    local.set 19
    local.get 19
    local.set 20
    local.get 20
    local.get 16
    local.get 17
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=40
    local.set 21
    local.get 4
    local.get 21
    i32.store offset=36
    local.get 4
    i32.load offset=44
    local.set 22
    local.get 4
    i32.load offset=48
    local.set 23
    local.get 4
    local.get 22
    i32.store offset=100
    local.get 4
    local.get 23
    i32.store offset=104
    i32.const 64
    local.set 24
    local.get 4
    local.get 24
    i32.add
    local.set 25
    local.get 25
    local.set 26
    local.get 26
    local.get 22
    local.get 23
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=64
    local.set 27
    local.get 4
    local.get 27
    i32.store offset=52
    local.get 4
    i32.load offset=68
    local.set 28
    local.get 4
    i32.load offset=72
    local.set 29
    local.get 4
    local.get 28
    i32.store offset=56
    local.get 4
    local.get 29
    i32.store offset=60
    i32.const 56
    local.set 30
    local.get 4
    local.get 30
    i32.add
    local.set 31
    local.get 31
    local.set 32
    local.get 32
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    i32.const 36
    local.set 33
    local.get 4
    local.get 33
    i32.add
    local.set 34
    local.get 34
    local.set 35
    i32.const 52
    local.set 36
    local.get 4
    local.get 36
    i32.add
    local.set 37
    local.get 37
    local.set 38
    local.get 35
    local.get 38
    call $_ZN5erc209allowance17h9e49f6e34cd21d88E
    local.set 39
    local.get 4
    local.get 39
    i32.store offset=76
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 40
    i32.const 76
    local.set 41
    local.get 4
    local.get 41
    i32.add
    local.set 42
    local.get 42
    local.set 43
    i32.const 1049008
    local.set 44
    local.get 40
    local.get 43
    local.get 44
    call $_ZN5erc207Encoder3add17h3f931a99b947504eE
    local.set 45
    local.get 4
    local.get 45
    i32.store offset=80
    i32.const 80
    local.set 46
    local.get 4
    local.get 46
    i32.add
    local.set 47
    local.get 47
    local.set 48
    local.get 48
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 49
    local.get 4
    local.get 49
    i32.store offset=108
    local.get 49
    call $SetOutput
    i32.const 112
    local.set 50
    local.get 4
    local.get 50
    i32.add
    local.set 51
    local.get 51
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2013approveCaller17h5682a86662c425a5E (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 112
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=80
    local.get 4
    local.get 1
    i32.store offset=84
    i32.const 8
    local.set 5
    local.get 4
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.get 0
    local.get 1
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=12
    local.set 7
    local.get 4
    i32.load offset=8
    local.set 8
    local.get 4
    local.get 8
    i32.store offset=88
    local.get 4
    local.get 7
    i32.store offset=92
    i32.const 16
    local.set 9
    local.get 4
    local.get 9
    i32.add
    local.set 10
    local.get 10
    local.get 8
    local.get 7
    call $_ZN5erc207Decoder13register_data17h4228e2e97deedc7dE
    local.get 4
    i32.load offset=20
    local.set 11
    local.get 4
    i32.load offset=16
    local.set 12
    local.get 4
    local.get 12
    i32.store offset=28
    local.get 4
    local.get 11
    i32.store offset=32
    i32.const 28
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    local.set 15
    local.get 15
    call $_ZN5erc207Decoder13validate_data17h1cc0c11c868f15abE
    local.get 4
    i32.load offset=28
    local.set 16
    local.get 4
    i32.load offset=32
    local.set 17
    i32.const 40
    local.set 18
    local.get 4
    local.get 18
    i32.add
    local.set 19
    local.get 19
    local.set 20
    local.get 20
    local.get 16
    local.get 17
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=40
    local.set 21
    local.get 4
    local.get 21
    i32.store offset=36
    local.get 4
    i32.load offset=44
    local.set 22
    local.get 4
    i32.load offset=48
    local.set 23
    local.get 4
    local.get 22
    i32.store offset=96
    local.get 4
    local.get 23
    i32.store offset=100
    i32.const 64
    local.set 24
    local.get 4
    local.get 24
    i32.add
    local.set 25
    local.get 25
    local.set 26
    local.get 26
    local.get 22
    local.get 23
    call $_ZN5erc207Decoder6decode17h7885fdf65be1ce2bE
    local.get 4
    i32.load offset=64
    local.set 27
    local.get 4
    local.get 27
    i32.store offset=52
    local.get 4
    i32.load offset=68
    local.set 28
    local.get 4
    i32.load offset=72
    local.set 29
    local.get 4
    local.get 28
    i32.store offset=56
    local.get 4
    local.get 29
    i32.store offset=60
    i32.const 56
    local.set 30
    local.get 4
    local.get 30
    i32.add
    local.set 31
    local.get 31
    local.set 32
    local.get 32
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    i32.const 36
    local.set 33
    local.get 4
    local.get 33
    i32.add
    local.set 34
    local.get 34
    local.set 35
    i32.const 52
    local.set 36
    local.get 4
    local.get 36
    i32.add
    local.set 37
    local.get 37
    local.set 38
    local.get 35
    local.get 38
    call $_ZN5erc207approve17hedce0ccdcba7012fE
    local.set 39
    i32.const 1
    local.set 40
    local.get 39
    local.get 40
    i32.and
    local.set 41
    local.get 4
    local.get 41
    i32.store8 offset=107
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 42
    i32.const 1
    local.set 43
    local.get 39
    local.get 43
    i32.and
    local.set 44
    local.get 42
    local.get 44
    call $_ZN5erc207Encoder8add_bool17heb4899fc014fe492E
    local.set 45
    local.get 4
    local.get 45
    i32.store offset=76
    i32.const 76
    local.set 46
    local.get 4
    local.get 46
    i32.add
    local.set 47
    local.get 47
    local.set 48
    local.get 48
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 49
    local.get 4
    local.get 49
    i32.store offset=108
    local.get 49
    call $SetOutput
    i32.const 112
    local.set 50
    local.get 4
    local.get 50
    i32.add
    local.set 51
    local.get 51
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2018transferFromCaller17h7e7af6ea0a36ba3aE (type 2) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 144
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=96
    local.get 4
    local.get 1
    i32.store offset=100
    local.get 4
    local.get 0
    local.get 1
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=4
    local.set 5
    local.get 4
    i32.load
    local.set 6
    local.get 4
    local.get 6
    i32.store offset=104
    local.get 4
    local.get 5
    i32.store offset=108
    i32.const 8
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.get 6
    local.get 5
    call $_ZN5erc207Decoder13register_data17ha789e8cf0889bfe5E
    local.get 4
    i32.load offset=12
    local.set 9
    local.get 4
    i32.load offset=8
    local.set 10
    local.get 4
    local.get 10
    i32.store offset=112
    local.get 4
    local.get 9
    i32.store offset=116
    i32.const 16
    local.set 11
    local.get 4
    local.get 11
    i32.add
    local.set 12
    local.get 12
    local.get 10
    local.get 9
    call $_ZN5erc207Decoder13register_data17h4228e2e97deedc7dE
    local.get 4
    i32.load offset=20
    local.set 13
    local.get 4
    i32.load offset=16
    local.set 14
    local.get 4
    local.get 14
    i32.store offset=28
    local.get 4
    local.get 13
    i32.store offset=32
    i32.const 28
    local.set 15
    local.get 4
    local.get 15
    i32.add
    local.set 16
    local.get 16
    local.set 17
    local.get 17
    call $_ZN5erc207Decoder13validate_data17h1cc0c11c868f15abE
    local.get 4
    i32.load offset=28
    local.set 18
    local.get 4
    i32.load offset=32
    local.set 19
    i32.const 40
    local.set 20
    local.get 4
    local.get 20
    i32.add
    local.set 21
    local.get 21
    local.set 22
    local.get 22
    local.get 18
    local.get 19
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=40
    local.set 23
    local.get 4
    local.get 23
    i32.store offset=36
    local.get 4
    i32.load offset=44
    local.set 24
    local.get 4
    i32.load offset=48
    local.set 25
    local.get 4
    local.get 24
    i32.store offset=120
    local.get 4
    local.get 25
    i32.store offset=124
    i32.const 56
    local.set 26
    local.get 4
    local.get 26
    i32.add
    local.set 27
    local.get 27
    local.set 28
    local.get 28
    local.get 24
    local.get 25
    call $_ZN5erc207Decoder6decode17h0bddf7c5078c319cE
    local.get 4
    i32.load offset=56
    local.set 29
    local.get 4
    local.get 29
    i32.store offset=52
    local.get 4
    i32.load offset=60
    local.set 30
    local.get 4
    i32.load offset=64
    local.set 31
    local.get 4
    local.get 30
    i32.store offset=128
    local.get 4
    local.get 31
    i32.store offset=132
    i32.const 80
    local.set 32
    local.get 4
    local.get 32
    i32.add
    local.set 33
    local.get 33
    local.set 34
    local.get 34
    local.get 30
    local.get 31
    call $_ZN5erc207Decoder6decode17h7885fdf65be1ce2bE
    local.get 4
    i32.load offset=80
    local.set 35
    local.get 4
    local.get 35
    i32.store offset=68
    local.get 4
    i32.load offset=84
    local.set 36
    local.get 4
    i32.load offset=88
    local.set 37
    local.get 4
    local.get 36
    i32.store offset=72
    local.get 4
    local.get 37
    i32.store offset=76
    i32.const 72
    local.set 38
    local.get 4
    local.get 38
    i32.add
    local.set 39
    local.get 39
    local.set 40
    local.get 40
    call $_ZN5erc207Decoder10check_done17h7fa20650cc6d1a00E
    i32.const 36
    local.set 41
    local.get 4
    local.get 41
    i32.add
    local.set 42
    local.get 42
    local.set 43
    i32.const 52
    local.set 44
    local.get 4
    local.get 44
    i32.add
    local.set 45
    local.get 45
    local.set 46
    i32.const 68
    local.set 47
    local.get 4
    local.get 47
    i32.add
    local.set 48
    local.get 48
    local.set 49
    local.get 43
    local.get 46
    local.get 49
    call $_ZN5erc2013transfer_from17hb9caef494aa68a15E
    local.set 50
    i32.const 1
    local.set 51
    local.get 50
    local.get 51
    i32.and
    local.set 52
    local.get 4
    local.get 52
    i32.store8 offset=139
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 53
    i32.const 1
    local.set 54
    local.get 50
    local.get 54
    i32.and
    local.set 55
    local.get 53
    local.get 55
    call $_ZN5erc207Encoder8add_bool17heb4899fc014fe492E
    local.set 56
    local.get 4
    local.get 56
    i32.store offset=92
    i32.const 92
    local.set 57
    local.get 4
    local.get 57
    i32.add
    local.set 58
    local.get 58
    local.set 59
    local.get 59
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 60
    local.get 4
    local.get 60
    i32.store offset=140
    local.get 60
    call $SetOutput
    i32.const 144
    local.set 61
    local.get 4
    local.get 61
    i32.add
    local.set 62
    local.get 62
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2014s_total_supply17hedf1d8647c3308f9E (type 4) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1048946
    local.set 0
    i32.const 12
    local.set 1
    local.get 0
    local.get 1
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$3new17h13eec368398ed264E
    local.set 2
    local.get 2
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$5build17hb2ec9ce02878c71aE
    local.set 3
    local.get 3
    return)
  (func $_ZN5erc2010s_balances17hd22741f516dfc3efE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    i32.const 1048946
    local.set 4
    i32.const 12
    local.set 5
    local.get 4
    local.get 5
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$3new17h13eec368398ed264E
    local.set 6
    i32.const 1048960
    local.set 7
    local.get 6
    local.get 0
    local.get 7
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hd52e1f3e11f831c2E
    local.set 8
    local.get 8
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$5build17hb2ec9ce02878c71aE
    local.set 9
    i32.const 16
    local.set 10
    local.get 3
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $_ZN5erc2012s_allowances17hd9fc713e7dd12b12E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    i32.const 1048946
    local.set 5
    i32.const 12
    local.set 6
    local.get 5
    local.get 6
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$3new17h13eec368398ed264E
    local.set 7
    i32.const 1048960
    local.set 8
    local.get 7
    local.get 0
    local.get 8
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hd52e1f3e11f831c2E
    local.set 9
    i32.const 1048960
    local.set 10
    local.get 9
    local.get 1
    local.get 10
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hd52e1f3e11f831c2E
    local.set 11
    local.get 11
    call $_ZN5erc2041SingleValueMapperBuilder$LT$ValueType$GT$5build17hb2ec9ce02878c71aE
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $_ZN5erc2014transfer_event17h85b922127af61618E (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=20
    local.get 5
    local.get 1
    i32.store offset=24
    local.get 5
    local.get 2
    i32.store offset=28
    local.get 0
    call $_ZN77_$LT$$RF$erc20..Address$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h29e5617d735823a7E
    local.set 6
    local.get 1
    call $_ZN77_$LT$$RF$erc20..Address$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h29e5617d735823a7E
    local.set 7
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 8
    i32.const 1049008
    local.set 9
    local.get 8
    local.get 2
    local.get 9
    call $_ZN5erc207Encoder3add17h3f931a99b947504eE
    local.set 10
    local.get 5
    local.get 10
    i32.store offset=16
    i32.const 16
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    local.set 13
    local.get 13
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 14
    local.get 5
    local.get 14
    i32.store offset=12
    i32.const 1048976
    local.set 15
    i32.const 30
    local.set 16
    i32.const 12
    local.set 17
    local.get 5
    local.get 17
    i32.add
    local.set 18
    local.get 18
    local.set 19
    local.get 15
    local.get 16
    local.get 6
    local.get 7
    local.get 19
    call $_ZN5erc204log317h83749ab9d4a48b25E
    i32.const 32
    local.set 20
    local.get 5
    local.get 20
    i32.add
    local.set 21
    local.get 21
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2014approval_event17hf93fa489e477aa37E (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=20
    local.get 5
    local.get 1
    i32.store offset=24
    local.get 5
    local.get 2
    i32.store offset=28
    local.get 0
    call $_ZN77_$LT$$RF$erc20..Address$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h29e5617d735823a7E
    local.set 6
    local.get 1
    call $_ZN77_$LT$$RF$erc20..Address$u20$as$u20$core..convert..Into$LT$erc20..U256$GT$$GT$4into17h29e5617d735823a7E
    local.set 7
    call $_ZN5erc207Encoder3new17h5e84c4db1c46934cE
    local.set 8
    i32.const 1049008
    local.set 9
    local.get 8
    local.get 2
    local.get 9
    call $_ZN5erc207Encoder3add17h3f931a99b947504eE
    local.set 10
    local.get 5
    local.get 10
    i32.store offset=16
    i32.const 16
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    local.set 13
    local.get 13
    call $_ZN5erc207Encoder5build17h70f84dd1f6efadf3E
    local.set 14
    local.get 5
    local.get 14
    i32.store offset=12
    i32.const 1049024
    local.set 15
    i32.const 30
    local.set 16
    i32.const 12
    local.set 17
    local.get 5
    local.get 17
    i32.add
    local.set 18
    local.get 18
    local.set 19
    local.get 15
    local.get 16
    local.get 6
    local.get 7
    local.get 19
    call $_ZN5erc204log317h83749ab9d4a48b25E
    i32.const 32
    local.set 20
    local.get 5
    local.get 20
    i32.add
    local.set 21
    local.get 21
    global.set $__stack_pointer
    return)
  (func $_ZN5erc204init17hb8a1941cd966bca0E (type 11)
    return)
  (func $_ZN5erc208decimals17h59bf7db248d6ac72E (type 4) (result i32)
    (local i32)
    i32.const 18
    local.set 0
    local.get 0
    return)
  (func $_ZN5erc2012total_supply17h85d6b1e8b6991d9aE (type 4) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 0
    i32.const 16
    local.set 1
    local.get 0
    local.get 1
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    call $_ZN5erc2014s_total_supply17hedf1d8647c3308f9E
    local.set 3
    local.get 2
    local.get 3
    i32.store offset=12
    i32.const 12
    local.set 4
    local.get 2
    local.get 4
    i32.add
    local.set 5
    local.get 5
    local.set 6
    local.get 6
    call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
    local.set 7
    i32.const 16
    local.set 8
    local.get 2
    local.get 8
    i32.add
    local.set 9
    local.get 9
    global.set $__stack_pointer
    local.get 7
    return)
  (func $_ZN5erc2010balance_of17h3869d273118af9aaE (type 3) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 1
    i32.const 16
    local.set 2
    local.get 1
    local.get 2
    i32.sub
    local.set 3
    local.get 3
    global.set $__stack_pointer
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 0
    call $_ZN5erc2010s_balances17hd22741f516dfc3efE
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=8
    i32.const 8
    local.set 5
    local.get 3
    local.get 5
    i32.add
    local.set 6
    local.get 6
    local.set 7
    local.get 7
    call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
    local.set 8
    i32.const 16
    local.set 9
    local.get 3
    local.get 9
    i32.add
    local.set 10
    local.get 10
    global.set $__stack_pointer
    local.get 8
    return)
  (func $_ZN5erc208transfer17h08e8f7f198135a6cE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 1
    i32.store offset=4
    local.get 4
    local.get 0
    i32.store offset=12
    call $_ZN5erc2013CallerWrapper17h7400b5be519d5a1eE
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=8
    local.get 4
    i32.load offset=4
    local.set 6
    i32.const 8
    local.set 7
    local.get 4
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    local.get 9
    local.get 0
    local.get 6
    call $_ZN5erc209_transfer17hb597fc24545703b0E
    i32.const 1
    local.set 10
    i32.const 1
    local.set 11
    local.get 10
    local.get 11
    i32.and
    local.set 12
    i32.const 16
    local.set 13
    local.get 4
    local.get 13
    i32.add
    local.set 14
    local.get 14
    global.set $__stack_pointer
    local.get 12
    return)
  (func $_ZN5erc209_transfer17hb597fc24545703b0E (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    local.get 0
    call $_ZN5erc207Address7is_zero17he26195ecac2cce46E
    local.set 6
    i32.const 1
    local.set 7
    local.get 6
    local.get 7
    i32.and
    local.set 8
    block  ;; label = @1
      local.get 8
      br_if 0 (;@1;)
      i32.const 1049054
      local.set 9
      i32.const 14
      local.set 10
      local.get 9
      local.get 10
      call $_ZN5erc204fail17h0b37b7c516e0a87dE
      unreachable
    end
    local.get 1
    call $_ZN5erc207Address7is_zero17he26195ecac2cce46E
    local.set 11
    i32.const 1
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    block  ;; label = @1
      local.get 13
      br_if 0 (;@1;)
      i32.const 1049068
      local.set 14
      i32.const 16
      local.set 15
      local.get 14
      local.get 15
      call $_ZN5erc204fail17h0b37b7c516e0a87dE
      unreachable
    end
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc207_update17h5eb4e22a9ded8e16E
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc2014transfer_event17h85b922127af61618E
    i32.const 16
    local.set 16
    local.get 5
    local.get 16
    i32.add
    local.set 17
    local.get 17
    global.set $__stack_pointer
    return)
  (func $_ZN5erc209allowance17h9e49f6e34cd21d88E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN5erc2012s_allowances17hd9fc713e7dd12b12E
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=4
    i32.const 4
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    local.get 8
    call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
    local.set 9
    i32.const 16
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    global.set $__stack_pointer
    local.get 9
    return)
  (func $_ZN5erc207approve17hedce0ccdcba7012fE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    call $_ZN5erc2013CallerWrapper17h7400b5be519d5a1eE
    local.set 5
    local.get 4
    local.get 5
    i32.store offset=4
    i32.const 4
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    local.set 8
    i32.const 1
    local.set 9
    i32.const 1
    local.set 10
    local.get 9
    local.get 10
    i32.and
    local.set 11
    local.get 8
    local.get 0
    local.get 1
    local.get 11
    call $_ZN5erc208_approve17ha8ddb66aa0ba96b5E
    i32.const 1
    local.set 12
    i32.const 1
    local.set 13
    local.get 12
    local.get 13
    i32.and
    local.set 14
    i32.const 16
    local.set 15
    local.get 4
    local.get 15
    i32.add
    local.set 16
    local.get 16
    global.set $__stack_pointer
    local.get 14
    return)
  (func $_ZN5erc208_approve17ha8ddb66aa0ba96b5E (type 6) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 4
    i32.const 32
    local.set 5
    local.get 4
    local.get 5
    i32.sub
    local.set 6
    local.get 6
    global.set $__stack_pointer
    local.get 6
    local.get 2
    i32.store offset=12
    local.get 6
    local.get 0
    i32.store offset=20
    local.get 6
    local.get 1
    i32.store offset=24
    local.get 3
    local.set 7
    local.get 6
    local.get 7
    i32.store8 offset=31
    local.get 0
    call $_ZN5erc207Address7is_zero17he26195ecac2cce46E
    local.set 8
    i32.const 1
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    block  ;; label = @1
      local.get 10
      br_if 0 (;@1;)
      i32.const 1049104
      local.set 11
      i32.const 16
      local.set 12
      local.get 11
      local.get 12
      call $_ZN5erc204fail17h0b37b7c516e0a87dE
      unreachable
    end
    local.get 1
    call $_ZN5erc207Address7is_zero17he26195ecac2cce46E
    local.set 13
    i32.const 1
    local.set 14
    local.get 13
    local.get 14
    i32.and
    local.set 15
    block  ;; label = @1
      local.get 15
      br_if 0 (;@1;)
      i32.const 1049120
      local.set 16
      i32.const 15
      local.set 17
      local.get 16
      local.get 17
      call $_ZN5erc204fail17h0b37b7c516e0a87dE
      unreachable
    end
    local.get 0
    local.get 1
    call $_ZN5erc2012s_allowances17hd9fc713e7dd12b12E
    local.set 18
    local.get 6
    local.get 18
    i32.store offset=16
    local.get 6
    i32.load offset=12
    local.set 19
    local.get 19
    call $_ZN53_$LT$erc20..Balance$u20$as$u20$core..clone..Clone$GT$5clone17h2767651bf9a05109E
    local.set 20
    i32.const 16
    local.set 21
    local.get 6
    local.get 21
    i32.add
    local.set 22
    local.get 22
    local.set 23
    local.get 23
    local.get 20
    call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3set17h70ac12d78ca4dccfE
    local.get 3
    local.set 24
    block  ;; label = @1
      local.get 24
      i32.eqz
      br_if 0 (;@1;)
      local.get 6
      i32.load offset=12
      local.set 25
      local.get 0
      local.get 1
      local.get 25
      call $_ZN5erc2014approval_event17hf93fa489e477aa37E
    end
    i32.const 32
    local.set 26
    local.get 6
    local.get 26
    i32.add
    local.set 27
    local.get 27
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2013transfer_from17hb9caef494aa68a15E (type 1) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 16
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 0
    i32.store offset=4
    local.get 5
    local.get 1
    i32.store offset=8
    local.get 5
    local.get 2
    i32.store offset=12
    call $_ZN5erc2013CallerWrapper17h7400b5be519d5a1eE
    local.set 6
    local.get 5
    local.get 6
    i32.store
    local.get 5
    local.set 7
    local.get 0
    local.get 7
    local.get 2
    call $_ZN5erc2016_spend_allowance17heafae8d0fe0073d0E
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc209_transfer17hb597fc24545703b0E
    i32.const 1
    local.set 8
    i32.const 1
    local.set 9
    local.get 8
    local.get 9
    i32.and
    local.set 10
    i32.const 16
    local.set 11
    local.get 5
    local.get 11
    i32.add
    local.set 12
    local.get 12
    global.set $__stack_pointer
    local.get 10
    return)
  (func $_ZN5erc2016_spend_allowance17heafae8d0fe0073d0E (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 32
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 2
    i32.store offset=8
    local.get 5
    local.get 0
    i32.store offset=24
    local.get 5
    local.get 1
    i32.store offset=28
    local.get 0
    local.get 1
    call $_ZN5erc209allowance17h9e49f6e34cd21d88E
    local.set 6
    local.get 5
    local.get 6
    i32.store offset=12
    i32.const 12
    local.set 7
    local.get 5
    local.get 7
    i32.add
    local.set 8
    local.get 8
    local.set 9
    local.get 5
    local.get 9
    i32.store offset=16
    i32.const 8
    local.set 10
    local.get 5
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.set 12
    i32.const 16
    local.set 13
    local.get 5
    local.get 13
    i32.add
    local.set 14
    local.get 14
    local.set 15
    local.get 12
    local.get 15
    call $_ZN4core3cmp5impls70_$LT$impl$u20$core..cmp..PartialOrd$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2le17h7893402d7f08bc2cE
    local.set 16
    i32.const 1
    local.set 17
    local.get 16
    local.get 17
    i32.and
    local.set 18
    block  ;; label = @1
      local.get 18
      br_if 0 (;@1;)
      local.get 5
      i32.load offset=12
      local.set 19
      local.get 5
      i32.load offset=8
      local.set 20
      local.get 19
      local.get 20
      call $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..Balance$GT$$GT$3sub17ha848b5075a9a4ef2E
      local.set 21
      local.get 5
      local.get 21
      i32.store offset=20
      i32.const 20
      local.set 22
      local.get 5
      local.get 22
      i32.add
      local.set 23
      local.get 23
      local.set 24
      i32.const 0
      local.set 25
      i32.const 1
      local.set 26
      local.get 25
      local.get 26
      i32.and
      local.set 27
      local.get 0
      local.get 1
      local.get 24
      local.get 27
      call $_ZN5erc208_approve17ha8ddb66aa0ba96b5E
      i32.const 32
      local.set 28
      local.get 5
      local.get 28
      i32.add
      local.set 29
      local.get 29
      global.set $__stack_pointer
      return
    end
    i32.const 1049135
    local.set 30
    i32.const 21
    local.set 31
    local.get 30
    local.get 31
    call $_ZN5erc204fail17h0b37b7c516e0a87dE
    unreachable)
  (func $_ZN5erc207_update17h5eb4e22a9ded8e16E (type 9) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 3
    i32.const 64
    local.set 4
    local.get 3
    local.get 4
    i32.sub
    local.set 5
    local.get 5
    global.set $__stack_pointer
    local.get 5
    local.get 2
    i32.store offset=8
    local.get 5
    local.get 0
    i32.store offset=56
    local.get 5
    local.get 1
    i32.store offset=60
    local.get 0
    call $_ZN5erc207Address7is_zero17he26195ecac2cce46E
    local.set 6
    i32.const 1
    local.set 7
    local.get 6
    local.get 7
    i32.and
    local.set 8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 8
            br_if 0 (;@4;)
            local.get 0
            call $_ZN5erc2010s_balances17hd22741f516dfc3efE
            local.set 9
            local.get 5
            local.get 9
            i32.store offset=24
            i32.const 24
            local.set 10
            local.get 5
            local.get 10
            i32.add
            local.set 11
            local.get 11
            local.set 12
            local.get 12
            call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
            local.set 13
            local.get 5
            local.get 13
            i32.store offset=20
            i32.const 20
            local.set 14
            local.get 5
            local.get 14
            i32.add
            local.set 15
            local.get 15
            local.set 16
            local.get 5
            local.get 16
            i32.store offset=28
            i32.const 8
            local.set 17
            local.get 5
            local.get 17
            i32.add
            local.set 18
            local.get 18
            local.set 19
            i32.const 28
            local.set 20
            local.get 5
            local.get 20
            i32.add
            local.set 21
            local.get 21
            local.set 22
            local.get 19
            local.get 22
            call $_ZN4core3cmp5impls70_$LT$impl$u20$core..cmp..PartialOrd$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2le17h7893402d7f08bc2cE
            local.set 23
            i32.const 1
            local.set 24
            local.get 23
            local.get 24
            i32.and
            local.set 25
            local.get 25
            br_if 2 (;@2;)
            br 1 (;@3;)
          end
          call $_ZN5erc2014s_total_supply17hedf1d8647c3308f9E
          local.set 26
          local.get 5
          local.get 26
          i32.store offset=12
          call $_ZN5erc2014s_total_supply17hedf1d8647c3308f9E
          local.set 27
          local.get 5
          local.get 27
          i32.store offset=16
          i32.const 16
          local.set 28
          local.get 5
          local.get 28
          i32.add
          local.set 29
          local.get 29
          local.set 30
          local.get 30
          call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
          local.set 31
          local.get 5
          i32.load offset=8
          local.set 32
          local.get 31
          local.get 32
          call $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..Balance$GT$$GT$3add17h6704e843e686e11fE
          local.set 33
          i32.const 12
          local.set 34
          local.get 5
          local.get 34
          i32.add
          local.set 35
          local.get 35
          local.set 36
          local.get 36
          local.get 33
          call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3set17h70ac12d78ca4dccfE
          br 2 (;@1;)
        end
        local.get 0
        call $_ZN5erc2010s_balances17hd22741f516dfc3efE
        local.set 37
        local.get 5
        local.get 37
        i32.store offset=32
        local.get 0
        call $_ZN5erc2010s_balances17hd22741f516dfc3efE
        local.set 38
        local.get 5
        local.get 38
        i32.store offset=36
        i32.const 36
        local.set 39
        local.get 5
        local.get 39
        i32.add
        local.set 40
        local.get 40
        local.set 41
        local.get 41
        call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
        local.set 42
        local.get 5
        i32.load offset=8
        local.set 43
        local.get 42
        local.get 43
        call $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..Balance$GT$$GT$3sub17ha848b5075a9a4ef2E
        local.set 44
        i32.const 32
        local.set 45
        local.get 5
        local.get 45
        i32.add
        local.set 46
        local.get 46
        local.set 47
        local.get 47
        local.get 44
        call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3set17h70ac12d78ca4dccfE
        br 1 (;@1;)
      end
      i32.const 1049084
      local.set 48
      i32.const 20
      local.set 49
      local.get 48
      local.get 49
      call $_ZN5erc204fail17h0b37b7c516e0a87dE
      unreachable
    end
    local.get 1
    call $_ZN5erc207Address7is_zero17he26195ecac2cce46E
    local.set 50
    i32.const 1
    local.set 51
    local.get 50
    local.get 51
    i32.and
    local.set 52
    block  ;; label = @1
      block  ;; label = @2
        local.get 52
        br_if 0 (;@2;)
        local.get 1
        call $_ZN5erc2010s_balances17hd22741f516dfc3efE
        local.set 53
        local.get 5
        local.get 53
        i32.store offset=48
        local.get 1
        call $_ZN5erc2010s_balances17hd22741f516dfc3efE
        local.set 54
        local.get 5
        local.get 54
        i32.store offset=52
        i32.const 52
        local.set 55
        local.get 5
        local.get 55
        i32.add
        local.set 56
        local.get 56
        local.set 57
        local.get 57
        call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
        local.set 58
        local.get 5
        i32.load offset=8
        local.set 59
        local.get 58
        local.get 59
        call $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..Balance$GT$$GT$3add17h6704e843e686e11fE
        local.set 60
        i32.const 48
        local.set 61
        local.get 5
        local.get 61
        i32.add
        local.set 62
        local.get 62
        local.set 63
        local.get 63
        local.get 60
        call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3set17h70ac12d78ca4dccfE
        br 1 (;@1;)
      end
      call $_ZN5erc2014s_total_supply17hedf1d8647c3308f9E
      local.set 64
      local.get 5
      local.get 64
      i32.store offset=40
      call $_ZN5erc2014s_total_supply17hedf1d8647c3308f9E
      local.set 65
      local.get 5
      local.get 65
      i32.store offset=44
      i32.const 44
      local.set 66
      local.get 5
      local.get 66
      i32.add
      local.set 67
      local.get 67
      local.set 68
      local.get 68
      call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3get17h47fc8ce4dfc4ce13E
      local.set 69
      local.get 5
      i32.load offset=8
      local.set 70
      local.get 69
      local.get 70
      call $_ZN82_$LT$erc20..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..Balance$GT$$GT$3sub17ha848b5075a9a4ef2E
      local.set 71
      i32.const 40
      local.set 72
      local.get 5
      local.get 72
      i32.add
      local.set 73
      local.get 73
      local.set 74
      local.get 74
      local.get 71
      call $_ZN5erc2034SingleValueMapper$LT$ValueType$GT$3set17h70ac12d78ca4dccfE
    end
    i32.const 64
    local.set 75
    local.get 5
    local.get 75
    i32.add
    local.set 76
    local.get 76
    global.set $__stack_pointer
    return)
  (func $_ZN56_$LT$erc20..Balance$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17hb2fae59fcc783981E (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    global.set $__stack_pointer
    local.get 4
    local.get 0
    i32.store offset=8
    local.get 4
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 1
    call $_ZN53_$LT$erc20..U256$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h58b9f39ef47b1a24E
    local.set 5
    i32.const 16
    local.set 6
    local.get 4
    local.get 6
    i32.add
    local.set 7
    local.get 7
    global.set $__stack_pointer
    local.get 5
    return)
  (func $_ZN60_$LT$core..cmp..Ordering$u20$as$u20$core..cmp..PartialEq$GT$2eq17h4f7e0e7136f3950eE (type 0) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    local.set 2
    i32.const 16
    local.set 3
    local.get 2
    local.get 3
    i32.sub
    local.set 4
    local.get 4
    local.get 0
    i32.store offset=4
    local.get 4
    local.get 1
    i32.store offset=8
    local.get 0
    i32.load8_u
    local.set 5
    local.get 4
    local.get 5
    i32.store8 offset=14
    local.get 1
    i32.load8_u
    local.set 6
    local.get 4
    local.get 6
    i32.store8 offset=15
    i32.const 255
    local.set 7
    local.get 5
    local.get 7
    i32.and
    local.set 8
    i32.const 255
    local.set 9
    local.get 6
    local.get 9
    i32.and
    local.set 10
    local.get 8
    local.get 10
    i32.eq
    local.set 11
    i32.const 1
    local.set 12
    local.get 11
    local.get 12
    i32.and
    local.set 13
    local.get 13
    return)
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h1c3f1cbd1368fccaE (type 7) (param i32))
  (func $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE (type 2) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store16 offset=28
    local.get 2
    local.get 1
    i32.store offset=24
    local.get 2
    local.get 0
    i32.store offset=20
    local.get 2
    i32.const 1049192
    i32.store offset=16
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h4e5a4609280a40f1E (type 2) (param i32 i32)
    local.get 0
    i64.const 9172487606043731407
    i64.store offset=8
    local.get 0
    i64.const -8877450274954529964
    i64.store)
  (func $_ZN4core9panicking11panic_const24panic_const_add_overflow17hde776086e9d58b0fE (type 7) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 0
    i32.store offset=24
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1049184
    i32.store offset=8
    local.get 1
    i64.const 4
    i64.store offset=16 align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (table (;0;) 7 7 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1049208))
  (global (;2;) i32 (i32.const 1049216))
  (export "memory" (memory 0))
  (export "dispatch" (func $dispatch))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func $_ZN4core3ptr35drop_in_place$LT$erc20..Address$GT$17hb179604cdef5c068E $_ZN51_$LT$erc20..Address$u20$as$u20$erc20..Encodable$GT$6add_to17hde15938faf9b6a30E $_ZN4core3ptr35drop_in_place$LT$erc20..Balance$GT$17hd00972ed07fc92c1E $_ZN51_$LT$erc20..Balance$u20$as$u20$erc20..Encodable$GT$6add_to17h41814c5986643b6dE $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h1c3f1cbd1368fccaE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h4e5a4609280a40f1E)
  (data $.rodata (i32.const 1048576) "src/lib.rs\00\00\00\00\10\00\0a\00\00\00\e1\00\00\00\19\00\00\00\00\00\10\00\0a\00\00\00&\02\00\00 \00\00\00Signature too shortPanicsrc/lib.rs\00\00D\00\10\00\0a\00\00\00\ab\00\00\00Y\00\00\00Did not read all inputUnexpected input.\00D\00\10\00\0a\00\00\00\df\01\00\00\0f\00\00\00D\00\10\00\0a\00\00\00\10\02\00\00\0f\00\00\00decimals()totalSupply()balanceOf(address)transfer(address,uint256)allowance(address,address)approve(address,uint256)transferFrom(address,address,uint256)Unknown endpointBuffer without function signaturetotal_supply\00\00\01\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00Transfer(address,address,u256)\00\00\03\00\00\00\04\00\00\00\04\00\00\00\04\00\00\00Approval(address,address,u256)Invalid senderInvalid receiverInsufficient balanceInvalid approverInvalid spenderInsuficient allowanceattempt to add with overflowD\02\10\00\1c\00\00\00\05\00\00\00\00\00\00\00\01\00\00\00\06\00\00\00"))
