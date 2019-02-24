( memory 0 10 )

(memory.size)
#assertTopStack <i32> 0 "initial memory size 0"

(memory.grow (i32.const 10))
(memory.size)
#assertStack <i32> 10 : < i32 > 0 : .Stack "memory grow"
(memory.grow (i32.const 1))
#assertTopStack <i32> -1 "memory grow"


(i32.const 1)
#assertTopStack <i32> 1 "dummy test"
