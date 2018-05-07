;; Blocks

block [ i32 i32 i32 ]
    i32.const 1
    i32.const 2
    i32.const 3
end
#assertStack < i32 > 3 : < i32 > 2 : < i32 > 1 : .Stack "block 1"

block [ i32 i32 ]
    i32.const 1
    i32.const 2
    i32.const 3
    drop
end
#assertStack < i32 > 2 : < i32 > 1 : .Stack "block 2"

block [ i32 i32 ]
    i32.const 1
    i32.const 2
    i32.const 3
end
#assertStack < i32 > 3 : < i32 > 2 : .Stack "block 3 (invalid)"

;; Breaks

i32.const 1
i32.const 2
block [ ]
    i32.const 3
    br 0
    i32.const 4
    br 0
end
#assertStack < i32 > 2 : < i32 > 1 : .Stack "br 1"

i32.const 1
i32.const 2
block [ ]
    i32.const 3
    block [ i32 i32 ]
        i32.const 4
        i32.const 5
        br 1
    end
    i32.const 6
    br 0
end
#assertStack < i32 > 2 : < i32 > 1 : .Stack "br 2"

i32.const 1
i32.const 2
block [ i32 i32 ]
    i32.const 3
    block [ i32 i32 ]
        i32.const 4
        i32.const 5
        br 1
    end
    i32.const 6
    br 0
end
#assertStack < i32 > 5 : < i32 > 4 : < i32 > 2 : < i32 > 1 : .Stack "br 3"

i32.const 1
i32.const 2
block [ i32 i32 ]
    i32.const 3
    block [ ]
        i32.const 4
        i32.const 5
        br 1
    end
    i32.const 6
    br 0
end
#assertStack < i32 > 5 : < i32 > 4 : < i32 > 2 : < i32 > 1 : .Stack "br 4"

i32.const 1
i32.const 2
block [ i32 ]
    i32.const 3
    i32.const 0
    br_if 0
    i32.const 4
    br 0
end
#assertStack < i32 > 4 : < i32 > 2 : < i32 > 1 : .Stack "br_if 1 false"

i32.const 1
i32.const 2
block [ ]
    i32.const 3
    i32.const 1
    br_if 0
    i32.const 4
    br 0
end
#assertStack < i32 > 2 : < i32 > 1 : .Stack "br_if 1 true"

;; Conditional

i32.const 1
if [ i32 ] i32.const 1 else i32.const -1 end
#assertTopStack < i32 > 1 "if true"

i32.const 0
if [ i32 ] i32.const 1 else i32.const -1 end
#assertTopStack < i32 > -1 "if false"

;; Looping
;; TODO: We need locals before loops become effective.
;; i32.const 0
;; loop [ ]
;;     block [ ]
;;         i32.const 10
;;         i32.eq
;;         br_if 1
;;     end
;;     i32.const 1
;;     i32.add
;; end
;; #assertTopStack < i32 > 10 "loop"

;; Stack Underflow
;; TODO: We need to give semantics to stack underflow (though it could not happen with a validated program).
;; We need `trap` semantics first.
;; i32.const 0
;; block [ i32 i32 ]
;;     i32.const 7
;; end
