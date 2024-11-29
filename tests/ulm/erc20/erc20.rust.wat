(module $erc20.wasm
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i64) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32)))
  (type (;7;) (func (param i32)))
  (type (;8;) (func (param i32 i32) (result i64)))
  (type (;9;) (func (param i32 i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32)))
  (type (;11;) (func))
  (import "env" "SetAccountStorage" (func $SetAccountStorage (type 1)))
  (import "env" "GetAccountStorage" (func $GetAccountStorage (type 2)))
  (import "env" "fingerprint" (func $fingerprint (type 2)))
  (import "env" "bytesLength" (func $bytesLength (type 2)))
  (import "env" "bytesSubstr" (func $bytesSubstr (type 3)))
  (import "env" "cmpBytes" (func $cmpBytes (type 0)))
  (import "env" "newEncoder" (func $newEncoder (type 4)))
  (import "env" "u256FromU64" (func $u256FromU64 (type 5)))
  (import "env" "encoderAddU256" (func $encoderAddU256 (type 0)))
  (import "env" "encoderToBytes" (func $encoderToBytes (type 2)))
  (import "env" "intSub" (func $intSub (type 0)))
  (import "env" "intAdd" (func $intAdd (type 0)))
  (import "env" "cmpInt" (func $cmpInt (type 0)))
  (import "env" "u256FromBytes" (func $u256FromBytes (type 2)))
  (import "env" "decoderFromBuffer" (func $decoderFromBuffer (type 2)))
  (import "env" "decoderValueCount" (func $decoderValueCount (type 2)))
  (import "env" "isValidDecoder" (func $isValidDecoder (type 2)))
  (import "env" "fail" (func $fail (type 1)))
  (import "env" "signatureFingerprint" (func $signatureFingerprint (type 0)))
  (import "env" "encoderAddStr" (func $encoderAddStr (type 3)))
  (import "env" "u160FromU64" (func $u160FromU64 (type 5)))
  (import "env" "u256FromIntId" (func $u256FromIntId (type 2)))
  (import "env" "u160FromIntId" (func $u160FromIntId (type 2)))
  (import "env" "Caller" (func $Caller (type 4)))
  (import "env" "Log3" (func $Log3 (type 6)))
  (import "env" "CallData" (func $CallData (type 4)))
  (import "env" "SetOutput" (func $SetOutput (type 7)))
  (import "env" "decoderRegister" (func $decoderRegister (type 3)))
  (import "env" "decodeExtractBytes" (func $decodeExtractBytes (type 0)))
  (func $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3new17haccb738ecb8c3fc6E (type 2) (param i32) (result i32)
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
  (func $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3set17h32ecd24cf2981267E (type 1) (param i32 i32)
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
    call $_ZN88_$LT$erc20..balance..Balance$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hedbef66d4283e5e0E
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
  (func $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE (type 2) (param i32) (result i32)
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
    call $_ZN5erc204u2564U2567from_id17h803f5db381600ddeE
    local.set 6
    i32.const 1048596
    local.set 7
    local.get 6
    local.get 7
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h88825d208e00007cE
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
  (func $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$3new17h4c1afdcf2aa53cfeE (type 0) (param i32 i32) (result i32)
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
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 5
    local.get 5
    local.get 0
    local.get 1
    call $_ZN5erc207encoder7Encoder7add_str17h48eade08653f0a38E
    local.set 6
    local.get 6
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$12from_encoder17h19aaa0c3f8f335ebE
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
  (func $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$12from_encoder17h19aaa0c3f8f335ebE (type 2) (param i32) (result i32)
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
  (func $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hb79a0694916ff152E (type 3) (param i32 i32 i32) (result i32)
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
    call $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE
    local.set 6
    local.get 6
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$12from_encoder17h19aaa0c3f8f335ebE
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
  (func $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$5build17haf899c3202fbea93E (type 2) (param i32) (result i32)
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
    call $_ZN5erc204u2564U2567from_id17h803f5db381600ddeE
    local.set 9
    local.get 9
    call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3new17haccb738ecb8c3fc6E
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
  (func $_ZN5erc2010assertions4fail17h770341421e219d38E (type 1) (param i32 i32)
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
    i32.const 1048612
    local.set 4
    i32.const 5
    local.set 5
    local.get 4
    local.get 5
    call $_ZN5erc2010assertions4fail17h770341421e219d38E
    unreachable)
  (func $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h73918c771f211e87E (type 0) (param i32 i32) (result i32)
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
    call $_ZN88_$LT$erc20..address..Address$u20$as$u20$core..convert..From$LT$erc20..u256..U256$GT$$GT$4from17h99acffe3fa30dc49E
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
  (func $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h88825d208e00007cE (type 0) (param i32 i32) (result i32)
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
    call $_ZN88_$LT$erc20..balance..Balance$u20$as$u20$core..convert..From$LT$erc20..u256..U256$GT$$GT$4from17h2da9e7e2f9c4185aE
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
  (func $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E (type 2) (param i32) (result i32)
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
  (func $_ZN5erc205bytes5Bytes6length17h1b60fb5c99d406f1E (type 2) (param i32) (result i32)
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
  (func $_ZN5erc205bytes5Bytes6substr17hf571efe870c33040E (type 3) (param i32 i32 i32) (result i32)
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
    call $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E
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
  (func $_ZN54_$LT$erc20..bytes..Bytes$u20$as$u20$core..cmp..Ord$GT$3cmp17hd703997e965a7495E (type 0) (param i32 i32) (result i32)
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
  (func $_ZN60_$LT$erc20..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h6c48405eb7a60734E (type 0) (param i32 i32) (result i32)
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
    call $_ZN54_$LT$erc20..bytes..Bytes$u20$as$u20$core..cmp..Ord$GT$3cmp17hd703997e965a7495E
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
    i32.const 1048617
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
  (func $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE (type 4) (result i32)
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
  (func $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE (type 3) (param i32 i32 i32) (result i32)
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
  (func $_ZN5erc207encoder7Encoder8add_bool17hc20e2a4347cfa111E (type 0) (param i32 i32) (result i32)
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
  (func $_ZN5erc207encoder7Encoder6add_u817h07f8be4f229cdce8E (type 0) (param i32 i32) (result i32)
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
    i32.const 1048632
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
  (func $_ZN5erc207encoder7Encoder7add_str17h48eade08653f0a38E (type 3) (param i32 i32 i32) (result i32)
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
  (func $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE (type 2) (param i32) (result i32)
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
    call $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E
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
  (func $_ZN5erc204u2564U2567from_id17h803f5db381600ddeE (type 2) (param i32) (result i32)
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
  (func $_ZN88_$LT$erc20..u256..U256$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..u256..U256$GT$$GT$3sub17hcc32ad51d4288c61E (type 0) (param i32 i32) (result i32)
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
  (func $_ZN88_$LT$erc20..u256..U256$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..u256..U256$GT$$GT$3add17h1ecc2631a9ce6b5fE (type 0) (param i32 i32) (result i32)
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
  (func $_ZN52_$LT$erc20..u256..U256$u20$as$u20$core..cmp..Ord$GT$3cmp17hf9b2169d053301feE (type 0) (param i32 i32) (result i32)
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
  (func $_ZN59_$LT$erc20..u256..U256$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h08221bba81b05d26E (type 0) (param i32 i32) (result i32)
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
    call $_ZN52_$LT$erc20..u256..U256$u20$as$u20$core..cmp..Ord$GT$3cmp17hf9b2169d053301feE
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
  (func $_ZN56_$LT$erc20..u256..U256$u20$as$u20$core..clone..Clone$GT$5clone17h9d80d1a4a6549231E (type 2) (param i32) (result i32)
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
  (func $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17h19915b1e4b69f615E (type 0) (param i32 i32) (result i32)
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
  (func $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17hff1131dd9b2cdc75E (type 4) (result i32)
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
  (func $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h90a70989d73c616cE (type 4) (result i32)
    (local i32)
    i32.const 32
    local.set 0
    local.get 0
    return)
  (func $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hf088c45c5c047980E (type 2) (param i32) (result i32)
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
  (func $_ZN5erc207decoder7Decoder11from_buffer17h1f5c3050793fe7c6E (type 1) (param i32 i32)
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
  (func $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E (type 7) (param i32)
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
    i32.const 1048648
    local.set 14
    i32.const 22
    local.set 15
    local.get 14
    local.get 15
    call $_ZN5erc2010assertions4fail17h770341421e219d38E
    unreachable)
  (func $_ZN5erc207decoder7Decoder13validate_data17h6a69297ef76a79f4E (type 7) (param i32)
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
    i32.const 1048670
    local.set 12
    i32.const 17
    local.set 13
    local.get 12
    local.get 13
    call $_ZN5erc2010assertions4fail17h770341421e219d38E
    unreachable)
  (func $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..balance..Balance$GT$$GT$3sub17hcf783bc0487d51e9E (type 0) (param i32 i32) (result i32)
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
    call $_ZN88_$LT$erc20..u256..U256$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..u256..U256$GT$$GT$3sub17hcc32ad51d4288c61E
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
  (func $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..balance..Balance$GT$$GT$3add17hffe4c1029010cb2fE (type 0) (param i32 i32) (result i32)
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
    call $_ZN88_$LT$erc20..u256..U256$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..u256..U256$GT$$GT$3add17h1ecc2631a9ce6b5fE
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
  (func $_ZN88_$LT$erc20..balance..Balance$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hedbef66d4283e5e0E (type 2) (param i32) (result i32)
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
  (func $_ZN88_$LT$erc20..balance..Balance$u20$as$u20$core..convert..From$LT$erc20..u256..U256$GT$$GT$4from17h2da9e7e2f9c4185aE (type 2) (param i32) (result i32)
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
  (func $_ZN62_$LT$erc20..balance..Balance$u20$as$u20$core..clone..Clone$GT$5clone17hfc85203d540af18aE (type 2) (param i32) (result i32)
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
    call $_ZN56_$LT$erc20..u256..U256$u20$as$u20$core..clone..Clone$GT$5clone17h9d80d1a4a6549231E
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
  (func $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17hd7ca5a57f68c1f2eE (type 0) (param i32 i32) (result i32)
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
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17h19915b1e4b69f615E
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
  (func $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17h083f63e4ebcd9366E (type 4) (result i32)
    (local i32 i32 i32)
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17hff1131dd9b2cdc75E
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    return)
  (func $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h1c4146462953415bE (type 4) (result i32)
    (local i32)
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h90a70989d73c616cE
    local.set 0
    local.get 0
    return)
  (func $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..decoder..Decodable$GT$6decode17h19af32acb5a50a6eE (type 2) (param i32) (result i32)
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
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hf088c45c5c047980E
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    i32.const 1048704
    local.set 5
    local.get 4
    local.get 5
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h88825d208e00007cE
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
  (func $_ZN65_$LT$erc20..balance..Balance$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17hfb87ca8022bfd03aE (type 0) (param i32 i32) (result i32)
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
    call $_ZN59_$LT$erc20..u256..U256$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17h08221bba81b05d26E
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
  (func $_ZN4core3cmp10PartialOrd2le17h08fcfc730c9adb26E (type 0) (param i32 i32) (result i32)
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
    call $_ZN65_$LT$erc20..balance..Balance$u20$as$u20$core..cmp..PartialOrd$GT$11partial_cmp17hfb87ca8022bfd03aE
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
  (func $_ZN4core3cmp5impls70_$LT$impl$u20$core..cmp..PartialOrd$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2le17hbd011d94f76634d3E (type 0) (param i32 i32) (result i32)
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
    call $_ZN4core3cmp10PartialOrd2le17h08fcfc730c9adb26E
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
  (func $_ZN4core3ptr44drop_in_place$LT$erc20..address..Address$GT$17h8456b4854419963dE (type 7) (param i32)
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
  (func $_ZN4core3ptr44drop_in_place$LT$erc20..balance..Balance$GT$17h76e05e6c9083f3e6E (type 7) (param i32)
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
  (func $_ZN5erc209ulm_hooks11failWrapper17h9cdd5286d3613c7fE (type 1) (param i32 i32)
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
    i32.const 1048720
    local.set 18
    i32.const 19
    local.set 19
    local.get 18
    local.get 19
    call $_ZN5erc209ulm_hooks11failWrapper17h9cdd5286d3613c7fE
    unreachable)
  (func $_ZN5erc209ulm_hooks20encoderAddStrWrapper17h55165afa3106331eE (type 3) (param i32 i32 i32) (result i32)
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
  (func $_ZN5erc207address7Address4zero17h0e5fb3f67c2242c2E (type 4) (result i32)
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
  (func $_ZN5erc207address7Address7from_id17he783da6766323a81E (type 2) (param i32) (result i32)
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
  (func $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE (type 2) (param i32) (result i32)
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
    call $_ZN5erc207address7Address4zero17h0e5fb3f67c2242c2E
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
  (func $_ZN92_$LT$$RF$erc20..address..Address$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hfaa8bb23fc92c9b2E (type 2) (param i32) (result i32)
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
    call $_ZN5erc204u2564U2567from_id17h803f5db381600ddeE
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
  (func $_ZN88_$LT$erc20..address..Address$u20$as$u20$core..convert..From$LT$erc20..u256..U256$GT$$GT$4from17h99acffe3fa30dc49E (type 2) (param i32) (result i32)
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
  (func $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17hbf87ab60036eabf4E (type 0) (param i32 i32) (result i32)
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
    call $_ZN92_$LT$$RF$erc20..address..Address$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hfaa8bb23fc92c9b2E
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
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17h19915b1e4b69f615E
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
  (func $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17hed2c5fe86201076eE (type 4) (result i32)
    (local i32 i32 i32)
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17hff1131dd9b2cdc75E
    local.set 0
    i32.const 1
    local.set 1
    local.get 0
    local.get 1
    i32.and
    local.set 2
    local.get 2
    return)
  (func $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h5b675d0368481b09E (type 4) (result i32)
    (local i32)
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h90a70989d73c616cE
    local.set 0
    local.get 0
    return)
  (func $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..decoder..Decodable$GT$6decode17h4ddec667a8dbb3bdE (type 2) (param i32) (result i32)
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
    call $_ZN63_$LT$erc20..u256..U256$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hf088c45c5c047980E
    local.set 4
    local.get 3
    local.get 4
    i32.store offset=12
    i32.const 1048756
    local.set 5
    local.get 4
    local.get 5
    call $_ZN50_$LT$T$u20$as$u20$core..convert..Into$LT$U$GT$$GT$4into17h73918c771f211e87E
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
  (func $_ZN5erc2013CallerWrapper17hcc834606c06a9aefE (type 4) (result i32)
    (local i32 i32)
    call $Caller
    local.set 0
    local.get 0
    call $_ZN5erc207address7Address7from_id17he783da6766323a81E
    local.set 1
    local.get 1
    return)
  (func $_ZN5erc204log317hd2e263bf345704ecE (type 9) (param i32 i32 i32 i32 i32)
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
  (func $_ZN5erc2014same_signature17h585c21bffd3f9488E (type 3) (param i32 i32 i32) (result i32)
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
    call $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E
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
    call $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17h259317a46a8973c6E
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
    call $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E
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
                                        call $_ZN5erc205bytes5Bytes6length17h1b60fb5c99d406f1E
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
                                      call $_ZN5erc207decoder7Decoder11from_buffer17h1f5c3050793fe7c6E
                                      local.get 3
                                      i32.load offset=4
                                      local.set 19
                                      local.get 3
                                      i32.load
                                      local.set 20
                                      local.get 20
                                      local.get 19
                                      call $_ZN5erc2010initCaller17hd18ce7a2c5b62a05E
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
                                    call $_ZN5erc205bytes5Bytes6substr17hf571efe870c33040E
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
                                    call $_ZN5erc205bytes5Bytes6length17h1b60fb5c99d406f1E
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
                                    call $_ZN5erc205bytes5Bytes6substr17hf571efe870c33040E
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
                                    call $_ZN5erc207decoder7Decoder11from_buffer17h1f5c3050793fe7c6E
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
                                    i32.const 1048772
                                    local.set 43
                                    i32.const 10
                                    local.set 44
                                    local.get 42
                                    local.get 43
                                    local.get 44
                                    call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
                                  i32.const 1048941
                                  local.set 48
                                  i32.const 33
                                  local.set 49
                                  local.get 48
                                  local.get 49
                                  call $_ZN5erc2010assertions4fail17h770341421e219d38E
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
                                i32.const 1048782
                                local.set 53
                                i32.const 13
                                local.set 54
                                local.get 52
                                local.get 53
                                local.get 54
                                call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
                              call $_ZN5erc2014decimalsCaller17he71bae09be07744cE
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
                            i32.const 1048795
                            local.set 61
                            i32.const 18
                            local.set 62
                            local.get 60
                            local.get 61
                            local.get 62
                            call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
                          call $_ZN5erc2017totalSupplyCaller17h19d85bde8ed08e83E
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
                        i32.const 1048813
                        local.set 69
                        i32.const 25
                        local.set 70
                        local.get 68
                        local.get 69
                        local.get 70
                        call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
                      call $_ZN5erc2015balanceOfCaller17hacd74ad926b74a92E
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
                    i32.const 1048838
                    local.set 77
                    i32.const 26
                    local.set 78
                    local.get 76
                    local.get 77
                    local.get 78
                    call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
                  call $_ZN5erc2014transferCaller17hb9cb5e12a96b30ccE
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
                i32.const 1048864
                local.set 85
                i32.const 24
                local.set 86
                local.get 84
                local.get 85
                local.get 86
                call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
              call $_ZN5erc2015allowanceCaller17hda135d575dbf53a2E
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
            i32.const 1048888
            local.set 93
            i32.const 37
            local.set 94
            local.get 92
            local.get 93
            local.get 94
            call $_ZN5erc2014same_signature17h585c21bffd3f9488E
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
          call $_ZN5erc2013approveCaller17h60f9f344ad971562E
          br 2 (;@1;)
        end
        i32.const 1048925
        local.set 98
        i32.const 16
        local.set 99
        local.get 98
        local.get 99
        call $_ZN5erc2010assertions4fail17h770341421e219d38E
        unreachable
      end
      local.get 39
      local.get 38
      call $_ZN5erc2018transferFromCaller17h6d9ea98cf4e7c9e0E
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
  (func $_ZN5erc2010initCaller17hd18ce7a2c5b62a05E (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
    call $_ZN5erc204init17hb8a1941cd966bca0E
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2014decimalsCaller17he71bae09be07744cE (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
    call $_ZN5erc208decimals17h59bf7db248d6ac72E
    local.set 8
    local.get 4
    local.get 8
    i32.store8 offset=27
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 9
    local.get 9
    local.get 8
    call $_ZN5erc207encoder7Encoder6add_u817h07f8be4f229cdce8E
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2017totalSupplyCaller17h19d85bde8ed08e83E (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
    call $_ZN5erc2012total_supply17h87fc8384b37c1eb3E
    local.set 8
    local.get 4
    local.get 8
    i32.store offset=20
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 9
    i32.const 20
    local.set 10
    local.get 4
    local.get 10
    i32.add
    local.set 11
    local.get 11
    local.set 12
    i32.const 1049036
    local.set 13
    local.get 9
    local.get 12
    local.get 13
    call $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2015balanceOfCaller17hacd74ad926b74a92E (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13validate_data17h6a69297ef76a79f4E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
    i32.const 20
    local.set 21
    local.get 4
    local.get 21
    i32.add
    local.set 22
    local.get 22
    local.set 23
    local.get 23
    call $_ZN5erc2010balance_of17he55a8cf0bdfa2fdeE
    local.set 24
    local.get 4
    local.get 24
    i32.store offset=44
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 25
    i32.const 44
    local.set 26
    local.get 4
    local.get 26
    i32.add
    local.set 27
    local.get 27
    local.set 28
    i32.const 1049036
    local.set 29
    local.get 25
    local.get 28
    local.get 29
    call $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2014transferCaller17hb9cb5e12a96b30ccE (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13register_data17h55c19404ff8904eeE
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
    call $_ZN5erc207decoder7Decoder13validate_data17h6a69297ef76a79f4E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder6decode17hb864f87f6e5fc4f7E
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
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
    call $_ZN5erc208transfer17hbdf658bf12731a15E
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
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 42
    i32.const 1
    local.set 43
    local.get 39
    local.get 43
    i32.and
    local.set 44
    local.get 42
    local.get 44
    call $_ZN5erc207encoder7Encoder8add_bool17hc20e2a4347cfa111E
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2015allowanceCaller17hda135d575dbf53a2E (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13validate_data17h6a69297ef76a79f4E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
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
    call $_ZN5erc209allowance17he0018ef6d4537bb9E
    local.set 39
    local.get 4
    local.get 39
    i32.store offset=76
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 40
    i32.const 76
    local.set 41
    local.get 4
    local.get 41
    i32.add
    local.set 42
    local.get 42
    local.set 43
    i32.const 1049036
    local.set 44
    local.get 40
    local.get 43
    local.get 44
    call $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2013approveCaller17h60f9f344ad971562E (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13register_data17h55c19404ff8904eeE
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
    call $_ZN5erc207decoder7Decoder13validate_data17h6a69297ef76a79f4E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder6decode17hb864f87f6e5fc4f7E
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
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
    call $_ZN5erc207approve17hfd7d0deff82a5397E
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
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 42
    i32.const 1
    local.set 43
    local.get 39
    local.get 43
    i32.and
    local.set 44
    local.get 42
    local.get 44
    call $_ZN5erc207encoder7Encoder8add_bool17hc20e2a4347cfa111E
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2018transferFromCaller17h6d9ea98cf4e7c9e0E (type 1) (param i32 i32)
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E
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
    call $_ZN5erc207decoder7Decoder13register_data17h55c19404ff8904eeE
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
    call $_ZN5erc207decoder7Decoder13validate_data17h6a69297ef76a79f4E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E
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
    call $_ZN5erc207decoder7Decoder6decode17hb864f87f6e5fc4f7E
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
    call $_ZN5erc207decoder7Decoder10check_done17hf6c42598ea2ea148E
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
    call $_ZN5erc2013transfer_from17h9d8bb371a9402da0E
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
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 53
    i32.const 1
    local.set 54
    local.get 50
    local.get 54
    i32.and
    local.set 55
    local.get 53
    local.get 55
    call $_ZN5erc207encoder7Encoder8add_bool17hc20e2a4347cfa111E
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
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
  (func $_ZN5erc2014s_total_supply17hd3bc498a99699e53E (type 4) (result i32)
    (local i32 i32 i32 i32)
    i32.const 1048974
    local.set 0
    i32.const 12
    local.set 1
    local.get 0
    local.get 1
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$3new17h4c1afdcf2aa53cfeE
    local.set 2
    local.get 2
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$5build17haf899c3202fbea93E
    local.set 3
    local.get 3
    return)
  (func $_ZN5erc2010s_balances17hf1a4ae8b529bd265E (type 2) (param i32) (result i32)
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
    i32.const 1048974
    local.set 4
    i32.const 12
    local.set 5
    local.get 4
    local.get 5
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$3new17h4c1afdcf2aa53cfeE
    local.set 6
    i32.const 1048988
    local.set 7
    local.get 6
    local.get 0
    local.get 7
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hb79a0694916ff152E
    local.set 8
    local.get 8
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$5build17haf899c3202fbea93E
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
  (func $_ZN5erc2012s_allowances17hca9647a0c16ee44aE (type 0) (param i32 i32) (result i32)
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
    i32.const 1048974
    local.set 5
    i32.const 12
    local.set 6
    local.get 5
    local.get 6
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$3new17h4c1afdcf2aa53cfeE
    local.set 7
    i32.const 1048988
    local.set 8
    local.get 7
    local.get 0
    local.get 8
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hb79a0694916ff152E
    local.set 9
    i32.const 1048988
    local.set 10
    local.get 9
    local.get 1
    local.get 10
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$8with_arg17hb79a0694916ff152E
    local.set 11
    local.get 11
    call $_ZN5erc2012value_mapper41SingleValueMapperBuilder$LT$ValueType$GT$5build17haf899c3202fbea93E
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
  (func $_ZN5erc2014transfer_event17hbaaef7b97e8addd6E (type 10) (param i32 i32 i32)
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
    call $_ZN92_$LT$$RF$erc20..address..Address$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hfaa8bb23fc92c9b2E
    local.set 6
    local.get 1
    call $_ZN92_$LT$$RF$erc20..address..Address$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hfaa8bb23fc92c9b2E
    local.set 7
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 8
    i32.const 1049036
    local.set 9
    local.get 8
    local.get 2
    local.get 9
    call $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
    local.set 14
    local.get 5
    local.get 14
    i32.store offset=12
    i32.const 1049004
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
    call $_ZN5erc204log317hd2e263bf345704ecE
    i32.const 32
    local.set 20
    local.get 5
    local.get 20
    i32.add
    local.set 21
    local.get 21
    global.set $__stack_pointer
    return)
  (func $_ZN5erc2014approval_event17h3f2392765a8bf115E (type 10) (param i32 i32 i32)
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
    call $_ZN92_$LT$$RF$erc20..address..Address$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hfaa8bb23fc92c9b2E
    local.set 6
    local.get 1
    call $_ZN92_$LT$$RF$erc20..address..Address$u20$as$u20$core..convert..Into$LT$erc20..u256..U256$GT$$GT$4into17hfaa8bb23fc92c9b2E
    local.set 7
    call $_ZN5erc207encoder7Encoder3new17h851bfd79371892adE
    local.set 8
    i32.const 1049036
    local.set 9
    local.get 8
    local.get 2
    local.get 9
    call $_ZN5erc207encoder7Encoder3add17h17efa0f887444fffE
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
    call $_ZN5erc207encoder7Encoder5build17hf6cd92c93adac35dE
    local.set 14
    local.get 5
    local.get 14
    i32.store offset=12
    i32.const 1049052
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
    call $_ZN5erc204log317hd2e263bf345704ecE
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
  (func $_ZN5erc2012total_supply17h87fc8384b37c1eb3E (type 4) (result i32)
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
    call $_ZN5erc2014s_total_supply17hd3bc498a99699e53E
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
    call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
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
  (func $_ZN5erc2010balance_of17he55a8cf0bdfa2fdeE (type 2) (param i32) (result i32)
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
    call $_ZN5erc2010s_balances17hf1a4ae8b529bd265E
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
    call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
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
  (func $_ZN5erc208transfer17hbdf658bf12731a15E (type 0) (param i32 i32) (result i32)
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
    call $_ZN5erc2013CallerWrapper17hcc834606c06a9aefE
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
    call $_ZN5erc209_transfer17h05806431990d16b6E
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
  (func $_ZN5erc209_transfer17h05806431990d16b6E (type 10) (param i32 i32 i32)
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
    call $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE
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
      i32.const 1049082
      local.set 9
      i32.const 14
      local.set 10
      local.get 9
      local.get 10
      call $_ZN5erc2010assertions4fail17h770341421e219d38E
      unreachable
    end
    local.get 1
    call $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE
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
      i32.const 1049096
      local.set 14
      i32.const 16
      local.set 15
      local.get 14
      local.get 15
      call $_ZN5erc2010assertions4fail17h770341421e219d38E
      unreachable
    end
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc207_update17h59ea8c47a5eaa44cE
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc2014transfer_event17hbaaef7b97e8addd6E
    i32.const 16
    local.set 16
    local.get 5
    local.get 16
    i32.add
    local.set 17
    local.get 17
    global.set $__stack_pointer
    return)
  (func $_ZN5erc209allowance17he0018ef6d4537bb9E (type 0) (param i32 i32) (result i32)
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
    call $_ZN5erc2012s_allowances17hca9647a0c16ee44aE
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
    call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
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
  (func $_ZN5erc207approve17hfd7d0deff82a5397E (type 0) (param i32 i32) (result i32)
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
    call $_ZN5erc2013CallerWrapper17hcc834606c06a9aefE
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
    call $_ZN5erc208_approve17h811598e0ace302e5E
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
  (func $_ZN5erc208_approve17h811598e0ace302e5E (type 6) (param i32 i32 i32 i32)
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
    call $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE
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
      i32.const 1049132
      local.set 11
      i32.const 16
      local.set 12
      local.get 11
      local.get 12
      call $_ZN5erc2010assertions4fail17h770341421e219d38E
      unreachable
    end
    local.get 1
    call $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE
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
      i32.const 1049148
      local.set 16
      i32.const 15
      local.set 17
      local.get 16
      local.get 17
      call $_ZN5erc2010assertions4fail17h770341421e219d38E
      unreachable
    end
    local.get 0
    local.get 1
    call $_ZN5erc2012s_allowances17hca9647a0c16ee44aE
    local.set 18
    local.get 6
    local.get 18
    i32.store offset=16
    local.get 6
    i32.load offset=12
    local.set 19
    local.get 19
    call $_ZN62_$LT$erc20..balance..Balance$u20$as$u20$core..clone..Clone$GT$5clone17hfc85203d540af18aE
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
    call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3set17h32ecd24cf2981267E
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
      call $_ZN5erc2014approval_event17h3f2392765a8bf115E
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
  (func $_ZN5erc2013transfer_from17h9d8bb371a9402da0E (type 3) (param i32 i32 i32) (result i32)
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
    call $_ZN5erc2013CallerWrapper17hcc834606c06a9aefE
    local.set 6
    local.get 5
    local.get 6
    i32.store
    local.get 5
    local.set 7
    local.get 0
    local.get 7
    local.get 2
    call $_ZN5erc2016_spend_allowance17h0e433499c925c210E
    local.get 0
    local.get 1
    local.get 2
    call $_ZN5erc209_transfer17h05806431990d16b6E
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
  (func $_ZN5erc2016_spend_allowance17h0e433499c925c210E (type 10) (param i32 i32 i32)
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
    call $_ZN5erc209allowance17he0018ef6d4537bb9E
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
    call $_ZN4core3cmp5impls70_$LT$impl$u20$core..cmp..PartialOrd$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2le17hbd011d94f76634d3E
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
      call $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..balance..Balance$GT$$GT$3sub17hcf783bc0487d51e9E
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
      call $_ZN5erc208_approve17h811598e0ace302e5E
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
    i32.const 1049163
    local.set 30
    i32.const 21
    local.set 31
    local.get 30
    local.get 31
    call $_ZN5erc2010assertions4fail17h770341421e219d38E
    unreachable)
  (func $_ZN5erc207_update17h59ea8c47a5eaa44cE (type 10) (param i32 i32 i32)
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
    call $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE
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
            call $_ZN5erc2010s_balances17hf1a4ae8b529bd265E
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
            call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
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
            call $_ZN4core3cmp5impls70_$LT$impl$u20$core..cmp..PartialOrd$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2le17hbd011d94f76634d3E
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
          call $_ZN5erc2014s_total_supply17hd3bc498a99699e53E
          local.set 26
          local.get 5
          local.get 26
          i32.store offset=12
          call $_ZN5erc2014s_total_supply17hd3bc498a99699e53E
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
          call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
          local.set 31
          local.get 5
          i32.load offset=8
          local.set 32
          local.get 31
          local.get 32
          call $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..balance..Balance$GT$$GT$3add17hffe4c1029010cb2fE
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
          call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3set17h32ecd24cf2981267E
          br 2 (;@1;)
        end
        local.get 0
        call $_ZN5erc2010s_balances17hf1a4ae8b529bd265E
        local.set 37
        local.get 5
        local.get 37
        i32.store offset=32
        local.get 0
        call $_ZN5erc2010s_balances17hf1a4ae8b529bd265E
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
        call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
        local.set 42
        local.get 5
        i32.load offset=8
        local.set 43
        local.get 42
        local.get 43
        call $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..balance..Balance$GT$$GT$3sub17hcf783bc0487d51e9E
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
        call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3set17h32ecd24cf2981267E
        br 1 (;@1;)
      end
      i32.const 1049112
      local.set 48
      i32.const 20
      local.set 49
      local.get 48
      local.get 49
      call $_ZN5erc2010assertions4fail17h770341421e219d38E
      unreachable
    end
    local.get 1
    call $_ZN5erc207address7Address7is_zero17hf086e03baaa13a2eE
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
        call $_ZN5erc2010s_balances17hf1a4ae8b529bd265E
        local.set 53
        local.get 5
        local.get 53
        i32.store offset=48
        local.get 1
        call $_ZN5erc2010s_balances17hf1a4ae8b529bd265E
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
        call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
        local.set 58
        local.get 5
        i32.load offset=8
        local.set 59
        local.get 58
        local.get 59
        call $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Add$LT$$RF$erc20..balance..Balance$GT$$GT$3add17hffe4c1029010cb2fE
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
        call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3set17h32ecd24cf2981267E
        br 1 (;@1;)
      end
      call $_ZN5erc2014s_total_supply17hd3bc498a99699e53E
      local.set 64
      local.get 5
      local.get 64
      i32.store offset=40
      call $_ZN5erc2014s_total_supply17hd3bc498a99699e53E
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
      call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3get17hd6ab0d6797ac0cabE
      local.set 69
      local.get 5
      i32.load offset=8
      local.set 70
      local.get 69
      local.get 70
      call $_ZN100_$LT$erc20..balance..Balance$u20$as$u20$core..ops..arith..Sub$LT$$RF$erc20..balance..Balance$GT$$GT$3sub17hcf783bc0487d51e9E
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
      call $_ZN5erc2012value_mapper34SingleValueMapper$LT$ValueType$GT$3set17h32ecd24cf2981267E
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
  (func $_ZN5erc207decoder7Decoder13register_data17h55c19404ff8904eeE (type 10) (param i32 i32 i32)
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
    call $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h1c4146462953415bE
    local.set 6
    call $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17h083f63e4ebcd9366E
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
  (func $_ZN5erc207decoder7Decoder13register_data17h88575c688ab44d25E (type 10) (param i32 i32 i32)
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
    call $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..decoder..Decodable$GT$17encoded_head_size17h5b675d0368481b09E
    local.set 6
    call $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..decoder..Decodable$GT$18is_variable_length17hed2c5fe86201076eE
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
  (func $_ZN5erc207decoder7Decoder6decode17h00df42b9df3874b2E (type 10) (param i32 i32 i32)
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
    call $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E
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
      call $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..decoder..Decodable$GT$6decode17h4ddec667a8dbb3bdE
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
    i32.const 1049200
    local.set 18
    local.get 18
    call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hde776086e9d58b0fE
    unreachable)
  (func $_ZN5erc207decoder7Decoder6decode17hb864f87f6e5fc4f7E (type 10) (param i32 i32 i32)
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
    call $_ZN5erc205bytes5Bytes7from_id17h2e02cd3fb3c0d3d8E
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
      call $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..decoder..Decodable$GT$6decode17h19af32acb5a50a6eE
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
    i32.const 1049200
    local.set 18
    local.get 18
    call $_ZN4core9panicking11panic_const24panic_const_add_overflow17hde776086e9d58b0fE
    unreachable)
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
  (func $_ZN4core3cmp5impls69_$LT$impl$u20$core..cmp..PartialEq$LT$$RF$B$GT$$u20$for$u20$$RF$A$GT$2eq17h259317a46a8973c6E (type 0) (param i32 i32) (result i32)
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
    call $_ZN60_$LT$erc20..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h6c48405eb7a60734E
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
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h1c3f1cbd1368fccaE (type 7) (param i32))
  (func $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE (type 1) (param i32 i32)
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
    i32.const 1049252
    i32.store offset=16
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h4e5a4609280a40f1E (type 1) (param i32 i32)
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
    i32.const 1049244
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
  (global (;1;) i32 (i32.const 1049268))
  (global (;2;) i32 (i32.const 1049280))
  (export "memory" (memory 0))
  (export "dispatch" (func $dispatch))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func $_ZN4core3ptr44drop_in_place$LT$erc20..address..Address$GT$17h8456b4854419963dE $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17hbf87ab60036eabf4E $_ZN4core3ptr44drop_in_place$LT$erc20..balance..Balance$GT$17h76e05e6c9083f3e6E $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..encoder..Encodable$GT$6add_to17hd7ca5a57f68c1f2eE $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h1c3f1cbd1368fccaE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h4e5a4609280a40f1E)
  (data $.rodata (i32.const 1048576) "src/value_mapper.rs\00\00\00\10\00\13\00\00\00\1a\00\00\00\1e\00\00\00Panic\00src/encoder.rs*\00\10\00\0e\00\00\00#\00\00\00W\00\00\00Did not read all inputUnexpected input.src/balance.rs\00\00\00o\00\10\00\0e\00\00\00[\00\00\00\0f\00\00\00Signature too shortsrc/address.rs\00\00\00\a3\00\10\00\0e\00\00\004\00\00\00\0f\00\00\00decimals()totalSupply()balanceOf(address)transfer(address,uint256)allowance(address,address)approve(address,uint256)transferFrom(address,address,uint256)Unknown endpointBuffer without function signaturetotal_supply\00\00\01\00\00\00\04\00\00\00\04\00\00\00\02\00\00\00Transfer(address,address,u256)\00\00\03\00\00\00\04\00\00\00\04\00\00\00\04\00\00\00Approval(address,address,u256)Invalid senderInvalid receiverInsufficient balanceInvalid approverInvalid spenderInsuficient allowancesrc/decoder.rs\00\00`\02\10\00\0e\00\00\001\00\00\00\17\00\00\00attempt to add with overflow\80\02\10\00\1c\00\00\00\05\00\00\00\00\00\00\00\01\00\00\00\06\00\00\00"))
