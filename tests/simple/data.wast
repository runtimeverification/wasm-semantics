;; Instantiating with data

(memory (data 87 65 83 77 50 46 48))
(memory.size)
#assertTopStack < i32 > 1 "size of stack"
#assertMemoryData (0, 87) "text to ascii W"
#assertMemoryData (1, 65) "text to ascii A"
#assertMemoryData (2, 83) "text to ascii S"
#assertMemoryData (3, 77) "text to ascii M"
#assertMemoryData (4, 50) "text to ascii 2"
#assertMemoryData (5, 46) "text to ascii ."
#assertMemoryData (6, 48) "text to ascii 0"
#assertEmptyMemory 1 1 "memorys string length"

(memory 1 1)
(data (offset (i32.const 100)) 87 65 83 77)
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertEmptyMemory 1 1 "memorys string length"

(memory 0 1)
(data (i32.const 100) 87 65 83 77)
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertEmptyMemory 0 1 "memory data separate inst"

(memory (data))
#assertEmptyMemory 0 0 "memorys string length"

(memory (data 87))
#assertMemoryData (0, 87) "text to ascii W"
#assertEmptyMemory 1 1 "memorys string length"