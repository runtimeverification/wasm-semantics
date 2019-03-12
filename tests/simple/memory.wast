( memory )
#assertEmptyMemory 0 .MemBound "memory initial 1"

( memory 34)
#assertEmptyMemory 34 .MemBound "memory initial 2"

( memory 4 10 )
#assertEmptyMemory 4 10 "memory initial 3"

( memory 0 10 )
(memory.size)
#assertTopStack <i32> 0 "memory.size 1"
#assertEmptyMemory 0 10 "memory ungrown"

( memory 0 10 )
(memory.grow (i32.const 10))
(memory.size)
#assertStack <i32> 10 : < i32 > 0 : .Stack "memory grow"
(memory.grow (i32.const 1))
#assertTopStack <i32> -1 "memory grow"
#assertEmptyMemory 10 10 "memory grown"

( memory #maxMemorySize())
(memory.grow (i32.const 1))
#assertTopStack <i32> -1 "memory grow max too large"
#assertEmptyMemory #maxMemorySize() .MemBound "memory grow max too large"

( memory )
(memory.grow (i32.const #maxMemorySize()))
(memory.size)
#assertStack <i32> #maxMemorySize() : < i32 > 0 : .Stack "memory grow unbounded"
(memory.grow (i32.const 1))
(memory.size)
#assertStack <i32> #maxMemorySize() : < i32 > -1 : .Stack "memory grow unbounded"
#assertEmptyMemory #maxMemorySize() .MemBound "memory grown unbounded"

;; Store and load

(memory 1)
(i32.const 1)
(i64.const 1)
(i64.store offset=2)
#assertMemoryData (3, 1) "store is little endian"
(i32.const 1)
(i64.const 257)
(i64.store8 offset=2)
#assertMemoryData (3, 1) "store8"
(i32.const 1)
(i64.const 65537)
(i64.store16 offset=2)
#assertMemoryData (3, 1) "store16"
(i32.const 1)
(i64.const #pow(i32) +Int 1)
(i64.store16 offset=2)
#assertMemoryData (3, 1) "store32"
#assertEmptyMemory 1 .MemBound ""

(memory 0)
(i32.const 0)
(i32.const 0)
(i32.store8)
#assertTrap "store to 0 size memory"
#assertEmptyMemory 0 .MemBound ""

(memory 1)
(i32.const 65535)
(i32.const 1)
(i32.store8)
#assertMemoryData (65535, 1) "store to memory edge"
(i32.const 65535)
(i32.const 1)
(i32.store16)
#assertTrap "store outside of size memory"
#assertEmptyMemory 1 .MemBound ""

(memory 1)
(i64.store (i32.const 15) (i64.const #pow(i32) -Int 1))
(i32.const 15)
(i32.load8_u)
#assertTopStack <i32> 255 "load8 unsigned"


;; Here's a weird bug I don't understand, in load8

(i32.load8_s (i32.const 0))              ;; Works
#assertTopStack <i32> 0 "load8 signed"
(i32.load8_s (i32.const 2))              ;; Works
#assertTopStack <i32> 0 "load8 signed"
(i32.const 1)
(i32.load8_s)                            ;; Works
#assertTopStack <i32> 0 "load8 signed"
(i32.load8_s align=1 (i32.const 0))      ;; Works
#assertTopStack <i32> 0 "load8 signed"
(i32.load8_s (i32.const 1))              ;; Doesn't work!
#assertTopStack <i32> 0 "load8 signed"

#assertMemoryData (15, 255) ""
#assertMemoryData (16, 255) ""
#assertMemoryData (17, 255) ""
#assertMemoryData (18, 255) ""
#assertEmptyMemory 1 .MemBound ""

