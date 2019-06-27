;; Test locals

init_locals < i32 > 0 : < i32 > 0 : < i32 > 0 : .ValStack

(i32.const 43)
(local.set 0)
#assertLocal 0 < i32 > 43 "set_local"

(i32.const 55)
(local.set 1)
(local.get 1)
#assertTopStack < i32 > 55 "set_local stack"
#assertLocal 1 < i32 > 55 "set_local"

(i32.const 67)
(local.tee 2)
#assertTopStack < i32 > 67 "tee_local stack"
#assertLocal 2 < i32 > 67 "tee_local local"

;; Test globals

(global (mut i32) (i32.const 0))
(global (mut i32) (i32.const 0))

(i32.const 43)
(global.set 0)
#assertGlobal 0 < i32 > 43 "set_global"

(i32.const 55)
(global.set 1)
(global.get 1)
#assertTopStack < i32 > 55 "set_global stack"
#assertGlobal 1 < i32 > 55 "set_global"

;; Test global folded forms

#clearConfig

(global (mut i32) (i32.const 0))
(global.set 0 (i32.const 77))
(global (mut i32) (i32.const 0))
(global.set 1 (i32.const 99))

#assertGlobal 1 < i32 > 99 "set_global folded"
#assertGlobal 0 < i32 > 77 "set_global folded 2"

#clearConfig
