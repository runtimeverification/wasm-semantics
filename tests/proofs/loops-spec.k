requires "kwasm-lemmas.k"

module LOOPS-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS



/*
    rule <k> (br_if 1) ~> (br 0) ~>
               label [ .ValTypes ] {( loop .TypeDecls (local.get 0) (local.get 1) (i32.add) (local.set 1) (local.get 0) (i32.const 1) (i32.sub) (local.tee 0) (i32.eqz) (br_if 1) (br 0)) } .ValStack  // Loop
               label [ .ValTypes ] { .Instrs                                                                                                                                              } STACK      // Block
               => .
               ...
         </k>
         <valstack> <i32> 0 : .ValStack </valstack>
*/

    // Main claim.
    rule <k> block .TypeDecls
                 ( loop .TypeDecls
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
           1 |-> < i32 > (0 => N *Int (N +Int 1) /Int 2)
         </locals>
      requires #inUnsignedRange(i32, N)
       andBool N >Int 0
endmodule
