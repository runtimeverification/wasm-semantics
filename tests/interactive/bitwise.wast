i32.const 2
i32.const 1
i32.shl
i32.const 4
i32.eq

i32.const 2
i32.const #pow31 +Int 1
i32.shl
i32.const 4
i32.eq

i32.const 2
i32.const #pow31
i32.shr_u
i32.const 2 ^Int 29
i32.eq

i32.const 2
i32.const 2
i32.shr_u
i32.const 0
i32.eq

i32.const 1
i32.const #pow32 -Int 2
i32.shr_s
i32.const #pow32 -Int 1
i32.eq

i32.const 2
i32.const 2
i32.shr_s
i32.const 0
i32.eq

i32.const 3
i32.const #pow31 +Int 2
i32.rotl
i32.const 20
i32.eq

i32.const 3
i32.const #pow31 +Int 16
i32.rotr
i32.const 2 ^Int 28 +Int 2
i32.eq
