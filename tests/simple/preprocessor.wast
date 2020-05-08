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

  (func (export "baf") (param $a i32) (result i32)
    i32.const 1
    if (result i32)
      local.get $a
    else
      local.get $a
    end
  )

  (func $far (param $a i32) (result i32) (local $b i64)
    local.get $a
  )
)

(assert_return (invoke "foo" (i32.const 7)) (i32.const 7))
(assert_return (invoke "bar" (i32.const 7)) (i32.const 7))
(assert_return (invoke "baz" (i32.const 7)) (i32.const 7))
(assert_return (invoke "baf" (i32.const 7)) (i32.const 7))

#assertFunction $far [ i32 ] -> [ i32 ] [ i64 ] "identifiers are erased inside module"

#clearConfig

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

(func (export "baf") (param $a i32) (result i32)
  i32.const 1
  if (result i32)
    local.get $a
  else
    local.get $a
  end
)

(func $far (param $a i32) (result i32) (local $b i64)
  local.get $a
)

(assert_return (invoke "foo" (i32.const 7)) (i32.const 7))
(assert_return (invoke "bar" (i32.const 7)) (i32.const 7))
(assert_return (invoke "baz" (i32.const 7)) (i32.const 7))
(assert_return (invoke "baf" (i32.const 7)) (i32.const 7))

#assertFunction $far [ i32 ] -> [ i32 ] [ i64 ] "identifiers are erased outside module"

#clearConfig