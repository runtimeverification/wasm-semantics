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

Reference Interpreter Commands
------------------------------

TODO: Move this to a separate `EMBEDDER` module?

The official test suite contains some special auxillary instructions outside of the standard Wasm semantics.
The reference interpreter is a particular embedder with auxillary instructions, specified in [spec interpreter](https://github.com/WebAssembly/spec/blob/master/interpreter/README.md).

### Function Invocation

We allow to `invoke` a function by its exported name in the test code.

```k
    syntax Auxil ::= "(" "invoke" String ")"
 // ----------------------------------------
    rule <k> ( invoke ENAME:String ) => ( call TFIDX ) ... </k>
         <exports> ... ENAME |-> TFIDX ... </exports>
```

### Registering Modules

We will reference modules by name in imports.
`register` is the instruction that allows us to associate a name with a module.

```k
    syntax Auxil ::= "(" "register" String               ")"
                   | "(" "register" String TextFormatIdx ")"
 // --------------------------------------------------------
    rule <k> ( register S ) => ( register S (NEXT -Int 1) )... </k> // Register last instantiated module.
         <nextModuleIdx> NEXT </nextModuleIdx>
      requires NEXT >Int 0
    rule <k> ( register S ID:Identifier ) => ( register S IDX ) ... </k>
         <moduleIds> ... ID |-> IDX ... </moduleIds>
    rule <k> ( register S:String IDX:Int ) => . ... </k>
         <moduleRegistry> ... .Map => S |-> IDX ... </moduleRegistry>
```

Assertions for KWasm tests
--------------------------

These assertions will check the supplied property, and then clear that state from the configuration.
In this way, tests can be written as a serious of setup, execute, assert cycles which leaves the configuration empty on success.

We'll make `Assertion` a subsort of `Auxil`, so that we can easily consume `Instr` with `trap`s, but not consume `Assertion`s.
This will allow `trap` to "bubble up" (more correctly, to "consume the continuation") until it reaches its paired `#assertTrap_` statement.

```k
    syntax Auxil ::= Assertion
 // --------------------------
    rule <k> trap ~> (L:Label   => .) ... </k>
    rule <k> trap ~> (F:Frame   => .) ... </k>
    rule <k> trap ~> (I:Instr   => .) ... </k>
    rule <k> trap ~> (IS:Instrs => .) ... </k>

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
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globalIndices> ... INDEX |-> GADDR ... </globalIndices>
           ...
         </moduleInst>
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
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globalIndices> GADDRS => GADDRS [ INDEX <- GADDR ] </globalIndices>
           ...
         </moduleInst>
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
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> IDS </typeIds>
           <types> ... #ContextLookup(IDS , TFIDX) |-> FTYPE ... </types>
           ...
         </moduleInst>
    rule <k> #assertNextTypeIdx IDX => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <nextTypeIdx> IDX </nextTypeIdx>
           ...
         </moduleInst>
```

### Function Assertions

This simply checks that the given function exists in the `<funcs>` cell and has the given signature and local types.

```k
    syntax Assertion ::= "#assertFunction" TextFormatIdx FuncType VecType String
 // ----------------------------------------------------------------------------
    rule <k> #assertFunction TFIDX FTYPE LTYPE _ => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcIds> IDS </funcIds>
           <funcIndices> ... #ContextLookup(IDS , TFIDX) |-> FADDR ... </funcIndices>
           ...
         </moduleInst>
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
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIndices> ( 0 |-> ADDR ) => .Map </tabIndices>
           ...
         </moduleInst>
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
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> ( 0 |-> ADDR ) => .Map </memIndices>
           ...
         </moduleInst>
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
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> 0 |-> ADDR </memIndices>
           ...
         </moduleInst>
         <mems>
           <memInst>
             <mAddr> ADDR </mAddr>
             <mdata> ...  KEY |-> VAL => .Map ... </mdata>
               ...
           </memInst>
           ...
         </mems>
```

### Module Assertions

These assertions test (and delete) module instances.
These assertions act on the last module defined.

```k
    syntax Assertion ::= "#assertUnnamedModule"          String
    syntax Assertion ::= "#assertUnnamedModuleAux" Int   String
    syntax Assertion ::= "#assertNamedModule" Identifier String
 // -----------------------------------------------------------
    rule <k> #assertUnnamedModule S => #assertUnnamedModuleAux CUR S ... </k>
         <curModIdx> CUR => 0 </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           ...
         </moduleInst>
         <nextModuleIdx> NEXT => NEXT </nextModuleIdx>
    rule <k> #assertUnnamedModuleAux IDX _ => . ... </k>
         <moduleInstances>
           ( <moduleInst>
               <modIdx> IDX </modIdx>
               ...
             </moduleInst>
          => .Bag
           )
           ...
         </moduleInstances>
    rule <k> #assertNamedModule NAME S => #assertUnnamedModuleAux IDX S ... </k>
         <moduleIds> ... NAME |-> IDX => .Map ... </moduleIds>
```

The modules are cleaned all together after the test file is executed.

```k
    syntax Auxil ::= "#clearCurrentModule"
                   | "#setCurrentModule" Int
                   | "#clearFreshId"
                   | "#clearModuleIdx"
 // ----------------------------------
    rule <k> #clearCurrentModule => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
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
    rule <k> #setCurrentModule I => . ... </k>
         <curModIdx> _ => I </curModIdx>
    rule <k> #clearFreshId => . ... </k>
         <nextFreshId> _ => 0 </nextFreshId>
    rule <k> #clearModuleIdx => . ... </k>
         <nextModuleIdx> _ => 0 </nextModuleIdx>
```

Registry Assertations
---------------------

We also want to be able to test that the embedder's registration function is working.

```k
    syntax Assertion ::= "#assertRegistrationUnnamed" String            String
    syntax Assertion ::= "#assertRegistrationNamed"   String Identifier String
 // --------------------------------------------------------------------------
    rule <k> #assertRegistrationUnnamed REGNAME _ => . ... </k>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX => .Map ...  </moduleRegistry>
    rule <k> #assertRegistrationNamed REGNAME NAME _ => . ... </k>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX => .Map ...  </moduleRegistry>
```

```k
endmodule
```
