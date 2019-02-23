;; Test locals

init_locals < i32 > 0 : < i32 > 0 : < i32 > 0 : .Stack

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

