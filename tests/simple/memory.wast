;; TODO: These can not be tested until memory is initialized.
;; (memory.size)
;; #assertTopStack <i32> 0 "initial memory size 0"

;; (memory.grow 10)
;; (memory.size)
;; #assertStack <i32> 10 : < i32 > 0 : .Stack "memory grow"

;; (memory.grow 10)
;; (memory.grow #pow(i32)
;; #assertStack <i32> -1 : <i32> 0 : .Stack "memory grow overflow"

(i32.const 1)
#assertTopStack <i32> 1 "dummy test"
