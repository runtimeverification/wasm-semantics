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

We also add `token` as a value in order to implement some test assertions.

```k
    syntax Val ::= "token"
 // ----------------------
```

Reference Interpreter Commands
------------------------------

TODO: Move this to a separate `EMBEDDER` module?

The official test suite contains some special auxillary instructions outside of the standard Wasm semantics.
The reference interpreter is a particular embedder with auxillary instructions, specified in [spec interpreter](https://github.com/WebAssembly/spec/blob/master/interpreter/README.md).

### Actions

We allow 2 kinds of actions:

-   We allow to `invoke` a function by its exported name.
-   We allow to `get` a global export.

**TODO**: implement "get".

```k
    syntax Auxil  ::= Action
    syntax Action ::= "(" "invoke"         String        ")"
                    | "(" "invoke"         String Instrs ")"
                    | "(" "get"            String        ")"
                    | "(" "get" Identifier String        ")"
 // --------------------------------------------------------
    rule <k> ( invoke ENAME:String IS:Instrs ) => IS ~> ( invoke ENAME ) ... </k>
    rule <k> ( invoke ENAME:String )           => ( call TFIDX )         ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <exports> ... ENAME |-> TFIDX ... </exports>
           ...
         </moduleInst>
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

### Addtional Module Syntax

The conformance test cases contain the syntax of declaring modules in the format of `(module binary <string>*)` and `(module quote <string>*)`. In order to parse the conformance test cases, we handle these declarations here and just reduce them to empty.

**TODO**: Implement `(module binary <string>*)` and put it into `wasm.md`.

```k
    syntax DefnStrings ::= List{String, ""}
    syntax ModuleDecl  ::= "(" "module" "quote" DefnStrings ")"
 // -----------------------------------------------------------
    rule <k> ( module quote  _ ) => . ... </k>
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

### Conformance Assertions

Here we inplement the conformance assertions specified in [spec interpreter] including:

```
  ( assert_return <action> <expr>* )         ;; assert action has expected results. Sometimes <expr>* is just empty.
  ( assert_return_canonical_nan <action> )   ;; assert action results in NaN in a canonical form
  ( assert_return_arithmetic_nan <action> )  ;; assert action results in NaN with 1 in MSB of fraction field
  ( assert_trap <action> <failure> )         ;; assert action traps with given failure string
  ( assert_malformed <module> <failure> )    ;; assert module cannot be decoded with given failure string
  ( assert_invalid <module> <failure> )      ;; assert module is invalid with given failure string
  ( assert_unlinkable <module> <failure> )   ;; assert module fails to link
  ( assert_trap <module> <failure> )         ;; assert module traps on instantiation
```

Except `assert_return` and `assert_trap`, the remaining rules are directly reduced to empty. We are not planning to implement them and these rules are only used to make it easier to parse conformance tests.

```k
    syntax Assertion ::= "(" "assert_return"                Action     Instr  ")"
                       | "(" "assert_return"                Action            ")"
                       | "(" "assert_return_canonical_nan"  Action            ")"
                       | "(" "assert_return_arithmetic_nan" Action            ")"
                       | "(" "assert_trap"                  Action     String ")"
                       | "(" "assert_malformed"             ModuleDecl String ")"
                       | "(" "assert_invalid"               ModuleDecl String ")"
                       | "(" "assert_unlinkable"            ModuleDecl String ")"
                       | "(" "assert_trap"                  ModuleDecl String ")"
 // -----------------------------------------------------------------------------
    rule <k> (assert_return ACT INSTR)               => ACT ~> INSTR ~> #assertAndRemoveEqual ~> #assertAndRemoveToken ... </k>
         <valstack> VALSTACK => token : VALSTACK </valstack>
    rule <k> (assert_return ACT)                     => ACT                                   ~> #assertAndRemoveToken ... </k>
         <valstack> VALSTACK => token : VALSTACK </valstack>
    rule <k> (assert_return_canonical_nan  ACT)      => . ... </k>
    rule <k> (assert_return_arithmetic_nan ACT)      => . ... </k>
    rule <k> (assert_trap       ACT:Action     DESC) => ACT ~> #assertTrap DESC ... </k>
    rule <k> (assert_malformed  MOD            DESC) => . ... </k>
    rule <k> (assert_invalid    MOD            DESC) => . ... </k>
    rule <k> (assert_unlinkable MOD            DESC) => . ... </k>
    rule <k> (assert_trap       MOD:ModuleDecl DESC) => MOD ~> #assertTrap DESC ... </k>
```

And we implement some helper assertions to help testing.

```k
    syntax Assertion ::= "#assertAndRemoveEqual"
                       | "#assertAndRemoveToken"
 // --------------------------------------------
    rule <k> #assertAndRemoveEqual   => #assertTopStack V "" ~> ( drop ) ... </k>
         <valstack> V : VALSTACK     => VALSTACK </valstack>
    rule <k> #assertAndRemoveToken   => . ... </k>
         <valstack> token : VALSTACK => VALSTACK </valstack>
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
                       | "#assertStackAux"        ValStack ValStack
 // ---------------------------------------------------------------
    rule <k> #assertTopStack S                      _ => . ... </k> <valstack> S              : VALSTACK </valstack>
    rule <k> #assertTopStack < ITYPE:IValType > VAL _ => . ... </k> <valstack> < ITYPE > VAL' : VALSTACK </valstack>
      requires #unsigned(ITYPE, VAL) ==Int VAL'

    rule <k> #assertTopStackExactly < ITYPE:IValType > VAL _ => . ... </k> <valstack> < ITYPE > VAL : VALSTACK </valstack>

    rule <k> #assertStack S1 _ => #assertStackAux S1 S2  ... </k>
         <valstack> S2 </valstack>
    rule <k> #assertStackAux .ValStack  _                                 => .                       ... </k>
    rule <k> #assertStackAux (            V : S1')              (V : S2') => #assertStackAux S1' S2' ... </k>
    rule <k> #assertStackAux (< ITYPE > VAL : S1') (< ITYPE > VAL' : S2') => #assertStackAux S1' S2' ... </k>
      requires #unsigned(ITYPE, VAL) ==Int VAL'
```

### Variables Assertions

The operator `#assertLocal`/`#assertGlobal` operators perform a check for a local/global variable's value.

```k
    syntax Assertion ::= "#assertLocal"  Int Val String
                       | "#assertGlobal" TextFormatIdx Val String
 // -------------------------------------------------------------
    rule <k> #assertLocal INDEX VALUE _ => . ... </k>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <k> #assertGlobal TFIDX VALUE _ => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS </globIds>
           <globalIndices> ... #ContextLookup(IDS , TFIDX) |-> GADDR ... </globalIndices>
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
    syntax Assertion ::= "#assertTable" TextFormatIdx Int MaxBound String
 // ---------------------------------------------------------------------
    rule <k> #assertTable TFIDX SIZE MAX MSG => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS </tabIds>
           <tabIndices> #ContextLookup(IDS, TFIDX) |-> ADDR </tabIndices>
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
    syntax Assertion ::= "#assertMemory" TextFormatIdx Int MaxBound String
 // ----------------------------------------------------------------------
    rule <k> #assertMemory TFIDX SIZE MAX MSG => . ... </k>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS </memIds>
           <memIndices> #ContextLookup(IDS, TFIDX) |-> ADDR </memIndices>
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
         <curModIdx>       _ => .NoIdx    </curModIdx>
         <valstack>        _ => .ValStack </valstack>
         <locals>          _ => .Map      </locals>
         <localIds>        _ => .Map      </localIds>
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
           <nextGlobAddr>  _ => 0         </nextGlobAddr>
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
