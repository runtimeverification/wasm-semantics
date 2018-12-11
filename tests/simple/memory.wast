memory 0
#assertMemory 0 pow16 .Map "Basic sanity"


memory 0 0
#assertMemory 0 0 .Map "Basic sanity"


(memory 1)
(data (i32.const 0) "WASM")
#assertMemory 1 pow16 #asMapBytes(String2Bytes("WASM")) "Bytes"

(memory 1)
(data (i32.const 0) "WASM")
(i32.load8_u (i32.const 0))
#assertTopStack < i32 > 87 "W in bytes" 
#assertMemory 1 pow16 #asMapBytes(String2Bytes("WASM")) "Byteasds"

(;
memory 0 0
memory.size
#assertTopStack < i32 > 0 "empty memory on stack"
#assertMemory 0 0 .Map "empty memory"


(memory 1)
(data (i32.const 0) "WASM")
(memory.size)
#assertTopStack < i32 > 4 "size of stack" 


  (memory 1)
  (data (i32.const 0) "WASM")
  (i32.load8_u (i32.const 1))
  #assertTopStack < i32 > 65 "A in bytes" 

(module
  (memory 1)
  (data (i32.const 0) "WASM")
  (i32.load8_u (i32.const 2))
  #assertTopStack < i32 > 83 "S in bytes" 
)

(module
  (memory 1)
  (data (i32.const 0) "WASM")
  (i32.load8_u (i32.const 3))
  #assertTopStack < i32 > 77 "M in bytes" 
)

(module
  (memory 1)
  (data (i32.const 0) "WASM")
  (i32.load8_u (i32.const 4))
  #assertTopStack < i32 > 0 "0 in bytes" 
)
;)
