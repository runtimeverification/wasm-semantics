(module)

(module $id
  (func (export "foo") (param $a i32) (result i32)
    local.get $a
  )

  (func (export "bar") (param $a i32) (result i32)
    block (result i32)
      local.get $a
    end
  )

  (func (export "baz") (param $a i32) (result i32)
    loop (result i32)
      local.get $a
    end
  )

  (func (export "baz") (param $a i32) (result i32)
    i32.const 1
    if (result i32)
      local.get $a
    else
      local.get $a
    end
  )
)

(assert_return (invoke "foo" (i32.const 7)) (i32.const 7))
(assert_return (invoke "bar" (i32.const 7)) (i32.const 7))
#clearConfig