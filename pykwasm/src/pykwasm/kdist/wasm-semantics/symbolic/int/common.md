```k
module WASM-INT-COMMON
    imports BOOL
    imports INT

    syntax Bool ::= isFullMask(Int)  [function, total]
    rule isFullMask(I:Int) => I ==Int fullMask(log2Int(I) +Int 1)
      requires 0 <Int I
    rule isFullMask(I:Int) => false
      requires I <=Int 0

    syntax Bool ::= isPowerOf2(Int)  [function, total]
    rule isPowerOf2(I:Int) => I ==Int 1 <<Int log2Int(I)
        requires 0 <Int I
    rule isPowerOf2(I:Int) => false
        requires I <=Int 0

    syntax Int ::= fullMask(Int) [function, total]
    rule fullMask(I:Int) => (1 <<Int I) -Int 1
        requires 0 <Int I
    rule fullMask(I:Int) => 0
        requires I <=Int 0
endmodule
```