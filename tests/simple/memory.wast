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

;; Instantiate with data

(memory (data (i32.const 0) "WASM" ))
(memory.size)
#assertTopStack < i32 > 1 "size of stack"
#assertMemoryData (0, 87) "text to ascii W"
#assertMemoryData (1, 65) "text to ascii A"
#assertMemoryData (2, 83) "text to ascii S"
#assertMemoryData (3, 77) "text to ascii M"
#assertEmptyMemory 1 1 "memorys string length"

(memory (data (i32.const 100) "WASM" ))
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertEmptyMemory 1 1 "memorys string length"

(memory 0 1)
(data (i32.const 100) "WASM" )
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertEmptyMemory 0 1 "memory data separate inst"

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
(i32.load8_s (i32.const 15))
#assertTopStack <i32> -1 "load8 signed"
(i32.load16_u (i32.const 16))
#assertTopStack <i32> 65535 "load16 unsigned"
(i32.load16_s (i32.const 16))
#assertTopStack <i32> -1 "load16 signed"
(i64.load32_u (i32.const 15))
#assertTopStack <i64> #pow(i32) -Int 1 "load32 unsigned1"
(i64.load32_s (i32.const 15))
#assertTopStack <i64> -1 "load32 signed1"
(i64.load32_u (i32.const 17))
#assertTopStack <i64> 65535 "load32 unsigned2"
(i64.load32_u (i32.const 17))
#assertTopStack <i64> 65535 "load32 signed2"
#assertMemoryData (15, 255) ""
#assertMemoryData (16, 255) ""
#assertMemoryData (17, 255) ""
#assertMemoryData (18, 255) ""
#assertEmptyMemory 1 .MemBound ""

;; Updating

(memory 1)
(i64.store (i32.const 1) (i64.const #pow(i64) -Int 1))
(i32.store   (i32.const 5) (i32.const 0))
(i32.store16 (i32.const 3) (i32.const 0))
(i32.store8  (i32.const 1) (i32.const 0))
(i32.store8  (i32.const 2) (i32.const 0))
#assertEmptyMemory 1 .MemBound "Zero updates erases memory"