requires "kwasm-lemmas.k"

module DIV1-SPEC
    imports WASM
    imports KWASM-LEMMAS

    rule <k> (local.set 0
               (i32.div_u (local.get 0) (local.get 1)))
             => .
           </k>
           <locals>
            0 |-> < i32 > (X => X')
            1 |-> < i32 > Y
           </locals>
           requires #inUnsignedRange(i32, X)
            andBool #inUnsignedRange(i32, Y)
           ensures X' <Int X
endmodule
