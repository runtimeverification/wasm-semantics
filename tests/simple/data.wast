;; Instantiate with data

;; TODO: A way to specify range of memory in a test.
(memory (data (i32.const 0) "WASM" ))
(memory.size)
#assertTopStack < i32 > 1 "size of stack"
#assertMemoryData (0, 87) "text to ascii W"
#assertMemoryData (1, 65) "text to ascii A"
#assertMemoryData (2, 83) "text to ascii S"
#assertMemoryData (3, 77) "text to ascii M"
#assertEmptyMemory 1 1 "memorys string length"

(memory (data (offset (i32.const 100)) "WASM" ))
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

(memory 0 1)
;; TODO: K can't parse the backslashes unless they are escaped. Preprocessing may be the best option.
(data (i32.const 100) "the\\3Aans\\ff\\00" )
#assertMemoryData (100, 116) "text to ascii t"
#assertMemoryData (101, 104) "text to ascii h"
#assertMemoryData (102, 101) "text to ascii e"
#assertMemoryData (103, 42)  "hex 42"
#assertMemoryData (104, 97)  "text to ascii a"
#assertMemoryData (105, 110) "text to ascii n"
#assertMemoryData (106, 115) "text to ascii s"
#assertMemoryData (107, 255) "hex 255"
#assertMemoryData (108, 0)   "hex 0"
#assertEmptyMemory 0 1 "memory data separate inst"
