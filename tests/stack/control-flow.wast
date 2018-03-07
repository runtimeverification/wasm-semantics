block [ i32 i32 i32 ]
    i32.const 1
    i32.const 2
    i32.const 3
end
#assertStack < i32 > 3 : < i32 > 2 : < i32 > 1 : .Stack "block 1"

block [ i32 i32 ]
    i32.const 1
    i32.const 2
    i32.const 3
    drop
end
#assertStack < i32 > 2 : < i32 > 1 : .Stack "block 2"

block [ i32 i32 ]
    i32.const 1
    i32.const 2
    i32.const 3
end
#assertStack < i32 > 3 : < i32 > 2 : .Stack "block 3 (invalid)"

i32.const 1
i32.const 2
block [ ]
    i32.const 3
    br 0
    i32.const 4
    br 0
end
#assertStack < i32 > 2 : < i32 > 1 : .Stack "block 4"

i32.const 1
if [ i32 ] i32.const 1 else i32.const -1 end
#assertTopStack < i32 > 1 "if true"

i32.const 0
if [ i32 ] i32.const 1 else i32.const -1 end
#assertTopStack < i32 > -1 "if false"
