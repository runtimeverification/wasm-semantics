(module $custom binary
  "\00asm" "\01\00\00\00"
  "\00\24\10" "a custom section" "this is the payload"
  "\00\20\10" "a custom section" "this is payload"
  "\00\11\10" "a custom section" ""
  "\00\10\00" "" "this is payload"
  "\00\01\00" "" ""
  "\00\24\10" "\00\00custom sectio\00" "this is the payload"
  "\00\24\10" "\ef\bb\bfa custom sect" "this is the payload"
  "\00\24\10" "a custom sect\e2\8c\a3" "this is the payload"
  "\00\1f\16" "module within a module" "\00asm" "\01\00\00\00"
)

#assertNamedModule $custom "custom module"

#clearConfig
