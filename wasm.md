WebAssembly State and Semantics
===============================

```k
require "data.k"

module WASM
    imports WASM-DATA
```

Configuration
-------------

```k
    configuration
      <k> $PGM:Instrs </k>
      <deterministicMemoryGrowth> true </deterministicMemoryGrowth>
      <stack> .Stack </stack>
      <curFrame>
        <addrs>  .Map </addrs>
        <locals> .Map </locals>
        <moduleInst>
          <globals>  .Map  </globals>
          <memAddrs> .Map  </memAddrs>
        </moduleInst>
      </curFrame>
      <store>
        <funcs>
          <funcDef multiplicity="*" type="Map">
            <fname>  .FunctionName  </fname>
            <fcode>  .Instrs:Instrs </fcode>
            <ftype>  .Type          </ftype>
            <flocal> .Type          </flocal>
            <faddrs> .Map           </faddrs>
          </funcDef>
        </funcs>
        <nextMemAddr> 0 </nextMemAddr>
        <mems>
          <memInst multiplicity="*" type="Map">
            <memAddr> 0         </memAddr>
            <mmax>    .MemBound </mmax>
            <msize>   0         </msize>
          </memInst>
        </mems>
      </store>
```

### Assumptions and invariants

Integers in K are unbounded.
As an invariant, however, for any integer `< iNN > I:Int` on the stack, `I` is between 0 and `#pow(NN) - 1`.
That way, unsigned instructions can make use of `I` directly, whereas signed instructions may need `#signed(iNN, I)`.

The highest address in a memory instance divided by the `#pageSize()` constant (defined below) may not exceed the value in the `<max>` cell, if present.

Instructions
------------

### Sequencing

WebAssembly instructions are space-separated lists of instructions.

```k
    syntax Instrs ::= List{Instr, ""} [klabel(listInstr)]
 // -----------------------------------------------------
    rule <k> .Instrs           => .       ... </k>
    rule <k> I:Instr IS:Instrs => I ~> IS ... </k>
```

### Traps

When a single value ends up on the instruction stack (the `<k>` cell), it is moved over to the value stack (the `<stack>` cell).
If the value is the special `undefined`, then `trap` is generated instead.

```k
    syntax Instr ::= "trap"
 // -----------------------
    rule <k> undefined => trap ... </k>
    rule <k> V:Val     => .    ... </k>
         <stack> STACK => V : STACK </stack>
      requires V =/=K undefined
```

Common Operator Machinery
-------------------------

Common machinery for operators is supplied here, based on their categorization.
This allows us to give purely functional semantics to many of the opcodes.

### Constants

Constants are moved directly to the value stack.
Function `#unsigned` is called on integers to allow programs to use negative numbers directly.

```k
    syntax Instr ::= "(" IValType "." "const" Int   ")"
                   | "(" FValType "." "const" Float ")"
 // ---------------------------------------------------
    rule <k> ( ITYPE:IValType . const VAL ) => < ITYPE > #unsigned(ITYPE, VAL) ... </k>
    rule <k> ( FTYPE:FValType . const VAL ) => < FTYPE > VAL                   ... </k>
```

### Unary Operators

When a unary operator is the next instruction, the single argument is loaded from the `<stack>` automatically.
A `UnOp` operator always produces a result of the same type as its operand.

```k
    syntax UnOp ::= IUnOp
 //               | FUnOp
 // ---------------------

    syntax Instr ::= "(" IValType "." IUnOp ")" | "(" IValType "." IUnOp Instr ")" | IValType "." IUnOp Int
 //                | "(" FValType "." FUnOp ")" | "(" FValType "." FUnOp Instr ")" | FValType "." FUnOp Float
 // ---------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . UOP:IUnOp I:Instr ) => I ~> ( ITYPE . UOP ) ... </k>

    rule <k> ( ITYPE . UOP:IUnOp ) => ITYPE . UOP C1 ... </k>
         <stack> < ITYPE > C1 : STACK => STACK </stack>
```

### Binary Operators

When a binary operator is the next instruction, the two arguments are loaded from the `<stack>` automatically.
A `BinOp` operator always produces a result of the same type as its operands.

```k
    syntax BinOp ::= IBinOp
 //                | FBinOp
 // -----------------------

    syntax Instr ::= "(" IValType "." IBinOp ")" | "(" IValType "." IBinOp Instr Instr ")" | IValType "." IBinOp Int   Int
 //                | "(" FValType "." FBinOp ")" | "(" FValType "." FBinOp Instr Instr ")" | FValType "." FBinOp Float Float
 // ------------------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . BOP:IBinOp I:Instr I':Instr ) => I ~> I' ~> ( ITYPE . BOP ) ... </k>

    rule <k> ( ITYPE . BOP:IBinOp ) => ITYPE . BOP C1 C2 ... </k>
         <stack> < ITYPE > C2 : < ITYPE > C1 : STACK => STACK </stack>
```

### Test Operations

When a test operator is the next instruction, the single argument is loaded from the `<stack>` automatically.
Test operations consume one operand and produce a bool, which is an `i32` value.

```k
    syntax Instr ::= "(" IValType "." ITestOp ")" | "(" IValType "." ITestOp Instr ")" | IValType "." ITestOp Int
 // -------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . TOP:ITestOp I:Instr ) => I ~> ( ITYPE . TOP ) ... </k>

    rule <k> ( ITYPE . TOP:ITestOp ) => ITYPE . TOP C1 ... </k>
         <stack> < ITYPE > C1 : STACK => STACK </stack>
```

### Comparison Operations

When a comparison operator is the next instruction, the two arguments are loaded from the `<stack>` automatically.
Comparisons consume two operands and produce a bool, which is an `i32` value.


```k
    syntax RelOp ::= IRelOp
 //                | FRelOp
 // -----------------------

    syntax Instr ::= "(" IValType "." IRelOp ")" | "(" IValType "." IRelOp Instr Instr ")" | IValType "." IRelOp Int   Int
 //                  "(" FValType "." FRelOp ")" | "(" IValType "." FRelOp Instr Instr ")" | IValType "." FRelOp Float Float
 // ------------------------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . ROP:IRelOp I:Instr I':Instr ) => I ~> I' ~> ( ITYPE . ROP ) ... </k>

    rule <k> ( ITYPE . ROP:IRelOp ) => ITYPE . ROP C1 C2 ... </k>
         <stack> < ITYPE > C2 : < ITYPE > C1 : STACK => STACK  </stack>
```

### Conversion Operations

Conversion operators always take a single argument as input and cast it to another type.
For each element added to `ConvOp`, functions `#convSourceType` and `#convOp` must be defined over it.

These operators convert constant elements at the top of the stack to another type.
The target type is before the `.`, and the source type is after the `_`.

```k
    syntax Instr ::= "(" IValType "." ConvOp ")" | "(" IValType "." ConvOp Instr ")" | IValType "." ConvOp Int
 // ----------------------------------------------------------------------------------------------------------
    rule <k> ( ITYPE . CONVOP:ConvOp I:Instr ) => I ~> ( ITYPE . CONVOP ) ... </k>

    rule <k> ( ITYPE . CONVOP:ConvOp ) => ITYPE . CONVOP C1  ... </k>
         <stack> < SRCTYPE > C1 : STACK => STACK </stack>
      requires #convSourceType(CONVOP) ==K SRCTYPE

    syntax IValType ::= #convSourceType ( ConvOp ) [function]
 // ---------------------------------------------------------
```

Numeric Operators
-----------------

### Integer Arithmetic

`add`, `sub`, and `mul` are given semantics by lifting the correct K operators through the `#chop` function.

```k
    syntax IBinOp ::= "add" | "sub" | "mul"
 // ---------------------------------------
    rule <k> ITYPE . add I1 I2 => #chop(< ITYPE > I1 +Int I2) ... </k>
    rule <k> ITYPE . sub I1 I2 => #chop(< ITYPE > I1 -Int I2) ... </k>
    rule <k> ITYPE . mul I1 I2 => #chop(< ITYPE > I1 *Int I2) ... </k>
```

`div_*` and `rem_*` have extra side-conditions about when they are defined or not.
Note that we do not need to call `#chop` on the results here.

```k
    syntax IBinOp ::= "div_u" | "rem_u"
 // -----------------------------------
    rule <k> ITYPE . div_u I1 I2 => #if I2 =/=Int 0 #then < ITYPE > (I1 /Int I2) #else undefined #fi ... </k>
    rule <k> ITYPE . rem_u I1 I2 => #if I2 =/=Int 0 #then < ITYPE > (I1 %Int I2) #else undefined #fi ... </k>

    syntax IBinOp ::= "div_s" | "rem_s"
 // -----------------------------------
    rule <k> ITYPE . div_s I1 I2
          => #if I2 =/=Int 0 andBool (I1 =/=Int #pow1(ITYPE) orBool (I2 =/=Int #pow(ITYPE) -Int 1))
                #then < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) /Int #signed(ITYPE, I2))
                #else undefined
             #fi
         ...
         </k>

    rule <k> ITYPE . rem_s I1 I2
          => #if I2 =/=Int 0
                #then < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) %Int #signed(ITYPE, I2))
                #else undefined
             #fi
         ...
         </k>
```

### Predicates

`eqz` checks wether its operand is 0.

```k
    syntax ITestOp ::= "eqz"
 // ------------------------
    rule <k> _ . eqz I => < i32 > #bool(I ==Int 0) ... </k>
```

The comparisons test for equality and different types of inequalities between numbers.

```k
    syntax IRelOp ::= "eq" | "ne"
 // -----------------------------
    rule <k> _ . eq I1 I2 => < i32 > #bool(I1 ==Int   I2) ... </k>
    rule <k> _ . ne I1 I2 => < i32 > #bool(I1 =/=Int  I2) ... </k>

    syntax IRelOp ::= "lt_u" | "gt_u" | "lt_s" | "gt_s"
 // ---------------------------------------------------
    rule <k> _     . lt_u I1 I2 => < i32 > #bool(I1 <Int I2) ... </k>
    rule <k> _     . gt_u I1 I2 => < i32 > #bool(I1 >Int I2) ... </k>

    rule <k> ITYPE . lt_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) <Int #signed(ITYPE, I2)) ... </k>
    rule <k> ITYPE . gt_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) >Int #signed(ITYPE, I2)) ... </k>

    syntax IRelOp ::= "le_u" | "ge_u" | "le_s" | "ge_s"
 // ---------------------------------------------------
    rule <k> _     . le_u I1 I2 => < i32 > #bool(I1 <=Int I2) ... </k>
    rule <k> _     . ge_u I1 I2 => < i32 > #bool(I1 >=Int I2) ... </k>

    rule <k> ITYPE . le_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) <=Int #signed(ITYPE, I2)) ... </k>
    rule <k> ITYPE . ge_s I1 I2 => < i32 > #bool(#signed(ITYPE, I1) >=Int #signed(ITYPE, I2)) ... </k>
```

Bitwise Operations
------------------

Of the bitwise operators, `and` will not overflow, but `or` and `xor` could.
These simply are the lifted K operators.

```k
    syntax IBinOp ::= "and" | "or" | "xor"
 // --------------------------------------
    rule <k> ITYPE . and I1 I2 =>       < ITYPE > I1 &Int   I2  ... </k>
    rule <k> ITYPE . or  I1 I2 => #chop(< ITYPE > I1 |Int   I2) ... </k>
    rule <k> ITYPE . xor I1 I2 => #chop(< ITYPE > I1 xorInt I2) ... </k>
```

Similarly, K bitwise shift operators are lifted for `shl` and `shr_u`.
Careful attention is made for the signed version `shr_s`.

```k
    syntax IBinOp ::= "shl" | "shr_u" | "shr_s"
 // -------------------------------------------
    rule <k> ITYPE . shl   I1 I2 => #chop(< ITYPE > I1 <<Int (I2 %Int #width(ITYPE))) ... </k>
    rule <k> ITYPE . shr_u I1 I2 =>       < ITYPE > I1 >>Int (I2 %Int #width(ITYPE))  ... </k>

    rule <k> ITYPE . shr_s I1 I2 => < ITYPE > #unsigned(ITYPE, #signed(ITYPE, I1) >>Int (I2 %Int #width(ITYPE))) ... </k>
```

The rotation operators `rotl` and `rotr` do not have appropriate K builtins, and so are built with a series of shifts.

```k
    syntax IBinOp ::= "rotl" | "rotr"
 // ---------------------------------
    rule <k> ITYPE . rotl I1 I2 => #chop(< ITYPE > (I1 <<Int (I2 %Int #width(ITYPE))) +Int (I1 >>Int (#width(ITYPE) -Int (I2 %Int #width(ITYPE))))) ... </k>
    rule <k> ITYPE . rotr I1 I2 => #chop(< ITYPE > (I1 >>Int (I2 %Int #width(ITYPE))) +Int (I1 <<Int (#width(ITYPE) -Int (I2 %Int #width(ITYPE))))) ... </k>
```

The bit counting operators also lack appropriate K builtins, and are implemented by using width-agnostic helper functions.

`clz` counts the number of leading zero-bits, with 0 having all leading zero-bits.
`ctz` counts the number of trailing zero-bits, with 0 having all trailing zero-bits.
`popcnt` counts the number of non-zero bits.

Note: The actual `ctz` operator considers the integer 0 to have *all* zero-bits, whereas the `#ctz` helper function considers it to have *no* zero-bits, in order for it to be width-agnostic.

```k
    syntax IUnOp ::= "clz" | "ctz" | "popcnt"
 // -----------------------------------------
    rule <k> ITYPE . clz    I1 => < ITYPE > #width(ITYPE) -Int #minWidth(I1)                      ... </k>
    rule <k> ITYPE . ctz    I1 => < ITYPE > #if I1 ==Int 0 #then #width(ITYPE) #else #ctz(I1) #fi ... </k>
    rule <k> ITYPE . popcnt I1 => < ITYPE > #popcnt(I1)                                           ... </k>

    syntax Int ::= #minWidth ( Int ) [function]
                 | #ctz      ( Int ) [function]
                 | #popcnt   ( Int ) [function]
 // -------------------------------------------
    rule #minWidth(0) => 0
    rule #minWidth(N) => 1 +Int #minWidth(N >>Int 1)                                 requires N =/=Int 0

    rule #ctz(0) => 0
    rule #ctz(N) => #if N modInt 2 ==Int 1 #then 0 #else 1 +Int #ctz(N >>Int 1) #fi  requires N =/=Int 0

    rule #popcnt(0) => 0
    rule #popcnt(N) => #bool(N modInt 2 ==Int 1) +Int #popcnt(N >>Int 1)             requires N =/=Int 0
```

Conversions
-----------

Wrapping cuts of the 32 most significant bits of an `i64` value.

```k
    syntax ConvOp ::= "wrap_i64"
 // ----------------------------
    rule <k> i32 . wrap_i64 I => #chop(< i32 > I) ... </k>

    rule #convSourceType(wrap_i64) => i64
```

Extension turns an `i32` type value into the corresponding `i64` type value.

```k
    syntax ConvOp ::= "extend_i32_u" | "extend_i32_s"
 // -------------------------------------------------
    rule <k> i64 . extend_i32_u I => < i64 > I                               ... </k>
    rule <k> i64 . extend_i32_s I => < i64 > #unsigned(i64, #signed(i32, I)) ... </k>

    rule #convSourceType(extend_i32_u) => i32
    rule #convSourceType(extend_i32_s) => i32
```

Stack Operations
----------------

Operator `drop` removes a single item from the `<stack>`.
The `select` operator picks one of the second or third stack values based on the first.

```k
    syntax Instr ::= "(" "drop" Instr ")"
                   | "(" "drop"       ")"
 // -------------------------------------
    rule <k> ( drop I ) => I ~> ( drop ) ... </k>

    rule <k> ( drop ) => . ... </k>
         <stack> _ : STACK => STACK </stack>

    syntax Instr ::= "(" "select" Instr Instr Instr ")"
                   | "(" "select"                   ")"
 // ---------------------------------------------------
    rule <k> ( select B1 B2 C ) => B1 ~> B2 ~> C ~> ( select ) ... </k>

    rule <k> ( select ) => . ... </k>
         <stack> < i32 > C : < TYPE > V2:Number : < TYPE > V1:Number : STACK
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

`unreachable` causes an immediate `trap`.

```k
    syntax Instr ::= "(" "unreachable" ")"
 // --------------------------------------
    rule <k> ( unreachable ) => trap ... </k>
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

    syntax Instr ::= "(" "block" FuncDecls Instrs ")"
                   | "block" VecType Instrs "end"
 // ---------------------------------------------
    rule <k> ( block FDECLS:FuncDecls INSTRS:Instrs )
          => block gatherTypes(result, FDECLS) INSTRS end
         ...
         </k>

    rule <k> block VTYPE IS end => IS ~> label VTYPE { .Instrs } STACK ... </k>
         <stack> STACK => .Stack </stack>
```

The `br*` instructions search through the instruction stack (the `<k>` cell) for the correct label index.
Upon reaching it, the label itself is executed.

Note that, unlike in the WebAssembly specification document, we do not need the special "context" operator here because the value and instruction stacks are separate.

```k
    syntax Instr ::= "(" "br" Int ")"
 // ---------------------------------
    rule <k> ( br N ) ~> (IS:Instrs => .) ... </k>
    rule <k> ( br N ) ~> L:Label => #if N ==Int 0 #then L #else ( br N -Int 1 ) #fi ... </k>

    syntax Instr ::= "(" "br_if" Int ")"
 // ------------------------------------
    rule <k> ( br_if N ) => #if VAL =/=Int 0 #then ( br N ) #else .K #fi ... </k>
         <stack> < TYPE > VAL : STACK => STACK </stack>
```

Finally, we have the conditional and loop instructions.

```k
    syntax Instr ::= "(" "if" VecType Instrs "else" Instrs "end" ")"
                   | "(" "if" VecType Instrs "(" "then" Instrs ")" ")"
                   | "(" "if" VecType Instrs "(" "then" Instrs ")" "(" "else" Instrs ")" ")"
 // ----------------------------------------------------------------------------------------
    rule <k> ( if VTYPE C:Instrs ( then IS ) )              => C ~> ( if VTYPE IS else .Instrs end ) ... </k>
    rule <k> ( if VTYPE C:Instrs ( then IS ) ( else IS' ) ) => C ~> ( if VTYPE IS else IS'     end ) ... </k>

    rule <k> ( if VTYPE IS else IS' end )
          => #if VAL =/=Int 0 #then IS #else IS' #fi
          ~> label VTYPE { .Instrs } STACK
         ...
         </k>
         <stack> < i32 > VAL : STACK => .Stack </stack>

    syntax Instr ::= "loop" VecType Instrs "end"
                   | "(" "loop" VecType Instrs ")"
 // ----------------------------------------------
    rule <k> ( loop FDECLS IS ) => loop FDECLS IS end ... </k>

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
    syntax Instr ::= "(" "local.get" Int ")"
                   | "(" "local.set" Int ")"
                   | "(" "local.tee" Int ")"
 // ----------------------------------------
    rule <k> ( local.get INDEX ) => . ... </k>
         <stack> STACK => VALUE : STACK </stack>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> ( local.set INDEX ) => . ... </k>
         <stack> VALUE : STACK => STACK </stack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>

    rule <k> ( local.tee INDEX ) => . ... </k>
         <stack> VALUE : STACK </stack>
         <locals> ... INDEX |-> (_ => VALUE) ... </locals>
```

### Globals

```k
    syntax Instr ::= "init_global" Int Val
                   | "(" "global.get" Int ")"
                   | "(" "global.set" Int ")"
 // -----------------------------------------
    rule <k> init_global INDEX VALUE => . ... </k>
         <globals> GLOBALS => GLOBALS [ INDEX <- VALUE ] </globals>

    rule <k> ( global.get INDEX ) => . ... </k>
         <stack> STACK => VALUE : STACK </stack>
         <globals> ... INDEX |-> VALUE ... </globals>

    rule <k> ( global.set INDEX ) => . ... </k>
         <stack> VALUE : STACK => STACK </stack>
         <globals> ... INDEX |-> (_ => VALUE) ... </globals>
```

Function Declaration and Invocation
-----------------------------------

### Function Declaration

Function declarations can look quite different depending on which fields are ommitted and what the context is.
Here, we allow for an "abstract" function declaration using syntax `func_::___`, and a more concrete one which allows arbitrary order of declaration of parameters, locals, and results.

```k
    syntax FunctionName ::= ".FunctionName" | Int | Identifier
 // ----------------------------------------------------------

    syntax TypeKeyWord ::= "param" | "result" | "local"
 // ---------------------------------------------------

    syntax FuncDecl  ::= "(" FuncDecl ")"     [bracket]
                       | TypeKeyWord ValTypes
                       | "export" FunctionName
    syntax FuncDecls ::= List{FuncDecl, ""} [klabel(listFuncDecl)]
 // --------------------------------------------------------------

    syntax Instr ::= "(" "func"              FuncDecls Instrs ")"
                   | "(" "func" FunctionName FuncDecls Instrs ")"
                   | "func" FunctionName "::" FuncType VecType "{" Instrs "}"
 // -------------------------------------------------------------------------
    rule <k> ( func FDECLS INSTRS )
          => func gatherExportedName(FDECLS) :: gatherFuncType(FDECLS) gatherTypes(local, FDECLS) { INSTRS }
         ...
         </k>

    rule <k> ( func FNAME FDECLS INSTRS )
          => func FNAME :: gatherFuncType(FDECLS) gatherTypes(local, FDECLS) { INSTRS }
         ...
         </k>

    rule <k> func FNAME :: FTYPE LTYPE { INSTRS } => . ... </k>
         <funcs>
           ( .Bag
          => <funcDef>
               <fname>  FNAME  </fname>
               <fcode>  INSTRS </fcode>
               <ftype>  FTYPE  </ftype>
               <flocal> LTYPE  </flocal>
               ...
             </funcDef>
           )
           ...
         </funcs>

    syntax FunctionName ::= gatherExportedName ( FuncDecls ) [function]
 // -------------------------------------------------------------------
    rule gatherExportedName(export FNAME   FDECLS:FuncDecls) => FNAME
    rule gatherExportedName(FDECL:FuncDecl FDECLS:FuncDecls) => gatherExportedName(FDECLS) [owise]

    syntax FuncType ::= gatherFuncType ( FuncDecls ) [function]
 // -----------------------------------------------------------
    rule gatherFuncType(FDECLS) => gatherTypes(param, FDECLS) -> gatherTypes(result, FDECLS)

    syntax VecType ::=  gatherTypes ( TypeKeyWord , FuncDecls )            [function]
                     | #gatherTypes ( TypeKeyWord , FuncDecls , ValTypes ) [function]
 // ---------------------------------------------------------------------------------
    rule gatherTypes(TKW, FDECLS) => #gatherTypes(TKW, FDECLS, .ValTypes)

    rule #gatherTypes(TKW , .FuncDecls            , TYPES) => [ TYPES ]
    rule #gatherTypes(TKW , FDECL:FuncDecl FDECLS , TYPES) => #gatherTypes(TKW, FDECLS, TYPES) [owise]

    rule #gatherTypes(TKW , TKW VTYPES' FDECLS:FuncDecls , VTYPES)
      => #gatherTypes(TKW ,             FDECLS           , VTYPES + VTYPES')
```

### Function Invocation/Return

Frames are used to store function return points.
Similar to labels, they sit on the instruction stack (the `<k>` cell), and `return` consumes things following it until hitting it.
Unlike labels, only one frame can be "broken" through at a time.

```k
    syntax Frame ::= "frame" ValTypes Stack Map
 // -------------------------------------------
    rule <k> frame TRANGE STACK' LOCAL' => . ... </k>
         <stack> STACK => #take(TRANGE, STACK) ++ STACK' </stack>
         <locals> _ => LOCAL' </locals>

    syntax Instr ::= "invoke" FunctionName
 // --------------------------------------
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
           <fcode>  INSTRS                    </fcode>
           <ftype>  [ TDOMAIN ] -> [ TRANGE ] </ftype>
           <flocal> [ TLOCALS ]               </flocal>
           <faddrs> ADDRS                     </faddrs>
           ...
         </funcDef>

    syntax Instr ::= "return"
 // -------------------------
    rule <k> return ~> (IS:Instrs => .)  ... </k>
    rule <k> return ~> (L:Label   => .)  ... </k>
    rule <k> (return => .) ~> FR:Frame ... </k>
```

Memory
------

When memory is allocated, it is put into the store at the next available index.
Memory can only grow in size, so the minimum size is the initial value.

```k
    syntax Instr ::= "(" "memory"               ")"
                   | "(" "memory" Int           ")" // Max only
                   | "(" "memory" Int Int       ")" // Min and max.
                   |     "memory" "{" Int MemBound "}"
 // --------------------------------------------------
    rule <k> ( memory                 ) => memory { 0   .MemBound } ... </k>
    rule <k> ( memory         MAX:Int ) => memory { 0   MAX       } ... </k>
    rule <k> ( memory MIN:Int MAX:Int ) => memory { MIN MAX       } ... </k>

    rule <k> memory { _ _ } => trap ... </k>
         <memAddrs> MAP </memAddrs> requires MAP =/=K .Map

    rule <k> memory { MIN MAX } => . ... </k>
         <memAddrs>    .Map => (0 |-> NEXT)  </memAddrs>
         <nextMemAddr> NEXT => NEXT +Int 1 </nextMemAddr>
         <mems>
           ( .Bag
          => <memInst>
               <memAddr> NEXT </memAddr>
               <mmax>    MAX  </mmax>
               <msize>   MIN  </msize>
             </memInst>
           )
           ...
         </mems>
```
TODO: There are many more valid ways to instantiate memory. Allow specifying just max or neither min or max, folded syntax, identifier, inline instantiation, and inline export and import.

The `size` operation returns the size of the memory, measured in pages.

```k
    syntax Instr ::= "(" "memory.size" ")"
 // --------------------------------------
    rule <k> ( memory.size ) => < i32 > SIZE ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR </memAddr>
           <msize>   SIZE </msize>
           ...
         </memInst>
```

`grow` increases the size of memory in units of pages.
Failure to grow is indicated by pushing -1 to the stack.
Success is indicated by pushing the previous memory size to the stack.
`grow` is non-deterministic and may fail either due to trying to exceed explicit max values, or because the embedder does not have resources available.
By setting the `<deterministicMemoryGrowth>` field in the configuration to `true`, the sematnics ensure memory growth only fails if the memory in question would exceed max bounds.

```k
    syntax Instr ::= "(" "memory.grow" ")" | "(" "memory.grow" Instr ")" | "grow" Int
 // ---------------------------------------------------------------------------------
    rule <k> ( memory.grow I:Instr ) => I ~> ( memory.grow ) ... </k>
    rule <k> ( memory.grow ) => grow N ... </k>
         <stack> < i32 > N : STACK => STACK </stack>

    rule <k> grow N => < i32 > #if #growthAllowed(SIZE +Int N, MAX) #then SIZE #else -1 #fi ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <memInst>
           <memAddr> ADDR  </memAddr>
           <mmax>    MAX  </mmax>
           <msize>   SIZE => #if #growthAllowed(SIZE +Int N, MAX) #then SIZE +Int N #else SIZE #fi </msize>
           ...
         </memInst>

        rule <k> grow N => < i32 > -1 </k>
             <deterministicMemoryGrowth> false </deterministicMemoryGrowth>

    syntax Bool ::= #growthAllowed(Int, MemBound) [function]
 // --------------------------------------------------------
    rule #growthAllowed(SIZE, .MemBound) => SIZE <=Int #maxMemorySize()
    rule #growthAllowed(SIZE, I:Int)     => #growthAllowed(SIZE, .MemBound) andBool SIZE <=Int I

```

Memories can optionally have a max size which the memory may not grow beyond.

```k
    syntax MemBound ::= Int | ".MemBound"
```

However, the absolute max allowed size if 2^16 pages.
Incidentally, the page size is 2^16 bytes.

```k
    syntax Int ::= #pageSize()      [function]
    syntax Int ::= #maxMemorySize() [function]
 // ------------------------------------------
    rule #maxMemorySize() => 65536
    rule #pageSize()      => 65536
```

Module Declaration
------------------

Currently, we support a single module.
The surronding `module` tag is discarded, and the inner portions are run like they are instructions.

```k
    syntax Instr ::= "(" "module" Instrs ")"
 // ----------------------------------------
    rule <k> ( module INSTRS ) => INSTRS ... </k>
```

```k
endmodule
```
