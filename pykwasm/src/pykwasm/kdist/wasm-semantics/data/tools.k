
module WASM-DATA-TOOLS
    imports BOOL
    imports INT
    imports LIST
    imports MAP

    syntax List ::= setExtend(List, index:Int, value:Int, default:Int)  [function]

    rule setExtend(L:List, I:Int, V:Int, _D:Int)
        => L [ I <- V ]
        requires 0 <=Int I andBool I <Int size(L)
    rule setExtend(L:List, I:Int, V:Int, D:Int)
        => setExtend(L ListItem(D), I, V, D)
        requires size(L) <=Int I

    rule #Ceil(setExtend(_L:List, I:Int, _V:Int, _D:Int)) => {true #Equals 0 <=Int I}
        [simplification]

    syntax Bool ::= isListIndex(Int, List)  [function, total]

    rule isListIndex(I:Int, L:List) => 0 <=Int I andBool I <Int size(L)

    syntax List ::= makeListTotal(Int, KItem)
        [function, total, klabel(List:makeTotal), symbol]
    // ----------------------------------------------------
    rule makeListTotal(N, V) => makeList(N, V)
        requires N >=Int 0
    rule makeListTotal(N, _) => .List
        requires N <Int 0

    syntax Int   ::= unwrap(KItem, Int)         [function, total, symbol(unwrap:Int)]
    syntax Bytes ::= unwrap(KItem, Bytes)       [function, total, symbol(unwrap:Bytes)]
 // -----------------------------------------------------------------
    rule [unwrap-int-t]:   unwrap(I:Int,   _:Int)   => I
    rule [unwrap-int-f]:   unwrap(X,       D:Int)   => D   requires notBool isInt(X)
    rule [unwrap-Bytes-t]: unwrap(B:Bytes, _:Bytes) => B
    rule [unwrap-Bytes-f]: unwrap(X,       D:Bytes) => D   requires notBool isBytes(X)

    syntax Int ::= Map "{{" KItem "}}" "orDefault" Int    [function, total, symbol(MAP.lookupOrDefault.Int)]
 // ---------------------------------------------------------------------------------------------
    rule M:Map {{ Key }} orDefault D:Int   => unwrap((M[Key] orDefault D), D)
    
    syntax Bytes ::= Map "{{" KItem "}}" "orDefault" Bytes    [function, total, symbol(MAP.lookupOrDefault.Bytes)]
 // ---------------------------------------------------------------------------------------------
    rule M:Map {{ Key }} orDefault D:Bytes => unwrap((M[Key] orDefault D), D)


    syntax KItem ::= List "[" Int "]" "orDefault" KItem
          [ function, total, klabel(List:getOrDefault), symbol ]
 // ----------------------------------------------------------------
    rule ListItem(V) _:List [0] orDefault _:KItem
      => V
    rule _:List ListItem(V) [-1] orDefault _:KItem
        => V
    rule .List [_:Int] orDefault D:KItem => D

    rule ListItem(_:KItem) L:List [I:Int] orDefault D:KItem
        => L[I -Int 1] orDefault D
        requires 0 <Int I
    rule L:List ListItem(_:KItem) [I:Int] orDefault D:KItem
        => L[I +Int 1] orDefault D
        requires I <Int 0

    rule L:List[I:Int] orDefault D:KItem => D
        requires notBool (0 -Int size(L) <=Int I andBool I <Int size(L))
        [simplification]

    syntax Int ::= List "{{" Int "}}" "orDefault" Int
                    [ function, total, symbol, klabel(ListInt:primitiveLookupOrDefault) ]
    // -----------------------------------------------------------------------------
    rule L:List {{ I:Int }} orDefault Value:Int => unwrap( L [I] orDefault Value, Value )

    syntax Bytes ::= List "{{" Int "}}" "orDefault" Bytes
                    [ function, total, symbol, klabel(ListBytes:primitiveLookupOrDefault) ]
    // -----------------------------------------------------------------------------
    rule L:List {{ I:Int }} orDefault Value:Bytes => unwrap( L [I] orDefault Value, Value )

    syntax List ::= dropList(List, Int)     [function, total]
    // ------------------------------------------------------
    rule dropList(ListItem(_) L, N) => dropList(L, N -Int 1)      requires 0 <Int N
    rule dropList(L,             _) => L                          [owise]
    
endmodule