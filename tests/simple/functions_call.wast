;; Simple add function

(type $a-cool-type (func (param i32 i32 ) ( result i32 )))
#assertType $a-cool-type [ i32 i32 ] -> [ i32 ]
#assertType 0 [ i32 i32 ] -> [ i32 ]
#assertNextTypeIdx 1

(func $0 (type $a-cool-type)
    (local.get 0)
    (local.get 1)
    (i32.add)
    (return)
)
#assertNextTypeIdx 1

(i32.const 7)
(i32.const 8)
(call $0)
#assertTopStack < i32 > 15 "call function 0"
#assertFunction 0 [ i32 i32 ] -> [ i32 ] [ ] "call function 0 exists"

;; String-named add function

(func $add (type $a-cool-type) (param i32 i32 ) ( result i32 )
    (local.get 0)
    (local.get 1)
    (i32.add)
    (return)
)

#assertFunction $add [ i32 i32 ] -> [ i32 ] [ ] "function string-named add"
#assertNextTypeIdx 1

;; Remove return statement

(func $0 param i32 i32 result i32
    (local.get 0)
    (local.get 1)
    (i32.add)
)

(i32.const 7)
(i32.const 8)
(call $0)
#assertTopStack < i32 > 15 "call function 0 no return"
#assertFunction $0 [ i32 i32 ] -> [ i32 ] [ ] "call function 0 exists no return"
#assertNextTypeIdx 1

;; More complicated function with locals

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

(i64.const 100)
(i64.const 43)
(i64.const 22)
(call $1)
#assertTopStack < i64 > 35 "call function 1"
#assertFunction $1 [ i64 i64 i64 ] -> [ i64 ] [ i64 ] "call function 1 exists"
#assertType 1 [ i64 i64 i64 ] -> [ i64 ]
#assertNextTypeIdx 2

;; Function with complicated declaration of types

(func $2 result i32 param i32 i64 param i64 local i32
    (local.get 0)
    (return)
)

(i64.const 7)
(i64.const 8)
(i32.const 5)
(call $2)
#assertTopStack < i32 > 5 "out of order type declaration"
#assertFunction $2 [ i32 i64 i64 ] -> [ i32 ] [ i32 ] "out of order type declarations"
#assertNextTypeIdx 3

;; Function with empty declarations of types

(func $1 param i64 i64 result result i64 param local
    (local.get 0)
    (return)
)

(i64.const 7)
(i64.const 8)
(call $1)
#assertTopStack < i64 > 8 "empty type declaration"
#assertFunction $1 [ i64 i64 ] -> [ i64 ] [ ] "empty type declarations"
#assertNextTypeIdx 4

;; Function with empty declarations of types, and bracketed in parentheses

(func $1 (param i64 i64) (result) (result i64) (param) (local)
    (local.get 0)
    (return)
)

(i64.const 7)
(i64.const 8)
(call $1)
#assertTopStack < i64 > 8 "empty type declaration + parens"
#assertFunction $1 [ i64 i64 ] -> [ i64 ] [ ] "empty type declarations + parens"
#assertNextTypeIdx 4

;; Function with just a name

(func $3)
(export "return-null" (func $3) )
(assert_return (invoke "return-null"))

#assertFunction $3 [ ] -> [ ] [ ] "no domain/range or locals"

(module
    (func $add (export "add")
        (param i32 i32)
        (result i32)
        (local.get 0)
        (local.get 1)
        (i32.add)
        (return)
    )

    (func $mul (export "mul")
        (param i32 i32)
        (result i32)
        (local.get 0)
        (local.get 1)
        (i32.mul)
        (return)
    )

    (func $xor (export "xor") (param i32 i32) (result i32)
        (local.get 0)
        (local.get 1)
        (i32.xor)
    )
)

(assert_return (invoke "add" (i32.const 3) (i32.const 5)) (i32.const 8))
(assert_return (invoke "mul" (i32.const 3) (i32.const 5)) (i32.const 15))
(assert_return (invoke "xor" (i32.const 3) (i32.const 5)) (i32.const 6))

#assertFunction $add [ i32 i32 ] -> [ i32 ] [ ] "add function typed correctly"
#assertFunction $mul [ i32 i32 ] -> [ i32 ] [ ] "mul function typed correctly"
#assertFunction $xor [ i32 i32 ] -> [ i32 ] [ ] "xor function typed correctly"
#assertNextTypeIdx 1

(module
    (func $f1 (param i32 i32 ) (result i32) (local i32)
        (local.get 0)
        (local.get 1)
        (i32.add)
        (local.set 2)
        (local.get 0)
        (local.get 2)
        (i32.mul)
        (return)
    )

    (func $f2 (param i32 i32 i32 ) (result i32) (local i32 i32)
        (local.get 0)
        (local.get 2)
        (call $f1)
        (local.get 1)
        (call $f1)
        (local.get 0)
        (i32.mul)
        (return)
    )
)

(i32.const 3)
(i32.const 5)
(call $f1)
(i32.const 5)
(i32.const 8)
(call $f2)
#assertTopStack < i32 > 77000 "nested method call"
#assertFunction $f2 [ i32 i32 i32 ] -> [ i32 ] [ i32 i32 ] "outer calling method"
#assertFunction $f1 [ i32 i32     ] -> [ i32 ] [ i32     ] "inner calling method"

(module
    (func $dummy)

    (func $add (param i32 i32) (result i32)
        (local.get 0)
        (local.get 1)
        (i32.add)
        (return)
    )
)

#assertFunction $dummy [         ] -> [     ] [ ] "$dummy function in module"
#assertFunction $add   [ i32 i32 ] -> [ i32 ] [ ] "second function in module"

#clearConfig
