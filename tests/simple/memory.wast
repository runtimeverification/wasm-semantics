;; Test locals

init_locals < i32 > 0 : < i32 > 0 : < i32 > 0 : .Stack

i32.const 43
set_local 0
#assertLocal 0 < i32 > 43 "set_local"

i32.const 55
set_local 1
get_local 1
#assertTopStack < i32 > 55 "set_local stack"
#assertLocal 1 < i32 > 55 "set_local"

i32.const 67
tee_local 2
#assertTopStack < i32 > 67 "tee_local stack"
#assertLocal 2 < i32 > 67 "tee_local local"

;; Test globals

init_global 0 < i32 > 0
init_global 1 < i32 > 0

i32.const 43
set_global 0
#assertGlobal 0 < i32 > 43 "set_global"

i32.const 55
set_global 1
get_global 1
#assertTopStack < i32 > 55 "set_global stack"
#assertGlobal 1 < i32 > 55 "set_global"
