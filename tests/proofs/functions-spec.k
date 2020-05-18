requires "kwasm-lemmas.k"

module FUNCTIONS-LEMMAS
    imports KWASM-LEMMAS
endmodule

module FUNCTIONS-SPEC
    imports FUNCTIONS-LEMMAS

    rule <k> #wrap(2, #getRange(BM, ADDR, 4)) => #getRange(BM, ADDR, 2) ... </k> requires #isByteMap(BM) andBool 0 <=Int ADDR

    rule <k> #setRange(BM, ADDR, #wrap(2, #getRange(BM, ADDR, 4)), 2) => BM ... </k> requires #isByteMap(BM) andBool 0 <=Int ADDR
endmodule
