```k
// Copyright (c) 2015 K Team. All Rights Reserved.
require "domains.k"

module WASM-SYNTAX
    imports DOMAINS

    syntax IValType ::= "i32" | "i64"
    syntax FValType ::= "f32" | "f64"
    syntax  ValType ::= IValType | FValType

    syntax Type ::= ValType
 // -----------------------

    syntax Instr ::= "(" Instr ")" [bracket]
 // ----------------------------------------

    syntax Instrs ::= List{Instr, ""}
 // ---------------------------------
    rule I:Instr IS:Instrs => I ~> IS

    syntax Instr ::= IValType "." "const" Int
                   | FValType "." "const" Float
 // -------------------------------------------

    syntax Stack ::= ".Stack"
                   | StackItem ":" Stack
 // ------------------------------------

    syntax StackItem ::= Instr
 // --------------------------

    syntax InternalInstr ::= "#push" StackItem
    syntax         Instr ::= InternalInstr
 // --------------------------------------
endmodule
```

```
    syntax UnOp  ::= "neg" | "abs"
                   | "not" | "clz" | "ctz"                        // int
                   | "ceil" | "floor" | "trunc" | "round"         // float
    syntax BinOp ::= "add" | "sub" | "mul"
                   | "divs" | "divu" | "mods" | "modu"            // int
                   | "and" | "or" | "xor" | "shl" | "shr" | "sar" // int
                   | "div" | "mod" | "copysign"                   // float
    syntax RelOp ::= "eq" | "neq"
                   | "lts" | "ltu" | "les" | "leu"                // int
                   | "gts" | "gtu" | "ges" | "geu"                // int
                   | "lt" | "le" | "gt" | "ge"                    // float

 // rule (const.i32 I:Int) => I

 // rule (add.i32 I1:Int I2:Int) => I1 +Int I2
 // rule (sub.i32 I1:Int I2:Int) => I1 -Int I2
 // rule (mul.i32 I1:Int I2:Int) => I1 *Int I2

 // rule ( eq.i32 I1:Int I2:Int) => bool2int(I1 ==K I2) // ==Int ?
 // rule (neq.i32 I1:Int I2:Int) => bool2int(I1 =/=K I2) // =/=Int ?
endmodule
```

```
    syntax Script ::= Commands

    syntax Commands ::= List{Command, ""}
    syntax Command  ::= Module
                      | Invoke

    syntax Module ::= "(" "module" ModuleItems ")"
    syntax Invoke ::= "(" "invoke" Var Instr ")"

    syntax ModuleItems ::= List{ModuleItem, ""}
    syntax ModuleItem  ::= Function
                         | Global
                         | Export
                         | Table
                         | Memory

    syntax Function ::= "(" "func" Param Result Local Exps ")"
    syntax Param  ::= "(" "param" Types ")"
    syntax Result ::= "(" "result" Types ")"
    syntax Local  ::= "(" "local" Types ")"

    syntax Global ::= "(" "global" Types ")"
    syntax Export ::= "(" "export" Vars ")"
    syntax Table  ::= "(" "table" Vars ")"
    syntax Memory ::= "(" "memory" Int ")"

    syntax Exp  ::= "(" "nop" ")"
                  | "(" "block" Exps ")"                          [strict]
                  | "(" "if" Exp Exp Exp ")"                      [strict(1)]
                  | "(" "if" Exp Exp ")"
                  | "(" "loop" Exps ")"
                  | "(" "label" Exps ")"
                  | "(" "break" Var /* Exps */ ")"
                  | "(" "break" ")"
                  | "(" "switch" Exp Cases Exp ")"
                  | "(" "call" Var Exps ")"                       [strict(2)]
                  | "(" "dispatch" Var Exp Exps ")"
                  | "(" "return" Exps ")"                         [strict(1)]
                  | "(" "destruct" Vars Exp ")"                   [strict(2)]
                  | "(" "getlocal" Var ")"
                  | "(" "setlocal" Var Exp ")"                    [strict(2)]
                  | "(" "getglobal" Var ")"
                  | "(" "setglobal" Var Exp ")"                   [strict(2)]
                  | "(" "get" MemOp "." MemType Exp ")"           [strict(3)]
                  | "(" "set" MemOp "." MemType Exp Exp ")"       [strict(3,4)]
                  | "(" "const" "." Type Literal ")"
                  | "(" "convert" Sign "." Type "." Type Exp ")"
                  | "(" "convert"      "." Type "." Type Exp ")"
                  | "(" "cast"         "." Type "." Type Exp ")"
                  | "(" "print" Exp ")"                           [strict]

    syntax Cases ::= List{Case, ""}
    syntax Case  ::= "(" "case" Literal Exps "fallthru" ")"
                   | "(" "case" Literal Exps            ")"
                   | "(" "case" Literal                 ")"

    syntax Types ::= List{Type, ""}
    syntax MemType ::= Type | "i8" | "i16"

    syntax Vars ::= List{Var, ""}
    syntax Var  ::= Int

    syntax Literal ::= Int | Float

    syntax MemOp ::= Dist Align Sign
                   | Dist Align
                   | Dist       Sign
                   | Dist

    syntax Dist  ::= "near" | "far"
    syntax Align ::= "unaligned"
    syntax Sign  ::= "s" | "u"

    // macros for syntactic sugars
    rule (if E S) => (if E S (nop))                               [macro]
    rule (break) => (break 0)                                     [macro]

```
