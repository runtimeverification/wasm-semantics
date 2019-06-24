(module)
;; test function export

(func $1 param i64 i64 i64 result i64 local i64
        (local.get 2)
          (local.get 0)
          (local.get 1)
        (i64.add)
      (i64.sub)
    (local.set 3)
    (local.get 3)
    (return)
)
( export "export-1" (func $1) )

(assert_return (invoke "export-1" (i64.const 100) (i64.const 43) (i64.const 22)) (i64.const 35))

#assertFunction $1 [ i64 i64 i64 ] -> [ i64 ] [ i64 ] "call function 1 exists"

;; test inline export

(func $2 (export "cool-align-1") (export "cool-align-2") result i32 param i32 i64 param i64 local i32
    (local.get 0)
    (return)
)

(assert_return (invoke "cool-align-1" (i64.const 7) (i64.const 8) (i32.const 3)) (i32.const 3))
(assert_return (invoke "cool-align-2" (i64.const 7) (i64.const 8) (i32.const 2)) (i32.const 2))

#assertFunction $2 [ i32 i64 i64 ] -> [ i32 ] [ i32 ] "out of order type declarations"

(func (export "export-without-id") result i32 param i32 i64 param i64 local i32
    (local.get 0)
    (return)
)

(assert_return (invoke "export-without-id" (i64.const 7) (i64.const 8) (i32.const 1)) (i32.const 1))

#assertFunction 2 [ i32 i64 i64 ] -> [ i32 ] [ i32 ] "removing a function by its inner index"

#clearConfig
