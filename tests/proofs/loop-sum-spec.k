requires "kwasm-lemmas.k"

module VERIFICATION
    imports WASM
    imports KWASM-LEMMAS

    syntax Instr  ::= "sumLocal" [function]
    syntax Instrs ::= "loopBody" [function]
 // ---------------------------------------
    rule sumLocal
      => loop [ .ValTypes ]
             (i32.add (local.get 0) (local.get 1))
             (local.set 1)
             (i32.sub (local.get 0) (i32.const 1))
             (local.tee 0)
             (br_if 0)
         end
    rule loopBody
      => (ITYPE.add (local.get 0) (local.get 1))
         (local.set 1)
         (ITYPE.sub (local.get 0) (ITYPE.const 1))
         (local.tee 0)

endmodule

module LOOP-SUM-SPEC
    imports VERIFICATION


// LEMMA
// =====
    rule <k> loopBody => . ... </k>
         <valstack> STACK => <ITYPE> N -Int 1 : STACK </valstack>
         <locals>
           ...
           0 |-> < ITYPE > (N => N -Int 1)
           1 |-> < ITYPE > (S => S +Int N)
           ...
         </locals>
         requires #inUnsignedRange(ITYPE, N)
          andBool #inUnsignedRange(ITYPE, N +Int 1)
          andBool #inUnsignedRange(ITYPE, S)
          andBool #inUnsignedRange(ITYPE, S +Int N)
          [lemma]


// TODO: Generalize to i32 AND i64
// MAIN CLAIM
// ==========
    rule <k> sumLocal => . </k>
         <locals>
           ...
           0 |-> < i32 > (N:Int => 0)
           1 |-> < i32 > (0 => ((N *Int (N +Int 1)) /Int 2))
           ...
         </locals>
         requires #inUnsignedRange(i32, N)
          andBool N >Int 0
         // Either of these preconditions work.
          andBool #inUnsignedRange(i32, N *Int (N +Int 1) /Int 2)
          // andBool N <=Int 92681 // The largest i32 that won't overflow.


// LOOP INVARIANT
// ==============

    rule <k> sumLocal => . </k>
         <locals>
           ...
           0 |-> < i32 > (N => 0)
           1 |-> < i32 > (S => S +Int ((I *Int (I +Int 1)) /Int 2))
           ...
         </locals>
         requires #inUnsignedRange(i32, N)
          andBool N >Int 0
          andBool #inUnsignedRange(i32, S)
          andBool #inUnsignedRange(i32, S +Int (I *Int (I +Int 1) /Int 2))
          [lemma]

endmodule
