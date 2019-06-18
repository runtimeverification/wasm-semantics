KWasm Testing
=============

For testing, we augment the semantics with some helpers.

```k
require "wasm.k"

module WASM-TEST
    imports WASM
```

Auxiliary
---------

Here we extend the sort `Stmt` by adding a new subsort called `Auxil`.
This subsort contains Auxiliary functions that only used in our KWASM semantics but not in the official specification including assertions, initializing a global variable and the invocation of a function by exported name.

```k
    syntax Stmt ::= Auxil
```

Assertions
----------

These assertions will check the supplied property, and then clear that state from the configuration.
In this way, tests can be written as a serious of setup, execute, assert cycles which leaves the configuration empty on success.

We'll make `Assertion` a subsort of `Auxil`, so that we can easily consume `Instr` with `trap`s, but not consume `Assertion`s.
This will allow `trap` to "bubble up" (more correctly, to "consume the continuation") until it reaches its paired `#assertTrap_` statement.

```k
    syntax Auxil ::= Assertion
 // --------------------------
    rule <k> trap ~> (L:Label => .) ... </k>
    rule <k> trap ~> (F:Frame => .) ... </k>
    rule <k> trap ~> (.Instrs => .) ... </k>
    rule <k> trap ~> (I:Instr => .) ... </k>

    rule <k> trap ~> (S:Stmt SS:Stmts => S ~> SS) ... </k>
```

### Trap Assertion

This asserts that a `trap` was just thrown.

```k
    syntax Assertion ::= "#assertTrap" String
 // -----------------------------------------
    rule <k> trap ~> #assertTrap _ => . ... </k>
```

### ValStack Assertions

These functions make assertions about the state of the `<valstack>` cell.

```k
    syntax Assertion ::= "#assertTopStack"        Val      String
                       | "#assertTopStackExactly" Val      String
                       | "#assertStack"           ValStack String
 // -------------------------------------------------------------
    rule <k> #assertTopStack S                      _ => . ... </k> <valstack> S              : VALSTACK => VALSTACK </valstack>
    rule <k> #assertTopStack < ITYPE:IValType > VAL _ => . ... </k> <valstack> < ITYPE > VAL' : VALSTACK => VALSTACK </valstack>
      requires #unsigned(ITYPE, VAL) ==Int VAL'

    rule <k> #assertTopStackExactly < ITYPE:IValType > VAL _ => . ... </k> <valstack> < ITYPE > VAL : VALSTACK => VALSTACK </valstack>

    rule <k> #assertStack .ValStack      _   => .                                               ... </k>
    rule <k> #assertStack (S : VALSTACK) STR => #assertTopStack S STR ~> #assertStack VALSTACK STR ... </k>
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
         <globalIndices> ... INDEX |-> GADDR ... </globalIndices>
         <globals>
           ( <globalInst>
               <gAddr>  GADDR </gAddr>
               <gValue> VALUE </gValue>
               ...
             </globalInst>
          => .Bag
           )
           ...
         </globals>
```

`init_global` is a helper function that helps us to declare a new global variable.

```k
    syntax Auxil ::= "init_global" Int Int
 // --------------------------------------
    rule <k> init_global INDEX GADDR => . ... </k>
         <globalIndices> GADDRS => GADDRS [ INDEX <- GADDR ] </globalIndices>
         <globals>
           ( .Bag =>
             <globalInst>
               <gAddr> GADDR </gAddr>
               ...
             </globalInst>
           )
           ...
         </globals>
```

### Type Assertions

`#assertType` checks whether a type is allocated to the correct index.
`#assertNextTypeIdx` checks whether the number of types are allocated correctly.

```k
    syntax Assertion ::= "#assertType" TextFormatIdx FuncType
                       | "#assertNextTypeIdx" Int
 // ---------------------------------------------
    rule <k> #assertType TFIDX FTYPE => . ... </k>
         <typeIds> IDS </typeIds>
         <types> ... #ContextLookup(IDS , TFIDX) |-> FTYPE ... </types>
    rule <k> #assertNextTypeIdx IDX => . ... </k>
         <nextTypeIdx> IDX </nextTypeIdx>
```

### Function Assertions

This simply checks that the given function exists in the `<funcs>` cell and has the given signature and local types.

```k
    syntax Assertion ::= "#assertFunction" TextFormatIdx FuncType VecType String
 // ----------------------------------------------------------------------------
    rule <k> #assertFunction TFIDX FTYPE LTYPE _ => . ... </k>
         <funcIds> IDS </funcIds>
         <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
         <nextFuncAddr> NEXT => NEXT -Int 1 </nextFuncAddr>
         <funcs>
           ( <funcDef>
               <fAddr>  FADDR </fAddr>
               <fType>  FTYPE </fType>
               <fLocal> LTYPE </fLocal>
               ...
             </funcDef>
          => .Bag
           )
           ...
         </funcs>
```

### Table Assertions

This asserts related operation about tables.

```k
    syntax Assertion ::= "#assertEmptyTable"    Int MaxBound String
                       | "#assertEmptyTableAux" Int Int MaxBound String
 // -------------------------------------------------------------------
    rule <k> #assertEmptyTable SIZE MAX MSG => #assertEmptyTableAux (NEXT -Int 1) SIZE MAX MSG ... </k>
         <nextTabAddr> NEXT </nextTabAddr>

    rule <k> #assertEmptyTableAux ADDR SIZE MAX _ => .  ... </k>
         <tabIndices> ( 0 |-> ADDR ) => .Map </tabIndices>
         <nextTabAddr> NEXT => NEXT -Int 1 </nextTabAddr>
         <tabs>
           ( <tabInst>
               <tAddr>   ADDR  </tAddr>
               <tmax>    MAX   </tmax>
               <tsize>   SIZE  </tsize>
               <tdata>   .Map  </tdata>
               ...
             </tabInst>
          => .Bag
           )
           ...
         </tabs>
```

### Memory Assertions

This checks that the last allocated memory has the given size and max value.

```k
    syntax Assertion ::= "#assertEmptyMemory"    Int MaxBound String
                       | "#assertEmptyMemoryAux" Int Int MaxBound String
 // --------------------------------------------------------------------
    rule <k> #assertEmptyMemory SIZE MAX MSG => #assertEmptyMemoryAux (NEXT -Int 1) SIZE MAX MSG ... </k>
         <nextMemAddr> NEXT </nextMemAddr>

    rule <k> #assertEmptyMemoryAux ADDR SIZE MAX _ => .  ... </k>
         <memIndices> ( 0 |-> ADDR ) => .Map </memIndices>
         <nextMemAddr> NEXT => NEXT -Int 1 </nextMemAddr>
         <mems>
           ( <memInst>
               <mAddr>   ADDR  </mAddr>
               <mmax>    MAX   </mmax>
               <msize>   SIZE  </msize>
               <mdata>   .Map  </mdata>
               ...
             </memInst>
          => .Bag
           )
           ...
         </mems>

    syntax Assertion ::= "#assertMemoryData" "(" Int "," Int ")" String
 // -------------------------------------------------------------------
    rule <k> #assertMemoryData (KEY , VAL) MSG => . ... </k>
         <memIndices> 0 |-> ADDR </memIndices>
         <mems>
           <memInst>
             <mAddr> ADDR </mAddr>
             <mdata> ...  KEY |-> VAL => .Map ... </mdata>
               ...
           </memInst>
           ...
         </mems>
```

Clear Module Instances
----------------------

The modules are cleaned all together after the test file is executed.

```k
    syntax Auxil ::= "#clearModules"
 // --------------------------------
    rule <k> #clearModules => . ... </k>
         <nextFreshId> _ => 0 </nextFreshId>
         <moduleInst>
           <typeIds> _ => .Map </typeIds>
           <funcIds> _ => .Map </funcIds>
           <nextTypeIdx>   _ => 0 </nextTypeIdx>
           <nextFuncIdx>   _ => 0 </nextFuncIdx>
           <nextGlobalIdx> _ => 0 </nextGlobalIdx>
           <types>         _ => .Map </types>
           <funcIndices>   _ => .Map </funcIndices>
           <tabIndices>    _ => .Map </tabIndices>
           <memIndices>    _ => .Map </memIndices>
           <globalIndices> _ => .Map </globalIndices>
           <exports>       _ => .Map </exports>
         </moduleInst>
```

Function Invocation
-------------------

We allow to `invoke` a function by its exported name in the test code.

```k
    syntax Auxil ::= "(" "invoke" String ")"
 // ----------------------------------------
    rule <k> ( invoke ENAME:String ) => ( call TFIDX ) ... </k>
         <exports> ... ENAME |-> TFIDX ... </exports>
```

```k
endmodule
```
