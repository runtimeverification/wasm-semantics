;; Test globals

init_global 0 < i32 > 0
init_global 1 < i32 > 0

(i32.const 43)
(global.set 0)
#assertGlobal 0 < i32 > 43 "set_global"

(i32.const 55)
(global.set 1)
(global.get 1)
#assertTopStack < i32 > 55 "set_global stack"
#assertGlobal 1 < i32 > 55 "set_global"

