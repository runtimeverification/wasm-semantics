WASM State and Semantics
========================

```k
// Copyright (c) 2015 K Team. All Rights Reserved.
require "domains.k"
require "wasm-syntax.k"

module WASM
    imports INT
    imports FLOAT
    imports BASIC-K
    imports LIST
    imports MAP
    imports SET
    imports WASM-BASIC-INSTRUCTIONS

    configuration
      <k> $PGM:Instrs </k>
      <stack> .Stack </stack>

    rule <k> ITYPE:IValType . const VAL => . ... </k> <stack> STACK => < ITYPE > #unsigned(ITYPE, VAL) : STACK </stack>
    rule <k> FTYPE:FValType . const VAL => . ... </k> <stack> STACK => < FTYPE > VAL                   : STACK </stack>

    rule <k> (ITYPE . UOP:IUnOp => .) ... </k>
         <stack> < ITYPE > SI1                : STACK
              => #evalIUnOp(ITYPE . UOP, SI1) : STACK
         </stack>

    rule <k> (ITYPE . BOP:IBinOp => .) ... </k>
         <stack> < ITYPE > SI1 : < ITYPE > SI2        : STACK
              => #evalIBinOp(ITYPE . BOP , SI1 , SI2) : STACK
         </stack>
```

For testing, we augment the semantics with some helpers.
These functions make assertions about the state of the `<stack>` cell.

```k
    syntax Instr ::= "#assertTopStack" StackItem String
                   | "#assertStack"    Stack     String
 // ---------------------------------------------------
    rule <k> #assertTopStack S                      _ => . ... </k> <stack> S              : STACK => STACK </stack>
    rule <k> #assertTopStack < ITYPE:IValType > VAL _ => . ... </k> <stack> < ITYPE > VAL' : STACK => STACK </stack>
      requires #unsigned(ITYPE, VAL) ==Int VAL'

    rule <k> #assertStack .Stack      _   => .                                               ... </k>
    rule <k> #assertStack (S : STACK) STR => #assertTopStack S STR ~> #assertStack STACK STR ... </k>
```

```k
endmodule
```
