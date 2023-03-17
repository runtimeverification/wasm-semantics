```k
require "summaries.k"
require "elrond-impl.md"

module ELROND-SYNTAX
  imports WASM-TEXT-SYNTAX
endmodule

module ELROND
  imports ELROND-IMPL
  imports SUMMARIES
  imports LEMMAS
endmodule

module LEMMAS
  imports public ELROND-IMPL

  rule { _:Int #Equals undefined } => #Top  [simplification]
  rule #Ceil(replaceAtBytes (@Dest:Bytes, @Index:Int, @Src:Bytes))
      => {(@Index >=Int 0) #Equals true}
        #And {(lengthBytes(@Dest) >Int @Index +Int lengthBytes(@Src)) #Equals true}
        #And #Ceil(@Dest)
        #And #Ceil(@Index)
        #And #Ceil(@Src)
        [simplification]

  rule lengthBytes(Int2Bytes(Len:Int, _:Int, _:Endianness)) => Len  [simplification]
  rule lengthBytes(padRightBytes(B:Bytes, Length:Int, _Value:Int))
      => maxInt(lengthBytes(B:Bytes), Length:Int)
  rule 0 <= Int lengthBytes(_:Bytes) => true  [simplification]
endmodule
```