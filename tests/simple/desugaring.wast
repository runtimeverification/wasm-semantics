(module
  (func (export "foo") (result i32) (i32.const 0))
  (func (export "bar") (result i32) (i32.const 1))
)

(register "a")

(module
  (func (import "a" "bar") (result i32))
  (import "a" "foo" (func (result i32)))
  (export "bar" (func 0) )
)

(assert_return (invoke "bar") (i32.const 1))

(module
  (data (offset (i32.const 0)) "b")
  (memory (data "a"))
  (func (export "baz") (result i32)
    (i32.load (i32.const 0))
  )
)

(assert_return (invoke "baz") (i32.const 97))

#clearConfig
