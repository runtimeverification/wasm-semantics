requires "kwasm-lemmas.md"

module LOCALS-SPEC
    imports KWASM-LEMMAS

    rule <instrs> (local.get X:Int) ~> (local.set X:Int) => . ... </instrs>
         <locals>
           X |-> < _ITYPE > (VAL => VAL)
         </locals>
endmodule
