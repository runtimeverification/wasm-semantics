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
      <curFrame>
        <addrs>   .Map </addrs>
        <locals>  .Map </locals>
        <globals> .Map </globals>
      </curFrame>
      <store>
        <funcs>
          <funcDef multiplicity="*" type="Map">
            <fname>  0       </fname>
            <fcode>  .Instrs </fcode>
            <ftype>  .Type   </ftype>
            <flocal> .Type   </flocal>
            <faddrs> .Map    </faddrs>
          </funcDef>
        </funcs>
      </store>

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

`nop` does nothing.

```k
    syntax Instr ::= "nop"
 // ----------------------
    rule <k> nop => . ... </k>
```

Labels are administrative instructions used to mark the targets of break instructions.
They contain the continuation to use following the label, as well as the original stack to restore.
The supplied type represents the values that should taken from the current stack.

A block is the simplest way to create targets for break instructions (ie. jump destinations).
It simply executes the block then records a label with an empty continuation.

```k
    syntax Label ::= "label" VecType "{" Instrs "}" Stack
 // -----------------------------------------------------
    rule <k> label [ TYPES ] { IS } STACK' => IS ... </k>
         <stack> STACK => #take(TYPES, STACK) ++ STACK' </stack>

    syntax Instr ::= "block" VecType Instrs "end"
 // ---------------------------------------------
    rule <k> block VTYPE IS end => IS ~> label VTYPE { .Instrs } STACK ... </k>
         <stack> STACK => .Stack </stack>
```

The `br*` instructions search through the instruction stack (the `<k>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WASM specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax Instr ::= "br" Int
 // -------------------------
    rule <k> br N ~> (I:Instr => .) ... </k>
    rule <k> br N ~> L:Label => #if N ==Int 0 #then L #else br (N -Int 1) #fi ... </k>

    syntax Instr ::= "br_if" Int
 // ----------------------------
    rule <k> br_if N => #if VAL =/=Int 0 #then br N #else .K #fi ... </k>
         <stack> < TYPE > VAL : STACK => STACK </stack>
```

Finally, we have the conditional and loop instructions.

```k
    syntax Instr ::= "if" VecType Instrs "else" Instrs "end"
 // --------------------------------------------------------
    rule <k> if VTYPE IS else IS' end
          => #if VAL =/=Int 0 #then IS #else IS' #fi
          ~> label VTYPE { .Instrs } STACK
         ...
         </k>
         <stack> < i32 > VAL : STACK => .Stack </stack>

    syntax Instr ::= "loop" VecType Instrs "end"
 // --------------------------------------------
    rule <k> loop VTYPE IS end => IS ~> label [ .ValTypes ] { loop VTYPE IS end } STACK ... </k>
         <stack> STACK => .Stack </stack>
```

Memory Operators
----------------

### Locals

The various `init_local` variants assist in setting up the `locals` cell.

```k
    syntax Instr ::=  "init_local"  Int Val
                   |  "init_locals"     Stack
                   | "#init_locals" Int Stack
 // -----------------------------------------
    rule <k> init_local INDEX VALUE => . ... </k>
         <locals> LOCALS => LOCALS [ INDEX <- VALUE ] </locals>

    rule <k> init_locals VALUES => #init_locals 0 VALUES ... </k>

    rule <k> #init_locals _ .Stack => . ... </k>
    rule <k> #init_locals N (VALUE : STACK)
          => init_local N VALUE
          ~> #init_locals (N +Int 1) STACK
          ...
          </k>
```

The `*_local` instructions are defined here.

```k
    syntax Instr ::= "get_local" Int
                   | "set_local" Int
                   | "tee_local" Int
 // --------------------------------
    rule <k> get_local INDEX => . ... </k>
         <stack> STACK => VALUE : STACK </stack>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> set_local INDEX => . ... </k>
         <stack> VALUE : STACK => STACK </stack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>

    rule <k> tee_local INDEX => . ... </k>
         <stack> VALUE : STACK </stack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>
```

### Globals

```k
    syntax Instr ::= "init_global" Int Val
                   |  "get_global" Int
                   |  "set_global" Int
 // ----------------------------------
    rule <k> init_global INDEX VALUE => . ... </k>
         <globals> GLOBALS => GLOBALS [ INDEX <- VALUE ] </globals>

    rule <k> get_global INDEX => . ... </k>
         <stack> STACK => VALUE : STACK </stack>
         <globals> ... INDEX |-> VALUE ... </globals>

    rule <k> set_global INDEX => . ... </k>
         <stack> VALUE : STACK => STACK </stack>
         <globals> ... INDEX |-> (_ => VALUE) ... </globals>
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

The operator `#assertLocal`/`#assertGlobal` operators perform a check for a local/global variable's value.

```k
    syntax Instr ::= "#assertLocal"  Int Val String
                   | "#assertGlobal" Int Val String
 // -----------------------------------------------
    rule <k> #assertLocal INDEX VALUE _ => . ... </k>
         <locals> ... (INDEX |-> VALUE => .Map) ... </locals>

    rule <k> #assertGlobal INDEX VALUE _ => . ... </k>
         <globals> ... (INDEX |-> VALUE => .Map) ... </globals>
```

After running a test, the function cell should be cleared on success to match the template configuration.

```k
    syntax Instr ::= "#assertFunction" FunctionName String
 // ------------------------------------------------------
    rule <k> #assertFunction FNAME _ => . ... </k>
         <funcs>
           ( <funcDef>
               <fname> FNAME </fname>
               ...
             </funcDef>
          => .Bag
           )
           ...
         </funcs>
```

```k
endmodule
```
