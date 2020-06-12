requires "kwasm-lemmas.md"

module LOCALS-SPEC
    imports KWASM-LEMMAS

    rule <k> sequenceInstrs((local.get X:Int) (local.set X:Int)) => . ... </k>
         <locals>
           X |-> < ITYPE > (VAL => VAL)
         </locals>
endmodule
