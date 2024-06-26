module CEILS-SYNTAX
    imports BOOL
    imports BYTES
    imports INT
    imports WASM-DATA

    syntax Bool ::= definedSubstrBytes(Bytes, startIndex: Int, endIndex: Int)  [function, total]
    syntax Bool ::= definedReplaceAtBytes(dest: Bytes, index: Int, src: Bytes)  [function, total]
    syntax Bool ::= definedPadRightBytes(Bytes, length: Int, value: Int)  [function, total]
    syntax Bool ::= definedPadLeftBytes(Bytes, length: Int, value: Int)  [function, total]
    syntax Bool ::= definedModInt(Int, Int)  [function, total]
    syntax Bool ::= definedDivInt(Int, Int)  [function, total]
    syntax Bool ::= definedShlInt(Int, Int)  [function, total]
    syntax Bool ::= definedShrInt(Int, Int)  [function, total]
    syntax Bool ::= definedPowInt(Int, Int)  [function, total]
    syntax Bool ::= definedTModInt(Int, Int)  [function, total]
    syntax Bool ::= definedTDivInt(Int, Int)  [function, total]
    syntax Bool ::= definedLog2Int(Int)  [function, total]
    syntax Bool ::= definedProjectBytes(KItem)  [function, total]
    syntax Bool ::= definedProjectInt(KItem)  [function, total]
    syntax Bool ::= definedMapLookup(Map, KItem)  [function, total]

    syntax Bool ::= definedGetInts(Ints, Int)  [function, total]
    syntax Bool ::= definedGetElemSegment(ElemSegment, Int)  [function, total]

    // ---------------------------------------

    syntax Bytes ::= substrBytesTotal(Bytes, startIndex: Int, endIndex: Int)
        [function, total, symbol(substrBytesTotal), no-evaluators]
    syntax Bytes ::= replaceAtBytesTotal(dest: Bytes, index: Int, src: Bytes)
        [function, total, symbol(replaceAtBytesTotal), no-evaluators]
    syntax Bytes ::= padRightBytesTotal(Bytes, length: Int, value: Int)
        [function, total, symbol(padRightBytesTotal), no-evaluators]
    syntax Bytes ::= padLeftBytesTotal(Bytes, length: Int, value: Int)
        [function, total, symbol(padLeftBytesTotal), no-evaluators]
    syntax Int ::= Int "modIntTotal" Int
        [function, total, symbol(modIntTotal), no-evaluators, smtlib(modIntTotal)]
    syntax Int ::= Int "divIntTotal" Int
        [function, total, symbol(divIntTotal), no-evaluators, smt-hook(div)]
    syntax Int ::= Int "<<IntTotal" Int
        [function, total, symbol(shlIntTotal), no-evaluators]
    syntax Int ::= Int ">>IntTotal" Int
        [function, total, symbol(shrIntTotal), no-evaluators]
    syntax Int ::= Int "^IntTotal" Int
        [function, total, symbol(powIntTotal), no-evaluators]
    syntax Int ::= Int "%IntTotal" Int
        [function, total, symbol(tModIntTotal), no-evaluators, smtlib(tModInt)]
    syntax Int ::= Int "/IntTotal" Int
        [function, total, symbol(tDivIntTotal), no-evaluators, smtlib(tDivInt)]
    syntax Int ::= log2IntTotal(Int)
        [ function, total, symbol(log2IntTotal), no-evaluators,
          smtlib(log2IntTotal)
        ]
    syntax Bytes ::= projectBytesTotal(KItem)
        [function, total, symbol(projectBytesTotal), no-evaluators]
    syntax Int ::= projectIntTotal(KItem)
        [function, total, symbol(projectIntTotal), no-evaluators]


    syntax Int ::= #getIntsTotal(Ints, Int)
        [function, total, symbol(#getIntsTotal), no-evaluators/*, smtlib(poundGetInts)*/]
    syntax Index ::= #getElemSegmentTotal(ElemSegment, Int)
        [function, total, symbol(#getElemSegmentTotal), no-evaluators]
endmodule