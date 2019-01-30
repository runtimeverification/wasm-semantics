;; Unreachable
unreachable
#assertTrap "unreachable"

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

(block (result i32)
    i32.const 1
)
#assertTopStack < i32 > 1 "block with named result 1"

(block result i64 i32
    i32.const 2
    i32.const 1
    i64.const 5
)
#assertStack < i64 > 5 : < i32 > 1 : .Stack "block with named result 2"

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

init_locals < i32 > 10 : < i32 > 0 : .Stack
block [ ]
    loop [ ]
        get_local 0
        get_local 1
        i32.add
        set_local 1
        i32.const 1
        get_local 0
        i32.sub
        tee_local 0
        i32.eqz
        br_if 1
    end
end
#assertLocal 0 < i32 > 0  "sum 1 -> 10 loop"
#assertLocal 1 < i32 > 55 "sum 1 -> 10 loop"

;; Stack Underflow
;; TODO: We need to give semantics to stack underflow (though it could not happen with a validated program).
;; We need `trap` semantics first.
;; i32.const 0
;; block [ i32 i32 ]
;;     i32.const 7
;; end
