i32.const 5
i32.const 7
i32.add
#assertTopStack < i32 > 12 "add"

i32.const 5
i32.const 7
i32.sub
#assertTopStack < i32 > 2 "sub"

i32.const 15
i32.const 3
i32.mul
#assertTopStack < i32 > 45 "mul"

i32.const 3
i32.const 15
i32.div_u
#assertTopStack < i32 > 5 "div_u1"

i32.const 2
i32.const 15
i32.div_u
#assertTopStack < i32 > 7 "div_u2"

i32.const 3
i32.const 15
i32.rem_u
#assertTopStack < i32 > 0 "rem_u1"

i32.const 2
i32.const 15
i32.rem_u
#assertTopStack < i32 > 1 "rem_u2"

i32.const 5
i32.const #pow31 +Int 15
i32.div_s
#assertTopStack < i32 > 0 "div_s"

i32.const 7
i32.const #pow31 +Int 15
i32.rem_s
#assertTopStack < i32 > 0 "rem_s"

// TODO: Add more tests of div_s/rem_s

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

i32.const 0
i32.eqz
#assertTopStack < i32 > 1 "eqz1"

i32.const 3
i32.eqz
#assertTopStack < i32 > 0 "eqz2"

i32.const 3
i32.const 3
i32.eq
#assertTopStack < i32 > 1 "eq1"

i32.const 3
i32.const 4
i32.eq
#assertTopStack < i32 > 0 "eq2"

i32.const 3
i32.const 3
i32.ne
#assertTopStack < i32 > 0 "ne1"

i32.const 3
i32.const 4
i32.ne
#assertTopStack < i32 > 1 "ne2"

i32.const #unsigned(i32, #signed(i32, 0))
#assertTopStack < i32 > 0 "#unsigned . #signed 1"

i32.const #unsigned(i32, #signed(i32, #pow31))
#assertTopStack < i32 > #pow31 "#unsigned . #signed 2"

i32.const #unsigned(i32, #signed(i32, #pow32 -Int 1))
#assertTopStack < i32 > #pow32 -Int 1 "#unsigned . #signed 3"

i64.const #unsigned(i64, #signed(i64, 0))
#assertTopStack < i64 > 0 "#unsigned . #signed 4"

i64.const #unsigned(i64, #signed(i64, #pow63))
#assertTopStack < i64 > #pow63 "#unsigned . #signed 5"

i64.const #unsigned(i64, #signed(i64, #pow64 -Int 1))
#assertTopStack < i64 > #pow64 -Int 1 "#unsigned . #signed 6"
