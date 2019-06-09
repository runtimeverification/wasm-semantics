( table )
#assertEmptyTable 0 .MaxBound "table initial 1"

( table 4)
#assertEmptyTable 4 .MaxBound "table initial 2"

( table 14 21 )
#assertEmptyTable 14 21 "table initial 3"

#clearModules
