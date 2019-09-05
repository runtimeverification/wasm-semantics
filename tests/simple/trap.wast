(assert_trap
  (module (func $main (unreachable)) (start $main))
  "unreachable"
)

#clearConfig
