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

#clearModules
