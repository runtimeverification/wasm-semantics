(memory 1)
(func $inc
  (i32.store8
    (i32.const 0)
    (i32.add
      (i32.load8_u (i32.const 0))
      (i32.const 1)))
)
(func $main
  (i32.store (i32.const 0) (i32.const 65))
  (call $inc)
  (call $inc)
  (call $inc)
)
(start $main)

#assertMemoryData (0, 68) "start inc"
#assertFunction $inc  [ ] -> [ ] [ ] ""
#assertFunction $main [ ] -> [ ] [ ] ""
#assertMemory 0 1 .NoInt ""

#clearConfig

(func $foo (unreachable))
(start $foo)
#assertTrap "Trap propagates through start invocation"
#assertFunction $foo  [ ] -> [ ] [ ] ""

#clearConfig
