requires "kwasm-lemmas.md"

module SIMPLE-ARITHMETIC-SPEC
    imports KWASM-LEMMAS

    claim <instrs> ITYPE:IValType . const X:Int => . ... </instrs>
          <valstack> S:ValStack => < ITYPE > X : S </valstack>
       requires #inUnsignedRange(ITYPE, X)

    claim <instrs> ITYPE:IValType . const X:Int => . ... </instrs>
          <valstack> S:ValStack => < ITYPE > (X +Int #pow(ITYPE)) : S </valstack>
       requires (#minSigned(ITYPE) <=Int X) andBool (X <Int 0)

    claim <instrs> ITYPE:IValType . const X:Int ~> ITYPE . const Y:Int ~> ITYPE . add => . ... </instrs>
          <valstack> S:ValStack => < ITYPE > (X +Int Y) : S </valstack>
       requires 0 <=Int X andBool 0 <=Int Y
        andBool (X +Int Y) <Int #pow(ITYPE)

// (i32.const #unsigned(i32, #signed(i32, #pow(i32) -Int 1)))
// #assertTopStack < i32 > #pow(i32) -Int 1 "#unsigned . #signed 3"
    claim <instrs> i32.const #unsigned(i32, #signed(i32, #pow(i32) -Int 1))
                => . ... 
          </instrs>
          <valstack> S => < i32 > #pow(i32) -Int 1 : S </valstack>


// (i64.const #unsigned(i64, #signed(i64, #pow(i64) -Int 1)))
// #assertTopStack < i64 > #pow(i64) -Int 1 "#unsigned . #signed 6"
    claim <instrs> i64.const #unsigned(i64, #signed(i64, #pow(i64) -Int 1))
                => . ... 
          </instrs>
          <valstack> S => < i64 > #pow(i64) -Int 1 : S </valstack>

endmodule
