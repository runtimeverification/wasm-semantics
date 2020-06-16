requires "kwasm-lemmas.md"

module LOCALS-SPEC
    imports KWASM-LEMMAS

    rule <wasmK> (local.get X:Int) ~> (local.set X:Int) => . ... </wasmK>
         <locals>
           X |-> < ITYPE > (VAL => VAL)
         </locals>
endmodule
