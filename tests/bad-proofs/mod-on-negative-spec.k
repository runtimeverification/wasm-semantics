requires "kwasm-lemmas.k"

module MOD-ON-NEGATIVE-SPEC
    imports KWASM-LEMMAS

    rule <k> X modInt N => X ... </k>
      requires X <=Int 0
       andBool 0  <Int N

endmodule
