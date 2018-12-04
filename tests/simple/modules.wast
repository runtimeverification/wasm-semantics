(module
    (func $add :: [ i32 i32 ] -> [ i32 ]
        [ ]
        get_local 0
        get_local 1
        i32.add
        return
    )

    (func $mul :: [ i32 i32 ] -> [ i32 ]
        [ ]
        get_local 0
        get_local 1
        i32.mul
        return
    )

    (func (export "xor") (param i32 i32) (result i32)
        get_local 0
        get_local 1
        i32.xor
    )
)

i32.const 3
i32.const 5
invoke "add"
#assertTopStack < i32 > 8 "add in module correctly"

i32.const 3
i32.const 5
invoke "mul"
#assertTopStack < i32 > 15 "mul in module correctly"

i32.const 3
i32.const 5
invoke "xor"
#assertTopStack < i32 > 6 "xor in module correctly"

#assertFunction "add" [ i32 i32 ] -> [ i32 ] [ ] "add function typed correctly"
#assertFunction "mul" [ i32 i32 ] -> [ i32 ] [ ] "mul function typed correctly"
#assertFunction "xor" [ i32 i32 ] -> [ i32 ] [ ] "xor function typed correctly"

(module
    (func "f1" :: [ i32 i32 ] -> [ i32 ]
        [ i32 ]
        get_local 0
        get_local 1
        i32.add
        set_local 2
        get_local 0
        get_local 2
        i32.mul
        return
    )

    (func "f2" :: [ i32 i32 i32 ] -> [ i32 ]
        [ i32 i32 ]
        get_local 0
        get_local 2
        invoke "f1"
        get_local 1
        invoke "f1"
        get_local 0
        i32.mul
        return
    )
)

i32.const 3
i32.const 5
invoke "f1"
i32.const 5
i32.const 8
invoke "f2"
#assertTopStack < i32 > 77000 "nested method call"
#assertFunction "f2" [ i32 i32 i32 ] -> [ i32 ] [ i32 i32 ] "outer calling method"
#assertFunction "f1" [ i32 i32     ] -> [ i32 ] [ i32     ] "inner calling method"
