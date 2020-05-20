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

    rule <k> (#getRange(BM, ADDR +Int 1, 1) +Int (#getRange (BM, ADDR, 1) <<Int 8)) modInt 65536
          =>  #getRange(BM, ADDR +Int 1, 1) +Int (#getRange (BM, ADDR, 1) <<Int 8)
         ...
         </k>
      requires #isByteMap(BM)

    rule <k> #getRange ( #setRange ( BM , ADDR +Int 7 , VAL , 1 ) , ADDR +Int 3 , 1 ) => #getRange ( BM , ADDR +Int 3 , 1 ) ... </k> requires #isByteMap(BM)

    rule <k> #getRange ( #setRange ( BM , ADDR +Int 7 , VAL , 1 ) , ADDR +Int 7 , 1 ) => VAL ... </k> requires 0 <=Int ADDR andBool 0 <=Int VAL andBool VAL <Int 256 andBool #isByteMap(BM)

    rule <k> #getRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( BM , ADDR , #getRange ( BM , ADDR +Int 7 , 1 ) , 1 ) , ADDR +Int 1 , #getRange ( BM , ADDR +Int 6 , 1 ) , 1 ) , ADDR +Int 2 , #getRange ( BM , ADDR +Int 5 , 1 ) , 1 ) , ADDR +Int 3 , #getRange ( BM , ADDR +Int 4 , 1 ) , 1 ) , ADDR +Int 4 , #getRange ( BM , ADDR +Int 3 , 1 ) , 1 ) , ADDR +Int 5 , #getRange ( BM , ADDR +Int 2 , 1 ) , 1 ) , ADDR +Int 6 , #getRange ( BM , ADDR +Int 1 , 1 ) , 1 ) , ADDR +Int 7 , #getRange ( BM , ADDR , 1 ) , 1 ) , ADDR +Int 3 , 1 )
          => #getRange ( BM , ADDR +Int 4 , 1 )
         ...
         </k>
      requires 0 <=Int ADDR
       andBool #isByteMap(BM)
endmodule
