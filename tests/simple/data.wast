;; Instantiating with data

(memory $an-ident (data "WASM" "2\2E0"))
(memory.size)
#assertTopStack < i32 > 1 "size of stack"
#assertMemoryData (0, 87) "text to ascii W"
#assertMemoryData (1, 65) "text to ascii A"
#assertMemoryData (2, 83) "text to ascii S"
#assertMemoryData (3, 77) "text to ascii M"
#assertMemoryData (4, 50) "text to ascii 2"
#assertMemoryData (5, 46) "text to ascii ."
#assertMemoryData (6, 48) "text to ascii 0"
#assertMemory $an-ident 1 1 "memorys string length"

#clearConfig

(memory 1 1)
(data (offset (i32.const 100)) "W" "AS" "M")
#assertMemoryData (100, 87) "text to ascii W"
#assertMemoryData (101, 65) "text to ascii A"
#assertMemoryData (102, 83) "text to ascii S"
#assertMemoryData (103, 77) "text to ascii M"
#assertMemory 0 1 1 "memorys string length"

#clearConfig

(memory (data))

#clearConfig

(memory (data "W"))
#assertMemoryData (0, 87) "text to ascii W"
#assertMemory 0 1 1 "memorys string length"

#clearConfig

(memory (data "\"\t\n\n\t\'\"\r\u{090A}"))
#assertMemoryData (0, 39) "text to ascii special"
#assertMemoryData (1, 9) "text to ascii special"
#assertMemoryData (2, 10) "text to ascii special"
#assertMemoryData (3, 10) "text to ascii special"
#assertMemoryData (4, 9) "text to ascii special"
#assertMemoryData (5, 34) "text to ascii special"
#assertMemoryData (6, 39) "text to ascii special"

#clearConfig
