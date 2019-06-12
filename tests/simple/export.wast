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

(i64.const 100)
(i64.const 43)
(i64.const 22)
(invoke "export-1")
#assertTopStack < i64 > 35 "call export function export-1"
#assertFunction $1 [ i64 i64 i64 ] -> [ i64 ] [ i64 ] "call function 1 exists"

;; test inline export

(func $2 (export "cool-align-1") (export "cool-align-2") result i32 param i32 i64 param i64 local i32
    (local.get 0)
    (return)
)

(i64.const 7)
(i64.const 8)
(i32.const 4)
(call $2)
#assertTopStack < i32 > 4 "out of order type declaration - call with identifier"

(i64.const 7)
(i64.const 8)
(i32.const 3)
(invoke "cool-align-1")
#assertTopStack < i32 > 3 "out of order type declaration - call with name"

(i64.const 7)
(i64.const 8)
(i32.const 2)
(invoke "cool-align-2")
#assertTopStack < i32 > 2 "out of order type declaration - call with name"

#assertFunction $2 [ i32 i64 i64 ] -> [ i32 ] [ i32 ] "out of order type declarations"

(func (export "export-without-id") result i32 param i32 i64 param i64 local i32
    (local.get 0)
    (return)
)

(i64.const 7)
(i64.const 8)
(i32.const 1)
(invoke "export-without-id")
#assertTopStack < i32 > 1 "export-without-id"

#assertFunction 0 [ i32 i64 i64 ] -> [ i32 ] [ i32 ] "removing a function by its inner index"

#clearModules
