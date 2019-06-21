(module)

#assertUnnamedModule "empty module"

(module $myMod)

#assertNamedModule $myMod "named empty module"

(module)

(register "a module name")

#assertRegistrationUnnamed "a module name" "registration1"
#assertUnnamedModule "registered module"

(module $anotherName)

(register "a module name")

#assertRegistrationNamed "a module name" $anotherName "registration2"
#assertNamedModule $anotherName "named registered module"

#clearModuleIdx

(module $myMod)

(module)

(module $myMod2)

(register "a module name" $myMod)
(register "another module name" $myMod2)
(register "third module name")

#assertRegistrationNamed "another module name" $myMod2 "registration3"
#assertRegistrationNamed "a module name" $myMod "registration4"
#assertRegistrationUnnamed "third module name" "registration5"

#setCurrentModule 2
#assertNamedModule $myMod2 "interleaved module 3"
#setCurrentModule 1
#assertUnnamedModule "interleaved module 1"
#setCurrentModule 0
#assertNamedModule $myMod "interleaved module 0"

#clearModuleIdx