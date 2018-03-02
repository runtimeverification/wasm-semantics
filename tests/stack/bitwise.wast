i32.const 20
i32.const 18
i32.and
#assertTopStack < i32 > 16 "and"

i32.const 20
i32.const 18
i32.or
#assertTopStack < i32 > 22 "or"

i32.const 20
i32.const 18
i32.xor
#assertTopStack < i32 > 6 "xor"

i32.const 2
i32.const 1
i32.shl
#assertTopStack < i32 > 4 "shl 1"

i32.const 2
i32.const #pow31 +Int 1
i32.shl
#assertTopStack < i32 > 4 "shl 2"

i32.const 2
i32.const #pow31
i32.shr_u
#assertTopStack < i32 > 2 ^Int 29 "shr_u 1"

i32.const 2
i32.const 2
i32.shr_u
#assertTopStack < i32 > 0 "shr_u 2"

i32.const 1
i32.const #pow32 -Int 2
i32.shr_s
#assertTopStack < i32 > #pow32 -Int 1 "shr_s 1"

i32.const 2
i32.const 2
i32.shr_s
#assertTopStack < i32 > 0 "shr_s 2"

i32.const 3
i32.const #pow31 +Int 2
i32.rotl
#assertTopStack < i32 > 20 "rotl"

i32.const 3
i32.const #pow31 +Int 16
i32.rotr
#assertTopStack < i32 > 2 ^Int 28 +Int 2 "rotr"
