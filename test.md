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

### Trap Assertion

This asserts that a `trap` was just thrown.

```k
    syntax Instr ::= "#assertTrap" String
 // -------------------------------------
    rule <k> trap ~> #assertTrap _ => . ... </k>
```

### Stack Assertions

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

### Memory Assertions

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

### Function Assertions

This simply checks that the given function exists in the `<funcs>` cell.

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
endmodule
```
