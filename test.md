KWASM Testing
=============

For testing, we augment the semantics with some helpers.

```k
require "wasm.k"

module WASM-TEST
    imports WASM
```

Assertions
----------

These assertions will check the supplied property, and then clear that state from the configuration.
In this way, tests can be written as a serious of setup, execute, assert cycles which leaves the configuration empty on success.

We'll make `Assertion` a subsort of `Instr`, so that we can consume them with `trap` statements.

```k
    syntax Instr ::= Assertion
 // --------------------------
    rule <k> trap ~> (L:Label => .) ... </k>
    rule <k> trap ~> (I:Instr => .) ... </k> requires notBool isAssertion(I)

    rule <k> trap ~> (I:Instr IS:Instrs => I ~> IS) ... </k>
```

### Trap Assertion

This asserts that a `trap` was just thrown.

```k
    syntax Assertion ::= "#assertTrap" String
 // -----------------------------------------
    rule <k> trap ~> #assertTrap _ => . ... </k>
```

### Stack Assertions

These functions make assertions about the state of the `<stack>` cell.

```k
    syntax Assertion ::= "#assertTopStack" StackItem String
                       | "#assertStack"    Stack     String
 // -------------------------------------------------------
    rule <k> #assertTopStack S                      _ => . ... </k> <stack> S              : STACK => STACK </stack>
    rule <k> #assertTopStack < ITYPE:IValType > VAL _ => . ... </k> <stack> < ITYPE > VAL' : STACK => STACK </stack>
      requires #unsigned(ITYPE, VAL) ==Int VAL'

    rule <k> #assertStack .Stack      _   => .                                               ... </k>
    rule <k> #assertStack (S : STACK) STR => #assertTopStack S STR ~> #assertStack STACK STR ... </k>
```

### Memory Assertions

The operator `#assertLocal`/`#assertGlobal` operators perform a check for a local/global variable's value.

```k
    syntax Assertion ::= "#assertLocal"  Int Val String
                       | "#assertGlobal" Int Val String
 // ---------------------------------------------------
    rule <k> #assertLocal INDEX VALUE _ => . ... </k>
         <locals> ... (INDEX |-> VALUE => .Map) ... </locals>

    rule <k> #assertGlobal INDEX VALUE _ => . ... </k>
         <globals> ... (INDEX |-> VALUE => .Map) ... </globals>
```

### Function Assertions

This simply checks that the given function exists in the `<funcs>` cell and has the given signature and local types.

```k
    syntax Assertion ::= "#assertFunction" FunctionName FuncType VecType String
 // ---------------------------------------------------------------------------
    rule <k> #assertFunction FNAME FTYPE LTYPE _ => . ... </k>
         <funcs>
           ( <funcDef>
               <fname>  FNAME </fname>
               <ftype>  FTYPE </ftype>
               <flocal> LTYPE </flocal>
               ...
             </funcDef>
          => .Bag
           )
           ...
         </funcs>
endmodule
```
