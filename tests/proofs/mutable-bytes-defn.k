requires "../../data/mutable-bytes.k"

module MUTABLE-BYTES-DEFN-SYNTAX
endmodule

module MUTABLE-BYTES-DEFN
    imports MUTABLE-BYTES

    syntax KItem ::= start(KItem) | end(KItem)

    rule start(X) => end(X)
endmodule
