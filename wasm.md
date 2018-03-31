WASM Instructions
=================

```k
require "data.k"

module WASM-BASIC-INSTRUCTIONS
    imports WASM-DATA

    syntax Instr ::= "(" Instr ")" [bracket]
 // ----------------------------------------

    syntax Instrs ::= List{Instr, ""}
 // ---------------------------------
    rule .Instrs                       => .
    rule I:Instr IS:Instrs             => I ~> IS
    rule I:Instr ~> .Instrs            => I
    rule I:Instr ~> I':Instr IS:Instrs => I ~> I' ~> IS
```

```k
endmodule
```

WASM State and Semantics
========================

```k
module WASM
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
```

Numeric Operators
-----------------

A large portion of the available opcodes are pure arithmetic.
In the semantics, the correct `#eval<T><AR>Op` function is called based on the arity of the called operator.
This allows us to give purely functional semantics to many numeric opcodes.

### Constants

Constants are moved directly to the value stack.
Function `#unsigned` is called on integers to allow programs to use negative numbers directly.

```k
    syntax Instr ::= IValType "." "const" Int
                   | FValType "." "const" Float
 // -------------------------------------------
    rule <k> ITYPE:IValType . const VAL => . ... </k> <stack> STACK => < ITYPE > #unsigned(ITYPE, VAL) : STACK </stack>
    rule <k> FTYPE:FValType . const VAL => . ... </k> <stack> STACK => < FTYPE > VAL                   : STACK </stack>
```

### Unary Operators

When a unary operator is the next instruction, `#eval<T>UnOp` will be called on the operator and its arguments.

```k
    syntax UnOp ::= IUnOp
 //               | FUnOp
 // ---------------------

    syntax Instr ::= IValType "." IUnOp
 //                | FValType "." FUnOp
 // -----------------------------------

    syntax Val ::= #evalIUnOp ( Instr , Int   ) [function]
 //              | #evalFUnOp ( Instr , Float ) [function]
 // ------------------------------------------------------
    rule <k> (ITYPE . UOP:IUnOp => .) ... </k>
         <stack> < ITYPE > SI1                : STACK
              => #evalIUnOp(ITYPE . UOP, SI1) : STACK
         </stack>
```

### Binary Operators

When a binary operator is the next instruction, `#eval<T>BinOp` will be called on the operator and its two arguments.

```k
    syntax BinOp ::= IBinOp
 //                | FBinOp
 // -----------------------

    syntax Instr ::= IValType "." IBinOp
 //                | FValType "." FBinOp
 // ------------------------------------

    syntax Val ::= #evalIBinOp ( Instr , Int   , Int   ) [function]
 //              | #evalFBinOp ( Instr , Float , Float ) [function]
 // ---------------------------------------------------------------
    rule <k> (ITYPE . BOP:IBinOp => .) ... </k>
         <stack> < ITYPE > SI1 : < ITYPE > SI2        : STACK
              => #evalIBinOp(ITYPE . BOP , SI1 , SI2) : STACK
         </stack>
```

### Integer Arithmetic

```k
    syntax IBinOp ::= "add" | "sub" | "mul"
 // ---------------------------------------
    rule #evalIBinOp(TYPE . add, I1, I2) => #chop(< TYPE > (I1 +Int I2))
    rule #evalIBinOp(TYPE . sub, I1, I2) => #chop(< TYPE > (I1 -Int I2))
    rule #evalIBinOp(TYPE . mul, I1, I2) => #chop(< TYPE > (I1 *Int I2))

    syntax IBinOp ::= "div_u" | "rem_u"
 // -----------------------------------
    rule #evalIBinOp(TYPE . div_u, I1, I2)
      => #if I2 =/=Int 0
            #then < TYPE > (I1 /Int I2)
            #else undefined
         #fi

    rule #evalIBinOp(TYPE . rem_u, I1, I2)
      => #if I2 =/=Int 0
            #then < TYPE > (I1 %Int I2)
            #else undefined
         #fi

    syntax IBinOp ::= "div_s" | "rem_s"
 // -----------------------------------
    rule #evalIBinOp(ITYPE . div_s, I1, I2)
      => #if I2 =/=Int 0 andBool (I1 =/=Int #pow1(ITYPE) orBool (I2 =/=Int #pow(ITYPE) -Int 1))
            #then < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2))
            #else undefined
         #fi

    rule #evalIBinOp(ITYPE . rem_s, I1, I2)
      => #if I2 =/=Int 0
            #then < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2))
            #else undefined
         #fi
```

### Bitwise Operations

```k
    syntax IBinOp ::= "and" | "or" | "xor"
 // --------------------------------------
    rule #evalIBinOp(TYPE . and, I1, I2) =>       < TYPE > (I1 &Int   I2)
    rule #evalIBinOp(TYPE . or,  I1, I2) => #chop(< TYPE > (I1 |Int   I2))
    rule #evalIBinOp(TYPE . xor, I1, I2) => #chop(< TYPE > (I1 xorInt I2))

    syntax IBinOp ::= "shl" | "shr_u" | "shr_s"
 // -------------------------------------------
    rule #evalIBinOp(TYPE . shl,   I1, I2) => #chop(< TYPE > I1 <<Int (I2 %Int #width(TYPE)))
    rule #evalIBinOp(TYPE . shr_u, I1, I2) =>       < TYPE > I1 >>Int (I2 %Int #width(TYPE))

    rule #evalIBinOp(TYPE . shr_s, I1, I2) => < TYPE > #unsigned(TYPE, #signed(TYPE, I1) >>Int (I2 %Int #width(TYPE)))

    syntax IBinOp ::= "rotl" | "rotr"
 // ---------------------------------
    rule #evalIBinOp(TYPE . rotl, I1, I2) => #chop(< TYPE > (I1 <<Int (I2 %Int #width(TYPE))) +Int (I1 >>Int (#width(TYPE) -Int (I2 %Int #width(TYPE)))))
    rule #evalIBinOp(TYPE . rotr, I1, I2) => #chop(< TYPE > (I1 >>Int (I2 %Int #width(TYPE))) +Int (I1 <<Int (#width(TYPE) -Int (I2 %Int #width(TYPE)))))
```

**TODO**: `clz`, `ctz`, `popcnt`.

### Comparison Operations

```k
    syntax IUnOp ::= "eqz"
 // ----------------------
    rule #evalIUnOp(TYPE . eqz, I1) => < TYPE > 1 requires I1 ==Int 0
    rule #evalIUnOp(TYPE . eqz, I1) => < TYPE > 0 requires I1 =/=Int 0

    syntax IBinOp ::= "eq" | "ne"
 // -----------------------------
    rule #evalIBinOp(TYPE . eq, I1, I2) => < TYPE > 1 requires I1 ==Int  I2
    rule #evalIBinOp(TYPE . eq, I1, I2) => < TYPE > 0 requires I1 =/=Int I2
    rule #evalIBinOp(TYPE . ne, I1, I2) => < TYPE > 1 requires I1 =/=Int I2
    rule #evalIBinOp(TYPE . ne, I1, I2) => < TYPE > 0 requires I1 ==Int  I2

    syntax IBinOp ::= "lt_u" | "gt_u" | "lt_s" | "gt_s"
 // ---------------------------------------------------
    rule #evalIBinOp(TYPE . lt_u, I1, I2) => < TYPE > #bool(I1 <Int I2)
    rule #evalIBinOp(TYPE . gt_u, I1, I2) => < TYPE > #bool(I1 >Int I2)

    rule #evalIBinOp(TYPE . lt_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) <Int #signed(TYPE, I2))
    rule #evalIBinOp(TYPE . gt_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) >Int #signed(TYPE, I2))

    syntax IBinOp ::= "le_u" | "ge_u" | "le_s" | "ge_s"
 // ---------------------------------------------------
    rule #evalIBinOp(TYPE . le_u, I1, I2) => < TYPE > #bool(I1 <=Int I2)
    rule #evalIBinOp(TYPE . ge_u, I1, I2) => < TYPE > #bool(I1 >=Int I2)

    rule #evalIBinOp(TYPE . le_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) <=Int #signed(TYPE, I2))
    rule #evalIBinOp(TYPE . ge_s, I1, I2) => < TYPE > #bool(#signed(TYPE, I1) >=Int #signed(TYPE, I2))
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

Function Declaration and Invocation
-----------------------------------

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we only provide only two formats, one where all three of `param`, `local`, and `result` are provided, and one which omits `local`.

```k
    syntax FunctionName ::= Int
 // ---------------------------

    syntax  ParamDecl  ::= "param"  ValTypes
    syntax  LocalDecl  ::= "local"  ValTypes
    syntax ResultDecl  ::= "result" ValType
    syntax    SigDecl  ::= "(" SigDecl ")" [bracket]
                         | ParamDecl | LocalDecl | ResultDecl
    syntax    SigDecls ::= List{SigDecl, ""}
 // ----------------------------------------

    syntax Instr ::= "func" FunctionName SigDecls Instrs
 // ----------------------------------------------------
    rule <k> func FNAME param TDOMAIN                 result TRANGE INSTRS
          => func FNAME param TDOMAIN local .ValTypes result TRANGE INSTRS
         ...
         </k>

    rule <k> func FNAME param TDOMAIN local TLOCAL result TRANGE INSTRS => . ... </k>
         <funcs>
           ( .Bag
          => <funcDef>
               <fname>  FNAME                     </fname>
               <fcode>  INSTRS                    </fcode>
               <ftype>  [ TDOMAIN ] -> [ TRANGE ] </ftype>
               <flocal> [ TLOCAL ]                </flocal>
               ...
             </funcDef>
           )
           ...
         </funcs>
```

### Function Invocation/Return

```k
    syntax Frame ::= "frame" ValTypes Stack Map
 // -------------------------------------------
    rule <k> frame TRANGE STACK' LOCAL' => . ... </k>
         <stack> STACK => #take(TRANGE, STACK) ++ STACK' </stack>
         <locals> _ => LOCAL' </locals>

    syntax Instr ::= "invoke" Int
 // -----------------------------
    rule <k> invoke FNAME
          => init_locals #take(TDOMAIN, STACK) ++ #zero(TLOCALS)
          ~> INSTRS
          ~> frame TRANGE #drop(TDOMAIN, STACK) LOCAL
          ...
          </k>
         <stack>  STACK => .Stack </stack>
         <curFrame>
           <addrs> _ => ADDRS </addrs>
           <locals> LOCAL => .Map </locals>
           ...
         </curFrame>
         <funcDef>
           <fname>  FNAME                     </fname>
           <ftype>  [ TDOMAIN ] -> [ TRANGE ] </ftype>
           <flocal> [ TLOCALS ]               </flocal>
           <fcode>  INSTRS                    </fcode>
           <faddrs> ADDRS                     </faddrs>
           ...
         </funcDef>

    syntax Instr ::= "return"
 // -------------------------
    rule <k> return ~> (I:Instr => .)  ... </k>
    rule <k> return ~> (L:Label => .)  ... </k>
    rule <k> (return => .) ~> FR:Frame ... </k>
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
