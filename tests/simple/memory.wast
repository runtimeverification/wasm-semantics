;; TODO: These can not be tested until memory is initialized.
;; (memory.size)
;; #assertTopStack <i32> 0 "initial memory size 0"

;; (memory.grow 10)
;; (memory.size)
;; #assertTopStack <i32> 10 "memory grow"

(i32.const 1)
#assertTopStack <i32> 1 "dummy test"
