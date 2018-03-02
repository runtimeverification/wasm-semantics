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
