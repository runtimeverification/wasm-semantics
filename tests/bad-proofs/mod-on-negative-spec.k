requires "kwasm-lemmas.k"

module MOD-ON-NEGATIVE-SPEC
    imports KWASM-LEMMAS

    rule <k> X modInt N => X ... </k> requires 0 <Int N andBool X <=Int 0
endmodule
