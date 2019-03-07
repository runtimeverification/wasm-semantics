( memory )
#assertMemory 0 .MemBound "memory initial 1"

( memory 34)
#assertMemory 34 .MemBound "memory initial 2"

( memory 4 10 )
#assertMemory 4 10 "memory initial 3"

( memory 0 10 )
(memory.size)
#assertTopStack <i32> 0 "memory.size 1"
#assertMemory 0 10 "memory ungrown"

( memory 0 10 )
(memory.grow (i32.const 10))
(memory.size)
#assertStack <i32> 10 : < i32 > 0 : .Stack "memory grow"
(memory.grow (i32.const 1))
#assertTopStack <i32> -1 "memory grow"
#assertMemory 10 10 "memory grown"

( memory #maxMemorySize())
(memory.grow (i32.const 1))
#assertTopStack <i32> -1 "memory grow max too large"
#assertMemory #maxMemorySize() .MemBound "memory grow max too large"

( memory )
(memory.grow (i32.const #maxMemorySize()))
(memory.size)
#assertStack <i32> #maxMemorySize() : < i32 > 0 : .Stack "memory grow unbounded"
(memory.grow (i32.const 1))
(memory.size)
#assertStack <i32> #maxMemorySize() : < i32 > -1 : .Stack "memory grow unbounded"
#assertMemory #maxMemorySize() .MemBound "memory grown unbounded"

;; Instantiate with data

(memory (data (i32.const 0) "WASM" ))
(memory.size)
#assertTopStack < i32 > 1 "size of stack"
#assertMemoryData (0, 87) "text to ascii W"
#assertMemoryData (1, 65) "text to ascii A"
#assertMemoryData (2, 83) "text to ascii S"
#assertMemoryData (3, 77) "text to ascii M"
#assertMemory 1 1 "memorys string length"

(memory (data (i32.const 100) "WASM" ))
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertMemory 1 1 "memorys string length"

(memory 0 1)
(data (i32.const 100) "WASM" )
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertMemory 0 1 "memory data separate inst"

;; Store and load

(memory 1)
(i32.const 1)
(i64.const 1)
(i64.store offset=2)
#assertMemoryData (3, 1) "store is little endian"
#assertMemory 1 .MemBound ""