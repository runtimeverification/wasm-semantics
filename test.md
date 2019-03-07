KWasm Testing
=============

For testing, we augment the semantics with some helpers.

```k
require "wasm.k"

module WASM-TEST
    imports WASM
    imports BYTES
```

Assertions
----------

These assertions will check the supplied property, and then clear that state from the configuration.
In this way, tests can be written as a serious of setup, execute, assert cycles which leaves the configuration empty on success.

We'll make `Assertion` a subsort of `Instr`, so that we can easily consume `Instr` with `trap`s, but not consume `Assertion`s.
This will allow `trap` to "bubble up" (more correctly, to "consume the continuation") until it reaches its paired `#assertTrap_` statement.

```k
    syntax Instr ::= Assertion
 // --------------------------
    rule <k> trap ~> (L:Label => .) ... </k>
    rule <k> trap ~> (.Instrs => .) ... </k>
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
    syntax Assertion ::= "#assertTopStack"        StackItem String
                       | "#assertTopStackExactly" StackItem String
                       | "#assertStack"           Stack     String
 // --------------------------------------------------------------
    rule <k> #assertTopStack S                      _ => . ... </k> <stack> S              : STACK => STACK </stack>
    rule <k> #assertTopStack < ITYPE:IValType > VAL _ => . ... </k> <stack> < ITYPE > VAL' : STACK => STACK </stack>
      requires #unsigned(ITYPE, VAL) ==Int VAL'

    rule <k> #assertTopStackExactly < ITYPE:IValType > VAL _ => . ... </k> <stack> < ITYPE > VAL : STACK => STACK </stack>

    rule <k> #assertStack .Stack      _   => .                                               ... </k>
    rule <k> #assertStack (S : STACK) STR => #assertTopStack S STR ~> #assertStack STACK STR ... </k>
```

### Variables Assertions

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
```

### Memory Assertions

This checks that the last allocated memory has the given size and max value.

```k
    syntax Assertion ::= "#assertMemory"    Int MemBound String
                       | "#assertMemoryAux" Int Int MemBound String
 // ---------------------------------------------------------------
    rule <k> #assertMemory SIZE MAX MSG => #assertMemoryAux (NEXT -Int 1) SIZE MAX MSG ... </k>
         <nextMemAddr> NEXT </nextMemAddr>

    rule <k> #assertMemoryAux ADDR SIZE MAX _ => .  ... </k>
         <memAddrs> (0 |-> ADDR) => .Map </memAddrs>
         <nextMemAddr> NEXT => NEXT -Int 1 </nextMemAddr>
         <mems>
           ( <memInst>
               <memAddr> ADDR  </memAddr>
               <mmax>    MAX   </mmax>
               <msize>   SIZE  </msize>
               ...
             </memInst>
          => .Bag
           )
           ...
         </mems>

    syntax Assertion ::= "#assertMemoryData"    "(" Int "," Int ")" String
 // ----------------------------------------------------------
    rule <k> #assertMemoryData (KEY , VAL) MSG => . ... </k>
         <memAddrs> 0 |-> ADDR </memAddrs>
         <mems>
           <memInst>
             <memAddr> ADDR </memAddr>
             <mdata> ...  KEY |-> BYTE => .Map ... </mdata>
               ...
           </memInst>
           ...
         </mems>
       requires Bytes2Int(BYTE, LE, Unsigned) ==Int VAL
```

```k
endmodule
```
