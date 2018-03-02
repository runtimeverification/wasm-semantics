i32.const 32
i32.const 2
i32.lt_u
#assertTopStack < i32 > 1 "lt_u"

i32.const 32
i32.const 2
i32.gt_u
#assertTopStack < i32 > 0 "gt_u"

i32.const #pow31 +Int 15
i32.const #pow31 +Int 7
i32.lt_s
#assertTopStack < i32 > 1 "lt_s"

i32.const #pow31 +Int 15
i32.const #pow31 +Int 7
i32.gt_s
#assertTopStack < i32 > 0 "gt_s"

i32.const 32
i32.const 2
i32.le_u
#assertTopStack < i32 > 1 "le_u 1"

i32.const 32
i32.const 32
i32.le_u
#assertTopStack < i32 > 1 "le_u 2"

i32.const 32
i32.const 2
i32.ge_u
#assertTopStack < i32 > 0 "ge_u 1"

i32.const 32
i32.const 32
i32.ge_u
#assertTopStack < i32 > 1 "ge_u 2"

i32.const #pow31 +Int 15
i32.const #pow31 +Int 7
i32.le_s
#assertTopStack < i32 > 1 "le_s 1"

i32.const 32
i32.const 32
i32.le_s
#assertTopStack < i32 > 1 "le_s 2"

i32.const #pow31 +Int 15
i32.const #pow31 +Int 7
i32.ge_s
#assertTopStack < i32 > 0 "ge_s 1"

i32.const 32
i32.const 32
i32.ge_s
#assertTopStack < i32 > 1 "ge_s 2"

// TODO: add tests of `_s` operators where one number is negative, one positive
