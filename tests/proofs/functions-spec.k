requires "kwasm-lemmas.k"

module FUNCTIONS-LEMMAS
    imports KWASM-LEMMAS
endmodule

module FUNCTIONS-SPEC
    imports FUNCTIONS-LEMMAS

    rule <k> #getRange(BM, ADDR, 0) => 0 ... </k>
endmodule
