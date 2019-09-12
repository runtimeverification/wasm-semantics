requires "kwasm-lemmas.k"

// TODO: i32 => ITYPE
module MEMORY-SPEC
    imports KWASM-LEMMAS

    rule <k> (i32.const ADDR i32.const EA i32.const SIZE):Stmts => . ... </k>

endmodule