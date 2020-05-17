requires "kwasm-lemmas.k"

module FUNCTIONS-LEMMAS
    imports KWASM-LEMMAS
endmodule

module FUNCTIONS-SPEC
    imports FUNCTIONS-LEMMAS

    rule <k> #wrap(2, #getRange(BM, ADDR, 4)) => #getRange(BM, ADDR, 2) ... </k> requires #isByteMap(BM) andBool 0 <=Int ADDR

    rule <k> #setRange(BM, ADDR, #wrap(2, #getRange(BM, ADDR, 4)), 2) => BM ... </k> requires #isByteMap(BM) andBool 0 <=Int ADDR

    rule <k> #getRange(BM, ADDR, 0)                            => 0                             ... </k> requires #isByteMap(BM)
    rule <k> #getRange(BM, ADDR, WIDTH)                        => 0                             ... </k> requires #isByteMap(BM) andBool ADDR <Int 0
    rule <k> #getRange(BM, ADDR, 1) modInt 256                 => #getRange(BM, ADDR       , 1) ... </k> requires #isByteMap(BM)
    rule <k> #getRange(BM, ADDR, 3) modInt 256                 => #getRange(BM, ADDR       , 1) ... </k> requires #isByteMap(BM)
    rule <k> #getRange(BM, ADDR, 3) modInt (2 ^Int (8 *Int 3)) => #getRange(BM, ADDR       , 3) ... </k> requires #isByteMap(BM)
    rule <k> #getRange(BM, ADDR, 7) modInt (2 ^Int (8 *Int 3)) => #getRange(BM, ADDR       , 3) ... </k> requires #isByteMap(BM)
    rule <k> #getRange(BM, ADDR, 2) >>Int 8                    => #getRange(BM, ADDR +Int 1, 1) ... </k> requires #isByteMap(BM) andBool 0 <=Int ADDR

    rule <k> ( ( #getRange ( BM , ADDR +Int 1 , 1 ) modInt 256 ) +Int ( #getRange ( BM , ADDR , 1 ) modInt 256 <<Int 8 ) ) <<Int 48
          => (   #getRange ( BM , ADDR +Int 1 , 1 )              +Int ( #getRange ( BM , ADDR , 1 )            <<Int 8 ) ) <<Int 48
         ...
         </k>
      requires #isByteMap(BM)

    rule <k> ( ( #getRange ( BM , ADDR +Int 1 , 7 ) modInt 256 ) +Int ( #getRange ( BM , ADDR , 8 ) modInt 256 <<Int 8 ) ) <<Int 48
          => ( ( #getRange ( BM , ADDR +Int 1 , 1 )            ) +Int ( #getRange ( BM , ADDR , 1 )            <<Int 8 ) ) <<Int 48
         ...
         </k>
      requires #isByteMap(BM)

    rule <k> #setRange(BM, ADDR, #getRange(BM, ADDR +Int 1, 1) +Int (#getRange(BM, ADDR, 1) <<Int 8), 2)
          => #setRange(#setRange(BM, ADDR, #getRange(BM, ADDR +Int 1, 1), 1), ADDR +Int 1, #getRange(BM, ADDR, 1), 1)
         ...
         </k>
      requires ADDR >=Int 0
       andBool #isByteMap(BM)

    rule <k> #setRange ( BM , ADDR modInt 4294967296 , #getRange ( BM , ADDR modInt 4294967296 , #numBytes ( ITYPE ) ) , #numBytes ( ITYPE ) )
          => BM
         ...
         </k>
      requires #isByteMap(BM)
endmodule
