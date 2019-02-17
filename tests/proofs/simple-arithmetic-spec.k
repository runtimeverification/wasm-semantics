requires "kwasm-lemmas.k"

module SIMPLE-ARITHMETIC-SPEC
    imports WASM

    rule <k> ( ITYPE:IValType . const X:Int ) => . </k>
         <stack> S:Stack => < ITYPE > X : S </stack>
      requires 0 <=Int X

    rule <k> ( ITYPE:IValType . const X:Int ) => . </k>
         <stack> S:Stack => < ITYPE > (X +Int #pow(ITYPE)) : S </stack>
      requires X <Int 0

    rule <k> ( ITYPE:IValType . const X:Int ) ( ITYPE . const Y:Int ) => . </k>
         <stack> S:Stack => < ITYPE > Y : < ITYPE > X : S </stack>
      requires 0 <=Int X andBool 0 <=Int Y
endmodule
