i32.const 5
i32.const 7
i32.add

i32.const 5
i32.const 7
i32.sub

i32.const 15
i32.const 3
i32.mul

i32.const 3
i32.const 15
i32.div_u

i32.const 2
i32.const 15
i32.div_u

i32.const 3
i32.const 15
i32.rem_u

i32.const 2
i32.const 15
i32.rem_u

i32.const 20
i32.const 18
i32.and

i32.const 20
i32.const 18
i32.or

i32.const 20
i32.const 18
i32.xor

i32.const 0
i32.eqz

i32.const 3
i32.eqz

i32.const 3
i32.const 3
i32.eq

i32.const 3
i32.const 4
i32.eq

i32.const 3
i32.const 3
i32.ne

i32.const 3
i32.const 4
i32.ne

i32.const #unsigned(i32, #signed(i32, 0))
i32.const 0
i32.eq

i32.const #unsigned(i32, #signed(i32, #pow31))
i32.const #pow31
i32.eq

i32.const #unsigned(i32, #signed(i32, #pow32 -Int 1))
i32.const #pow32 -Int 1
i32.eq

i64.const #unsigned(i64, #signed(i64, 0))
i64.const 0
i64.eq

i64.const #unsigned(i64, #signed(i64, #pow63))
i64.const #pow63
i64.eq

i64.const #unsigned(i64, #signed(i64, #pow64 -Int 1))
i64.const #pow64 -Int 1
i64.eq

i32.const 5
i32.const #pow31 +Int 15
i32.div_s

i32.const 7
i32.const #pow31 +Int 15
i32.rem_s
