(module)

#assertUnnamedModule

(module $myMod)

#assertNamedModule $myMod

(module)

(register "a module name")

#assertRegistrationUnnamed "a module name"
#assertUnnamedModule

(module $anotherName)

(register "a module name")

#assertRegistrationNamed "a module name" $anotherName
#assertNamedModule $anotherName

(module $myMod)

(module)

(module $myMod2)

(register "a module name" $myMod)
(register "another module name" $myMod2)
(register "third module name")

#assertRegistrationNamed "another module name" $myMod2
#assertRegistrationNamed "a module name" $myMod
#assertRegistrationUnnamed "third module name"

#assertNamedModule $myMod2
#assertUnnamedModule
#assertNamedModule $myMod
