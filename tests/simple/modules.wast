(module $myMod)

#assertNamedModule $myMod "named empty module"

(module $anotherName)

(register "a module name")

#assertRegistrationNamed "a module name" $anotherName "registration1"
#assertNamedModule $anotherName "named registered module"

(module $myMod2)

(module)

(module $myMod3)

(register "a module name 2" $myMod2)
(register "another module name" $myMod3)
(register "third module name")

#assertRegistrationNamed "another module name" $myMod3 "registration3"
#assertRegistrationNamed "a module name 2" $myMod2 "registration4"
#assertRegistrationUnnamed "third module name" "registration5"

#clearConfig
