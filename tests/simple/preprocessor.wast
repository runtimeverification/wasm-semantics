(module)

(module $id
  (func (export "foo") (param $a i32) (result i32)
    local.get $a
  )
)

(assert_return (invoke "foo" (i32.const 7)) (i32.const 7))
#clearConfig