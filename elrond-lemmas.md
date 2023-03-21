```k
module ELROND-LEMMAS
  imports public ELROND-IMPL

  rule { _:Int #Equals undefined } => #Top  [simplification]
  rule { (< _:IValType > _:Int) #Equals undefined } => #Bottom  [simplification]
  rule { (< _:ValType > _:Int) #Equals undefined } => #Bottom  [simplification]

  rule #Ceil(replaceAtBytes (@Dest:Bytes, @Index:Int, @Src:Bytes))
      =>  ( ( {(@Index >=Int 0) #Equals true}
            #And {(lengthBytes(@Dest) >=Int @Index +Int lengthBytes(@Src)) #Equals true}
            )
          #And
            ( #Ceil(@Dest)
            #And #Ceil(@Index)
            )
          )
        #And #Ceil(@Src)
        [simplification]
  rule #Ceil(substrBytes(@B:Bytes, @StartIndex:Int, @EndIndex:Int))
      =>  ( ( ( #Top
                #And {(@StartIndex >=Int 0) #Equals true}
              )
            #And
              ( {(@EndIndex >=Int 0) #Equals true}
              #And {(@StartIndex <Int lengthBytes(@B)) #Equals true}
              )
            )
          #And
            ( ( {(@EndIndex <=Int lengthBytes(@B)) #Equals true}
              #And #Ceil(@B)
              )
            #And
              ( #Ceil(@StartIndex)
              #And #Ceil(@EndIndex)
              )
            )
          )
        [simplification]

  rule lengthBytes(Int2Bytes(Len:Int, _:Int, _:Endianness)) => Len  [simplification]
  rule lengthBytes(padRightBytes(B:Bytes, Length:Int, _Value:Int))
      => maxInt(lengthBytes(B:Bytes), Length:Int)
      [simplification]
  rule lengthBytes(replaceAtBytes(Dest:Bytes, _Index:Int, _Src:Bytes) #as _Ceil)
      => lengthBytes(Dest)
      [simplification]
  rule 0 <=Int lengthBytes(_:Bytes) => true  [simplification]

  rule A:Int <=Int maxInt(B:Int, C:Int) => true
      requires A <=Int B orBool A <=Int C
      [simplification]
  rule A:Int <Int maxInt(B:Int, C:Int) => true
      requires A <Int B orBool A <Int C
      [simplification]
  rule A:Int >=Int maxInt(B:Int, C:Int) => A >=Int B andBool A >=Int C
      [simplification]
  rule A:Int >Int maxInt(B:Int, C:Int) => A >Int B andBool A >Int C
      [simplification]

  rule maxInt(B:Int, C:Int) >=Int A:Int => true
      requires A <=Int B orBool A <=Int C
      [simplification]
  rule maxInt(B:Int, C:Int) >Int A:Int => true
      requires A <Int B orBool A <Int C
      [simplification]
  rule maxInt(B:Int, C:Int) <=Int A:Int => A >=Int B andBool A >=Int C
      [simplification]
  rule maxInt(B:Int, C:Int) <Int A:Int => A >Int B andBool A >Int C
      [simplification]
endmodule
```