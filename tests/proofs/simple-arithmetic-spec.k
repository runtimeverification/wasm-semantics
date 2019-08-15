requires "kwasm-lemmas.k"

module SIMPLE-ARITHMETIC-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    rule <k> (ITYPE:IValType . const X:Int) => . ... </k>
         <valstack> S:ValStack => < ITYPE > X : S </valstack>
      requires #inUnsignedRange(ITYPE, X)

    rule <k> (ITYPE:IValType . const X:Int) => . ... </k>
         <valstack> S:ValStack => < ITYPE > (X +Int #pow(ITYPE)) : S </valstack>
      requires (#minSigned(ITYPE) <=Int X) andBool (X <Int 0)

    rule <k> (ITYPE:IValType . const X:Int) (ITYPE . const Y:Int) => . ... </k>
         <valstack> S:ValStack => < ITYPE > Y : < ITYPE > X : S </valstack>
      requires #inUnsignedRange(ITYPE, X)
       andBool #inUnsignedRange(ITYPE, Y)

    rule <k> (ITYPE:IValType . const X:Int) (ITYPE . const Y:Int) (ITYPE . add) => . ... </k>
         <valstack> S:ValStack => < ITYPE > (X +Int Y) : S </valstack>
      requires 0 <=Int X andBool 0 <=Int Y
       andBool (X +Int Y) <Int #pow(ITYPE)
endmodule
