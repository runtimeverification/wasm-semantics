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

Stack Operations
----------------

Operator `drop` removes a single item from the `<stack>`.
The `select` operator picks one of the second or third stack values based on the first.

```k
    syntax Instr ::= "drop"
 // -----------------------
    rule <k> drop => . ... </k> <stack> S1 : STACK => STACK </stack>

    syntax Instr ::= "select"
 // -------------------------
    rule <k> select => . ... </k>
         <stack> < i32 > C : < TYPE > V1:Number : < TYPE > V2:Number : STACK
              => < TYPE > #if C =/=Int 0 #then V1 #else V2 #fi       : STACK
         </stack>
```

Structured Control Flow
-----------------------

```k
    syntax Label ::= "label" VecType "{" Instrs "}" Stack
 // -----------------------------------------------------
    rule <k> label [ TYPES ] { IS } STACK' => IS ... </k>
         <stack> STACK => #take(TYPES, STACK) ++ STACK' </stack>

    syntax Instr ::= "block" VecType Instrs "end"
 // ---------------------------------------------
    rule <k> block VTYPE IS end => IS ~> label VTYPE { .Instrs } STACK ... </k>
         <stack> STACK => .Stack </stack>

    syntax Instr ::= "br" Int
 // -------------------------
    rule <k> br N ~> (I:Instr => .) ... </k>
    rule <k> br N ~> L:Label => #if N ==Int 0 #then L #else br (N -Int 1) #fi ... </k>

    syntax Instr ::= "br_if" Int
 // ----------------------------
    rule <k> br_if N => #if VAL =/=Int 0 #then br N #else .K #fi ... </k>
         <stack> < TYPE > VAL : STACK => STACK </stack>

    syntax Instr ::= "if" VecType Instrs "else" Instrs "end"
 // --------------------------------------------------------
    rule <k> if VTYPE IS else IS' end
          => #if VAL =/=Int 0 #then IS #else IS' #fi
          ~> label VTYPE { .Instrs } STACK
         ...
         </k>
         <stack> < i32 > VAL : STACK => .Stack </stack>
```

Testing
-------

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
