(module ( table 0 funcref ) )
#assertTable 0 0 .Int "table initial 1"

(module ( table $named 4 funcref) )
#assertTable $named 4 .Int "table initial 2"

(module ( table 14 21 funcref ) )
#assertTable 0 14 21 "table initial 3"

(module (
  table $named2 funcref (elem $f $g $k))
  (func $f) (func $g) (func $k)
)
#assertTableElem (0, 0) "table elem 0"
#assertTableElem (1, 1) "table elem 1"
#assertTableElem (2, 2) "table elem 2"
#assertTable $named2 3 3 "table one with elements"

(module
  ( elem 0 (i32.const 1) $f $g)
  ( table 4 funcref)
  (func $f) (func $g)
)

#assertTableElem (1, 3) "table elem 1"
#assertTableElem (2, 4) "table elem 2"
#assertTable 0 4 .Int "table two with elements"

(module
  (type $out-i32 (func (result i32)))
  (table $tab 10 funcref)
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
#assertTableElem (8, 5) "table elem 8"
#assertTableElem (9, 6) "table elem 9"
#assertTable $tab 10 .Int "table three with elements"

#clearConfig
