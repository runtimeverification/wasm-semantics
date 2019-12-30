(module
  (func (export "foo") (result i32) (i32.const 0))
  (func (export "bar") (result i32) (i32.const 1))
)

(register "a")

;; Test that imports get ordered correctly.
;; Function "bar" should get index 0, since it is imported first.
(module
  (func (import "a" "bar") (result i32))
  (import "a" "foo" (func (result i32)))
  (export "bar" (func 0) )
)

(assert_return (invoke "bar") (i32.const 1))

;; Test that data initializations get ordered correctly.
;; The results of the inlined `data` should overwrite the results of the non-inlined data.
(module
  (data (offset (i32.const 0)) "b")
  (memory (data "a"))
  (func (export "baz") (result i32)
    (i32.load (i32.const 0))
  )
)

(assert_return (invoke "baz") (i32.const 97))

;; Same as above but for `elem`
(module
  (elem (offset (i32.const 0)) 0)
  (table funcref (elem 1))
  (func (result i32) (i32.const 0))
  (func (result i32) (i32.const 1))
  (func (export "biz") (result i32)
    (call_indirect (result i32) (i32.const 0))
  )
)

(assert_return (invoke "biz") (i32.const 1))

#clearConfig
