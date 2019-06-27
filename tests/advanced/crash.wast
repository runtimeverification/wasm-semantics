(module
  (func $func (param i32 i32) (result i32) (local.get 0))
  (func (export "aaa") (result i32)
    (block (result i32)
      (call $func
        (block (result i32) (i32.const 1)) (i32.const 2)
      )
    )
  )
)

(assert_return (invoke "aaa") (i32.const 1))
