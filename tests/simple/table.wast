( table funcref )
#assertEmptyTable 0 .MaxBound "table initial 1"

( table 4 funcref)
#assertEmptyTable 4 .MaxBound "table initial 2"

( table 14 21 funcref )
#assertEmptyTable 14 21 "table initial 3"

#clearModules
