requires "kwasm-lemmas.md"

module FUNCTIONS-SPEC
    imports KWASM-LEMMAS

    claim <instrs> run ( #wrap(2, #getRange(BM, ADDR, 4)) ) => done ( #getRange(BM, ADDR, 2) ) ... </instrs> requires 0 <=Int ADDR

    claim <instrs> run ( #setRange(BM, ADDR, #wrap(2, #getRange(BM, ADDR, 4)), 2) ) => done ( BM ) ... </instrs> requires 0 <=Int ADDR

    claim <instrs> run ( #getRange(_BM, _ADDR, 0)                          ) => done ( 0                             ) ... </instrs>
    claim <instrs> run ( #getRange(_BM, ADDR, _WIDTH)                      ) => done ( 0                             ) ... </instrs> requires ADDR <Int 0
    claim <instrs> run ( #getRange(BM, ADDR, 1) modInt 256                 ) => done ( #getRange(BM, ADDR       , 1) ) ... </instrs>
    claim <instrs> run ( #getRange(BM, ADDR, 3) modInt 256                 ) => done ( #getRange(BM, ADDR       , 1) ) ... </instrs>
    claim <instrs> run ( #getRange(BM, ADDR, 3) modInt (2 ^Int (8 *Int 3)) ) => done ( #getRange(BM, ADDR       , 3) ) ... </instrs>
    claim <instrs> run ( #getRange(BM, ADDR, 7) modInt (2 ^Int (8 *Int 3)) ) => done ( #getRange(BM, ADDR       , 3) ) ... </instrs>
    claim <instrs> run ( #getRange(BM, ADDR, 2) >>Int 8                    ) => done ( #getRange(BM, ADDR +Int 1, 1) ) ... </instrs> requires 0 <=Int ADDR

    claim <instrs> run  ( ( ( #getRange ( BM , ADDR +Int 1 , 1 ) modInt 256 ) +Int ( #getRange ( BM , ADDR , 1 ) modInt 256 <<Int 8 ) ) <<Int 48 )
                => done ( (   #getRange ( BM , ADDR +Int 1 , 1 )              +Int ( #getRange ( BM , ADDR , 1 )            <<Int 8 ) ) <<Int 48 )
               ...
          </instrs>

    claim <instrs> run  ( ( ( #getRange ( BM , ADDR +Int 1 , 7 ) modInt 256 ) +Int ( #getRange ( BM , ADDR , 8 ) modInt 256 <<Int 8 ) ) <<Int 48 )
                => done ( ( ( #getRange ( BM , ADDR +Int 1 , 1 )            ) +Int ( #getRange ( BM , ADDR , 1 )            <<Int 8 ) ) <<Int 48 )
               ...
          </instrs>

    claim <instrs> run  ( #setRange(BM, ADDR, #getRange(BM, ADDR +Int 1, 1) +Int (#getRange(BM, ADDR, 1) <<Int 8), 2) )
                => done ( #setRange(#setRange(BM, ADDR, #getRange(BM, ADDR +Int 1, 1), 1), ADDR +Int 1, #getRange(BM, ADDR, 1), 1) )
               ...
          </instrs>
       requires ADDR >=Int 0

    claim <instrs> run  ( #setRange ( BM , ADDR modInt 4294967296 , #getRange ( BM , ADDR modInt 4294967296 , #numBytes ( ITYPE ) ) , #numBytes ( ITYPE ) ) )
                => done ( BM )
               ...
          </instrs>

    claim <instrs> run  ( (#getRange(BM, ADDR +Int 1, 1) +Int (#getRange (BM, ADDR, 1) <<Int 8)) modInt 65536 )
                => done (  #getRange(BM, ADDR +Int 1, 1) +Int (#getRange (BM, ADDR, 1) <<Int 8) )
               ...
          </instrs>

    claim <instrs> run ( #getRange ( #setRange (  BM , ADDR +Int 7 , _VAL , 1 ) , ADDR +Int 3 , 1 ) ) => done ( #getRange ( BM , ADDR +Int 3 , 1 ) ) ... </instrs>

    claim <instrs> run ( #getRange ( #setRange ( _BM , ADDR +Int 7 ,  VAL , 1 ) , ADDR +Int 7 , 1 ) ) => done ( VAL ) ... </instrs> requires 0 <=Int ADDR andBool 0 <=Int VAL andBool VAL <Int 256
    claim <instrs> run  ( #getRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( #setRange ( BM , ADDR , #getRange ( BM , ADDR +Int 7 , 1 ) , 1 ) , ADDR +Int 1 , #getRange ( BM , ADDR +Int 6 , 1 ) , 1 ) , ADDR +Int 2 , #getRange ( BM , ADDR +Int 5 , 1 ) , 1 ) , ADDR +Int 3 , #getRange ( BM , ADDR +Int 4 , 1 ) , 1 ) , ADDR +Int 4 , #getRange ( BM , ADDR +Int 3 , 1 ) , 1 ) , ADDR +Int 5 , #getRange ( BM , ADDR +Int 2 , 1 ) , 1 ) , ADDR +Int 6 , #getRange ( BM , ADDR +Int 1 , 1 ) , 1 ) , ADDR +Int 7 , #getRange ( BM , ADDR , 1 ) , 1 ) , ADDR +Int 3 , 1 ) )
                => done ( #getRange ( BM , ADDR +Int 4 , 1 ) )
               ...
          </instrs>
       requires 0 <=Int ADDR

    claim <instrs> run  ( substrSparseBytes(_SB,  S, _E) ) => done ( .SparseBytes ) ... </instrs> requires S <Int 0
    claim <instrs> run  ( substrSparseBytes(_SB, _S,  E) ) => done ( .SparseBytes ) ... </instrs> requires E <Int 0
    claim <instrs> run  ( substrSparseBytes(_SB,  S,  E) ) => done ( .SparseBytes ) ... </instrs> requires E <Int S

    claim <instrs> run  ( #getBytesRange(  
                            SBChunk(#bytes(b"abcd"))
                            SBChunk(#bytes(b"efgh")),
                            2,
                            4
                          )
                        )
                => done ( b"cdef" )
               ...
          </instrs>

    claim <instrs> run  ( #getBytesRange(  
                            SBChunk(#bytes(B1))
                            SBChunk(#empty(N1))
                            SBChunk(#bytes(B2)),
                            lengthBytes(B1) +Int N1,
                            WIDTH
                          )
                        )
                => done ( padRightBytes(B2, WIDTH, 0) )
               ...
          </instrs>
       requires N1 ==K 123000000
        andBool WIDTH ==K 120
        andBool B1 ==K b"00000000000000000000000000000000asdfghjklqwertyuio"
        andBool B2 ==K b"asdfghjklqwertyuio"

    claim <instrs> run  ( #getBytesRange(  
                            SBChunk(#bytes(B1))
                            SBChunk(#empty(N1))
                            SBChunk(#bytes(B2)),
                            lengthBytes(B1) +Int N1 -Int Z,
                            WIDTH
                          )
                        )
                => done ( padRightBytes(zeros(Z) +Bytes B2, WIDTH, 0) )
               ...
          </instrs>
       requires N1 ==K 123000000
        andBool Z ==K 30
        andBool WIDTH ==K 120
        andBool B1 ==K b"00000000000000000000000000000000asdfghjklqwertyuio"
        andBool B2 ==K b"asdfghjklqwertyuio"

    claim <instrs> run  ( #getBytesRange(  
                            SBChunk(#bytes(b"a"))
                            SBChunk(#empty(1))
                            SBChunk(#bytes(b"b"))
                            SBChunk(#empty(1))
                            SBChunk(#bytes(b"c"))
                            SBChunk(#empty(1))
                            SBChunk(#bytes(b"d"))
                            SBChunk(#empty(1))
                            SBChunk(#bytes(b"e")),
                            0,
                            100
                          )
                        )
                => done ( padRightBytes(b"a\x00b\x00c\x00d\x00e", 100, 0) )
               ...
          </instrs>

    // Should not allocate huge bytes
    claim <instrs> run  ( #getBytesRange(  
                            SBChunk(#empty(Z))
                            SBChunk(#bytes(b"x")),
                            Z -Int 1,
                            2
                          )
                        )
                => done ( b"\x00x" )
               ...
          </instrs>
        requires Z ==K 1000000000000 // ~ 1 TB

endmodule
