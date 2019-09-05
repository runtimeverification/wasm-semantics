(assert_trap
  (module (func $main (unreachable)) (start $main))
  "unreachable"
)

(module
    (memory 0)

    (func (export "load_at_zero") (result i32) (i32.load (i32.const 0)))
    (func (export "store_at_zero") (i32.store (i32.const 0) (i32.const 2)))
)

#clearConfig
