(module)

(module $id
  (func (export "foo") (param $a i32) (result i32)
    local.get $a
  )

  (func (export "bar") (param $a i32) (result i32)
    block
      local.get $a
    end
  )
)

(assert_return (invoke "foo" (i32.const 7)) (i32.const 7))
(assert_return (invoke "bar" (i32.const 7)) (i32.const 7))
#clearConfig