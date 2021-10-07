requires "kwasm-lemmas.md"

module SIMPLE-SPEC
    imports KWASM-LEMMAS

   // forall X Y : Nat, X = Y -> X - Y = 0
   claim
       <instrs>
           ITYPE:IValType . const X ~>
           ITYPE:IValType . const Y ~>
           ITYPE:IValType . sub
           => .
           ...
       </instrs>
       <valstack> S => < ITYPE > 0 : S </valstack>
   requires #inUnsignedRange(ITYPE, X) andBool X ==Int Y

    // forall X Y : Nat, X <= max X Y && Y <= max X Y
    claim
        <instrs>
            ITYPE:IValType . const X ~>
            ITYPE:IValType . const Y ~>
            ITYPE:IValType . ge_u    ~>
            #if([ITYPE:IValType .ValTypes], ITYPE:IValType.const X, ITYPE:IValType.const Y, _)
            => .
            ...
        </instrs>
        <valstack> S => < ITYPE > ?MAX : S </valstack>
    requires
        #inUnsignedRange(ITYPE, X) andBool
        #inUnsignedRange(ITYPE, Y)
    ensures
        #inUnsignedRange(ITYPE, ?MAX) andBool
        X <=Int ?MAX andBool
        Y <=Int ?MAX

   // forall X Y : Nat, even X -> even Y -> even (X + Y)
   claim
       <instrs>
           ITYPE:IValType . const X:Int ~>
           ITYPE:IValType . const Y:Int ~>
           ITYPE . add => .
           ...
       </instrs>
       <valstack> S:ValStack => < ITYPE > Z : S </valstack>
   requires
       0 <=Int X          andBool
       0 <=Int Y          andBool
       0 <=Int Z          andBool
       Z ==Int (X +Int Y) andBool
       Z <Int #pow(ITYPE) andBool
       X modInt 2 ==Int 0 andBool
       Y modInt 2 ==Int 0
   ensures
       Z modInt 2 ==Int 0
endmodule
