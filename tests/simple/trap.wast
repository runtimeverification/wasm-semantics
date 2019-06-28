(assert_trap
  (module (func $main (unreachable)) (start $main))
  "unreachable"
)

(module
    (memory 0)

    (func (export "load_at_zero") (result i32) (i32.load (i32.const 0)))
    (func (export "store_at_zero") (i32.store (i32.const 0) (i32.const 2)))
)

(assert_trap (invoke "store_at_zero") "out of bounds memory access")
(assert_trap (invoke "load_at_zero") "out of bounds memory access")

(module
  (func (export "no_dce.i32.div_s") (param i32) (param i32)
    (drop (i32.div_s (local.get 0) (local.get 1))))
  (func (export "no_dce.i32.div_u") (param i32) (param i32)
    (drop (i32.div_u (local.get 0) (local.get 1))))
  (func (export "no_dce.i64.div_s") (param i64) (param i64)
    (drop (i64.div_s (local.get 0) (local.get 1))))
  (func (export "no_dce.i64.div_u") (param i64) (param i64)
    (drop (i64.div_u (local.get 0) (local.get 1))))
)

(assert_trap (invoke "no_dce.i32.div_s" (i32.const 1) (i32.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i32.div_u" (i32.const 1) (i32.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i64.div_s" (i64.const 1) (i64.const 0)) "integer divide by zero")
(assert_trap (invoke "no_dce.i64.div_u" (i64.const 1) (i64.const 0)) "integer divide by zero")

#clearConfig
