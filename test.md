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
 // ---------------------
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

We'll make `Assertion` a subsort of `Auxil`, since it is a form of top-level embedder instrucion.

```k
    syntax Auxil ::= Assertion
 // --------------------------
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
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> #assertGlobal INDEX VALUE _ => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globalIndices> ... INDEX |-> GADDR ... </globalIndices>
           ...
         </moduleInst>
         <globals>
           <globalInst>
             <gAddr>  GADDR </gAddr>
             <gValue> VALUE </gValue>
             ...
           </globalInst>
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
           ( .Bag
          => <globalInst>
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
         <nextFuncAddr> NEXT </nextFuncAddr>
         <funcs>
           <funcDef>
             <fAddr>  FADDR </fAddr>
             <fType>  FTYPE </fType>
             <fLocal> LTYPE </fLocal>
             ...
           </funcDef>
           ...
         </funcs>
```

### Table Assertions

This asserts related operation about tables.

```k
    syntax Assertion ::= "#assertTable" Int MaxBound String
 // -------------------------------------------------------
    rule <k> #assertTable SIZE MAX MSG => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIndices> 0 |-> ADDR </tabIndices>
           ...
         </moduleInst>
         <tabs>
           <tabInst>
             <tAddr> ADDR </tAddr>
             <tmax>  MAX  </tmax>
             <tsize> SIZE </tsize>
             ...
           </tabInst>
           ...
         </tabs>

    syntax Assertion ::= "#assertTableElem" "(" Int "," TextFormatIdx ")" String
 // ----------------------------------------------------------------------------
    rule <k> #assertTableElem (KEY , VAL) MSG => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIndices> 0 |-> ADDR </tabIndices>
           ...
         </moduleInst>
         <tabs>
           <tabInst>
             <tAddr> ADDR </tAddr>
             <tdata> ...  KEY |-> VAL ... </tdata>
               ...
           </tabInst>
           ...
         </tabs>
```

### Memory Assertions

This checks that the last allocated memory has the given size and max value.

```k
    syntax Assertion ::= "#assertMemory" Int MaxBound String
 // --------------------------------------------------------
    rule <k> #assertMemory SIZE MAX MSG => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIndices> 0 |-> ADDR </memIndices>
           ...
         </moduleInst>
         <mems>
           <memInst>
             <mAddr>   ADDR  </mAddr>
             <mmax>    MAX   </mmax>
             <msize>   SIZE  </msize>
             ...
           </memInst>
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
             <mdata> ... KEY |-> VAL ... </mdata>
             ...
           </memInst>
           ...
         </mems>
```

### Module Assertions

These assertions test (and delete) module instances.
These assertions act on the last module defined.

```k
    syntax Assertion ::= "#assertNamedModule" Identifier String
 // -----------------------------------------------------------
    rule <k> #assertNamedModule NAME S => . ... </k>
         <moduleIds> ... NAME |-> IDX ... </moduleIds>
         <moduleInstances>
           <moduleInst>
             <modIdx> IDX </modIdx>
             ...
           </moduleInst>
           ...
         </moduleInstances>
```

The modules are cleaned all together after the test file is executed.

```k
    syntax Auxil ::= "#clearConfig"
 // -------------------------------
    rule <k>    #clearConfig => . ...     </k>
         <curModIdx>       _ => 0         </curModIdx>
         <valstack>        _ => .ValStack </valstack>
         <locals>          _ => .Map      </locals>
         <nextFreshId>     _ => 0         </nextFreshId>
         <moduleInstances> _ => .Bag      </moduleInstances>
         <moduleIds>       _ => .Map      </moduleIds>
         <nextModuleIdx>   _ => 0         </nextModuleIdx>
         <moduleRegistry>  _ => .Map      </moduleRegistry>
         <mainStore>
           <nextFuncAddr>  _ => 0         </nextFuncAddr>
           <funcs>         _ => .Bag      </funcs>
           <nextTabAddr>   _ => 0         </nextTabAddr>
           <tabs>          _ => .Bag      </tabs>
           <nextMemAddr>   _ => 0         </nextMemAddr>
           <mems>          _ => .Bag      </mems>
           <globals>       _ => .Bag      </globals>
         </mainStore>
```

Registry Assertations
---------------------

We also want to be able to test that the embedder's registration function is working.

```k
    syntax Assertion ::= "#assertRegistrationUnnamed" String            String
                       | "#assertRegistrationNamed"   String Identifier String
 // --------------------------------------------------------------------------
    rule <k> #assertRegistrationUnnamed REGNAME _ => . ... </k>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX ...  </moduleRegistry>

    rule <k> #assertRegistrationNamed REGNAME NAME _ => . ... </k>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX ...  </moduleRegistry>
```

```k
endmodule
```
