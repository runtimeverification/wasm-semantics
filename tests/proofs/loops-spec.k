requires "kwasm-lemmas.k"

module LOOPS-SPEC
    imports WASM
    imports KWASM-LEMMAS

    rule <k> block .TypeDecls
                 ( loop .TypeDecls
                     (local.get 0)
                     (local.get 1)
                     (i32.add)
                     (local.set 1)
                     (local.get 0)
                     (i32.const 1)
                     (i32.sub)
                     (local.tee 0)
                     (i32.eqz)
                     (br_if 1)
                     (br 0)
                 )
             end
          => .
          ...
         </k>
         <locals>
           0 |-> < i32 > (10 => 0)
           1 |-> < i32 > (0 => 55)
         </locals>
endmodule
