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
#assertFunction 0 [ i32 i32 ] -> [ i32 ] [ ] "invoke function 0 exists"

;; String-named add function

(func $add :: [ i32 i32 ] -> [ i32 ]
    [ ]
    get_local 0
    get_local 1
    i32.add
    return
)

#assertFunction $add [ i32 i32 ] -> [ i32 ] [ ] "function string-named add"

;; Exported name add function

(func export $add param i32 i32 result i32
    get_local 0
    get_local 1
    i32.add
    return
)

#assertFunction $add [ i32 i32 ] -> [ i32 ] [ ] "exported function name add"

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
#assertFunction 0 [ i32 i32 ] -> [ i32 ] [ ] "invoke function 0 exists no return"

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
#assertFunction 1 [ i64 i64 i64 ] -> [ i64 ] [ i64 ] "invoke function 1 exists"

;; Function with complicated declaration of types

(func 1 local i32 result i32 param i32 i64 param i64
    get_local 0
    return
)

i64.const 7
i64.const 8
i32.const 5
invoke 1
#assertTopStack < i32 > 5 "out of order type declaration"
#assertFunction 1 [ i32 i64 i64 ] -> [ i32 ] [ i32 ] "out of order type declarations"

;; Function with empty declarations of types

(func 1 local param i64 i64 result local result i64 param
    get_local 0
    return
)

i64.const 7
i64.const 8
invoke 1
#assertTopStack < i64 > 8 "empty type declaration"
#assertFunction 1 [ i64 i64 ] -> [ i64 ] [ ] "empty type declarations"

;; Function with empty declarations of types, and bracketed in parentheses

(func 1 (local) (param i64 i64) (result) (local) (result i64) (param)
    get_local 0
    return
)

i64.const 7
i64.const 8
invoke 1
#assertTopStack < i64 > 8 "empty type declaration + parens"
#assertFunction 1 [ i64 i64 ] -> [ i64 ] [ ] "empty type declarations + parens"

;; Function with just a name

(func 3)

#assertFunction 3 [ ] -> [ ] [ ] "no domain/range or locals"
