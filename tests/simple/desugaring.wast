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

#clearConfig
