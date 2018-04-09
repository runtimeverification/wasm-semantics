;; Simple add function

(func 0 :: [ i32 i32 ] -> [ i32 ]
    [ ]
    get_local 0
    get_local 1
    i32.add
    return
)

i32.const 7
i32.const 8
invoke 0
#assertTopStack < i32 > 15 "invoke function 0"
#assertFunction 0          "invoke function 0 exists"

;; Remove return statement

(func 0 param i32 i32 result i32
    get_local 0
    get_local 1
    i32.add
)

i32.const 7
i32.const 8
invoke 0
#assertTopStack < i32 > 15 "invoke function 0 no return"
#assertFunction 0          "invoke function 0 exists no return"

;; More complicated function with locals

(func 1 param i64 i64 i64 result i64 local i64
    get_local 0
    get_local 1
    i64.add
    get_local 2
    i64.sub
    set_local 3
    get_local 3
    return
)

i64.const 100
i64.const 43
i64.const 22
invoke 1
#assertTopStack < i64 > 35 "invoke function 1"
#assertFunction 1          "invoke function 1 exists"
