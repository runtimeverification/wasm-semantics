(module $erc20.wasm
  (type (;0;) (func (param i32 i32 i32)))
  (type (;1;) (func (param i32)))
  (type (;2;) (func (param i32 i32 i32 i32)))
  (type (;3;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32)))
  (type (;8;) (func (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32) (result i32)))
  (type (;11;) (func))
  (type (;12;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;14;) (func (param i64 i32 i32) (result i32)))
  (import "env" "fail" (func $fail (type 4)))
  (import "env" "Log3" (func $Log3 (type 7)))
  (import "env" "Caller" (func $Caller (type 1)))
  (import "env" "CallDataLength" (func $CallDataLength (type 8)))
  (import "env" "CallData" (func $CallData (type 1)))
  (import "env" "GetAccountStorage" (func $GetAccountStorage (type 4)))
  (import "env" "SetAccountStorage" (func $SetAccountStorage (type 4)))
  (import "env" "setOutput" (func $setOutput (type 4)))
  (import "env" "keccakHash" (func $keccakHash (type 0)))
  (func $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=8
        i32.const 32
        i32.ne
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.tee 2
        i32.load8_u offset=31
        local.set 3
        local.get 2
        i32.load8_u offset=30
        local.set 4
        local.get 2
        i32.load8_u offset=29
        local.set 5
        local.get 2
        i32.load8_u offset=28
        local.set 6
        local.get 2
        i32.load8_u offset=27
        local.set 7
        local.get 2
        i32.load8_u offset=26
        local.set 8
        local.get 2
        i32.load8_u offset=25
        local.set 9
        local.get 2
        i32.load8_u offset=24
        local.set 10
        local.get 2
        i32.load8_u offset=23
        local.set 11
        local.get 2
        i32.load8_u offset=22
        local.set 12
        local.get 2
        i32.load8_u offset=21
        local.set 13
        local.get 2
        i32.load8_u offset=20
        local.set 14
        local.get 2
        i32.load8_u offset=19
        local.set 15
        local.get 2
        i32.load8_u offset=18
        local.set 16
        local.get 2
        i32.load8_u offset=17
        local.set 17
        local.get 2
        i32.load8_u offset=16
        local.set 18
        local.get 2
        i32.load8_u offset=15
        local.set 19
        local.get 2
        i32.load8_u offset=14
        local.set 20
        local.get 2
        i32.load8_u offset=13
        local.set 21
        local.get 2
        i32.load8_u offset=12
        local.set 22
        local.get 2
        i32.load8_u offset=11
        local.set 23
        local.get 2
        i32.load8_u offset=10
        local.set 24
        local.get 2
        i32.load8_u offset=9
        local.set 25
        local.get 2
        i32.load8_u offset=8
        local.set 26
        local.get 2
        i32.load8_u offset=7
        local.set 27
        local.get 2
        i32.load8_u offset=6
        local.set 28
        local.get 2
        i32.load8_u offset=5
        local.set 29
        local.get 2
        i32.load8_u offset=4
        local.set 30
        local.get 2
        i32.load8_u offset=3
        local.set 31
        local.get 2
        i32.load8_u offset=2
        local.set 32
        local.get 2
        i32.load8_u offset=1
        local.set 33
        local.get 2
        i32.load8_u
        local.set 34
        local.get 1
        i32.const 12
        i32.add
        local.get 2
        i32.const 32
        local.get 1
        i32.load
        i32.load offset=16
        call_indirect (type 0)
        local.get 23
        local.get 24
        local.get 25
        local.get 26
        local.get 27
        local.get 28
        local.get 29
        local.get 30
        local.get 31
        local.get 32
        local.get 33
        local.get 34
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.or
        i32.eqz
        br_if 1 (;@1;)
        i32.const 1048866
        i32.const 23
        call $_ZN5erc2010assertions4fail17had502d4821c562c7E
        unreachable
      end
      i32.const 1048957
      i32.const 22
      call $_ZN5erc2010assertions4fail17had502d4821c562c7E
      unreachable
    end
    local.get 0
    local.get 22
    i32.store8 offset=19
    local.get 0
    local.get 21
    i32.store8 offset=18
    local.get 0
    local.get 20
    i32.store8 offset=17
    local.get 0
    local.get 19
    i32.store8 offset=16
    local.get 0
    local.get 18
    i32.store8 offset=15
    local.get 0
    local.get 17
    i32.store8 offset=14
    local.get 0
    local.get 16
    i32.store8 offset=13
    local.get 0
    local.get 15
    i32.store8 offset=12
    local.get 0
    local.get 14
    i32.store8 offset=11
    local.get 0
    local.get 5
    i32.store8 offset=2
    local.get 0
    local.get 4
    i32.store8 offset=1
    local.get 0
    local.get 3
    i32.store8
    local.get 0
    local.get 12
    i32.const 16
    i32.shl
    local.get 13
    i32.const 24
    i32.shl
    i32.or
    local.get 11
    i32.const 8
    i32.shl
    i32.or
    local.get 10
    i32.or
    i32.store offset=7 align=1
    local.get 0
    local.get 8
    i32.const 16
    i32.shl
    local.get 9
    i32.const 24
    i32.shl
    i32.or
    local.get 6
    i32.or
    local.get 7
    i32.const 8
    i32.shl
    i32.or
    i32.store offset=3 align=1)
  (func $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17he4f1141fa5eb2511E (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.const 32
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=4
      local.tee 2
      i32.load8_u offset=31
      local.set 3
      local.get 2
      i32.load8_u offset=30
      local.set 4
      local.get 2
      i32.load8_u offset=29
      local.set 5
      local.get 2
      i32.load8_u offset=28
      local.set 6
      local.get 2
      i32.load8_u offset=27
      local.set 7
      local.get 2
      i32.load8_u offset=26
      local.set 8
      local.get 2
      i32.load8_u offset=25
      local.set 9
      local.get 2
      i32.load8_u offset=24
      local.set 10
      local.get 2
      i32.load8_u offset=23
      local.set 11
      local.get 2
      i32.load8_u offset=22
      local.set 12
      local.get 2
      i32.load8_u offset=21
      local.set 13
      local.get 2
      i32.load8_u offset=20
      local.set 14
      local.get 2
      i32.load8_u offset=19
      local.set 15
      local.get 2
      i32.load8_u offset=18
      local.set 16
      local.get 2
      i32.load8_u offset=17
      local.set 17
      local.get 2
      i32.load8_u offset=16
      local.set 18
      local.get 2
      i32.load8_u offset=15
      local.set 19
      local.get 2
      i32.load8_u offset=14
      local.set 20
      local.get 2
      i32.load8_u offset=13
      local.set 21
      local.get 2
      i32.load8_u offset=12
      local.set 22
      local.get 2
      i32.load8_u offset=11
      local.set 23
      local.get 2
      i32.load8_u offset=10
      local.set 24
      local.get 2
      i32.load8_u offset=9
      local.set 25
      local.get 2
      i32.load8_u offset=8
      local.set 26
      local.get 2
      i32.load8_u offset=7
      local.set 27
      local.get 2
      i32.load8_u offset=6
      local.set 28
      local.get 2
      i32.load8_u offset=5
      local.set 29
      local.get 2
      i32.load8_u offset=4
      local.set 30
      local.get 2
      i32.load8_u offset=3
      local.set 31
      local.get 2
      i32.load8_u offset=2
      local.set 32
      local.get 2
      i32.load8_u offset=1
      local.set 33
      local.get 0
      local.get 2
      i32.load8_u
      i32.store8 offset=31
      local.get 0
      local.get 33
      i32.store8 offset=30
      local.get 0
      local.get 32
      i32.store8 offset=29
      local.get 0
      local.get 31
      i32.store8 offset=28
      local.get 0
      local.get 30
      i32.store8 offset=27
      local.get 0
      local.get 29
      i32.store8 offset=26
      local.get 0
      local.get 28
      i32.store8 offset=25
      local.get 0
      local.get 27
      i32.store8 offset=24
      local.get 0
      local.get 26
      i32.store8 offset=23
      local.get 0
      local.get 25
      i32.store8 offset=22
      local.get 0
      local.get 24
      i32.store8 offset=21
      local.get 0
      local.get 23
      i32.store8 offset=20
      local.get 0
      local.get 22
      i32.store8 offset=19
      local.get 0
      local.get 21
      i32.store8 offset=18
      local.get 0
      local.get 20
      i32.store8 offset=17
      local.get 0
      local.get 19
      i32.store8 offset=16
      local.get 0
      local.get 18
      i32.store8 offset=15
      local.get 0
      local.get 17
      i32.store8 offset=14
      local.get 0
      local.get 16
      i32.store8 offset=13
      local.get 0
      local.get 15
      i32.store8 offset=12
      local.get 0
      local.get 14
      i32.store8 offset=11
      local.get 0
      local.get 13
      i32.store8 offset=10
      local.get 0
      local.get 12
      i32.store8 offset=9
      local.get 0
      local.get 11
      i32.store8 offset=8
      local.get 0
      local.get 10
      i32.store8 offset=7
      local.get 0
      local.get 9
      i32.store8 offset=6
      local.get 0
      local.get 8
      i32.store8 offset=5
      local.get 0
      local.get 7
      i32.store8 offset=4
      local.get 0
      local.get 6
      i32.store8 offset=3
      local.get 0
      local.get 5
      i32.store8 offset=2
      local.get 0
      local.get 4
      i32.store8 offset=1
      local.get 0
      local.get 3
      i32.store8
      local.get 1
      i32.const 12
      i32.add
      local.get 2
      i32.const 32
      local.get 1
      i32.load
      i32.load offset=16
      call_indirect (type 0)
      return
    end
    i32.const 1048957
    i32.const 22
    call $_ZN5erc2010assertions4fail17had502d4821c562c7E
    unreachable)
  (func $_ZN5erc205erc205Erc2014s_total_supply17h44fc1020c977cc50E.llvm.12425491971175694154 (type 0) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 1
    local.get 1
    i32.load
    i32.const 1
    i32.add
    local.tee 4
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load8_u offset=1051873
        drop
        i32.const 12
        i32.const 1
        call $__rust_alloc
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        local.get 4
        i32.const 8
        i32.add
        i32.const 0
        i32.load offset=1048584 align=1
        i32.store align=1
        local.get 4
        i32.const 0
        i64.load offset=1048576 align=1
        i64.store align=1
        local.get 3
        i32.const 12
        i32.store offset=28
        local.get 3
        local.get 4
        i32.store offset=24
        local.get 3
        i32.const 12
        i32.store offset=20
        local.get 3
        i32.const 32
        i32.add
        i32.const 8
        i32.add
        i32.const 0
        i32.store
        local.get 3
        i64.const 17179869184
        i64.store offset=32 align=4
        local.get 3
        i32.const 44
        i32.add
        local.get 3
        i32.const 20
        i32.add
        call $_ZN67_$LT$alloc..string..String$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h1e4106a43390e251E
        local.get 3
        i32.const 32
        i32.add
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
        local.get 3
        i32.load offset=36
        local.tee 4
        local.get 3
        i64.load offset=44 align=4
        i64.store align=4
        local.get 4
        i32.const 8
        i32.add
        local.get 3
        i32.const 44
        i32.add
        i32.const 8
        i32.add
        i64.load align=4
        i64.store align=4
        local.get 4
        i32.const 16
        i32.add
        local.get 3
        i32.const 44
        i32.add
        i32.const 16
        i32.add
        i32.load
        i32.store
        local.get 3
        i32.const 8
        i32.add
        i32.const 1
        i32.store
        local.get 3
        local.get 2
        i32.store offset=16
        local.get 3
        local.get 1
        i32.store offset=12
        local.get 3
        local.get 3
        i64.load offset=32 align=4
        i64.store
        local.get 0
        local.get 3
        call $_ZN5erc207storage42SingleChunkStorageBuilder$LT$ValueType$GT$5build17hf8294c03859672afE
        block  ;; label = @3
          local.get 3
          i32.load offset=20
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 3
          i32.load offset=24
          local.get 1
          i32.const 1
          call $__rust_dealloc
        end
        local.get 3
        i32.const 64
        i32.add
        global.set $__stack_pointer
        return
      end
      unreachable
      unreachable
    end
    i32.const 1
    i32.const 12
    call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
    unreachable)
  (func $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154 (type 2) (param i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 1
    local.get 1
    i32.load
    i32.const 1
    i32.add
    local.tee 5
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load8_u offset=1051873
        drop
        i32.const 8
        i32.const 1
        call $__rust_alloc
        local.tee 5
        i32.eqz
        br_if 1 (;@1;)
        local.get 5
        i64.const 8315161612741534050
        i64.store align=1
        local.get 4
        i32.const 8
        i32.store offset=40
        local.get 4
        local.get 5
        i32.store offset=36
        local.get 4
        i32.const 8
        i32.store offset=32
        local.get 4
        i32.const 44
        i32.add
        i32.const 8
        i32.add
        i32.const 0
        i32.store
        local.get 4
        i64.const 17179869184
        i64.store offset=44 align=4
        local.get 4
        i32.const 56
        i32.add
        local.get 4
        i32.const 32
        i32.add
        call $_ZN67_$LT$alloc..string..String$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h1e4106a43390e251E
        local.get 4
        i32.const 44
        i32.add
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
        local.get 4
        i32.load offset=48
        local.tee 5
        local.get 4
        i64.load offset=56 align=4
        i64.store align=4
        local.get 5
        i32.const 16
        i32.add
        local.get 4
        i32.const 56
        i32.add
        i32.const 16
        i32.add
        i32.load
        i32.store
        local.get 5
        i32.const 8
        i32.add
        local.get 4
        i32.const 56
        i32.add
        i32.const 8
        i32.add
        i64.load align=4
        i64.store align=4
        local.get 4
        i32.const 8
        i32.add
        i32.const 8
        i32.add
        i32.const 1
        i32.store
        local.get 4
        local.get 1
        i32.store offset=20
        local.get 4
        local.get 2
        i32.store offset=24
        local.get 4
        local.get 4
        i64.load offset=44 align=4
        i64.store offset=8
        block  ;; label = @3
          local.get 4
          i32.load offset=32
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          i32.load offset=36
          local.get 1
          i32.const 1
          call $__rust_dealloc
        end
        local.get 4
        i32.const 56
        i32.add
        local.get 3
        call $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h8008c8716bd1bbd7E
        block  ;; label = @3
          local.get 4
          i32.load offset=16
          local.tee 1
          local.get 4
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          i32.const 8
          i32.add
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
        end
        local.get 4
        i32.load offset=12
        local.get 1
        i32.const 20
        i32.mul
        i32.add
        local.tee 5
        local.get 4
        i64.load offset=56 align=4
        i64.store align=4
        local.get 5
        i32.const 16
        i32.add
        local.get 4
        i32.const 56
        i32.add
        i32.const 16
        i32.add
        local.tee 3
        i32.load
        i32.store
        local.get 5
        i32.const 8
        i32.add
        local.get 4
        i32.const 56
        i32.add
        i32.const 8
        i32.add
        local.tee 5
        i64.load align=4
        i64.store align=4
        local.get 4
        i32.const 8
        i32.add
        i32.const 8
        i32.add
        local.tee 2
        local.get 1
        i32.const 1
        i32.add
        i32.store
        local.get 3
        local.get 4
        i32.const 8
        i32.add
        i32.const 16
        i32.add
        i32.load
        i32.store
        local.get 5
        local.get 2
        i64.load
        i64.store
        local.get 4
        local.get 4
        i64.load offset=8
        i64.store offset=56
        local.get 0
        local.get 4
        i32.const 56
        i32.add
        call $_ZN5erc207storage42SingleChunkStorageBuilder$LT$ValueType$GT$5build17hf8294c03859672afE
        local.get 4
        i32.const 80
        i32.add
        global.set $__stack_pointer
        return
      end
      unreachable
      unreachable
    end
    i32.const 1
    i32.const 8
    call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
    unreachable)
  (func $_ZN5erc205erc205Erc2012s_allowances17hef5933103b313fd4E.llvm.12425491971175694154 (type 7) (param i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 80
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 1
    local.get 1
    i32.load
    i32.const 1
    i32.add
    local.tee 6
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        i32.const 0
        i32.load8_u offset=1051873
        drop
        i32.const 10
        i32.const 1
        call $__rust_alloc
        local.tee 6
        i32.eqz
        br_if 1 (;@1;)
        local.get 6
        i32.const 8
        i32.add
        i32.const 0
        i32.load16_u offset=1048596 align=1
        i32.store16 align=1
        local.get 6
        i32.const 0
        i64.load offset=1048588 align=1
        i64.store align=1
        local.get 5
        i32.const 10
        i32.store offset=40
        local.get 5
        local.get 6
        i32.store offset=36
        local.get 5
        i32.const 10
        i32.store offset=32
        local.get 5
        i32.const 44
        i32.add
        i32.const 8
        i32.add
        i32.const 0
        i32.store
        local.get 5
        i64.const 17179869184
        i64.store offset=44 align=4
        local.get 5
        i32.const 56
        i32.add
        local.get 5
        i32.const 32
        i32.add
        call $_ZN67_$LT$alloc..string..String$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h1e4106a43390e251E
        local.get 5
        i32.const 44
        i32.add
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
        local.get 5
        i32.load offset=48
        local.tee 6
        local.get 5
        i64.load offset=56 align=4
        i64.store align=4
        local.get 6
        i32.const 16
        i32.add
        local.get 5
        i32.const 56
        i32.add
        i32.const 16
        i32.add
        i32.load
        i32.store
        local.get 6
        i32.const 8
        i32.add
        local.get 5
        i32.const 56
        i32.add
        i32.const 8
        i32.add
        i64.load align=4
        i64.store align=4
        local.get 5
        i32.const 8
        i32.add
        i32.const 8
        i32.add
        i32.const 1
        i32.store
        local.get 5
        local.get 1
        i32.store offset=20
        local.get 5
        local.get 2
        i32.store offset=24
        local.get 5
        local.get 5
        i64.load offset=44 align=4
        i64.store offset=8
        block  ;; label = @3
          local.get 5
          i32.load offset=32
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 5
          i32.load offset=36
          local.get 1
          i32.const 1
          call $__rust_dealloc
        end
        local.get 5
        i32.const 56
        i32.add
        local.get 3
        call $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h8008c8716bd1bbd7E
        block  ;; label = @3
          local.get 5
          i32.load offset=16
          local.tee 1
          local.get 5
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          i32.const 8
          i32.add
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
        end
        local.get 5
        i32.load offset=12
        local.get 1
        i32.const 20
        i32.mul
        i32.add
        local.tee 6
        local.get 5
        i64.load offset=56 align=4
        i64.store align=4
        local.get 6
        i32.const 16
        i32.add
        local.get 5
        i32.const 56
        i32.add
        i32.const 16
        i32.add
        local.tee 3
        i32.load
        i32.store
        local.get 6
        i32.const 8
        i32.add
        local.get 5
        i32.const 56
        i32.add
        i32.const 8
        i32.add
        local.tee 6
        i64.load align=4
        i64.store align=4
        local.get 5
        local.get 1
        i32.const 1
        i32.add
        local.tee 2
        i32.store offset=16
        local.get 5
        i32.const 56
        i32.add
        local.get 4
        call $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h8008c8716bd1bbd7E
        block  ;; label = @3
          local.get 2
          local.get 5
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          local.get 5
          i32.const 8
          i32.add
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
        end
        local.get 5
        i32.load offset=12
        local.get 2
        i32.const 20
        i32.mul
        i32.add
        local.tee 2
        local.get 5
        i64.load offset=56 align=4
        i64.store align=4
        local.get 2
        i32.const 16
        i32.add
        local.get 3
        i32.load
        i32.store
        local.get 2
        i32.const 8
        i32.add
        local.get 6
        i64.load align=4
        i64.store align=4
        local.get 5
        i32.const 8
        i32.add
        i32.const 8
        i32.add
        local.tee 2
        local.get 1
        i32.const 2
        i32.add
        i32.store
        local.get 3
        local.get 5
        i32.const 8
        i32.add
        i32.const 16
        i32.add
        i32.load
        i32.store
        local.get 6
        local.get 2
        i64.load
        i64.store
        local.get 5
        local.get 5
        i64.load offset=8
        i64.store offset=56
        local.get 0
        local.get 5
        i32.const 56
        i32.add
        call $_ZN5erc207storage42SingleChunkStorageBuilder$LT$ValueType$GT$5build17hf8294c03859672afE
        local.get 5
        i32.const 80
        i32.add
        global.set $__stack_pointer
        return
      end
      unreachable
      unreachable
    end
    i32.const 1
    i32.const 10
    call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
    unreachable)
  (func $_ZN5erc205erc205Erc2012total_supply17hfe7aaedf3a1c67e9E (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    call $_ZN5erc205erc205Erc2014s_total_supply17h44fc1020c977cc50E.llvm.12425491971175694154
    block  ;; label = @1
      local.get 2
      i32.load offset=8
      local.tee 3
      local.get 2
      i32.load offset=12
      local.tee 4
      i32.load offset=8
      local.tee 5
      i32.const 4
      local.get 5
      i32.const 4
      i32.gt_u
      select
      local.tee 6
      i32.const -1
      i32.add
      i32.const -8
      i32.and
      i32.add
      i32.const 8
      i32.add
      local.tee 1
      i32.load
      local.tee 7
      i32.const 2147483646
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      local.get 7
      i32.const 1
      i32.add
      i32.store
      local.get 1
      local.get 5
      i32.const -1
      i32.add
      local.tee 8
      i32.const -4
      i32.and
      i32.add
      i32.const 4
      i32.add
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 28
      i32.add
      i32.load
      local.set 9
      local.get 2
      i32.const 48
      i32.add
      i32.const 24
      i32.add
      local.get 2
      i32.const 40
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      i32.const 48
      i32.add
      i32.const 16
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i32.const 24
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      i32.const 48
      i32.add
      i32.const 8
      i32.add
      local.get 2
      i32.const 8
      i32.add
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 2
      local.get 2
      i64.load offset=16 align=4
      i64.store offset=48
      local.get 2
      i32.const 80
      i32.add
      i32.const 24
      i32.add
      local.tee 10
      i64.const 0
      i64.store
      local.get 2
      i32.const 80
      i32.add
      i32.const 16
      i32.add
      local.tee 11
      i64.const 0
      i64.store
      local.get 2
      i32.const 80
      i32.add
      i32.const 8
      i32.add
      local.tee 12
      i64.const 0
      i64.store
      local.get 2
      i64.const 0
      i64.store offset=80
      local.get 7
      local.get 2
      i32.const 48
      i32.add
      local.get 2
      i32.const 80
      i32.add
      local.get 9
      call_indirect (type 0)
      local.get 0
      i32.const 24
      i32.add
      local.get 10
      i64.load
      i64.store align=1
      local.get 0
      i32.const 16
      i32.add
      local.get 11
      i64.load
      i64.store align=1
      local.get 0
      i32.const 8
      i32.add
      local.get 12
      i64.load
      i64.store align=1
      local.get 0
      local.get 2
      i64.load offset=80
      i64.store align=1
      local.get 1
      local.get 1
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 3
      local.get 3
      i32.load
      i32.const -1
      i32.add
      local.tee 1
      i32.store
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 7
        local.get 4
        i32.load
        call_indirect (type 1)
        local.get 3
        i32.const 4
        i32.add
        local.tee 1
        local.get 1
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        local.get 1
        br_if 0 (;@2;)
        local.get 6
        local.get 6
        local.get 4
        i32.load offset=4
        local.get 8
        i32.add
        i32.const 0
        local.get 5
        i32.sub
        i32.and
        i32.add
        i32.const 3
        i32.add
        i32.const 0
        local.get 6
        i32.sub
        local.tee 1
        i32.and
        i32.add
        i32.const 7
        i32.add
        local.get 1
        i32.and
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        local.get 6
        call $__rust_dealloc
      end
      local.get 2
      i32.const 112
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050168
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN5erc205erc205Erc2010balance_of17h30b9a5b4c7c2e770E (type 0) (param i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 8
    i32.add
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 2
    call $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154
    block  ;; label = @1
      local.get 3
      i32.load offset=8
      local.tee 2
      local.get 3
      i32.load offset=12
      local.tee 4
      i32.load offset=8
      local.tee 5
      i32.const 4
      local.get 5
      i32.const 4
      i32.gt_u
      select
      local.tee 6
      i32.const -1
      i32.add
      i32.const -8
      i32.and
      i32.add
      i32.const 8
      i32.add
      local.tee 1
      i32.load
      local.tee 7
      i32.const 2147483646
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      local.get 7
      i32.const 1
      i32.add
      i32.store
      local.get 1
      local.get 5
      i32.const -1
      i32.add
      local.tee 8
      i32.const -4
      i32.and
      i32.add
      i32.const 4
      i32.add
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 4
      i32.const 28
      i32.add
      i32.load
      local.set 9
      local.get 3
      i32.const 48
      i32.add
      i32.const 24
      i32.add
      local.get 3
      i32.const 40
      i32.add
      i64.load align=4
      i64.store
      local.get 3
      i32.const 48
      i32.add
      i32.const 16
      i32.add
      local.get 3
      i32.const 8
      i32.add
      i32.const 24
      i32.add
      i64.load align=4
      i64.store
      local.get 3
      i32.const 48
      i32.add
      i32.const 8
      i32.add
      local.get 3
      i32.const 8
      i32.add
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 3
      local.get 3
      i64.load offset=16 align=4
      i64.store offset=48
      local.get 3
      i32.const 80
      i32.add
      i32.const 24
      i32.add
      local.tee 10
      i64.const 0
      i64.store
      local.get 3
      i32.const 80
      i32.add
      i32.const 16
      i32.add
      local.tee 11
      i64.const 0
      i64.store
      local.get 3
      i32.const 80
      i32.add
      i32.const 8
      i32.add
      local.tee 12
      i64.const 0
      i64.store
      local.get 3
      i64.const 0
      i64.store offset=80
      local.get 7
      local.get 3
      i32.const 48
      i32.add
      local.get 3
      i32.const 80
      i32.add
      local.get 9
      call_indirect (type 0)
      local.get 0
      i32.const 24
      i32.add
      local.get 10
      i64.load
      i64.store align=1
      local.get 0
      i32.const 16
      i32.add
      local.get 11
      i64.load
      i64.store align=1
      local.get 0
      i32.const 8
      i32.add
      local.get 12
      i64.load
      i64.store align=1
      local.get 0
      local.get 3
      i64.load offset=80
      i64.store align=1
      local.get 1
      local.get 1
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 2
      local.get 2
      i32.load
      i32.const -1
      i32.add
      local.tee 1
      i32.store
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 7
        local.get 4
        i32.load
        call_indirect (type 1)
        local.get 2
        i32.const 4
        i32.add
        local.tee 1
        local.get 1
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        local.get 1
        br_if 0 (;@2;)
        local.get 6
        local.get 6
        local.get 4
        i32.load offset=4
        local.get 8
        i32.add
        i32.const 0
        local.get 5
        i32.sub
        i32.and
        i32.add
        i32.const 3
        i32.add
        i32.const 0
        local.get 6
        i32.sub
        local.tee 1
        i32.and
        i32.add
        i32.const 7
        i32.add
        local.get 1
        i32.and
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        local.get 6
        call $__rust_dealloc
      end
      local.get 3
      i32.const 112
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050168
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN5erc205erc205Erc209_transfer17h2686357d78aa1243E.llvm.12425491971175694154 (type 7) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 208
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 192
    i32.add
    local.tee 6
    i32.const 0
    i32.store
    local.get 5
    i32.const 184
    i32.add
    local.tee 7
    i64.const 0
    i64.store
    local.get 5
    i64.const 0
    i64.store offset=176
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 5
        i32.const 176
        i32.add
        call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
        i32.const 255
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 0
        i32.store
        local.get 7
        i64.const 0
        i64.store
        local.get 5
        i64.const 0
        i64.store offset=176
        block  ;; label = @3
          local.get 3
          local.get 5
          i32.const 176
          i32.add
          call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
          i32.const 255
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 1
          local.get 2
          local.get 3
          local.get 4
          call $_ZN5erc205erc205Erc207_update17he4e974dae5007c46E.llvm.12425491971175694154
          local.get 5
          i32.const 0
          i32.store offset=12
          local.get 5
          i64.const 17179869184
          i64.store offset=4 align=4
          local.get 5
          i32.const 176
          i32.add
          local.get 4
          call $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..encoder..Encodable$GT$6encode17hede0d9f51024b58fE
          local.get 5
          i32.const 4
          i32.add
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
          local.get 5
          i32.load offset=8
          local.tee 4
          local.get 5
          i64.load offset=176 align=4
          i64.store align=4
          local.get 4
          i32.const 8
          i32.add
          local.get 5
          i32.const 176
          i32.add
          i32.const 8
          i32.add
          i64.load align=4
          i64.store align=4
          local.get 4
          i32.const 16
          i32.add
          local.get 5
          i32.const 176
          i32.add
          i32.const 16
          i32.add
          i32.load
          i32.store
          local.get 5
          i32.const 1
          i32.store offset=12
          local.get 0
          local.get 1
          i32.load offset=8
          local.tee 4
          i32.const 4
          local.get 4
          i32.const 4
          i32.gt_u
          select
          i32.const -1
          i32.add
          i32.const -8
          i32.and
          i32.add
          i32.const 8
          i32.add
          local.tee 6
          i32.load
          local.tee 0
          i32.const 2147483646
          i32.gt_u
          br_if 2 (;@1;)
          local.get 6
          local.get 0
          i32.const 1
          i32.add
          i32.store
          local.get 6
          local.get 4
          i32.const -1
          i32.add
          i32.const -4
          i32.and
          i32.add
          i32.const 4
          i32.add
          local.tee 8
          i32.eqz
          br_if 2 (;@1;)
          i32.const 0
          local.set 4
          local.get 5
          i32.const 161
          i32.add
          local.tee 9
          i32.const 0
          i32.store align=1
          local.get 5
          i32.const 144
          i32.add
          i32.const 8
          i32.add
          local.tee 7
          local.get 2
          i32.const 19
          i32.add
          i32.load8_u
          i32.store8
          local.get 5
          i64.const 0
          i64.store offset=153 align=1
          local.get 5
          i32.const 176
          i32.add
          i32.const 13
          i32.add
          local.tee 10
          local.get 5
          i32.const 144
          i32.add
          i32.const 13
          i32.add
          local.tee 11
          i64.load align=1
          i64.store align=1
          local.get 5
          i32.const 176
          i32.add
          i32.const 8
          i32.add
          local.tee 0
          local.get 7
          i64.load
          i64.store
          local.get 5
          i32.const 16
          i32.add
          i32.const 8
          i32.add
          local.tee 12
          local.get 0
          i64.load
          i64.store
          local.get 5
          i32.const 16
          i32.add
          i32.const 13
          i32.add
          local.tee 13
          local.get 10
          i64.load align=1
          i64.store align=1
          local.get 5
          local.get 2
          i64.load offset=11 align=1
          i64.store offset=16
          local.get 2
          i64.load offset=3 align=1
          local.set 14
          local.get 9
          i32.const 0
          i32.store align=1
          local.get 7
          local.get 3
          i32.const 19
          i32.add
          i32.load8_u
          i32.store8
          local.get 5
          i64.const 0
          i64.store offset=153 align=1
          local.get 10
          local.get 11
          i64.load align=1
          i64.store align=1
          local.get 0
          local.get 7
          i64.load
          i64.store
          local.get 5
          i32.const 40
          i32.add
          i32.const 8
          i32.add
          local.tee 11
          local.get 0
          i64.load
          i64.store
          local.get 5
          i32.const 40
          i32.add
          i32.const 13
          i32.add
          local.tee 15
          local.get 10
          i64.load align=1
          i64.store align=1
          local.get 5
          local.get 3
          i64.load offset=11 align=1
          i64.store offset=40
          local.get 3
          i64.load offset=3 align=1
          local.set 16
          local.get 5
          i32.const 64
          i32.add
          local.get 5
          i32.const 4
          i32.add
          call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
          local.get 5
          i32.const 144
          i32.add
          i32.const 1048598
          i32.const 30
          call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
          local.get 1
          i32.const 40
          i32.add
          i32.load
          local.set 17
          local.get 5
          i32.load offset=152
          local.set 7
          local.get 5
          i32.load offset=148
          local.set 10
          local.get 5
          i32.const 176
          i32.add
          i32.const 24
          i32.add
          local.tee 9
          i64.const 0
          i64.store
          local.get 5
          i32.const 176
          i32.add
          i32.const 16
          i32.add
          local.tee 18
          i64.const 0
          i64.store
          local.get 0
          i64.const 0
          i64.store
          local.get 5
          i64.const 0
          i64.store offset=176
          local.get 8
          local.get 10
          local.get 7
          local.get 5
          i32.const 176
          i32.add
          local.get 17
          call_indirect (type 2)
          local.get 5
          i32.const 80
          i32.add
          i32.const 24
          i32.add
          local.tee 17
          local.get 9
          i64.load
          i64.store
          local.get 5
          i32.const 80
          i32.add
          i32.const 16
          i32.add
          local.tee 19
          local.get 18
          i64.load
          i64.store
          local.get 5
          i32.const 80
          i32.add
          i32.const 8
          i32.add
          local.tee 18
          local.get 0
          i64.load
          i64.store
          local.get 5
          local.get 5
          i64.load offset=176
          i64.store offset=80
          local.get 5
          i32.const 144
          i32.add
          i32.const 12
          i32.add
          local.get 10
          local.get 7
          local.get 5
          i32.load offset=144
          i32.load offset=16
          call_indirect (type 0)
          local.get 5
          i32.const 112
          i32.add
          i32.const 24
          i32.add
          local.get 17
          i64.load
          i64.store
          local.get 5
          i32.const 112
          i32.add
          i32.const 16
          i32.add
          local.get 19
          i64.load
          i64.store
          local.get 5
          i32.const 112
          i32.add
          i32.const 8
          i32.add
          local.get 18
          i64.load
          i64.store
          local.get 5
          local.get 5
          i64.load offset=80
          i64.store offset=112
          local.get 5
          i32.const 144
          i32.add
          i32.const 19
          i32.add
          local.get 12
          i64.load
          i64.store align=1
          local.get 5
          i32.const 144
          i32.add
          i32.const 24
          i32.add
          local.get 13
          i64.load align=1
          i64.store align=1
          local.get 5
          i32.const 144
          i32.add
          i32.const 2
          i32.add
          local.get 2
          i32.const 2
          i32.add
          i32.load8_u
          i32.store8
          local.get 5
          local.get 14
          i64.store offset=147 align=1
          local.get 5
          local.get 5
          i64.load offset=16
          i64.store offset=155 align=1
          local.get 5
          local.get 2
          i32.load16_u align=1
          i32.store16 offset=144
          local.get 5
          i32.const 176
          i32.add
          i32.const 2
          i32.add
          local.get 3
          i32.const 2
          i32.add
          i32.load8_u
          i32.store8
          local.get 5
          local.get 16
          i64.store offset=179 align=1
          local.get 5
          local.get 3
          i32.load16_u align=1
          i32.store16 offset=176
          local.get 5
          i32.const 176
          i32.add
          i32.const 19
          i32.add
          local.get 11
          i64.load
          i64.store align=1
          local.get 9
          local.get 15
          i64.load align=1
          i64.store align=1
          local.get 5
          local.get 5
          i64.load offset=40
          i64.store offset=187 align=1
          local.get 8
          local.get 5
          i32.const 112
          i32.add
          local.get 5
          i32.const 144
          i32.add
          local.get 5
          i32.const 176
          i32.add
          local.get 5
          i32.load offset=68
          local.tee 2
          local.get 5
          i32.load offset=72
          local.tee 3
          local.get 1
          i32.load offset=12
          call_indirect (type 3)
          local.get 5
          i32.const 64
          i32.add
          i32.const 12
          i32.add
          local.get 2
          local.get 3
          local.get 5
          i32.load offset=64
          i32.load offset=16
          call_indirect (type 0)
          block  ;; label = @4
            local.get 5
            i32.load offset=12
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=8
            local.set 0
            local.get 2
            i32.const 1
            i32.and
            local.set 1
            block  ;; label = @5
              local.get 2
              i32.const 1
              i32.eq
              br_if 0 (;@5;)
              local.get 2
              i32.const -2
              i32.and
              local.set 3
              i32.const 0
              local.set 4
              local.get 0
              local.set 2
              loop  ;; label = @6
                local.get 2
                i32.const 16
                i32.add
                local.get 2
                i32.const 8
                i32.add
                i32.load
                local.get 2
                i32.const 12
                i32.add
                i32.load
                local.get 2
                i32.const 4
                i32.add
                i32.load
                i32.load offset=16
                call_indirect (type 0)
                local.get 2
                i32.const 36
                i32.add
                local.get 2
                i32.const 28
                i32.add
                i32.load
                local.get 2
                i32.const 32
                i32.add
                i32.load
                local.get 2
                i32.const 24
                i32.add
                i32.load
                i32.load offset=16
                call_indirect (type 0)
                local.get 2
                i32.const 40
                i32.add
                local.set 2
                local.get 3
                local.get 4
                i32.const 2
                i32.add
                local.tee 4
                i32.ne
                br_if 0 (;@6;)
              end
            end
            local.get 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 4
            i32.const 20
            i32.mul
            i32.add
            local.tee 2
            i32.const 16
            i32.add
            local.get 2
            i32.load offset=8
            local.get 2
            i32.load offset=12
            local.get 2
            i32.load offset=4
            i32.load offset=16
            call_indirect (type 0)
          end
          block  ;; label = @4
            local.get 5
            i32.load offset=4
            local.tee 2
            i32.eqz
            br_if 0 (;@4;)
            local.get 5
            i32.load offset=8
            local.get 2
            i32.const 20
            i32.mul
            i32.const 4
            call $__rust_dealloc
          end
          local.get 6
          local.get 6
          i32.load
          i32.const -1
          i32.add
          i32.store
          local.get 5
          i32.const 208
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1048752
        i32.const 16
        call $_ZN5erc2010assertions4fail17had502d4821c562c7E
        unreachable
      end
      i32.const 1048768
      i32.const 14
      call $_ZN5erc2010assertions4fail17had502d4821c562c7E
      unreachable
    end
    i32.const 1048640
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN5erc205erc205Erc209allowance17h75c7fcb584df1022E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 112
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 8
    i32.add
    local.get 1
    i32.load
    local.get 1
    i32.load offset=4
    local.get 2
    local.get 3
    call $_ZN5erc205erc205Erc2012s_allowances17hef5933103b313fd4E.llvm.12425491971175694154
    block  ;; label = @1
      local.get 4
      i32.load offset=8
      local.tee 3
      local.get 4
      i32.load offset=12
      local.tee 5
      i32.load offset=8
      local.tee 2
      i32.const 4
      local.get 2
      i32.const 4
      i32.gt_u
      select
      local.tee 6
      i32.const -1
      i32.add
      i32.const -8
      i32.and
      i32.add
      i32.const 8
      i32.add
      local.tee 1
      i32.load
      local.tee 7
      i32.const 2147483646
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      local.get 7
      i32.const 1
      i32.add
      i32.store
      local.get 1
      local.get 2
      i32.const -1
      i32.add
      local.tee 8
      i32.const -4
      i32.and
      i32.add
      i32.const 4
      i32.add
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 5
      i32.const 28
      i32.add
      i32.load
      local.set 9
      local.get 4
      i32.const 48
      i32.add
      i32.const 24
      i32.add
      local.get 4
      i32.const 40
      i32.add
      i64.load align=4
      i64.store
      local.get 4
      i32.const 48
      i32.add
      i32.const 16
      i32.add
      local.get 4
      i32.const 8
      i32.add
      i32.const 24
      i32.add
      i64.load align=4
      i64.store
      local.get 4
      i32.const 48
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.const 8
      i32.add
      i32.const 16
      i32.add
      i64.load align=4
      i64.store
      local.get 4
      local.get 4
      i64.load offset=16 align=4
      i64.store offset=48
      local.get 4
      i32.const 80
      i32.add
      i32.const 24
      i32.add
      local.tee 10
      i64.const 0
      i64.store
      local.get 4
      i32.const 80
      i32.add
      i32.const 16
      i32.add
      local.tee 11
      i64.const 0
      i64.store
      local.get 4
      i32.const 80
      i32.add
      i32.const 8
      i32.add
      local.tee 12
      i64.const 0
      i64.store
      local.get 4
      i64.const 0
      i64.store offset=80
      local.get 7
      local.get 4
      i32.const 48
      i32.add
      local.get 4
      i32.const 80
      i32.add
      local.get 9
      call_indirect (type 0)
      local.get 0
      i32.const 24
      i32.add
      local.get 10
      i64.load
      i64.store align=1
      local.get 0
      i32.const 16
      i32.add
      local.get 11
      i64.load
      i64.store align=1
      local.get 0
      i32.const 8
      i32.add
      local.get 12
      i64.load
      i64.store align=1
      local.get 0
      local.get 4
      i64.load offset=80
      i64.store align=1
      local.get 1
      local.get 1
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 3
      local.get 3
      i32.load
      i32.const -1
      i32.add
      local.tee 1
      i32.store
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 7
        local.get 5
        i32.load
        call_indirect (type 1)
        local.get 3
        i32.const 4
        i32.add
        local.tee 1
        local.get 1
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        local.get 1
        br_if 0 (;@2;)
        local.get 6
        local.get 6
        local.get 5
        i32.load offset=4
        local.get 8
        i32.add
        i32.const 0
        local.get 2
        i32.sub
        i32.and
        i32.add
        i32.const 3
        i32.add
        i32.const 0
        local.get 6
        i32.sub
        local.tee 1
        i32.and
        i32.add
        i32.const 7
        i32.add
        local.get 1
        i32.and
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        local.get 1
        local.get 6
        call $__rust_dealloc
      end
      local.get 4
      i32.const 112
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050168
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN5erc205erc205Erc208_approve17h53bfc76d7c1fe7cfE.llvm.12425491971175694154 (type 3) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 224
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    local.get 6
    i32.const 8
    i32.add
    i32.const 16
    i32.add
    local.tee 7
    i32.const 0
    i32.store
    local.get 6
    i32.const 16
    i32.add
    local.tee 8
    i64.const 0
    i64.store
    local.get 6
    i64.const 0
    i64.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            local.get 6
            i32.const 8
            i32.add
            call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
            i32.const 255
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 7
            i32.const 0
            i32.store
            local.get 8
            i64.const 0
            i64.store
            local.get 6
            i64.const 0
            i64.store offset=8
            local.get 3
            local.get 6
            i32.const 8
            i32.add
            call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
            i32.const 255
            i32.and
            i32.eqz
            br_if 2 (;@2;)
            local.get 6
            i32.const 8
            i32.add
            local.get 0
            local.get 1
            local.get 2
            local.get 3
            call $_ZN5erc205erc205Erc2012s_allowances17hef5933103b313fd4E.llvm.12425491971175694154
            local.get 6
            i32.load offset=8
            local.tee 8
            local.get 6
            i32.load offset=12
            local.tee 9
            i32.load offset=8
            local.tee 10
            i32.const 4
            local.get 10
            i32.const 4
            i32.gt_u
            select
            local.tee 11
            i32.const -1
            i32.add
            i32.const -8
            i32.and
            i32.add
            i32.const 8
            i32.add
            local.tee 7
            i32.load
            br_if 1 (;@3;)
            local.get 7
            i32.const -1
            i32.store
            local.get 7
            local.get 10
            i32.const -1
            i32.add
            local.tee 12
            i32.const -4
            i32.and
            i32.add
            i32.const 4
            i32.add
            local.tee 13
            i32.eqz
            br_if 1 (;@3;)
            local.get 9
            i32.const 32
            i32.add
            i32.load
            local.set 14
            local.get 6
            i32.const 160
            i32.add
            i32.const 24
            i32.add
            local.get 6
            i32.const 8
            i32.add
            i32.const 32
            i32.add
            i64.load align=4
            i64.store
            local.get 6
            i32.const 160
            i32.add
            i32.const 16
            i32.add
            local.get 6
            i32.const 8
            i32.add
            i32.const 24
            i32.add
            i64.load align=4
            i64.store
            local.get 6
            i32.const 160
            i32.add
            i32.const 8
            i32.add
            local.get 6
            i32.const 8
            i32.add
            i32.const 16
            i32.add
            i64.load align=4
            i64.store
            local.get 6
            local.get 6
            i64.load offset=16 align=4
            i64.store offset=160
            local.get 6
            i32.const 192
            i32.add
            i32.const 24
            i32.add
            local.get 4
            i32.const 24
            i32.add
            i64.load align=1
            i64.store
            local.get 6
            i32.const 192
            i32.add
            i32.const 16
            i32.add
            local.get 4
            i32.const 16
            i32.add
            i64.load align=1
            i64.store
            local.get 6
            i32.const 192
            i32.add
            i32.const 8
            i32.add
            local.get 4
            i32.const 8
            i32.add
            i64.load align=1
            i64.store
            local.get 6
            local.get 4
            i64.load align=1
            i64.store offset=192
            local.get 13
            local.get 6
            i32.const 160
            i32.add
            local.get 6
            i32.const 192
            i32.add
            local.get 14
            call_indirect (type 0)
            local.get 7
            local.get 7
            i32.load
            i32.const 1
            i32.add
            i32.store
            local.get 8
            local.get 8
            i32.load
            i32.const -1
            i32.add
            local.tee 7
            i32.store
            block  ;; label = @5
              local.get 7
              br_if 0 (;@5;)
              local.get 13
              local.get 9
              i32.load
              call_indirect (type 1)
              local.get 8
              i32.const 4
              i32.add
              local.tee 7
              local.get 7
              i32.load
              i32.const -1
              i32.add
              local.tee 7
              i32.store
              local.get 7
              br_if 0 (;@5;)
              local.get 11
              local.get 11
              local.get 9
              i32.load offset=4
              local.get 12
              i32.add
              i32.const 0
              local.get 10
              i32.sub
              i32.and
              i32.add
              i32.const 3
              i32.add
              i32.const 0
              local.get 11
              i32.sub
              local.tee 7
              i32.and
              i32.add
              i32.const 7
              i32.add
              local.get 7
              i32.and
              local.tee 7
              i32.eqz
              br_if 0 (;@5;)
              local.get 8
              local.get 7
              local.get 11
              call $__rust_dealloc
            end
            block  ;; label = @5
              local.get 5
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.const 0
              i32.store offset=60
              local.get 6
              i64.const 17179869184
              i64.store offset=52 align=4
              local.get 6
              i32.const 8
              i32.add
              local.get 4
              call $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..encoder..Encodable$GT$6encode17hede0d9f51024b58fE
              local.get 6
              i32.const 52
              i32.add
              call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
              local.get 6
              i32.load offset=56
              local.tee 4
              local.get 6
              i64.load offset=8 align=4
              i64.store align=4
              local.get 4
              i32.const 8
              i32.add
              local.get 6
              i32.const 8
              i32.add
              i32.const 8
              i32.add
              i64.load align=4
              i64.store align=4
              local.get 4
              i32.const 16
              i32.add
              local.get 6
              i32.const 8
              i32.add
              i32.const 16
              i32.add
              i32.load
              i32.store
              local.get 6
              i32.const 1
              i32.store offset=60
              local.get 0
              local.get 1
              i32.load offset=8
              local.tee 4
              i32.const 4
              local.get 4
              i32.const 4
              i32.gt_u
              select
              i32.const -1
              i32.add
              i32.const -8
              i32.and
              i32.add
              i32.const 8
              i32.add
              local.tee 8
              i32.load
              local.tee 7
              i32.const 2147483646
              i32.gt_u
              br_if 4 (;@1;)
              local.get 8
              local.get 7
              i32.const 1
              i32.add
              i32.store
              local.get 8
              local.get 4
              i32.const -1
              i32.add
              i32.const -4
              i32.and
              i32.add
              i32.const 4
              i32.add
              local.tee 0
              i32.eqz
              br_if 4 (;@1;)
              i32.const 0
              local.set 4
              local.get 6
              i32.const 209
              i32.add
              local.tee 13
              i32.const 0
              i32.store align=1
              local.get 6
              i32.const 192
              i32.add
              i32.const 8
              i32.add
              local.tee 10
              local.get 2
              i32.const 19
              i32.add
              i32.load8_u
              i32.store8
              local.get 6
              i64.const 0
              i64.store offset=201 align=1
              local.get 6
              i32.const 8
              i32.add
              i32.const 13
              i32.add
              local.tee 9
              local.get 6
              i32.const 192
              i32.add
              i32.const 13
              i32.add
              local.tee 5
              i64.load align=1
              i64.store align=1
              local.get 6
              i32.const 8
              i32.add
              i32.const 8
              i32.add
              local.tee 7
              local.get 10
              i64.load
              i64.store
              local.get 6
              i32.const 64
              i32.add
              i32.const 8
              i32.add
              local.tee 14
              local.get 7
              i64.load
              i64.store
              local.get 6
              i32.const 64
              i32.add
              i32.const 13
              i32.add
              local.tee 11
              local.get 9
              i64.load align=1
              i64.store align=1
              local.get 6
              local.get 2
              i64.load offset=11 align=1
              i64.store offset=64
              local.get 2
              i64.load offset=3 align=1
              local.set 15
              local.get 13
              i32.const 0
              i32.store align=1
              local.get 10
              local.get 3
              i32.const 19
              i32.add
              i32.load8_u
              i32.store8
              local.get 6
              i64.const 0
              i64.store offset=201 align=1
              local.get 9
              local.get 5
              i64.load align=1
              i64.store align=1
              local.get 7
              local.get 10
              i64.load
              i64.store
              local.get 6
              i32.const 88
              i32.add
              i32.const 8
              i32.add
              local.tee 5
              local.get 7
              i64.load
              i64.store
              local.get 6
              i32.const 88
              i32.add
              i32.const 13
              i32.add
              local.tee 12
              local.get 9
              i64.load align=1
              i64.store align=1
              local.get 6
              local.get 3
              i64.load offset=11 align=1
              i64.store offset=88
              local.get 3
              i64.load offset=3 align=1
              local.set 16
              local.get 6
              i32.const 112
              i32.add
              local.get 6
              i32.const 52
              i32.add
              call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
              local.get 6
              i32.const 192
              i32.add
              i32.const 1048656
              i32.const 30
              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
              local.get 1
              i32.const 40
              i32.add
              i32.load
              local.set 17
              local.get 6
              i32.load offset=200
              local.set 10
              local.get 6
              i32.load offset=196
              local.set 9
              local.get 6
              i32.const 8
              i32.add
              i32.const 24
              i32.add
              local.tee 13
              i64.const 0
              i64.store
              local.get 6
              i32.const 8
              i32.add
              i32.const 16
              i32.add
              local.tee 18
              i64.const 0
              i64.store
              local.get 7
              i64.const 0
              i64.store
              local.get 6
              i64.const 0
              i64.store offset=8
              local.get 0
              local.get 9
              local.get 10
              local.get 6
              i32.const 8
              i32.add
              local.get 17
              call_indirect (type 2)
              local.get 6
              i32.const 128
              i32.add
              i32.const 24
              i32.add
              local.tee 17
              local.get 13
              i64.load
              i64.store
              local.get 6
              i32.const 128
              i32.add
              i32.const 16
              i32.add
              local.tee 19
              local.get 18
              i64.load
              i64.store
              local.get 6
              i32.const 128
              i32.add
              i32.const 8
              i32.add
              local.tee 18
              local.get 7
              i64.load
              i64.store
              local.get 6
              local.get 6
              i64.load offset=8
              i64.store offset=128
              local.get 6
              i32.const 192
              i32.add
              i32.const 12
              i32.add
              local.get 9
              local.get 10
              local.get 6
              i32.load offset=192
              i32.load offset=16
              call_indirect (type 0)
              local.get 6
              i32.const 160
              i32.add
              i32.const 24
              i32.add
              local.get 17
              i64.load
              i64.store
              local.get 6
              i32.const 160
              i32.add
              i32.const 16
              i32.add
              local.get 19
              i64.load
              i64.store
              local.get 6
              i32.const 160
              i32.add
              i32.const 8
              i32.add
              local.get 18
              i64.load
              i64.store
              local.get 6
              local.get 6
              i64.load offset=128
              i64.store offset=160
              local.get 6
              i32.const 192
              i32.add
              i32.const 19
              i32.add
              local.get 14
              i64.load
              i64.store align=1
              local.get 6
              i32.const 192
              i32.add
              i32.const 24
              i32.add
              local.get 11
              i64.load align=1
              i64.store align=1
              local.get 6
              i32.const 192
              i32.add
              i32.const 2
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_u
              i32.store8
              local.get 6
              local.get 15
              i64.store offset=195 align=1
              local.get 6
              local.get 6
              i64.load offset=64
              i64.store offset=203 align=1
              local.get 6
              local.get 2
              i32.load16_u align=1
              i32.store16 offset=192
              local.get 6
              i32.const 8
              i32.add
              i32.const 2
              i32.add
              local.get 3
              i32.const 2
              i32.add
              i32.load8_u
              i32.store8
              local.get 6
              local.get 16
              i64.store offset=11 align=1
              local.get 6
              local.get 3
              i32.load16_u align=1
              i32.store16 offset=8
              local.get 6
              i32.const 8
              i32.add
              i32.const 19
              i32.add
              local.get 5
              i64.load
              i64.store align=1
              local.get 13
              local.get 12
              i64.load align=1
              i64.store align=1
              local.get 6
              local.get 6
              i64.load offset=88
              i64.store offset=19 align=1
              local.get 0
              local.get 6
              i32.const 160
              i32.add
              local.get 6
              i32.const 192
              i32.add
              local.get 6
              i32.const 8
              i32.add
              local.get 6
              i32.load offset=116
              local.tee 2
              local.get 6
              i32.load offset=120
              local.tee 3
              local.get 1
              i32.load offset=12
              call_indirect (type 3)
              local.get 6
              i32.const 112
              i32.add
              i32.const 12
              i32.add
              local.get 2
              local.get 3
              local.get 6
              i32.load offset=112
              i32.load offset=16
              call_indirect (type 0)
              block  ;; label = @6
                local.get 6
                i32.load offset=60
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load offset=56
                local.set 7
                local.get 2
                i32.const 1
                i32.and
                local.set 1
                block  ;; label = @7
                  local.get 2
                  i32.const 1
                  i32.eq
                  br_if 0 (;@7;)
                  local.get 2
                  i32.const -2
                  i32.and
                  local.set 3
                  i32.const 0
                  local.set 4
                  local.get 7
                  local.set 2
                  loop  ;; label = @8
                    local.get 2
                    i32.const 16
                    i32.add
                    local.get 2
                    i32.const 8
                    i32.add
                    i32.load
                    local.get 2
                    i32.const 12
                    i32.add
                    i32.load
                    local.get 2
                    i32.const 4
                    i32.add
                    i32.load
                    i32.load offset=16
                    call_indirect (type 0)
                    local.get 2
                    i32.const 36
                    i32.add
                    local.get 2
                    i32.const 28
                    i32.add
                    i32.load
                    local.get 2
                    i32.const 32
                    i32.add
                    i32.load
                    local.get 2
                    i32.const 24
                    i32.add
                    i32.load
                    i32.load offset=16
                    call_indirect (type 0)
                    local.get 2
                    i32.const 40
                    i32.add
                    local.set 2
                    local.get 3
                    local.get 4
                    i32.const 2
                    i32.add
                    local.tee 4
                    i32.ne
                    br_if 0 (;@8;)
                  end
                end
                local.get 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                local.get 4
                i32.const 20
                i32.mul
                i32.add
                local.tee 2
                i32.const 16
                i32.add
                local.get 2
                i32.load offset=8
                local.get 2
                i32.load offset=12
                local.get 2
                i32.load offset=4
                i32.load offset=16
                call_indirect (type 0)
              end
              block  ;; label = @6
                local.get 6
                i32.load offset=52
                local.tee 2
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                i32.load offset=56
                local.get 2
                i32.const 20
                i32.mul
                i32.const 4
                call $__rust_dealloc
              end
              local.get 8
              local.get 8
              i32.load
              i32.const -1
              i32.add
              i32.store
            end
            local.get 6
            i32.const 224
            i32.add
            global.set $__stack_pointer
            return
          end
          i32.const 1048829
          i32.const 16
          call $_ZN5erc2010assertions4fail17had502d4821c562c7E
          unreachable
        end
        i32.const 1050152
        call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
        unreachable
      end
      i32.const 1048814
      i32.const 15
      call $_ZN5erc2010assertions4fail17had502d4821c562c7E
      unreachable
    end
    i32.const 1048688
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN5erc205erc205Erc2013transfer_from17hafd5c8a9b635bbc8E (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 160
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.load
              local.tee 5
              local.get 0
              i32.load offset=4
              local.tee 6
              i32.load offset=8
              local.tee 7
              i32.const 4
              local.get 7
              i32.const 4
              i32.gt_u
              select
              i32.const -1
              i32.add
              i32.const -8
              i32.and
              i32.add
              i32.const 8
              i32.add
              local.tee 8
              i32.load
              local.tee 9
              i32.const 2147483646
              i32.gt_u
              br_if 0 (;@5;)
              local.get 8
              local.get 9
              i32.const 1
              i32.add
              i32.store
              local.get 8
              local.get 7
              i32.const -1
              i32.add
              i32.const -4
              i32.and
              i32.add
              i32.const 4
              i32.add
              local.tee 10
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 7
              local.get 4
              i32.const 128
              i32.add
              i32.const 16
              i32.add
              local.tee 9
              i32.const 0
              i32.store
              local.get 4
              i32.const 128
              i32.add
              i32.const 8
              i32.add
              local.tee 11
              i64.const 0
              i64.store
              local.get 4
              i64.const 0
              i64.store offset=128
              local.get 10
              local.get 4
              i32.const 128
              i32.add
              local.get 6
              i32.load offset=16
              call_indirect (type 4)
              local.get 4
              i32.const 8
              i32.add
              i32.const 16
              i32.add
              local.get 9
              i32.load
              i32.store
              local.get 4
              i32.const 8
              i32.add
              i32.const 8
              i32.add
              local.get 11
              i64.load
              i64.store
              local.get 4
              local.get 4
              i64.load offset=128
              i64.store offset=8
              local.get 8
              local.get 8
              i32.load
              i32.const -1
              i32.add
              i32.store
              local.get 4
              i32.const 32
              i32.add
              local.get 0
              local.get 1
              local.get 4
              i32.const 8
              i32.add
              call $_ZN5erc205erc205Erc209allowance17h75c7fcb584df1022E
              local.get 3
              local.get 4
              i32.const 32
              i32.add
              call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h99129b72a1377b56E
              i32.const -1
              i32.add
              i32.const 255
              i32.and
              i32.const 1
              i32.le_u
              br_if 1 (;@4;)
              local.get 4
              i32.const 96
              i32.add
              i32.const 24
              i32.add
              local.get 4
              i32.const 32
              i32.add
              i32.const 24
              i32.add
              i64.load align=1
              i64.store
              local.get 4
              i32.const 96
              i32.add
              i32.const 16
              i32.add
              local.get 4
              i32.const 32
              i32.add
              i32.const 16
              i32.add
              i64.load align=1
              i64.store
              local.get 4
              i32.const 96
              i32.add
              i32.const 8
              i32.add
              local.get 4
              i32.const 32
              i32.add
              i32.const 8
              i32.add
              i64.load align=1
              i64.store
              local.get 4
              local.get 4
              i64.load offset=32 align=1
              i64.store offset=96
              local.get 4
              i32.const 128
              i32.add
              i32.const 24
              i32.add
              i64.const 0
              i64.store
              local.get 9
              i64.const 0
              i64.store
              local.get 11
              i64.const 0
              i64.store
              local.get 4
              i64.const 0
              i64.store offset=128
              i32.const 0
              local.set 8
              loop  ;; label = @6
                local.get 4
                i32.const 96
                i32.add
                local.get 8
                i32.add
                i32.load8_u
                local.tee 0
                i32.const 256
                i32.or
                local.get 0
                local.get 7
                local.get 3
                local.get 8
                i32.add
                i32.load8_u
                i32.add
                local.tee 9
                i32.const 65535
                i32.and
                local.tee 11
                local.get 0
                i32.gt_u
                local.tee 7
                select
                local.tee 10
                local.get 11
                i32.lt_u
                br_if 4 (;@2;)
                local.get 10
                local.get 9
                i32.sub
                local.tee 11
                i32.const 65535
                i32.and
                i32.const 256
                i32.ge_u
                br_if 5 (;@1;)
                local.get 4
                i32.const 128
                i32.add
                local.get 8
                i32.add
                local.get 11
                i32.store8
                local.get 8
                i32.const 1
                i32.add
                local.tee 11
                local.set 8
                local.get 11
                i32.const 32
                i32.ne
                br_if 0 (;@6;)
              end
              local.get 9
              i32.const 65535
              i32.and
              local.get 0
              i32.gt_u
              br_if 2 (;@3;)
              local.get 4
              i32.const 64
              i32.add
              i32.const 24
              i32.add
              local.get 4
              i32.const 128
              i32.add
              i32.const 24
              i32.add
              i64.load
              i64.store
              local.get 4
              i32.const 64
              i32.add
              i32.const 16
              i32.add
              local.get 4
              i32.const 128
              i32.add
              i32.const 16
              i32.add
              i64.load
              i64.store
              local.get 4
              i32.const 64
              i32.add
              i32.const 8
              i32.add
              local.get 4
              i32.const 128
              i32.add
              i32.const 8
              i32.add
              i64.load
              i64.store
              local.get 4
              local.get 4
              i64.load offset=128
              i64.store offset=64
              local.get 5
              local.get 6
              local.get 1
              local.get 4
              i32.const 8
              i32.add
              local.get 4
              i32.const 64
              i32.add
              i32.const 0
              call $_ZN5erc205erc205Erc208_approve17h53bfc76d7c1fe7cfE.llvm.12425491971175694154
              local.get 5
              local.get 6
              local.get 1
              local.get 2
              local.get 3
              call $_ZN5erc205erc205Erc209_transfer17h2686357d78aa1243E.llvm.12425491971175694154
              local.get 4
              i32.const 160
              i32.add
              global.set $__stack_pointer
              i32.const 1
              return
            end
            i32.const 1048736
            call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
            unreachable
          end
          i32.const 1048845
          i32.const 21
          call $_ZN5erc2010assertions4fail17had502d4821c562c7E
          unreachable
        end
        i32.const 1048906
        i32.const 20
        call $_ZN5erc2010assertions4fail17had502d4821c562c7E
        unreachable
      end
      i32.const 1048926
      i32.const 31
      call $_ZN5erc2010assertions4fail17had502d4821c562c7E
      unreachable
    end
    i32.const 1048926
    i32.const 31
    call $_ZN5erc2010assertions4fail17had502d4821c562c7E
    unreachable)
  (func $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h99129b72a1377b56E (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u offset=31
        local.tee 2
        local.get 1
        i32.load8_u offset=31
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=30
        local.tee 2
        local.get 1
        i32.load8_u offset=30
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=29
        local.tee 2
        local.get 1
        i32.load8_u offset=29
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=28
        local.tee 2
        local.get 1
        i32.load8_u offset=28
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=27
        local.tee 2
        local.get 1
        i32.load8_u offset=27
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=26
        local.tee 2
        local.get 1
        i32.load8_u offset=26
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=25
        local.tee 2
        local.get 1
        i32.load8_u offset=25
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=24
        local.tee 2
        local.get 1
        i32.load8_u offset=24
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=23
        local.tee 2
        local.get 1
        i32.load8_u offset=23
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=22
        local.tee 2
        local.get 1
        i32.load8_u offset=22
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=21
        local.tee 2
        local.get 1
        i32.load8_u offset=21
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=20
        local.tee 2
        local.get 1
        i32.load8_u offset=20
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=19
        local.tee 2
        local.get 1
        i32.load8_u offset=19
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=18
        local.tee 2
        local.get 1
        i32.load8_u offset=18
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=17
        local.tee 2
        local.get 1
        i32.load8_u offset=17
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=16
        local.tee 2
        local.get 1
        i32.load8_u offset=16
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=15
        local.tee 2
        local.get 1
        i32.load8_u offset=15
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=14
        local.tee 2
        local.get 1
        i32.load8_u offset=14
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=13
        local.tee 2
        local.get 1
        i32.load8_u offset=13
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=12
        local.tee 2
        local.get 1
        i32.load8_u offset=12
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=11
        local.tee 2
        local.get 1
        i32.load8_u offset=11
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=10
        local.tee 2
        local.get 1
        i32.load8_u offset=10
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=9
        local.tee 2
        local.get 1
        i32.load8_u offset=9
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=8
        local.tee 2
        local.get 1
        i32.load8_u offset=8
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=7
        local.tee 2
        local.get 1
        i32.load8_u offset=7
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=6
        local.tee 2
        local.get 1
        i32.load8_u offset=6
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=5
        local.tee 2
        local.get 1
        i32.load8_u offset=5
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=4
        local.tee 2
        local.get 1
        i32.load8_u offset=4
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=3
        local.tee 2
        local.get 1
        i32.load8_u offset=3
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=2
        local.tee 2
        local.get 1
        i32.load8_u offset=2
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=1
        local.tee 2
        local.get 1
        i32.load8_u offset=1
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        i32.const 255
        local.set 4
        local.get 0
        i32.load8_u
        local.tee 0
        local.get 1
        i32.load8_u
        local.tee 1
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.gt_u
        return
      end
      i32.const 255
      local.set 4
    end
    local.get 4)
  (func $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load8_u offset=19
        local.tee 2
        local.get 1
        i32.load8_u offset=19
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=18
        local.tee 2
        local.get 1
        i32.load8_u offset=18
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=17
        local.tee 2
        local.get 1
        i32.load8_u offset=17
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=16
        local.tee 2
        local.get 1
        i32.load8_u offset=16
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=15
        local.tee 2
        local.get 1
        i32.load8_u offset=15
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=14
        local.tee 2
        local.get 1
        i32.load8_u offset=14
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=13
        local.tee 2
        local.get 1
        i32.load8_u offset=13
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=12
        local.tee 2
        local.get 1
        i32.load8_u offset=12
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=11
        local.tee 2
        local.get 1
        i32.load8_u offset=11
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=10
        local.tee 2
        local.get 1
        i32.load8_u offset=10
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=9
        local.tee 2
        local.get 1
        i32.load8_u offset=9
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=8
        local.tee 2
        local.get 1
        i32.load8_u offset=8
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=7
        local.tee 2
        local.get 1
        i32.load8_u offset=7
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=6
        local.tee 2
        local.get 1
        i32.load8_u offset=6
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=5
        local.tee 2
        local.get 1
        i32.load8_u offset=5
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=4
        local.tee 2
        local.get 1
        i32.load8_u offset=4
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=3
        local.tee 2
        local.get 1
        i32.load8_u offset=3
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=2
        local.tee 2
        local.get 1
        i32.load8_u offset=2
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        local.get 0
        i32.load8_u offset=1
        local.tee 2
        local.get 1
        i32.load8_u offset=1
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 2
        local.get 3
        i32.gt_u
        br_if 1 (;@1;)
        i32.const 255
        local.set 4
        local.get 0
        i32.load8_u
        local.tee 0
        local.get 1
        i32.load8_u
        local.tee 1
        i32.lt_u
        br_if 1 (;@1;)
        local.get 0
        local.get 1
        i32.gt_u
        return
      end
      i32.const 255
      local.set 4
    end
    local.get 4)
  (func $_ZN5erc205erc205Erc207_update17he4e974dae5007c46E.llvm.12425491971175694154 (type 7) (param i32 i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 240
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    i32.const 152
    i32.add
    i32.const 0
    i32.store
    local.get 5
    i32.const 136
    i32.add
    i32.const 8
    i32.add
    i64.const 0
    i64.store
    local.get 5
    i64.const 0
    i64.store offset=136
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
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            local.get 2
                                            local.get 5
                                            i32.const 136
                                            i32.add
                                            call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
                                            i32.const 255
                                            i32.and
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 5
                                            i32.const 136
                                            i32.add
                                            local.get 0
                                            local.get 1
                                            local.get 2
                                            call $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154
                                            local.get 5
                                            i32.load offset=136
                                            local.tee 6
                                            local.get 5
                                            i32.load offset=140
                                            local.tee 7
                                            i32.load offset=8
                                            local.tee 8
                                            i32.const 4
                                            local.get 8
                                            i32.const 4
                                            i32.gt_u
                                            select
                                            local.tee 9
                                            i32.const -1
                                            i32.add
                                            i32.const -8
                                            i32.and
                                            i32.add
                                            i32.const 8
                                            i32.add
                                            local.tee 10
                                            i32.load
                                            local.tee 11
                                            i32.const 2147483646
                                            i32.gt_u
                                            br_if 3 (;@17;)
                                            local.get 10
                                            local.get 11
                                            i32.const 1
                                            i32.add
                                            i32.store
                                            local.get 10
                                            local.get 8
                                            i32.const -1
                                            i32.add
                                            local.tee 12
                                            i32.const -4
                                            i32.and
                                            i32.add
                                            i32.const 4
                                            i32.add
                                            local.tee 11
                                            i32.eqz
                                            br_if 3 (;@17;)
                                            local.get 7
                                            i32.const 28
                                            i32.add
                                            i32.load
                                            local.set 13
                                            local.get 5
                                            i32.const 208
                                            i32.add
                                            i32.const 24
                                            i32.add
                                            local.get 5
                                            i32.const 168
                                            i32.add
                                            i64.load align=4
                                            i64.store
                                            local.get 5
                                            i32.const 208
                                            i32.add
                                            i32.const 16
                                            i32.add
                                            local.get 5
                                            i32.const 136
                                            i32.add
                                            i32.const 24
                                            i32.add
                                            i64.load align=4
                                            i64.store
                                            local.get 5
                                            i32.const 208
                                            i32.add
                                            i32.const 8
                                            i32.add
                                            local.get 5
                                            i32.const 136
                                            i32.add
                                            i32.const 16
                                            i32.add
                                            i64.load align=4
                                            i64.store
                                            local.get 5
                                            local.get 5
                                            i64.load offset=144 align=4
                                            i64.store offset=208
                                            local.get 5
                                            i32.const 32
                                            i32.add
                                            i32.const 24
                                            i32.add
                                            local.tee 14
                                            i64.const 0
                                            i64.store
                                            local.get 5
                                            i32.const 32
                                            i32.add
                                            i32.const 16
                                            i32.add
                                            local.tee 15
                                            i64.const 0
                                            i64.store
                                            local.get 5
                                            i32.const 32
                                            i32.add
                                            i32.const 8
                                            i32.add
                                            local.tee 16
                                            i64.const 0
                                            i64.store
                                            local.get 5
                                            i64.const 0
                                            i64.store offset=32
                                            local.get 11
                                            local.get 5
                                            i32.const 208
                                            i32.add
                                            local.get 5
                                            i32.const 32
                                            i32.add
                                            local.get 13
                                            call_indirect (type 0)
                                            local.get 5
                                            i32.const 24
                                            i32.add
                                            local.get 14
                                            i64.load
                                            i64.store
                                            local.get 5
                                            i32.const 16
                                            i32.add
                                            local.get 15
                                            i64.load
                                            i64.store
                                            local.get 5
                                            i32.const 8
                                            i32.add
                                            local.get 16
                                            i64.load
                                            i64.store
                                            local.get 5
                                            local.get 5
                                            i64.load offset=32
                                            i64.store
                                            local.get 10
                                            local.get 10
                                            i32.load
                                            i32.const -1
                                            i32.add
                                            i32.store
                                            local.get 6
                                            local.get 6
                                            i32.load
                                            i32.const -1
                                            i32.add
                                            local.tee 10
                                            i32.store
                                            block  ;; label = @21
                                              local.get 10
                                              br_if 0 (;@21;)
                                              local.get 11
                                              local.get 7
                                              i32.load
                                              call_indirect (type 1)
                                              local.get 6
                                              i32.const 4
                                              i32.add
                                              local.tee 10
                                              local.get 10
                                              i32.load
                                              i32.const -1
                                              i32.add
                                              local.tee 10
                                              i32.store
                                              local.get 10
                                              br_if 0 (;@21;)
                                              local.get 9
                                              local.get 9
                                              local.get 7
                                              i32.load offset=4
                                              local.get 12
                                              i32.add
                                              i32.const 0
                                              local.get 8
                                              i32.sub
                                              i32.and
                                              i32.add
                                              i32.const 3
                                              i32.add
                                              i32.const 0
                                              local.get 9
                                              i32.sub
                                              local.tee 10
                                              i32.and
                                              i32.add
                                              i32.const 7
                                              i32.add
                                              local.get 10
                                              i32.and
                                              local.tee 10
                                              i32.eqz
                                              br_if 0 (;@21;)
                                              local.get 6
                                              local.get 10
                                              local.get 9
                                              call $__rust_dealloc
                                            end
                                            local.get 4
                                            local.get 5
                                            call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h99129b72a1377b56E
                                            i32.const -1
                                            i32.add
                                            i32.const 255
                                            i32.and
                                            i32.const 2
                                            i32.ge_u
                                            br_if 1 (;@19;)
                                            i32.const 1048782
                                            i32.const 20
                                            call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                                            unreachable
                                          end
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          local.get 0
                                          local.get 1
                                          call $_ZN5erc205erc205Erc2014s_total_supply17h44fc1020c977cc50E.llvm.12425491971175694154
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          local.get 0
                                          local.get 1
                                          call $_ZN5erc205erc205Erc2014s_total_supply17h44fc1020c977cc50E.llvm.12425491971175694154
                                          local.get 5
                                          i32.load offset=136
                                          local.tee 11
                                          local.get 5
                                          i32.load offset=140
                                          local.tee 14
                                          i32.load offset=8
                                          local.tee 13
                                          i32.const 4
                                          local.get 13
                                          i32.const 4
                                          i32.gt_u
                                          select
                                          local.tee 9
                                          i32.const -1
                                          i32.add
                                          i32.const -8
                                          i32.and
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.tee 2
                                          i32.load
                                          local.tee 10
                                          i32.const 2147483646
                                          i32.gt_u
                                          br_if 3 (;@16;)
                                          local.get 2
                                          local.get 10
                                          i32.const 1
                                          i32.add
                                          i32.store
                                          local.get 2
                                          local.get 13
                                          i32.const -1
                                          i32.add
                                          local.tee 17
                                          i32.const -4
                                          i32.and
                                          i32.add
                                          i32.const 4
                                          i32.add
                                          local.tee 15
                                          i32.eqz
                                          br_if 3 (;@16;)
                                          local.get 14
                                          i32.const 28
                                          i32.add
                                          i32.load
                                          local.set 7
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          i32.const 32
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=144 align=4
                                          i64.store offset=176
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.tee 10
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.tee 6
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.tee 8
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i64.const 0
                                          i64.store offset=208
                                          local.get 15
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          local.get 7
                                          call_indirect (type 0)
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 10
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 6
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 8
                                          i64.load
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=208
                                          i64.store offset=104
                                          local.get 2
                                          local.get 2
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          i32.store
                                          local.get 10
                                          i64.const 0
                                          i64.store
                                          local.get 6
                                          i64.const 0
                                          i64.store
                                          local.get 8
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i64.const 0
                                          i64.store offset=208
                                          i32.const 0
                                          local.set 10
                                          i32.const -32
                                          local.set 2
                                          loop  ;; label = @20
                                            local.get 5
                                            i32.const 208
                                            i32.add
                                            local.get 2
                                            i32.add
                                            local.tee 6
                                            i32.const 32
                                            i32.add
                                            local.get 10
                                            local.get 5
                                            i32.const 104
                                            i32.add
                                            local.get 2
                                            i32.add
                                            local.tee 8
                                            i32.const 32
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.get 4
                                            local.get 2
                                            i32.add
                                            local.tee 10
                                            i32.const 32
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.tee 7
                                            i32.store8
                                            local.get 6
                                            i32.const 33
                                            i32.add
                                            local.get 7
                                            i32.const 65280
                                            i32.and
                                            i32.const 8
                                            i32.shr_u
                                            local.get 8
                                            i32.const 33
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.get 10
                                            i32.const 33
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.tee 6
                                            i32.store8
                                            local.get 6
                                            i32.const 8
                                            i32.shr_u
                                            local.set 10
                                            local.get 2
                                            i32.const 2
                                            i32.add
                                            local.tee 2
                                            br_if 0 (;@20;)
                                          end
                                          local.get 6
                                          i32.const 256
                                          i32.ge_u
                                          br_if 4 (;@15;)
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=208
                                          i64.store offset=72
                                          local.get 5
                                          i32.load offset=32
                                          local.tee 10
                                          local.get 5
                                          i32.load offset=36
                                          local.tee 8
                                          i32.load offset=8
                                          local.tee 6
                                          i32.const 4
                                          local.get 6
                                          i32.const 4
                                          i32.gt_u
                                          select
                                          local.tee 12
                                          i32.const -1
                                          i32.add
                                          i32.const -8
                                          i32.and
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.tee 2
                                          i32.load
                                          br_if 5 (;@14;)
                                          local.get 2
                                          i32.const -1
                                          i32.store
                                          local.get 2
                                          local.get 6
                                          i32.const -1
                                          i32.add
                                          local.tee 18
                                          i32.const -4
                                          i32.and
                                          i32.add
                                          i32.const 4
                                          i32.add
                                          local.tee 7
                                          i32.eqz
                                          br_if 5 (;@14;)
                                          local.get 8
                                          i32.const 32
                                          i32.add
                                          i32.load
                                          local.set 16
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          i32.const 32
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=40 align=4
                                          i64.store offset=176
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=72
                                          i64.store offset=208
                                          local.get 7
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          local.get 16
                                          call_indirect (type 0)
                                          local.get 2
                                          local.get 2
                                          i32.load
                                          i32.const 1
                                          i32.add
                                          i32.store
                                          local.get 11
                                          local.get 11
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          block  ;; label = @20
                                            local.get 2
                                            br_if 0 (;@20;)
                                            local.get 15
                                            local.get 14
                                            i32.load
                                            call_indirect (type 1)
                                            local.get 11
                                            i32.const 4
                                            i32.add
                                            local.tee 2
                                            local.get 2
                                            i32.load
                                            i32.const -1
                                            i32.add
                                            local.tee 2
                                            i32.store
                                            local.get 2
                                            br_if 0 (;@20;)
                                            local.get 9
                                            local.get 9
                                            local.get 14
                                            i32.load offset=4
                                            local.get 17
                                            i32.add
                                            i32.const 0
                                            local.get 13
                                            i32.sub
                                            i32.and
                                            i32.add
                                            i32.const 3
                                            i32.add
                                            i32.const 0
                                            local.get 9
                                            i32.sub
                                            local.tee 2
                                            i32.and
                                            i32.add
                                            i32.const 7
                                            i32.add
                                            local.get 2
                                            i32.and
                                            local.tee 2
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 11
                                            local.get 2
                                            local.get 9
                                            call $__rust_dealloc
                                          end
                                          local.get 10
                                          local.get 10
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          local.get 2
                                          br_if 1 (;@18;)
                                          local.get 7
                                          local.get 8
                                          i32.load
                                          call_indirect (type 1)
                                          local.get 10
                                          i32.const 4
                                          i32.add
                                          local.tee 2
                                          local.get 2
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          local.get 2
                                          br_if 1 (;@18;)
                                          local.get 12
                                          local.get 12
                                          local.get 8
                                          i32.load offset=4
                                          local.get 18
                                          i32.add
                                          i32.const 0
                                          local.get 6
                                          i32.sub
                                          i32.and
                                          i32.add
                                          i32.const 3
                                          i32.add
                                          i32.const 0
                                          local.get 12
                                          i32.sub
                                          local.tee 2
                                          i32.and
                                          i32.add
                                          i32.const 7
                                          i32.add
                                          local.get 2
                                          i32.and
                                          local.tee 2
                                          i32.eqz
                                          br_if 1 (;@18;)
                                          local.get 10
                                          local.get 2
                                          local.get 12
                                          call $__rust_dealloc
                                          br 1 (;@18;)
                                        end
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        local.get 0
                                        local.get 1
                                        local.get 2
                                        call $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        local.get 0
                                        local.get 1
                                        local.get 2
                                        call $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154
                                        local.get 5
                                        i32.load offset=136
                                        local.tee 13
                                        local.get 5
                                        i32.load offset=140
                                        local.tee 15
                                        i32.load offset=8
                                        local.tee 14
                                        i32.const 4
                                        local.get 14
                                        i32.const 4
                                        i32.gt_u
                                        select
                                        local.tee 9
                                        i32.const -1
                                        i32.add
                                        i32.const -8
                                        i32.and
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.tee 2
                                        i32.load
                                        local.tee 10
                                        i32.const 2147483646
                                        i32.gt_u
                                        br_if 5 (;@13;)
                                        local.get 2
                                        local.get 10
                                        i32.const 1
                                        i32.add
                                        i32.store
                                        local.get 2
                                        local.get 14
                                        i32.const -1
                                        i32.add
                                        local.tee 17
                                        i32.const -4
                                        i32.and
                                        i32.add
                                        i32.const 4
                                        i32.add
                                        local.tee 16
                                        i32.eqz
                                        br_if 5 (;@13;)
                                        local.get 15
                                        i32.const 28
                                        i32.add
                                        i32.load
                                        local.set 7
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        i32.const 32
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=144 align=4
                                        i64.store offset=176
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.tee 10
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.tee 6
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.tee 8
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i64.const 0
                                        i64.store offset=208
                                        local.get 16
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        local.get 7
                                        call_indirect (type 0)
                                        local.get 5
                                        i32.const 104
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 10
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 104
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 6
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 104
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 8
                                        i64.load
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=208
                                        i64.store offset=104
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        i32.store
                                        local.get 10
                                        i64.const 0
                                        i64.store
                                        local.get 6
                                        i64.const 0
                                        i64.store
                                        local.get 8
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i64.const 0
                                        i64.store offset=208
                                        i32.const 0
                                        local.set 6
                                        i32.const 0
                                        local.set 2
                                        loop  ;; label = @19
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          local.get 2
                                          i32.add
                                          i32.load8_u
                                          local.tee 10
                                          i32.const 256
                                          i32.or
                                          local.get 10
                                          local.get 6
                                          local.get 4
                                          local.get 2
                                          i32.add
                                          i32.load8_u
                                          i32.add
                                          local.tee 8
                                          i32.const 65535
                                          i32.and
                                          local.tee 7
                                          local.get 10
                                          i32.gt_u
                                          local.tee 6
                                          select
                                          local.tee 11
                                          local.get 7
                                          i32.lt_u
                                          br_if 8 (;@11;)
                                          local.get 11
                                          local.get 8
                                          i32.sub
                                          local.tee 7
                                          i32.const 65535
                                          i32.and
                                          i32.const 256
                                          i32.ge_u
                                          br_if 9 (;@10;)
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          local.get 2
                                          i32.add
                                          local.get 7
                                          i32.store8
                                          local.get 2
                                          i32.const 1
                                          i32.add
                                          local.tee 7
                                          local.set 2
                                          local.get 7
                                          i32.const 32
                                          i32.ne
                                          br_if 0 (;@19;)
                                        end
                                        local.get 8
                                        i32.const 65535
                                        i32.and
                                        local.get 10
                                        i32.gt_u
                                        br_if 6 (;@12;)
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=208
                                        i64.store offset=72
                                        local.get 5
                                        i32.load offset=32
                                        local.tee 10
                                        local.get 5
                                        i32.load offset=36
                                        local.tee 8
                                        i32.load offset=8
                                        local.tee 6
                                        i32.const 4
                                        local.get 6
                                        i32.const 4
                                        i32.gt_u
                                        select
                                        local.tee 12
                                        i32.const -1
                                        i32.add
                                        i32.const -8
                                        i32.and
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.tee 2
                                        i32.load
                                        br_if 9 (;@9;)
                                        local.get 2
                                        i32.const -1
                                        i32.store
                                        local.get 2
                                        local.get 6
                                        i32.const -1
                                        i32.add
                                        local.tee 18
                                        i32.const -4
                                        i32.and
                                        i32.add
                                        i32.const 4
                                        i32.add
                                        local.tee 7
                                        i32.eqz
                                        br_if 9 (;@9;)
                                        local.get 8
                                        i32.const 32
                                        i32.add
                                        i32.load
                                        local.set 11
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        i32.const 32
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=40 align=4
                                        i64.store offset=176
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=72
                                        i64.store offset=208
                                        local.get 7
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        local.get 11
                                        call_indirect (type 0)
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        i32.const 1
                                        i32.add
                                        i32.store
                                        local.get 13
                                        local.get 13
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        local.tee 2
                                        i32.store
                                        block  ;; label = @19
                                          local.get 2
                                          br_if 0 (;@19;)
                                          local.get 16
                                          local.get 15
                                          i32.load
                                          call_indirect (type 1)
                                          local.get 13
                                          i32.const 4
                                          i32.add
                                          local.tee 2
                                          local.get 2
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          local.get 2
                                          br_if 0 (;@19;)
                                          local.get 9
                                          local.get 9
                                          local.get 15
                                          i32.load offset=4
                                          local.get 17
                                          i32.add
                                          i32.const 0
                                          local.get 14
                                          i32.sub
                                          i32.and
                                          i32.add
                                          i32.const 3
                                          i32.add
                                          i32.const 0
                                          local.get 9
                                          i32.sub
                                          local.tee 2
                                          i32.and
                                          i32.add
                                          i32.const 7
                                          i32.add
                                          local.get 2
                                          i32.and
                                          local.tee 2
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 13
                                          local.get 2
                                          local.get 9
                                          call $__rust_dealloc
                                        end
                                        local.get 10
                                        local.get 10
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        local.tee 2
                                        i32.store
                                        local.get 2
                                        br_if 0 (;@18;)
                                        local.get 7
                                        local.get 8
                                        i32.load
                                        call_indirect (type 1)
                                        local.get 10
                                        i32.const 4
                                        i32.add
                                        local.tee 2
                                        local.get 2
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        local.tee 2
                                        i32.store
                                        local.get 2
                                        br_if 0 (;@18;)
                                        local.get 12
                                        local.get 12
                                        local.get 8
                                        i32.load offset=4
                                        local.get 18
                                        i32.add
                                        i32.const 0
                                        local.get 6
                                        i32.sub
                                        i32.and
                                        i32.add
                                        i32.const 3
                                        i32.add
                                        i32.const 0
                                        local.get 12
                                        i32.sub
                                        local.tee 2
                                        i32.and
                                        i32.add
                                        i32.const 7
                                        i32.add
                                        local.get 2
                                        i32.and
                                        local.tee 2
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 10
                                        local.get 2
                                        local.get 12
                                        call $__rust_dealloc
                                      end
                                      local.get 5
                                      i32.const 152
                                      i32.add
                                      i32.const 0
                                      i32.store
                                      local.get 5
                                      i32.const 136
                                      i32.add
                                      i32.const 8
                                      i32.add
                                      i64.const 0
                                      i64.store
                                      local.get 5
                                      i64.const 0
                                      i64.store offset=136
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          local.get 3
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
                                          i32.const 255
                                          i32.and
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          local.get 0
                                          local.get 1
                                          local.get 3
                                          call $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          local.get 0
                                          local.get 1
                                          local.get 3
                                          call $_ZN5erc205erc205Erc2010s_balances17hea469c0e6047b92cE.llvm.12425491971175694154
                                          local.get 5
                                          i32.load offset=136
                                          local.tee 11
                                          local.get 5
                                          i32.load offset=140
                                          local.tee 0
                                          i32.load offset=8
                                          local.tee 1
                                          i32.const 4
                                          local.get 1
                                          i32.const 4
                                          i32.gt_u
                                          select
                                          local.tee 13
                                          i32.const -1
                                          i32.add
                                          i32.const -8
                                          i32.and
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.tee 2
                                          i32.load
                                          local.tee 10
                                          i32.const 2147483646
                                          i32.gt_u
                                          br_if 11 (;@8;)
                                          local.get 2
                                          local.get 10
                                          i32.const 1
                                          i32.add
                                          i32.store
                                          local.get 2
                                          local.get 1
                                          i32.const -1
                                          i32.add
                                          local.tee 15
                                          i32.const -4
                                          i32.and
                                          i32.add
                                          i32.const 4
                                          i32.add
                                          local.tee 3
                                          i32.eqz
                                          br_if 11 (;@8;)
                                          local.get 0
                                          i32.const 28
                                          i32.add
                                          i32.load
                                          local.set 7
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          i32.const 32
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 136
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=144 align=4
                                          i64.store offset=176
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.tee 10
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.tee 6
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.tee 8
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i64.const 0
                                          i64.store offset=208
                                          local.get 3
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          local.get 7
                                          call_indirect (type 0)
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 10
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 6
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 8
                                          i64.load
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=208
                                          i64.store offset=104
                                          local.get 2
                                          local.get 2
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          i32.store
                                          local.get 10
                                          i64.const 0
                                          i64.store
                                          local.get 6
                                          i64.const 0
                                          i64.store
                                          local.get 8
                                          i64.const 0
                                          i64.store
                                          local.get 5
                                          i64.const 0
                                          i64.store offset=208
                                          i32.const 0
                                          local.set 10
                                          i32.const -32
                                          local.set 2
                                          loop  ;; label = @20
                                            local.get 5
                                            i32.const 208
                                            i32.add
                                            local.get 2
                                            i32.add
                                            local.tee 6
                                            i32.const 32
                                            i32.add
                                            local.get 10
                                            local.get 5
                                            i32.const 104
                                            i32.add
                                            local.get 2
                                            i32.add
                                            local.tee 8
                                            i32.const 32
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.get 4
                                            local.get 2
                                            i32.add
                                            local.tee 10
                                            i32.const 32
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.tee 7
                                            i32.store8
                                            local.get 6
                                            i32.const 33
                                            i32.add
                                            local.get 7
                                            i32.const 65280
                                            i32.and
                                            i32.const 8
                                            i32.shr_u
                                            local.get 8
                                            i32.const 33
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.get 10
                                            i32.const 33
                                            i32.add
                                            i32.load8_u
                                            i32.add
                                            local.tee 6
                                            i32.store8
                                            local.get 6
                                            i32.const 8
                                            i32.shr_u
                                            local.set 10
                                            local.get 2
                                            i32.const 2
                                            i32.add
                                            local.tee 2
                                            br_if 0 (;@20;)
                                          end
                                          local.get 6
                                          i32.const 256
                                          i32.ge_u
                                          br_if 12 (;@7;)
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=208
                                          i64.store offset=72
                                          local.get 5
                                          i32.load offset=32
                                          local.tee 4
                                          local.get 5
                                          i32.load offset=36
                                          local.tee 6
                                          i32.load offset=8
                                          local.tee 10
                                          i32.const 4
                                          local.get 10
                                          i32.const 4
                                          i32.gt_u
                                          select
                                          local.tee 14
                                          i32.const -1
                                          i32.add
                                          i32.const -8
                                          i32.and
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.tee 2
                                          i32.load
                                          br_if 13 (;@6;)
                                          local.get 2
                                          i32.const -1
                                          i32.store
                                          local.get 2
                                          local.get 10
                                          i32.const -1
                                          i32.add
                                          local.tee 16
                                          i32.const -4
                                          i32.and
                                          i32.add
                                          i32.const 4
                                          i32.add
                                          local.tee 8
                                          i32.eqz
                                          br_if 13 (;@6;)
                                          local.get 6
                                          i32.const 32
                                          i32.add
                                          i32.load
                                          local.set 7
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          i32.const 32
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 32
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load align=4
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=40 align=4
                                          i64.store offset=176
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 24
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 16
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          local.get 5
                                          i32.const 72
                                          i32.add
                                          i32.const 8
                                          i32.add
                                          i64.load
                                          i64.store
                                          local.get 5
                                          local.get 5
                                          i64.load offset=72
                                          i64.store offset=208
                                          local.get 8
                                          local.get 5
                                          i32.const 176
                                          i32.add
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          local.get 7
                                          call_indirect (type 0)
                                          local.get 2
                                          local.get 2
                                          i32.load
                                          i32.const 1
                                          i32.add
                                          i32.store
                                          local.get 11
                                          local.get 11
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          block  ;; label = @20
                                            local.get 2
                                            br_if 0 (;@20;)
                                            local.get 3
                                            local.get 0
                                            i32.load
                                            call_indirect (type 1)
                                            local.get 11
                                            i32.const 4
                                            i32.add
                                            local.tee 2
                                            local.get 2
                                            i32.load
                                            i32.const -1
                                            i32.add
                                            local.tee 2
                                            i32.store
                                            local.get 2
                                            br_if 0 (;@20;)
                                            local.get 13
                                            local.get 13
                                            local.get 0
                                            i32.load offset=4
                                            local.get 15
                                            i32.add
                                            i32.const 0
                                            local.get 1
                                            i32.sub
                                            i32.and
                                            i32.add
                                            i32.const 3
                                            i32.add
                                            i32.const 0
                                            local.get 13
                                            i32.sub
                                            local.tee 2
                                            i32.and
                                            i32.add
                                            i32.const 7
                                            i32.add
                                            local.get 2
                                            i32.and
                                            local.tee 2
                                            i32.eqz
                                            br_if 0 (;@20;)
                                            local.get 11
                                            local.get 2
                                            local.get 13
                                            call $__rust_dealloc
                                          end
                                          local.get 4
                                          local.get 4
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          local.get 2
                                          br_if 1 (;@18;)
                                          local.get 8
                                          local.get 6
                                          i32.load
                                          call_indirect (type 1)
                                          local.get 4
                                          i32.const 4
                                          i32.add
                                          local.tee 2
                                          local.get 2
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          local.get 2
                                          br_if 1 (;@18;)
                                          local.get 14
                                          local.get 14
                                          local.get 6
                                          i32.load offset=4
                                          local.get 16
                                          i32.add
                                          i32.const 0
                                          local.get 10
                                          i32.sub
                                          i32.and
                                          i32.add
                                          i32.const 3
                                          i32.add
                                          i32.const 0
                                          local.get 14
                                          i32.sub
                                          local.tee 2
                                          i32.and
                                          i32.add
                                          i32.const 7
                                          i32.add
                                          local.get 2
                                          i32.and
                                          local.tee 2
                                          i32.eqz
                                          br_if 1 (;@18;)
                                          local.get 4
                                          local.get 2
                                          local.get 14
                                          call $__rust_dealloc
                                          br 1 (;@18;)
                                        end
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        local.get 0
                                        local.get 1
                                        call $_ZN5erc205erc205Erc2014s_total_supply17h44fc1020c977cc50E.llvm.12425491971175694154
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        local.get 0
                                        local.get 1
                                        call $_ZN5erc205erc205Erc2014s_total_supply17h44fc1020c977cc50E.llvm.12425491971175694154
                                        local.get 5
                                        i32.load offset=136
                                        local.tee 1
                                        local.get 5
                                        i32.load offset=140
                                        local.tee 3
                                        i32.load offset=8
                                        local.tee 0
                                        i32.const 4
                                        local.get 0
                                        i32.const 4
                                        i32.gt_u
                                        select
                                        local.tee 14
                                        i32.const -1
                                        i32.add
                                        i32.const -8
                                        i32.and
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.tee 2
                                        i32.load
                                        local.tee 10
                                        i32.const 2147483646
                                        i32.gt_u
                                        br_if 13 (;@5;)
                                        local.get 2
                                        local.get 10
                                        i32.const 1
                                        i32.add
                                        i32.store
                                        local.get 2
                                        local.get 0
                                        i32.const -1
                                        i32.add
                                        local.tee 15
                                        i32.const -4
                                        i32.and
                                        i32.add
                                        i32.const 4
                                        i32.add
                                        local.tee 13
                                        i32.eqz
                                        br_if 13 (;@5;)
                                        local.get 3
                                        i32.const 28
                                        i32.add
                                        i32.load
                                        local.set 7
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        i32.const 32
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 136
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=144 align=4
                                        i64.store offset=176
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.tee 10
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.tee 6
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.tee 8
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i64.const 0
                                        i64.store offset=208
                                        local.get 13
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        local.get 7
                                        call_indirect (type 0)
                                        local.get 5
                                        i32.const 104
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 10
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 104
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 6
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 104
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 8
                                        i64.load
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=208
                                        i64.store offset=104
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        i32.store
                                        local.get 10
                                        i64.const 0
                                        i64.store
                                        local.get 6
                                        i64.const 0
                                        i64.store
                                        local.get 8
                                        i64.const 0
                                        i64.store
                                        local.get 5
                                        i64.const 0
                                        i64.store offset=208
                                        i32.const 0
                                        local.set 6
                                        i32.const 0
                                        local.set 2
                                        loop  ;; label = @19
                                          local.get 5
                                          i32.const 104
                                          i32.add
                                          local.get 2
                                          i32.add
                                          i32.load8_u
                                          local.tee 10
                                          i32.const 256
                                          i32.or
                                          local.get 10
                                          local.get 6
                                          local.get 4
                                          local.get 2
                                          i32.add
                                          i32.load8_u
                                          i32.add
                                          local.tee 8
                                          i32.const 65535
                                          i32.and
                                          local.tee 7
                                          local.get 10
                                          i32.gt_u
                                          local.tee 6
                                          select
                                          local.tee 11
                                          local.get 7
                                          i32.lt_u
                                          br_if 16 (;@3;)
                                          local.get 11
                                          local.get 8
                                          i32.sub
                                          local.tee 7
                                          i32.const 65535
                                          i32.and
                                          i32.const 256
                                          i32.ge_u
                                          br_if 17 (;@2;)
                                          local.get 5
                                          i32.const 208
                                          i32.add
                                          local.get 2
                                          i32.add
                                          local.get 7
                                          i32.store8
                                          local.get 2
                                          i32.const 1
                                          i32.add
                                          local.tee 7
                                          local.set 2
                                          local.get 7
                                          i32.const 32
                                          i32.ne
                                          br_if 0 (;@19;)
                                        end
                                        local.get 8
                                        i32.const 65535
                                        i32.and
                                        local.get 10
                                        i32.gt_u
                                        br_if 14 (;@4;)
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=208
                                        i64.store offset=72
                                        local.get 5
                                        i32.load offset=32
                                        local.tee 4
                                        local.get 5
                                        i32.load offset=36
                                        local.tee 6
                                        i32.load offset=8
                                        local.tee 10
                                        i32.const 4
                                        local.get 10
                                        i32.const 4
                                        i32.gt_u
                                        select
                                        local.tee 11
                                        i32.const -1
                                        i32.add
                                        i32.const -8
                                        i32.and
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.tee 2
                                        i32.load
                                        br_if 17 (;@1;)
                                        local.get 2
                                        i32.const -1
                                        i32.store
                                        local.get 2
                                        local.get 10
                                        i32.const -1
                                        i32.add
                                        local.tee 16
                                        i32.const -4
                                        i32.and
                                        i32.add
                                        i32.const 4
                                        i32.add
                                        local.tee 8
                                        i32.eqz
                                        br_if 17 (;@1;)
                                        local.get 6
                                        i32.const 32
                                        i32.add
                                        i32.load
                                        local.set 7
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        i32.const 32
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 32
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load align=4
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=40 align=4
                                        i64.store offset=176
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 24
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 16
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        local.get 5
                                        i32.const 72
                                        i32.add
                                        i32.const 8
                                        i32.add
                                        i64.load
                                        i64.store
                                        local.get 5
                                        local.get 5
                                        i64.load offset=72
                                        i64.store offset=208
                                        local.get 8
                                        local.get 5
                                        i32.const 176
                                        i32.add
                                        local.get 5
                                        i32.const 208
                                        i32.add
                                        local.get 7
                                        call_indirect (type 0)
                                        local.get 2
                                        local.get 2
                                        i32.load
                                        i32.const 1
                                        i32.add
                                        i32.store
                                        local.get 1
                                        local.get 1
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        local.tee 2
                                        i32.store
                                        block  ;; label = @19
                                          local.get 2
                                          br_if 0 (;@19;)
                                          local.get 13
                                          local.get 3
                                          i32.load
                                          call_indirect (type 1)
                                          local.get 1
                                          i32.const 4
                                          i32.add
                                          local.tee 2
                                          local.get 2
                                          i32.load
                                          i32.const -1
                                          i32.add
                                          local.tee 2
                                          i32.store
                                          local.get 2
                                          br_if 0 (;@19;)
                                          local.get 14
                                          local.get 14
                                          local.get 3
                                          i32.load offset=4
                                          local.get 15
                                          i32.add
                                          i32.const 0
                                          local.get 0
                                          i32.sub
                                          i32.and
                                          i32.add
                                          i32.const 3
                                          i32.add
                                          i32.const 0
                                          local.get 14
                                          i32.sub
                                          local.tee 2
                                          i32.and
                                          i32.add
                                          i32.const 7
                                          i32.add
                                          local.get 2
                                          i32.and
                                          local.tee 2
                                          i32.eqz
                                          br_if 0 (;@19;)
                                          local.get 1
                                          local.get 2
                                          local.get 14
                                          call $__rust_dealloc
                                        end
                                        local.get 4
                                        local.get 4
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        local.tee 2
                                        i32.store
                                        local.get 2
                                        br_if 0 (;@18;)
                                        local.get 8
                                        local.get 6
                                        i32.load
                                        call_indirect (type 1)
                                        local.get 4
                                        i32.const 4
                                        i32.add
                                        local.tee 2
                                        local.get 2
                                        i32.load
                                        i32.const -1
                                        i32.add
                                        local.tee 2
                                        i32.store
                                        local.get 2
                                        br_if 0 (;@18;)
                                        local.get 11
                                        local.get 11
                                        local.get 6
                                        i32.load offset=4
                                        local.get 16
                                        i32.add
                                        i32.const 0
                                        local.get 10
                                        i32.sub
                                        i32.and
                                        i32.add
                                        i32.const 3
                                        i32.add
                                        i32.const 0
                                        local.get 11
                                        i32.sub
                                        local.tee 2
                                        i32.and
                                        i32.add
                                        i32.const 7
                                        i32.add
                                        local.get 2
                                        i32.and
                                        local.tee 2
                                        i32.eqz
                                        br_if 0 (;@18;)
                                        local.get 4
                                        local.get 2
                                        local.get 11
                                        call $__rust_dealloc
                                      end
                                      local.get 5
                                      i32.const 240
                                      i32.add
                                      global.set $__stack_pointer
                                      return
                                    end
                                    i32.const 1050168
                                    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                    unreachable
                                  end
                                  i32.const 1050168
                                  call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                  unreachable
                                end
                                i32.const 1048889
                                i32.const 17
                                call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                                unreachable
                              end
                              i32.const 1050152
                              call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
                              unreachable
                            end
                            i32.const 1050168
                            call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                            unreachable
                          end
                          i32.const 1048906
                          i32.const 20
                          call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                          unreachable
                        end
                        i32.const 1048926
                        i32.const 31
                        call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                        unreachable
                      end
                      i32.const 1048926
                      i32.const 31
                      call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                      unreachable
                    end
                    i32.const 1050152
                    call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
                    unreachable
                  end
                  i32.const 1050168
                  call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                  unreachable
                end
                i32.const 1048889
                i32.const 17
                call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                unreachable
              end
              i32.const 1050152
              call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
              unreachable
            end
            i32.const 1050168
            call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
            unreachable
          end
          i32.const 1048906
          i32.const 20
          call $_ZN5erc2010assertions4fail17had502d4821c562c7E
          unreachable
        end
        i32.const 1048926
        i32.const 31
        call $_ZN5erc2010assertions4fail17had502d4821c562c7E
        unreachable
      end
      i32.const 1048926
      i32.const 31
      call $_ZN5erc2010assertions4fail17had502d4821c562c7E
      unreachable
    end
    i32.const 1050152
    call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
    unreachable)
  (func $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E (type 4) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.load8_u offset=31
    i32.store8
    local.get 2
    local.get 1
    i32.load8_u offset=30
    i32.store8 offset=1
    local.get 2
    local.get 1
    i32.load8_u offset=29
    i32.store8 offset=2
    local.get 2
    local.get 1
    i32.load8_u offset=28
    i32.store8 offset=3
    local.get 2
    local.get 1
    i32.load8_u offset=27
    i32.store8 offset=4
    local.get 2
    local.get 1
    i32.load8_u offset=26
    i32.store8 offset=5
    local.get 2
    local.get 1
    i32.load8_u offset=25
    i32.store8 offset=6
    local.get 2
    local.get 1
    i32.load8_u offset=24
    i32.store8 offset=7
    local.get 2
    local.get 1
    i32.load8_u offset=23
    i32.store8 offset=8
    local.get 2
    local.get 1
    i32.load8_u offset=22
    i32.store8 offset=9
    local.get 2
    local.get 1
    i32.load8_u offset=21
    i32.store8 offset=10
    local.get 2
    local.get 1
    i32.load8_u offset=20
    i32.store8 offset=11
    local.get 2
    local.get 1
    i32.load8_u offset=19
    i32.store8 offset=12
    local.get 2
    local.get 1
    i32.load8_u offset=18
    i32.store8 offset=13
    local.get 2
    local.get 1
    i32.load8_u offset=17
    i32.store8 offset=14
    local.get 2
    local.get 1
    i32.load8_u offset=16
    i32.store8 offset=15
    local.get 2
    local.get 1
    i32.load8_u offset=15
    i32.store8 offset=16
    local.get 2
    local.get 1
    i32.load8_u offset=14
    i32.store8 offset=17
    local.get 2
    local.get 1
    i32.load8_u offset=13
    i32.store8 offset=18
    local.get 2
    local.get 1
    i32.load8_u offset=12
    i32.store8 offset=19
    local.get 2
    local.get 1
    i32.load8_u offset=11
    i32.store8 offset=20
    local.get 2
    local.get 1
    i32.load8_u offset=10
    i32.store8 offset=21
    local.get 2
    local.get 1
    i32.load8_u offset=9
    i32.store8 offset=22
    local.get 2
    local.get 1
    i32.load8_u offset=8
    i32.store8 offset=23
    local.get 2
    local.get 1
    i32.load8_u offset=7
    i32.store8 offset=24
    local.get 2
    local.get 1
    i32.load8_u offset=6
    i32.store8 offset=25
    local.get 2
    local.get 1
    i32.load8_u offset=5
    i32.store8 offset=26
    local.get 2
    local.get 1
    i32.load8_u offset=4
    i32.store8 offset=27
    local.get 2
    local.get 1
    i32.load8_u offset=3
    i32.store8 offset=28
    local.get 2
    local.get 1
    i32.load8_u offset=2
    i32.store8 offset=29
    local.get 2
    local.get 1
    i32.load8_u offset=1
    i32.store8 offset=30
    local.get 2
    local.get 1
    i32.load8_u
    i32.store8 offset=31
    local.get 0
    i32.const 4
    i32.add
    local.get 2
    i32.const 32
    call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
    local.get 0
    i32.const 1
    i32.store8
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1271070e2ca826daE (type 6) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h85fc646d908d0c7bE
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hd504c8c64d2f0cadE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h3be2bf5a24d84447E)
  (func $_ZN4core3ptr47drop_in_place$LT$erc20..ulm..impl_..UlmImpl$GT$17he64bf1bacb8d0b6cE (type 1) (param i32))
  (func $_ZN5bytes5bytes11static_drop17h80d4e6ae9b05ca89E (type 0) (param i32 i32 i32))
  (func $_ZN5bytes5bytes12static_clone17h8ee0bb07f5e580ccE (type 2) (param i32 i32 i32 i32)
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    i32.const 1048980
    i32.store)
  (func $_ZN5bytes5bytes16static_is_unique17h6e19e52823949186E (type 10) (param i32) (result i32)
    i32.const 0)
  (func $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    local.get 1
    i32.load offset=8
    local.tee 5
    i32.store offset=12
    local.get 4
    local.get 2
    i32.store offset=16
    local.get 4
    local.get 3
    i32.store offset=20
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        local.get 3
        i32.gt_u
        br_if 0 (;@2;)
        local.get 5
        local.get 3
        i32.lt_u
        br_if 1 (;@1;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            local.get 2
            i32.eq
            br_if 0 (;@4;)
            local.get 4
            i32.const 24
            i32.add
            local.get 1
            i32.const 12
            i32.add
            local.get 1
            i32.load offset=4
            local.get 5
            local.get 1
            i32.load
            i32.load
            call_indirect (type 2)
            local.get 4
            i32.const 24
            i32.add
            i32.const 8
            i32.add
            local.tee 3
            local.get 4
            i32.load offset=20
            local.get 2
            i32.sub
            i32.store
            local.get 4
            local.get 4
            i32.load offset=28
            local.get 2
            i32.add
            i32.store offset=28
            local.get 0
            local.get 4
            i64.load offset=24 align=4
            i64.store align=4
            local.get 0
            i32.const 8
            i32.add
            local.get 3
            i64.load align=4
            i64.store align=4
            br 1 (;@3;)
          end
          local.get 0
          i32.const 0
          i32.store offset=12
          local.get 0
          i64.const 1
          i64.store offset=4 align=4
          local.get 0
          i32.const 1048980
          i32.store
        end
        local.get 4
        i32.const 64
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 4
      i32.const 2
      i32.store offset=28
      local.get 4
      i32.const 1049136
      i32.store offset=24
      local.get 4
      i64.const 2
      i64.store offset=36 align=4
      local.get 4
      i32.const 1
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 6
      local.get 4
      i32.const 20
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 4
      local.get 6
      local.get 4
      i32.const 16
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=48
      local.get 4
      local.get 4
      i32.const 48
      i32.add
      i32.store offset=32
      local.get 4
      i32.const 24
      i32.add
      i32.const 1049152
      call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
      unreachable
    end
    local.get 4
    i32.const 2
    i32.store offset=28
    local.get 4
    i32.const 1049196
    i32.store offset=24
    local.get 4
    i64.const 2
    i64.store offset=36 align=4
    local.get 4
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 6
    local.get 4
    i32.const 12
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 4
    local.get 6
    local.get 4
    i32.const 20
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 4
    local.get 4
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 4
    i32.const 24
    i32.add
    i32.const 1049212
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 144
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.load offset=4
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.load offset=8
        local.tee 4
        br_if 0 (;@2;)
        i32.const 0
        local.set 5
        i32.const 0
        local.set 6
        br 1 (;@1;)
      end
      local.get 4
      i32.const 20
      i32.mul
      i32.const -20
      i32.add
      local.tee 7
      i32.const 20
      i32.div_u
      i32.const 1
      i32.add
      local.tee 8
      i32.const 3
      i32.and
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          i32.const 60
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 5
          local.get 3
          local.set 1
          br 1 (;@2;)
        end
        local.get 8
        i32.const 536870908
        i32.and
        local.set 10
        i32.const 0
        local.set 5
        local.get 3
        local.set 11
        loop  ;; label = @3
          i32.const 32
          local.set 6
          block  ;; label = @4
            local.get 11
            local.tee 1
            i32.load8_u
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=12
            local.set 6
          end
          local.get 6
          local.get 5
          i32.add
          local.set 11
          i32.const 32
          local.set 5
          i32.const 32
          local.set 6
          block  ;; label = @4
            local.get 1
            i32.const 20
            i32.add
            i32.load8_u
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            i32.const 32
            i32.add
            i32.load
            local.set 6
          end
          local.get 6
          local.get 11
          i32.add
          local.set 6
          block  ;; label = @4
            local.get 1
            i32.const 40
            i32.add
            i32.load8_u
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            i32.const 52
            i32.add
            i32.load
            local.set 5
          end
          local.get 5
          local.get 6
          i32.add
          local.set 6
          i32.const 32
          local.set 5
          block  ;; label = @4
            local.get 1
            i32.const 60
            i32.add
            i32.load8_u
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            i32.const 72
            i32.add
            i32.load
            local.set 5
          end
          local.get 1
          i32.const 80
          i32.add
          local.set 11
          local.get 5
          local.get 6
          i32.add
          local.set 5
          local.get 10
          i32.const -4
          i32.add
          local.tee 10
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 80
        i32.add
        local.set 1
      end
      block  ;; label = @2
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 9
        i32.const 20
        i32.mul
        local.set 10
        loop  ;; label = @3
          i32.const 32
          local.set 6
          block  ;; label = @4
            local.get 1
            i32.load8_u
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=12
            local.set 6
          end
          local.get 1
          i32.const 20
          i32.add
          local.set 1
          local.get 6
          local.get 5
          i32.add
          local.set 5
          local.get 10
          i32.const -20
          i32.add
          local.tee 10
          br_if 0 (;@3;)
        end
      end
      local.get 8
      i32.const 3
      i32.and
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 7
          i32.const 60
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 6
          local.get 3
          local.set 1
          br 1 (;@2;)
        end
        local.get 8
        i32.const 536870908
        i32.and
        local.set 11
        i32.const 0
        local.set 6
        local.get 3
        local.set 7
        loop  ;; label = @3
          i32.const 0
          local.set 10
          block  ;; label = @4
            local.get 7
            local.tee 1
            i32.load8_u
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=12
            local.set 10
          end
          local.get 10
          local.get 6
          i32.add
          local.set 7
          i32.const 0
          local.set 6
          i32.const 0
          local.set 10
          block  ;; label = @4
            local.get 1
            i32.const 20
            i32.add
            i32.load8_u
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const 32
            i32.add
            i32.load
            local.set 10
          end
          local.get 10
          local.get 7
          i32.add
          local.set 10
          block  ;; label = @4
            local.get 1
            i32.const 40
            i32.add
            i32.load8_u
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const 52
            i32.add
            i32.load
            local.set 6
          end
          local.get 6
          local.get 10
          i32.add
          local.set 10
          i32.const 0
          local.set 6
          block  ;; label = @4
            local.get 1
            i32.const 60
            i32.add
            i32.load8_u
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const 72
            i32.add
            i32.load
            local.set 6
          end
          local.get 1
          i32.const 80
          i32.add
          local.set 7
          local.get 6
          local.get 10
          i32.add
          local.set 6
          local.get 11
          i32.const -4
          i32.add
          local.tee 11
          br_if 0 (;@3;)
        end
        local.get 1
        i32.const 80
        i32.add
        local.set 1
      end
      local.get 9
      i32.eqz
      br_if 0 (;@1;)
      local.get 9
      i32.const 20
      i32.mul
      local.set 11
      loop  ;; label = @2
        i32.const 0
        local.set 10
        block  ;; label = @3
          local.get 1
          i32.load8_u
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 1
          i32.load offset=12
          local.set 10
        end
        local.get 1
        i32.const 20
        i32.add
        local.set 1
        local.get 10
        local.get 6
        i32.add
        local.set 6
        local.get 11
        i32.const -20
        i32.add
        local.tee 11
        br_if 0 (;@2;)
      end
    end
    i32.const 1
    local.set 11
    i32.const 1
    local.set 10
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 6
                  local.get 5
                  i32.add
                  local.tee 1
                  i32.eqz
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 7
                  local.get 1
                  i32.const 0
                  i32.lt_s
                  br_if 1 (;@6;)
                  i32.const 0
                  i32.load8_u offset=1051873
                  drop
                  i32.const 1
                  local.set 7
                  local.get 1
                  i32.const 1
                  call $__rust_alloc
                  local.tee 10
                  i32.eqz
                  br_if 1 (;@6;)
                end
                i32.const 0
                local.set 7
                local.get 2
                i32.const 0
                i32.store offset=12
                local.get 2
                local.get 10
                i32.store offset=8
                local.get 2
                local.get 1
                i32.store offset=16
                local.get 2
                i32.const 32
                local.get 1
                i32.const 10
                i32.shr_u
                i32.clz
                i32.sub
                local.tee 1
                i32.const 7
                local.get 1
                i32.const 7
                i32.lt_u
                select
                i32.const 2
                i32.shl
                i32.const 1
                i32.or
                i32.store offset=20
                block  ;; label = @7
                  local.get 6
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 6
                  i32.const 0
                  i32.lt_s
                  br_if 2 (;@5;)
                  i32.const 0
                  i32.load8_u offset=1051873
                  drop
                  i32.const 1
                  local.set 7
                  local.get 6
                  i32.const 1
                  call $__rust_alloc
                  local.tee 11
                  i32.eqz
                  br_if 2 (;@5;)
                end
                local.get 2
                i32.const 0
                i32.store offset=28
                local.get 2
                local.get 11
                i32.store offset=24
                local.get 2
                local.get 6
                i32.store offset=32
                local.get 2
                i32.const 32
                local.get 6
                i32.const 10
                i32.shr_u
                i32.clz
                i32.sub
                local.tee 1
                i32.const 7
                local.get 1
                i32.const 7
                i32.lt_u
                select
                i32.const 2
                i32.shl
                i32.const 1
                i32.or
                i32.store offset=36
                local.get 4
                i32.eqz
                br_if 5 (;@1;)
                local.get 4
                i32.const 20
                i32.mul
                local.set 6
                local.get 2
                i32.const 76
                i32.add
                i32.const 8
                i32.add
                local.set 11
                local.get 2
                i32.const 52
                i32.add
                local.set 8
                local.get 2
                i32.const 60
                i32.add
                local.set 7
                loop  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 3
                      i32.load8_u
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      local.get 3
                      i32.load offset=8
                      local.set 4
                      block  ;; label = @10
                        local.get 2
                        i32.load offset=16
                        local.get 2
                        i32.load offset=12
                        local.tee 10
                        i32.sub
                        local.get 3
                        i32.load offset=12
                        local.tee 1
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 2
                        i32.const 8
                        i32.add
                        local.get 1
                        i32.const 1
                        call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
                        drop
                        local.get 2
                        i32.load offset=12
                        local.set 10
                      end
                      local.get 2
                      i32.load offset=8
                      local.get 10
                      i32.add
                      local.get 4
                      local.get 1
                      call $memcpy
                      drop
                      local.get 2
                      i32.load offset=16
                      local.get 2
                      i32.load offset=12
                      local.tee 10
                      i32.sub
                      local.tee 4
                      local.get 1
                      i32.lt_u
                      br_if 5 (;@4;)
                      local.get 2
                      local.get 10
                      local.get 1
                      i32.add
                      i32.store offset=12
                      br 1 (;@8;)
                    end
                    local.get 2
                    i32.load offset=28
                    local.set 1
                    local.get 11
                    i32.const 16
                    i32.add
                    i64.const 0
                    i64.store align=1
                    local.get 11
                    i32.const 8
                    i32.add
                    i64.const 0
                    i64.store align=1
                    local.get 11
                    i64.const 0
                    i64.store align=1
                    local.get 2
                    i32.const 0
                    i32.store offset=80 align=1
                    local.get 2
                    local.get 1
                    local.get 5
                    i32.add
                    local.tee 1
                    i32.store8 offset=76
                    local.get 2
                    local.get 1
                    i32.const 24
                    i32.shr_u
                    i32.store8 offset=79
                    local.get 2
                    local.get 1
                    i32.const 16
                    i32.shr_u
                    i32.store8 offset=78
                    local.get 2
                    local.get 1
                    i32.const 8
                    i32.shr_u
                    i32.store8 offset=77
                    local.get 2
                    i32.const 56
                    i32.add
                    local.get 2
                    i32.const 76
                    i32.add
                    call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
                    local.get 2
                    i32.const 40
                    i32.add
                    i32.const 8
                    i32.add
                    local.get 7
                    i32.const 8
                    i32.add
                    i64.load align=4
                    local.tee 12
                    i64.store
                    local.get 2
                    local.get 7
                    i64.load align=4
                    i64.store offset=40
                    local.get 2
                    i32.load offset=44
                    local.set 10
                    block  ;; label = @9
                      local.get 12
                      i32.wrap_i64
                      local.tee 1
                      i32.eqz
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        local.get 2
                        i32.load offset=16
                        local.get 2
                        i32.load offset=12
                        local.tee 4
                        i32.sub
                        local.get 1
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 2
                        i32.const 8
                        i32.add
                        local.get 1
                        i32.const 1
                        call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
                        drop
                        local.get 2
                        i32.load offset=12
                        local.set 4
                      end
                      local.get 2
                      i32.load offset=8
                      local.get 4
                      i32.add
                      local.get 10
                      local.get 1
                      call $memcpy
                      drop
                      local.get 2
                      i32.load offset=16
                      local.get 2
                      i32.load offset=12
                      local.tee 4
                      i32.sub
                      local.tee 9
                      local.get 1
                      i32.lt_u
                      br_if 6 (;@3;)
                      local.get 2
                      i32.const 0
                      i32.store offset=48
                      local.get 2
                      local.get 4
                      local.get 1
                      i32.add
                      i32.store offset=12
                      local.get 2
                      local.get 10
                      local.get 1
                      i32.add
                      local.tee 10
                      i32.store offset=44
                    end
                    local.get 8
                    local.get 10
                    i32.const 0
                    local.get 2
                    i32.load offset=40
                    i32.load offset=16
                    call_indirect (type 0)
                    local.get 3
                    i32.load offset=12
                    local.tee 1
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 3
                    i32.load offset=8
                    local.set 4
                    block  ;; label = @9
                      local.get 2
                      i32.load offset=32
                      local.get 2
                      i32.load offset=28
                      local.tee 10
                      i32.sub
                      local.get 1
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 2
                      i32.const 24
                      i32.add
                      local.get 1
                      i32.const 1
                      call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
                      drop
                      local.get 2
                      i32.load offset=28
                      local.set 10
                    end
                    local.get 2
                    i32.load offset=24
                    local.get 10
                    i32.add
                    local.get 4
                    local.get 1
                    call $memcpy
                    drop
                    local.get 2
                    i32.load offset=32
                    local.get 2
                    i32.load offset=28
                    local.tee 10
                    i32.sub
                    local.tee 4
                    local.get 1
                    i32.lt_u
                    br_if 6 (;@2;)
                    local.get 2
                    local.get 10
                    local.get 1
                    i32.add
                    i32.store offset=28
                  end
                  local.get 3
                  i32.const 20
                  i32.add
                  local.set 3
                  local.get 6
                  i32.const -20
                  i32.add
                  local.tee 6
                  br_if 0 (;@7;)
                  br 6 (;@1;)
                end
              end
              local.get 7
              local.get 1
              call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
              unreachable
            end
            local.get 7
            local.get 6
            call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
            unreachable
          end
          local.get 1
          local.get 4
          call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
          unreachable
        end
        local.get 1
        local.get 9
        call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
        unreachable
      end
      local.get 1
      local.get 4
      call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
      unreachable
    end
    local.get 2
    i32.const 120
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    local.get 2
    i64.load offset=24 align=4
    i64.store offset=120
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=124
            local.tee 3
            i32.eqz
            br_if 0 (;@4;)
            loop  ;; label = @5
              local.get 2
              i32.load offset=120
              local.set 5
              block  ;; label = @6
                local.get 2
                i32.load offset=16
                local.get 2
                i32.load offset=12
                local.tee 1
                i32.sub
                local.get 3
                i32.ge_u
                br_if 0 (;@6;)
                local.get 2
                i32.const 8
                i32.add
                local.get 3
                i32.const 1
                call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
                drop
                local.get 2
                i32.load offset=12
                local.set 1
              end
              local.get 2
              i32.load offset=8
              local.get 1
              i32.add
              local.get 5
              local.get 3
              call $memcpy
              drop
              local.get 2
              i32.load offset=16
              local.get 2
              i32.load offset=12
              local.tee 1
              i32.sub
              local.tee 5
              local.get 3
              i32.lt_u
              br_if 2 (;@3;)
              local.get 2
              local.get 1
              local.get 3
              i32.add
              i32.store offset=12
              local.get 2
              local.get 3
              i32.store offset=140
              local.get 2
              i32.load offset=124
              local.tee 1
              local.get 3
              i32.lt_u
              br_if 3 (;@2;)
              local.get 2
              i32.const 120
              i32.add
              local.get 3
              call $_ZN5bytes9bytes_mut8BytesMut17advance_unchecked17h8cc95633436894fdE
              local.get 2
              i32.load offset=124
              local.tee 3
              br_if 0 (;@5;)
            end
          end
          local.get 2
          i32.const 120
          i32.add
          call $_ZN68_$LT$bytes..bytes_mut..BytesMut$u20$as$u20$core..ops..drop..Drop$GT$4drop17h694f9b0f8c62c807E
          local.get 2
          i32.load offset=8
          local.set 1
          local.get 2
          i32.load offset=12
          local.set 5
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=20
              local.tee 3
              i32.const 1
              i32.and
              br_if 0 (;@5;)
              local.get 0
              local.get 3
              i32.store offset=12
              local.get 0
              local.get 5
              i32.store offset=8
              local.get 0
              local.get 1
              i32.store offset=4
              local.get 0
              i32.const 1050872
              i32.store
              br 1 (;@4;)
            end
            local.get 2
            i32.const 108
            i32.add
            local.get 1
            local.get 5
            local.get 2
            i32.load offset=16
            local.get 3
            i32.const 5
            i32.shr_u
            local.tee 3
            call $_ZN5bytes9bytes_mut11rebuild_vec17h38cce237df47590bE
            local.get 2
            i32.const 120
            i32.add
            local.get 2
            i32.const 108
            i32.add
            call $_ZN92_$LT$bytes..bytes..Bytes$u20$as$u20$core..convert..From$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$4from17h73298beb60a3c1fbE
            local.get 2
            local.get 3
            i32.store offset=136
            local.get 2
            i32.load offset=128
            local.tee 1
            local.get 3
            i32.lt_u
            br_if 3 (;@1;)
            local.get 2
            i32.const 120
            i32.add
            i32.const 8
            i32.add
            local.tee 5
            local.get 1
            local.get 3
            i32.sub
            i32.store
            local.get 2
            local.get 2
            i32.load offset=124
            local.get 3
            i32.add
            i32.store offset=124
            local.get 0
            i32.const 8
            i32.add
            local.get 5
            i64.load align=4
            i64.store align=4
            local.get 0
            local.get 2
            i64.load offset=120 align=4
            i64.store align=4
          end
          local.get 2
          i32.const 144
          i32.add
          global.set $__stack_pointer
          return
        end
        local.get 3
        local.get 5
        call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
        unreachable
      end
      local.get 2
      i32.const 2
      i32.store offset=80
      local.get 2
      i32.const 1049264
      i32.store offset=76
      local.get 2
      i64.const 2
      i64.store offset=88 align=4
      local.get 2
      local.get 1
      i32.store offset=108
      local.get 2
      i32.const 1
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 12
      local.get 2
      i32.const 108
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=64
      local.get 2
      local.get 12
      local.get 2
      i32.const 140
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=56
      local.get 2
      local.get 2
      i32.const 56
      i32.add
      i32.store offset=84
      local.get 2
      i32.const 76
      i32.add
      i32.const 1049392
      call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
      unreachable
    end
    local.get 2
    i32.const 2
    i32.store offset=80
    local.get 2
    i32.const 1049264
    i32.store offset=76
    local.get 2
    i64.const 2
    i64.store offset=88 align=4
    local.get 2
    local.get 1
    i32.store offset=140
    local.get 2
    i32.const 1
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 12
    local.get 2
    i32.const 140
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=64
    local.get 2
    local.get 12
    local.get 2
    i32.const 136
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 2
    local.get 2
    i32.const 56
    i32.add
    i32.store offset=84
    local.get 2
    i32.const 76
    i32.add
    i32.const 1049280
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN5erc2016erc20_dispatcher14same_signature17he85b455a9ec874d9E (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    local.get 4
    i32.const 16
    i32.add
    local.get 2
    local.get 3
    call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
    local.get 4
    i32.load offset=24
    local.set 3
    local.get 4
    i32.load offset=20
    local.set 2
    local.get 4
    i32.const 56
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 48
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i32.const 40
    i32.add
    i64.const 0
    i64.store
    local.get 4
    i64.const 0
    i64.store offset=32
    local.get 0
    local.get 2
    local.get 3
    local.get 4
    i32.const 32
    i32.add
    call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE
    local.get 4
    i32.load offset=32
    local.set 0
    local.get 4
    i32.const 16
    i32.add
    i32.const 12
    i32.add
    local.get 2
    local.get 3
    local.get 4
    i32.load offset=16
    i32.load offset=16
    call_indirect (type 0)
    local.get 4
    local.get 0
    i32.store offset=12
    local.get 4
    i32.const 32
    i32.add
    local.get 4
    i32.const 12
    i32.add
    i32.const 4
    call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
    local.get 1
    local.get 4
    i32.const 32
    i32.add
    call $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E
    local.set 3
    local.get 4
    i32.const 32
    i32.add
    i32.const 12
    i32.add
    local.get 4
    i32.load offset=36
    local.get 4
    i32.load offset=40
    local.get 4
    i32.load offset=32
    i32.load offset=16
    call_indirect (type 0)
    local.get 4
    i32.const 64
    i32.add
    global.set $__stack_pointer
    local.get 3)
  (func $ulmDispatchCaller (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32 i64 i64)
    global.get $__stack_pointer
    i32.const 304
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    i32.const 0
    i32.load8_u offset=1051873
    drop
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
                            i32.const 12
                            i32.const 4
                            call $__rust_alloc
                            local.tee 2
                            i32.eqz
                            br_if 0 (;@12;)
                            local.get 2
                            i64.const 4294967297
                            i64.store align=4
                            i32.const 1
                            local.set 3
                            local.get 2
                            i32.const 1
                            i32.store offset=8
                            block  ;; label = @13
                              local.get 2
                              i32.const 12
                              i32.add
                              local.tee 4
                              call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$16call_data_length17h5a8338a3b18df8f2E
                              local.tee 5
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 0
                              local.set 6
                              local.get 5
                              i32.const 0
                              i32.lt_s
                              br_if 2 (;@11;)
                              i32.const 0
                              i32.load8_u offset=1051873
                              drop
                              i32.const 1
                              local.set 6
                              local.get 5
                              i32.const 1
                              call $__rust_alloc
                              local.tee 3
                              i32.eqz
                              br_if 2 (;@11;)
                            end
                            local.get 4
                            local.get 3
                            i32.const 0
                            call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$9call_data17hde8d81abbe4336aeE
                            local.get 1
                            i32.const 8
                            i32.add
                            local.get 3
                            i32.const 0
                            call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                            block  ;; label = @13
                              local.get 5
                              i32.eqz
                              br_if 0 (;@13;)
                              local.get 3
                              local.get 5
                              i32.const 1
                              call $__rust_dealloc
                            end
                            local.get 2
                            local.get 2
                            i32.load offset=8
                            i32.const -1
                            i32.add
                            local.tee 3
                            i32.store offset=8
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 0
                                  br_if 0 (;@15;)
                                  local.get 1
                                  i32.load offset=16
                                  i32.const 3
                                  i32.gt_u
                                  br_if 1 (;@14;)
                                  i32.const 1049452
                                  i32.const 33
                                  call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                                  unreachable
                                end
                                local.get 1
                                i32.const 184
                                i32.add
                                i32.const 8
                                i32.add
                                local.get 1
                                i32.const 8
                                i32.add
                                i32.const 8
                                i32.add
                                i64.load align=4
                                i64.store
                                local.get 2
                                local.get 2
                                i32.load
                                i32.const 1
                                i32.add
                                local.tee 5
                                i32.store
                                local.get 1
                                local.get 1
                                i64.load offset=8 align=4
                                i64.store offset=184
                                local.get 1
                                i32.const 0
                                i32.store offset=200
                                local.get 5
                                i32.eqz
                                br_if 4 (;@10;)
                                local.get 1
                                i32.const 0
                                i32.store offset=256
                                local.get 1
                                i64.const 17179869184
                                i64.store offset=248 align=4
                                local.get 3
                                br_if 5 (;@9;)
                                local.get 2
                                i32.const -1
                                i32.store offset=8
                                local.get 1
                                i32.const 128
                                i32.add
                                local.get 1
                                i32.const 248
                                i32.add
                                call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
                                local.get 4
                                local.get 1
                                i32.load offset=132
                                local.tee 3
                                local.get 1
                                i32.load offset=136
                                local.tee 5
                                call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
                                local.get 1
                                i32.const 128
                                i32.add
                                i32.const 12
                                i32.add
                                local.get 3
                                local.get 5
                                local.get 1
                                i32.load offset=128
                                i32.load offset=16
                                call_indirect (type 0)
                                local.get 2
                                local.get 2
                                i32.load offset=8
                                i32.const 1
                                i32.add
                                i32.store offset=8
                                local.get 2
                                local.get 2
                                i32.load
                                i32.const -1
                                i32.add
                                local.tee 3
                                i32.store
                                block  ;; label = @15
                                  local.get 3
                                  br_if 0 (;@15;)
                                  local.get 2
                                  local.get 2
                                  i32.load offset=4
                                  i32.const -1
                                  i32.add
                                  local.tee 3
                                  i32.store offset=4
                                  local.get 3
                                  br_if 0 (;@15;)
                                  local.get 2
                                  i32.const 12
                                  i32.const 4
                                  call $__rust_dealloc
                                end
                                local.get 1
                                i32.const 184
                                i32.add
                                i32.const 12
                                i32.add
                                local.get 1
                                i32.load offset=188
                                local.get 1
                                i32.load offset=192
                                local.get 1
                                i32.load offset=184
                                i32.load offset=16
                                call_indirect (type 0)
                                local.get 2
                                local.get 2
                                i32.load
                                i32.const -1
                                i32.add
                                local.tee 3
                                i32.store
                                local.get 3
                                br_if 1 (;@13;)
                                local.get 2
                                local.get 2
                                i32.load offset=4
                                i32.const -1
                                i32.add
                                local.tee 3
                                i32.store offset=4
                                local.get 3
                                br_if 1 (;@13;)
                                local.get 2
                                i32.const 12
                                i32.const 4
                                call $__rust_dealloc
                                br 1 (;@13;)
                              end
                              local.get 1
                              i32.const 24
                              i32.add
                              local.get 1
                              i32.const 8
                              i32.add
                              i32.const 4
                              call $_ZN5bytes5bytes5Bytes9split_off17h8fb60c9956121d47E
                              local.get 1
                              i32.const 40
                              i32.add
                              i32.const 8
                              i32.add
                              local.get 1
                              i32.const 8
                              i32.add
                              i32.const 8
                              i32.add
                              i64.load align=4
                              i64.store
                              local.get 1
                              local.get 1
                              i64.load offset=8 align=4
                              i64.store offset=40
                              local.get 2
                              i32.load offset=8
                              local.tee 3
                              i32.const 2147483646
                              i32.gt_u
                              br_if 5 (;@8;)
                              local.get 2
                              local.get 3
                              i32.const 1
                              i32.add
                              i32.store offset=8
                              local.get 1
                              i32.const 128
                              i32.add
                              i32.const 1049485
                              i32.const 10
                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                              local.get 1
                              i32.load offset=136
                              local.set 3
                              local.get 1
                              i32.load offset=132
                              local.set 5
                              local.get 1
                              i32.const 208
                              i32.add
                              i64.const 0
                              i64.store
                              local.get 1
                              i32.const 200
                              i32.add
                              i64.const 0
                              i64.store
                              local.get 1
                              i32.const 184
                              i32.add
                              i32.const 8
                              i32.add
                              i64.const 0
                              i64.store
                              local.get 1
                              i64.const 0
                              i64.store offset=184
                              local.get 4
                              local.get 5
                              local.get 3
                              local.get 1
                              i32.const 184
                              i32.add
                              call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE
                              local.get 1
                              i32.load offset=184
                              local.set 0
                              local.get 1
                              i32.const 128
                              i32.add
                              i32.const 12
                              i32.add
                              local.get 5
                              local.get 3
                              local.get 1
                              i32.load offset=128
                              i32.load offset=16
                              call_indirect (type 0)
                              local.get 1
                              local.get 0
                              i32.store offset=248
                              local.get 1
                              i32.const 184
                              i32.add
                              local.get 1
                              i32.const 248
                              i32.add
                              i32.const 4
                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                              local.get 1
                              i32.const 40
                              i32.add
                              local.get 1
                              i32.const 184
                              i32.add
                              call $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E
                              local.set 3
                              local.get 1
                              i32.const 184
                              i32.add
                              i32.const 12
                              i32.add
                              local.get 1
                              i32.load offset=188
                              local.get 1
                              i32.load offset=192
                              local.get 1
                              i32.load offset=184
                              i32.load offset=16
                              call_indirect (type 0)
                              local.get 2
                              local.get 2
                              i32.load offset=8
                              local.tee 5
                              i32.const -1
                              i32.add
                              i32.store offset=8
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              local.get 3
                                                              br_if 0 (;@29;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 1 (;@28;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 1049495
                                                              i32.const 13
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.load offset=136
                                                              local.set 3
                                                              local.get 1
                                                              i32.load offset=132
                                                              local.set 5
                                                              local.get 1
                                                              i32.const 208
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 200
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 8
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i64.const 0
                                                              i64.store offset=184
                                                              local.get 4
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE
                                                              local.get 1
                                                              i32.load offset=184
                                                              local.set 0
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.load offset=128
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 1
                                                              local.get 0
                                                              i32.store offset=248
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              local.get 1
                                                              i32.const 248
                                                              i32.add
                                                              i32.const 4
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E
                                                              local.set 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 1
                                                              i32.load offset=188
                                                              local.get 1
                                                              i32.load offset=192
                                                              local.get 1
                                                              i32.load offset=184
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              local.tee 5
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 2 (;@27;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 3 (;@26;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 1049508
                                                              i32.const 18
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.load offset=136
                                                              local.set 3
                                                              local.get 1
                                                              i32.load offset=132
                                                              local.set 5
                                                              local.get 1
                                                              i32.const 208
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 200
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 8
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i64.const 0
                                                              i64.store offset=184
                                                              local.get 4
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE
                                                              local.get 1
                                                              i32.load offset=184
                                                              local.set 0
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.load offset=128
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 1
                                                              local.get 0
                                                              i32.store offset=248
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              local.get 1
                                                              i32.const 248
                                                              i32.add
                                                              i32.const 4
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E
                                                              local.set 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 1
                                                              i32.load offset=188
                                                              local.get 1
                                                              i32.load offset=192
                                                              local.get 1
                                                              i32.load offset=184
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              local.tee 5
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 4 (;@25;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 5 (;@24;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 1049526
                                                              i32.const 25
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.load offset=136
                                                              local.set 3
                                                              local.get 1
                                                              i32.load offset=132
                                                              local.set 5
                                                              local.get 1
                                                              i32.const 208
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 200
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 8
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i64.const 0
                                                              i64.store offset=184
                                                              local.get 4
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE
                                                              local.get 1
                                                              i32.load offset=184
                                                              local.set 0
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.load offset=128
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 1
                                                              local.get 0
                                                              i32.store offset=248
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              local.get 1
                                                              i32.const 248
                                                              i32.add
                                                              i32.const 4
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E
                                                              local.set 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 1
                                                              i32.load offset=188
                                                              local.get 1
                                                              i32.load offset=192
                                                              local.get 1
                                                              i32.load offset=184
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              local.tee 5
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 6 (;@23;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 7 (;@22;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 1049551
                                                              i32.const 26
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.load offset=136
                                                              local.set 3
                                                              local.get 1
                                                              i32.load offset=132
                                                              local.set 5
                                                              local.get 1
                                                              i32.const 208
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 200
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i32.const 192
                                                              i32.add
                                                              i64.const 0
                                                              i64.store
                                                              local.get 1
                                                              i64.const 0
                                                              i64.store offset=184
                                                              local.get 4
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE
                                                              local.get 1
                                                              i32.load offset=184
                                                              local.set 0
                                                              local.get 1
                                                              i32.const 128
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 5
                                                              local.get 3
                                                              local.get 1
                                                              i32.load offset=128
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 1
                                                              local.get 0
                                                              i32.store offset=248
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              local.get 1
                                                              i32.const 248
                                                              i32.add
                                                              i32.const 4
                                                              call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              call $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E
                                                              local.set 3
                                                              local.get 1
                                                              i32.const 184
                                                              i32.add
                                                              i32.const 12
                                                              i32.add
                                                              local.get 1
                                                              i32.load offset=188
                                                              local.get 1
                                                              i32.load offset=192
                                                              local.get 1
                                                              i32.load offset=184
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              local.tee 5
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 8 (;@21;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 9 (;@20;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 4
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              i32.const 1049577
                                                              i32.const 24
                                                              call $_ZN5erc2016erc20_dispatcher14same_signature17he85b455a9ec874d9E
                                                              local.set 3
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              local.tee 5
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 10 (;@19;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 11 (;@18;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 4
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              i32.const 1049601
                                                              i32.const 37
                                                              call $_ZN5erc2016erc20_dispatcher14same_signature17he85b455a9ec874d9E
                                                              local.set 3
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              local.tee 5
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 12 (;@17;)
                                                              local.get 5
                                                              i32.const 0
                                                              i32.le_s
                                                              br_if 13 (;@16;)
                                                              local.get 2
                                                              local.get 5
                                                              i32.store offset=8
                                                              local.get 4
                                                              local.get 1
                                                              i32.const 40
                                                              i32.add
                                                              i32.const 1049638
                                                              i32.const 21
                                                              call $_ZN5erc2016erc20_dispatcher14same_signature17he85b455a9ec874d9E
                                                              local.set 3
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=8
                                                              i32.const -1
                                                              i32.add
                                                              i32.store offset=8
                                                              local.get 3
                                                              br_if 14 (;@15;)
                                                              i32.const 1049659
                                                              i32.const 16
                                                              call $_ZN5erc2010assertions4fail17had502d4821c562c7E
                                                              unreachable
                                                            end
                                                            local.get 1
                                                            i32.const 248
                                                            i32.add
                                                            i32.const 8
                                                            i32.add
                                                            local.get 1
                                                            i32.const 24
                                                            i32.add
                                                            i32.const 8
                                                            i32.add
                                                            i64.load align=4
                                                            i64.store
                                                            local.get 2
                                                            local.get 2
                                                            i32.load
                                                            i32.const 1
                                                            i32.add
                                                            local.tee 3
                                                            i32.store
                                                            local.get 1
                                                            local.get 1
                                                            i64.load offset=24 align=4
                                                            i64.store offset=248
                                                            local.get 1
                                                            i32.const 0
                                                            i32.store offset=264
                                                            local.get 3
                                                            i32.eqz
                                                            br_if 18 (;@10;)
                                                            local.get 1
                                                            i32.const 0
                                                            i32.store offset=168
                                                            local.get 1
                                                            i64.const 17179869184
                                                            i64.store offset=160 align=4
                                                            local.get 1
                                                            i32.const 208
                                                            i32.add
                                                            i64.const 0
                                                            i64.store align=1
                                                            local.get 1
                                                            i32.const 184
                                                            i32.add
                                                            i32.const 16
                                                            i32.add
                                                            i64.const 0
                                                            i64.store align=1
                                                            local.get 1
                                                            i32.const 188
                                                            i32.add
                                                            i32.const 0
                                                            i32.store align=1
                                                            local.get 1
                                                            i64.const 0
                                                            i64.store offset=192 align=1
                                                            local.get 1
                                                            i32.const 0
                                                            i32.store offset=185 align=1
                                                            local.get 1
                                                            i32.const 18
                                                            i32.store8 offset=184
                                                            local.get 1
                                                            i32.const 128
                                                            i32.add
                                                            local.get 1
                                                            i32.const 184
                                                            i32.add
                                                            call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
                                                            local.get 1
                                                            i32.const 160
                                                            i32.add
                                                            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
                                                            local.get 1
                                                            i32.load offset=164
                                                            local.tee 3
                                                            local.get 1
                                                            i64.load offset=128 align=4
                                                            i64.store align=4
                                                            local.get 3
                                                            i32.const 8
                                                            i32.add
                                                            local.get 1
                                                            i32.const 128
                                                            i32.add
                                                            i32.const 8
                                                            i32.add
                                                            i64.load align=4
                                                            i64.store align=4
                                                            local.get 3
                                                            i32.const 16
                                                            i32.add
                                                            local.get 1
                                                            i32.const 128
                                                            i32.add
                                                            i32.const 16
                                                            i32.add
                                                            i32.load
                                                            i32.store
                                                            local.get 1
                                                            i32.const 1
                                                            i32.store offset=168
                                                            local.get 2
                                                            i32.load offset=8
                                                            br_if 21 (;@7;)
                                                            local.get 2
                                                            i32.const -1
                                                            i32.store offset=8
                                                            local.get 1
                                                            i32.const 184
                                                            i32.add
                                                            local.get 1
                                                            i32.const 160
                                                            i32.add
                                                            call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
                                                            local.get 4
                                                            local.get 1
                                                            i32.load offset=188
                                                            local.tee 3
                                                            local.get 1
                                                            i32.load offset=192
                                                            local.tee 5
                                                            call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
                                                            local.get 1
                                                            i32.const 196
                                                            i32.add
                                                            local.get 3
                                                            local.get 5
                                                            local.get 1
                                                            i32.load offset=184
                                                            i32.load offset=16
                                                            call_indirect (type 0)
                                                            local.get 2
                                                            local.get 2
                                                            i32.load offset=8
                                                            i32.const 1
                                                            i32.add
                                                            i32.store offset=8
                                                            block  ;; label = @29
                                                              local.get 1
                                                              i32.load offset=168
                                                              local.tee 3
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 1
                                                              i32.load offset=164
                                                              local.set 0
                                                              local.get 3
                                                              i32.const 1
                                                              i32.and
                                                              local.set 6
                                                              i32.const 0
                                                              local.set 4
                                                              block  ;; label = @30
                                                                local.get 3
                                                                i32.const 1
                                                                i32.eq
                                                                br_if 0 (;@30;)
                                                                local.get 3
                                                                i32.const -2
                                                                i32.and
                                                                local.set 5
                                                                i32.const 0
                                                                local.set 4
                                                                local.get 0
                                                                local.set 3
                                                                loop  ;; label = @31
                                                                  local.get 3
                                                                  i32.const 16
                                                                  i32.add
                                                                  local.get 3
                                                                  i32.const 8
                                                                  i32.add
                                                                  i32.load
                                                                  local.get 3
                                                                  i32.const 12
                                                                  i32.add
                                                                  i32.load
                                                                  local.get 3
                                                                  i32.const 4
                                                                  i32.add
                                                                  i32.load
                                                                  i32.load offset=16
                                                                  call_indirect (type 0)
                                                                  local.get 3
                                                                  i32.const 36
                                                                  i32.add
                                                                  local.get 3
                                                                  i32.const 28
                                                                  i32.add
                                                                  i32.load
                                                                  local.get 3
                                                                  i32.const 32
                                                                  i32.add
                                                                  i32.load
                                                                  local.get 3
                                                                  i32.const 24
                                                                  i32.add
                                                                  i32.load
                                                                  i32.load offset=16
                                                                  call_indirect (type 0)
                                                                  local.get 3
                                                                  i32.const 40
                                                                  i32.add
                                                                  local.set 3
                                                                  local.get 5
                                                                  local.get 4
                                                                  i32.const 2
                                                                  i32.add
                                                                  local.tee 4
                                                                  i32.ne
                                                                  br_if 0 (;@31;)
                                                                end
                                                              end
                                                              local.get 6
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 0
                                                              local.get 4
                                                              i32.const 20
                                                              i32.mul
                                                              i32.add
                                                              local.tee 3
                                                              i32.const 16
                                                              i32.add
                                                              local.get 3
                                                              i32.load offset=8
                                                              local.get 3
                                                              i32.load offset=12
                                                              local.get 3
                                                              i32.load offset=4
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                            end
                                                            block  ;; label = @29
                                                              local.get 1
                                                              i32.load offset=160
                                                              local.tee 3
                                                              i32.eqz
                                                              br_if 0 (;@29;)
                                                              local.get 1
                                                              i32.load offset=164
                                                              local.get 3
                                                              i32.const 20
                                                              i32.mul
                                                              i32.const 4
                                                              call $__rust_dealloc
                                                            end
                                                            local.get 2
                                                            local.get 2
                                                            i32.load
                                                            i32.const -1
                                                            i32.add
                                                            local.tee 3
                                                            i32.store
                                                            block  ;; label = @29
                                                              local.get 3
                                                              br_if 0 (;@29;)
                                                              local.get 2
                                                              local.get 2
                                                              i32.load offset=4
                                                              i32.const -1
                                                              i32.add
                                                              local.tee 3
                                                              i32.store offset=4
                                                              local.get 3
                                                              br_if 0 (;@29;)
                                                              local.get 2
                                                              i32.const 12
                                                              i32.const 4
                                                              call $__rust_dealloc
                                                            end
                                                            local.get 1
                                                            i32.const 260
                                                            i32.add
                                                            local.get 1
                                                            i32.load offset=252
                                                            local.get 1
                                                            i32.load offset=256
                                                            local.get 1
                                                            i32.load offset=248
                                                            i32.load offset=16
                                                            call_indirect (type 0)
                                                            local.get 2
                                                            local.get 2
                                                            i32.load
                                                            i32.const -1
                                                            i32.add
                                                            local.tee 3
                                                            i32.store
                                                            local.get 3
                                                            br_if 14 (;@14;)
                                                            local.get 2
                                                            local.get 2
                                                            i32.load offset=4
                                                            i32.const -1
                                                            i32.add
                                                            local.tee 3
                                                            i32.store offset=4
                                                            local.get 3
                                                            br_if 14 (;@14;)
                                                            local.get 2
                                                            i32.const 12
                                                            i32.const 4
                                                            call $__rust_dealloc
                                                            br 14 (;@14;)
                                                          end
                                                          i32.const 1049796
                                                          call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                                          unreachable
                                                        end
                                                        local.get 1
                                                        i32.const 248
                                                        i32.add
                                                        i32.const 8
                                                        i32.add
                                                        local.get 1
                                                        i32.const 24
                                                        i32.add
                                                        i32.const 8
                                                        i32.add
                                                        i64.load align=4
                                                        i64.store
                                                        local.get 1
                                                        local.get 1
                                                        i64.load offset=24 align=4
                                                        i64.store offset=248
                                                        local.get 1
                                                        i32.const 0
                                                        i32.store offset=264
                                                        local.get 2
                                                        local.get 2
                                                        i32.load
                                                        i32.const 1
                                                        i32.add
                                                        local.tee 3
                                                        i32.store
                                                        local.get 3
                                                        i32.eqz
                                                        br_if 16 (;@10;)
                                                        local.get 1
                                                        i32.const 1049408
                                                        i32.store offset=108
                                                        local.get 1
                                                        local.get 2
                                                        i32.store offset=104
                                                        local.get 1
                                                        i32.const 184
                                                        i32.add
                                                        local.get 1
                                                        i32.const 104
                                                        i32.add
                                                        call $_ZN5erc205erc205Erc2012total_supply17hfe7aaedf3a1c67e9E
                                                        local.get 1
                                                        i32.const 0
                                                        i32.store offset=168
                                                        local.get 1
                                                        i64.const 17179869184
                                                        i64.store offset=160 align=4
                                                        local.get 1
                                                        i32.const 128
                                                        i32.add
                                                        local.get 1
                                                        i32.const 184
                                                        i32.add
                                                        call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
                                                        local.get 1
                                                        i32.const 160
                                                        i32.add
                                                        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
                                                        local.get 1
                                                        i32.load offset=164
                                                        local.tee 3
                                                        local.get 1
                                                        i64.load offset=128 align=4
                                                        i64.store align=4
                                                        local.get 3
                                                        i32.const 8
                                                        i32.add
                                                        local.get 1
                                                        i32.const 128
                                                        i32.add
                                                        i32.const 8
                                                        i32.add
                                                        i64.load align=4
                                                        i64.store align=4
                                                        local.get 3
                                                        i32.const 16
                                                        i32.add
                                                        local.get 1
                                                        i32.const 128
                                                        i32.add
                                                        i32.const 16
                                                        i32.add
                                                        i32.load
                                                        i32.store
                                                        local.get 1
                                                        i32.const 1
                                                        i32.store offset=168
                                                        local.get 2
                                                        i32.load offset=8
                                                        br_if 20 (;@6;)
                                                        local.get 2
                                                        i32.const -1
                                                        i32.store offset=8
                                                        local.get 1
                                                        i32.const 184
                                                        i32.add
                                                        local.get 1
                                                        i32.const 160
                                                        i32.add
                                                        call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
                                                        local.get 4
                                                        local.get 1
                                                        i32.load offset=188
                                                        local.tee 3
                                                        local.get 1
                                                        i32.load offset=192
                                                        local.tee 5
                                                        call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
                                                        local.get 1
                                                        i32.const 196
                                                        i32.add
                                                        local.get 3
                                                        local.get 5
                                                        local.get 1
                                                        i32.load offset=184
                                                        i32.load offset=16
                                                        call_indirect (type 0)
                                                        local.get 2
                                                        local.get 2
                                                        i32.load offset=8
                                                        i32.const 1
                                                        i32.add
                                                        i32.store offset=8
                                                        block  ;; label = @27
                                                          local.get 1
                                                          i32.load offset=168
                                                          local.tee 3
                                                          i32.eqz
                                                          br_if 0 (;@27;)
                                                          local.get 1
                                                          i32.load offset=164
                                                          local.set 0
                                                          local.get 3
                                                          i32.const 1
                                                          i32.and
                                                          local.set 6
                                                          i32.const 0
                                                          local.set 4
                                                          block  ;; label = @28
                                                            local.get 3
                                                            i32.const 1
                                                            i32.eq
                                                            br_if 0 (;@28;)
                                                            local.get 3
                                                            i32.const -2
                                                            i32.and
                                                            local.set 5
                                                            i32.const 0
                                                            local.set 4
                                                            local.get 0
                                                            local.set 3
                                                            loop  ;; label = @29
                                                              local.get 3
                                                              i32.const 16
                                                              i32.add
                                                              local.get 3
                                                              i32.const 8
                                                              i32.add
                                                              i32.load
                                                              local.get 3
                                                              i32.const 12
                                                              i32.add
                                                              i32.load
                                                              local.get 3
                                                              i32.const 4
                                                              i32.add
                                                              i32.load
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 3
                                                              i32.const 36
                                                              i32.add
                                                              local.get 3
                                                              i32.const 28
                                                              i32.add
                                                              i32.load
                                                              local.get 3
                                                              i32.const 32
                                                              i32.add
                                                              i32.load
                                                              local.get 3
                                                              i32.const 24
                                                              i32.add
                                                              i32.load
                                                              i32.load offset=16
                                                              call_indirect (type 0)
                                                              local.get 3
                                                              i32.const 40
                                                              i32.add
                                                              local.set 3
                                                              local.get 5
                                                              local.get 4
                                                              i32.const 2
                                                              i32.add
                                                              local.tee 4
                                                              i32.ne
                                                              br_if 0 (;@29;)
                                                            end
                                                          end
                                                          local.get 6
                                                          i32.eqz
                                                          br_if 0 (;@27;)
                                                          local.get 0
                                                          local.get 4
                                                          i32.const 20
                                                          i32.mul
                                                          i32.add
                                                          local.tee 3
                                                          i32.const 16
                                                          i32.add
                                                          local.get 3
                                                          i32.load offset=8
                                                          local.get 3
                                                          i32.load offset=12
                                                          local.get 3
                                                          i32.load offset=4
                                                          i32.load offset=16
                                                          call_indirect (type 0)
                                                        end
                                                        block  ;; label = @27
                                                          local.get 1
                                                          i32.load offset=160
                                                          local.tee 3
                                                          i32.eqz
                                                          br_if 0 (;@27;)
                                                          local.get 1
                                                          i32.load offset=164
                                                          local.get 3
                                                          i32.const 20
                                                          i32.mul
                                                          i32.const 4
                                                          call $__rust_dealloc
                                                        end
                                                        local.get 2
                                                        local.get 2
                                                        i32.load
                                                        i32.const -1
                                                        i32.add
                                                        local.tee 3
                                                        i32.store
                                                        block  ;; label = @27
                                                          local.get 3
                                                          br_if 0 (;@27;)
                                                          local.get 2
                                                          local.get 2
                                                          i32.load offset=4
                                                          i32.const -1
                                                          i32.add
                                                          local.tee 3
                                                          i32.store offset=4
                                                          local.get 3
                                                          br_if 0 (;@27;)
                                                          local.get 2
                                                          i32.const 12
                                                          i32.const 4
                                                          call $__rust_dealloc
                                                        end
                                                        local.get 1
                                                        i32.const 260
                                                        i32.add
                                                        local.get 1
                                                        i32.load offset=252
                                                        local.get 1
                                                        i32.load offset=256
                                                        local.get 1
                                                        i32.load offset=248
                                                        i32.load offset=16
                                                        call_indirect (type 0)
                                                        local.get 2
                                                        local.get 2
                                                        i32.load
                                                        i32.const -1
                                                        i32.add
                                                        local.tee 3
                                                        i32.store
                                                        local.get 3
                                                        br_if 12 (;@14;)
                                                        local.get 2
                                                        local.get 2
                                                        i32.load offset=4
                                                        i32.const -1
                                                        i32.add
                                                        local.tee 3
                                                        i32.store offset=4
                                                        local.get 3
                                                        br_if 12 (;@14;)
                                                        local.get 2
                                                        i32.const 12
                                                        i32.const 4
                                                        call $__rust_dealloc
                                                        br 12 (;@14;)
                                                      end
                                                      i32.const 1049780
                                                      call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                                      unreachable
                                                    end
                                                    local.get 1
                                                    i32.const 104
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    local.get 1
                                                    i32.const 24
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    i64.load align=4
                                                    local.tee 7
                                                    i64.store
                                                    local.get 1
                                                    local.get 1
                                                    i64.load offset=24 align=4
                                                    i64.store offset=104
                                                    local.get 1
                                                    i32.const 0
                                                    i32.store offset=120
                                                    local.get 1
                                                    local.get 7
                                                    i32.wrap_i64
                                                    local.tee 3
                                                    i32.store offset=160
                                                    local.get 1
                                                    i32.const 32
                                                    i32.store offset=248
                                                    local.get 3
                                                    i32.const 31
                                                    i32.le_u
                                                    br_if 19 (;@5;)
                                                    local.get 1
                                                    i32.const 272
                                                    i32.add
                                                    local.get 1
                                                    i32.const 116
                                                    i32.add
                                                    local.get 1
                                                    i32.load offset=108
                                                    local.get 3
                                                    local.get 1
                                                    i32.load offset=104
                                                    i32.load
                                                    call_indirect (type 2)
                                                    local.get 1
                                                    i32.const 32
                                                    i32.store offset=280
                                                    local.get 1
                                                    i32.const 184
                                                    i32.add
                                                    local.get 1
                                                    i32.const 272
                                                    i32.add
                                                    call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
                                                    local.get 1
                                                    i32.const 212
                                                    i32.add
                                                    local.get 1
                                                    i32.const 104
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    i64.load
                                                    local.tee 7
                                                    i64.store align=4
                                                    local.get 1
                                                    i32.const 32
                                                    i32.store offset=220
                                                    local.get 1
                                                    local.get 1
                                                    i64.load offset=104
                                                    local.tee 8
                                                    i64.store offset=204 align=4
                                                    local.get 1
                                                    i32.const 160
                                                    i32.add
                                                    i32.const 16
                                                    i32.add
                                                    local.get 1
                                                    i32.const 184
                                                    i32.add
                                                    i32.const 16
                                                    i32.add
                                                    i32.load
                                                    i32.store
                                                    local.get 1
                                                    i32.const 160
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    local.get 1
                                                    i32.const 184
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    i64.load align=4
                                                    i64.store
                                                    local.get 1
                                                    local.get 1
                                                    i64.load offset=184 align=4
                                                    i64.store offset=160
                                                    local.get 1
                                                    i32.const 248
                                                    i32.add
                                                    i32.const 16
                                                    i32.add
                                                    i32.const 32
                                                    i32.store
                                                    local.get 1
                                                    i32.const 248
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    local.get 7
                                                    i64.store
                                                    local.get 1
                                                    local.get 8
                                                    i64.store offset=248
                                                    local.get 2
                                                    local.get 2
                                                    i32.load
                                                    i32.const 1
                                                    i32.add
                                                    local.tee 3
                                                    i32.store
                                                    local.get 3
                                                    i32.eqz
                                                    br_if 14 (;@10;)
                                                    local.get 1
                                                    i32.const 1049408
                                                    i32.store offset=60
                                                    local.get 1
                                                    local.get 2
                                                    i32.store offset=56
                                                    local.get 1
                                                    i32.const 184
                                                    i32.add
                                                    local.get 1
                                                    i32.const 56
                                                    i32.add
                                                    local.get 1
                                                    i32.const 160
                                                    i32.add
                                                    call $_ZN5erc205erc205Erc2010balance_of17h30b9a5b4c7c2e770E
                                                    local.get 1
                                                    i32.const 0
                                                    i32.store offset=88
                                                    local.get 1
                                                    i64.const 17179869184
                                                    i64.store offset=80 align=4
                                                    local.get 1
                                                    i32.const 128
                                                    i32.add
                                                    local.get 1
                                                    i32.const 184
                                                    i32.add
                                                    call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
                                                    local.get 1
                                                    i32.const 80
                                                    i32.add
                                                    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
                                                    local.get 1
                                                    i32.load offset=84
                                                    local.tee 3
                                                    local.get 1
                                                    i64.load offset=128 align=4
                                                    i64.store align=4
                                                    local.get 3
                                                    i32.const 8
                                                    i32.add
                                                    local.get 1
                                                    i32.const 128
                                                    i32.add
                                                    i32.const 8
                                                    i32.add
                                                    i64.load align=4
                                                    i64.store align=4
                                                    local.get 3
                                                    i32.const 16
                                                    i32.add
                                                    local.get 1
                                                    i32.const 128
                                                    i32.add
                                                    i32.const 16
                                                    i32.add
                                                    i32.load
                                                    i32.store
                                                    local.get 1
                                                    i32.const 1
                                                    i32.store offset=88
                                                    local.get 2
                                                    i32.load offset=8
                                                    br_if 20 (;@4;)
                                                    local.get 2
                                                    i32.const -1
                                                    i32.store offset=8
                                                    local.get 1
                                                    i32.const 184
                                                    i32.add
                                                    local.get 1
                                                    i32.const 80
                                                    i32.add
                                                    call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
                                                    local.get 4
                                                    local.get 1
                                                    i32.load offset=188
                                                    local.tee 3
                                                    local.get 1
                                                    i32.load offset=192
                                                    local.tee 5
                                                    call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
                                                    local.get 1
                                                    i32.const 196
                                                    i32.add
                                                    local.get 3
                                                    local.get 5
                                                    local.get 1
                                                    i32.load offset=184
                                                    i32.load offset=16
                                                    call_indirect (type 0)
                                                    local.get 2
                                                    local.get 2
                                                    i32.load offset=8
                                                    i32.const 1
                                                    i32.add
                                                    i32.store offset=8
                                                    block  ;; label = @25
                                                      local.get 1
                                                      i32.load offset=88
                                                      local.tee 3
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 1
                                                      i32.load offset=84
                                                      local.set 0
                                                      local.get 3
                                                      i32.const 1
                                                      i32.and
                                                      local.set 6
                                                      i32.const 0
                                                      local.set 4
                                                      block  ;; label = @26
                                                        local.get 3
                                                        i32.const 1
                                                        i32.eq
                                                        br_if 0 (;@26;)
                                                        local.get 3
                                                        i32.const -2
                                                        i32.and
                                                        local.set 5
                                                        i32.const 0
                                                        local.set 4
                                                        local.get 0
                                                        local.set 3
                                                        loop  ;; label = @27
                                                          local.get 3
                                                          i32.const 16
                                                          i32.add
                                                          local.get 3
                                                          i32.const 8
                                                          i32.add
                                                          i32.load
                                                          local.get 3
                                                          i32.const 12
                                                          i32.add
                                                          i32.load
                                                          local.get 3
                                                          i32.const 4
                                                          i32.add
                                                          i32.load
                                                          i32.load offset=16
                                                          call_indirect (type 0)
                                                          local.get 3
                                                          i32.const 36
                                                          i32.add
                                                          local.get 3
                                                          i32.const 28
                                                          i32.add
                                                          i32.load
                                                          local.get 3
                                                          i32.const 32
                                                          i32.add
                                                          i32.load
                                                          local.get 3
                                                          i32.const 24
                                                          i32.add
                                                          i32.load
                                                          i32.load offset=16
                                                          call_indirect (type 0)
                                                          local.get 3
                                                          i32.const 40
                                                          i32.add
                                                          local.set 3
                                                          local.get 5
                                                          local.get 4
                                                          i32.const 2
                                                          i32.add
                                                          local.tee 4
                                                          i32.ne
                                                          br_if 0 (;@27;)
                                                        end
                                                      end
                                                      local.get 6
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 0
                                                      local.get 4
                                                      i32.const 20
                                                      i32.mul
                                                      i32.add
                                                      local.tee 3
                                                      i32.const 16
                                                      i32.add
                                                      local.get 3
                                                      i32.load offset=8
                                                      local.get 3
                                                      i32.load offset=12
                                                      local.get 3
                                                      i32.load offset=4
                                                      i32.load offset=16
                                                      call_indirect (type 0)
                                                    end
                                                    block  ;; label = @25
                                                      local.get 1
                                                      i32.load offset=80
                                                      local.tee 3
                                                      i32.eqz
                                                      br_if 0 (;@25;)
                                                      local.get 1
                                                      i32.load offset=84
                                                      local.get 3
                                                      i32.const 20
                                                      i32.mul
                                                      i32.const 4
                                                      call $__rust_dealloc
                                                    end
                                                    local.get 2
                                                    local.get 2
                                                    i32.load
                                                    i32.const -1
                                                    i32.add
                                                    local.tee 3
                                                    i32.store
                                                    block  ;; label = @25
                                                      local.get 3
                                                      br_if 0 (;@25;)
                                                      local.get 2
                                                      local.get 2
                                                      i32.load offset=4
                                                      i32.const -1
                                                      i32.add
                                                      local.tee 3
                                                      i32.store offset=4
                                                      local.get 3
                                                      br_if 0 (;@25;)
                                                      local.get 2
                                                      i32.const 12
                                                      i32.const 4
                                                      call $__rust_dealloc
                                                    end
                                                    local.get 1
                                                    i32.const 260
                                                    i32.add
                                                    local.get 1
                                                    i32.load offset=252
                                                    local.get 1
                                                    i32.load offset=256
                                                    local.get 1
                                                    i32.load offset=248
                                                    i32.load offset=16
                                                    call_indirect (type 0)
                                                    local.get 2
                                                    local.get 2
                                                    i32.load
                                                    i32.const -1
                                                    i32.add
                                                    local.tee 3
                                                    i32.store
                                                    local.get 3
                                                    br_if 10 (;@14;)
                                                    local.get 2
                                                    local.get 2
                                                    i32.load offset=4
                                                    i32.const -1
                                                    i32.add
                                                    local.tee 3
                                                    i32.store offset=4
                                                    local.get 3
                                                    br_if 10 (;@14;)
                                                    local.get 2
                                                    i32.const 12
                                                    i32.const 4
                                                    call $__rust_dealloc
                                                    br 10 (;@14;)
                                                  end
                                                  i32.const 1049764
                                                  call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                                  unreachable
                                                end
                                                local.get 1
                                                i32.const 56
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.get 1
                                                i32.const 24
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                i64.load align=4
                                                local.tee 7
                                                i64.store
                                                local.get 1
                                                local.get 1
                                                i64.load offset=24 align=4
                                                i64.store offset=56
                                                local.get 1
                                                i32.const 0
                                                i32.store offset=72
                                                local.get 1
                                                local.get 7
                                                i32.wrap_i64
                                                local.tee 3
                                                i32.store offset=160
                                                local.get 1
                                                i32.const 32
                                                i32.store offset=248
                                                local.get 3
                                                i32.const 31
                                                i32.le_u
                                                br_if 19 (;@3;)
                                                local.get 1
                                                i32.const 288
                                                i32.add
                                                local.get 1
                                                i32.const 68
                                                i32.add
                                                local.get 1
                                                i32.load offset=60
                                                local.get 3
                                                local.get 1
                                                i32.load offset=56
                                                i32.load
                                                call_indirect (type 2)
                                                local.get 1
                                                i32.const 32
                                                i32.store offset=296
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                local.get 1
                                                i32.const 288
                                                i32.add
                                                call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
                                                local.get 1
                                                i32.const 212
                                                i32.add
                                                local.get 1
                                                i32.const 56
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                i64.load
                                                local.tee 7
                                                i64.store align=4
                                                local.get 1
                                                i32.const 104
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                i32.const 32
                                                i32.store
                                                local.get 1
                                                i32.const 104
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.tee 3
                                                local.get 7
                                                i64.store
                                                local.get 1
                                                i32.const 32
                                                i32.store offset=220
                                                local.get 1
                                                local.get 1
                                                i64.load offset=56
                                                local.tee 7
                                                i64.store offset=204 align=4
                                                local.get 1
                                                i32.const 80
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                local.tee 5
                                                i32.load
                                                i32.store
                                                local.get 1
                                                i32.const 80
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.tee 0
                                                i64.load align=4
                                                i64.store
                                                local.get 1
                                                local.get 7
                                                i64.store offset=104
                                                local.get 1
                                                local.get 1
                                                i64.load offset=184 align=4
                                                i64.store offset=80
                                                local.get 1
                                                i32.const 128
                                                i32.add
                                                local.get 1
                                                i32.const 104
                                                i32.add
                                                i32.const 32
                                                i32.const 64
                                                call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                local.get 1
                                                i32.const 128
                                                i32.add
                                                call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17he4f1141fa5eb2511E
                                                local.get 1
                                                i32.const 224
                                                i32.add
                                                local.get 3
                                                i64.load
                                                local.tee 7
                                                i64.store align=4
                                                local.get 1
                                                local.get 1
                                                i64.load offset=104
                                                local.tee 8
                                                i64.store offset=216 align=4
                                                local.get 1
                                                i32.const 64
                                                i32.store offset=232
                                                local.get 1
                                                i32.const 128
                                                i32.add
                                                i32.const 24
                                                i32.add
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                i32.const 24
                                                i32.add
                                                i64.load align=4
                                                i64.store
                                                local.get 1
                                                i32.const 128
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                local.get 5
                                                i64.load align=4
                                                i64.store
                                                local.get 1
                                                i32.const 128
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.get 0
                                                i64.load align=4
                                                i64.store
                                                local.get 1
                                                local.get 1
                                                i64.load offset=184 align=4
                                                i64.store offset=128
                                                local.get 1
                                                i32.const 160
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                i32.const 64
                                                i32.store
                                                local.get 1
                                                i32.const 160
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.get 7
                                                i64.store
                                                local.get 1
                                                local.get 8
                                                i64.store offset=160
                                                local.get 2
                                                local.get 2
                                                i32.load
                                                i32.const 1
                                                i32.add
                                                local.tee 3
                                                i32.store
                                                local.get 3
                                                i32.eqz
                                                br_if 12 (;@10;)
                                                local.get 2
                                                i32.load offset=8
                                                local.tee 3
                                                i32.const 2147483647
                                                i32.ge_u
                                                br_if 20 (;@2;)
                                                local.get 2
                                                local.get 3
                                                i32.const 1
                                                i32.add
                                                i32.store offset=8
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                local.tee 3
                                                i32.const 0
                                                i32.store
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.tee 5
                                                i64.const 0
                                                i64.store
                                                local.get 1
                                                i64.const 0
                                                i64.store offset=184
                                                local.get 4
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$6caller17h6e5bbf9110a580a2E
                                                local.get 1
                                                i32.const 248
                                                i32.add
                                                i32.const 16
                                                i32.add
                                                local.tee 0
                                                local.get 3
                                                i32.load
                                                i32.store
                                                local.get 1
                                                i32.const 248
                                                i32.add
                                                i32.const 8
                                                i32.add
                                                local.tee 6
                                                local.get 5
                                                i64.load
                                                i64.store
                                                local.get 1
                                                local.get 1
                                                i64.load offset=184
                                                i64.store offset=248
                                                local.get 2
                                                local.get 2
                                                i32.load offset=8
                                                i32.const -1
                                                i32.add
                                                i32.store offset=8
                                                local.get 2
                                                i32.const 1049408
                                                local.get 1
                                                i32.const 248
                                                i32.add
                                                local.get 1
                                                i32.const 80
                                                i32.add
                                                local.get 1
                                                i32.const 128
                                                i32.add
                                                call $_ZN5erc205erc205Erc209_transfer17h2686357d78aa1243E.llvm.12425491971175694154
                                                local.get 1
                                                i32.const 0
                                                i32.store offset=244
                                                local.get 1
                                                i64.const 17179869184
                                                i64.store offset=236 align=4
                                                local.get 1
                                                i32.const 208
                                                i32.add
                                                i64.const 0
                                                i64.store
                                                local.get 3
                                                i64.const 0
                                                i64.store
                                                local.get 5
                                                i64.const 0
                                                i64.store
                                                local.get 1
                                                i64.const 0
                                                i64.store offset=184
                                                local.get 1
                                                i32.const 248
                                                i32.add
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
                                                local.get 1
                                                i32.const 236
                                                i32.add
                                                call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
                                                local.get 1
                                                i32.load offset=240
                                                local.tee 3
                                                local.get 1
                                                i64.load offset=248 align=4
                                                i64.store align=4
                                                local.get 3
                                                i32.const 8
                                                i32.add
                                                local.get 6
                                                i64.load align=4
                                                i64.store align=4
                                                local.get 3
                                                i32.const 16
                                                i32.add
                                                local.get 0
                                                i32.load
                                                i32.store
                                                local.get 1
                                                i32.const 1
                                                i32.store offset=244
                                                local.get 2
                                                i32.load offset=8
                                                br_if 21 (;@1;)
                                                local.get 2
                                                i32.const -1
                                                i32.store offset=8
                                                local.get 1
                                                i32.const 184
                                                i32.add
                                                local.get 1
                                                i32.const 236
                                                i32.add
                                                call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
                                                local.get 4
                                                local.get 1
                                                i32.load offset=188
                                                local.tee 3
                                                local.get 1
                                                i32.load offset=192
                                                local.tee 5
                                                call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
                                                local.get 1
                                                i32.const 196
                                                i32.add
                                                local.get 3
                                                local.get 5
                                                local.get 1
                                                i32.load offset=184
                                                i32.load offset=16
                                                call_indirect (type 0)
                                                local.get 2
                                                local.get 2
                                                i32.load offset=8
                                                i32.const 1
                                                i32.add
                                                i32.store offset=8
                                                block  ;; label = @23
                                                  local.get 1
                                                  i32.load offset=244
                                                  local.tee 3
                                                  i32.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 1
                                                  i32.load offset=240
                                                  local.set 0
                                                  local.get 3
                                                  i32.const 1
                                                  i32.and
                                                  local.set 6
                                                  i32.const 0
                                                  local.set 4
                                                  block  ;; label = @24
                                                    local.get 3
                                                    i32.const 1
                                                    i32.eq
                                                    br_if 0 (;@24;)
                                                    local.get 3
                                                    i32.const -2
                                                    i32.and
                                                    local.set 5
                                                    i32.const 0
                                                    local.set 4
                                                    local.get 0
                                                    local.set 3
                                                    loop  ;; label = @25
                                                      local.get 3
                                                      i32.const 16
                                                      i32.add
                                                      local.get 3
                                                      i32.const 8
                                                      i32.add
                                                      i32.load
                                                      local.get 3
                                                      i32.const 12
                                                      i32.add
                                                      i32.load
                                                      local.get 3
                                                      i32.const 4
                                                      i32.add
                                                      i32.load
                                                      i32.load offset=16
                                                      call_indirect (type 0)
                                                      local.get 3
                                                      i32.const 36
                                                      i32.add
                                                      local.get 3
                                                      i32.const 28
                                                      i32.add
                                                      i32.load
                                                      local.get 3
                                                      i32.const 32
                                                      i32.add
                                                      i32.load
                                                      local.get 3
                                                      i32.const 24
                                                      i32.add
                                                      i32.load
                                                      i32.load offset=16
                                                      call_indirect (type 0)
                                                      local.get 3
                                                      i32.const 40
                                                      i32.add
                                                      local.set 3
                                                      local.get 5
                                                      local.get 4
                                                      i32.const 2
                                                      i32.add
                                                      local.tee 4
                                                      i32.ne
                                                      br_if 0 (;@25;)
                                                    end
                                                  end
                                                  local.get 6
                                                  i32.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 0
                                                  local.get 4
                                                  i32.const 20
                                                  i32.mul
                                                  i32.add
                                                  local.tee 3
                                                  i32.const 16
                                                  i32.add
                                                  local.get 3
                                                  i32.load offset=8
                                                  local.get 3
                                                  i32.load offset=12
                                                  local.get 3
                                                  i32.load offset=4
                                                  i32.load offset=16
                                                  call_indirect (type 0)
                                                end
                                                block  ;; label = @23
                                                  local.get 1
                                                  i32.load offset=236
                                                  local.tee 3
                                                  i32.eqz
                                                  br_if 0 (;@23;)
                                                  local.get 1
                                                  i32.load offset=240
                                                  local.get 3
                                                  i32.const 20
                                                  i32.mul
                                                  i32.const 4
                                                  call $__rust_dealloc
                                                end
                                                local.get 2
                                                local.get 2
                                                i32.load
                                                i32.const -1
                                                i32.add
                                                local.tee 3
                                                i32.store
                                                block  ;; label = @23
                                                  local.get 3
                                                  br_if 0 (;@23;)
                                                  local.get 2
                                                  local.get 2
                                                  i32.load offset=4
                                                  i32.const -1
                                                  i32.add
                                                  local.tee 3
                                                  i32.store offset=4
                                                  local.get 3
                                                  br_if 0 (;@23;)
                                                  local.get 2
                                                  i32.const 12
                                                  i32.const 4
                                                  call $__rust_dealloc
                                                end
                                                local.get 1
                                                i32.const 172
                                                i32.add
                                                local.get 1
                                                i32.load offset=164
                                                local.get 1
                                                i32.load offset=168
                                                local.get 1
                                                i32.load offset=160
                                                i32.load offset=16
                                                call_indirect (type 0)
                                                local.get 2
                                                local.get 2
                                                i32.load
                                                i32.const -1
                                                i32.add
                                                local.tee 3
                                                i32.store
                                                local.get 3
                                                br_if 8 (;@14;)
                                                local.get 2
                                                local.get 2
                                                i32.load offset=4
                                                i32.const -1
                                                i32.add
                                                local.tee 3
                                                i32.store offset=4
                                                local.get 3
                                                br_if 8 (;@14;)
                                                local.get 2
                                                i32.const 12
                                                i32.const 4
                                                call $__rust_dealloc
                                                br 8 (;@14;)
                                              end
                                              i32.const 1049748
                                              call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                              unreachable
                                            end
                                            local.get 2
                                            local.get 1
                                            i32.const 24
                                            i32.add
                                            call $_ZN5erc2016erc20_dispatcher15allowanceCaller17h88b0d279a6747d5fE
                                            br 6 (;@14;)
                                          end
                                          i32.const 1049732
                                          call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                          unreachable
                                        end
                                        local.get 2
                                        local.get 1
                                        i32.const 24
                                        i32.add
                                        call $_ZN5erc2016erc20_dispatcher13approveCaller17h6ecdfab69f1d6d39E
                                        br 4 (;@14;)
                                      end
                                      i32.const 1049716
                                      call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                      unreachable
                                    end
                                    local.get 2
                                    local.get 1
                                    i32.const 24
                                    i32.add
                                    call $_ZN5erc2016erc20_dispatcher18transferFromCaller17h03cbb7fc36e0b02dE
                                    br 2 (;@14;)
                                  end
                                  i32.const 1049700
                                  call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                                  unreachable
                                end
                                local.get 2
                                local.get 1
                                i32.const 24
                                i32.add
                                call $_ZN5erc2016erc20_dispatcher10mintCaller17h395bb690fc6f5359E
                              end
                              local.get 1
                              i32.const 52
                              i32.add
                              local.get 1
                              i32.load offset=44
                              local.get 1
                              i32.load offset=48
                              local.get 1
                              i32.load offset=40
                              i32.load offset=16
                              call_indirect (type 0)
                            end
                            local.get 1
                            i32.const 304
                            i32.add
                            global.set $__stack_pointer
                            return
                          end
                          i32.const 4
                          i32.const 12
                          call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
                          unreachable
                        end
                        local.get 6
                        local.get 5
                        call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
                        unreachable
                      end
                      unreachable
                      unreachable
                    end
                    i32.const 1049828
                    call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
                    unreachable
                  end
                  i32.const 1049812
                  call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
                  unreachable
                end
                i32.const 1049844
                call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
                unreachable
              end
              i32.const 1049860
              call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
              unreachable
            end
            local.get 1
            i32.const 2
            i32.store offset=188
            local.get 1
            i32.const 1049196
            i32.store offset=184
            local.get 1
            i64.const 2
            i64.store offset=196 align=4
            local.get 1
            i32.const 1
            i64.extend_i32_u
            i64.const 32
            i64.shl
            local.tee 7
            local.get 1
            i32.const 160
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=136
            local.get 1
            local.get 7
            local.get 1
            i32.const 248
            i32.add
            i64.extend_i32_u
            i64.or
            i64.store offset=128
            local.get 1
            local.get 1
            i32.const 128
            i32.add
            i32.store offset=192
            local.get 1
            i32.const 184
            i32.add
            i32.const 1049212
            call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
            unreachable
          end
          i32.const 1049876
          call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
          unreachable
        end
        local.get 1
        i32.const 2
        i32.store offset=188
        local.get 1
        i32.const 1049196
        i32.store offset=184
        local.get 1
        i64.const 2
        i64.store offset=196 align=4
        local.get 1
        i32.const 1
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 7
        local.get 1
        i32.const 160
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=136
        local.get 1
        local.get 7
        local.get 1
        i32.const 248
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=128
        local.get 1
        local.get 1
        i32.const 128
        i32.add
        i32.store offset=192
        local.get 1
        i32.const 184
        i32.add
        i32.const 1049212
        call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
        unreachable
      end
      i32.const 1048704
      call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
      unreachable
    end
    i32.const 1049892
    call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
    unreachable)
  (func $_ZN5erc2016erc20_dispatcher15allowanceCaller17h88b0d279a6747d5fE (type 4) (param i32 i32)
    (local i32 i32 i32 i64 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 208
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 0
    i32.store offset=24
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 188
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.const 0
    i32.const 32
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 188
    i32.add
    call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
    local.get 2
    i32.const 156
    i32.add
    local.tee 4
    local.get 3
    i64.load
    local.tee 5
    i64.store align=4
    local.get 2
    i32.const 56
    i32.add
    i32.const 16
    i32.add
    local.tee 1
    i32.const 32
    i32.store
    local.get 2
    i32.const 56
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 5
    i64.store
    local.get 2
    local.get 2
    i64.load offset=8
    local.tee 5
    i64.store offset=148 align=4
    local.get 2
    i32.const 32
    i32.store offset=164
    local.get 2
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 128
    i32.add
    i32.const 16
    i32.add
    local.tee 6
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 128
    i32.add
    i32.const 8
    i32.add
    local.tee 7
    i64.load align=4
    i64.store
    local.get 2
    local.get 5
    i64.store offset=56
    local.get 2
    local.get 2
    i64.load offset=128 align=4
    i64.store offset=32
    local.get 2
    i32.const 188
    i32.add
    local.get 2
    i32.const 56
    i32.add
    local.get 1
    i32.load
    local.tee 1
    local.get 1
    i32.const 32
    i32.add
    local.tee 1
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 188
    i32.add
    call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
    local.get 4
    local.get 3
    i64.load
    local.tee 5
    i64.store align=4
    local.get 2
    local.get 2
    i64.load offset=56
    local.tee 8
    i64.store offset=148 align=4
    local.get 2
    local.get 1
    i32.store offset=164
    local.get 2
    i32.const 80
    i32.add
    i32.const 16
    i32.add
    local.get 6
    i32.load
    i32.store
    local.get 2
    i32.const 80
    i32.add
    i32.const 8
    i32.add
    local.get 7
    i64.load align=4
    i64.store
    local.get 2
    local.get 2
    i64.load offset=128 align=4
    i64.store offset=80
    local.get 2
    i32.const 104
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.store
    local.get 2
    i32.const 104
    i32.add
    i32.const 8
    i32.add
    local.get 5
    i64.store
    local.get 2
    local.get 8
    i64.store offset=104
    local.get 0
    local.get 0
    i32.load
    i32.const 1
    i32.add
    local.tee 1
    i32.store
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 1049408
      i32.store offset=172
      local.get 2
      local.get 0
      i32.store offset=168
      local.get 2
      i32.const 128
      i32.add
      local.get 2
      i32.const 168
      i32.add
      local.get 2
      i32.const 32
      i32.add
      local.get 2
      i32.const 80
      i32.add
      call $_ZN5erc205erc205Erc209allowance17h75c7fcb584df1022E
      local.get 2
      i32.const 0
      i32.store offset=184
      local.get 2
      i64.const 17179869184
      i64.store offset=176 align=4
      local.get 2
      i32.const 188
      i32.add
      local.get 2
      i32.const 128
      i32.add
      call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
      local.get 2
      i32.const 176
      i32.add
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
      local.get 2
      i32.load offset=180
      local.tee 1
      local.get 2
      i64.load offset=188 align=4
      i64.store align=4
      local.get 1
      i32.const 8
      i32.add
      local.get 2
      i32.const 188
      i32.add
      i32.const 8
      i32.add
      i64.load align=4
      i64.store align=4
      local.get 1
      i32.const 16
      i32.add
      local.get 2
      i32.const 188
      i32.add
      i32.const 16
      i32.add
      i32.load
      i32.store
      local.get 2
      i32.const 1
      i32.store offset=184
      block  ;; label = @2
        local.get 0
        i32.const 8
        i32.add
        i32.load
        br_if 0 (;@2;)
        local.get 0
        i32.const 8
        i32.add
        local.tee 1
        i32.const -1
        i32.store
        local.get 0
        i32.const 12
        i32.add
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 128
        i32.add
        local.get 2
        i32.const 176
        i32.add
        call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
        local.get 3
        local.get 2
        i32.load offset=132
        local.tee 4
        local.get 2
        i32.load offset=136
        local.tee 6
        call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
        local.get 2
        i32.const 128
        i32.add
        i32.const 12
        i32.add
        local.get 4
        local.get 6
        local.get 2
        i32.load offset=128
        i32.load offset=16
        call_indirect (type 0)
        local.get 1
        local.get 1
        i32.load
        i32.const 1
        i32.add
        i32.store
        block  ;; label = @3
          local.get 2
          i32.load offset=184
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=180
          local.set 6
          local.get 1
          i32.const 1
          i32.and
          local.set 7
          i32.const 0
          local.set 3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const -2
            i32.and
            local.set 4
            i32.const 0
            local.set 3
            local.get 6
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 16
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.load
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.get 1
              i32.const 4
              i32.add
              i32.load
              i32.load offset=16
              call_indirect (type 0)
              local.get 1
              i32.const 36
              i32.add
              local.get 1
              i32.const 28
              i32.add
              i32.load
              local.get 1
              i32.const 32
              i32.add
              i32.load
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.load offset=16
              call_indirect (type 0)
              local.get 1
              i32.const 40
              i32.add
              local.set 1
              local.get 4
              local.get 3
              i32.const 2
              i32.add
              local.tee 3
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 3
          i32.const 20
          i32.mul
          i32.add
          local.tee 1
          i32.const 16
          i32.add
          local.get 1
          i32.load offset=8
          local.get 1
          i32.load offset=12
          local.get 1
          i32.load offset=4
          i32.load offset=16
          call_indirect (type 0)
        end
        block  ;; label = @3
          local.get 2
          i32.load offset=176
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=180
          local.get 1
          i32.const 20
          i32.mul
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 0
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 1
          local.get 1
          i32.load
          i32.const -1
          i32.add
          local.tee 1
          i32.store
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 2
        i32.const 116
        i32.add
        local.get 2
        i32.load offset=108
        local.get 2
        i32.load offset=112
        local.get 2
        i32.load offset=104
        i32.load offset=16
        call_indirect (type 0)
        local.get 0
        local.get 0
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 1
          local.get 1
          i32.load
          i32.const -1
          i32.add
          local.tee 1
          i32.store
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 2
        i32.const 208
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1049908
      call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
      unreachable
    end
    unreachable
    unreachable)
  (func $_ZN5erc2016erc20_dispatcher13approveCaller17h6ecdfab69f1d6d39E (type 4) (param i32 i32)
    (local i32 i32 i64 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 240
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    local.tee 4
    i64.store
    local.get 2
    i32.const 0
    i32.store offset=24
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    local.get 4
    i32.wrap_i64
    local.tee 1
    i32.store offset=112
    local.get 2
    i32.const 32
    i32.store offset=200
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 31
          i32.le_u
          br_if 0 (;@3;)
          local.get 2
          i32.const 224
          i32.add
          local.get 2
          i32.const 20
          i32.add
          local.get 2
          i32.load offset=12
          local.get 1
          local.get 2
          i32.load offset=8
          i32.load
          call_indirect (type 2)
          local.get 2
          i32.const 32
          i32.store offset=232
          local.get 2
          i32.const 136
          i32.add
          local.get 2
          i32.const 224
          i32.add
          call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
          local.get 2
          i32.const 164
          i32.add
          local.get 3
          i64.load
          local.tee 4
          i64.store align=4
          local.get 2
          i32.const 56
          i32.add
          i32.const 16
          i32.add
          i32.const 32
          i32.store
          local.get 2
          i32.const 56
          i32.add
          i32.const 8
          i32.add
          local.tee 1
          local.get 4
          i64.store
          local.get 2
          i32.const 32
          i32.store offset=172
          local.get 2
          local.get 2
          i64.load offset=8
          local.tee 4
          i64.store offset=156 align=4
          local.get 2
          i32.const 32
          i32.add
          i32.const 16
          i32.add
          local.get 2
          i32.const 136
          i32.add
          i32.const 16
          i32.add
          local.tee 3
          i32.load
          i32.store
          local.get 2
          i32.const 32
          i32.add
          i32.const 8
          i32.add
          local.get 2
          i32.const 136
          i32.add
          i32.const 8
          i32.add
          local.tee 5
          i64.load align=4
          i64.store
          local.get 2
          local.get 4
          i64.store offset=56
          local.get 2
          local.get 2
          i64.load offset=136 align=4
          i64.store offset=32
          local.get 2
          i32.const 80
          i32.add
          local.get 2
          i32.const 56
          i32.add
          i32.const 32
          i32.const 64
          call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
          local.get 2
          i32.const 136
          i32.add
          local.get 2
          i32.const 80
          i32.add
          call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17he4f1141fa5eb2511E
          local.get 2
          i32.const 176
          i32.add
          local.get 1
          i64.load
          local.tee 4
          i64.store align=4
          local.get 2
          local.get 2
          i64.load offset=56
          local.tee 6
          i64.store offset=168 align=4
          local.get 2
          i32.const 64
          i32.store offset=184
          local.get 2
          i32.const 80
          i32.add
          i32.const 24
          i32.add
          local.get 2
          i32.const 136
          i32.add
          i32.const 24
          i32.add
          i64.load align=4
          i64.store
          local.get 2
          i32.const 80
          i32.add
          i32.const 16
          i32.add
          local.get 3
          i64.load align=4
          i64.store
          local.get 2
          i32.const 80
          i32.add
          i32.const 8
          i32.add
          local.get 5
          i64.load align=4
          i64.store
          local.get 2
          local.get 2
          i64.load offset=136 align=4
          i64.store offset=80
          local.get 2
          i32.const 112
          i32.add
          i32.const 16
          i32.add
          i32.const 64
          i32.store
          local.get 2
          i32.const 112
          i32.add
          i32.const 8
          i32.add
          local.get 4
          i64.store
          local.get 2
          local.get 6
          i64.store offset=112
          local.get 0
          local.get 0
          i32.load
          i32.const 1
          i32.add
          local.tee 1
          i32.store
          local.get 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 0
          i32.const 8
          i32.add
          local.tee 1
          i32.load
          local.tee 3
          i32.const 2147483646
          i32.gt_u
          br_if 2 (;@1;)
          local.get 1
          local.get 3
          i32.const 1
          i32.add
          i32.store
          local.get 0
          i32.const 12
          i32.add
          local.tee 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 2
          i32.const 136
          i32.add
          i32.const 16
          i32.add
          local.tee 5
          i32.const 0
          i32.store
          local.get 2
          i32.const 136
          i32.add
          i32.const 8
          i32.add
          local.tee 7
          i64.const 0
          i64.store
          local.get 2
          i64.const 0
          i64.store offset=136
          local.get 3
          local.get 2
          i32.const 136
          i32.add
          call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$6caller17h6e5bbf9110a580a2E
          local.get 2
          i32.const 200
          i32.add
          i32.const 16
          i32.add
          local.tee 8
          local.get 5
          i32.load
          i32.store
          local.get 2
          i32.const 200
          i32.add
          i32.const 8
          i32.add
          local.tee 9
          local.get 7
          i64.load
          i64.store
          local.get 2
          local.get 2
          i64.load offset=136
          i64.store offset=200
          local.get 0
          i32.const 8
          i32.add
          local.tee 1
          local.get 1
          i32.load
          i32.const -1
          i32.add
          i32.store
          local.get 0
          i32.const 1049408
          local.get 2
          i32.const 200
          i32.add
          local.get 2
          i32.const 32
          i32.add
          local.get 2
          i32.const 80
          i32.add
          i32.const 1
          call $_ZN5erc205erc205Erc208_approve17h53bfc76d7c1fe7cfE.llvm.12425491971175694154
          local.get 2
          i32.const 0
          i32.store offset=196
          local.get 2
          i64.const 17179869184
          i64.store offset=188 align=4
          local.get 2
          i32.const 160
          i32.add
          i64.const 0
          i64.store
          local.get 5
          i64.const 0
          i64.store
          local.get 7
          i64.const 0
          i64.store
          local.get 2
          i64.const 0
          i64.store offset=136
          local.get 2
          i32.const 200
          i32.add
          local.get 2
          i32.const 136
          i32.add
          call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
          local.get 2
          i32.const 188
          i32.add
          call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
          local.get 2
          i32.load offset=192
          local.tee 5
          local.get 2
          i64.load offset=200 align=4
          i64.store align=4
          local.get 5
          i32.const 8
          i32.add
          local.get 9
          i64.load align=4
          i64.store align=4
          local.get 5
          i32.const 16
          i32.add
          local.get 8
          i32.load
          i32.store
          local.get 2
          i32.const 1
          i32.store offset=196
          block  ;; label = @4
            local.get 1
            i32.load
            br_if 0 (;@4;)
            local.get 1
            i32.const -1
            i32.store
            local.get 2
            i32.const 136
            i32.add
            local.get 2
            i32.const 188
            i32.add
            call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
            local.get 3
            local.get 2
            i32.load offset=140
            local.tee 5
            local.get 2
            i32.load offset=144
            local.tee 7
            call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
            local.get 2
            i32.const 148
            i32.add
            local.get 5
            local.get 7
            local.get 2
            i32.load offset=136
            i32.load offset=16
            call_indirect (type 0)
            local.get 1
            local.get 1
            i32.load
            i32.const 1
            i32.add
            i32.store
            block  ;; label = @5
              local.get 2
              i32.load offset=196
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=192
              local.set 7
              local.get 1
              i32.const 1
              i32.and
              local.set 8
              i32.const 0
              local.set 3
              block  ;; label = @6
                local.get 1
                i32.const 1
                i32.eq
                br_if 0 (;@6;)
                local.get 1
                i32.const -2
                i32.and
                local.set 5
                i32.const 0
                local.set 3
                local.get 7
                local.set 1
                loop  ;; label = @7
                  local.get 1
                  i32.const 16
                  i32.add
                  local.get 1
                  i32.const 8
                  i32.add
                  i32.load
                  local.get 1
                  i32.const 12
                  i32.add
                  i32.load
                  local.get 1
                  i32.const 4
                  i32.add
                  i32.load
                  i32.load offset=16
                  call_indirect (type 0)
                  local.get 1
                  i32.const 36
                  i32.add
                  local.get 1
                  i32.const 28
                  i32.add
                  i32.load
                  local.get 1
                  i32.const 32
                  i32.add
                  i32.load
                  local.get 1
                  i32.const 24
                  i32.add
                  i32.load
                  i32.load offset=16
                  call_indirect (type 0)
                  local.get 1
                  i32.const 40
                  i32.add
                  local.set 1
                  local.get 5
                  local.get 3
                  i32.const 2
                  i32.add
                  local.tee 3
                  i32.ne
                  br_if 0 (;@7;)
                end
              end
              local.get 8
              i32.eqz
              br_if 0 (;@5;)
              local.get 7
              local.get 3
              i32.const 20
              i32.mul
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              local.get 1
              i32.load offset=8
              local.get 1
              i32.load offset=12
              local.get 1
              i32.load offset=4
              i32.load offset=16
              call_indirect (type 0)
            end
            block  ;; label = @5
              local.get 2
              i32.load offset=188
              local.tee 1
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=192
              local.get 1
              i32.const 20
              i32.mul
              i32.const 4
              call $__rust_dealloc
            end
            local.get 0
            local.get 0
            i32.load
            i32.const -1
            i32.add
            local.tee 1
            i32.store
            block  ;; label = @5
              local.get 1
              br_if 0 (;@5;)
              local.get 0
              i32.const 4
              i32.add
              local.tee 1
              local.get 1
              i32.load
              i32.const -1
              i32.add
              local.tee 1
              i32.store
              local.get 1
              br_if 0 (;@5;)
              local.get 0
              i32.const 12
              i32.const 4
              call $__rust_dealloc
            end
            local.get 2
            i32.const 124
            i32.add
            local.get 2
            i32.load offset=116
            local.get 2
            i32.load offset=120
            local.get 2
            i32.load offset=112
            i32.load offset=16
            call_indirect (type 0)
            local.get 0
            local.get 0
            i32.load
            i32.const -1
            i32.add
            local.tee 1
            i32.store
            block  ;; label = @5
              local.get 1
              br_if 0 (;@5;)
              local.get 0
              i32.const 4
              i32.add
              local.tee 1
              local.get 1
              i32.load
              i32.const -1
              i32.add
              local.tee 1
              i32.store
              local.get 1
              br_if 0 (;@5;)
              local.get 0
              i32.const 12
              i32.const 4
              call $__rust_dealloc
            end
            local.get 2
            i32.const 240
            i32.add
            global.set $__stack_pointer
            return
          end
          i32.const 1049924
          call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
          unreachable
        end
        local.get 2
        i32.const 2
        i32.store offset=140
        local.get 2
        i32.const 1049196
        i32.store offset=136
        local.get 2
        i64.const 2
        i64.store offset=148 align=4
        local.get 2
        i32.const 1
        i64.extend_i32_u
        i64.const 32
        i64.shl
        local.tee 4
        local.get 2
        i32.const 112
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=88
        local.get 2
        local.get 4
        local.get 2
        i32.const 200
        i32.add
        i64.extend_i32_u
        i64.or
        i64.store offset=80
        local.get 2
        local.get 2
        i32.const 80
        i32.add
        i32.store offset=144
        local.get 2
        i32.const 136
        i32.add
        i32.const 1049212
        call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
        unreachable
      end
      unreachable
      unreachable
    end
    i32.const 1048720
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN5erc2016erc20_dispatcher18transferFromCaller17h03cbb7fc36e0b02dE (type 4) (param i32 i32)
    (local i32 i32 i32 i64 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 272
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 0
    i32.store offset=24
    local.get 2
    local.get 1
    i64.load align=4
    i64.store offset=8
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 8
    i32.add
    i32.const 0
    i32.const 32
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 180
    i32.add
    local.get 2
    i32.const 128
    i32.add
    call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
    local.get 2
    i32.const 208
    i32.add
    local.tee 4
    local.get 3
    i64.load
    local.tee 5
    i64.store align=4
    local.get 2
    i32.const 56
    i32.add
    i32.const 16
    i32.add
    local.tee 6
    i32.const 32
    i32.store
    local.get 2
    i32.const 56
    i32.add
    i32.const 8
    i32.add
    local.tee 7
    local.get 5
    i64.store
    local.get 2
    local.get 2
    i64.load offset=8
    local.tee 5
    i64.store offset=200 align=4
    local.get 2
    i32.const 32
    i32.store offset=216
    local.get 2
    i32.const 32
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 180
    i32.add
    i32.const 16
    i32.add
    local.tee 1
    i32.load
    i32.store
    local.get 2
    i32.const 32
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 180
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    i64.load align=4
    i64.store
    local.get 2
    local.get 5
    i64.store offset=56
    local.get 2
    local.get 2
    i64.load offset=180 align=4
    i64.store offset=32
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 56
    i32.add
    local.get 6
    i32.load
    local.tee 6
    local.get 6
    i32.const 32
    i32.add
    local.tee 6
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 180
    i32.add
    local.get 2
    i32.const 128
    i32.add
    call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
    local.get 4
    local.get 7
    i64.load
    local.tee 5
    i64.store align=4
    local.get 2
    i32.const 104
    i32.add
    i32.const 16
    i32.add
    local.tee 4
    local.get 6
    i32.store
    local.get 2
    i32.const 104
    i32.add
    i32.const 8
    i32.add
    local.tee 7
    local.get 5
    i64.store
    local.get 2
    local.get 2
    i64.load offset=56
    local.tee 5
    i64.store offset=200 align=4
    local.get 2
    local.get 6
    i32.store offset=216
    local.get 2
    i32.const 80
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.load
    i32.store
    local.get 2
    i32.const 80
    i32.add
    i32.const 8
    i32.add
    local.get 3
    i64.load align=4
    i64.store
    local.get 2
    local.get 5
    i64.store offset=104
    local.get 2
    local.get 2
    i64.load offset=180 align=4
    i64.store offset=80
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 104
    i32.add
    local.get 4
    i32.load
    local.tee 6
    local.get 6
    i32.const 32
    i32.add
    local.tee 6
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 180
    i32.add
    local.get 2
    i32.const 128
    i32.add
    call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17he4f1141fa5eb2511E
    local.get 2
    i32.const 220
    i32.add
    local.get 7
    i64.load
    local.tee 5
    i64.store align=4
    local.get 2
    local.get 2
    i64.load offset=104
    local.tee 8
    i64.store offset=212 align=4
    local.get 2
    local.get 6
    i32.store offset=228
    local.get 2
    i32.const 128
    i32.add
    i32.const 24
    i32.add
    local.get 2
    i32.const 180
    i32.add
    i32.const 24
    i32.add
    local.tee 4
    i64.load align=4
    i64.store
    local.get 2
    i32.const 128
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i64.load align=4
    i64.store
    local.get 2
    i32.const 128
    i32.add
    i32.const 8
    i32.add
    local.get 3
    i64.load align=4
    i64.store
    local.get 2
    local.get 2
    i64.load offset=180 align=4
    i64.store offset=128
    local.get 2
    i32.const 160
    i32.add
    i32.const 16
    i32.add
    local.get 6
    i32.store
    local.get 2
    i32.const 160
    i32.add
    i32.const 8
    i32.add
    local.get 5
    i64.store
    local.get 2
    local.get 8
    i64.store offset=160
    local.get 0
    local.get 0
    i32.load
    i32.const 1
    i32.add
    local.tee 3
    i32.store
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 1049408
      i32.store offset=236
      local.get 2
      local.get 0
      i32.store offset=232
      local.get 2
      i32.const 232
      i32.add
      local.get 2
      i32.const 32
      i32.add
      local.get 2
      i32.const 80
      i32.add
      local.get 2
      i32.const 128
      i32.add
      call $_ZN5erc205erc205Erc2013transfer_from17hafd5c8a9b635bbc8E
      local.set 3
      local.get 2
      i32.const 0
      i32.store offset=248
      local.get 2
      i64.const 17179869184
      i64.store offset=240 align=4
      local.get 4
      i64.const 0
      i64.store align=1
      local.get 1
      i64.const 0
      i64.store align=1
      local.get 2
      i32.const 184
      i32.add
      i32.const 0
      i32.store align=1
      local.get 2
      i64.const 0
      i64.store offset=188 align=1
      local.get 2
      i32.const 0
      i32.store offset=181 align=1
      local.get 2
      local.get 3
      i32.const 1
      i32.xor
      i32.store8 offset=180
      local.get 2
      i32.const 252
      i32.add
      local.get 2
      i32.const 180
      i32.add
      call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
      local.get 2
      i32.const 240
      i32.add
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE
      local.get 2
      i32.load offset=244
      local.tee 1
      local.get 2
      i64.load offset=252 align=4
      i64.store align=4
      local.get 1
      i32.const 8
      i32.add
      local.get 2
      i32.const 252
      i32.add
      i32.const 8
      i32.add
      i64.load align=4
      i64.store align=4
      local.get 1
      i32.const 16
      i32.add
      local.get 2
      i32.const 252
      i32.add
      i32.const 16
      i32.add
      i32.load
      i32.store
      local.get 2
      i32.const 1
      i32.store offset=248
      block  ;; label = @2
        local.get 0
        i32.const 8
        i32.add
        i32.load
        br_if 0 (;@2;)
        local.get 0
        i32.const 8
        i32.add
        local.tee 1
        i32.const -1
        i32.store
        local.get 0
        i32.const 12
        i32.add
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        i32.const 180
        i32.add
        local.get 2
        i32.const 240
        i32.add
        call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
        local.get 3
        local.get 2
        i32.load offset=184
        local.tee 6
        local.get 2
        i32.load offset=188
        local.tee 4
        call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
        local.get 2
        i32.const 180
        i32.add
        i32.const 12
        i32.add
        local.get 6
        local.get 4
        local.get 2
        i32.load offset=180
        i32.load offset=16
        call_indirect (type 0)
        local.get 1
        local.get 1
        i32.load
        i32.const 1
        i32.add
        i32.store
        block  ;; label = @3
          local.get 2
          i32.load offset=248
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=244
          local.set 4
          local.get 1
          i32.const 1
          i32.and
          local.set 7
          i32.const 0
          local.set 3
          block  ;; label = @4
            local.get 1
            i32.const 1
            i32.eq
            br_if 0 (;@4;)
            local.get 1
            i32.const -2
            i32.and
            local.set 6
            i32.const 0
            local.set 3
            local.get 4
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 16
              i32.add
              local.get 1
              i32.const 8
              i32.add
              i32.load
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.get 1
              i32.const 4
              i32.add
              i32.load
              i32.load offset=16
              call_indirect (type 0)
              local.get 1
              i32.const 36
              i32.add
              local.get 1
              i32.const 28
              i32.add
              i32.load
              local.get 1
              i32.const 32
              i32.add
              i32.load
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.load offset=16
              call_indirect (type 0)
              local.get 1
              i32.const 40
              i32.add
              local.set 1
              local.get 6
              local.get 3
              i32.const 2
              i32.add
              local.tee 3
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 3
          i32.const 20
          i32.mul
          i32.add
          local.tee 1
          i32.const 16
          i32.add
          local.get 1
          i32.load offset=8
          local.get 1
          i32.load offset=12
          local.get 1
          i32.load offset=4
          i32.load offset=16
          call_indirect (type 0)
        end
        block  ;; label = @3
          local.get 2
          i32.load offset=240
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=244
          local.get 1
          i32.const 20
          i32.mul
          i32.const 4
          call $__rust_dealloc
        end
        local.get 0
        local.get 0
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 1
          local.get 1
          i32.load
          i32.const -1
          i32.add
          local.tee 1
          i32.store
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 2
        i32.const 172
        i32.add
        local.get 2
        i32.load offset=164
        local.get 2
        i32.load offset=168
        local.get 2
        i32.load offset=160
        i32.load offset=16
        call_indirect (type 0)
        local.get 0
        local.get 0
        i32.load
        i32.const -1
        i32.add
        local.tee 1
        i32.store
        block  ;; label = @3
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          local.tee 1
          local.get 1
          i32.load
          i32.const -1
          i32.add
          local.tee 1
          i32.store
          local.get 1
          br_if 0 (;@3;)
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 2
        i32.const 272
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1049940
      call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
      unreachable
    end
    unreachable
    unreachable)
  (func $_ZN5erc2016erc20_dispatcher10mintCaller17h395bb690fc6f5359E (type 4) (param i32 i32)
    (local i32 i32 i64 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 192
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 0
    i32.store offset=16
    local.get 2
    local.get 1
    i64.load align=4
    i64.store
    local.get 2
    i32.const 72
    i32.add
    local.get 2
    i32.const 0
    i32.const 32
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 72
    i32.add
    call $_ZN80_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17hd3dbf47909ef21dbE
    local.get 2
    i32.const 156
    i32.add
    local.get 3
    i64.load
    local.tee 4
    i64.store align=4
    local.get 2
    i32.const 48
    i32.add
    i32.const 16
    i32.add
    local.tee 1
    i32.const 32
    i32.store
    local.get 2
    i32.const 48
    i32.add
    i32.const 8
    i32.add
    local.tee 5
    local.get 4
    i64.store
    local.get 2
    local.get 2
    i64.load
    local.tee 4
    i64.store offset=148 align=4
    local.get 2
    i32.const 32
    i32.store offset=164
    local.get 2
    i32.const 24
    i32.add
    i32.const 16
    i32.add
    local.get 2
    i32.const 128
    i32.add
    i32.const 16
    i32.add
    local.tee 3
    i32.load
    i32.store
    local.get 2
    i32.const 24
    i32.add
    i32.const 8
    i32.add
    local.get 2
    i32.const 128
    i32.add
    i32.const 8
    i32.add
    local.tee 6
    i64.load align=4
    i64.store
    local.get 2
    local.get 4
    i64.store offset=48
    local.get 2
    local.get 2
    i64.load offset=128 align=4
    i64.store offset=24
    local.get 2
    i32.const 72
    i32.add
    local.get 2
    i32.const 48
    i32.add
    local.get 1
    i32.load
    local.tee 1
    local.get 1
    i32.const 32
    i32.add
    local.tee 1
    call $_ZN5bytes5bytes5Bytes5slice17hc102201e918a4f37E
    local.get 2
    i32.const 128
    i32.add
    local.get 2
    i32.const 72
    i32.add
    call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..decoder..Decodable$GT$6decode17he4f1141fa5eb2511E
    local.get 2
    i32.const 168
    i32.add
    local.get 5
    i64.load
    local.tee 4
    i64.store align=4
    local.get 2
    local.get 2
    i64.load offset=48
    local.tee 7
    i64.store offset=160 align=4
    local.get 2
    local.get 1
    i32.store offset=176
    local.get 2
    i32.const 72
    i32.add
    i32.const 24
    i32.add
    local.get 2
    i32.const 128
    i32.add
    i32.const 24
    i32.add
    i64.load align=4
    i64.store
    local.get 2
    i32.const 72
    i32.add
    i32.const 16
    i32.add
    local.get 3
    i64.load align=4
    i64.store
    local.get 2
    i32.const 72
    i32.add
    i32.const 8
    i32.add
    local.get 6
    i64.load align=4
    i64.store
    local.get 2
    local.get 2
    i64.load offset=128 align=4
    i64.store offset=72
    local.get 2
    i32.const 104
    i32.add
    i32.const 16
    i32.add
    local.get 1
    i32.store
    local.get 2
    i32.const 104
    i32.add
    i32.const 8
    i32.add
    local.get 4
    i64.store
    local.get 2
    local.get 7
    i64.store offset=104
    local.get 0
    local.get 0
    i32.load
    i32.const 1
    i32.add
    local.tee 1
    i32.store
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 3
        i32.const 0
        i32.store
        local.get 6
        i64.const 0
        i64.store
        local.get 2
        i64.const 0
        i64.store offset=128
        local.get 2
        i32.const 24
        i32.add
        local.get 2
        i32.const 128
        i32.add
        call $_ZN69_$LT$erc20..unsigned..Unsigned$LT$_$GT$$u20$as$u20$core..cmp..Ord$GT$3cmp17h15702511ba31df5aE
        i32.const 255
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 2
        i32.const 144
        i32.add
        i32.const 0
        i32.store
        local.get 2
        i32.const 128
        i32.add
        i32.const 8
        i32.add
        i64.const 0
        i64.store
        local.get 2
        i64.const 0
        i64.store offset=128
        local.get 0
        i32.const 1049408
        local.get 2
        i32.const 128
        i32.add
        local.get 2
        i32.const 24
        i32.add
        local.get 2
        i32.const 72
        i32.add
        call $_ZN5erc205erc205Erc207_update17he4e974dae5007c46E.llvm.12425491971175694154
        local.get 2
        i32.const 0
        i32.store offset=188
        local.get 2
        i64.const 17179869184
        i64.store offset=180 align=4
        block  ;; label = @3
          local.get 0
          i32.const 8
          i32.add
          local.tee 1
          i32.load
          br_if 0 (;@3;)
          local.get 1
          i32.const -1
          i32.store
          local.get 0
          i32.const 12
          i32.add
          local.tee 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 128
          i32.add
          local.get 2
          i32.const 180
          i32.add
          call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
          local.get 1
          local.get 2
          i32.load offset=132
          local.tee 3
          local.get 2
          i32.load offset=136
          local.tee 6
          call $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE
          local.get 2
          i32.const 128
          i32.add
          i32.const 12
          i32.add
          local.get 3
          local.get 6
          local.get 2
          i32.load offset=128
          i32.load offset=16
          call_indirect (type 0)
          local.get 0
          i32.const 8
          i32.add
          local.tee 1
          local.get 1
          i32.load
          i32.const 1
          i32.add
          i32.store
          local.get 0
          local.get 0
          i32.load
          i32.const -1
          i32.add
          local.tee 1
          i32.store
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            local.get 0
            i32.const 4
            i32.add
            local.tee 1
            local.get 1
            i32.load
            i32.const -1
            i32.add
            local.tee 1
            i32.store
            local.get 1
            br_if 0 (;@4;)
            local.get 0
            i32.const 12
            i32.const 4
            call $__rust_dealloc
          end
          local.get 2
          i32.const 116
          i32.add
          local.get 2
          i32.load offset=108
          local.get 2
          i32.load offset=112
          local.get 2
          i32.load offset=104
          i32.load offset=16
          call_indirect (type 0)
          local.get 0
          local.get 0
          i32.load
          i32.const -1
          i32.add
          local.tee 1
          i32.store
          block  ;; label = @4
            local.get 1
            br_if 0 (;@4;)
            local.get 0
            i32.const 4
            i32.add
            local.tee 1
            local.get 1
            i32.load
            i32.const -1
            i32.add
            local.tee 1
            i32.store
            local.get 1
            br_if 0 (;@4;)
            local.get 0
            i32.const 12
            i32.const 4
            call $__rust_dealloc
          end
          local.get 2
          i32.const 192
          i32.add
          global.set $__stack_pointer
          return
        end
        i32.const 1049956
        call $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E
        unreachable
      end
      unreachable
      unreachable
    end
    i32.const 1048802
    i32.const 12
    call $_ZN5erc2010assertions4fail17had502d4821c562c7E
    unreachable)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1271070e2ca826daE.1 (type 6) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h85fc646d908d0c7bE
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hd504c8c64d2f0cadE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h3be2bf5a24d84447E)
  (func $_ZN5alloc7raw_vec11finish_grow17h2fff62103bacea47E (type 2) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1051873
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1051873
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 1
          i32.store offset=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17had0b7eec2723dc7fE (type 1) (param i32)
    (local i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.const 1
      i32.add
      local.tee 3
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    i32.const 4
    local.set 4
    local.get 2
    i32.const 1
    i32.shl
    local.tee 5
    local.get 3
    local.get 5
    local.get 3
    i32.gt_u
    select
    local.tee 3
    i32.const 4
    local.get 3
    i32.const 4
    i32.gt_u
    select
    local.tee 6
    i32.const 20
    i32.mul
    local.set 5
    local.get 3
    i32.const 107374183
    i32.lt_u
    i32.const 2
    i32.shl
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.const 20
      i32.mul
      i32.store offset=28
      local.get 1
      local.get 0
      i32.load offset=4
      i32.store offset=20
    end
    local.get 1
    local.get 4
    i32.store offset=24
    local.get 1
    i32.const 8
    i32.add
    local.get 3
    local.get 5
    local.get 1
    i32.const 20
    i32.add
    call $_ZN5alloc7raw_vec11finish_grow17h2fff62103bacea47E
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=16
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 6
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN69_$LT$erc20..address..Address$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h8008c8716bd1bbd7E (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.load8_u offset=19
    local.set 3
    local.get 1
    i32.load8_u offset=18
    local.set 4
    local.get 1
    i32.load8_u offset=17
    local.set 5
    local.get 1
    i32.load8_u offset=16
    local.set 6
    local.get 1
    i32.load8_u offset=15
    local.set 7
    local.get 1
    i32.load8_u offset=14
    local.set 8
    local.get 1
    i32.load8_u offset=13
    local.set 9
    local.get 1
    i32.load8_u offset=12
    local.set 10
    local.get 1
    i32.load8_u offset=11
    local.set 11
    local.get 1
    i32.load offset=7 align=1
    local.set 12
    local.get 1
    i32.load offset=3 align=1
    local.set 13
    local.get 1
    i32.load8_u offset=2
    local.set 14
    local.get 1
    i32.load8_u offset=1
    local.set 15
    local.get 1
    i32.load8_u
    local.set 1
    local.get 2
    i32.const 8
    i32.add
    i32.const 0
    i32.store
    local.get 2
    i64.const 0
    i64.store
    local.get 2
    local.get 1
    i32.store8 offset=31
    local.get 2
    local.get 15
    i32.store8 offset=30
    local.get 2
    local.get 14
    i32.store8 offset=29
    local.get 2
    local.get 13
    i32.store8 offset=28
    local.get 2
    local.get 13
    i32.const 8
    i32.shr_u
    i32.store8 offset=27
    local.get 2
    local.get 13
    i32.const 16
    i32.shr_u
    i32.store8 offset=26
    local.get 2
    local.get 13
    i32.const 24
    i32.shr_u
    i32.store8 offset=25
    local.get 2
    local.get 12
    i32.store8 offset=24
    local.get 2
    local.get 12
    i32.const 8
    i32.shr_u
    i32.store8 offset=23
    local.get 2
    local.get 12
    i32.const 16
    i32.shr_u
    i32.store8 offset=22
    local.get 2
    local.get 12
    i32.const 24
    i32.shr_u
    i32.store8 offset=21
    local.get 2
    local.get 11
    i32.store8 offset=20
    local.get 2
    local.get 10
    i32.store8 offset=19
    local.get 2
    local.get 9
    i32.store8 offset=18
    local.get 2
    local.get 8
    i32.store8 offset=17
    local.get 2
    local.get 7
    i32.store8 offset=16
    local.get 2
    local.get 6
    i32.store8 offset=15
    local.get 2
    local.get 5
    i32.store8 offset=14
    local.get 2
    local.get 4
    i32.store8 offset=13
    local.get 2
    local.get 3
    i32.store8 offset=12
    local.get 0
    i32.const 4
    i32.add
    local.get 2
    i32.const 32
    call $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E
    local.get 0
    i32.const 1
    i32.store8
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN5erc2010assertions4fail17had502d4821c562c7E (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN5erc203ulm5impl_11failWrapper17hdd9e7a10bdd4c1a0E.llvm.7654405709671502149
    unreachable)
  (func $_ZN5erc203ulm5impl_11failWrapper17hdd9e7a10bdd4c1a0E.llvm.7654405709671502149 (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $fail
    unreachable)
  (func $_ZN69_$LT$erc20..balance..Balance$u20$as$u20$erc20..encoder..Encodable$GT$6encode17hede0d9f51024b58fE (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E)
  (func $_ZN67_$LT$alloc..string..String$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h1e4106a43390e251E (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i64 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 1
    i32.load offset=4
    local.set 3
    i32.const 1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load offset=8
              local.tee 1
              i32.const 31
              i32.add
              i32.const -32
              i32.and
              local.tee 5
              i32.const 32
              i32.add
              local.tee 6
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 7
              local.get 6
              i32.const 0
              i32.lt_s
              br_if 1 (;@4;)
              i32.const 0
              i32.load8_u offset=1051873
              drop
              i32.const 1
              local.set 7
              local.get 6
              i32.const 1
              call $__rust_alloc
              local.tee 4
              i32.eqz
              br_if 1 (;@4;)
            end
            i32.const 0
            local.set 8
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 2
            local.get 4
            i32.store offset=8
            local.get 2
            local.get 6
            i32.store offset=16
            local.get 2
            i32.const 32
            local.get 6
            i32.const 10
            i32.shr_u
            i32.clz
            i32.sub
            local.tee 7
            i32.const 7
            local.get 7
            i32.const 7
            i32.lt_u
            select
            i32.const 2
            i32.shl
            i32.const 1
            i32.or
            i32.store offset=20
            local.get 2
            i32.const 60
            i32.add
            i32.const 24
            i32.add
            i64.const 0
            i64.store align=1
            local.get 2
            i32.const 60
            i32.add
            i32.const 16
            i32.add
            i64.const 0
            i64.store align=1
            local.get 2
            i64.const 0
            i64.store offset=68 align=1
            local.get 2
            i32.const 0
            i32.store offset=64 align=1
            local.get 2
            local.get 1
            i32.store8 offset=60
            local.get 2
            local.get 1
            i32.const 24
            i32.shr_u
            i32.store8 offset=63
            local.get 2
            local.get 1
            i32.const 16
            i32.shr_u
            i32.store8 offset=62
            local.get 2
            local.get 1
            i32.const 8
            i32.shr_u
            i32.store8 offset=61
            local.get 2
            i32.const 40
            i32.add
            local.get 2
            i32.const 60
            i32.add
            call $_ZN87_$LT$erc20..unsigned..Unsigned$LT$32_usize$GT$$u20$as$u20$erc20..encoder..Encodable$GT$6encode17h771b7c6d703e2f36E
            local.get 2
            i32.const 24
            i32.add
            i32.const 8
            i32.add
            local.get 2
            i32.const 40
            i32.add
            i32.const 12
            i32.add
            i64.load align=4
            local.tee 9
            i64.store
            local.get 2
            local.get 2
            i64.load offset=44 align=4
            i64.store offset=24
            local.get 2
            i32.load offset=28
            local.set 10
            block  ;; label = @5
              local.get 9
              i32.wrap_i64
              local.tee 7
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 6
                local.get 7
                i32.ge_u
                br_if 0 (;@6;)
                local.get 2
                i32.const 8
                i32.add
                local.get 7
                i32.const 1
                call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
                drop
                local.get 2
                i32.load offset=8
                local.set 4
                local.get 2
                i32.load offset=12
                local.set 8
              end
              local.get 4
              local.get 8
              i32.add
              local.get 10
              local.get 7
              call $memcpy
              drop
              local.get 2
              i32.load offset=16
              local.get 2
              i32.load offset=12
              local.tee 4
              i32.sub
              local.tee 8
              local.get 7
              i32.lt_u
              br_if 2 (;@3;)
              local.get 2
              i32.const 0
              i32.store offset=32
              local.get 2
              local.get 4
              local.get 7
              i32.add
              i32.store offset=12
              local.get 2
              local.get 10
              local.get 7
              i32.add
              local.tee 10
              i32.store offset=28
            end
            local.get 2
            i32.const 24
            i32.add
            i32.const 12
            i32.add
            local.get 10
            i32.const 0
            local.get 2
            i32.load offset=24
            i32.load offset=16
            call_indirect (type 0)
            local.get 2
            i32.load offset=12
            local.set 7
            block  ;; label = @5
              local.get 1
              i32.eqz
              br_if 0 (;@5;)
              block  ;; label = @6
                local.get 2
                i32.load offset=16
                local.get 7
                i32.sub
                local.get 1
                i32.ge_u
                br_if 0 (;@6;)
                local.get 2
                i32.const 8
                i32.add
                local.get 1
                i32.const 1
                call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
                drop
                local.get 2
                i32.load offset=12
                local.set 7
              end
              local.get 2
              i32.load offset=8
              local.get 7
              i32.add
              local.get 3
              local.get 1
              call $memcpy
              drop
              local.get 2
              i32.load offset=16
              local.get 2
              i32.load offset=12
              local.tee 7
              i32.sub
              local.tee 10
              local.get 1
              i32.lt_u
              br_if 3 (;@2;)
              local.get 2
              local.get 7
              local.get 1
              i32.add
              local.tee 7
              i32.store offset=12
            end
            block  ;; label = @5
              local.get 7
              local.get 6
              i32.ge_u
              br_if 0 (;@5;)
              local.get 7
              local.get 5
              i32.sub
              i32.const -32
              i32.add
              local.set 1
              loop  ;; label = @6
                local.get 2
                i32.const 0
                i32.store8 offset=60
                local.get 2
                i32.const 8
                i32.add
                local.get 2
                i32.const 60
                i32.add
                i32.const 1
                call $_ZN74_$LT$bytes..bytes_mut..BytesMut$u20$as$u20$bytes..buf..buf_mut..BufMut$GT$9put_slice17h0e2daf131143dac5E
                local.get 1
                i32.const 1
                i32.add
                local.tee 1
                br_if 0 (;@6;)
              end
              local.get 2
              i32.load offset=12
              local.set 7
            end
            local.get 2
            i32.load offset=8
            local.set 1
            i32.const 1050872
            local.set 10
            block  ;; label = @5
              local.get 2
              i32.load offset=20
              local.tee 6
              i32.const 1
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 2
              i32.const 92
              i32.add
              local.get 1
              local.get 7
              local.get 2
              i32.load offset=16
              local.get 6
              i32.const 5
              i32.shr_u
              local.tee 6
              call $_ZN5bytes9bytes_mut11rebuild_vec17h38cce237df47590bE
              local.get 2
              i32.const 104
              i32.add
              local.get 2
              i32.const 92
              i32.add
              call $_ZN92_$LT$bytes..bytes..Bytes$u20$as$u20$core..convert..From$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$4from17h73298beb60a3c1fbE
              local.get 2
              local.get 6
              i32.store offset=120
              local.get 2
              i32.load offset=112
              local.tee 7
              local.get 6
              i32.lt_u
              br_if 4 (;@1;)
              local.get 2
              i32.load offset=108
              local.get 6
              i32.add
              local.set 1
              local.get 7
              local.get 6
              i32.sub
              local.set 7
              local.get 2
              i32.load offset=104
              local.set 10
              local.get 2
              i32.load offset=116
              local.set 6
            end
            local.get 0
            local.get 6
            i32.store offset=16
            local.get 0
            local.get 7
            i32.store offset=12
            local.get 0
            local.get 1
            i32.store offset=8
            local.get 0
            local.get 10
            i32.store offset=4
            local.get 0
            i32.const 2
            i32.store8
            local.get 2
            i32.const 128
            i32.add
            global.set $__stack_pointer
            return
          end
          local.get 7
          local.get 6
          call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
          unreachable
        end
        local.get 7
        local.get 8
        call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
        unreachable
      end
      local.get 1
      local.get 10
      call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
      unreachable
    end
    local.get 2
    i32.const 2
    i32.store offset=64
    local.get 2
    i32.const 1050012
    i32.store offset=60
    local.get 2
    i64.const 2
    i64.store offset=72 align=4
    local.get 2
    local.get 7
    i32.store offset=124
    local.get 2
    i32.const 16
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 9
    local.get 2
    i32.const 124
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 2
    local.get 9
    local.get 2
    i32.const 120
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    local.get 2
    i32.const 40
    i32.add
    i32.store offset=68
    local.get 2
    i32.const 60
    i32.add
    i32.const 1050120
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN5erc207storage42SingleChunkStorageBuilder$LT$ValueType$GT$5build17hf8294c03859672afE (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    call $_ZN5erc207encoder7Encoder6encode17h28cb4a953873a097E
    block  ;; label = @1
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=16
      local.tee 3
      i32.load offset=8
      local.tee 4
      i32.const 4
      local.get 4
      i32.const 4
      i32.gt_u
      select
      i32.const -1
      i32.add
      i32.const -8
      i32.and
      i32.add
      i32.const 8
      i32.add
      local.tee 5
      i32.load
      local.tee 6
      i32.const 2147483646
      i32.gt_u
      br_if 0 (;@1;)
      local.get 5
      local.get 6
      i32.const 1
      i32.add
      i32.store
      local.get 5
      local.get 4
      i32.const -1
      i32.add
      i32.const -4
      i32.and
      i32.add
      i32.const 4
      i32.add
      local.tee 7
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.const 40
      i32.add
      i32.load
      local.set 3
      local.get 2
      i32.load offset=8
      local.set 4
      local.get 2
      i32.load offset=4
      local.set 6
      local.get 2
      i32.const 16
      i32.add
      i32.const 24
      i32.add
      local.tee 8
      i64.const 0
      i64.store
      local.get 2
      i32.const 16
      i32.add
      i32.const 16
      i32.add
      local.tee 9
      i64.const 0
      i64.store
      local.get 2
      i32.const 24
      i32.add
      local.tee 10
      i64.const 0
      i64.store
      local.get 2
      i64.const 0
      i64.store offset=16
      local.get 7
      local.get 6
      local.get 4
      local.get 2
      i32.const 16
      i32.add
      local.get 3
      call_indirect (type 2)
      local.get 0
      i32.const 32
      i32.add
      local.get 8
      i64.load
      i64.store align=1
      local.get 0
      i32.const 24
      i32.add
      local.get 9
      i64.load
      i64.store align=1
      local.get 0
      i32.const 16
      i32.add
      local.get 10
      i64.load
      i64.store align=1
      local.get 0
      local.get 2
      i64.load offset=16
      i64.store offset=8 align=1
      local.get 5
      local.get 5
      i32.load
      i32.const -1
      i32.add
      i32.store
      local.get 0
      local.get 1
      i64.load offset=12 align=4
      i64.store align=4
      local.get 2
      i32.const 12
      i32.add
      local.get 6
      local.get 4
      local.get 2
      i32.load
      i32.load offset=16
      call_indirect (type 0)
      local.get 1
      i32.load offset=4
      local.set 6
      block  ;; label = @2
        local.get 1
        i32.load offset=8
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.const 1
        i32.and
        local.set 3
        i32.const 0
        local.set 5
        block  ;; label = @3
          local.get 0
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 0
          i32.const -2
          i32.and
          local.set 4
          i32.const 0
          local.set 5
          local.get 6
          local.set 0
          loop  ;; label = @4
            local.get 0
            i32.const 16
            i32.add
            local.get 0
            i32.const 8
            i32.add
            i32.load
            local.get 0
            i32.const 12
            i32.add
            i32.load
            local.get 0
            i32.const 4
            i32.add
            i32.load
            i32.load offset=16
            call_indirect (type 0)
            local.get 0
            i32.const 36
            i32.add
            local.get 0
            i32.const 28
            i32.add
            i32.load
            local.get 0
            i32.const 32
            i32.add
            i32.load
            local.get 0
            i32.const 24
            i32.add
            i32.load
            i32.load offset=16
            call_indirect (type 0)
            local.get 0
            i32.const 40
            i32.add
            local.set 0
            local.get 4
            local.get 5
            i32.const 2
            i32.add
            local.tee 5
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 5
        i32.const 20
        i32.mul
        i32.add
        local.tee 0
        i32.const 16
        i32.add
        local.get 0
        i32.load offset=8
        local.get 0
        i32.load offset=12
        local.get 0
        i32.load offset=4
        i32.load offset=16
        call_indirect (type 0)
      end
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        local.get 0
        i32.const 20
        i32.mul
        i32.const 4
        call $__rust_dealloc
      end
      local.get 2
      i32.const 48
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050184
    call $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E
    unreachable)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$4log317h987612607e9e3762E (type 3) (param i32 i32 i32 i32 i32 i32)
    local.get 1
    local.get 2
    local.get 3
    local.get 4
    local.get 5
    call $Log3)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$6caller17h6e5bbf9110a580a2E (type 4) (param i32 i32)
    local.get 1
    call $Caller)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$16call_data_length17h5a8338a3b18df8f2E (type 10) (param i32) (result i32)
    call $CallDataLength)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$9call_data17hde8d81abbe4336aeE (type 0) (param i32 i32 i32)
    block  ;; label = @1
      call $CallDataLength
      local.get 2
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      call $CallData
      return
    end
    i32.const 1050200
    i32.const 28
    call $_ZN5erc203ulm5impl_11failWrapper17hdd9e7a10bdd4c1a0E.llvm.7654405709671502149
    unreachable)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$19get_account_storage17h6b89d1f69d088ff9E (type 0) (param i32 i32 i32)
    local.get 1
    local.get 2
    call $GetAccountStorage)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$19set_account_storage17ha7c75946c5f297f3E (type 0) (param i32 i32 i32)
    local.get 1
    local.get 2
    call $SetAccountStorage)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE (type 0) (param i32 i32 i32)
    local.get 1
    local.get 2
    call $setOutput)
  (func $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE (type 2) (param i32 i32 i32 i32)
    local.get 1
    local.get 2
    local.get 3
    call $keccakHash)
  (func $__rust_alloc (type 6) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    call $__rdl_alloc
    local.set 2
    local.get 2
    return)
  (func $__rust_dealloc (type 0) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $__rdl_dealloc
    return)
  (func $__rust_realloc (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $__rdl_realloc
    local.set 4
    local.get 4
    return)
  (func $__rust_alloc_error_handler (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $__rg_oom
    return)
  (func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1271070e2ca826daE.2 (type 6) (param i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load offset=28
      local.tee 2
      i32.const 16
      i32.and
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 2
        i32.const 32
        i32.and
        br_if 0 (;@2;)
        local.get 0
        local.get 1
        call $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h85fc646d908d0c7bE
        return
      end
      local.get 0
      local.get 1
      call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hd504c8c64d2f0cadE
      return
    end
    local.get 0
    local.get 1
    call $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h3be2bf5a24d84447E)
  (func $_ZN4core3ptr53drop_in_place$LT$core..alloc..layout..LayoutError$GT$17h61bb72a6737affc4E (type 1) (param i32))
  (func $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h2fd7406d7dcae69dE (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.const 1050228
    i32.const 11
    call $_ZN4core3fmt9Formatter9write_str17hb14ec2e1267025f3E)
  (func $_ZN5bytes5bytes5Bytes15copy_from_slice17h1057999830275559E (type 0) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 1050240
          local.set 3
          i32.const 0
          local.set 1
          i32.const 1
          local.set 4
          br 1 (;@2;)
        end
        i32.const 0
        local.set 3
        local.get 2
        i32.const 0
        i32.lt_s
        br_if 1 (;@1;)
        i32.const 0
        i32.load8_u offset=1051873
        drop
        i32.const 1
        local.set 3
        local.get 2
        i32.const 1
        call $__rust_alloc
        local.tee 4
        i32.eqz
        br_if 1 (;@1;)
        i32.const 1050432
        local.set 3
        block  ;; label = @3
          local.get 4
          local.get 1
          local.get 2
          call $memcpy
          local.tee 1
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 1
          local.set 1
          br 1 (;@2;)
        end
        local.get 1
        i32.const 1
        i32.or
        local.set 1
        i32.const 1050412
        local.set 3
      end
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 2
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 3
      i32.store
      return
    end
    local.get 3
    local.get 2
    call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
    unreachable)
  (func $_ZN5bytes5bytes5Bytes9split_off17h8fb60c9956121d47E (type 0) (param i32 i32 i32)
    (local i32 i32 i64)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 2
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=8
          local.tee 4
          local.get 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          br_if 1 (;@2;)
          local.get 1
          i64.load align=4
          local.set 5
          local.get 1
          i32.const 1050240
          i32.store
          local.get 0
          local.get 5
          i64.store align=4
          local.get 1
          i32.const 8
          i32.add
          local.tee 2
          i64.load align=4
          local.set 5
          local.get 2
          i64.const 0
          i64.store align=4
          local.get 0
          i32.const 8
          i32.add
          local.get 5
          i64.store align=4
          br 2 (;@1;)
        end
        local.get 0
        i64.const 0
        i64.store offset=8 align=4
        local.get 0
        i32.const 1050240
        i32.store
        local.get 0
        local.get 1
        i32.load offset=4
        local.get 2
        i32.add
        i32.store offset=4
        br 1 (;@1;)
      end
      block  ;; label = @2
        local.get 4
        local.get 2
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 16
        i32.add
        local.get 1
        i32.const 12
        i32.add
        local.get 1
        i32.load offset=4
        local.get 4
        local.get 1
        i32.load
        i32.load
        call_indirect (type 2)
        local.get 3
        i32.const 16
        i32.add
        i32.const 8
        i32.add
        local.tee 4
        local.get 4
        i32.load
        local.get 2
        i32.sub
        i32.store
        local.get 1
        local.get 2
        i32.store offset=8
        local.get 3
        local.get 3
        i32.load offset=20
        local.get 2
        i32.add
        i32.store offset=20
        local.get 0
        local.get 3
        i64.load offset=16 align=4
        i64.store align=4
        local.get 0
        i32.const 8
        i32.add
        local.get 4
        i64.load align=4
        i64.store align=4
        br 1 (;@1;)
      end
      local.get 3
      i32.const 2
      i32.store offset=20
      local.get 3
      i32.const 1050380
      i32.store offset=16
      local.get 3
      i64.const 2
      i64.store offset=28 align=4
      local.get 3
      local.get 4
      i32.store offset=60
      local.get 3
      i32.const 17
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.tee 5
      local.get 3
      i32.const 60
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=48
      local.get 3
      local.get 5
      local.get 3
      i32.const 12
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=40
      local.get 3
      local.get 3
      i32.const 40
      i32.add
      i32.store offset=24
      local.get 3
      i32.const 16
      i32.add
      i32.const 1050396
      call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
      unreachable
    end
    local.get 3
    i32.const 64
    i32.add
    global.set $__stack_pointer)
  (func $_ZN60_$LT$bytes..bytes..Bytes$u20$as$u20$core..cmp..PartialEq$GT$2eq17h84023c79558e6ca9E (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 3
      local.get 1
      i32.load offset=8
      i32.ne
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.load offset=4
      local.get 3
      call $memcmp
      i32.eqz
      local.set 2
    end
    local.get 2)
  (func $_ZN92_$LT$bytes..bytes..Bytes$u20$as$u20$core..convert..From$LT$alloc..vec..Vec$LT$u8$GT$$GT$$GT$4from17h73298beb60a3c1fbE (type 4) (param i32 i32)
    (local i32 i32 i32)
    local.get 1
    i32.load offset=4
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load offset=8
          local.tee 3
          local.get 1
          i32.load
          local.tee 4
          i32.eq
          br_if 0 (;@3;)
          i32.const 0
          i32.load8_u offset=1051873
          drop
          i32.const 12
          i32.const 4
          call $__rust_alloc
          local.tee 1
          i32.eqz
          br_if 2 (;@1;)
          local.get 1
          i32.const 1
          i32.store offset=8
          local.get 1
          local.get 4
          i32.store offset=4
          local.get 1
          local.get 2
          i32.store
          i32.const 1050544
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 1050240
          local.set 4
          i32.const 0
          local.set 1
          i32.const 1
          local.set 2
          br 1 (;@2;)
        end
        i32.const 1050432
        local.set 4
        block  ;; label = @3
          local.get 2
          i32.const 1
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          local.set 1
          br 1 (;@2;)
        end
        local.get 2
        i32.const 1
        i32.or
        local.set 1
        i32.const 1050412
        local.set 4
      end
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store
      return
    end
    i32.const 4
    i32.const 12
    call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
    unreachable)
  (func $_ZN5bytes5bytes12static_clone17h8ee0bb07f5e580ccE.llvm.5932322697774810047 (type 2) (param i32 i32 i32 i32)
    local.get 0
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    i32.const 1050240
    i32.store)
  (func $_ZN5bytes5bytes13static_to_mut17h581aa0a2fd8464aeE (type 2) (param i32 i32 i32 i32)
    (local i32 i32)
    i32.const 1
    local.set 4
    block  ;; label = @1
      local.get 3
      i32.eqz
      br_if 0 (;@1;)
      i32.const 0
      local.set 5
      block  ;; label = @2
        local.get 3
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.load8_u offset=1051873
        drop
        i32.const 1
        local.set 5
        local.get 3
        i32.const 1
        call $__rust_alloc
        local.tee 4
        br_if 1 (;@1;)
      end
      local.get 5
      local.get 3
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 4
    local.get 2
    local.get 3
    call $memcpy
    local.set 4
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 4
    i32.store
    local.get 0
    i32.const 32
    local.get 3
    i32.const 10
    i32.shr_u
    i32.clz
    i32.sub
    local.tee 3
    i32.const 7
    local.get 3
    i32.const 7
    i32.lt_u
    select
    i32.const 2
    i32.shl
    i32.const 1
    i32.or
    i32.store offset=12)
  (func $_ZN5bytes5bytes16static_is_unique17h6e19e52823949186E.llvm.5932322697774810047 (type 10) (param i32) (result i32)
    i32.const 0)
  (func $_ZN5bytes5bytes11static_drop17h80d4e6ae9b05ca89E.llvm.5932322697774810047 (type 0) (param i32 i32 i32))
  (func $_ZN5bytes5bytes12owned_to_vec17hf4b7c7dcc83df6d0E (type 2) (param i32 i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        i32.const 1
        local.set 4
        br 1 (;@1;)
      end
      i32.const 0
      local.set 5
      block  ;; label = @2
        local.get 3
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.load8_u offset=1051873
        drop
        i32.const 1
        local.set 5
        local.get 3
        i32.const 1
        call $__rust_alloc
        local.tee 4
        br_if 1 (;@1;)
      end
      local.get 5
      local.get 3
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 4
    local.get 2
    local.get 3
    call $memcpy
    local.set 2
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store)
  (func $_ZN5bytes5bytes21promotable_even_clone17hb745a8cb1d939a17E (type 2) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 4
      local.get 4
      i32.const -2
      i32.and
      local.get 2
      local.get 3
      call $_ZN5bytes5bytes17shallow_clone_vec17h25a558d5835acdf3E
      return
    end
    local.get 4
    local.get 4
    i32.load offset=8
    local.tee 1
    i32.const 1
    i32.add
    i32.store offset=8
    block  ;; label = @1
      local.get 1
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 0
      i32.const 1050544
      i32.store
      return
    end
    call $_ZN5bytes5abort17h7847ceaeaab8ab15E
    unreachable)
  (func $_ZN5bytes5bytes17shallow_clone_vec17h25a558d5835acdf3E (type 3) (param i32 i32 i32 i32 i32 i32)
    (local i32)
    i32.const 0
    i32.load8_u offset=1051873
    drop
    block  ;; label = @1
      block  ;; label = @2
        i32.const 12
        i32.const 4
        call $__rust_alloc
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 6
        i32.const 2
        i32.store offset=8
        local.get 6
        local.get 3
        i32.store
        local.get 6
        local.get 4
        local.get 3
        i32.sub
        local.get 5
        i32.add
        i32.store offset=4
        local.get 1
        local.get 6
        local.get 1
        i32.load
        local.tee 3
        local.get 3
        local.get 2
        i32.eq
        select
        i32.store
        block  ;; label = @3
          local.get 3
          local.get 2
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          local.get 6
          i32.store offset=12
          local.get 0
          local.get 5
          i32.store offset=8
          local.get 0
          local.get 4
          i32.store offset=4
          local.get 0
          i32.const 1050544
          i32.store
          return
        end
        local.get 3
        local.get 3
        i32.load offset=8
        local.tee 2
        i32.const 1
        i32.add
        i32.store offset=8
        local.get 2
        i32.const -1
        i32.le_s
        br_if 1 (;@1;)
        local.get 0
        local.get 3
        i32.store offset=12
        local.get 0
        local.get 5
        i32.store offset=8
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        i32.const 1050544
        i32.store
        local.get 6
        i32.const 12
        i32.const 4
        call $__rust_dealloc
        return
      end
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
      unreachable
    end
    call $_ZN5bytes5abort17h7847ceaeaab8ab15E
    unreachable)
  (func $_ZN5bytes5bytes22promotable_even_to_vec17h17500ac060bde60fE (type 2) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 1
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const -2
      i32.and
      local.get 2
      local.get 3
      call $memmove
      local.set 1
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 0
      local.get 2
      local.get 3
      i32.add
      local.get 1
      i32.sub
      i32.store
      return
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_ZN5bytes5bytes18shared_to_vec_impl17hf22b5bcaca60a7b2E)
  (func $_ZN5bytes5bytes18shared_to_vec_impl17hf22b5bcaca60a7b2E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const 1
    local.set 5
    local.get 1
    i32.const 0
    local.get 1
    i32.load offset=8
    local.tee 6
    local.get 6
    i32.const 1
    i32.eq
    select
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 6
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=4
            local.set 6
            local.get 1
            i32.load
            local.set 5
            local.get 1
            i32.const 12
            i32.const 4
            call $__rust_dealloc
            local.get 5
            local.get 2
            local.get 3
            call $memmove
            drop
            br 1 (;@3;)
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 6
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 2 (;@2;)
            i32.const 0
            i32.load8_u offset=1051873
            drop
            i32.const 1
            local.set 6
            local.get 3
            i32.const 1
            call $__rust_alloc
            local.tee 5
            i32.eqz
            br_if 2 (;@2;)
          end
          local.get 5
          local.get 2
          local.get 3
          call $memcpy
          drop
          local.get 1
          local.get 1
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.add
          i32.store offset=8
          local.get 3
          local.set 6
          local.get 2
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 1
          i32.const 4
          i32.add
          i32.load
          local.tee 6
          i32.const -1
          i32.le_s
          br_if 2 (;@1;)
          local.get 1
          i32.load
          local.get 6
          i32.const 1
          call $__rust_dealloc
          local.get 1
          i32.const 12
          i32.const 4
          call $__rust_dealloc
          local.get 3
          local.set 6
        end
        local.get 0
        local.get 3
        i32.store offset=8
        local.get 0
        local.get 5
        i32.store offset=4
        local.get 0
        local.get 6
        i32.store
        local.get 4
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      local.get 6
      local.get 3
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    i32.const 1050452
    i32.const 43
    local.get 4
    i32.const 15
    i32.add
    i32.const 1050496
    i32.const 1050528
    call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
    unreachable)
  (func $_ZN5bytes5bytes22promotable_even_to_mut17h9b26d0f7fc64fa55E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 1
              i32.const 1
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              i32.const 32
              local.get 2
              local.get 1
              i32.const -2
              i32.and
              local.tee 4
              i32.sub
              local.tee 5
              local.get 3
              i32.add
              local.tee 1
              i32.const 10
              i32.shr_u
              i32.clz
              i32.sub
              local.tee 6
              i32.const 7
              local.get 6
              i32.const 7
              i32.lt_u
              select
              i32.const 2
              i32.shl
              i32.const 1
              i32.or
              local.set 6
              block  ;; label = @6
                local.get 2
                local.get 4
                i32.ne
                br_if 0 (;@6;)
                local.get 6
                local.set 2
                local.get 1
                local.set 3
                br 5 (;@1;)
              end
              local.get 5
              i32.const 134217728
              i32.lt_u
              br_if 2 (;@3;)
              i32.const 0
              i32.load8_u offset=1051873
              drop
              i32.const 20
              i32.const 4
              call $__rust_alloc
              local.tee 2
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.const 1
              i32.store offset=16
              local.get 2
              local.get 1
              i32.store offset=8
              local.get 2
              local.get 4
              i32.store offset=4
              local.get 2
              local.get 1
              i32.store
              local.get 2
              local.get 6
              i32.const 2
              i32.shr_u
              i32.const 7
              i32.and
              i32.store offset=12
              br 3 (;@2;)
            end
            local.get 0
            local.get 1
            local.get 2
            local.get 3
            call $_ZN5bytes5bytes18shared_to_mut_impl17h46c5417875d3e9a7E
            return
          end
          i32.const 4
          i32.const 20
          call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
          unreachable
        end
        local.get 5
        i32.const 5
        i32.shl
        local.get 6
        i32.or
        local.set 2
      end
      i32.const 0
      local.get 1
      local.get 5
      i32.sub
      local.tee 6
      local.get 6
      local.get 1
      i32.gt_u
      select
      local.set 1
      local.get 4
      local.get 5
      i32.add
      local.set 4
    end
    local.get 0
    local.get 2
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 1
    i32.store offset=4
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN5bytes5bytes18shared_to_mut_impl17h46c5417875d3e9a7E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 4
    global.set $__stack_pointer
    i32.const 1
    local.set 5
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                i32.load offset=8
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.load
                local.set 5
                local.get 1
                i32.load offset=4
                local.set 6
                local.get 1
                i32.const 12
                i32.const 4
                call $__rust_dealloc
                i32.const 32
                local.get 6
                i32.const 10
                i32.shr_u
                i32.clz
                i32.sub
                local.tee 1
                i32.const 7
                local.get 1
                i32.const 7
                i32.lt_u
                select
                i32.const 2
                i32.shl
                i32.const 1
                i32.or
                local.set 7
                local.get 2
                local.get 5
                i32.sub
                local.tee 8
                local.get 3
                i32.add
                local.set 3
                block  ;; label = @7
                  local.get 2
                  local.get 5
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 2
                  local.set 5
                  local.get 7
                  local.set 1
                  br 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 8
                  i32.const 134217728
                  i32.lt_u
                  br_if 0 (;@7;)
                  i32.const 0
                  i32.load8_u offset=1051873
                  drop
                  i32.const 20
                  i32.const 4
                  call $__rust_alloc
                  local.tee 1
                  i32.eqz
                  br_if 2 (;@5;)
                  local.get 1
                  i32.const 1
                  i32.store offset=16
                  local.get 1
                  local.get 3
                  i32.store offset=8
                  local.get 1
                  local.get 5
                  i32.store offset=4
                  local.get 1
                  local.get 6
                  i32.store
                  local.get 1
                  local.get 7
                  i32.const 2
                  i32.shr_u
                  i32.const 7
                  i32.and
                  i32.store offset=12
                  br 5 (;@2;)
                end
                local.get 8
                i32.const 5
                i32.shl
                local.get 7
                i32.or
                local.set 1
                br 4 (;@2;)
              end
              block  ;; label = @6
                local.get 3
                i32.eqz
                br_if 0 (;@6;)
                i32.const 0
                local.set 6
                local.get 3
                i32.const 0
                i32.lt_s
                br_if 2 (;@4;)
                i32.const 0
                i32.load8_u offset=1051873
                drop
                i32.const 1
                local.set 6
                local.get 3
                i32.const 1
                call $__rust_alloc
                local.tee 5
                i32.eqz
                br_if 2 (;@4;)
              end
              local.get 5
              local.get 2
              local.get 3
              call $memcpy
              drop
              local.get 1
              local.get 1
              i32.load offset=8
              local.tee 6
              i32.const -1
              i32.add
              i32.store offset=8
              block  ;; label = @6
                local.get 6
                i32.const 1
                i32.ne
                br_if 0 (;@6;)
                local.get 1
                i32.const 4
                i32.add
                i32.load
                local.tee 6
                i32.const -1
                i32.le_s
                br_if 3 (;@3;)
                local.get 1
                i32.load
                local.get 6
                i32.const 1
                call $__rust_dealloc
                local.get 1
                i32.const 12
                i32.const 4
                call $__rust_dealloc
              end
              i32.const 32
              local.get 3
              i32.const 10
              i32.shr_u
              i32.clz
              i32.sub
              local.tee 1
              i32.const 7
              local.get 1
              i32.const 7
              i32.lt_u
              select
              i32.const 2
              i32.shl
              i32.const 1
              i32.or
              local.set 1
              local.get 3
              local.set 6
              br 4 (;@1;)
            end
            i32.const 4
            i32.const 20
            call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
            unreachable
          end
          local.get 6
          local.get 3
          call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
          unreachable
        end
        i32.const 1050452
        i32.const 43
        local.get 4
        i32.const 15
        i32.add
        i32.const 1050496
        i32.const 1050528
        call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
        unreachable
      end
      i32.const 0
      local.get 3
      local.get 8
      i32.sub
      local.tee 2
      local.get 2
      local.get 3
      i32.gt_u
      select
      local.set 3
      local.get 6
      local.get 8
      i32.sub
      local.set 6
      local.get 5
      local.get 8
      i32.add
      local.set 5
    end
    local.get 0
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 6
    i32.store offset=8
    local.get 0
    local.get 3
    i32.store offset=4
    local.get 0
    local.get 5
    i32.store
    local.get 4
    i32.const 16
    i32.add
    global.set $__stack_pointer)
  (func $_ZN5bytes5bytes20promotable_even_drop17h1682d63eeecce9a7E (type 0) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            local.tee 0
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 0
            i32.const -2
            i32.and
            local.tee 0
            i32.sub
            local.get 2
            i32.add
            local.tee 2
            i32.const -1
            i32.le_s
            br_if 2 (;@2;)
            local.get 0
            local.get 2
            i32.const 1
            call $__rust_dealloc
            br 1 (;@3;)
          end
          local.get 0
          local.get 0
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.add
          i32.store offset=8
          local.get 2
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.const -1
          i32.le_s
          br_if 2 (;@1;)
          local.get 0
          i32.load
          local.get 2
          i32.const 1
          call $__rust_dealloc
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1050452
      i32.const 43
      local.get 3
      i32.const 15
      i32.add
      i32.const 1050496
      i32.const 1050512
      call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
      unreachable
    end
    i32.const 1050452
    i32.const 43
    local.get 3
    i32.const 15
    i32.add
    i32.const 1050496
    i32.const 1050528
    call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
    unreachable)
  (func $_ZN5bytes5bytes20promotable_odd_clone17hcfb701ad3f082002E (type 2) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 4
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 1
      local.get 4
      local.get 4
      local.get 2
      local.get 3
      call $_ZN5bytes5bytes17shallow_clone_vec17h25a558d5835acdf3E
      return
    end
    local.get 4
    local.get 4
    i32.load offset=8
    local.tee 1
    i32.const 1
    i32.add
    i32.store offset=8
    block  ;; label = @1
      local.get 1
      i32.const -1
      i32.le_s
      br_if 0 (;@1;)
      local.get 0
      local.get 4
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 2
      i32.store offset=4
      local.get 0
      i32.const 1050544
      i32.store
      return
    end
    call $_ZN5bytes5abort17h7847ceaeaab8ab15E
    unreachable)
  (func $_ZN5bytes5bytes21promotable_odd_to_vec17h5d8ea33109cb924cE (type 2) (param i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.load
      local.tee 1
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      local.get 2
      local.get 3
      call $memmove
      local.set 1
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 1
      i32.store offset=4
      local.get 0
      local.get 2
      local.get 3
      i32.add
      local.get 1
      i32.sub
      i32.store
      return
    end
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $_ZN5bytes5bytes18shared_to_vec_impl17hf22b5bcaca60a7b2E)
  (func $_ZN5bytes5bytes21promotable_odd_to_mut17h95bc9587e8fef346E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 1
              i32.const 1
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              i32.const 32
              local.get 2
              local.get 1
              i32.sub
              local.tee 4
              local.get 3
              i32.add
              local.tee 5
              i32.const 10
              i32.shr_u
              i32.clz
              i32.sub
              local.tee 6
              i32.const 7
              local.get 6
              i32.const 7
              i32.lt_u
              select
              i32.const 2
              i32.shl
              i32.const 1
              i32.or
              local.set 7
              block  ;; label = @6
                local.get 2
                local.get 1
                i32.ne
                br_if 0 (;@6;)
                local.get 7
                local.set 6
                local.get 5
                local.set 3
                br 5 (;@1;)
              end
              local.get 4
              i32.const 134217728
              i32.lt_u
              br_if 2 (;@3;)
              i32.const 0
              i32.load8_u offset=1051873
              drop
              i32.const 20
              i32.const 4
              call $__rust_alloc
              local.tee 6
              i32.eqz
              br_if 1 (;@4;)
              local.get 6
              i32.const 1
              i32.store offset=16
              local.get 6
              local.get 5
              i32.store offset=8
              local.get 6
              local.get 1
              i32.store offset=4
              local.get 6
              local.get 5
              i32.store
              local.get 6
              local.get 7
              i32.const 2
              i32.shr_u
              i32.const 7
              i32.and
              i32.store offset=12
              br 3 (;@2;)
            end
            local.get 0
            local.get 1
            local.get 2
            local.get 3
            call $_ZN5bytes5bytes18shared_to_mut_impl17h46c5417875d3e9a7E
            return
          end
          i32.const 4
          i32.const 20
          call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
          unreachable
        end
        local.get 4
        i32.const 5
        i32.shl
        local.get 7
        i32.or
        local.set 6
      end
      i32.const 0
      local.get 5
      local.get 4
      i32.sub
      local.tee 2
      local.get 2
      local.get 5
      i32.gt_u
      select
      local.set 5
      local.get 1
      local.get 4
      i32.add
      local.set 2
    end
    local.get 0
    local.get 6
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 5
    i32.store offset=4
    local.get 0
    local.get 2
    i32.store)
  (func $_ZN5bytes5bytes19promotable_odd_drop17hd9893b9965f4d03eE (type 0) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load
            local.tee 0
            i32.const 1
            i32.and
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            local.get 0
            i32.sub
            local.get 2
            i32.add
            local.tee 2
            i32.const -1
            i32.le_s
            br_if 2 (;@2;)
            local.get 0
            local.get 2
            i32.const 1
            call $__rust_dealloc
            br 1 (;@3;)
          end
          local.get 0
          local.get 0
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.add
          i32.store offset=8
          local.get 2
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          local.get 0
          i32.const 4
          i32.add
          i32.load
          local.tee 2
          i32.const -1
          i32.le_s
          br_if 2 (;@1;)
          local.get 0
          i32.load
          local.get 2
          i32.const 1
          call $__rust_dealloc
          local.get 0
          i32.const 12
          i32.const 4
          call $__rust_dealloc
        end
        local.get 3
        i32.const 16
        i32.add
        global.set $__stack_pointer
        return
      end
      i32.const 1050452
      i32.const 43
      local.get 3
      i32.const 15
      i32.add
      i32.const 1050496
      i32.const 1050512
      call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
      unreachable
    end
    i32.const 1050452
    i32.const 43
    local.get 3
    i32.const 15
    i32.add
    i32.const 1050496
    i32.const 1050528
    call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
    unreachable)
  (func $_ZN5bytes5bytes20promotable_is_unique17h020665ac6bee7cfdE (type 10) (param i32) (result i32)
    (local i32)
    i32.const 1
    local.set 1
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=8
      i32.const 1
      i32.eq
      local.set 1
    end
    local.get 1)
  (func $_ZN5bytes5bytes12shared_clone17h87a7760eba5d0abeE.llvm.5932322697774810047 (type 2) (param i32 i32 i32 i32)
    (local i32)
    local.get 1
    i32.load
    local.tee 1
    local.get 1
    i32.load offset=8
    local.tee 4
    i32.const 1
    i32.add
    i32.store offset=8
    block  ;; label = @1
      local.get 4
      i32.const -1
      i32.gt_s
      br_if 0 (;@1;)
      call $_ZN5bytes5abort17h7847ceaeaab8ab15E
      unreachable
    end
    local.get 0
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    i32.const 1050544
    i32.store)
  (func $_ZN5bytes5bytes13shared_to_vec17hc3c7c24fa33ba490E.llvm.5932322697774810047 (type 2) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.load
    local.get 2
    local.get 3
    call $_ZN5bytes5bytes18shared_to_vec_impl17hf22b5bcaca60a7b2E)
  (func $_ZN5bytes5bytes13shared_to_mut17ha7cdfa5747aa9e90E.llvm.5932322697774810047 (type 2) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.load
    local.get 2
    local.get 3
    call $_ZN5bytes5bytes18shared_to_mut_impl17h46c5417875d3e9a7E)
  (func $_ZN5bytes5bytes16shared_is_unique17h6b20a183193c4d3aE.llvm.5932322697774810047 (type 10) (param i32) (result i32)
    local.get 0
    i32.load
    i32.load offset=8
    i32.const 1
    i32.eq)
  (func $_ZN5bytes5bytes11shared_drop17hf3fb21e2b6b585c5E.llvm.5932322697774810047 (type 0) (param i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 0
    local.get 0
    i32.load offset=8
    local.tee 4
    i32.const -1
    i32.add
    i32.store offset=8
    block  ;; label = @1
      block  ;; label = @2
        local.get 4
        i32.const 1
        i32.ne
        br_if 0 (;@2;)
        local.get 0
        i32.const 4
        i32.add
        i32.load
        local.tee 4
        i32.const -1
        i32.le_s
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.get 4
        i32.const 1
        call $__rust_dealloc
        local.get 0
        i32.const 12
        i32.const 4
        call $__rust_dealloc
      end
      local.get 3
      i32.const 16
      i32.add
      global.set $__stack_pointer
      return
    end
    i32.const 1050452
    i32.const 43
    local.get 3
    i32.const 15
    i32.add
    i32.const 1050496
    i32.const 1050528
    call $_ZN4core6result13unwrap_failed17h4ed86702351a3017E
    unreachable)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h4c8ab8a4ebe78826E.llvm.13498044319351723418 (type 0) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    i32.const 1
    local.set 4
    local.get 0
    i32.load
    local.tee 5
    i32.const 1
    i32.shl
    local.tee 1
    local.get 2
    local.get 1
    local.get 2
    i32.gt_u
    select
    local.tee 1
    i32.const 8
    local.get 1
    i32.const 8
    i32.gt_u
    select
    local.tee 1
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      local.get 5
      i32.store offset=28
      local.get 3
      local.get 0
      i32.load offset=4
      i32.store offset=20
    end
    local.get 3
    local.get 4
    i32.store offset=24
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    local.get 1
    local.get 3
    i32.const 20
    i32.add
    call $_ZN5alloc7raw_vec11finish_grow17hfd8a743f43564090E.llvm.13498044319351723418
    block  ;; label = @1
      local.get 3
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=16
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN5alloc7raw_vec11finish_grow17hfd8a743f43564090E.llvm.13498044319351723418 (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    i32.const 0
    local.set 5
    i32.const 4
    local.set 6
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 0
      i32.lt_s
      br_if 0 (;@1;)
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    i32.const 1
                    local.set 4
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1051873
                  drop
                  local.get 2
                  i32.const 1
                  call $__rust_alloc
                  local.set 4
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                i32.const 1
                local.get 2
                call $__rust_realloc
                local.set 4
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                i32.const 1
                local.set 4
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1051873
              drop
              local.get 2
              i32.const 1
              call $__rust_alloc
              local.set 4
            end
            local.get 4
            i32.eqz
            br_if 1 (;@3;)
          end
          local.get 0
          local.get 4
          i32.store offset=4
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        i32.const 1
        local.set 4
        local.get 0
        i32.const 1
        i32.store offset=4
      end
      i32.const 8
      local.set 6
      local.get 2
      local.set 5
    end
    local.get 0
    local.get 6
    i32.add
    local.get 5
    i32.store
    local.get 0
    local.get 4
    i32.store)
  (func $_ZN5bytes5abort17h7847ceaeaab8ab15E (type 11)
    call $_ZN3std7process5abort17h38dc887bf8ba17f6E
    unreachable)
  (func $_ZN5bytes13panic_advance17heb816a5acb8c23c0E (type 4) (param i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    local.get 1
    i32.store offset=4
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.const 2
    i32.store offset=12
    local.get 2
    i32.const 1050616
    i32.store offset=8
    local.get 2
    i64.const 2
    i64.store offset=20 align=4
    local.get 2
    i32.const 37
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 3
    local.get 2
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 2
    local.get 3
    local.get 2
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 2
    local.get 2
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 2
    i32.const 8
    i32.add
    i32.const 1050720
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 0
    i32.load offset=4
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.load offset=12
                    local.tee 5
                    i32.const 1
                    i32.and
                    br_if 0 (;@8;)
                    local.get 4
                    local.get 1
                    i32.add
                    local.tee 1
                    local.get 4
                    i32.lt_u
                    br_if 3 (;@5;)
                    local.get 5
                    i32.load offset=16
                    i32.const 1
                    i32.eq
                    br_if 2 (;@6;)
                    i32.const 0
                    local.set 6
                    local.get 2
                    i32.eqz
                    br_if 7 (;@1;)
                    i32.const 1
                    local.set 6
                    i32.const 0
                    local.set 7
                    block  ;; label = @9
                      local.get 1
                      i32.const 1
                      local.get 5
                      i32.load offset=12
                      local.tee 2
                      i32.const 9
                      i32.add
                      i32.shl
                      i32.const 0
                      local.get 2
                      select
                      local.tee 4
                      local.get 1
                      local.get 4
                      i32.gt_u
                      select
                      local.tee 4
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 4
                      i32.const 0
                      i32.lt_s
                      br_if 2 (;@7;)
                      i32.const 0
                      i32.load8_u offset=1051873
                      drop
                      i32.const 1
                      local.set 7
                      local.get 4
                      i32.const 1
                      call $__rust_alloc
                      local.tee 6
                      i32.eqz
                      br_if 2 (;@7;)
                    end
                    i32.const 0
                    local.set 1
                    local.get 3
                    i32.const 0
                    i32.store offset=12
                    local.get 3
                    local.get 6
                    i32.store offset=8
                    local.get 3
                    local.get 4
                    i32.store offset=4
                    local.get 0
                    i32.load
                    local.set 8
                    block  ;; label = @9
                      local.get 4
                      local.get 0
                      i32.load offset=4
                      local.tee 7
                      i32.ge_u
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 4
                      i32.add
                      i32.const 0
                      local.get 7
                      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h4c8ab8a4ebe78826E.llvm.13498044319351723418
                      local.get 3
                      i32.load offset=8
                      local.set 6
                      local.get 3
                      i32.load offset=12
                      local.set 1
                    end
                    local.get 6
                    local.get 1
                    i32.add
                    local.get 8
                    local.get 7
                    call $memcpy
                    drop
                    local.get 5
                    local.get 5
                    i32.load offset=16
                    local.tee 4
                    i32.const -1
                    i32.add
                    i32.store offset=16
                    local.get 3
                    local.get 1
                    local.get 7
                    i32.add
                    i32.store offset=12
                    i32.const 1
                    local.set 6
                    block  ;; label = @9
                      local.get 4
                      i32.const 1
                      i32.ne
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        local.get 5
                        i32.load
                        local.tee 4
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 5
                        i32.load offset=4
                        local.get 4
                        i32.const 1
                        call $__rust_dealloc
                      end
                      local.get 5
                      i32.const 20
                      i32.const 4
                      call $__rust_dealloc
                    end
                    local.get 0
                    local.get 3
                    i32.load offset=8
                    i32.store
                    local.get 0
                    local.get 3
                    i32.load offset=4
                    i32.store offset=8
                    local.get 0
                    local.get 2
                    i32.const 2
                    i32.shl
                    i32.const 1
                    i32.or
                    i32.store offset=12
                    br 7 (;@1;)
                  end
                  local.get 0
                  i32.load offset=8
                  local.tee 9
                  local.get 5
                  i32.const 5
                  i32.shr_u
                  local.tee 7
                  i32.add
                  local.set 8
                  block  ;; label = @8
                    local.get 7
                    local.get 4
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 8
                    local.get 4
                    i32.sub
                    local.get 1
                    i32.ge_u
                    br_if 4 (;@4;)
                  end
                  i32.const 0
                  local.set 6
                  local.get 2
                  i32.eqz
                  br_if 6 (;@1;)
                  local.get 3
                  local.get 8
                  i32.store offset=4
                  local.get 3
                  local.get 7
                  local.get 4
                  i32.add
                  local.tee 6
                  i32.store offset=12
                  local.get 3
                  local.get 0
                  i32.load
                  local.get 7
                  i32.sub
                  local.tee 5
                  i32.store offset=8
                  block  ;; label = @8
                    local.get 9
                    local.get 4
                    i32.sub
                    local.get 1
                    i32.ge_u
                    br_if 0 (;@8;)
                    local.get 3
                    i32.const 4
                    i32.add
                    local.get 6
                    local.get 1
                    call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h4c8ab8a4ebe78826E.llvm.13498044319351723418
                    local.get 3
                    i32.load offset=4
                    local.set 8
                    local.get 3
                    i32.load offset=8
                    local.set 5
                  end
                  local.get 0
                  local.get 8
                  local.get 7
                  i32.sub
                  i32.store offset=8
                  local.get 0
                  local.get 5
                  local.get 7
                  i32.add
                  i32.store
                  i32.const 1
                  local.set 6
                  br 6 (;@1;)
                end
                local.get 7
                local.get 4
                call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
                unreachable
              end
              local.get 5
              i32.load
              local.tee 7
              local.get 0
              i32.load
              local.tee 6
              local.get 5
              i32.load offset=4
              local.tee 9
              i32.sub
              local.tee 8
              local.get 1
              i32.add
              local.tee 10
              i32.lt_u
              br_if 3 (;@2;)
              local.get 0
              local.get 1
              i32.store offset=8
              i32.const 1
              local.set 6
              br 4 (;@1;)
            end
            i32.const 0
            local.set 6
            local.get 2
            br_if 1 (;@3;)
            br 3 (;@1;)
          end
          local.get 0
          i32.load
          local.tee 6
          local.get 7
          i32.sub
          local.get 6
          local.get 4
          call $memcpy
          local.set 4
          local.get 0
          local.get 5
          i32.const 31
          i32.and
          i32.store offset=12
          local.get 0
          local.get 4
          i32.store
          local.get 0
          local.get 8
          i32.store offset=8
          i32.const 1
          local.set 6
          br 2 (;@1;)
        end
        i32.const 1050830
        i32.const 8
        i32.const 1050856
        call $_ZN4core9panicking5panic17h3b99507adb69386aE
        unreachable
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 7
            local.get 1
            i32.lt_u
            br_if 0 (;@4;)
            local.get 8
            local.get 4
            i32.ge_u
            br_if 1 (;@3;)
          end
          i32.const 0
          local.set 6
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 10
          local.get 1
          i32.lt_u
          br_if 1 (;@2;)
          local.get 5
          local.get 8
          local.get 4
          i32.add
          local.tee 4
          i32.store offset=8
          i32.const 1
          local.set 6
          block  ;; label = @4
            local.get 7
            local.get 4
            i32.sub
            local.get 7
            i32.const 1
            i32.shl
            local.tee 1
            local.get 10
            local.get 1
            local.get 10
            i32.gt_u
            select
            local.get 4
            i32.sub
            local.tee 1
            i32.ge_u
            br_if 0 (;@4;)
            local.get 5
            local.get 4
            local.get 1
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h4c8ab8a4ebe78826E.llvm.13498044319351723418
            local.get 5
            i32.load
            local.set 7
            local.get 5
            i32.load offset=4
            local.set 9
          end
          local.get 0
          local.get 7
          local.get 8
          i32.sub
          i32.store offset=8
          local.get 0
          local.get 9
          local.get 8
          i32.add
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        local.get 9
        local.get 6
        local.get 4
        call $memcpy
        i32.store
        local.get 0
        local.get 5
        i32.load
        i32.store offset=8
        i32.const 1
        local.set 6
        br 1 (;@1;)
      end
      i32.const 1050830
      i32.const 8
      i32.const 1050840
      call $_ZN4core6option13expect_failed17h637b3c5bf9792ea8E
      unreachable
    end
    local.get 3
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 6)
  (func $_ZN5bytes9bytes_mut8BytesMut17advance_unchecked17h8cc95633436894fdE (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load offset=12
        local.tee 2
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 5
            i32.shr_u
            local.tee 3
            local.get 1
            i32.add
            local.tee 4
            i32.const 134217728
            i32.ge_u
            br_if 0 (;@4;)
            local.get 4
            i32.const 5
            i32.shl
            local.get 2
            i32.const 31
            i32.and
            i32.or
            local.set 4
            br 1 (;@3;)
          end
          i32.const 0
          i32.load8_u offset=1051873
          drop
          local.get 0
          i32.load offset=8
          local.set 5
          local.get 0
          i32.load offset=4
          local.set 6
          local.get 0
          i32.load
          local.set 7
          block  ;; label = @4
            i32.const 20
            i32.const 4
            call $__rust_alloc
            local.tee 4
            i32.eqz
            br_if 0 (;@4;)
            local.get 4
            i32.const 1
            i32.store offset=16
            local.get 4
            local.get 6
            local.get 3
            i32.add
            i32.store offset=8
            local.get 4
            local.get 7
            local.get 3
            i32.sub
            i32.store offset=4
            local.get 4
            local.get 5
            local.get 3
            i32.add
            i32.store
            local.get 4
            local.get 2
            i32.const 2
            i32.shr_u
            i32.const 7
            i32.and
            i32.store offset=12
            br 1 (;@3;)
          end
          i32.const 4
          i32.const 20
          call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
          unreachable
        end
        local.get 0
        local.get 4
        i32.store offset=12
      end
      local.get 0
      local.get 0
      i32.load
      local.get 1
      i32.add
      i32.store
      local.get 0
      local.get 0
      i32.load offset=8
      local.get 1
      i32.sub
      i32.store offset=8
      local.get 0
      i32.const 0
      local.get 0
      i32.load offset=4
      local.tee 4
      local.get 1
      i32.sub
      local.tee 1
      local.get 1
      local.get 4
      i32.gt_u
      select
      i32.store offset=4
    end)
  (func $_ZN68_$LT$bytes..bytes_mut..BytesMut$u20$as$u20$core..ops..drop..Drop$GT$4drop17h694f9b0f8c62c807E (type 1) (param i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=12
        local.tee 1
        i32.const 1
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=8
        local.get 1
        i32.const 5
        i32.shr_u
        local.tee 1
        i32.add
        local.tee 2
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.get 1
        i32.sub
        local.get 2
        i32.const 1
        call $__rust_dealloc
        return
      end
      local.get 1
      local.get 1
      i32.load offset=16
      local.tee 0
      i32.const -1
      i32.add
      i32.store offset=16
      local.get 0
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 1
        i32.load
        local.tee 0
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.load offset=4
        local.get 0
        i32.const 1
        call $__rust_dealloc
      end
      local.get 1
      i32.const 20
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN74_$LT$bytes..bytes_mut..BytesMut$u20$as$u20$bytes..buf..buf_mut..BufMut$GT$9put_slice17h0e2daf131143dac5E (type 0) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.sub
      local.tee 4
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.const 1
      call $_ZN5bytes9bytes_mut8BytesMut13reserve_inner17h8185434d4b750251E
      drop
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=4
      local.tee 3
      i32.sub
      local.set 4
    end
    local.get 0
    i32.load
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    block  ;; label = @1
      local.get 4
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 2
      local.get 4
      call $_ZN5bytes13panic_advance17heb816a5acb8c23c0E
      unreachable
    end
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=4)
  (func $_ZN5bytes9bytes_mut11rebuild_vec17h38cce237df47590bE (type 7) (param i32 i32 i32 i32 i32)
    local.get 0
    local.get 4
    local.get 2
    i32.add
    i32.store offset=8
    local.get 0
    local.get 1
    local.get 4
    i32.sub
    i32.store offset=4
    local.get 0
    local.get 4
    local.get 3
    i32.add
    i32.store)
  (func $_ZN5bytes9bytes_mut14shared_v_clone17h1f76e68986705f75E (type 2) (param i32 i32 i32 i32)
    (local i32)
    local.get 1
    i32.load
    local.tee 1
    local.get 1
    i32.load offset=16
    local.tee 4
    i32.const 1
    i32.add
    i32.store offset=16
    block  ;; label = @1
      local.get 4
      i32.const -1
      i32.gt_s
      br_if 0 (;@1;)
      call $_ZN5bytes5abort17h7847ceaeaab8ab15E
      unreachable
    end
    local.get 0
    local.get 1
    i32.store offset=12
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    i32.const 1050872
    i32.store)
  (func $_ZN5bytes9bytes_mut15shared_v_to_vec17he57e9e159f74f9c2E (type 2) (param i32 i32 i32 i32)
    (local i32 i32 i32)
    i32.const 1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load
          local.tee 1
          i32.load offset=16
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 3 (;@1;)
            i32.const 0
            i32.load8_u offset=1051873
            drop
            i32.const 1
            local.set 5
            local.get 3
            i32.const 1
            call $__rust_alloc
            local.tee 4
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 4
          local.get 2
          local.get 3
          call $memcpy
          drop
          local.get 1
          local.get 1
          i32.load offset=16
          local.tee 2
          i32.const -1
          i32.add
          i32.store offset=16
          local.get 3
          local.set 5
          local.get 2
          i32.const 1
          i32.ne
          br_if 1 (;@2;)
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 5
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=4
            local.get 5
            i32.const 1
            call $__rust_dealloc
          end
          local.get 1
          i32.const 20
          i32.const 4
          call $__rust_dealloc
          local.get 3
          local.set 5
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.store offset=8
        local.get 1
        i32.load offset=4
        local.set 4
        local.get 1
        i32.load
        local.set 5
        local.get 1
        i64.const 4294967296
        i64.store align=4
        local.get 1
        local.get 1
        i32.load offset=16
        local.tee 6
        i32.const -1
        i32.add
        i32.store offset=16
        block  ;; label = @3
          local.get 6
          i32.const 1
          i32.ne
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 1
            i32.load
            local.tee 6
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.load offset=4
            local.get 6
            i32.const 1
            call $__rust_dealloc
          end
          local.get 1
          i32.const 20
          i32.const 4
          call $__rust_dealloc
        end
        local.get 4
        local.get 2
        local.get 3
        call $memmove
        drop
      end
      local.get 0
      local.get 3
      i32.store offset=8
      local.get 0
      local.get 4
      i32.store offset=4
      local.get 0
      local.get 5
      i32.store
      return
    end
    local.get 5
    local.get 3
    call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
    unreachable)
  (func $_ZN5bytes9bytes_mut15shared_v_to_mut17h0a28fea12aa912d6E (type 2) (param i32 i32 i32 i32)
    (local i32 i32)
    i32.const 1
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.load
          local.tee 1
          i32.load offset=16
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 5
            local.get 3
            i32.const 0
            i32.lt_s
            br_if 3 (;@1;)
            i32.const 0
            i32.load8_u offset=1051873
            drop
            i32.const 1
            local.set 5
            local.get 3
            i32.const 1
            call $__rust_alloc
            local.tee 4
            i32.eqz
            br_if 3 (;@1;)
          end
          local.get 4
          local.get 2
          local.get 3
          call $memcpy
          drop
          local.get 1
          local.get 1
          i32.load offset=16
          local.tee 2
          i32.const -1
          i32.add
          i32.store offset=16
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.ne
            br_if 0 (;@4;)
            block  ;; label = @5
              local.get 1
              i32.load
              local.tee 2
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              i32.load offset=4
              local.get 2
              i32.const 1
              call $__rust_dealloc
            end
            local.get 1
            i32.const 20
            i32.const 4
            call $__rust_dealloc
          end
          i32.const 32
          local.get 3
          i32.const 10
          i32.shr_u
          i32.clz
          i32.sub
          local.tee 1
          i32.const 7
          local.get 1
          i32.const 7
          i32.lt_u
          select
          i32.const 2
          i32.shl
          i32.const 1
          i32.or
          local.set 1
          local.get 3
          local.set 5
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.get 2
        i32.sub
        local.get 1
        i32.load offset=4
        i32.add
        local.set 5
        local.get 2
        local.set 4
      end
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 0
      local.get 5
      i32.store offset=8
      local.get 0
      local.get 3
      i32.store offset=4
      local.get 0
      local.get 4
      i32.store
      return
    end
    local.get 5
    local.get 3
    call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
    unreachable)
  (func $_ZN5bytes9bytes_mut18shared_v_is_unique17h089cb643903ffe29E (type 10) (param i32) (result i32)
    local.get 0
    i32.load
    i32.load offset=16
    i32.const 1
    i32.eq)
  (func $_ZN5bytes9bytes_mut13shared_v_drop17hcb5bbcb630efea93E (type 0) (param i32 i32 i32)
    (local i32)
    local.get 0
    i32.load
    local.tee 0
    local.get 0
    i32.load offset=16
    local.tee 3
    i32.const -1
    i32.add
    i32.store offset=16
    block  ;; label = @1
      local.get 3
      i32.const 1
      i32.ne
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 0
        i32.load
        local.tee 3
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=4
        local.get 3
        i32.const 1
        call $__rust_dealloc
      end
      local.get 0
      i32.const 20
      i32.const 4
      call $__rust_dealloc
    end)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h88d3cb239ded0a8bE (type 4) (param i32 i32)
    local.get 0
    i64.const -2989668174502565848
    i64.store offset=8
    local.get 0
    i64.const -8255713724082750831
    i64.store)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9571516faba776b2E (type 4) (param i32 i32)
    local.get 0
    i64.const 9172487606043731407
    i64.store offset=8
    local.get 0
    i64.const -8877450274954529964
    i64.store)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17heb1b6f3656f479feE (type 4) (param i32 i32)
    local.get 0
    i64.const 7199936582794304877
    i64.store offset=8
    local.get 0
    i64.const -5076933981314334344
    i64.store)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h95d0e43a1ec4579dE (type 0) (param i32 i32 i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      local.get 2
      i32.add
      local.tee 2
      local.get 1
      i32.ge_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    i32.const 1
    local.set 4
    local.get 0
    i32.load
    local.tee 5
    i32.const 1
    i32.shl
    local.tee 1
    local.get 2
    local.get 1
    local.get 2
    i32.gt_u
    select
    local.tee 1
    i32.const 8
    local.get 1
    i32.const 8
    i32.gt_u
    select
    local.tee 1
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 5
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        br 1 (;@1;)
      end
      local.get 3
      local.get 5
      i32.store offset=28
      local.get 3
      local.get 0
      i32.load offset=4
      i32.store offset=20
    end
    local.get 3
    local.get 4
    i32.store offset=24
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    local.get 1
    local.get 3
    i32.const 20
    i32.add
    call $_ZN5alloc7raw_vec11finish_grow17ha0fc23de3e124241E
    block  ;; label = @1
      local.get 3
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 3
      i32.load offset=12
      local.get 3
      i32.load offset=16
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 3
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 3
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN4core3fmt5Write9write_fmt17h5450563fbb96cb70E (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.const 1050892
    local.get 1
    call $_ZN4core3fmt5write17hbee61cd3fb7b52a3E)
  (func $_ZN4core3ptr122drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hafb4b80ed40fbfe0E (type 1) (param i32))
  (func $_ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17hf58ee1d6076085b1E (type 1) (param i32))
  (func $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17he0b9c7b9b779f017E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h0cdb96bb4afb8b69E (type 1) (param i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 1
      i32.const -2147483648
      i32.or
      i32.const -2147483648
      i32.eq
      br_if 0 (;@1;)
      local.get 0
      i32.load offset=4
      local.get 1
      i32.const 1
      call $__rust_dealloc
    end)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17h36d97d1c4726ee61E (type 6) (param i32 i32) (result i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 1
            i32.const 128
            i32.lt_u
            br_if 0 (;@4;)
            local.get 2
            i32.const 0
            i32.store offset=12
            local.get 1
            i32.const 2048
            i32.lt_u
            br_if 1 (;@3;)
            block  ;; label = @5
              local.get 1
              i32.const 65536
              i32.ge_u
              br_if 0 (;@5;)
              local.get 2
              local.get 1
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=14
              local.get 2
              local.get 1
              i32.const 12
              i32.shr_u
              i32.const 224
              i32.or
              i32.store8 offset=12
              local.get 2
              local.get 1
              i32.const 6
              i32.shr_u
              i32.const 63
              i32.and
              i32.const 128
              i32.or
              i32.store8 offset=13
              i32.const 3
              local.set 1
              br 3 (;@2;)
            end
            local.get 2
            local.get 1
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=15
            local.get 2
            local.get 1
            i32.const 6
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=14
            local.get 2
            local.get 1
            i32.const 12
            i32.shr_u
            i32.const 63
            i32.and
            i32.const 128
            i32.or
            i32.store8 offset=13
            local.get 2
            local.get 1
            i32.const 18
            i32.shr_u
            i32.const 7
            i32.and
            i32.const 240
            i32.or
            i32.store8 offset=12
            i32.const 4
            local.set 1
            br 2 (;@2;)
          end
          block  ;; label = @4
            local.get 0
            i32.load offset=8
            local.tee 3
            local.get 0
            i32.load
            i32.ne
            br_if 0 (;@4;)
            local.get 0
            call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h249dd74981fa9ca3E
          end
          local.get 0
          local.get 3
          i32.const 1
          i32.add
          i32.store offset=8
          local.get 0
          i32.load offset=4
          local.get 3
          i32.add
          local.get 1
          i32.store8
          br 2 (;@1;)
        end
        local.get 2
        local.get 1
        i32.const 63
        i32.and
        i32.const 128
        i32.or
        i32.store8 offset=13
        local.get 2
        local.get 1
        i32.const 6
        i32.shr_u
        i32.const 192
        i32.or
        i32.store8 offset=12
        i32.const 2
        local.set 1
      end
      block  ;; label = @2
        local.get 0
        i32.load
        local.get 0
        i32.load offset=8
        local.tee 3
        i32.sub
        local.get 1
        i32.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h95d0e43a1ec4579dE
        local.get 0
        i32.load offset=8
        local.set 3
      end
      local.get 0
      i32.load offset=4
      local.get 3
      i32.add
      local.get 2
      i32.const 12
      i32.add
      local.get 1
      call $memcpy
      drop
      local.get 0
      local.get 3
      local.get 1
      i32.add
      i32.store offset=8
    end
    local.get 2
    i32.const 16
    i32.add
    global.set $__stack_pointer
    i32.const 0)
  (func $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$8grow_one17h249dd74981fa9ca3E (type 1) (param i32)
    (local i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 2
      i32.const 1
      i32.add
      local.tee 3
      br_if 0 (;@1;)
      i32.const 0
      i32.const 0
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 2
    i32.const 1
    i32.shl
    local.tee 4
    local.get 3
    local.get 4
    local.get 3
    i32.gt_u
    select
    local.tee 3
    i32.const 8
    local.get 3
    i32.const 8
    i32.gt_u
    select
    local.tee 3
    i32.const -1
    i32.xor
    i32.const 31
    i32.shr_u
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store offset=28
      local.get 1
      local.get 0
      i32.load offset=4
      i32.store offset=20
      i32.const 1
      local.set 2
    end
    local.get 1
    local.get 2
    i32.store offset=24
    local.get 1
    i32.const 8
    i32.add
    local.get 4
    local.get 3
    local.get 1
    i32.const 20
    i32.add
    call $_ZN5alloc7raw_vec11finish_grow17ha0fc23de3e124241E
    block  ;; label = @1
      local.get 1
      i32.load offset=8
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.get 1
      i32.load offset=16
      call $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E
      unreachable
    end
    local.get 1
    i32.load offset=12
    local.set 2
    local.get 0
    local.get 3
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h932675f2c687b13fE (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.get 0
      i32.load offset=8
      local.tee 3
      i32.sub
      local.get 2
      i32.ge_u
      br_if 0 (;@1;)
      local.get 0
      local.get 3
      local.get 2
      call $_ZN5alloc7raw_vec19RawVec$LT$T$C$A$GT$7reserve21do_reserve_and_handle17h95d0e43a1ec4579dE
      local.get 0
      i32.load offset=8
      local.set 3
    end
    local.get 0
    i32.load offset=4
    local.get 3
    i32.add
    local.get 1
    local.get 2
    call $memcpy
    drop
    local.get 0
    local.get 3
    local.get 2
    i32.add
    i32.store offset=8
    i32.const 0)
  (func $_ZN5alloc7raw_vec11finish_grow17ha0fc23de3e124241E (type 2) (param i32 i32 i32 i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.eqz
          br_if 0 (;@3;)
          local.get 2
          i32.const 0
          i32.lt_s
          br_if 1 (;@2;)
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                i32.eqz
                br_if 0 (;@6;)
                block  ;; label = @7
                  local.get 3
                  i32.load offset=8
                  local.tee 4
                  br_if 0 (;@7;)
                  block  ;; label = @8
                    local.get 2
                    br_if 0 (;@8;)
                    local.get 1
                    local.set 3
                    br 4 (;@4;)
                  end
                  i32.const 0
                  i32.load8_u offset=1051873
                  drop
                  br 2 (;@5;)
                end
                local.get 3
                i32.load
                local.get 4
                local.get 1
                local.get 2
                call $__rust_realloc
                local.set 3
                br 2 (;@4;)
              end
              block  ;; label = @6
                local.get 2
                br_if 0 (;@6;)
                local.get 1
                local.set 3
                br 2 (;@4;)
              end
              i32.const 0
              i32.load8_u offset=1051873
              drop
            end
            local.get 2
            local.get 1
            call $__rust_alloc
            local.set 3
          end
          block  ;; label = @4
            local.get 3
            i32.eqz
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            i32.store offset=8
            local.get 0
            local.get 3
            i32.store offset=4
            local.get 0
            i32.const 0
            i32.store
            return
          end
          local.get 0
          local.get 2
          i32.store offset=8
          local.get 0
          local.get 1
          i32.store offset=4
          br 2 (;@1;)
        end
        local.get 0
        i32.const 0
        i32.store offset=4
        br 1 (;@1;)
      end
      local.get 0
      i32.const 0
      i32.store offset=4
    end
    local.get 0
    i32.const 1
    i32.store)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 256
          i32.lt_u
          br_if 0 (;@3;)
          local.get 0
          i32.load offset=24
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 2
                local.get 0
                i32.ne
                br_if 0 (;@6;)
                local.get 0
                i32.const 20
                i32.const 16
                local.get 0
                i32.load offset=20
                local.tee 2
                select
                i32.add
                i32.load
                local.tee 1
                br_if 1 (;@5;)
                i32.const 0
                local.set 2
                br 2 (;@4;)
              end
              local.get 0
              i32.load offset=8
              local.tee 1
              local.get 2
              i32.store offset=12
              local.get 2
              local.get 1
              i32.store offset=8
              br 1 (;@4;)
            end
            local.get 0
            i32.const 20
            i32.add
            local.get 0
            i32.const 16
            i32.add
            local.get 2
            select
            local.set 4
            loop  ;; label = @5
              local.get 4
              local.set 5
              local.get 1
              local.tee 2
              i32.const 20
              i32.add
              local.get 2
              i32.const 16
              i32.add
              local.get 2
              i32.load offset=20
              local.tee 1
              select
              local.set 4
              local.get 2
              i32.const 20
              i32.const 16
              local.get 1
              select
              i32.add
              i32.load
              local.tee 1
              br_if 0 (;@5;)
            end
            local.get 5
            i32.const 0
            i32.store
          end
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          block  ;; label = @4
            local.get 0
            i32.load offset=28
            i32.const 2
            i32.shl
            i32.const 1051896
            i32.add
            local.tee 1
            i32.load
            local.get 0
            i32.eq
            br_if 0 (;@4;)
            local.get 3
            i32.const 16
            i32.const 20
            local.get 3
            i32.load offset=16
            local.get 0
            i32.eq
            select
            i32.add
            local.get 2
            i32.store
            local.get 2
            i32.eqz
            br_if 3 (;@1;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 2
          i32.store
          local.get 2
          br_if 1 (;@2;)
          i32.const 0
          i32.const 0
          i32.load offset=1052308
          i32.const -2
          local.get 0
          i32.load offset=28
          i32.rotl
          i32.and
          i32.store offset=1052308
          br 2 (;@1;)
        end
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.load offset=8
          local.tee 4
          i32.eq
          br_if 0 (;@3;)
          local.get 4
          local.get 2
          i32.store offset=12
          local.get 2
          local.get 4
          i32.store offset=8
          return
        end
        i32.const 0
        i32.const 0
        i32.load offset=1052304
        i32.const -2
        local.get 1
        i32.const 3
        i32.shr_u
        i32.rotl
        i32.and
        i32.store offset=1052304
        return
      end
      local.get 2
      local.get 3
      i32.store offset=24
      block  ;; label = @2
        local.get 0
        i32.load offset=16
        local.tee 1
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 1
        i32.store offset=16
        local.get 1
        local.get 2
        i32.store offset=24
      end
      local.get 0
      i32.load offset=20
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      local.get 1
      i32.store offset=20
      local.get 1
      local.get 2
      i32.store offset=24
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc51238bb547bf9d7E (type 4) (param i32 i32)
    (local i32 i32)
    local.get 0
    local.get 1
    i32.add
    local.set 2
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 3
        i32.const 1
        i32.and
        br_if 0 (;@2;)
        local.get 3
        i32.const 2
        i32.and
        i32.eqz
        br_if 1 (;@1;)
        local.get 0
        i32.load
        local.tee 3
        local.get 1
        i32.add
        local.set 1
        block  ;; label = @3
          local.get 0
          local.get 3
          i32.sub
          local.tee 0
          i32.const 0
          i32.load offset=1052320
          i32.ne
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          i32.const 3
          i32.and
          i32.const 3
          i32.ne
          br_if 1 (;@2;)
          i32.const 0
          local.get 1
          i32.store offset=1052312
          local.get 2
          local.get 2
          i32.load offset=4
          i32.const -2
          i32.and
          i32.store offset=4
          local.get 0
          local.get 1
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          i32.store
          br 2 (;@1;)
        end
        local.get 0
        local.get 3
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE
      end
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=4
              local.tee 3
              i32.const 2
              i32.and
              br_if 0 (;@5;)
              local.get 2
              i32.const 0
              i32.load offset=1052324
              i32.eq
              br_if 2 (;@3;)
              local.get 2
              i32.const 0
              i32.load offset=1052320
              i32.eq
              br_if 3 (;@2;)
              local.get 2
              local.get 3
              i32.const -8
              i32.and
              local.tee 3
              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE
              local.get 0
              local.get 3
              local.get 1
              i32.add
              local.tee 1
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.add
              local.get 1
              i32.store
              local.get 0
              i32.const 0
              i32.load offset=1052320
              i32.ne
              br_if 1 (;@4;)
              i32.const 0
              local.get 1
              i32.store offset=1052312
              return
            end
            local.get 2
            local.get 3
            i32.const -2
            i32.and
            i32.store offset=4
            local.get 0
            local.get 1
            i32.const 1
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.add
            local.get 1
            i32.store
          end
          block  ;; label = @4
            local.get 1
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 1
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h67b2ff06c0e8b9e0E
            return
          end
          local.get 1
          i32.const -8
          i32.and
          i32.const 1052040
          i32.add
          local.set 2
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052304
              local.tee 3
              i32.const 1
              local.get 1
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 1
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 3
              local.get 1
              i32.or
              i32.store offset=1052304
              local.get 2
              local.set 1
              br 1 (;@4;)
            end
            local.get 2
            i32.load offset=8
            local.set 1
          end
          local.get 2
          local.get 0
          i32.store offset=8
          local.get 1
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 2
          i32.store offset=12
          local.get 0
          local.get 1
          i32.store offset=8
          return
        end
        i32.const 0
        local.get 0
        i32.store offset=1052324
        i32.const 0
        i32.const 0
        i32.load offset=1052316
        local.get 1
        i32.add
        local.tee 1
        i32.store offset=1052316
        local.get 0
        local.get 1
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 0
        i32.const 0
        i32.load offset=1052320
        i32.ne
        br_if 1 (;@1;)
        i32.const 0
        i32.const 0
        i32.store offset=1052312
        i32.const 0
        i32.const 0
        i32.store offset=1052320
        return
      end
      i32.const 0
      local.get 0
      i32.store offset=1052320
      i32.const 0
      i32.const 0
      i32.load offset=1052312
      local.get 1
      i32.add
      local.tee 1
      i32.store offset=1052312
      local.get 0
      local.get 1
      i32.const 1
      i32.or
      i32.store offset=4
      local.get 0
      local.get 1
      i32.add
      local.get 1
      i32.store
      return
    end)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h67b2ff06c0e8b9e0E (type 4) (param i32 i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      local.get 1
      i32.const 256
      i32.lt_u
      br_if 0 (;@1;)
      i32.const 31
      local.set 2
      local.get 1
      i32.const 16777215
      i32.gt_u
      br_if 0 (;@1;)
      local.get 1
      i32.const 6
      local.get 1
      i32.const 8
      i32.shr_u
      i32.clz
      local.tee 2
      i32.sub
      i32.shr_u
      i32.const 1
      i32.and
      local.get 2
      i32.const 1
      i32.shl
      i32.sub
      i32.const 62
      i32.add
      local.set 2
    end
    local.get 0
    i64.const 0
    i64.store offset=16 align=4
    local.get 0
    local.get 2
    i32.store offset=28
    local.get 2
    i32.const 2
    i32.shl
    i32.const 1051896
    i32.add
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=1052308
      i32.const 1
      local.get 2
      i32.shl
      local.tee 4
      i32.and
      br_if 0 (;@1;)
      local.get 3
      local.get 0
      i32.store
      local.get 0
      local.get 3
      i32.store offset=24
      local.get 0
      local.get 0
      i32.store offset=12
      local.get 0
      local.get 0
      i32.store offset=8
      i32.const 0
      i32.const 0
      i32.load offset=1052308
      local.get 4
      i32.or
      i32.store offset=1052308
      return
    end
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.load
          local.tee 4
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 4
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const 0
        i32.const 25
        local.get 2
        i32.const 1
        i32.shr_u
        i32.sub
        local.get 2
        i32.const 31
        i32.eq
        select
        i32.shl
        local.set 3
        loop  ;; label = @3
          local.get 4
          local.get 3
          i32.const 29
          i32.shr_u
          i32.const 4
          i32.and
          i32.add
          i32.const 16
          i32.add
          local.tee 5
          i32.load
          local.tee 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 1
          i32.shl
          local.set 3
          local.get 2
          local.set 4
          local.get 2
          i32.load offset=4
          i32.const -8
          i32.and
          local.get 1
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 2
      i32.load offset=8
      local.tee 3
      local.get 0
      i32.store offset=12
      local.get 2
      local.get 0
      i32.store offset=8
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 0
      local.get 2
      i32.store offset=12
      local.get 0
      local.get 3
      i32.store offset=8
      return
    end
    local.get 5
    local.get 0
    i32.store
    local.get 0
    local.get 4
    i32.store offset=24
    local.get 0
    local.get 0
    i32.store offset=12
    local.get 0
    local.get 0
    i32.store offset=8)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h21bf9d7572bd86f3E (type 1) (param i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const -8
    i32.add
    local.tee 1
    local.get 0
    i32.const -4
    i32.add
    i32.load
    local.tee 2
    i32.const -8
    i32.and
    local.tee 0
    i32.add
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 1
            i32.and
            br_if 0 (;@4;)
            local.get 2
            i32.const 2
            i32.and
            i32.eqz
            br_if 1 (;@3;)
            local.get 1
            i32.load
            local.tee 2
            local.get 0
            i32.add
            local.set 0
            block  ;; label = @5
              local.get 1
              local.get 2
              i32.sub
              local.tee 1
              i32.const 0
              i32.load offset=1052320
              i32.ne
              br_if 0 (;@5;)
              local.get 3
              i32.load offset=4
              i32.const 3
              i32.and
              i32.const 3
              i32.ne
              br_if 1 (;@4;)
              i32.const 0
              local.get 0
              i32.store offset=1052312
              local.get 3
              local.get 3
              i32.load offset=4
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 3
              local.get 0
              i32.store
              return
            end
            local.get 1
            local.get 2
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 3
                i32.load offset=4
                local.tee 2
                i32.const 2
                i32.and
                br_if 0 (;@6;)
                local.get 3
                i32.const 0
                i32.load offset=1052324
                i32.eq
                br_if 2 (;@4;)
                local.get 3
                i32.const 0
                i32.load offset=1052320
                i32.eq
                br_if 5 (;@1;)
                local.get 3
                local.get 2
                i32.const -8
                i32.and
                local.tee 2
                call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE
                local.get 1
                local.get 2
                local.get 0
                i32.add
                local.tee 0
                i32.const 1
                i32.or
                i32.store offset=4
                local.get 1
                local.get 0
                i32.add
                local.get 0
                i32.store
                local.get 1
                i32.const 0
                i32.load offset=1052320
                i32.ne
                br_if 1 (;@5;)
                i32.const 0
                local.get 0
                i32.store offset=1052312
                return
              end
              local.get 3
              local.get 2
              i32.const -2
              i32.and
              i32.store offset=4
              local.get 1
              local.get 0
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 1
              local.get 0
              i32.add
              local.get 0
              i32.store
            end
            local.get 0
            i32.const 256
            i32.lt_u
            br_if 2 (;@2;)
            local.get 1
            local.get 0
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h67b2ff06c0e8b9e0E
            i32.const 0
            local.set 1
            i32.const 0
            i32.const 0
            i32.load offset=1052344
            i32.const -1
            i32.add
            local.tee 0
            i32.store offset=1052344
            local.get 0
            br_if 1 (;@3;)
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052032
              local.tee 0
              i32.eqz
              br_if 0 (;@5;)
              i32.const 0
              local.set 1
              loop  ;; label = @6
                local.get 1
                i32.const 1
                i32.add
                local.set 1
                local.get 0
                i32.load offset=8
                local.tee 0
                br_if 0 (;@6;)
              end
            end
            i32.const 0
            local.get 1
            i32.const 4095
            local.get 1
            i32.const 4095
            i32.gt_u
            select
            i32.store offset=1052344
            return
          end
          i32.const 0
          local.get 1
          i32.store offset=1052324
          i32.const 0
          i32.const 0
          i32.load offset=1052316
          local.get 0
          i32.add
          local.tee 0
          i32.store offset=1052316
          local.get 1
          local.get 0
          i32.const 1
          i32.or
          i32.store offset=4
          block  ;; label = @4
            local.get 1
            i32.const 0
            i32.load offset=1052320
            i32.ne
            br_if 0 (;@4;)
            i32.const 0
            i32.const 0
            i32.store offset=1052312
            i32.const 0
            i32.const 0
            i32.store offset=1052320
          end
          local.get 0
          i32.const 0
          i32.load offset=1052336
          local.tee 4
          i32.le_u
          br_if 0 (;@3;)
          i32.const 0
          i32.load offset=1052324
          local.tee 3
          i32.eqz
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block  ;; label = @4
            i32.const 0
            i32.load offset=1052316
            local.tee 5
            i32.const 41
            i32.lt_u
            br_if 0 (;@4;)
            i32.const 1052024
            local.set 0
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load
                local.tee 2
                local.get 3
                i32.gt_u
                br_if 0 (;@6;)
                local.get 2
                local.get 0
                i32.load offset=4
                i32.add
                local.get 3
                i32.gt_u
                br_if 2 (;@4;)
              end
              local.get 0
              i32.load offset=8
              local.tee 0
              br_if 0 (;@5;)
            end
          end
          block  ;; label = @4
            i32.const 0
            i32.load offset=1052032
            local.tee 0
            i32.eqz
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              local.get 0
              i32.load offset=8
              local.tee 0
              br_if 0 (;@5;)
            end
          end
          i32.const 0
          local.get 1
          i32.const 4095
          local.get 1
          i32.const 4095
          i32.gt_u
          select
          i32.store offset=1052344
          local.get 5
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          i32.const 0
          i32.const -1
          i32.store offset=1052336
        end
        return
      end
      local.get 0
      i32.const -8
      i32.and
      i32.const 1052040
      i32.add
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          i32.const 0
          i32.load offset=1052304
          local.tee 2
          i32.const 1
          local.get 0
          i32.const 3
          i32.shr_u
          i32.shl
          local.tee 0
          i32.and
          br_if 0 (;@3;)
          i32.const 0
          local.get 2
          local.get 0
          i32.or
          i32.store offset=1052304
          local.get 3
          local.set 0
          br 1 (;@2;)
        end
        local.get 3
        i32.load offset=8
        local.set 0
      end
      local.get 3
      local.get 1
      i32.store offset=8
      local.get 0
      local.get 1
      i32.store offset=12
      local.get 1
      local.get 3
      i32.store offset=12
      local.get 1
      local.get 0
      i32.store offset=8
      return
    end
    i32.const 0
    local.get 1
    i32.store offset=1052320
    i32.const 0
    i32.const 0
    i32.load offset=1052312
    local.get 0
    i32.add
    local.tee 0
    i32.store offset=1052312
    local.get 1
    local.get 0
    i32.const 1
    i32.or
    i32.store offset=4
    local.get 1
    local.get 0
    i32.add
    local.get 0
    i32.store)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0483a0dc0f5e490bE (type 10) (param i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 0
                    i32.const 245
                    i32.lt_u
                    br_if 0 (;@8;)
                    i32.const 0
                    local.set 2
                    local.get 0
                    i32.const -65587
                    i32.ge_u
                    br_if 7 (;@1;)
                    local.get 0
                    i32.const 11
                    i32.add
                    local.tee 0
                    i32.const -8
                    i32.and
                    local.set 3
                    i32.const 0
                    i32.load offset=1052308
                    local.tee 4
                    i32.eqz
                    br_if 4 (;@4;)
                    i32.const 0
                    local.set 5
                    block  ;; label = @9
                      local.get 3
                      i32.const 256
                      i32.lt_u
                      br_if 0 (;@9;)
                      i32.const 31
                      local.set 5
                      local.get 3
                      i32.const 16777215
                      i32.gt_u
                      br_if 0 (;@9;)
                      local.get 3
                      i32.const 6
                      local.get 0
                      i32.const 8
                      i32.shr_u
                      i32.clz
                      local.tee 0
                      i32.sub
                      i32.shr_u
                      i32.const 1
                      i32.and
                      local.get 0
                      i32.const 1
                      i32.shl
                      i32.sub
                      i32.const 62
                      i32.add
                      local.set 5
                    end
                    i32.const 0
                    local.get 3
                    i32.sub
                    local.set 2
                    block  ;; label = @9
                      local.get 5
                      i32.const 2
                      i32.shl
                      i32.const 1051896
                      i32.add
                      i32.load
                      local.tee 6
                      br_if 0 (;@9;)
                      i32.const 0
                      local.set 0
                      i32.const 0
                      local.set 7
                      br 2 (;@7;)
                    end
                    i32.const 0
                    local.set 0
                    local.get 3
                    i32.const 0
                    i32.const 25
                    local.get 5
                    i32.const 1
                    i32.shr_u
                    i32.sub
                    local.get 5
                    i32.const 31
                    i32.eq
                    select
                    i32.shl
                    local.set 8
                    i32.const 0
                    local.set 7
                    loop  ;; label = @9
                      block  ;; label = @10
                        local.get 6
                        local.tee 6
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.tee 9
                        local.get 3
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 9
                        local.get 3
                        i32.sub
                        local.tee 9
                        local.get 2
                        i32.ge_u
                        br_if 0 (;@10;)
                        local.get 9
                        local.set 2
                        local.get 6
                        local.set 7
                        local.get 9
                        br_if 0 (;@10;)
                        i32.const 0
                        local.set 2
                        local.get 6
                        local.set 7
                        local.get 6
                        local.set 0
                        br 4 (;@6;)
                      end
                      local.get 6
                      i32.load offset=20
                      local.tee 9
                      local.get 0
                      local.get 9
                      local.get 6
                      local.get 8
                      i32.const 29
                      i32.shr_u
                      i32.const 4
                      i32.and
                      i32.add
                      i32.const 16
                      i32.add
                      i32.load
                      local.tee 6
                      i32.ne
                      select
                      local.get 0
                      local.get 9
                      select
                      local.set 0
                      local.get 8
                      i32.const 1
                      i32.shl
                      local.set 8
                      local.get 6
                      i32.eqz
                      br_if 2 (;@7;)
                      br 0 (;@9;)
                    end
                  end
                  block  ;; label = @8
                    i32.const 0
                    i32.load offset=1052304
                    local.tee 6
                    i32.const 16
                    local.get 0
                    i32.const 11
                    i32.add
                    i32.const 504
                    i32.and
                    local.get 0
                    i32.const 11
                    i32.lt_u
                    select
                    local.tee 3
                    i32.const 3
                    i32.shr_u
                    local.tee 2
                    i32.shr_u
                    local.tee 0
                    i32.const 3
                    i32.and
                    i32.eqz
                    br_if 0 (;@8;)
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        i32.const -1
                        i32.xor
                        i32.const 1
                        i32.and
                        local.get 2
                        i32.add
                        local.tee 3
                        i32.const 3
                        i32.shl
                        local.tee 0
                        i32.const 1052040
                        i32.add
                        local.tee 2
                        local.get 0
                        i32.const 1052048
                        i32.add
                        i32.load
                        local.tee 0
                        i32.load offset=8
                        local.tee 7
                        i32.eq
                        br_if 0 (;@10;)
                        local.get 7
                        local.get 2
                        i32.store offset=12
                        local.get 2
                        local.get 7
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      i32.const 0
                      local.get 6
                      i32.const -2
                      local.get 3
                      i32.rotl
                      i32.and
                      i32.store offset=1052304
                    end
                    local.get 0
                    i32.const 8
                    i32.add
                    local.set 2
                    local.get 0
                    local.get 3
                    i32.const 3
                    i32.shl
                    local.tee 3
                    i32.const 3
                    i32.or
                    i32.store offset=4
                    local.get 0
                    local.get 3
                    i32.add
                    local.tee 0
                    local.get 0
                    i32.load offset=4
                    i32.const 1
                    i32.or
                    i32.store offset=4
                    br 7 (;@1;)
                  end
                  local.get 3
                  i32.const 0
                  i32.load offset=1052312
                  i32.le_u
                  br_if 3 (;@4;)
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        br_if 0 (;@10;)
                        i32.const 0
                        i32.load offset=1052308
                        local.tee 0
                        i32.eqz
                        br_if 6 (;@4;)
                        local.get 0
                        i32.ctz
                        i32.const 2
                        i32.shl
                        i32.const 1051896
                        i32.add
                        i32.load
                        local.tee 7
                        i32.load offset=4
                        i32.const -8
                        i32.and
                        local.get 3
                        i32.sub
                        local.set 2
                        local.get 7
                        local.set 6
                        loop  ;; label = @11
                          block  ;; label = @12
                            local.get 7
                            i32.load offset=16
                            local.tee 0
                            br_if 0 (;@12;)
                            local.get 7
                            i32.load offset=20
                            local.tee 0
                            br_if 0 (;@12;)
                            local.get 6
                            i32.load offset=24
                            local.set 5
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  local.get 6
                                  i32.load offset=12
                                  local.tee 0
                                  local.get 6
                                  i32.ne
                                  br_if 0 (;@15;)
                                  local.get 6
                                  i32.const 20
                                  i32.const 16
                                  local.get 6
                                  i32.load offset=20
                                  local.tee 0
                                  select
                                  i32.add
                                  i32.load
                                  local.tee 7
                                  br_if 1 (;@14;)
                                  i32.const 0
                                  local.set 0
                                  br 2 (;@13;)
                                end
                                local.get 6
                                i32.load offset=8
                                local.tee 7
                                local.get 0
                                i32.store offset=12
                                local.get 0
                                local.get 7
                                i32.store offset=8
                                br 1 (;@13;)
                              end
                              local.get 6
                              i32.const 20
                              i32.add
                              local.get 6
                              i32.const 16
                              i32.add
                              local.get 0
                              select
                              local.set 8
                              loop  ;; label = @14
                                local.get 8
                                local.set 9
                                local.get 7
                                local.tee 0
                                i32.const 20
                                i32.add
                                local.get 0
                                i32.const 16
                                i32.add
                                local.get 0
                                i32.load offset=20
                                local.tee 7
                                select
                                local.set 8
                                local.get 0
                                i32.const 20
                                i32.const 16
                                local.get 7
                                select
                                i32.add
                                i32.load
                                local.tee 7
                                br_if 0 (;@14;)
                              end
                              local.get 9
                              i32.const 0
                              i32.store
                            end
                            local.get 5
                            i32.eqz
                            br_if 4 (;@8;)
                            block  ;; label = @13
                              local.get 6
                              i32.load offset=28
                              i32.const 2
                              i32.shl
                              i32.const 1051896
                              i32.add
                              local.tee 7
                              i32.load
                              local.get 6
                              i32.eq
                              br_if 0 (;@13;)
                              local.get 5
                              i32.const 16
                              i32.const 20
                              local.get 5
                              i32.load offset=16
                              local.get 6
                              i32.eq
                              select
                              i32.add
                              local.get 0
                              i32.store
                              local.get 0
                              i32.eqz
                              br_if 5 (;@8;)
                              br 4 (;@9;)
                            end
                            local.get 7
                            local.get 0
                            i32.store
                            local.get 0
                            br_if 3 (;@9;)
                            i32.const 0
                            i32.const 0
                            i32.load offset=1052308
                            i32.const -2
                            local.get 6
                            i32.load offset=28
                            i32.rotl
                            i32.and
                            i32.store offset=1052308
                            br 4 (;@8;)
                          end
                          local.get 0
                          i32.load offset=4
                          i32.const -8
                          i32.and
                          local.get 3
                          i32.sub
                          local.tee 7
                          local.get 2
                          local.get 7
                          local.get 2
                          i32.lt_u
                          local.tee 7
                          select
                          local.set 2
                          local.get 0
                          local.get 6
                          local.get 7
                          select
                          local.set 6
                          local.get 0
                          local.set 7
                          br 0 (;@11;)
                        end
                      end
                      block  ;; label = @10
                        block  ;; label = @11
                          local.get 0
                          local.get 2
                          i32.shl
                          i32.const 2
                          local.get 2
                          i32.shl
                          local.tee 0
                          i32.const 0
                          local.get 0
                          i32.sub
                          i32.or
                          i32.and
                          i32.ctz
                          local.tee 2
                          i32.const 3
                          i32.shl
                          local.tee 0
                          i32.const 1052040
                          i32.add
                          local.tee 7
                          local.get 0
                          i32.const 1052048
                          i32.add
                          i32.load
                          local.tee 0
                          i32.load offset=8
                          local.tee 8
                          i32.eq
                          br_if 0 (;@11;)
                          local.get 8
                          local.get 7
                          i32.store offset=12
                          local.get 7
                          local.get 8
                          i32.store offset=8
                          br 1 (;@10;)
                        end
                        i32.const 0
                        local.get 6
                        i32.const -2
                        local.get 2
                        i32.rotl
                        i32.and
                        i32.store offset=1052304
                      end
                      local.get 0
                      local.get 3
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 3
                      i32.add
                      local.tee 8
                      local.get 2
                      i32.const 3
                      i32.shl
                      local.tee 2
                      local.get 3
                      i32.sub
                      local.tee 7
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 2
                      i32.add
                      local.get 7
                      i32.store
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1052312
                        local.tee 6
                        i32.eqz
                        br_if 0 (;@10;)
                        local.get 6
                        i32.const -8
                        i32.and
                        i32.const 1052040
                        i32.add
                        local.set 2
                        i32.const 0
                        i32.load offset=1052320
                        local.set 3
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052304
                            local.tee 9
                            i32.const 1
                            local.get 6
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 6
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 9
                            local.get 6
                            i32.or
                            i32.store offset=1052304
                            local.get 2
                            local.set 6
                            br 1 (;@11;)
                          end
                          local.get 2
                          i32.load offset=8
                          local.set 6
                        end
                        local.get 2
                        local.get 3
                        i32.store offset=8
                        local.get 6
                        local.get 3
                        i32.store offset=12
                        local.get 3
                        local.get 2
                        i32.store offset=12
                        local.get 3
                        local.get 6
                        i32.store offset=8
                      end
                      local.get 0
                      i32.const 8
                      i32.add
                      local.set 2
                      i32.const 0
                      local.get 8
                      i32.store offset=1052320
                      i32.const 0
                      local.get 7
                      i32.store offset=1052312
                      br 8 (;@1;)
                    end
                    local.get 0
                    local.get 5
                    i32.store offset=24
                    block  ;; label = @9
                      local.get 6
                      i32.load offset=16
                      local.tee 7
                      i32.eqz
                      br_if 0 (;@9;)
                      local.get 0
                      local.get 7
                      i32.store offset=16
                      local.get 7
                      local.get 0
                      i32.store offset=24
                    end
                    local.get 6
                    i32.load offset=20
                    local.tee 7
                    i32.eqz
                    br_if 0 (;@8;)
                    local.get 0
                    local.get 7
                    i32.store offset=20
                    local.get 7
                    local.get 0
                    i32.store offset=24
                  end
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 2
                        i32.const 16
                        i32.lt_u
                        br_if 0 (;@10;)
                        local.get 6
                        local.get 3
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 6
                        local.get 3
                        i32.add
                        local.tee 3
                        local.get 2
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 3
                        local.get 2
                        i32.add
                        local.get 2
                        i32.store
                        i32.const 0
                        i32.load offset=1052312
                        local.tee 8
                        i32.eqz
                        br_if 1 (;@9;)
                        local.get 8
                        i32.const -8
                        i32.and
                        i32.const 1052040
                        i32.add
                        local.set 7
                        i32.const 0
                        i32.load offset=1052320
                        local.set 0
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052304
                            local.tee 9
                            i32.const 1
                            local.get 8
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 8
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 9
                            local.get 8
                            i32.or
                            i32.store offset=1052304
                            local.get 7
                            local.set 8
                            br 1 (;@11;)
                          end
                          local.get 7
                          i32.load offset=8
                          local.set 8
                        end
                        local.get 7
                        local.get 0
                        i32.store offset=8
                        local.get 8
                        local.get 0
                        i32.store offset=12
                        local.get 0
                        local.get 7
                        i32.store offset=12
                        local.get 0
                        local.get 8
                        i32.store offset=8
                        br 1 (;@9;)
                      end
                      local.get 6
                      local.get 2
                      local.get 3
                      i32.add
                      local.tee 0
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 6
                      local.get 0
                      i32.add
                      local.tee 0
                      local.get 0
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      br 1 (;@8;)
                    end
                    i32.const 0
                    local.get 3
                    i32.store offset=1052320
                    i32.const 0
                    local.get 2
                    i32.store offset=1052312
                  end
                  local.get 6
                  i32.const 8
                  i32.add
                  local.set 2
                  br 6 (;@1;)
                end
                block  ;; label = @7
                  local.get 0
                  local.get 7
                  i32.or
                  br_if 0 (;@7;)
                  i32.const 0
                  local.set 7
                  i32.const 2
                  local.get 5
                  i32.shl
                  local.tee 0
                  i32.const 0
                  local.get 0
                  i32.sub
                  i32.or
                  local.get 4
                  i32.and
                  local.tee 0
                  i32.eqz
                  br_if 3 (;@4;)
                  local.get 0
                  i32.ctz
                  i32.const 2
                  i32.shl
                  i32.const 1051896
                  i32.add
                  i32.load
                  local.set 0
                end
                local.get 0
                i32.eqz
                br_if 1 (;@5;)
              end
              loop  ;; label = @6
                local.get 0
                local.get 7
                local.get 0
                i32.load offset=4
                i32.const -8
                i32.and
                local.tee 6
                local.get 3
                i32.sub
                local.tee 9
                local.get 2
                i32.lt_u
                local.tee 5
                select
                local.set 4
                local.get 6
                local.get 3
                i32.lt_u
                local.set 8
                local.get 9
                local.get 2
                local.get 5
                select
                local.set 9
                block  ;; label = @7
                  local.get 0
                  i32.load offset=16
                  local.tee 6
                  br_if 0 (;@7;)
                  local.get 0
                  i32.load offset=20
                  local.set 6
                end
                local.get 7
                local.get 4
                local.get 8
                select
                local.set 7
                local.get 2
                local.get 9
                local.get 8
                select
                local.set 2
                local.get 6
                local.set 0
                local.get 6
                br_if 0 (;@6;)
              end
            end
            local.get 7
            i32.eqz
            br_if 0 (;@4;)
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052312
              local.tee 0
              local.get 3
              i32.lt_u
              br_if 0 (;@5;)
              local.get 2
              local.get 0
              local.get 3
              i32.sub
              i32.ge_u
              br_if 1 (;@4;)
            end
            local.get 7
            i32.load offset=24
            local.set 5
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  local.get 7
                  i32.load offset=12
                  local.tee 0
                  local.get 7
                  i32.ne
                  br_if 0 (;@7;)
                  local.get 7
                  i32.const 20
                  i32.const 16
                  local.get 7
                  i32.load offset=20
                  local.tee 0
                  select
                  i32.add
                  i32.load
                  local.tee 6
                  br_if 1 (;@6;)
                  i32.const 0
                  local.set 0
                  br 2 (;@5;)
                end
                local.get 7
                i32.load offset=8
                local.tee 6
                local.get 0
                i32.store offset=12
                local.get 0
                local.get 6
                i32.store offset=8
                br 1 (;@5;)
              end
              local.get 7
              i32.const 20
              i32.add
              local.get 7
              i32.const 16
              i32.add
              local.get 0
              select
              local.set 8
              loop  ;; label = @6
                local.get 8
                local.set 9
                local.get 6
                local.tee 0
                i32.const 20
                i32.add
                local.get 0
                i32.const 16
                i32.add
                local.get 0
                i32.load offset=20
                local.tee 6
                select
                local.set 8
                local.get 0
                i32.const 20
                i32.const 16
                local.get 6
                select
                i32.add
                i32.load
                local.tee 6
                br_if 0 (;@6;)
              end
              local.get 9
              i32.const 0
              i32.store
            end
            local.get 5
            i32.eqz
            br_if 2 (;@2;)
            block  ;; label = @5
              local.get 7
              i32.load offset=28
              i32.const 2
              i32.shl
              i32.const 1051896
              i32.add
              local.tee 6
              i32.load
              local.get 7
              i32.eq
              br_if 0 (;@5;)
              local.get 5
              i32.const 16
              i32.const 20
              local.get 5
              i32.load offset=16
              local.get 7
              i32.eq
              select
              i32.add
              local.get 0
              i32.store
              local.get 0
              i32.eqz
              br_if 3 (;@2;)
              br 2 (;@3;)
            end
            local.get 6
            local.get 0
            i32.store
            local.get 0
            br_if 1 (;@3;)
            i32.const 0
            i32.const 0
            i32.load offset=1052308
            i32.const -2
            local.get 7
            i32.load offset=28
            i32.rotl
            i32.and
            i32.store offset=1052308
            br 2 (;@2;)
          end
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      i32.const 0
                      i32.load offset=1052312
                      local.tee 0
                      local.get 3
                      i32.ge_u
                      br_if 0 (;@9;)
                      block  ;; label = @10
                        i32.const 0
                        i32.load offset=1052316
                        local.tee 0
                        local.get 3
                        i32.gt_u
                        br_if 0 (;@10;)
                        local.get 1
                        i32.const 4
                        i32.add
                        i32.const 1052348
                        local.get 3
                        i32.const 65583
                        i32.add
                        i32.const -65536
                        i32.and
                        call $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17h32bf5aa7613bca1cE
                        block  ;; label = @11
                          local.get 1
                          i32.load offset=4
                          local.tee 6
                          br_if 0 (;@11;)
                          i32.const 0
                          local.set 2
                          br 10 (;@1;)
                        end
                        local.get 1
                        i32.load offset=12
                        local.set 5
                        i32.const 0
                        i32.const 0
                        i32.load offset=1052328
                        local.get 1
                        i32.load offset=8
                        local.tee 9
                        i32.add
                        local.tee 0
                        i32.store offset=1052328
                        i32.const 0
                        i32.const 0
                        i32.load offset=1052332
                        local.tee 2
                        local.get 0
                        local.get 2
                        local.get 0
                        i32.gt_u
                        select
                        i32.store offset=1052332
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1052324
                              local.tee 2
                              i32.eqz
                              br_if 0 (;@13;)
                              i32.const 1052024
                              local.set 0
                              loop  ;; label = @14
                                local.get 6
                                local.get 0
                                i32.load
                                local.tee 7
                                local.get 0
                                i32.load offset=4
                                local.tee 8
                                i32.add
                                i32.eq
                                br_if 2 (;@12;)
                                local.get 0
                                i32.load offset=8
                                local.tee 0
                                br_if 0 (;@14;)
                                br 3 (;@11;)
                              end
                            end
                            block  ;; label = @13
                              block  ;; label = @14
                                i32.const 0
                                i32.load offset=1052340
                                local.tee 0
                                i32.eqz
                                br_if 0 (;@14;)
                                local.get 6
                                local.get 0
                                i32.ge_u
                                br_if 1 (;@13;)
                              end
                              i32.const 0
                              local.get 6
                              i32.store offset=1052340
                            end
                            i32.const 0
                            i32.const 4095
                            i32.store offset=1052344
                            i32.const 0
                            local.get 5
                            i32.store offset=1052036
                            i32.const 0
                            local.get 9
                            i32.store offset=1052028
                            i32.const 0
                            local.get 6
                            i32.store offset=1052024
                            i32.const 0
                            i32.const 1052040
                            i32.store offset=1052052
                            i32.const 0
                            i32.const 1052048
                            i32.store offset=1052060
                            i32.const 0
                            i32.const 1052040
                            i32.store offset=1052048
                            i32.const 0
                            i32.const 1052056
                            i32.store offset=1052068
                            i32.const 0
                            i32.const 1052048
                            i32.store offset=1052056
                            i32.const 0
                            i32.const 1052064
                            i32.store offset=1052076
                            i32.const 0
                            i32.const 1052056
                            i32.store offset=1052064
                            i32.const 0
                            i32.const 1052072
                            i32.store offset=1052084
                            i32.const 0
                            i32.const 1052064
                            i32.store offset=1052072
                            i32.const 0
                            i32.const 1052080
                            i32.store offset=1052092
                            i32.const 0
                            i32.const 1052072
                            i32.store offset=1052080
                            i32.const 0
                            i32.const 1052088
                            i32.store offset=1052100
                            i32.const 0
                            i32.const 1052080
                            i32.store offset=1052088
                            i32.const 0
                            i32.const 1052096
                            i32.store offset=1052108
                            i32.const 0
                            i32.const 1052088
                            i32.store offset=1052096
                            i32.const 0
                            i32.const 1052104
                            i32.store offset=1052116
                            i32.const 0
                            i32.const 1052096
                            i32.store offset=1052104
                            i32.const 0
                            i32.const 1052104
                            i32.store offset=1052112
                            i32.const 0
                            i32.const 1052112
                            i32.store offset=1052124
                            i32.const 0
                            i32.const 1052112
                            i32.store offset=1052120
                            i32.const 0
                            i32.const 1052120
                            i32.store offset=1052132
                            i32.const 0
                            i32.const 1052120
                            i32.store offset=1052128
                            i32.const 0
                            i32.const 1052128
                            i32.store offset=1052140
                            i32.const 0
                            i32.const 1052128
                            i32.store offset=1052136
                            i32.const 0
                            i32.const 1052136
                            i32.store offset=1052148
                            i32.const 0
                            i32.const 1052136
                            i32.store offset=1052144
                            i32.const 0
                            i32.const 1052144
                            i32.store offset=1052156
                            i32.const 0
                            i32.const 1052144
                            i32.store offset=1052152
                            i32.const 0
                            i32.const 1052152
                            i32.store offset=1052164
                            i32.const 0
                            i32.const 1052152
                            i32.store offset=1052160
                            i32.const 0
                            i32.const 1052160
                            i32.store offset=1052172
                            i32.const 0
                            i32.const 1052160
                            i32.store offset=1052168
                            i32.const 0
                            i32.const 1052168
                            i32.store offset=1052180
                            i32.const 0
                            i32.const 1052176
                            i32.store offset=1052188
                            i32.const 0
                            i32.const 1052168
                            i32.store offset=1052176
                            i32.const 0
                            i32.const 1052184
                            i32.store offset=1052196
                            i32.const 0
                            i32.const 1052176
                            i32.store offset=1052184
                            i32.const 0
                            i32.const 1052192
                            i32.store offset=1052204
                            i32.const 0
                            i32.const 1052184
                            i32.store offset=1052192
                            i32.const 0
                            i32.const 1052200
                            i32.store offset=1052212
                            i32.const 0
                            i32.const 1052192
                            i32.store offset=1052200
                            i32.const 0
                            i32.const 1052208
                            i32.store offset=1052220
                            i32.const 0
                            i32.const 1052200
                            i32.store offset=1052208
                            i32.const 0
                            i32.const 1052216
                            i32.store offset=1052228
                            i32.const 0
                            i32.const 1052208
                            i32.store offset=1052216
                            i32.const 0
                            i32.const 1052224
                            i32.store offset=1052236
                            i32.const 0
                            i32.const 1052216
                            i32.store offset=1052224
                            i32.const 0
                            i32.const 1052232
                            i32.store offset=1052244
                            i32.const 0
                            i32.const 1052224
                            i32.store offset=1052232
                            i32.const 0
                            i32.const 1052240
                            i32.store offset=1052252
                            i32.const 0
                            i32.const 1052232
                            i32.store offset=1052240
                            i32.const 0
                            i32.const 1052248
                            i32.store offset=1052260
                            i32.const 0
                            i32.const 1052240
                            i32.store offset=1052248
                            i32.const 0
                            i32.const 1052256
                            i32.store offset=1052268
                            i32.const 0
                            i32.const 1052248
                            i32.store offset=1052256
                            i32.const 0
                            i32.const 1052264
                            i32.store offset=1052276
                            i32.const 0
                            i32.const 1052256
                            i32.store offset=1052264
                            i32.const 0
                            i32.const 1052272
                            i32.store offset=1052284
                            i32.const 0
                            i32.const 1052264
                            i32.store offset=1052272
                            i32.const 0
                            i32.const 1052280
                            i32.store offset=1052292
                            i32.const 0
                            i32.const 1052272
                            i32.store offset=1052280
                            i32.const 0
                            i32.const 1052288
                            i32.store offset=1052300
                            i32.const 0
                            i32.const 1052280
                            i32.store offset=1052288
                            i32.const 0
                            local.get 6
                            i32.const 15
                            i32.add
                            i32.const -8
                            i32.and
                            local.tee 0
                            i32.const -8
                            i32.add
                            local.tee 2
                            i32.store offset=1052324
                            i32.const 0
                            i32.const 1052288
                            i32.store offset=1052296
                            i32.const 0
                            local.get 6
                            local.get 0
                            i32.sub
                            local.get 9
                            i32.const -40
                            i32.add
                            local.tee 0
                            i32.add
                            i32.const 8
                            i32.add
                            local.tee 7
                            i32.store offset=1052316
                            local.get 2
                            local.get 7
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            local.get 6
                            local.get 0
                            i32.add
                            i32.const 40
                            i32.store offset=4
                            i32.const 0
                            i32.const 2097152
                            i32.store offset=1052336
                            br 8 (;@4;)
                          end
                          local.get 2
                          local.get 6
                          i32.ge_u
                          br_if 0 (;@11;)
                          local.get 7
                          local.get 2
                          i32.gt_u
                          br_if 0 (;@11;)
                          local.get 0
                          i32.load offset=12
                          local.tee 7
                          i32.const 1
                          i32.and
                          br_if 0 (;@11;)
                          local.get 7
                          i32.const 1
                          i32.shr_u
                          local.get 5
                          i32.eq
                          br_if 3 (;@8;)
                        end
                        i32.const 0
                        i32.const 0
                        i32.load offset=1052340
                        local.tee 0
                        local.get 6
                        local.get 6
                        local.get 0
                        i32.gt_u
                        select
                        i32.store offset=1052340
                        local.get 6
                        local.get 9
                        i32.add
                        local.set 7
                        i32.const 1052024
                        local.set 0
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              loop  ;; label = @14
                                local.get 0
                                i32.load
                                local.get 7
                                i32.eq
                                br_if 1 (;@13;)
                                local.get 0
                                i32.load offset=8
                                local.tee 0
                                br_if 0 (;@14;)
                                br 2 (;@12;)
                              end
                            end
                            local.get 0
                            i32.load offset=12
                            local.tee 8
                            i32.const 1
                            i32.and
                            br_if 0 (;@12;)
                            local.get 8
                            i32.const 1
                            i32.shr_u
                            local.get 5
                            i32.eq
                            br_if 1 (;@11;)
                          end
                          i32.const 1052024
                          local.set 0
                          block  ;; label = @12
                            loop  ;; label = @13
                              block  ;; label = @14
                                local.get 0
                                i32.load
                                local.tee 7
                                local.get 2
                                i32.gt_u
                                br_if 0 (;@14;)
                                local.get 7
                                local.get 0
                                i32.load offset=4
                                i32.add
                                local.tee 7
                                local.get 2
                                i32.gt_u
                                br_if 2 (;@12;)
                              end
                              local.get 0
                              i32.load offset=8
                              local.set 0
                              br 0 (;@13;)
                            end
                          end
                          i32.const 0
                          local.get 6
                          i32.const 15
                          i32.add
                          i32.const -8
                          i32.and
                          local.tee 0
                          i32.const -8
                          i32.add
                          local.tee 8
                          i32.store offset=1052324
                          i32.const 0
                          local.get 6
                          local.get 0
                          i32.sub
                          local.get 9
                          i32.const -40
                          i32.add
                          local.tee 0
                          i32.add
                          i32.const 8
                          i32.add
                          local.tee 4
                          i32.store offset=1052316
                          local.get 8
                          local.get 4
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 6
                          local.get 0
                          i32.add
                          i32.const 40
                          i32.store offset=4
                          i32.const 0
                          i32.const 2097152
                          i32.store offset=1052336
                          local.get 2
                          local.get 7
                          i32.const -32
                          i32.add
                          i32.const -8
                          i32.and
                          i32.const -8
                          i32.add
                          local.tee 0
                          local.get 0
                          local.get 2
                          i32.const 16
                          i32.add
                          i32.lt_u
                          select
                          local.tee 8
                          i32.const 27
                          i32.store offset=4
                          i32.const 0
                          i64.load offset=1052024 align=4
                          local.set 10
                          local.get 8
                          i32.const 16
                          i32.add
                          i32.const 0
                          i64.load offset=1052032 align=4
                          i64.store align=4
                          local.get 8
                          local.get 10
                          i64.store offset=8 align=4
                          i32.const 0
                          local.get 5
                          i32.store offset=1052036
                          i32.const 0
                          local.get 9
                          i32.store offset=1052028
                          i32.const 0
                          local.get 6
                          i32.store offset=1052024
                          i32.const 0
                          local.get 8
                          i32.const 8
                          i32.add
                          i32.store offset=1052032
                          local.get 8
                          i32.const 28
                          i32.add
                          local.set 0
                          loop  ;; label = @12
                            local.get 0
                            i32.const 7
                            i32.store
                            local.get 0
                            i32.const 4
                            i32.add
                            local.tee 0
                            local.get 7
                            i32.lt_u
                            br_if 0 (;@12;)
                          end
                          local.get 8
                          local.get 2
                          i32.eq
                          br_if 7 (;@4;)
                          local.get 8
                          local.get 8
                          i32.load offset=4
                          i32.const -2
                          i32.and
                          i32.store offset=4
                          local.get 2
                          local.get 8
                          local.get 2
                          i32.sub
                          local.tee 0
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 8
                          local.get 0
                          i32.store
                          block  ;; label = @12
                            local.get 0
                            i32.const 256
                            i32.lt_u
                            br_if 0 (;@12;)
                            local.get 2
                            local.get 0
                            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h67b2ff06c0e8b9e0E
                            br 8 (;@4;)
                          end
                          local.get 0
                          i32.const -8
                          i32.and
                          i32.const 1052040
                          i32.add
                          local.set 7
                          block  ;; label = @12
                            block  ;; label = @13
                              i32.const 0
                              i32.load offset=1052304
                              local.tee 6
                              i32.const 1
                              local.get 0
                              i32.const 3
                              i32.shr_u
                              i32.shl
                              local.tee 0
                              i32.and
                              br_if 0 (;@13;)
                              i32.const 0
                              local.get 6
                              local.get 0
                              i32.or
                              i32.store offset=1052304
                              local.get 7
                              local.set 0
                              br 1 (;@12;)
                            end
                            local.get 7
                            i32.load offset=8
                            local.set 0
                          end
                          local.get 7
                          local.get 2
                          i32.store offset=8
                          local.get 0
                          local.get 2
                          i32.store offset=12
                          local.get 2
                          local.get 7
                          i32.store offset=12
                          local.get 2
                          local.get 0
                          i32.store offset=8
                          br 7 (;@4;)
                        end
                        local.get 0
                        local.get 6
                        i32.store
                        local.get 0
                        local.get 0
                        i32.load offset=4
                        local.get 9
                        i32.add
                        i32.store offset=4
                        local.get 6
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        i32.const -8
                        i32.add
                        local.tee 6
                        local.get 3
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 7
                        i32.const 15
                        i32.add
                        i32.const -8
                        i32.and
                        i32.const -8
                        i32.add
                        local.tee 2
                        local.get 6
                        local.get 3
                        i32.add
                        local.tee 0
                        i32.sub
                        local.set 3
                        local.get 2
                        i32.const 0
                        i32.load offset=1052324
                        i32.eq
                        br_if 3 (;@7;)
                        local.get 2
                        i32.const 0
                        i32.load offset=1052320
                        i32.eq
                        br_if 4 (;@6;)
                        block  ;; label = @11
                          local.get 2
                          i32.load offset=4
                          local.tee 7
                          i32.const 3
                          i32.and
                          i32.const 1
                          i32.ne
                          br_if 0 (;@11;)
                          local.get 2
                          local.get 7
                          i32.const -8
                          i32.and
                          local.tee 7
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE
                          local.get 7
                          local.get 3
                          i32.add
                          local.set 3
                          local.get 2
                          local.get 7
                          i32.add
                          local.tee 2
                          i32.load offset=4
                          local.set 7
                        end
                        local.get 2
                        local.get 7
                        i32.const -2
                        i32.and
                        i32.store offset=4
                        local.get 0
                        local.get 3
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        local.get 0
                        local.get 3
                        i32.add
                        local.get 3
                        i32.store
                        block  ;; label = @11
                          local.get 3
                          i32.const 256
                          i32.lt_u
                          br_if 0 (;@11;)
                          local.get 0
                          local.get 3
                          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h67b2ff06c0e8b9e0E
                          br 6 (;@5;)
                        end
                        local.get 3
                        i32.const -8
                        i32.and
                        i32.const 1052040
                        i32.add
                        local.set 2
                        block  ;; label = @11
                          block  ;; label = @12
                            i32.const 0
                            i32.load offset=1052304
                            local.tee 7
                            i32.const 1
                            local.get 3
                            i32.const 3
                            i32.shr_u
                            i32.shl
                            local.tee 3
                            i32.and
                            br_if 0 (;@12;)
                            i32.const 0
                            local.get 7
                            local.get 3
                            i32.or
                            i32.store offset=1052304
                            local.get 2
                            local.set 3
                            br 1 (;@11;)
                          end
                          local.get 2
                          i32.load offset=8
                          local.set 3
                        end
                        local.get 2
                        local.get 0
                        i32.store offset=8
                        local.get 3
                        local.get 0
                        i32.store offset=12
                        local.get 0
                        local.get 2
                        i32.store offset=12
                        local.get 0
                        local.get 3
                        i32.store offset=8
                        br 5 (;@5;)
                      end
                      i32.const 0
                      local.get 0
                      local.get 3
                      i32.sub
                      local.tee 2
                      i32.store offset=1052316
                      i32.const 0
                      i32.const 0
                      i32.load offset=1052324
                      local.tee 0
                      local.get 3
                      i32.add
                      local.tee 7
                      i32.store offset=1052324
                      local.get 7
                      local.get 2
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 0
                      local.get 3
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 0
                      i32.const 8
                      i32.add
                      local.set 2
                      br 8 (;@1;)
                    end
                    i32.const 0
                    i32.load offset=1052320
                    local.set 2
                    block  ;; label = @9
                      block  ;; label = @10
                        local.get 0
                        local.get 3
                        i32.sub
                        local.tee 7
                        i32.const 15
                        i32.gt_u
                        br_if 0 (;@10;)
                        i32.const 0
                        i32.const 0
                        i32.store offset=1052320
                        i32.const 0
                        i32.const 0
                        i32.store offset=1052312
                        local.get 2
                        local.get 0
                        i32.const 3
                        i32.or
                        i32.store offset=4
                        local.get 2
                        local.get 0
                        i32.add
                        local.tee 0
                        local.get 0
                        i32.load offset=4
                        i32.const 1
                        i32.or
                        i32.store offset=4
                        br 1 (;@9;)
                      end
                      i32.const 0
                      local.get 7
                      i32.store offset=1052312
                      i32.const 0
                      local.get 2
                      local.get 3
                      i32.add
                      local.tee 6
                      i32.store offset=1052320
                      local.get 6
                      local.get 7
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 2
                      local.get 0
                      i32.add
                      local.get 7
                      i32.store
                      local.get 2
                      local.get 3
                      i32.const 3
                      i32.or
                      i32.store offset=4
                    end
                    local.get 2
                    i32.const 8
                    i32.add
                    local.set 2
                    br 7 (;@1;)
                  end
                  local.get 0
                  local.get 8
                  local.get 9
                  i32.add
                  i32.store offset=4
                  i32.const 0
                  i32.const 0
                  i32.load offset=1052324
                  local.tee 0
                  i32.const 15
                  i32.add
                  i32.const -8
                  i32.and
                  local.tee 2
                  i32.const -8
                  i32.add
                  local.tee 7
                  i32.store offset=1052324
                  i32.const 0
                  local.get 0
                  local.get 2
                  i32.sub
                  i32.const 0
                  i32.load offset=1052316
                  local.get 9
                  i32.add
                  local.tee 2
                  i32.add
                  i32.const 8
                  i32.add
                  local.tee 6
                  i32.store offset=1052316
                  local.get 7
                  local.get 6
                  i32.const 1
                  i32.or
                  i32.store offset=4
                  local.get 0
                  local.get 2
                  i32.add
                  i32.const 40
                  i32.store offset=4
                  i32.const 0
                  i32.const 2097152
                  i32.store offset=1052336
                  br 3 (;@4;)
                end
                i32.const 0
                local.get 0
                i32.store offset=1052324
                i32.const 0
                i32.const 0
                i32.load offset=1052316
                local.get 3
                i32.add
                local.tee 3
                i32.store offset=1052316
                local.get 0
                local.get 3
                i32.const 1
                i32.or
                i32.store offset=4
                br 1 (;@5;)
              end
              i32.const 0
              local.get 0
              i32.store offset=1052320
              i32.const 0
              i32.const 0
              i32.load offset=1052312
              local.get 3
              i32.add
              local.tee 3
              i32.store offset=1052312
              local.get 0
              local.get 3
              i32.const 1
              i32.or
              i32.store offset=4
              local.get 0
              local.get 3
              i32.add
              local.get 3
              i32.store
            end
            local.get 6
            i32.const 8
            i32.add
            local.set 2
            br 3 (;@1;)
          end
          i32.const 0
          local.set 2
          i32.const 0
          i32.load offset=1052316
          local.tee 0
          local.get 3
          i32.le_u
          br_if 2 (;@1;)
          i32.const 0
          local.get 0
          local.get 3
          i32.sub
          local.tee 2
          i32.store offset=1052316
          i32.const 0
          i32.const 0
          i32.load offset=1052324
          local.tee 0
          local.get 3
          i32.add
          local.tee 7
          i32.store offset=1052324
          local.get 7
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 3
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 0
          i32.const 8
          i32.add
          local.set 2
          br 2 (;@1;)
        end
        local.get 0
        local.get 5
        i32.store offset=24
        block  ;; label = @3
          local.get 7
          i32.load offset=16
          local.tee 6
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 6
          i32.store offset=16
          local.get 6
          local.get 0
          i32.store offset=24
        end
        local.get 7
        i32.load offset=20
        local.tee 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        local.get 6
        i32.store offset=20
        local.get 6
        local.get 0
        i32.store offset=24
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 7
          local.get 3
          i32.const 3
          i32.or
          i32.store offset=4
          local.get 7
          local.get 3
          i32.add
          local.tee 0
          local.get 2
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 0
          local.get 2
          i32.add
          local.get 2
          i32.store
          block  ;; label = @4
            local.get 2
            i32.const 256
            i32.lt_u
            br_if 0 (;@4;)
            local.get 0
            local.get 2
            call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$18insert_large_chunk17h67b2ff06c0e8b9e0E
            br 2 (;@2;)
          end
          local.get 2
          i32.const -8
          i32.and
          i32.const 1052040
          i32.add
          local.set 3
          block  ;; label = @4
            block  ;; label = @5
              i32.const 0
              i32.load offset=1052304
              local.tee 6
              i32.const 1
              local.get 2
              i32.const 3
              i32.shr_u
              i32.shl
              local.tee 2
              i32.and
              br_if 0 (;@5;)
              i32.const 0
              local.get 6
              local.get 2
              i32.or
              i32.store offset=1052304
              local.get 3
              local.set 2
              br 1 (;@4;)
            end
            local.get 3
            i32.load offset=8
            local.set 2
          end
          local.get 3
          local.get 0
          i32.store offset=8
          local.get 2
          local.get 0
          i32.store offset=12
          local.get 0
          local.get 3
          i32.store offset=12
          local.get 0
          local.get 2
          i32.store offset=8
          br 1 (;@2;)
        end
        local.get 7
        local.get 2
        local.get 3
        i32.add
        local.tee 0
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 7
        local.get 0
        i32.add
        local.tee 0
        local.get 0
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
      end
      local.get 7
      i32.const 8
      i32.add
      local.set 2
    end
    local.get 1
    i32.const 16
    i32.add
    global.set $__stack_pointer
    local.get 2)
  (func $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17hae661cd81f1d1708E (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 0
    local.set 2
    block  ;; label = @1
      i32.const -65587
      local.get 0
      i32.const 16
      local.get 0
      i32.const 16
      i32.gt_u
      select
      local.tee 0
      i32.sub
      local.get 1
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      local.get 1
      i32.const 11
      i32.add
      i32.const -8
      i32.and
      local.get 1
      i32.const 11
      i32.lt_u
      select
      local.tee 3
      i32.add
      i32.const 12
      i32.add
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0483a0dc0f5e490bE
      local.tee 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 1
      i32.const -8
      i32.add
      local.set 2
      block  ;; label = @2
        block  ;; label = @3
          local.get 0
          i32.const -1
          i32.add
          local.tee 4
          local.get 1
          i32.and
          br_if 0 (;@3;)
          local.get 2
          local.set 0
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.add
        local.tee 5
        i32.load
        local.tee 6
        i32.const -8
        i32.and
        local.get 4
        local.get 1
        i32.add
        i32.const 0
        local.get 0
        i32.sub
        i32.and
        i32.const -8
        i32.add
        local.tee 1
        i32.const 0
        local.get 0
        local.get 1
        local.get 2
        i32.sub
        i32.const 16
        i32.gt_u
        select
        i32.add
        local.tee 0
        local.get 2
        i32.sub
        local.tee 1
        i32.sub
        local.set 4
        block  ;; label = @3
          local.get 6
          i32.const 3
          i32.and
          i32.eqz
          br_if 0 (;@3;)
          local.get 0
          local.get 4
          local.get 0
          i32.load offset=4
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store offset=4
          local.get 0
          local.get 4
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 5
          local.get 1
          local.get 5
          i32.load
          i32.const 1
          i32.and
          i32.or
          i32.const 2
          i32.or
          i32.store
          local.get 2
          local.get 1
          i32.add
          local.tee 4
          local.get 4
          i32.load offset=4
          i32.const 1
          i32.or
          i32.store offset=4
          local.get 2
          local.get 1
          call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc51238bb547bf9d7E
          br 1 (;@2;)
        end
        local.get 2
        i32.load
        local.set 2
        local.get 0
        local.get 4
        i32.store offset=4
        local.get 0
        local.get 2
        local.get 1
        i32.add
        i32.store
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 1
        i32.const 3
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        i32.const -8
        i32.and
        local.tee 2
        local.get 3
        i32.const 16
        i32.add
        i32.le_u
        br_if 0 (;@2;)
        local.get 0
        local.get 3
        local.get 1
        i32.const 1
        i32.and
        i32.or
        i32.const 2
        i32.or
        i32.store offset=4
        local.get 0
        local.get 3
        i32.add
        local.tee 1
        local.get 2
        local.get 3
        i32.sub
        local.tee 3
        i32.const 3
        i32.or
        i32.store offset=4
        local.get 0
        local.get 2
        i32.add
        local.tee 2
        local.get 2
        i32.load offset=4
        i32.const 1
        i32.or
        i32.store offset=4
        local.get 1
        local.get 3
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc51238bb547bf9d7E
      end
      local.get 0
      i32.const 8
      i32.add
      local.set 2
    end
    local.get 2)
  (func $_ZN3std7process5abort17h38dc887bf8ba17f6E (type 11)
    unreachable
    unreachable)
  (func $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hbdf3ddeb21a1e747E (type 1) (param i32)
    local.get 0
    call $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17hb6cd8464ed39ae71E
    unreachable)
  (func $_ZN3std9panicking19begin_panic_handler28_$u7b$$u7b$closure$u7d$$u7d$17hb6cd8464ed39ae71E (type 1) (param i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.tee 2
    i32.load offset=12
    local.set 3
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.load offset=4
            br_table 0 (;@4;) 1 (;@3;) 2 (;@2;)
          end
          local.get 3
          br_if 1 (;@2;)
          i32.const 1
          local.set 2
          i32.const 0
          local.set 3
          br 2 (;@1;)
        end
        local.get 3
        br_if 0 (;@2;)
        local.get 2
        i32.load
        local.tee 2
        i32.load offset=4
        local.set 3
        local.get 2
        i32.load
        local.set 2
        br 1 (;@1;)
      end
      local.get 1
      local.get 2
      i32.store offset=12
      local.get 1
      i32.const -2147483648
      i32.store
      local.get 1
      i32.const 1051272
      local.get 0
      i32.load offset=4
      local.tee 2
      i32.load offset=8
      local.get 0
      i32.load offset=8
      local.get 2
      i32.load8_u offset=16
      local.get 2
      i32.load8_u offset=17
      call $_ZN3std9panicking20rust_panic_with_hook17h6731baa78621a747E
      unreachable
    end
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 2
    i32.store
    local.get 1
    i32.const 1051252
    local.get 0
    i32.load offset=4
    local.tee 2
    i32.load offset=8
    local.get 0
    i32.load offset=8
    local.get 2
    i32.load8_u offset=16
    local.get 2
    i32.load8_u offset=17
    call $_ZN3std9panicking20rust_panic_with_hook17h6731baa78621a747E
    unreachable)
  (func $_ZN3std5alloc24default_alloc_error_hook17h9d6d7bb51d97ec4fE (type 4) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      i32.const 0
      i32.load8_u offset=1051872
      i32.eqz
      br_if 0 (;@1;)
      local.get 2
      i32.const 2
      i32.store offset=12
      local.get 2
      i32.const 1051120
      i32.store offset=8
      local.get 2
      i64.const 1
      i64.store offset=20 align=4
      local.get 2
      local.get 1
      i32.store offset=44
      local.get 2
      i32.const 37
      i64.extend_i32_u
      i64.const 32
      i64.shl
      local.get 2
      i32.const 44
      i32.add
      i64.extend_i32_u
      i64.or
      i64.store offset=32
      local.get 2
      local.get 2
      i32.const 32
      i32.add
      i32.store offset=16
      local.get 2
      i32.const 8
      i32.add
      i32.const 1051160
      call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
      unreachable
    end
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $__rdl_alloc (type 6) (param i32 i32) (result i32)
    block  ;; label = @1
      local.get 1
      i32.const 9
      i32.lt_u
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17hae661cd81f1d1708E
      return
    end
    local.get 0
    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0483a0dc0f5e490bE)
  (func $__rdl_dealloc (type 0) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.const -4
        i32.add
        i32.load
        local.tee 3
        i32.const -8
        i32.and
        local.tee 4
        i32.const 4
        i32.const 8
        local.get 3
        i32.const 3
        i32.and
        local.tee 3
        select
        local.get 1
        i32.add
        i32.lt_u
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 3
          i32.eqz
          br_if 0 (;@3;)
          local.get 4
          local.get 1
          i32.const 39
          i32.add
          i32.gt_u
          br_if 2 (;@1;)
        end
        local.get 0
        call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h21bf9d7572bd86f3E
        return
      end
      i32.const 1050957
      i32.const 46
      i32.const 1051004
      call $_ZN4core9panicking5panic17h3b99507adb69386aE
      unreachable
    end
    i32.const 1051020
    i32.const 46
    i32.const 1051068
    call $_ZN4core9panicking5panic17h3b99507adb69386aE
    unreachable)
  (func $__rdl_realloc (type 9) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const -4
              i32.add
              local.tee 4
              i32.load
              local.tee 5
              i32.const -8
              i32.and
              local.tee 6
              i32.const 4
              i32.const 8
              local.get 5
              i32.const 3
              i32.and
              local.tee 7
              select
              local.get 1
              i32.add
              i32.lt_u
              br_if 0 (;@5;)
              local.get 1
              i32.const 39
              i32.add
              local.set 8
              block  ;; label = @6
                local.get 7
                i32.eqz
                br_if 0 (;@6;)
                local.get 6
                local.get 8
                i32.gt_u
                br_if 2 (;@4;)
              end
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 2
                    i32.const 9
                    i32.lt_u
                    br_if 0 (;@8;)
                    local.get 2
                    local.get 3
                    call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$8memalign17hae661cd81f1d1708E
                    local.tee 2
                    br_if 1 (;@7;)
                    i32.const 0
                    return
                  end
                  i32.const 0
                  local.set 2
                  local.get 3
                  i32.const -65588
                  i32.gt_u
                  br_if 1 (;@6;)
                  i32.const 16
                  local.get 3
                  i32.const 11
                  i32.add
                  i32.const -8
                  i32.and
                  local.get 3
                  i32.const 11
                  i32.lt_u
                  select
                  local.set 1
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 7
                      br_if 0 (;@9;)
                      local.get 1
                      i32.const 256
                      i32.lt_u
                      br_if 1 (;@8;)
                      local.get 6
                      local.get 1
                      i32.const 4
                      i32.or
                      i32.lt_u
                      br_if 1 (;@8;)
                      local.get 6
                      local.get 1
                      i32.sub
                      i32.const 131073
                      i32.ge_u
                      br_if 1 (;@8;)
                      local.get 0
                      return
                    end
                    local.get 0
                    i32.const -8
                    i32.add
                    local.tee 8
                    local.get 6
                    i32.add
                    local.set 7
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              local.get 6
                              local.get 1
                              i32.ge_u
                              br_if 0 (;@13;)
                              local.get 7
                              i32.const 0
                              i32.load offset=1052324
                              i32.eq
                              br_if 4 (;@9;)
                              local.get 7
                              i32.const 0
                              i32.load offset=1052320
                              i32.eq
                              br_if 2 (;@11;)
                              local.get 7
                              i32.load offset=4
                              local.tee 5
                              i32.const 2
                              i32.and
                              br_if 5 (;@8;)
                              local.get 5
                              i32.const -8
                              i32.and
                              local.tee 9
                              local.get 6
                              i32.add
                              local.tee 5
                              local.get 1
                              i32.lt_u
                              br_if 5 (;@8;)
                              local.get 7
                              local.get 9
                              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$12unlink_chunk17h8d0d81757dd7de5dE
                              local.get 5
                              local.get 1
                              i32.sub
                              local.tee 3
                              i32.const 16
                              i32.lt_u
                              br_if 1 (;@12;)
                              local.get 4
                              local.get 1
                              local.get 4
                              i32.load
                              i32.const 1
                              i32.and
                              i32.or
                              i32.const 2
                              i32.or
                              i32.store
                              local.get 8
                              local.get 1
                              i32.add
                              local.tee 1
                              local.get 3
                              i32.const 3
                              i32.or
                              i32.store offset=4
                              local.get 8
                              local.get 5
                              i32.add
                              local.tee 2
                              local.get 2
                              i32.load offset=4
                              i32.const 1
                              i32.or
                              i32.store offset=4
                              local.get 1
                              local.get 3
                              call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc51238bb547bf9d7E
                              local.get 0
                              return
                            end
                            local.get 6
                            local.get 1
                            i32.sub
                            local.tee 3
                            i32.const 15
                            i32.gt_u
                            br_if 2 (;@10;)
                            local.get 0
                            return
                          end
                          local.get 4
                          local.get 5
                          local.get 4
                          i32.load
                          i32.const 1
                          i32.and
                          i32.or
                          i32.const 2
                          i32.or
                          i32.store
                          local.get 8
                          local.get 5
                          i32.add
                          local.tee 1
                          local.get 1
                          i32.load offset=4
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 0
                          return
                        end
                        i32.const 0
                        i32.load offset=1052312
                        local.get 6
                        i32.add
                        local.tee 7
                        local.get 1
                        i32.lt_u
                        br_if 2 (;@8;)
                        block  ;; label = @11
                          block  ;; label = @12
                            local.get 7
                            local.get 1
                            i32.sub
                            local.tee 3
                            i32.const 15
                            i32.gt_u
                            br_if 0 (;@12;)
                            local.get 4
                            local.get 5
                            i32.const 1
                            i32.and
                            local.get 7
                            i32.or
                            i32.const 2
                            i32.or
                            i32.store
                            local.get 8
                            local.get 7
                            i32.add
                            local.tee 1
                            local.get 1
                            i32.load offset=4
                            i32.const 1
                            i32.or
                            i32.store offset=4
                            i32.const 0
                            local.set 3
                            i32.const 0
                            local.set 1
                            br 1 (;@11;)
                          end
                          local.get 4
                          local.get 1
                          local.get 5
                          i32.const 1
                          i32.and
                          i32.or
                          i32.const 2
                          i32.or
                          i32.store
                          local.get 8
                          local.get 1
                          i32.add
                          local.tee 1
                          local.get 3
                          i32.const 1
                          i32.or
                          i32.store offset=4
                          local.get 8
                          local.get 7
                          i32.add
                          local.tee 2
                          local.get 3
                          i32.store
                          local.get 2
                          local.get 2
                          i32.load offset=4
                          i32.const -2
                          i32.and
                          i32.store offset=4
                        end
                        i32.const 0
                        local.get 1
                        i32.store offset=1052320
                        i32.const 0
                        local.get 3
                        i32.store offset=1052312
                        local.get 0
                        return
                      end
                      local.get 4
                      local.get 1
                      local.get 5
                      i32.const 1
                      i32.and
                      i32.or
                      i32.const 2
                      i32.or
                      i32.store
                      local.get 8
                      local.get 1
                      i32.add
                      local.tee 1
                      local.get 3
                      i32.const 3
                      i32.or
                      i32.store offset=4
                      local.get 7
                      local.get 7
                      i32.load offset=4
                      i32.const 1
                      i32.or
                      i32.store offset=4
                      local.get 1
                      local.get 3
                      call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$13dispose_chunk17hc51238bb547bf9d7E
                      local.get 0
                      return
                    end
                    i32.const 0
                    i32.load offset=1052316
                    local.get 6
                    i32.add
                    local.tee 7
                    local.get 1
                    i32.gt_u
                    br_if 7 (;@1;)
                  end
                  local.get 3
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$6malloc17h0483a0dc0f5e490bE
                  local.tee 1
                  i32.eqz
                  br_if 1 (;@6;)
                  local.get 1
                  local.get 0
                  i32.const -4
                  i32.const -8
                  local.get 4
                  i32.load
                  local.tee 2
                  i32.const 3
                  i32.and
                  select
                  local.get 2
                  i32.const -8
                  i32.and
                  i32.add
                  local.tee 2
                  local.get 3
                  local.get 2
                  local.get 3
                  i32.lt_u
                  select
                  call $memcpy
                  local.set 1
                  local.get 0
                  call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h21bf9d7572bd86f3E
                  local.get 1
                  return
                end
                local.get 2
                local.get 0
                local.get 1
                local.get 3
                local.get 1
                local.get 3
                i32.lt_u
                select
                call $memcpy
                drop
                local.get 4
                i32.load
                local.tee 3
                i32.const -8
                i32.and
                local.tee 7
                i32.const 4
                i32.const 8
                local.get 3
                i32.const 3
                i32.and
                local.tee 3
                select
                local.get 1
                i32.add
                i32.lt_u
                br_if 3 (;@3;)
                block  ;; label = @7
                  local.get 3
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 7
                  local.get 8
                  i32.gt_u
                  br_if 5 (;@2;)
                end
                local.get 0
                call $_ZN8dlmalloc8dlmalloc17Dlmalloc$LT$A$GT$4free17h21bf9d7572bd86f3E
              end
              local.get 2
              return
            end
            i32.const 1050957
            i32.const 46
            i32.const 1051004
            call $_ZN4core9panicking5panic17h3b99507adb69386aE
            unreachable
          end
          i32.const 1051020
          i32.const 46
          i32.const 1051068
          call $_ZN4core9panicking5panic17h3b99507adb69386aE
          unreachable
        end
        i32.const 1050957
        i32.const 46
        i32.const 1051004
        call $_ZN4core9panicking5panic17h3b99507adb69386aE
        unreachable
      end
      i32.const 1051020
      i32.const 46
      i32.const 1051068
      call $_ZN4core9panicking5panic17h3b99507adb69386aE
      unreachable
    end
    local.get 4
    local.get 1
    local.get 5
    i32.const 1
    i32.and
    i32.or
    i32.const 2
    i32.or
    i32.store
    local.get 8
    local.get 1
    i32.add
    local.tee 3
    local.get 7
    local.get 1
    i32.sub
    local.tee 1
    i32.const 1
    i32.or
    i32.store offset=4
    i32.const 0
    local.get 1
    i32.store offset=1052316
    i32.const 0
    local.get 3
    i32.store offset=1052324
    local.get 0)
  (func $rust_begin_unwind (type 1) (param i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 0
      i32.load offset=8
      local.tee 2
      br_if 0 (;@1;)
      i32.const 1051204
      call $_ZN4core6option13unwrap_failed17h0d060778de0f79e8E
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=12
    i32.store offset=12
    local.get 1
    local.get 0
    i32.store offset=8
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 4
    i32.add
    call $_ZN3std10sys_common9backtrace26__rust_end_short_backtrace17hbdf3ddeb21a1e747E
    unreachable)
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17he725486881b42bbeE (type 4) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 36
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=36 align=4
      local.get 2
      i32.const 36
      i32.add
      i32.const 1050892
      local.get 3
      call $_ZN4core3fmt5write17hbee61cd3fb7b52a3E
      drop
      local.get 2
      i32.const 24
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=36 align=4
      local.tee 5
      i64.store offset=24
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 1
    i64.load align=4
    local.set 5
    local.get 1
    i64.const 4294967296
    i64.store align=4
    local.get 2
    i32.const 8
    i32.add
    i32.const 8
    i32.add
    local.tee 3
    local.get 1
    i32.const 8
    i32.add
    local.tee 1
    i32.load
    i32.store
    local.get 1
    i32.const 0
    i32.store
    i32.const 0
    i32.load8_u offset=1051873
    drop
    local.get 2
    local.get 5
    i64.store offset=8
    block  ;; label = @1
      i32.const 12
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 12
      call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
      unreachable
    end
    local.get 1
    local.get 2
    i64.load offset=8
    i64.store align=4
    local.get 1
    i32.const 8
    i32.add
    local.get 3
    i32.load
    i32.store
    local.get 0
    i32.const 1051220
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 48
    i32.add
    global.set $__stack_pointer)
  (func $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17ha699b76f30386534E (type 4) (param i32 i32)
    (local i32 i32 i32 i64)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    block  ;; label = @1
      local.get 1
      i32.load
      i32.const -2147483648
      i32.ne
      br_if 0 (;@1;)
      local.get 1
      i32.load offset=12
      local.set 3
      local.get 2
      i32.const 20
      i32.add
      i32.const 8
      i32.add
      local.tee 4
      i32.const 0
      i32.store
      local.get 2
      i64.const 4294967296
      i64.store offset=20 align=4
      local.get 2
      i32.const 20
      i32.add
      i32.const 1050892
      local.get 3
      call $_ZN4core3fmt5write17hbee61cd3fb7b52a3E
      drop
      local.get 2
      i32.const 8
      i32.add
      i32.const 8
      i32.add
      local.get 4
      i32.load
      local.tee 3
      i32.store
      local.get 2
      local.get 2
      i64.load offset=20 align=4
      local.tee 5
      i64.store offset=8
      local.get 1
      i32.const 8
      i32.add
      local.get 3
      i32.store
      local.get 1
      local.get 5
      i64.store align=4
    end
    local.get 0
    i32.const 1051220
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 2
    i32.const 32
    i32.add
    global.set $__stack_pointer)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h00db27ffc0f86bc9E (type 4) (param i32 i32)
    (local i32 i32)
    i32.const 0
    i32.load8_u offset=1051873
    drop
    local.get 1
    i32.load offset=4
    local.set 2
    local.get 1
    i32.load
    local.set 3
    block  ;; label = @1
      i32.const 8
      i32.const 4
      call $__rust_alloc
      local.tee 1
      br_if 0 (;@1;)
      i32.const 4
      i32.const 8
      call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
      unreachable
    end
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    local.get 3
    i32.store
    local.get 0
    i32.const 1051236
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h25e87be0acf0cba3E (type 4) (param i32 i32)
    local.get 0
    i32.const 1051236
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store)
  (func $_ZN3std9panicking20rust_panic_with_hook17h6731baa78621a747E (type 3) (param i32 i32 i32 i32 i32 i32)
    (local i32 i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 6
    global.set $__stack_pointer
    i32.const 0
    i32.const 0
    i32.load offset=1051892
    local.tee 7
    i32.const 1
    i32.add
    i32.store offset=1051892
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 0
        i32.lt_s
        br_if 0 (;@2;)
        i32.const 0
        i32.load8_u offset=1052352
        i32.const 255
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        i32.const 1
        i32.store8 offset=1052352
        i32.const 0
        i32.const 0
        i32.load offset=1052348
        i32.const 1
        i32.add
        i32.store offset=1052348
        local.get 6
        local.get 5
        i32.store8 offset=29
        local.get 6
        local.get 4
        i32.store8 offset=28
        local.get 6
        local.get 3
        i32.store offset=24
        local.get 6
        local.get 2
        i32.store offset=20
        local.get 6
        i32.const 1051292
        i32.store offset=16
        local.get 6
        i32.const 1
        i32.store offset=12
        i32.const 0
        i32.load offset=1051880
        local.tee 7
        i32.const -1
        i32.le_s
        br_if 0 (;@2;)
        i32.const 0
        local.get 7
        i32.const 1
        i32.add
        i32.store offset=1051880
        block  ;; label = @3
          i32.const 0
          i32.load offset=1051884
          i32.eqz
          br_if 0 (;@3;)
          local.get 6
          local.get 0
          local.get 1
          i32.load offset=16
          call_indirect (type 4)
          local.get 6
          local.get 6
          i64.load
          i64.store offset=12 align=4
          i32.const 0
          i32.load offset=1051884
          local.get 6
          i32.const 12
          i32.add
          i32.const 0
          i32.load offset=1051888
          i32.load offset=20
          call_indirect (type 4)
          i32.const 0
          i32.load offset=1051880
          i32.const -1
          i32.add
          local.set 7
        end
        i32.const 0
        local.get 7
        i32.store offset=1051880
        i32.const 0
        i32.const 0
        i32.store8 offset=1052352
        local.get 4
        br_if 1 (;@1;)
      end
      unreachable
      unreachable
    end
    local.get 0
    local.get 1
    call $rust_panic
    unreachable)
  (func $rust_panic (type 4) (param i32 i32)
    local.get 0
    local.get 1
    call $__rust_start_panic
    drop
    unreachable
    unreachable)
  (func $__rg_oom (type 4) (param i32 i32)
    (local i32)
    local.get 1
    local.get 0
    i32.const 0
    i32.load offset=1051876
    local.tee 2
    i32.const 43
    local.get 2
    select
    call_indirect (type 4)
    unreachable
    unreachable)
  (func $__rust_start_panic (type 6) (param i32 i32) (result i32)
    unreachable
    unreachable)
  (func $_ZN61_$LT$dlmalloc..sys..System$u20$as$u20$dlmalloc..Allocator$GT$5alloc17h32bf5aa7613bca1cE (type 0) (param i32 i32 i32)
    (local i32)
    local.get 2
    i32.const 16
    i32.shr_u
    memory.grow
    local.set 3
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 0
    i32.const 0
    local.get 2
    i32.const -65536
    i32.and
    local.get 3
    i32.const -1
    i32.eq
    local.tee 2
    select
    i32.store offset=4
    local.get 0
    i32.const 0
    local.get 3
    i32.const 16
    i32.shl
    local.get 2
    select
    i32.store)
  (func $_ZN5alloc7raw_vec17capacity_overflow17ha85462faabb43c69E (type 11)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 0
    global.set $__stack_pointer
    local.get 0
    i32.const 0
    i32.store offset=24
    local.get 0
    i32.const 1
    i32.store offset=12
    local.get 0
    i32.const 1051328
    i32.store offset=8
    local.get 0
    i64.const 4
    i64.store offset=16 align=4
    local.get 0
    i32.const 8
    i32.add
    i32.const 1051364
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN5alloc7raw_vec12handle_error17h6991f391977ec209E (type 4) (param i32 i32)
    block  ;; label = @1
      local.get 0
      br_if 0 (;@1;)
      call $_ZN5alloc7raw_vec17capacity_overflow17ha85462faabb43c69E
      unreachable
    end
    local.get 0
    local.get 1
    call $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E
    unreachable)
  (func $_ZN5alloc5alloc18handle_alloc_error17h246ea5f196567ce5E (type 4) (param i32 i32)
    local.get 1
    local.get 0
    call $__rust_alloc_error_handler
    unreachable)
  (func $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h1c3f1cbd1368fccaE (type 1) (param i32))
  (func $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE (type 4) (param i32 i32)
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
    i32.const 1051520
    i32.store offset=16
    local.get 2
    i32.const 1
    i32.store offset=12
    local.get 2
    i32.const 12
    i32.add
    call $rust_begin_unwind
    unreachable)
  (func $_ZN4core5slice5index26slice_start_index_len_fail17hdf8c0aea852237a1E (type 0) (param i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN4core5slice5index29slice_start_index_len_fail_rt17h457337ef10e44172E
    unreachable)
  (func $_ZN4core3fmt9Formatter3pad17hbad76490c47154d2E (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      local.get 0
      i32.load
      local.tee 3
      local.get 0
      i32.load offset=8
      local.tee 4
      i32.or
      i32.eqz
      br_if 0 (;@1;)
      block  ;; label = @2
        local.get 4
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 2
        i32.add
        local.set 5
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load offset=12
            local.tee 6
            br_if 0 (;@4;)
            i32.const 0
            local.set 7
            local.get 1
            local.set 8
            br 1 (;@3;)
          end
          i32.const 0
          local.set 7
          local.get 1
          local.set 8
          loop  ;; label = @4
            local.get 8
            local.tee 4
            local.get 5
            i32.eq
            br_if 2 (;@2;)
            block  ;; label = @5
              block  ;; label = @6
                local.get 4
                i32.load8_s
                local.tee 8
                i32.const -1
                i32.le_s
                br_if 0 (;@6;)
                local.get 4
                i32.const 1
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 8
                i32.const -32
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 2
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              block  ;; label = @6
                local.get 8
                i32.const -16
                i32.ge_u
                br_if 0 (;@6;)
                local.get 4
                i32.const 3
                i32.add
                local.set 8
                br 1 (;@5;)
              end
              local.get 4
              i32.load8_u offset=2
              i32.const 63
              i32.and
              i32.const 6
              i32.shl
              local.get 4
              i32.load8_u offset=1
              i32.const 63
              i32.and
              i32.const 12
              i32.shl
              i32.or
              local.get 4
              i32.load8_u offset=3
              i32.const 63
              i32.and
              i32.or
              local.get 8
              i32.const 255
              i32.and
              i32.const 18
              i32.shl
              i32.const 1835008
              i32.and
              i32.or
              i32.const 1114112
              i32.eq
              br_if 3 (;@2;)
              local.get 4
              i32.const 4
              i32.add
              local.set 8
            end
            local.get 7
            local.get 4
            i32.sub
            local.get 8
            i32.add
            local.set 7
            local.get 6
            i32.const -1
            i32.add
            local.tee 6
            br_if 0 (;@4;)
          end
        end
        local.get 8
        local.get 5
        i32.eq
        br_if 0 (;@2;)
        block  ;; label = @3
          local.get 8
          i32.load8_s
          local.tee 4
          i32.const -1
          i32.gt_s
          br_if 0 (;@3;)
          local.get 4
          i32.const -32
          i32.lt_u
          br_if 0 (;@3;)
          local.get 4
          i32.const -16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 8
          i32.load8_u offset=2
          i32.const 63
          i32.and
          i32.const 6
          i32.shl
          local.get 8
          i32.load8_u offset=1
          i32.const 63
          i32.and
          i32.const 12
          i32.shl
          i32.or
          local.get 8
          i32.load8_u offset=3
          i32.const 63
          i32.and
          i32.or
          local.get 4
          i32.const 255
          i32.and
          i32.const 18
          i32.shl
          i32.const 1835008
          i32.and
          i32.or
          i32.const 1114112
          i32.eq
          br_if 1 (;@2;)
        end
        block  ;; label = @3
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
          block  ;; label = @4
            local.get 7
            local.get 2
            i32.lt_u
            br_if 0 (;@4;)
            local.get 7
            local.get 2
            i32.eq
            br_if 1 (;@3;)
            br 2 (;@2;)
          end
          local.get 1
          local.get 7
          i32.add
          i32.load8_s
          i32.const -64
          i32.lt_s
          br_if 1 (;@2;)
        end
        local.get 7
        local.set 2
      end
      block  ;; label = @2
        local.get 3
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      local.get 0
      i32.load offset=4
      local.set 3
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 1
          local.get 2
          call $_ZN4core3str5count14do_count_chars17h66d99444d2bc554aE
          local.set 4
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 2
          br_if 0 (;@3;)
          i32.const 0
          local.set 4
          br 1 (;@2;)
        end
        local.get 2
        i32.const 3
        i32.and
        local.set 6
        block  ;; label = @3
          block  ;; label = @4
            local.get 2
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 4
            i32.const 0
            local.set 7
            br 1 (;@3;)
          end
          local.get 2
          i32.const 12
          i32.and
          local.set 5
          i32.const 0
          local.set 4
          i32.const 0
          local.set 7
          loop  ;; label = @4
            local.get 4
            local.get 1
            local.get 7
            i32.add
            local.tee 8
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 8
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 4
            local.get 5
            local.get 7
            i32.const 4
            i32.add
            local.tee 7
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 6
        i32.eqz
        br_if 0 (;@2;)
        local.get 1
        local.get 7
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 4
          local.get 8
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 4
          local.get 8
          i32.const 1
          i32.add
          local.set 8
          local.get 6
          i32.const -1
          i32.add
          local.tee 6
          br_if 0 (;@3;)
        end
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          local.get 4
          i32.le_u
          br_if 0 (;@3;)
          local.get 3
          local.get 4
          i32.sub
          local.set 5
          i32.const 0
          local.set 4
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.load8_u offset=32
                br_table 2 (;@4;) 0 (;@6;) 1 (;@5;) 2 (;@4;) 2 (;@4;)
              end
              local.get 5
              local.set 4
              i32.const 0
              local.set 5
              br 1 (;@4;)
            end
            local.get 5
            i32.const 1
            i32.shr_u
            local.set 4
            local.get 5
            i32.const 1
            i32.add
            i32.const 1
            i32.shr_u
            local.set 5
          end
          local.get 4
          i32.const 1
          i32.add
          local.set 4
          local.get 0
          i32.load offset=16
          local.set 6
          local.get 0
          i32.load offset=24
          local.set 8
          local.get 0
          i32.load offset=20
          local.set 7
          loop  ;; label = @4
            local.get 4
            i32.const -1
            i32.add
            local.tee 4
            i32.eqz
            br_if 2 (;@2;)
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 6)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        local.get 0
        i32.load offset=20
        local.get 1
        local.get 2
        local.get 0
        i32.load offset=24
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      i32.const 1
      local.set 4
      block  ;; label = @2
        local.get 7
        local.get 1
        local.get 2
        local.get 8
        i32.load offset=12
        call_indirect (type 5)
        br_if 0 (;@2;)
        i32.const 0
        local.set 4
        block  ;; label = @3
          loop  ;; label = @4
            block  ;; label = @5
              local.get 5
              local.get 4
              i32.ne
              br_if 0 (;@5;)
              local.get 5
              local.set 4
              br 2 (;@3;)
            end
            local.get 4
            i32.const 1
            i32.add
            local.set 4
            local.get 7
            local.get 6
            local.get 8
            i32.load offset=16
            call_indirect (type 6)
            i32.eqz
            br_if 0 (;@4;)
          end
          local.get 4
          i32.const -1
          i32.add
          local.set 4
        end
        local.get 4
        local.get 5
        i32.lt_u
        local.set 4
      end
      local.get 4
      return
    end
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5))
  (func $_ZN4core9panicking5panic17h3b99507adb69386aE (type 0) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 0
    i32.store offset=16
    local.get 3
    i32.const 1
    i32.store offset=4
    local.get 3
    i64.const 4
    i64.store offset=8 align=4
    local.get 3
    local.get 1
    i32.store offset=28
    local.get 3
    local.get 0
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 24
    i32.add
    i32.store
    local.get 3
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h85fc646d908d0c7bE (type 6) (param i32 i32) (result i32)
    local.get 0
    i64.load32_u
    i32.const 1
    local.get 1
    call $_ZN4core3fmt3num3imp7fmt_u6417haef35ab823acabf1E)
  (func $_ZN4core3fmt5write17hbee61cd3fb7b52a3E (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    i32.const 3
    i32.store8 offset=44
    local.get 3
    i32.const 32
    i32.store offset=28
    i32.const 0
    local.set 4
    local.get 3
    i32.const 0
    i32.store offset=40
    local.get 3
    local.get 1
    i32.store offset=36
    local.get 3
    local.get 0
    i32.store offset=32
    local.get 3
    i32.const 0
    i32.store offset=20
    local.get 3
    i32.const 0
    i32.store offset=12
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.load offset=16
              local.tee 5
              br_if 0 (;@5;)
              local.get 2
              i32.load offset=12
              local.tee 0
              i32.eqz
              br_if 1 (;@4;)
              local.get 2
              i32.load offset=8
              local.set 1
              local.get 0
              i32.const 3
              i32.shl
              local.set 6
              local.get 0
              i32.const -1
              i32.add
              i32.const 536870911
              i32.and
              i32.const 1
              i32.add
              local.set 4
              local.get 2
              i32.load
              local.set 0
              loop  ;; label = @6
                block  ;; label = @7
                  local.get 0
                  i32.const 4
                  i32.add
                  i32.load
                  local.tee 7
                  i32.eqz
                  br_if 0 (;@7;)
                  local.get 3
                  i32.load offset=32
                  local.get 0
                  i32.load
                  local.get 7
                  local.get 3
                  i32.load offset=36
                  i32.load offset=12
                  call_indirect (type 5)
                  br_if 4 (;@3;)
                end
                local.get 1
                i32.load
                local.get 3
                i32.const 12
                i32.add
                local.get 1
                i32.load offset=4
                call_indirect (type 6)
                br_if 3 (;@3;)
                local.get 1
                i32.const 8
                i32.add
                local.set 1
                local.get 0
                i32.const 8
                i32.add
                local.set 0
                local.get 6
                i32.const -8
                i32.add
                local.tee 6
                br_if 0 (;@6;)
                br 2 (;@4;)
              end
            end
            local.get 2
            i32.load offset=20
            local.tee 1
            i32.eqz
            br_if 0 (;@4;)
            local.get 1
            i32.const 5
            i32.shl
            local.set 8
            local.get 1
            i32.const -1
            i32.add
            i32.const 134217727
            i32.and
            i32.const 1
            i32.add
            local.set 4
            local.get 2
            i32.load offset=8
            local.set 9
            local.get 2
            i32.load
            local.set 0
            i32.const 0
            local.set 6
            loop  ;; label = @5
              block  ;; label = @6
                local.get 0
                i32.const 4
                i32.add
                i32.load
                local.tee 1
                i32.eqz
                br_if 0 (;@6;)
                local.get 3
                i32.load offset=32
                local.get 0
                i32.load
                local.get 1
                local.get 3
                i32.load offset=36
                i32.load offset=12
                call_indirect (type 5)
                br_if 3 (;@3;)
              end
              local.get 3
              local.get 5
              local.get 6
              i32.add
              local.tee 1
              i32.const 16
              i32.add
              i32.load
              i32.store offset=28
              local.get 3
              local.get 1
              i32.const 28
              i32.add
              i32.load8_u
              i32.store8 offset=44
              local.get 3
              local.get 1
              i32.const 24
              i32.add
              i32.load
              i32.store offset=40
              local.get 1
              i32.const 12
              i32.add
              i32.load
              local.set 7
              i32.const 0
              local.set 10
              i32.const 0
              local.set 11
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.const 8
                    i32.add
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 12
                  i32.const 0
                  local.set 11
                  local.get 9
                  local.get 12
                  i32.add
                  local.tee 12
                  i32.load offset=4
                  br_if 1 (;@6;)
                  local.get 12
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 11
              end
              local.get 3
              local.get 7
              i32.store offset=16
              local.get 3
              local.get 11
              i32.store offset=12
              local.get 1
              i32.const 4
              i32.add
              i32.load
              local.set 7
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    local.get 1
                    i32.load
                    br_table 1 (;@7;) 0 (;@8;) 2 (;@6;) 1 (;@7;)
                  end
                  local.get 7
                  i32.const 3
                  i32.shl
                  local.set 11
                  local.get 9
                  local.get 11
                  i32.add
                  local.tee 11
                  i32.load offset=4
                  br_if 1 (;@6;)
                  local.get 11
                  i32.load
                  local.set 7
                end
                i32.const 1
                local.set 10
              end
              local.get 3
              local.get 7
              i32.store offset=24
              local.get 3
              local.get 10
              i32.store offset=20
              local.get 9
              local.get 1
              i32.const 20
              i32.add
              i32.load
              i32.const 3
              i32.shl
              i32.add
              local.tee 1
              i32.load
              local.get 3
              i32.const 12
              i32.add
              local.get 1
              i32.load offset=4
              call_indirect (type 6)
              br_if 2 (;@3;)
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 8
              local.get 6
              i32.const 32
              i32.add
              local.tee 6
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 4
          local.get 2
          i32.load offset=4
          i32.ge_u
          br_if 1 (;@2;)
          local.get 3
          i32.load offset=32
          local.get 2
          i32.load
          local.get 4
          i32.const 3
          i32.shl
          i32.add
          local.tee 1
          i32.load
          local.get 1
          i32.load offset=4
          local.get 3
          i32.load offset=36
          i32.load offset=12
          call_indirect (type 5)
          i32.eqz
          br_if 1 (;@2;)
        end
        i32.const 1
        local.set 1
        br 1 (;@1;)
      end
      i32.const 0
      local.set 1
    end
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 1)
  (func $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h4e5a4609280a40f1E (type 4) (param i32 i32)
    local.get 0
    i64.const 9172487606043731407
    i64.store offset=8
    local.get 0
    i64.const -8877450274954529964
    i64.store)
  (func $_ZN60_$LT$core..cell..BorrowError$u20$as$u20$core..fmt..Debug$GT$3fmt17h235ec3ceaa677e72E (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1051380
    i32.const 11
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5))
  (func $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h81bacf94bd657e5cE (type 6) (param i32 i32) (result i32)
    local.get 1
    i32.load offset=20
    i32.const 1051391
    i32.const 14
    local.get 1
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5))
  (func $_ZN4core4cell22panic_already_borrowed17h18b8189a0fdd8b58E (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1051424
    i32.store offset=8
    local.get 1
    i64.const 1
    i64.store offset=20 align=4
    local.get 1
    i32.const 58
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 47
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN4core4cell30panic_already_mutably_borrowed17h793f3780fe6f3b88E (type 1) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 1
    global.set $__stack_pointer
    local.get 1
    i32.const 1
    i32.store offset=12
    local.get 1
    i32.const 1051460
    i32.store offset=8
    local.get 1
    i64.const 1
    i64.store offset=20 align=4
    local.get 1
    i32.const 59
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 1
    i32.const 47
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 1
    local.get 1
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 1
    i32.const 8
    i32.add
    local.get 0
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN4core6result13unwrap_failed17h4ed86702351a3017E (type 7) (param i32 i32 i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 64
    i32.sub
    local.tee 5
    global.set $__stack_pointer
    local.get 5
    local.get 1
    i32.store offset=12
    local.get 5
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=20
    local.get 5
    local.get 2
    i32.store offset=16
    local.get 5
    i32.const 2
    i32.store offset=28
    local.get 5
    i32.const 1051540
    i32.store offset=24
    local.get 5
    i64.const 2
    i64.store offset=36 align=4
    local.get 5
    i32.const 60
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i32.const 16
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=56
    local.get 5
    i32.const 61
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 5
    i32.const 8
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=48
    local.get 5
    local.get 5
    i32.const 48
    i32.add
    i32.store offset=32
    local.get 5
    i32.const 24
    i32.add
    local.get 4
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN4core6option13unwrap_failed17h0d060778de0f79e8E (type 1) (param i32)
    i32.const 1051476
    i32.const 43
    local.get 0
    call $_ZN4core9panicking5panic17h3b99507adb69386aE
    unreachable)
  (func $_ZN4core6option13expect_failed17h637b3c5bf9792ea8E (type 0) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=12
    local.get 3
    local.get 0
    i32.store offset=8
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking13panic_display17hbd841ae85eb3dff4E
    unreachable)
  (func $_ZN4core9panicking13panic_display17hbd841ae85eb3dff4E (type 4) (param i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 2
    i32.const 1
    i32.store offset=4
    local.get 2
    i32.const 1051468
    i32.store
    local.get 2
    i64.const 1
    i64.store offset=12 align=4
    local.get 2
    i32.const 61
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.get 0
    i64.extend_i32_u
    i64.or
    i64.store offset=24
    local.get 2
    local.get 2
    i32.const 24
    i32.add
    i32.store offset=8
    local.get 2
    local.get 1
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87ef43d072a4bed1E (type 6) (param i32 i32) (result i32)
    local.get 1
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    call $_ZN4core3fmt9Formatter3pad17hbad76490c47154d2E)
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..LowerHex$u20$for$u20$i32$GT$3fmt17h3be2bf5a24d84447E (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 87
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1051584
      call $_ZN4core5slice5index26slice_start_index_len_fail17hdf8c0aea852237a1E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1051600
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17hcbbcc5e70706fcddE
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7a9a11a22d9e302cE (type 6) (param i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 1
    local.get 0
    i32.load offset=4
    i32.load offset=12
    call_indirect (type 6))
  (func $_ZN4core3fmt9Formatter12pad_integral17hcbbcc5e70706fcddE (type 12) (param i32 i32 i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        local.get 5
        i32.const 1
        i32.add
        local.set 6
        local.get 0
        i32.load offset=28
        local.set 7
        i32.const 45
        local.set 8
        br 1 (;@1;)
      end
      i32.const 43
      i32.const 1114112
      local.get 0
      i32.load offset=28
      local.tee 7
      i32.const 1
      i32.and
      local.tee 1
      select
      local.set 8
      local.get 1
      local.get 5
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 7
        i32.const 4
        i32.and
        br_if 0 (;@2;)
        i32.const 0
        local.set 2
        br 1 (;@1;)
      end
      block  ;; label = @2
        block  ;; label = @3
          local.get 3
          i32.const 16
          i32.lt_u
          br_if 0 (;@3;)
          local.get 2
          local.get 3
          call $_ZN4core3str5count14do_count_chars17h66d99444d2bc554aE
          local.set 1
          br 1 (;@2;)
        end
        block  ;; label = @3
          local.get 3
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          br 1 (;@2;)
        end
        local.get 3
        i32.const 3
        i32.and
        local.set 9
        block  ;; label = @3
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.ge_u
            br_if 0 (;@4;)
            i32.const 0
            local.set 1
            i32.const 0
            local.set 10
            br 1 (;@3;)
          end
          local.get 3
          i32.const 12
          i32.and
          local.set 11
          i32.const 0
          local.set 1
          i32.const 0
          local.set 10
          loop  ;; label = @4
            local.get 1
            local.get 2
            local.get 10
            i32.add
            local.tee 12
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 1
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 2
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.get 12
            i32.const 3
            i32.add
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 11
            local.get 10
            i32.const 4
            i32.add
            local.tee 10
            i32.ne
            br_if 0 (;@4;)
          end
        end
        local.get 9
        i32.eqz
        br_if 0 (;@2;)
        local.get 2
        local.get 10
        i32.add
        local.set 12
        loop  ;; label = @3
          local.get 1
          local.get 12
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 1
          local.get 12
          i32.const 1
          i32.add
          local.set 12
          local.get 9
          i32.const -1
          i32.add
          local.tee 9
          br_if 0 (;@3;)
        end
      end
      local.get 1
      local.get 6
      i32.add
      local.set 6
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i32.load
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h45be8b7045bf0ef1E
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      block  ;; label = @2
        local.get 0
        i32.load offset=4
        local.tee 9
        local.get 6
        i32.gt_u
        br_if 0 (;@2;)
        i32.const 1
        local.set 1
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h45be8b7045bf0ef1E
        br_if 1 (;@1;)
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        return
      end
      block  ;; label = @2
        local.get 7
        i32.const 8
        i32.and
        i32.eqz
        br_if 0 (;@2;)
        local.get 0
        i32.load offset=16
        local.set 11
        local.get 0
        i32.const 48
        i32.store offset=16
        local.get 0
        i32.load8_u offset=32
        local.set 7
        i32.const 1
        local.set 1
        local.get 0
        i32.const 1
        i32.store8 offset=32
        local.get 0
        i32.load offset=20
        local.tee 12
        local.get 0
        i32.load offset=24
        local.tee 10
        local.get 8
        local.get 2
        local.get 3
        call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h45be8b7045bf0ef1E
        br_if 1 (;@1;)
        local.get 9
        local.get 6
        i32.sub
        i32.const 1
        i32.add
        local.set 1
        block  ;; label = @3
          loop  ;; label = @4
            local.get 1
            i32.const -1
            i32.add
            local.tee 1
            i32.eqz
            br_if 1 (;@3;)
            local.get 12
            i32.const 48
            local.get 10
            i32.load offset=16
            call_indirect (type 6)
            i32.eqz
            br_if 0 (;@4;)
          end
          i32.const 1
          return
        end
        i32.const 1
        local.set 1
        local.get 12
        local.get 4
        local.get 5
        local.get 10
        i32.load offset=12
        call_indirect (type 5)
        br_if 1 (;@1;)
        local.get 0
        local.get 7
        i32.store8 offset=32
        local.get 0
        local.get 11
        i32.store offset=16
        i32.const 0
        local.set 1
        br 1 (;@1;)
      end
      local.get 9
      local.get 6
      i32.sub
      local.set 6
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            i32.load8_u offset=32
            local.tee 1
            br_table 2 (;@2;) 0 (;@4;) 1 (;@3;) 0 (;@4;) 2 (;@2;)
          end
          local.get 6
          local.set 1
          i32.const 0
          local.set 6
          br 1 (;@2;)
        end
        local.get 6
        i32.const 1
        i32.shr_u
        local.set 1
        local.get 6
        i32.const 1
        i32.add
        i32.const 1
        i32.shr_u
        local.set 6
      end
      local.get 1
      i32.const 1
      i32.add
      local.set 1
      local.get 0
      i32.load offset=16
      local.set 9
      local.get 0
      i32.load offset=24
      local.set 12
      local.get 0
      i32.load offset=20
      local.set 10
      block  ;; label = @2
        loop  ;; label = @3
          local.get 1
          i32.const -1
          i32.add
          local.tee 1
          i32.eqz
          br_if 1 (;@2;)
          local.get 10
          local.get 9
          local.get 12
          i32.load offset=16
          call_indirect (type 6)
          i32.eqz
          br_if 0 (;@3;)
        end
        i32.const 1
        return
      end
      i32.const 1
      local.set 1
      local.get 10
      local.get 12
      local.get 8
      local.get 2
      local.get 3
      call $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h45be8b7045bf0ef1E
      br_if 0 (;@1;)
      local.get 10
      local.get 4
      local.get 5
      local.get 12
      i32.load offset=12
      call_indirect (type 5)
      br_if 0 (;@1;)
      i32.const 0
      local.set 1
      loop  ;; label = @2
        block  ;; label = @3
          local.get 6
          local.get 1
          i32.ne
          br_if 0 (;@3;)
          local.get 6
          local.get 6
          i32.lt_u
          return
        end
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 10
        local.get 9
        local.get 12
        i32.load offset=16
        call_indirect (type 6)
        i32.eqz
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const -1
      i32.add
      local.get 6
      i32.lt_u
      return
    end
    local.get 1)
  (func $_ZN4core3str5count14do_count_chars17h66d99444d2bc554aE (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 1
        local.get 0
        i32.const 3
        i32.add
        i32.const -4
        i32.and
        local.tee 2
        local.get 0
        i32.sub
        local.tee 3
        i32.lt_u
        br_if 0 (;@2;)
        local.get 1
        local.get 3
        i32.sub
        local.tee 4
        i32.const 4
        i32.lt_u
        br_if 0 (;@2;)
        local.get 4
        i32.const 3
        i32.and
        local.set 5
        i32.const 0
        local.set 6
        i32.const 0
        local.set 1
        block  ;; label = @3
          local.get 2
          local.get 0
          i32.eq
          local.tee 7
          br_if 0 (;@3;)
          i32.const 0
          local.set 1
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              local.get 2
              i32.sub
              local.tee 8
              i32.const -4
              i32.le_u
              br_if 0 (;@5;)
              i32.const 0
              local.set 9
              br 1 (;@4;)
            end
            i32.const 0
            local.set 9
            loop  ;; label = @5
              local.get 1
              local.get 0
              local.get 9
              i32.add
              local.tee 2
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 1
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 2
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.get 2
              i32.const 3
              i32.add
              i32.load8_s
              i32.const -65
              i32.gt_s
              i32.add
              local.set 1
              local.get 9
              i32.const 4
              i32.add
              local.tee 9
              br_if 0 (;@5;)
            end
          end
          local.get 7
          br_if 0 (;@3;)
          local.get 0
          local.get 9
          i32.add
          local.set 2
          loop  ;; label = @4
            local.get 1
            local.get 2
            i32.load8_s
            i32.const -65
            i32.gt_s
            i32.add
            local.set 1
            local.get 2
            i32.const 1
            i32.add
            local.set 2
            local.get 8
            i32.const 1
            i32.add
            local.tee 8
            br_if 0 (;@4;)
          end
        end
        local.get 0
        local.get 3
        i32.add
        local.set 9
        block  ;; label = @3
          local.get 5
          i32.eqz
          br_if 0 (;@3;)
          local.get 9
          local.get 4
          i32.const -4
          i32.and
          i32.add
          local.tee 2
          i32.load8_s
          i32.const -65
          i32.gt_s
          local.set 6
          local.get 5
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=1
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
          local.get 5
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 6
          local.get 2
          i32.load8_s offset=2
          i32.const -65
          i32.gt_s
          i32.add
          local.set 6
        end
        local.get 4
        i32.const 2
        i32.shr_u
        local.set 3
        local.get 6
        local.get 1
        i32.add
        local.set 8
        loop  ;; label = @3
          local.get 9
          local.set 4
          local.get 3
          i32.eqz
          br_if 2 (;@1;)
          local.get 3
          i32.const 192
          local.get 3
          i32.const 192
          i32.lt_u
          select
          local.tee 6
          i32.const 3
          i32.and
          local.set 7
          local.get 6
          i32.const 2
          i32.shl
          local.set 5
          i32.const 0
          local.set 2
          block  ;; label = @4
            local.get 3
            i32.const 4
            i32.lt_u
            br_if 0 (;@4;)
            local.get 4
            local.get 5
            i32.const 1008
            i32.and
            i32.add
            local.set 0
            i32.const 0
            local.set 2
            local.get 4
            local.set 1
            loop  ;; label = @5
              local.get 1
              i32.load offset=12
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load offset=8
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load offset=4
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 1
              i32.load
              local.tee 9
              i32.const -1
              i32.xor
              i32.const 7
              i32.shr_u
              local.get 9
              i32.const 6
              i32.shr_u
              i32.or
              i32.const 16843009
              i32.and
              local.get 2
              i32.add
              i32.add
              i32.add
              i32.add
              local.set 2
              local.get 1
              i32.const 16
              i32.add
              local.tee 1
              local.get 0
              i32.ne
              br_if 0 (;@5;)
            end
          end
          local.get 3
          local.get 6
          i32.sub
          local.set 3
          local.get 4
          local.get 5
          i32.add
          local.set 9
          local.get 2
          i32.const 8
          i32.shr_u
          i32.const 16711935
          i32.and
          local.get 2
          i32.const 16711935
          i32.and
          i32.add
          i32.const 65537
          i32.mul
          i32.const 16
          i32.shr_u
          local.get 8
          i32.add
          local.set 8
          local.get 7
          i32.eqz
          br_if 0 (;@3;)
        end
        local.get 4
        local.get 6
        i32.const 252
        i32.and
        i32.const 2
        i32.shl
        i32.add
        local.tee 2
        i32.load
        local.tee 1
        i32.const -1
        i32.xor
        i32.const 7
        i32.shr_u
        local.get 1
        i32.const 6
        i32.shr_u
        i32.or
        i32.const 16843009
        i32.and
        local.set 1
        block  ;; label = @3
          local.get 7
          i32.const 1
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=4
          local.tee 9
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 9
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
          local.get 7
          i32.const 2
          i32.eq
          br_if 0 (;@3;)
          local.get 2
          i32.load offset=8
          local.tee 2
          i32.const -1
          i32.xor
          i32.const 7
          i32.shr_u
          local.get 2
          i32.const 6
          i32.shr_u
          i32.or
          i32.const 16843009
          i32.and
          local.get 1
          i32.add
          local.set 1
        end
        local.get 1
        i32.const 8
        i32.shr_u
        i32.const 459007
        i32.and
        local.get 1
        i32.const 16711935
        i32.and
        i32.add
        i32.const 65537
        i32.mul
        i32.const 16
        i32.shr_u
        local.get 8
        i32.add
        return
      end
      block  ;; label = @2
        local.get 1
        br_if 0 (;@2;)
        i32.const 0
        return
      end
      local.get 1
      i32.const 3
      i32.and
      local.set 9
      block  ;; label = @2
        block  ;; label = @3
          local.get 1
          i32.const 4
          i32.ge_u
          br_if 0 (;@3;)
          i32.const 0
          local.set 8
          i32.const 0
          local.set 2
          br 1 (;@2;)
        end
        local.get 1
        i32.const -4
        i32.and
        local.set 3
        i32.const 0
        local.set 8
        i32.const 0
        local.set 2
        loop  ;; label = @3
          local.get 8
          local.get 0
          local.get 2
          i32.add
          local.tee 1
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 1
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 2
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.get 1
          i32.const 3
          i32.add
          i32.load8_s
          i32.const -65
          i32.gt_s
          i32.add
          local.set 8
          local.get 3
          local.get 2
          i32.const 4
          i32.add
          local.tee 2
          i32.ne
          br_if 0 (;@3;)
        end
      end
      local.get 9
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      local.get 2
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 8
        local.get 1
        i32.load8_s
        i32.const -65
        i32.gt_s
        i32.add
        local.set 8
        local.get 1
        i32.const 1
        i32.add
        local.set 1
        local.get 9
        i32.const -1
        i32.add
        local.tee 9
        br_if 0 (;@2;)
      end
    end
    local.get 8)
  (func $_ZN4core3fmt9Formatter12pad_integral12write_prefix17h45be8b7045bf0ef1E (type 13) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          local.get 2
          i32.const 1114112
          i32.eq
          br_if 0 (;@3;)
          i32.const 1
          local.set 5
          local.get 0
          local.get 2
          local.get 1
          i32.load offset=16
          call_indirect (type 6)
          br_if 1 (;@2;)
        end
        local.get 3
        br_if 1 (;@1;)
        i32.const 0
        local.set 5
      end
      local.get 5
      return
    end
    local.get 0
    local.get 3
    local.get 4
    local.get 1
    i32.load offset=12
    call_indirect (type 5))
  (func $_ZN4core3fmt9Formatter9write_str17hb14ec2e1267025f3E (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    i32.load offset=20
    local.get 1
    local.get 2
    local.get 0
    i32.load offset=24
    i32.load offset=12
    call_indirect (type 5))
  (func $_ZN4core5slice5index29slice_start_index_len_fail_rt17h457337ef10e44172E (type 0) (param i32 i32 i32)
    (local i32 i64)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=4
    local.get 3
    local.get 0
    i32.store
    local.get 3
    i32.const 2
    i32.store offset=12
    local.get 3
    i32.const 1051856
    i32.store offset=8
    local.get 3
    i64.const 2
    i64.store offset=20 align=4
    local.get 3
    i32.const 37
    i64.extend_i32_u
    i64.const 32
    i64.shl
    local.tee 4
    local.get 3
    i32.const 4
    i32.add
    i64.extend_i32_u
    i64.or
    i64.store offset=40
    local.get 3
    local.get 4
    local.get 3
    i64.extend_i32_u
    i64.or
    i64.store offset=32
    local.get 3
    local.get 3
    i32.const 32
    i32.add
    i32.store offset=16
    local.get 3
    i32.const 8
    i32.add
    local.get 2
    call $_ZN4core9panicking9panic_fmt17h5c7ce52813e94bcdE
    unreachable)
  (func $_ZN4core3fmt3num3imp7fmt_u6417haef35ab823acabf1E (type 14) (param i64 i32 i32) (result i32)
    (local i32 i32 i64 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 48
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    i32.const 39
    local.set 4
    block  ;; label = @1
      block  ;; label = @2
        local.get 0
        i64.const 10000
        i64.ge_u
        br_if 0 (;@2;)
        local.get 0
        local.set 5
        br 1 (;@1;)
      end
      i32.const 39
      local.set 4
      loop  ;; label = @2
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.add
        local.tee 6
        i32.const -4
        i32.add
        local.get 0
        local.get 0
        i64.const 10000
        i64.div_u
        local.tee 5
        i64.const 10000
        i64.mul
        i64.sub
        i32.wrap_i64
        local.tee 7
        i32.const 65535
        i32.and
        i32.const 100
        i32.div_u
        local.tee 8
        i32.const 1
        i32.shl
        i32.const 1051602
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 6
        i32.const -2
        i32.add
        local.get 7
        local.get 8
        i32.const 100
        i32.mul
        i32.sub
        i32.const 65535
        i32.and
        i32.const 1
        i32.shl
        i32.const 1051602
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        local.get 4
        i32.const -4
        i32.add
        local.set 4
        local.get 0
        i64.const 99999999
        i64.gt_u
        local.set 6
        local.get 5
        local.set 0
        local.get 6
        br_if 0 (;@2;)
      end
    end
    block  ;; label = @1
      local.get 5
      i32.wrap_i64
      local.tee 6
      i32.const 99
      i32.le_u
      br_if 0 (;@1;)
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -2
      i32.add
      local.tee 4
      i32.add
      local.get 5
      i32.wrap_i64
      local.tee 6
      local.get 6
      i32.const 65535
      i32.and
      i32.const 100
      i32.div_u
      local.tee 6
      i32.const 100
      i32.mul
      i32.sub
      i32.const 65535
      i32.and
      i32.const 1
      i32.shl
      i32.const 1051602
      i32.add
      i32.load16_u align=1
      i32.store16 align=1
    end
    block  ;; label = @1
      block  ;; label = @2
        local.get 6
        i32.const 10
        i32.lt_u
        br_if 0 (;@2;)
        local.get 3
        i32.const 9
        i32.add
        local.get 4
        i32.const -2
        i32.add
        local.tee 4
        i32.add
        local.get 6
        i32.const 1
        i32.shl
        i32.const 1051602
        i32.add
        i32.load16_u align=1
        i32.store16 align=1
        br 1 (;@1;)
      end
      local.get 3
      i32.const 9
      i32.add
      local.get 4
      i32.const -1
      i32.add
      local.tee 4
      i32.add
      local.get 6
      i32.const 48
      i32.or
      i32.store8
    end
    local.get 2
    local.get 1
    i32.const 1
    i32.const 0
    local.get 3
    i32.const 9
    i32.add
    local.get 4
    i32.add
    i32.const 39
    local.get 4
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17hcbbcc5e70706fcddE
    local.set 4
    local.get 3
    i32.const 48
    i32.add
    global.set $__stack_pointer
    local.get 4)
  (func $_ZN4core3fmt3num53_$LT$impl$u20$core..fmt..UpperHex$u20$for$u20$i32$GT$3fmt17hd504c8c64d2f0cadE (type 6) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 128
    i32.sub
    local.tee 2
    global.set $__stack_pointer
    local.get 0
    i32.load
    local.set 0
    i32.const 0
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.add
      i32.const 127
      i32.add
      local.get 0
      i32.const 15
      i32.and
      local.tee 4
      i32.const 48
      i32.or
      local.get 4
      i32.const 55
      i32.add
      local.get 4
      i32.const 10
      i32.lt_u
      select
      i32.store8
      local.get 3
      i32.const -1
      i32.add
      local.set 3
      local.get 0
      i32.const 16
      i32.lt_u
      local.set 4
      local.get 0
      i32.const 4
      i32.shr_u
      local.set 0
      local.get 4
      i32.eqz
      br_if 0 (;@1;)
    end
    block  ;; label = @1
      local.get 3
      i32.const 128
      i32.add
      local.tee 0
      i32.const 129
      i32.lt_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 128
      i32.const 1051584
      call $_ZN4core5slice5index26slice_start_index_len_fail17hdf8c0aea852237a1E
      unreachable
    end
    local.get 1
    i32.const 1
    i32.const 1051600
    i32.const 2
    local.get 2
    local.get 3
    i32.add
    i32.const 128
    i32.add
    i32.const 0
    local.get 3
    i32.sub
    call $_ZN4core3fmt9Formatter12pad_integral17hcbbcc5e70706fcddE
    local.set 0
    local.get 2
    i32.const 128
    i32.add
    global.set $__stack_pointer
    local.get 0)
  (func $_ZN17compiler_builtins3mem6memcpy17he2d289fa2eb42ef2E (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        local.get 2
        i32.const 16
        i32.ge_u
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
          i32.eqz
          br_if 0 (;@3;)
          local.get 8
          i32.const 1
          i32.lt_s
          br_if 1 (;@2;)
          local.get 9
          i32.const 3
          i32.shl
          local.tee 6
          i32.const 24
          i32.and
          local.set 2
          local.get 9
          i32.const -4
          i32.and
          local.tee 10
          i32.const 4
          i32.add
          local.set 1
          i32.const 0
          local.get 6
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
  (func $_ZN17compiler_builtins3mem7memmove17h269e2e7a3fe7eb2aE (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            local.get 0
            local.get 1
            i32.sub
            local.get 2
            i32.ge_u
            br_if 0 (;@4;)
            local.get 1
            local.get 2
            i32.add
            local.set 3
            local.get 0
            local.get 2
            i32.add
            local.set 4
            block  ;; label = @5
              local.get 2
              i32.const 16
              i32.ge_u
              br_if 0 (;@5;)
              local.get 0
              local.set 5
              br 3 (;@2;)
            end
            local.get 4
            i32.const -4
            i32.and
            local.set 5
            i32.const 0
            local.get 4
            i32.const 3
            i32.and
            local.tee 6
            i32.sub
            local.set 7
            block  ;; label = @5
              local.get 6
              i32.eqz
              br_if 0 (;@5;)
              local.get 1
              local.get 2
              i32.add
              i32.const -1
              i32.add
              local.set 8
              loop  ;; label = @6
                local.get 4
                i32.const -1
                i32.add
                local.tee 4
                local.get 8
                i32.load8_u
                i32.store8
                local.get 8
                i32.const -1
                i32.add
                local.set 8
                local.get 5
                local.get 4
                i32.lt_u
                br_if 0 (;@6;)
              end
            end
            local.get 5
            local.get 2
            local.get 6
            i32.sub
            local.tee 9
            i32.const -4
            i32.and
            local.tee 6
            i32.sub
            local.set 4
            block  ;; label = @5
              local.get 3
              local.get 7
              i32.add
              local.tee 7
              i32.const 3
              i32.and
              i32.eqz
              br_if 0 (;@5;)
              local.get 6
              i32.const 1
              i32.lt_s
              br_if 2 (;@3;)
              local.get 7
              i32.const 3
              i32.shl
              local.tee 8
              i32.const 24
              i32.and
              local.set 2
              local.get 7
              i32.const -4
              i32.and
              local.tee 10
              i32.const -4
              i32.add
              local.set 1
              i32.const 0
              local.get 8
              i32.sub
              i32.const 24
              i32.and
              local.set 3
              local.get 10
              i32.load
              local.set 8
              loop  ;; label = @6
                local.get 5
                i32.const -4
                i32.add
                local.tee 5
                local.get 8
                local.get 3
                i32.shl
                local.get 1
                i32.load
                local.tee 8
                local.get 2
                i32.shr_u
                i32.or
                i32.store
                local.get 1
                i32.const -4
                i32.add
                local.set 1
                local.get 4
                local.get 5
                i32.lt_u
                br_if 0 (;@6;)
                br 3 (;@3;)
              end
            end
            local.get 6
            i32.const 1
            i32.lt_s
            br_if 1 (;@3;)
            local.get 9
            local.get 1
            i32.add
            i32.const -4
            i32.add
            local.set 1
            loop  ;; label = @5
              local.get 5
              i32.const -4
              i32.add
              local.tee 5
              local.get 1
              i32.load
              i32.store
              local.get 1
              i32.const -4
              i32.add
              local.set 1
              local.get 4
              local.get 5
              i32.lt_u
              br_if 0 (;@5;)
              br 2 (;@3;)
            end
          end
          block  ;; label = @4
            block  ;; label = @5
              local.get 2
              i32.const 16
              i32.ge_u
              br_if 0 (;@5;)
              local.get 0
              local.set 4
              br 1 (;@4;)
            end
            local.get 0
            i32.const 0
            local.get 0
            i32.sub
            i32.const 3
            i32.and
            local.tee 3
            i32.add
            local.set 5
            block  ;; label = @5
              local.get 3
              i32.eqz
              br_if 0 (;@5;)
              local.get 0
              local.set 4
              local.get 1
              local.set 8
              loop  ;; label = @6
                local.get 4
                local.get 8
                i32.load8_u
                i32.store8
                local.get 8
                i32.const 1
                i32.add
                local.set 8
                local.get 4
                i32.const 1
                i32.add
                local.tee 4
                local.get 5
                i32.lt_u
                br_if 0 (;@6;)
              end
            end
            local.get 5
            local.get 2
            local.get 3
            i32.sub
            local.tee 9
            i32.const -4
            i32.and
            local.tee 7
            i32.add
            local.set 4
            block  ;; label = @5
              block  ;; label = @6
                local.get 1
                local.get 3
                i32.add
                local.tee 6
                i32.const 3
                i32.and
                i32.eqz
                br_if 0 (;@6;)
                local.get 7
                i32.const 1
                i32.lt_s
                br_if 1 (;@5;)
                local.get 6
                i32.const 3
                i32.shl
                local.tee 8
                i32.const 24
                i32.and
                local.set 2
                local.get 6
                i32.const -4
                i32.and
                local.tee 10
                i32.const 4
                i32.add
                local.set 1
                i32.const 0
                local.get 8
                i32.sub
                i32.const 24
                i32.and
                local.set 3
                local.get 10
                i32.load
                local.set 8
                loop  ;; label = @7
                  local.get 5
                  local.get 8
                  local.get 2
                  i32.shr_u
                  local.get 1
                  i32.load
                  local.tee 8
                  local.get 3
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
                  local.get 4
                  i32.lt_u
                  br_if 0 (;@7;)
                  br 2 (;@5;)
                end
              end
              local.get 7
              i32.const 1
              i32.lt_s
              br_if 0 (;@5;)
              local.get 6
              local.set 1
              loop  ;; label = @6
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
                local.get 4
                i32.lt_u
                br_if 0 (;@6;)
              end
            end
            local.get 9
            i32.const 3
            i32.and
            local.set 2
            local.get 6
            local.get 7
            i32.add
            local.set 1
          end
          local.get 2
          i32.eqz
          br_if 2 (;@1;)
          local.get 4
          local.get 2
          i32.add
          local.set 5
          loop  ;; label = @4
            local.get 4
            local.get 1
            i32.load8_u
            i32.store8
            local.get 1
            i32.const 1
            i32.add
            local.set 1
            local.get 4
            i32.const 1
            i32.add
            local.tee 4
            local.get 5
            i32.lt_u
            br_if 0 (;@4;)
            br 3 (;@1;)
          end
        end
        local.get 9
        i32.const 3
        i32.and
        local.tee 1
        i32.eqz
        br_if 1 (;@1;)
        local.get 7
        i32.const 0
        local.get 6
        i32.sub
        i32.add
        local.set 3
        local.get 4
        local.get 1
        i32.sub
        local.set 5
      end
      local.get 3
      i32.const -1
      i32.add
      local.set 1
      loop  ;; label = @2
        local.get 4
        i32.const -1
        i32.add
        local.tee 4
        local.get 1
        i32.load8_u
        i32.store8
        local.get 1
        i32.const -1
        i32.add
        local.set 1
        local.get 5
        local.get 4
        i32.lt_u
        br_if 0 (;@2;)
      end
    end
    local.get 0)
  (func $_ZN17compiler_builtins3mem6memcmp17h95f992c5648d6561E (type 5) (param i32 i32 i32) (result i32)
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
  (func $memcpy (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN17compiler_builtins3mem6memcpy17he2d289fa2eb42ef2E)
  (func $memmove (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN17compiler_builtins3mem7memmove17h269e2e7a3fe7eb2aE)
  (func $memcmp (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    local.get 1
    local.get 2
    call $_ZN17compiler_builtins3mem6memcmp17h95f992c5648d6561E)
  (table (;0;) 64 64 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (global (;1;) i32 (i32.const 1052353))
  (global (;2;) i32 (i32.const 1052368))
  (export "memory" (memory 0))
  (export "ulmDispatchCaller" (func $ulmDispatchCaller))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (elem (;0;) (i32.const 1) func $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1271070e2ca826daE $_ZN5bytes5bytes12static_clone17h8ee0bb07f5e580ccE $_ZN5bytes5bytes12owned_to_vec17hf4b7c7dcc83df6d0E $_ZN5bytes5bytes13static_to_mut17h581aa0a2fd8464aeE $_ZN5bytes5bytes16static_is_unique17h6e19e52823949186E $_ZN5bytes5bytes11static_drop17h80d4e6ae9b05ca89E $_ZN4core3ptr47drop_in_place$LT$erc20..ulm..impl_..UlmImpl$GT$17he64bf1bacb8d0b6cE $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$4log317h987612607e9e3762E $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$6caller17h6e5bbf9110a580a2E $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$16call_data_length17h5a8338a3b18df8f2E $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$9call_data17hde8d81abbe4336aeE $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$19get_account_storage17h6b89d1f69d088ff9E $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$19set_account_storage17ha7c75946c5f297f3E $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$10set_output17h316dcbd7c3c0529dE $_ZN62_$LT$erc20..ulm..impl_..UlmImpl$u20$as$u20$erc20..ulm..Ulm$GT$11keccak_hash17h3c94106cd859aaaeE $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1271070e2ca826daE.1 $_ZN4core3fmt3num52_$LT$impl$u20$core..fmt..Debug$u20$for$u20$usize$GT$3fmt17h1271070e2ca826daE.2 $_ZN5bytes5bytes12static_clone17h8ee0bb07f5e580ccE.llvm.5932322697774810047 $_ZN5bytes5bytes16static_is_unique17h6e19e52823949186E.llvm.5932322697774810047 $_ZN5bytes5bytes11static_drop17h80d4e6ae9b05ca89E.llvm.5932322697774810047 $_ZN5bytes5bytes21promotable_even_clone17hb745a8cb1d939a17E $_ZN5bytes5bytes22promotable_even_to_vec17h17500ac060bde60fE $_ZN5bytes5bytes22promotable_even_to_mut17h9b26d0f7fc64fa55E $_ZN5bytes5bytes20promotable_is_unique17h020665ac6bee7cfdE $_ZN5bytes5bytes20promotable_even_drop17h1682d63eeecce9a7E $_ZN5bytes5bytes20promotable_odd_clone17hcfb701ad3f082002E $_ZN5bytes5bytes21promotable_odd_to_vec17h5d8ea33109cb924cE $_ZN5bytes5bytes21promotable_odd_to_mut17h95bc9587e8fef346E $_ZN5bytes5bytes19promotable_odd_drop17hd9893b9965f4d03eE $_ZN4core3ptr53drop_in_place$LT$core..alloc..layout..LayoutError$GT$17h61bb72a6737affc4E $_ZN69_$LT$core..alloc..layout..LayoutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h2fd7406d7dcae69dE $_ZN5bytes5bytes12shared_clone17h87a7760eba5d0abeE.llvm.5932322697774810047 $_ZN5bytes5bytes13shared_to_vec17hc3c7c24fa33ba490E.llvm.5932322697774810047 $_ZN5bytes5bytes13shared_to_mut17ha7cdfa5747aa9e90E.llvm.5932322697774810047 $_ZN5bytes5bytes16shared_is_unique17h6b20a183193c4d3aE.llvm.5932322697774810047 $_ZN5bytes5bytes11shared_drop17hf3fb21e2b6b585c5E.llvm.5932322697774810047 $_ZN4core3fmt3num3imp52_$LT$impl$u20$core..fmt..Display$u20$for$u20$u32$GT$3fmt17h85fc646d908d0c7bE $_ZN5bytes9bytes_mut14shared_v_clone17h1f76e68986705f75E $_ZN5bytes9bytes_mut15shared_v_to_vec17he57e9e159f74f9c2E $_ZN5bytes9bytes_mut15shared_v_to_mut17h0a28fea12aa912d6E $_ZN5bytes9bytes_mut18shared_v_is_unique17h089cb643903ffe29E $_ZN5bytes9bytes_mut13shared_v_drop17hcb5bbcb630efea93E $_ZN3std5alloc24default_alloc_error_hook17h9d6d7bb51d97ec4fE $_ZN4core3ptr42drop_in_place$LT$alloc..string..String$GT$17he0b9c7b9b779f017E $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$9write_str17h932675f2c687b13fE $_ZN58_$LT$alloc..string..String$u20$as$u20$core..fmt..Write$GT$10write_char17h36d97d1c4726ee61E $_ZN4core3fmt5Write9write_fmt17h5450563fbb96cb70E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h88d3cb239ded0a8bE $_ZN4core3ptr122drop_in_place$LT$$RF$alloc..boxed..Box$LT$dyn$u20$core..error..Error$u2b$core..marker..Send$u2b$core..marker..Sync$GT$$GT$17hafb4b80ed40fbfe0E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17heb1b6f3656f479feE $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17h00db27ffc0f86bc9E $_ZN99_$LT$std..panicking..begin_panic_handler..StaticStrPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17h25e87be0acf0cba3E $_ZN4core3ptr77drop_in_place$LT$std..panicking..begin_panic_handler..FormatStringPayload$GT$17h0cdb96bb4afb8b69E $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$8take_box17he725486881b42bbeE $_ZN102_$LT$std..panicking..begin_panic_handler..FormatStringPayload$u20$as$u20$core..panic..PanicPayload$GT$3get17ha699b76f30386534E $_ZN4core3ptr29drop_in_place$LT$$LP$$RP$$GT$17hf58ee1d6076085b1E $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h9571516faba776b2E $_ZN63_$LT$core..cell..BorrowMutError$u20$as$u20$core..fmt..Debug$GT$3fmt17h81bacf94bd657e5cE $_ZN60_$LT$core..cell..BorrowError$u20$as$u20$core..fmt..Debug$GT$3fmt17h235ec3ceaa677e72E $_ZN42_$LT$$RF$T$u20$as$u20$core..fmt..Debug$GT$3fmt17h7a9a11a22d9e302cE $_ZN44_$LT$$RF$T$u20$as$u20$core..fmt..Display$GT$3fmt17h87ef43d072a4bed1E $_ZN4core3ptr37drop_in_place$LT$core..fmt..Error$GT$17h1c3f1cbd1368fccaE $_ZN36_$LT$T$u20$as$u20$core..any..Any$GT$7type_id17h4e5a4609280a40f1E)
  (data $.rodata (i32.const 1048576) "total_supplyallowancesTransfer(address,address,u256)src/erc20.rs4\00\10\00\0c\00\00\00/\00\00\00\18\00\00\00Approval(address,address,u256)\00\004\00\10\00\0c\00\00\00:\00\00\00\18\00\00\004\00\10\00\0c\00\00\00R\00\00\00,\00\00\004\00\10\00\0c\00\00\00\5c\00\00\00,\00\00\004\00\10\00\0c\00\00\00b\00\00\00.\00\00\00Invalid receiverInvalid senderInsufficient balanceZero addressInvalid spenderInvalid approverInsuficient allowanceValue too large to castAddition overflowSubtraction overflowUnexpected value in subtractionWrong length to decode\00\02\00\00\00\03\00\00\00\04\00\00\00\05\00\00\00\06\00\00\00/home/virgil/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bytes-1.9.0/src/bytes.rsrange start must not be greater than end:  <= \02\02\10\00*\00\00\00,\02\10\00\04\00\00\00\a8\01\10\00Z\00\00\00\86\01\00\00\09\00\00\00range end out of bounds: \00\00\00P\02\10\00\19\00\00\00,\02\10\00\04\00\00\00\a8\01\10\00Z\00\00\00\8c\01\00\00\09\00\00\00cannot advance past `remaining`: \00\00\00\8c\02\10\00!\00\00\00,\02\10\00\04\00\00\00\a8\01\10\00Z\00\00\00\c7\02\00\00\09\00\00\00/home/virgil/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bytes-1.9.0/src/bytes_mut.rs\00\00\d0\02\10\00^\00\00\00\81\04\00\00\09\00\00\00\07\00\00\00\00\00\00\00\01\00\00\00\08\00\00\00\09\00\00\00\0a\00\00\00\0b\00\00\00\0c\00\00\00\0d\00\00\00\0e\00\00\00\0f\00\00\00Buffer without function signaturedecimals()totalSupply()balanceOf(address)transfer(address,uint256)allowance(address,address)approve(address,uint256)transferFrom(address,address,uint256)mint(address,uint256)Unknown endpointsrc/erc20_dispatcher.rs\00\00K\04\10\00\17\00\00\000\00\00\00(\00\00\00K\04\10\00\17\00\00\00.\00\00\00(\00\00\00K\04\10\00\17\00\00\00,\00\00\00(\00\00\00K\04\10\00\17\00\00\00*\00\00\00(\00\00\00K\04\10\00\17\00\00\00(\00\00\00(\00\00\00K\04\10\00\17\00\00\00&\00\00\00(\00\00\00K\04\10\00\17\00\00\00$\00\00\00(\00\00\00K\04\10\00\17\00\00\00\22\00\00\00!\00\00\00K\04\10\00\17\00\00\00A\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00N\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00[\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00i\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00x\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00\87\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00\96\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00\a6\00\00\00\1f\00\00\00K\04\10\00\17\00\00\00\b4\00\00\00\1f\00\00\00cannot advance past `remaining`:  <= \00\00\00t\05\10\00!\00\00\00\95\05\10\00\04\00\00\00/home/virgil/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bytes-1.9.0/src/bytes.rs\00\00\ac\05\10\00Z\00\00\00\c7\02\00\00\09\00\00\00src/storage.rs\00\00\18\06\10\00\0e\00\00\00:\00\00\001\00\00\00\18\06\10\00\0e\00\00\00>\00\00\008\00\00\00\18\06\10\00\0e\00\00\00g\00\00\00;\00\00\00call_data: buffer too small.LayoutError\00\12\00\00\00\03\00\00\00\04\00\00\00\13\00\00\00\14\00\00\00/home/virgil/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bytes-1.9.0/src/bytes.rs <= split_off out of bounds: \00\f2\06\10\00\19\00\00\00\ee\06\10\00\04\00\00\00\94\06\10\00Z\00\00\00\fc\01\00\00\09\00\00\00\15\00\00\00\16\00\00\00\17\00\00\00\18\00\00\00\19\00\00\00\1a\00\00\00\1b\00\00\00\1c\00\00\00\18\00\00\00\1d\00\00\00called `Result::unwrap()` on an `Err` value\00\1e\00\00\00\00\00\00\00\01\00\00\00\1f\00\00\00\94\06\10\00Z\00\00\00D\05\00\002\00\00\00\94\06\10\00Z\00\00\00R\05\00\00I\00\00\00 \00\00\00!\00\00\00\22\00\00\00#\00\00\00$\00\00\00advance out of bounds: the len is  but advancing by \c4\07\10\00\22\00\00\00\e6\07\10\00\12\00\00\00/home/virgil/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bytes-1.9.0/src/lib.rs\08\08\10\00X\00\00\00\8a\00\00\00\05\00\00\00/home/virgil/.cargo/registry/src/index.crates.io-6f17d22bba15001f/bytes-1.9.0/src/bytes_mut.rsoverflow\00\00p\08\10\00^\00\00\00\d4\02\00\008\00\00\00p\08\10\00^\00\00\00\aa\02\00\00\15\00\00\00&\00\00\00'\00\00\00(\00\00\00)\00\00\00*\00\00\00,\00\00\00\0c\00\00\00\04\00\00\00-\00\00\00.\00\00\00/\00\00\00/rust/deps/dlmalloc-0.2.6/src/dlmalloc.rsassertion failed: psize >= size + min_overhead\00$\09\10\00)\00\00\00\a8\04\00\00\09\00\00\00assertion failed: psize <= size + max_overhead\00\00$\09\10\00)\00\00\00\ae\04\00\00\0d\00\00\00memory allocation of  bytes failed\00\00\cc\09\10\00\15\00\00\00\e1\09\10\00\0d\00\00\00library/std/src/alloc.rs\00\0a\10\00\18\00\00\00b\01\00\00\09\00\00\00library/std/src/panicking.rs(\0a\10\00\1c\00\00\00\8b\02\00\00\1e\00\00\00,\00\00\00\0c\00\00\00\04\00\00\000\00\00\001\00\00\00\08\00\00\00\04\00\00\002\00\00\001\00\00\00\08\00\00\00\04\00\00\003\00\00\004\00\00\005\00\00\00\10\00\00\00\04\00\00\006\00\00\007\00\00\008\00\00\00\00\00\00\00\01\00\00\009\00\00\00capacity overflow\00\00\00\ac\0a\10\00\11\00\00\00library/alloc/src/raw_vec.rs\c8\0a\10\00\1c\00\00\00\19\00\00\00\05\00\00\00BorrowErrorBorrowMutErroralready borrowed: \00\0d\0b\10\00\12\00\00\00already mutably borrowed: \00\00(\0b\10\00\1a\00\00\00\01\00\00\00\00\00\00\00called `Option::unwrap()` on a `None` value\00>\00\00\00\00\00\00\00\01\00\00\00?\00\00\00: \00\00\01\00\00\00\00\00\00\00\90\0b\10\00\02\00\00\00library/core/src/fmt/num.rs\00\a4\0b\10\00\1b\00\00\00i\00\00\00\17\00\00\000x00010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899range start index  out of range for slice of length \00\00\9a\0c\10\00\12\00\00\00\ac\0c\10\00\22\00\00\00"))
