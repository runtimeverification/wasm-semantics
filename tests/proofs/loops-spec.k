requires "kwasm-lemmas.k"

module LOOPS-SPEC
    imports WASM-TEXT
    imports KWASM-LEMMAS

    // Lemma
    rule <k> br 0
             ~> label [ .ValTypes ] { loop .TypeDecls (local.get 0) (local.get 1) (i32.add) (local.set 1) (local.get 0) (i32.const 1) (i32.sub) (local.tee 0) (i32.eqz) (br_if 1) (br 0) end } .ValStack  // Loop
             ~> label [ .ValTypes ] { .Instrs                                                                                                                                                } STACK      // Block
          => .
          ...
         </k>
         <valstack> _ => STACK </valstack>
         <labelDepth> D => (D -Int 1) -Int 1 </labelDepth>
         <locals>
           0 |-> < i32 > (I => 0)
           1 |-> < i32 > (X => X +Int ((I *Int (I +Int 1)) /Int 2))
         </locals>
      requires #inUnsignedRange(i32, I)
       andBool I >Int 0
       andBool #inUnsignedRange(i32, X +Int I)
       andBool #inUnsignedRange(i32, X +Int ((I *Int (I +Int 1)) /Int 2))

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
           1 |-> < i32 > (0 => (N *Int (N +Int 1)) /Int 2)
         </locals>
      requires #inUnsignedRange(i32, N)
       andBool N >Int 0
       andBool #inUnsignedRange(i32, ((N *Int (N +Int 1)) /Int 2))
       [trusted] // Remove

endmodule
