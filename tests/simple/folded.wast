;; test folded form parsing and results

(i32.eqz (i32.const 3))
#assertTopStack < i32 > 0 "eqz2"

(i32.add (i32.const 3) (i32.const 4))
#assertTopStack < i32 > 7 "simple add"

(i32.sub (i32.const 3) (i32.const 4))
#assertTopStack < i32 > -1 "simple sub, order dependent"

(i32.sub (i32.mul (i32.const 5) (i32.const 7)) (i32.const 4))
#assertTopStack < i32 > 31 "mul nested in sub"
