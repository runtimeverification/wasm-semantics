require "list-int.k"

module WASM-DATA-TOOLS
    imports BOOL
    imports LIST-INT
    imports LIST-INT-PRIMITIVE

    syntax ListInt ::= setExtend(ListInt, index:Int, value:Int, default:Int)  [function]

    rule setExtend(L:ListInt, I:Int, V:Int, _D:Int)
        => L{{I <- V}}
        requires 0 <=Int I andBool I <Int size(L)
    rule setExtend(L:ListInt, I:Int, V:Int, D:Int)
        => setExtend(L ListItem(wrap(D)), I, V, D)
        requires size(L) <=Int I

    rule #Ceil(setExtend(_L:ListInt, I:Int, _V:Int, _D:Int)) => {true #Equals 0 <=Int I}
        [simplification]

    syntax Bool ::= isListIndex(Int, ListInt)  [function, total]

    rule isListIndex(I:Int, L:ListInt) => 0 <=Int I andBool I <Int size(L)

endmodule