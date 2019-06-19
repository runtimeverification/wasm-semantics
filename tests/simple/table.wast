( table funcref )
#assertEmptyTable 0 .MaxBound "table initial 1"

( table 4 funcref)
#assertEmptyTable 4 .MaxBound "table initial 2"

( table 14 21 funcref )
#assertEmptyTable 14 21 "table initial 3"

( table funcref (elem $f $g $k))
#assertTableElem (0, $f) "table elem 0"
#assertTableElem (1, $g) "table elem 1"
#assertTableElem (2, $k) "table elem 2"
#assertEmptyTable 3 3 "should be empty now"

( table 4 funcref)
(elem 0 (i32.const 1) $f $g)
#assertTableElem (1, $f) "table elem 1"
#assertTableElem (2, $g) "table elem 2"
#assertEmptyTable 4 .MaxBound "should be empty now"

#clearModules
