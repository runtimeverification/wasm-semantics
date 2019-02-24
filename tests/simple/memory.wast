( memory 0 10 )
#assertMemory 0 some 10 "memory initial"

( memory 0 10 )
(memory.size)
#assertTopStack <i32> 0 "memory.size 1"
#assertMemory 0 some 10 "memory ungrown"

( memory 0 10 )
(memory.grow (i32.const 10))
(memory.size)
#assertStack <i32> 10 : < i32 > 0 : .Stack "memory grow"
(memory.grow (i32.const 1))
#assertTopStack <i32> -1 "memory grow"
#assertMemory 10 some 10 "memory grown"

