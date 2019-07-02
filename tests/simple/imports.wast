(module $a
   (global (export "g") (export "glob") (mut i32) (i32.const 42))
   (memory (export "m") (export "mem") (data 1))
   (func (export "f") (export "func"))
   )

(register "m")

(module
 (memory (import "m" "mem") 1)
 (export "x" (global $x))
 (func (import "m" "f"))
 (global $x (import "m" "g") (mut i32))
 (func (export "foo") (result i32) (global.get 0))
 (func (export "mod") (global.set 0 (i32.const 10)))
 )

(assert_return (invoke "foo") (i32.const 42))
(invoke "mod")
(assert_return (invoke "foo") (i32.const 10))
(assert_return (get $a "g") (i32.const 10))

#clearConfig