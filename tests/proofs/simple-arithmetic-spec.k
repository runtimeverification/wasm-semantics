requires "kwasm-lemmas.k"

module SIMPLE-ARITHMETIC-SPEC
    imports WASM
    imports KWASM-LEMMAS

    rule <k> ( ITYPE:IValType . const X:Int ) => . ... </k>
         <valstack> S:ValStack => < ITYPE > X : S </valstack>
      requires #inUnsignedRange(ITYPE, X)
      [trusted]

    rule <k> ( ITYPE:IValType . const X:Int ) => . ... </k>
         <valstack> S:ValStack => < ITYPE > (X +Int #pow(ITYPE)) : S </valstack>
      requires (#minSigned(ITYPE) <=Int X) andBool (X <Int 0)
      [trusted]

    rule <k> ( ITYPE:IValType . const X:Int ) ( ITYPE . const Y:Int ) => . ... </k>
         <valstack> S:ValStack => < ITYPE > Y : < ITYPE > X : S </valstack>
      requires #inUnsignedRange(ITYPE, X)
       andBool #inUnsignedRange(ITYPE, Y)
      [trusted]

    rule <k> ( ITYPE:IValType . const X:Int ) ( ITYPE . const Y:Int ) ( ITYPE . add ) => . ... </k>
         <valstack> S:ValStack => < ITYPE > (X +Int Y) : S </valstack>
      requires 0 <=Int X andBool 0 <=Int Y
       andBool (X +Int Y) <Int #pow(ITYPE)
      [trusted]

// CONCRETE
// ========
    rule <k> block [ .ValTypes ]
                 ( loop [ .ValTypes ]
                     (local.get 0)
                     (local.get 1)
                     (i32.add)
                     (local.set 1)
                     (local.get 0)
                     (i32.const 1)
                     (i32.sub)
                     (local.tee 0)
                     (i32.eqz)
                     (br_if 1)
                 )
             end
          => .
          ...
         </k>
         <locals>
           0 |-> < i32 > (10 => 0)
           1 |-> < i32 > (0 => 55)
         </locals>

// LOOP INVARIANT
// ==============

/*
    rule <k> block [ .ValTypes ]
                 ( loop [ .ValTypes ]
                     (local.get 0)
                     (local.get 1)
                     (i32.add)
                     (local.set 1)
                     (local.get 0)
                     (i32.const 1)
                     (i32.sub)
                     (local.tee 0)
                     (i32.eqz)
                     (br_if 1)
                     (br 0)
                 )
             end
          => .
          ...
         </k>
         <locals>
           0 |-> < i32 > (N => 0)
           1 |-> < i32 > (0 => ((N *Int (N +Int 1)) /Int 2))
         </locals>
         requires N >=Int 0
          andBool #inUnsignedRange(i32, N *Int (N +Int 1) /Int 2)
          // andBool N <=Int 92681 // The largest i32 that won't overflow.

    rule <k> block [ .ValTypes ]
                 ( loop [ .ValTypes ]
                     (local.get 0)
                     (local.get 1)
                     (i32.add)
                     (local.set 1)
                     (local.get 0)
                     (i32.const 1)
                     (i32.sub)
                     (local.tee 0)
                     (i32.eqz)
                     (br_if 1)
                     (br 0)
                 )
             end
          =>  .
          ...
         </k>
         <locals>
           0 |-> < i32 > (I => 0)
           1 |-> < i32 > (S => S +Int ((I *Int (I +Int 1)) /Int 2))
         </locals>
         requires I >=Int 0
          andBool #inUnsignedRange(i32, S +Int (I *Int (I +Int 1) /Int 2))
*/
endmodule
