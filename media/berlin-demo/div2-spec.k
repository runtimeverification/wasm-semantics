requires "kwasm-lemmas.k"

module DIV2-SPEC
    imports WASM
    imports KWASM-LEMMAS

    rule <k> (if (local.get 1)
                (then (local.set 0
                  (i32.div_u (local.get 0) (local.get 1))))
              (else
                (local.set 0 (i32.const 0))))
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