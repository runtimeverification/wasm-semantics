requires "ceils-syntax.k"

module CEILS
    imports BOOL
    imports BYTES
    imports CEILS-SYNTAX
    imports INT

    rule definedSubstrBytes(B:Bytes, StartIndex:Int, EndIndex:Int)
        => (0 <=Int StartIndex) andBool (0 <=Int EndIndex)
            andBool (EndIndex <=Int lengthBytes(B))
            andBool (StartIndex <=Int EndIndex)


    rule definedReplaceAtBytes(Dest:Bytes, Index:Int, Src:Bytes)
        =>  (0 <=Int Index)
            andBool (Index +Int lengthBytes(Src) <=Int lengthBytes(Dest))


    rule definedPadRightBytes(_B:Bytes, Length:Int, Value:Int)
        =>  (0 <=Int Length)
            andBool (0 <=Int Value)
            andBool (Value <=Int 255)


    rule definedPadLeftBytes(_B:Bytes, Length:Int, Value:Int)
        =>  (0 <=Int Length)
            andBool (0 <=Int Value)
            andBool (Value <=Int 255)


    // ---------------------------------------


    rule #Ceil(substrBytes(@Arg0:Bytes, @StartIndex:Int, @EndIndex:Int))
        =>  ((({ definedSubstrBytes(@Arg0, @StartIndex, @EndIndex)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@StartIndex))
          #And #Ceil(@EndIndex))
        [simplification]


    rule substrBytesTotal(Arg0:Bytes, StartIndex:Int, EndIndex:Int)
        => substrBytes(Arg0, StartIndex, EndIndex)
        requires definedSubstrBytes(Arg0, StartIndex, EndIndex)
        [concrete, simplification(10), preserves-definedness]

    rule substrBytes(Arg0:Bytes, StartIndex:Int, EndIndex:Int)
        => substrBytesTotal(Arg0, StartIndex, EndIndex)
        requires definedSubstrBytes(Arg0, StartIndex, EndIndex)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule substrBytes(Arg0:Bytes, StartIndex:Int, EndIndex:Int)
        => substrBytesTotal(Arg0, StartIndex, EndIndex)
        requires definedSubstrBytes(Arg0, StartIndex, EndIndex)
        [symbolic(StartIndex), simplification, preserves-definedness]

    rule substrBytes(Arg0:Bytes, StartIndex:Int, EndIndex:Int)
        => substrBytesTotal(Arg0, StartIndex, EndIndex)
        requires definedSubstrBytes(Arg0, StartIndex, EndIndex)
        [symbolic(EndIndex), simplification, preserves-definedness]



    rule #Ceil(replaceAtBytes(@Dest:Bytes, @Index:Int, @Src:Bytes))
        =>  ((({ definedReplaceAtBytes(@Dest, @Index, @Src)  #Equals true }
          #And #Ceil(@Dest))
          #And #Ceil(@Index))
          #And #Ceil(@Src))
        [simplification]

    rule replaceAtBytesTotal(Dest:Bytes, Index:Int, Src:Bytes)
        => replaceAtBytes(Dest, Index, Src)
        requires definedReplaceAtBytes(Dest, Index, Src)
        [concrete, simplification(10), preserves-definedness]

    rule replaceAtBytes(Dest:Bytes, Index:Int, Src:Bytes)
        => replaceAtBytesTotal(Dest, Index, Src)
        requires definedReplaceAtBytes(Dest, Index, Src)
        [symbolic(Dest), simplification, preserves-definedness]

    rule replaceAtBytes(Dest:Bytes, Index:Int, Src:Bytes)
        => replaceAtBytesTotal(Dest, Index, Src)
        requires definedReplaceAtBytes(Dest, Index, Src)
        [symbolic(Index), simplification, preserves-definedness]

    rule replaceAtBytes(Dest:Bytes, Index:Int, Src:Bytes)
        => replaceAtBytesTotal(Dest, Index, Src)
        requires definedReplaceAtBytes(Dest, Index, Src)
        [symbolic(Src), simplification, preserves-definedness]


    rule #Ceil(padRightBytes(@Arg0:Bytes, @Length:Int, @Value:Int))
        =>  ((({ definedPadRightBytes(@Arg0, @Length, @Value)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Length))
          #And #Ceil(@Value))
        [simplification]

    rule padRightBytesTotal(Arg0:Bytes, Length:Int, Value:Int)
        => padRightBytes(Arg0, Length, Value)
        requires definedPadRightBytes(Arg0, Length, Value)
        [concrete, simplification(10), preserves-definedness]

    rule padRightBytes(Arg0:Bytes, Length:Int, Value:Int)
        => padRightBytesTotal(Arg0, Length, Value)
        requires definedPadRightBytes(Arg0, Length, Value)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule padRightBytes(Arg0:Bytes, Length:Int, Value:Int)
        => padRightBytesTotal(Arg0, Length, Value)
        requires definedPadRightBytes(Arg0, Length, Value)
        [symbolic(Length), simplification, preserves-definedness]

    rule padRightBytes(Arg0:Bytes, Length:Int, Value:Int)
        => padRightBytesTotal(Arg0, Length, Value)
        requires definedPadRightBytes(Arg0, Length, Value)
        [symbolic(Value), simplification, preserves-definedness]


    rule #Ceil(padLeftBytes(@Arg0:Bytes, @Length:Int, @Value:Int))
        =>  ((({ definedPadLeftBytes(@Arg0, @Length, @Value)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Length))
          #And #Ceil(@Value))
        [simplification]

    rule padLeftBytesTotal(Arg0:Bytes, Length:Int, Value:Int)
        => padLeftBytes(Arg0, Length, Value)
        requires definedPadLeftBytes(Arg0, Length, Value)
        [concrete, simplification(10), preserves-definedness]

    rule padLeftBytes(Arg0:Bytes, Length:Int, Value:Int)
        => padLeftBytesTotal(Arg0, Length, Value)
        requires definedPadLeftBytes(Arg0, Length, Value)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule padLeftBytes(Arg0:Bytes, Length:Int, Value:Int)
        => padLeftBytesTotal(Arg0, Length, Value)
        requires definedPadLeftBytes(Arg0, Length, Value)
        [symbolic(Length), simplification, preserves-definedness]

    rule padLeftBytes(Arg0:Bytes, Length:Int, Value:Int)
        => padLeftBytesTotal(Arg0, Length, Value)
        requires definedPadLeftBytes(Arg0, Length, Value)
        [symbolic(Value), simplification, preserves-definedness]


    //----------------------------------


    rule definedModInt (_:Int, X:Int) => X =/=Int 0

    rule #Ceil(@Arg0:Int modInt @Arg1:Int)
        =>  (({ definedModInt(@Arg0, @Arg1)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Arg1))
        [simplification]

    rule _ modIntTotal 0 => 0

    rule Arg0:Int modIntTotal Arg1:Int
        => Arg0 modInt Arg1
        requires definedModInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int modInt Arg1:Int
        => Arg0 modIntTotal Arg1 // Arg0 modIntTotal Arg1
        requires definedModInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int modInt Arg1:Int
        => Arg0 modIntTotal Arg1 // Arg0 modIntTotal Arg1
        requires definedModInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]

    //----------------------------------


    rule definedDivInt (_:Int, X:Int) => X =/=Int 0

    rule #Ceil(@Arg0:Int divInt @Arg1:Int)
        =>  (({ definedDivInt(@Arg0, @Arg1)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Arg1))
        [simplification, preserves-definedness]

    rule _ divIntTotal 0 => 0

    rule Arg0:Int divIntTotal Arg1:Int
        => Arg0 divInt Arg1
        requires definedDivInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int divInt Arg1:Int
        => Arg0 divIntTotal Arg1
        requires definedDivInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int divInt Arg1:Int
        => Arg0 divIntTotal Arg1
        requires definedDivInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]

    //----------------------------------

    rule definedShlInt(_:Int, I:Int) => I >=Int 0

    rule Arg0:Int <<IntTotal Arg1:Int
        => Arg0 <<Int Arg1
        requires definedShlInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int <<Int Arg1:Int
        => Arg0 <<IntTotal Arg1
        requires definedShlInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int <<Int Arg1:Int
        => Arg0 <<IntTotal Arg1
        requires definedShlInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]


    //-------------------------------------


    rule definedShrInt(_:Int, I:Int) => I >=Int 0

    rule Arg0:Int >>IntTotal Arg1:Int
        => Arg0 >>Int Arg1
        requires definedShrInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int >>Int Arg1:Int
        => Arg0 >>IntTotal Arg1
        requires definedShrInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int >>Int Arg1:Int
        => Arg0 >>IntTotal Arg1
        requires definedShrInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]


    //-------------------------------------


    rule definedPowInt(A:Int, B:Int) => A =/=Int 0 orBool B =/=Int 0

    rule #Ceil(Arg0:Int ^Int Arg1:Int)
        => { definedPowInt(Arg0, Arg1)  #Equals true }
        [simplification]

    rule Arg0:Int ^IntTotal Arg1:Int
        => Arg0 ^Int Arg1
        requires definedPowInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int ^Int Arg1:Int
        => Arg0 ^IntTotal Arg1
        requires definedPowInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int ^Int Arg1:Int
        => Arg0 ^IntTotal Arg1
        requires definedPowInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]


    //-------------------------------------


    rule definedTModInt(_:Int, Y:Int) => Y =/=Int 0

    rule #Ceil(@Arg0:Int %Int @Arg1:Int)
        =>  (({ definedTModInt(@Arg0, @Arg1)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Arg1))
        [simplification]

    rule Arg0:Int %IntTotal Arg1:Int
        => Arg0 %Int Arg1
        requires definedTModInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int %Int Arg1:Int
        => Arg0 %IntTotal Arg1
        requires definedTModInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int %Int Arg1:Int
        => Arg0 %IntTotal Arg1
        requires definedTModInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]


    //-------------------------------------


    rule definedTDivInt(_:Int, Y:Int) => Y =/=Int 0

    rule #Ceil(@Arg0:Int /Int @Arg1:Int)
        =>  (({ definedTDivInt(@Arg0, @Arg1)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Arg1))
        [simplification]

    rule Arg0:Int /IntTotal Arg1:Int
        => Arg0 /Int Arg1
        requires definedTDivInt(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule Arg0:Int /Int Arg1:Int
        => Arg0 /IntTotal Arg1
        requires definedTDivInt(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule Arg0:Int /Int Arg1:Int
        => Arg0 /IntTotal Arg1
        requires definedTDivInt(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]


    //-------------------------------------


    rule definedLog2Int (X:Int) => 0 <Int X


    rule #Ceil(log2Int(X:Int)) => {true #Equals definedLog2Int(X)}
      [simplification]

    rule log2IntTotal(Arg0:Int)
        => log2Int(Arg0)
        requires definedLog2Int(Arg0)
        [concrete, simplification(10), preserves-definedness]

    rule log2Int(Arg0:Int)
        => log2IntTotal(Arg0)
        requires definedLog2Int(Arg0)
        [symbolic(Arg0), simplification, preserves-definedness]


    //-------------------------------------

    rule definedGetElemSegment(Es:ElemSegment, I:Int)
        => 0 <=Int I andBool I <=Int #lenElemSegment(Es)

    rule #Ceil(#getElemSegment(@Arg0:ElemSegment, @Arg1:Int))
        =>  (({ definedGetElemSegment(@Arg0, @Arg1)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Arg1))
        [simplification]

    rule #getElemSegmentTotal(Arg0:ElemSegment, Arg1:Int)
        => #getElemSegment(Arg0, Arg1)
        requires definedGetElemSegment(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule #getElemSegment(Arg0:ElemSegment, Arg1:Int)
        => #getElemSegmentTotal(Arg0, Arg1)
        requires definedGetElemSegment(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule #getElemSegment(Arg0:ElemSegment, Arg1:Int)
        => #getElemSegmentTotal(Arg0, Arg1)
        requires definedGetElemSegment(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]

    //-------------------------------------

    rule definedGetInts(Is:Ints, I:Int)
        => 0 <=Int I andBool I <=Int #lenInts(Is)

    rule #Ceil(#getInts(@Arg0:Ints, @Arg1:Int))
        =>  (({ definedGetInts(@Arg0, @Arg1)  #Equals true }
          #And #Ceil(@Arg0))
          #And #Ceil(@Arg1))
        [simplification]

    rule #getIntsTotal(Arg0:Ints, Arg1:Int)
        => #getInts(Arg0, Arg1)
        requires definedGetInts(Arg0, Arg1)
        [concrete, simplification(10), preserves-definedness]

    rule #getInts(Arg0:Ints, Arg1:Int)
        => #getIntsTotal(Arg0, Arg1)
        requires definedGetInts(Arg0, Arg1)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule #getInts(Arg0:Ints, Arg1:Int)
        => #getIntsTotal(Arg0, Arg1)
        requires definedGetInts(Arg0, Arg1)
        [symbolic(Arg1), simplification, preserves-definedness]


    // ------------------------------------

    rule #Ceil({@Arg0:KItem}:>Bytes)
        =>  ({ definedProjectBytes(@Arg0)  #Equals true }
          #And #Ceil(@Arg0))
        [simplification]

    rule definedProjectBytes(K:KItem) => isBytes(K)


    rule projectBytesTotal(Arg0:KItem)
        => {Arg0}:>Bytes
        requires definedProjectBytes(Arg0)
        [concrete, simplification(10), preserves-definedness]

    rule {Arg0:KItem}:>Bytes
        => projectBytesTotal(Arg0)
        requires definedProjectBytes(Arg0)
        [symbolic(Arg0), simplification, preserves-definedness]

    rule projectBytesTotal(Arg0:Bytes)
        => Arg0
        [simplification]

    // ------------------------------------

    rule #Ceil({@Arg0:KItem}:>Int)
        =>  ({ definedProjectInt(@Arg0)  #Equals true }
          #And #Ceil(@Arg0))
        [simplification]

    rule definedProjectInt(K:KItem) => isInt(K)


    rule projectIntTotal(Arg0:KItem)
        => {Arg0}:>Int
        requires definedProjectInt(Arg0)
        [concrete, simplification(10), preserves-definedness]

    rule {Arg0:KItem}:>Int
        => projectIntTotal(Arg0)
        requires definedProjectInt(Arg0)
        [symbolic(Arg0), simplification, preserves-definedness]


    // -----------------------------------

    rule definedMapLookup(M:Map, Key:KItem) => Key in_keys(M)

    rule M:Map[Key:KItem] orDefault _:KItem
        => M[Key]
        requires definedMapLookup(M, Key)
        [concrete, simplification(10), preserves-definedness]
    rule M:Map[Key:KItem]
        => M[Key] orDefault 0
        requires definedMapLookup(M, Key)
        [symbolic(M), simplification, preserves-definedness]
    rule M:Map[Key:KItem]
        => M[Key] orDefault 0
        requires definedMapLookup(M, Key)
        [symbolic(Key), simplification, preserves-definedness]


    // -----------------------------------

    rule #Ceil(#signed(@T:IValType, @N:Int))
        => {0 <=Int @N andBool @N <Int #pow(@T) #Equals true}
          #And #Ceil(@T)
          #And #Ceil(@N)
          [simplification]

    // -----------------------------------
    // Other stuff
    // -----------------------------------

    rule I /IntTotal J => I divIntTotal J requires 0 <Int J
    rule I %IntTotal J => I modIntTotal J requires 0 <Int J

endmodule
