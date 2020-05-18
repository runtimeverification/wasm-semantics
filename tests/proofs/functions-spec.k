requires "kwasm-lemmas.k"

module FUNCTIONS-LEMMAS
    imports KWASM-LEMMAS
endmodule

module FUNCTIONS-SPEC
    imports FUNCTIONS-LEMMAS

    rule <k> #wrap(2, #getRange(ByteMap <| BM0 |>, ADDR, 4)) => #getRange(ByteMap <| BM0 |>, ADDR, 2) ... </k>
      requires #isByteMap(ByteMap <| BM0 |>)
       andBool 0 <=Int ADDR

    rule <k> #setRange ( ByteMap <| BM0 |> , ADDR , #wrap ( 2 , #getRange ( ByteMap <| BM0 |> , ADDR , 4 ) ) , 2 ) => ByteMap <| BM0 |> ... </k>
      requires #isByteMap(ByteMap <| BM0 |>)
       andBool 0 <=Int ADDR
endmodule
