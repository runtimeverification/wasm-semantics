requires "kwasm-lemmas.k"

module FUNCTIONS-LEMMAS
    imports KWASM-LEMMAS
endmodule

module FUNCTIONS-SPEC
    imports FUNCTIONS-LEMMAS

    rule <k> #getRange(BM, ADDR, 0)                            => 0                      ... </k>
    rule <k> #getRange(BM, ADDR, 1) modInt 256                 => #getRange(BM, ADDR, 1) ... </k>
    rule <k> #getRange(BM, ADDR, 3) modInt 256                 => #getRange(BM, ADDR, 1) ... </k>
    rule <k> #getRange(BM, ADDR, 3) modInt (2 ^Int (8 *Int 3)) => #getRange(BM, ADDR, 3) ... </k>
    rule <k> #getRange(BM, ADDR, 7) modInt (2 ^Int (8 *Int 3)) => #getRange(BM, ADDR, 3) ... </k>
endmodule
