(module)

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

#assertUnnamedModule ""

(module
  (type $out-i32 (func (result i32)))
  (table 10 funcref)
  (elem (i32.const 8) $const-i32-a)
  (elem (i32.const 9) $const-i32-b)
  (func $const-i32-a (type $out-i32) (i32.const 65))
  (func $const-i32-b (type $out-i32) (i32.const 66))
  (func (export "call-7") (type $out-i32)
    (call_indirect (type $out-i32) (i32.const 7))
  )
  (func (export "call-8") (type $out-i32)
    (call_indirect (type $out-i32) (i32.const 8))
  )
  (func (export "call-9") (type $out-i32)
    (call_indirect (type $out-i32) (i32.const 9))
  )
)

(invoke "call-8")

#assertTopStack < i32> 65 "call_indirect_result1"

(invoke "call-9")

#assertTopStack < i32> 66 "call_indirect_result2"

#assertFunction $const-i32-a [ ] -> [ i32 ] [ ] "call function 1 exists"
#assertFunction $const-i32-b [ ] -> [ i32 ] [ ] "call function 2 exists"
#assertFunction 2 [ ] -> [ i32 ] [ ] "call function 3 exists"
#assertFunction 3 [ ] -> [ i32 ] [ ] "call function 4 exists"
#assertFunction 4 [ ] -> [ i32 ] [ ] "call function 5 exists"
#assertTableElem (8, $const-i32-a) "table elem 8"
#assertTableElem (9, $const-i32-b) "table elem 9"
#assertEmptyTable 10 .MaxBound "should be empty now"

#assertUnnamedModule ""
#clearFreshId
#clearModuleIdx
