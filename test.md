KWasm Testing
=============

For testing, we augment the semantics with some helpers.

```k
require "wasm-text.md"
```

Module `WASM-TEST-SYNTAX` is just used for program parsing and `WASM-TEST` consists of the definitions both for parsing and execution.

```k
module WASM-TEST-SYNTAX
    imports WASM-TEST
    imports WASM-TEXT-SYNTAX
endmodule

module WASM-TEST
    imports WASM-TEXT
```

Configuration
-------------

```k
    configuration
      <wasm-test>
        <k> $PGM:Stmts </k>
        <wasm/>
      </wasm-test>
```

Passing Control
---------------

The test embedder passes control to the execution cell in Wasm.

```k
    rule <k> PGM => . </k>
         <instrs> .K => sequenceStmts(text2abstract(PGM)) </instrs>
```

Bare Allocations
----------------

We allow allocations to appear outside of modules, for example interleaved with assertions in tests.
This is purely a KWasm feature, which is useful for testing.

```k
    rule <instrs> A:Alloc => #emptyModule() ~> A ... </instrs>
         <curModIdx> .Int </curModIdx>
      [owise]
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
    syntax Action ::= "(" "invoke" OptionalId WasmString Instrs ")"
                    |     "invoke" Int        WasmString
                    | "(" "get"    OptionalId WasmString        ")"
                    |     "get"    Int        WasmString
 // ----------------------------------------------------
    rule <instrs> ( invoke OID:OptionalId ENAME:WasmString IS:Instrs ) => sequenceInstrs(IS) ~> ( invoke OID ENAME .Instrs ) ... </instrs>
      requires IS =/=K .Instrs

    rule <instrs> ( invoke ENAME:WasmString .Instrs ) => invoke CUR ENAME ... </instrs>
         <curModIdx> CUR </curModIdx>

    rule <instrs> ( invoke ID:Identifier ENAME:WasmString .Instrs ) => invoke MODIDX ENAME ... </instrs>
         <moduleIds> ... ID |-> MODIDX ... </moduleIds>

    rule <instrs> invoke MODIDX:Int ENAME:WasmString => ( invoke FADDR ):Instr ... </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <exports> ... ENAME |-> IDX ... </exports>
           <funcAddrs> ... IDX |-> FADDR ... </funcAddrs>
           ...
         </moduleInst>

    rule <instrs> ( get NAME:WasmString ) => get CUR NAME  ... </instrs>
         <curModIdx> CUR </curModIdx>

    rule <instrs> ( get MOD:Identifier NAME:WasmString ) => get MODIDX NAME ... </instrs>
         <moduleIds> ... MOD |-> MODIDX ... </moduleIds>

    rule <instrs> get MODIDX:Int NAME:WasmString => VAL ... </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <exports> ... NAME |-> TFIDX ... </exports>
           <globIds> IDS </globIds>
           <globalAddrs> ... #ContextLookup(IDS, TFIDX) |-> ADDR ... </globalAddrs>
           ...
         </moduleInst>
         <globalInst>
           <gAddr> ADDR </gAddr>
           <gValue> VAL </gValue>
           ...
         </globalInst>
```

### Registering Modules

We will reference modules by name in imports.
`register` is the instruction that allows us to associate a name with a module.

```k
    syntax Auxil ::= "(" "register" WasmString       ")"
                   | "(" "register" WasmString Index ")"
 // ----------------------------------------------------
    rule <instrs> ( register S ) => ( register S (NEXT -Int 1) )... </instrs> // Register last instantiated module.
         <nextModuleIdx> NEXT </nextModuleIdx>
      requires NEXT >Int 0

    rule <instrs> ( register S ID:Identifier ) => ( register S IDX ) ... </instrs>
         <moduleIds> ... ID |-> IDX ... </moduleIds>

    rule <instrs> ( register S:WasmString IDX:Int ) => . ... </instrs>
         <moduleRegistry> ... .Map => S |-> IDX ... </moduleRegistry>
```

### Addtional Module Syntax

The conformance test cases contain the syntax of declaring modules in the format of `(module binary <string>*)` and `(module quote <string>*)`.
They are not defined in the official specification.
In order to parse the conformance test cases, we handle these declarations here and just reduce them to the empty module.

```k
    syntax DefnStrings ::= List{WasmString, ""}
    syntax ModuleDecl ::= "(" "module" OptionalId "binary" DataString  ")"
                        | "(" "module" OptionalId "quote"  DefnStrings ")"
 // ----------------------------------------------------------------------
    rule ( module OID binary DS ) => ( module OID .Defns ) [macro]

    rule ( module OID quote DS ) => ( module OID .Defns ) [macro]
```

The conformance tests contain imports of the `"spectest"` module.
For now, we just introduce some special handling that ignores any tests that make use of `"spectest"`.
The handling consists of trapping whenever a `"spectest"` function is called, and removing the trap whenever a new module or assertion comes up.

TODO: Actually implement the `"spectest"` module, or call out to the supplied on in the spec repo.

```k
    syntax Instr ::= "spectest_trap"
 // --------------------------------
    rule <instrs> spectest_trap ~> (L:Label => .) ... </instrs>
    rule <instrs> spectest_trap ~> (F:Frame => .) ... </instrs>
    rule <instrs> spectest_trap ~> (I:Instr => .) ... </instrs>
    rule <instrs> spectest_trap ~> (D:Defn  => .) ... </instrs>

    rule <instrs> (spectest_trap => .) ~> M:ModuleDecl ... </instrs>
    rule <instrs> (spectest_trap => .) ~> A:Assertion  ... </instrs>

    rule <instrs> ( import MOD _ (func OID:OptionalId TUSE:TypeUse) )
          => #func(... type: TUSE, locals: .LocalDecls, body: spectest_trap .Instrs, metadata: #meta(... id: OID, localIds: .Map))
          ...
          </instrs>
      requires MOD ==K #unparseWasmString("\"spectest\"")
        orBool MOD ==K #unparseWasmString("\"test\"")
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
  ( assert_exhaustion <action> <failure> )   ;; assert action exhausts system resources
  ( assert_malformed <module> <failure> )    ;; assert module cannot be decoded with given failure string
  ( assert_invalid <module> <failure> )      ;; assert module is invalid with given failure string
  ( assert_unlinkable <module> <failure> )   ;; assert module fails to link
  ( assert_trap <module> <failure> )         ;; assert module traps on instantiation
```

Except `assert_return` and `assert_trap`, the remaining rules are directly reduced to empty. We are not planning to implement them and these rules are only used to make it easier to parse conformance tests.

*TODO:* Make use of `assert_exhaustion`, by detecting stack overflow.

```k
    syntax Assertion ::= "(" "assert_return"                Action     Instr  ")"
                       | "(" "assert_return"                Action            ")"
                       | "(" "assert_return_canonical_nan"  Action            ")"
                       | "(" "assert_return_arithmetic_nan" Action            ")"
                       | "(" "assert_trap"                  Action     WasmString ")"
                       | "(" "assert_exhaustion"            Action     WasmString ")"
                       | "(" "assert_malformed"             ModuleDecl WasmString ")"
                       | "(" "assert_invalid"               ModuleDecl WasmString ")"
                       | "(" "assert_unlinkable"            ModuleDecl WasmString ")"
                       | "(" "assert_trap"                  ModuleDecl WasmString ")"
 // ---------------------------------------------------------------------------------
    rule <instrs> (assert_return ACT INSTR)               => ACT ~> INSTR ~> #assertAndRemoveEqual ~> #assertAndRemoveToken ... </instrs>
         <valstack> VALSTACK => token : VALSTACK </valstack>
    rule <instrs> (assert_return ACT)                     => ACT                                   ~> #assertAndRemoveToken ... </instrs>
         <valstack> VALSTACK => token : VALSTACK </valstack>
    rule <instrs> (assert_return_canonical_nan  ACT)      => . ... </instrs>
    rule <instrs> (assert_return_arithmetic_nan ACT)      => . ... </instrs>
    rule <instrs> (assert_trap       ACT:Action     DESC) => ACT ~> #assertTrap DESC ... </instrs>
    rule <instrs> (assert_exhaustion ACT:Action     DESC) => . ... </instrs>
    rule <instrs> (assert_malformed  MOD            DESC) => . ... </instrs>
    rule <instrs> (assert_invalid    MOD            DESC) => . ... </instrs>
    rule <instrs> (assert_unlinkable MOD            DESC) => . ... </instrs>
    rule <instrs> (assert_trap       MOD:ModuleDecl DESC) => sequenceStmts(text2abstract(MOD .Stmts)) ~> #assertTrap DESC ... </instrs>
```

And we implement some helper assertions to help testing.

```k
    syntax Assertion ::= "#assertAndRemoveEqual"
                       | "#assertAndRemoveToken"
 // --------------------------------------------
    rule <instrs> #assertAndRemoveEqual   => #assertTopStack V .WasmString ~> ( drop ) ... </instrs>
         <valstack> V : VALSTACK     => VALSTACK </valstack>
    rule <instrs> #assertAndRemoveToken   => . ... </instrs>
         <valstack> token : VALSTACK => VALSTACK </valstack>
```

### Trap Assertion

This asserts that a `trap` was just thrown.

```k
    syntax Assertion ::= "#assertTrap" WasmString
 // ---------------------------------------------
    rule <instrs> trap ~> #assertTrap _ => . ... </instrs>
```

### ValStack Assertions

These functions make assertions about the state of the `<valstack>` cell.

```k
    syntax Assertion ::= "#assertTopStack"        Val      WasmString
                       | "#assertTopStackExactly" Val      WasmString
                       | "#assertStack"           ValStack WasmString
                       | "#assertStackAux"        ValStack ValStack
 // ---------------------------------------------------------------
    rule <instrs> #assertTopStack S                      _ => . ... </instrs> <valstack> S              : VALSTACK </valstack>
    rule <instrs> #assertTopStack < ITYPE:IValType > VAL _ => . ... </instrs> <valstack> < ITYPE > VAL' : VALSTACK </valstack>
      requires #unsigned(ITYPE, VAL) ==Int VAL'
    rule <instrs> #assertTopStack < FTYPE:FValType > VAL _ => . ... </instrs> <valstack> < FTYPE > VAL' : VALSTACK </valstack>
      requires signFloat(VAL) ==Bool signFloat(VAL') andBool VAL ==Float VAL'

    rule <instrs> #assertTopStackExactly A               _ => . ... </instrs> <valstack> A              : VALSTACK </valstack>

    rule <instrs> #assertStack S1 _ => #assertStackAux S1 S2  ... </instrs>
         <valstack> S2 </valstack>
    rule <instrs> #assertStackAux .ValStack  _                                 => .                       ... </instrs>
    rule <instrs> #assertStackAux (            V : S1')              (V : S2') => #assertStackAux S1' S2' ... </instrs>
    rule <instrs> #assertStackAux (< ITYPE > VAL : S1') (< ITYPE > VAL' : S2') => #assertStackAux S1' S2' ... </instrs>
      requires #unsigned(ITYPE, VAL) ==Int VAL'
```

### Variables Assertions

The operator `#assertLocal`/`#assertGlobal` operators perform a check for a local/global variable's value.

```k
    syntax Assertion ::= "#assertLocal"  Int   Val WasmString
                       | "#assertGlobal" Index Val WasmString
 // ---------------------------------------------------------
    rule <instrs> #assertLocal INDEX VALUE _ => . ... </instrs>
         <locals> ... INDEX |-> VALUE ... </locals>

    rule <instrs> #assertGlobal TFIDX VALUE _ => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <globIds> IDS </globIds>
           <globalAddrs> ... #ContextLookup(IDS , TFIDX) |-> GADDR ... </globalAddrs>
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
    syntax Assertion ::= "#assertType" Index FuncType
                       | "#assertNextTypeIdx" Int
 // ---------------------------------------------
    rule <instrs> #assertType TFIDX FTYPE => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <typeIds> IDS </typeIds>
           <types> ... #ContextLookup(IDS , TFIDX) |-> FTYPE ... </types>
           ...
         </moduleInst>

    rule <instrs> #assertNextTypeIdx IDX => . ... </instrs>
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
    syntax Assertion ::= "#assertFunction" Index FuncType VecType WasmString
 // ------------------------------------------------------------------------
    rule <instrs> #assertFunction IDX FTYPE LTYPE _ => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcAddrs> ... IDX |-> FADDR ... </funcAddrs>
           ...
         </moduleInst>
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
    syntax Assertion ::= "#assertTable" Index Int OptionalInt WasmString
 // --------------------------------------------------------------------
    rule <instrs> #assertTable TFIDX SIZE MAX MSG => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabIds> IDS </tabIds>
           <tabAddrs> #ContextLookup(IDS, TFIDX) |-> ADDR </tabAddrs>
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

    syntax Assertion ::= "#assertTableElem" "(" Int "," Int ")" WasmString
 // ----------------------------------------------------------------------
    rule <instrs> #assertTableElem (KEY , VAL) MSG => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabAddrs> 0 |-> ADDR </tabAddrs>
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
    syntax Assertion ::= "#assertMemory" Index Int OptionalInt WasmString
 // ---------------------------------------------------------------------
    rule <instrs> #assertMemory TFIDX SIZE MAX MSG => . ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS </memIds>
           <memAddrs> #ContextLookup(IDS, TFIDX) |-> ADDR </memAddrs>
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

    syntax Assertion ::= "#assertMemoryData"     "(" Int "," Int ")" WasmString
    syntax Assertion ::= "#assertMemoryData" Int "(" Int "," Int ")" WasmString
 // ---------------------------------------------------------------------------
    rule <instrs> #assertMemoryData (KEY , VAL) MSG => #assertMemoryData CUR (KEY, VAL) MSG ... </instrs>
         <curModIdx> CUR </curModIdx>

    rule <instrs> #assertMemoryData MODIDX (KEY , VAL) MSG => . ... </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <memAddrs> 0 |-> ADDR </memAddrs>
           ...
         </moduleInst>
         <mems>
           <memInst>
             <mAddr> ADDR </mAddr>
             <mdata> BM </mdata>
             ...
           </memInst>
           ...
         </mems>
      requires #getRange(BM, KEY, 1) ==Int VAL
```

### Module Assertions

These assertions test (and delete) module instances.
These assertions act on the last module defined.

```k
    syntax Assertion ::= "#assertNamedModule" Identifier WasmString
 // ---------------------------------------------------------------
    rule <instrs> #assertNamedModule NAME S => . ... </instrs>
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
    rule <instrs>    #clearConfig => . ...     </instrs>
         <curModIdx>       _ => .Int      </curModIdx>
         <valstack>        _ => .ValStack </valstack>
         <locals>          _ => .Map      </locals>
         <labelDepth>      _ => 0         </labelDepth>
         <labelIds>        _ => .Map      </labelIds>
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
    syntax Assertion ::= "#assertRegistrationUnnamed" WasmString            WasmString
                       | "#assertRegistrationNamed"   WasmString Identifier WasmString
 // ----------------------------------------------------------------------------------
    rule <instrs> #assertRegistrationUnnamed REGNAME _ => . ... </instrs>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX ...  </moduleRegistry>

    rule <instrs> #assertRegistrationNamed REGNAME NAME _ => . ... </instrs>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX ...  </moduleRegistry>
```

```k
endmodule
```
