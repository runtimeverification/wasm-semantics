KWasm Testing
=============

For testing, we augment the semantics with some helpers.

```k
requires "wasm-text.md"
requires "auxil.md"
```

Module `WASM-TEST-SYNTAX` is just used for program parsing and `WASM-TEST` consists of the definitions both for parsing and execution.

```k
module WASM-TEST-SYNTAX
    imports WASM-TEST-COMMON-SYNTAX
    imports WASM-TEXT-SYNTAX
    imports WASM-INTERNAL-SYNTAX
endmodule

module WASM-TEST-COMMON-SYNTAX
    imports WASM-TEXT-COMMON-SYNTAX
    imports WASM-DATA-INTERNAL-SYNTAX
    imports WASM-AUXIL-SYNTAX
    imports WASM-REFERENCE-INTERPRETER-SYNTAX

    syntax Assertion ::= "#assertTopStack"        Val      WasmString
                       | "#assertTopStackExactly" Val      WasmString
                       | "#assertStack"           ValStack WasmString
                       | "#assertLocal"  Int   Val WasmString
                       | "#assertGlobal" Index Val WasmString
                       | "#assertTrap" WasmString
                       | "#assertType" Int FuncType
                       | "#assertNextTypeIdx" Int
                       | "#assertFunction" Index FuncType VecType WasmString
                       | "#assertMemory" Index Int OptionalInt WasmString
                       | "#assertMemoryData"     "(" Int "," Int ")" WasmString
                       | "#assertMemoryData" Int "(" Int "," Int ")" WasmString
                       | "#assertTable" Index Int OptionalInt WasmString
                       | "#assertTableElem" "(" Int "," Index ")" WasmString
                       | "#assertNamedModule" Identifier WasmString
                       | "#assertRegistrationUnnamed" WasmString            WasmString
                       | "#assertRegistrationNamed"   WasmString Identifier WasmString
endmodule

module WASM-REFERENCE-INTERPRETER-SYNTAX
    imports WASM-COMMON-SYNTAX

    syntax Auxil  ::= Action
    syntax Action ::= "(" "invoke" OptionalId WasmString Instrs ")"
                    |     "invoke" Int        WasmString
                    | "(" "get"    OptionalId WasmString        ")"
                    |     "get"    Int        WasmString
 // ----------------------------------------------------
    syntax PlainInstr ::= "ref" Int
                        | "ref.extern" Int

    syntax Auxil ::= "(" "register" WasmString       ")"
                   | "(" "register" WasmString Index ")"
 // ----------------------------------------------------

    syntax DefnStrings ::= List{WasmString, ""}
    syntax ModuleDecl ::= "(" "module" OptionalId "binary" DataString  ")" [macro]
                        | "(" "module" OptionalId "quote"  DefnStrings ")" [macro]
 // ------------------------------------------------------------------------------
```

Assertions for KWasm tests
--------------------------

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

```k
    syntax Assertion ::= "(" "assert_return"                Action     Instrs ")"
                       | "(" "assert_return_canonical_nan"  Action            ")"
                       | "(" "assert_return_arithmetic_nan" Action            ")"
                       | "(" "assert_trap"                  Action     WasmString ")"
                       | "(" "assert_exhaustion"            Action     WasmString ")"
                       | "(" "assert_malformed"             ModuleDecl WasmString ")"
                       | "(" "assert_invalid"               ModuleDecl WasmString ")"
                       | "(" "assert_unlinkable"            ModuleDecl WasmString ")"
                       | "(" "assert_trap"                  ModuleDecl WasmString ")"
 // ---------------------------------------------------------------------------------
```

```k
endmodule

module WASM-TEST
    imports WASM-TEST-COMMON-SYNTAX
    imports WASM-AUXIL
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
    rule <k> PGM => .K </k>
         <instrs> .K
               => #initSpectestModule
               ~> sequenceStmts(text2abstract(PGM))
         </instrs>
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

Instruction sugar
-----------------

We allow writing instructions at the top level in the test embedder.

```k
    rule <instrs> FI:FoldedInstr => sequenceInstrs(unfoldInstrs(FI .Instrs)) ... </instrs>
```

Auxiliary
---------

We add `token` as a value in order to use as a separator in `<valstack>`.

```k
    syntax Val ::= "token"
 // ----------------------
    rule #sameType(token, _) => false

    rule <instrs> token => .K ... </instrs>
         <valstack> S => token : S </valstack>

    syntax ValStack ::= takeUntilToken(ValStack)    [function, total]
                      | dropUntilToken(ValStack)    [function, total]
 // -----------------------------------------------------------------
    rule takeUntilToken(.ValStack)  => .ValStack
    rule takeUntilToken(token : _ ) => token : .ValStack
    rule takeUntilToken(V     : Vs) => V : takeUntilToken(Vs)
      requires V =/=K token

    rule dropUntilToken(.ValStack)   => .ValStack
    rule dropUntilToken(token : Vs ) => Vs
    rule dropUntilToken(V     : Vs)  => dropUntilToken(Vs)
      requires V =/=K token

    syntax Assertion ::= "#dropUntilToken"
 // --------------------------------------------------
    rule <instrs> #dropUntilToken => .K ... </instrs>
         <valstack> S => dropUntilToken(S) </valstack>
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

```k
    rule <instrs> ( invoke OID:OptionalId ENAME:WasmString IS:Instrs ) => sequenceInstrs(IS) ~> ( invoke OID ENAME .Instrs ) ... </instrs>
      requires IS =/=K .Instrs

    rule <instrs> ( invoke ENAME:WasmString .Instrs ) => invoke CUR ENAME ... </instrs>
         <curModIdx> CUR </curModIdx>

    rule <instrs> ( invoke ID:Identifier ENAME:WasmString .Instrs ) => invoke MODIDX ENAME ... </instrs>
         <moduleIds> ... ID |-> MODIDX ... </moduleIds>

    rule <instrs> invoke MODIDX:Int ENAME:WasmString => ( invoke FUNCADDRS {{ IDX }} orDefault -1 ):Instr ... </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <exports> ... ENAME |-> IDX ... </exports>
           <funcAddrs> FUNCADDRS </funcAddrs>
           ...
         </moduleInst>
         requires isListIndex(IDX, FUNCADDRS)

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
    rule <instrs> ( register S ) => ( register S (NEXT -Int 1) )... </instrs> // Register last instantiated module.
         <nextModuleIdx> NEXT </nextModuleIdx>
      requires NEXT >Int 0

    rule <instrs> ( register S ID:Identifier ) => ( register S IDX ) ... </instrs>
         <moduleIds> ... ID |-> IDX ... </moduleIds>

    rule <instrs> ( register S:WasmString IDX:Int ) => .K ... </instrs>
         <moduleRegistry> ... .Map => S |-> IDX ... </moduleRegistry>
```

### Addtional Module Syntax

The conformance test cases contain the syntax of declaring modules in the format of `(module binary <string>*)` and `(module quote <string>*)`.
They are not defined in the official specification.
In order to parse the conformance test cases, we handle these declarations here and just reduce them to the empty module.

```k
    rule ( module OID binary _DS ) => ( module OID .Defns )

    rule ( module OID quote _DS ) => ( module OID .Defns )
```


### Spectest Host Module

The conformance tests contain imports of the `"spectest"` module.

- [Module signature](https://github.com/WebAssembly/spec/blob/f83a375df438067de1eafc25a2b5e249b7115a92/interpreter/README.md#spectest-host-module)
- [JS implementation](https://github.com/WebAssembly/spec/blob/f83a375df438067de1eafc25a2b5e249b7115a92/test/harness/async_index.js#L88)

```k
    syntax ModuleDecl ::= "#spectestModule"   [function, total]
                        | "#emp"
 // -----------------------------------------------------------
    rule #spectestModule 
      => #module ( ...
          types: #type (... type: [ .ValTypes ] -> [ .ValTypes ] , metadata:  )
                 #type (... type: [ i32  .ValTypes ] -> [ .ValTypes ] , metadata:  )
                 #type (... type: [ i64  .ValTypes ] -> [ .ValTypes ] , metadata:  )
                 #type (... type: [ f32  .ValTypes ] -> [ .ValTypes ] , metadata:  )
                 #type (... type: [ f64  .ValTypes ] -> [ .ValTypes ] , metadata:  )  
                 #type (... type: [ i32  f32  .ValTypes ] -> [ .ValTypes ] , metadata:  )  
                 #type (... type: [ f64  f64  .ValTypes ] -> [ .ValTypes ] , metadata:  )  
                 .EmptyStmts , 
            funcs: 
                #func (... type: 0 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                #func (... type: 1 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                #func (... type: 2 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                #func (... type: 3 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                #func (... type: 4 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                #func (... type: 5 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                #func (... type: 6 , locals: [ .ValTypes ] , body: .EmptyStmts , metadata: #meta (... id: , localIds: .Map ) )  
                .EmptyStmts ,
            tables: 
                #table (... limits: #limits ( 10 , 20 ) , type: funcref, metadata:  )  
                .EmptyStmts , 
            mems: 
                #memory (... limits: #limits ( 1 , 2 ) , metadata:  )  
                .EmptyStmts , 
            globals: 
                #global (... type: const i32 , init: i32 . const 666  .EmptyStmts , metadata:  )  
                #global (... type: const i64 , init: i64 . const 666  .EmptyStmts , metadata:  )  
                #global (... type: const f32 , init: f32 . const 666.0  .EmptyStmts , metadata:  )  
                #global (... type: const f64 , init: f64 . const 666.0  .EmptyStmts , metadata:  )  
                .EmptyStmts , 
            elem: .EmptyStmts , 
            data: .EmptyStmts , 
            start: .EmptyStmts , 
            importDefns: .EmptyStmts , 
            exports: 
                #export (... name: #token("\"global_i32\""    , "WasmStringToken") , index: 0 )  
                #export (... name: #token("\"global_i64\""    , "WasmStringToken") , index: 1 )  
                #export (... name: #token("\"global_f32\""    , "WasmStringToken") , index: 2 )  
                #export (... name: #token("\"global_f64\""    , "WasmStringToken") , index: 3 )  
                #export (... name: #token("\"table\""    , "WasmStringToken") , index: 0 )  
                #export (... name: #token("\"memory\""    , "WasmStringToken") , index: 0 )  
                #export (... name: #token("\"print\""    , "WasmStringToken") , index: 0 )  
                #export (... name: #token("\"print_i32\""    , "WasmStringToken") , index: 1 )  
                #export (... name: #token("\"print_i64\""    , "WasmStringToken") , index: 2 )  
                #export (... name: #token("\"print_f32\""    , "WasmStringToken") , index: 3 )  
                #export (... name: #token("\"print_f64\""    , "WasmStringToken") , index: 4 )  
                #export (... name: #token("\"print_i32_f32\""    , "WasmStringToken") , index: 5 )  
                #export (... name: #token("\"print_f64_f64\""    , "WasmStringToken") , index: 6 )  
                .EmptyStmts , 
            metadata: #meta (... id:  , funcIds: .Map , filename: .String ) 
        )
    syntax Stmt ::= "#initSpectestModule"
 // --------------------------------------------------------------------
    rule [initSpectestModule]:
        <instrs> #initSpectestModule 
              => #spectestModule
              ~> ( register #token("\"spectest\"", "WasmStringToken") )
              ~> #emptyModule() // create an empty module for the test instructions
                 ...
        </instrs>

```

Except `assert_return` and `assert_trap`, the remaining rules are directly reduced to empty. We are not planning to implement them and these rules are only used to make it easier to parse conformance tests.

*TODO:* Make use of `assert_exhaustion`, by detecting stack overflow.

```k
    rule <instrs> (assert_return ACT EXPECTED)
               => token
               ~> ACT
               ~> token                    // separator between actual and expected value 
               ~> sequenceInstrs(EXPECTED) // evaluate the expected value(s) 
               ~> #assertReturn
               ~> #dropUntilToken // clean expected value
               ~> #dropUntilToken // clean return value
                  ... 
         </instrs>

    rule <instrs> (assert_return_canonical_nan  _ACT)     => .K ... </instrs>
    rule <instrs> (assert_return_arithmetic_nan _ACT)     => .K ... </instrs>
    rule <instrs> (assert_trap        ACT:Action    DESC) => ACT ~> #assertTrap DESC ... </instrs>
    rule <instrs> (assert_exhaustion _ACT:Action   _DESC) => .K ... </instrs>
    rule <instrs> (assert_malformed  _MOD          _DESC) => .K ... </instrs>
    rule <instrs> (assert_invalid    _MOD          _DESC) => .K ... </instrs>
    rule <instrs> (assert_unlinkable _MOD          _DESC) => .K ... </instrs>
    rule <instrs> (assert_trap       MOD:ModuleDecl DESC) => sequenceStmts(text2abstract(MOD .Stmts)) ~> #assertTrap DESC ... </instrs>
```

And we implement some helper assertions to help testing.

```k
    syntax Assertion ::= "#assertReturn"
 // --------------------------------------
    rule <instrs> #assertReturn
               => #assertStackAux takeUntilToken(S) takeUntilToken(dropUntilToken(S))
                  ...
         </instrs>
         <valstack> S </valstack>
```

### Trap Assertion

This asserts that a `trap` was just thrown.

```k
    rule <instrs> trap ~> #assertTrap _ => .K ... </instrs>
```

### ValStack Assertions

These functions make assertions about the state of the `<valstack>` cell.

```k
    syntax Assertion ::= "#assertStackAux"        ValStack ValStack
 // ---------------------------------------------------------------
    rule <instrs> #assertTopStack VAL _ => .K ... </instrs>
         <valstack> VAL' : _ </valstack>
      requires equalVal(VAL, VAL')

    rule <instrs> #assertTopStackExactly A _ => .K ... </instrs> <valstack> A : _VALSTACK </valstack>

    rule <instrs> #assertStack S1 _ => #assertStackAux S1 S2  ... </instrs>
         <valstack> S2 </valstack>

    rule <instrs> #assertStackAux .ValStack  _ => .K ... </instrs>
    rule <instrs> #assertStackAux (V1 : S1) (V2 : S2) => #assertStackAux S1 S2 ... </instrs>
      requires equalVal(V1, V2)

    syntax Bool ::= equalVal(Val, Val)    [function, total]
 // -------------------------------------------------------
    rule equalVal(<ITYPE:IValType> X, <ITYPE> Y)   => #unsigned(ITYPE, X) ==Int Y
    rule equalVal(<FTYPE:FValType> X, <FTYPE> Y)   => signFloat(X) ==Bool signFloat(Y) andBool X ==Float Y
    rule equalVal(<RTYPE:RefValType> X, <RTYPE> Y) => X ==Int   Y
    rule equalVal(                 X,         Y) => X ==K     Y       [owise]

```

### Variables Assertions

The operator `#assertLocal`/`#assertGlobal` operators perform a check for a local/global variable's value.

```k
    rule <instrs> #assertLocal INDEX VALUE _ => .K ... </instrs>
         <locals> LOCALS </locals>
      requires LOCALS[INDEX] ==K VALUE

    rule <instrs> #assertGlobal TFIDX VALUE _ => .K ... </instrs>
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
    rule <instrs> #assertType IDX FTYPE => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <types> ... IDX |-> FTYPE ... </types>
           ...
         </moduleInst>

    rule <instrs> #assertNextTypeIdx IDX => .K ... </instrs>
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
    syntax Assertion ::= "#assertFunctionHelper" Int FuncType VecType 
 // ------------------------------------------------------------------------
    rule <instrs> #assertFunction IDX FTYPE LTYPE _ => #assertFunctionHelper (FUNCADDRS {{ IDX }} orDefault -1) FTYPE LTYPE ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <funcAddrs> FUNCADDRS </funcAddrs>
           ...
         </moduleInst>
      requires isListIndex(IDX, FUNCADDRS)

    rule <instrs> #assertFunctionHelper ADDR FTYPE LTYPE  => .K ... </instrs>
         <funcs>
           <funcDef>
             <fAddr>  ADDR </fAddr>
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
    rule <instrs> #assertTable TFIDX SIZE MAX _MSG => .K ... </instrs>
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
             <tdata> DATA </tdata>
             ...
           </tabInst>
           ...
         </tabs>
      requires size(DATA) ==Int SIZE

    rule <instrs> #assertTableElem (KEY , VAL:Int) _MSG => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <tabAddrs> 0 |-> ADDR </tabAddrs>
           ...
         </moduleInst>
         <tabs>
           <tabInst>
             <tAddr> ADDR </tAddr>
             <tdata> TDATA </tdata>
               ...
           </tabInst>
           ...
         </tabs>
      requires <funcref> VAL ==K getRefOrNull(TDATA, KEY)

    rule <instrs> #assertTableElem (KEY , FID:Identifier) MSG 
               => #assertTableElem (KEY , FADDRS {{ FUNC_ID }} orDefault -1) MSG
                  ...
         </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <moduleMetadata>
             <funcIds> ... FID |-> FUNC_ID ... </funcIds>
             ...
           </moduleMetadata>
           <funcAddrs> FADDRS </funcAddrs>
           ...
         </moduleInst>

```

### Memory Assertions

This checks that the last allocated memory has the given size and max value.

```k
    rule <instrs> #assertMemory TFIDX SIZE MAX _MSG => .K ... </instrs>
         <curModIdx> CUR </curModIdx>
         <moduleInst>
           <modIdx> CUR </modIdx>
           <memIds> IDS </memIds>
           <memAddrs> wrap(#ContextLookup(IDS, TFIDX)) Int2Int|-> wrap(ADDR) </memAddrs>
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

    rule <instrs> #assertMemoryData (KEY , VAL) MSG => #assertMemoryData CUR (KEY, VAL) MSG ... </instrs>
         <curModIdx> CUR </curModIdx>

    rule <instrs> #assertMemoryData MODIDX (KEY , VAL) _MSG => .K ... </instrs>
         <moduleInst>
           <modIdx> MODIDX </modIdx>
           <memAddrs> wrap(0) Int2Int|-> wrap(ADDR) </memAddrs>
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
    rule [assertNamedModule]:
         <instrs> #assertNamedModule NAME _S => .K ... </instrs>
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

Registry Assertations
---------------------

We also want to be able to test that the embedder's registration function is working.

```k
    rule <instrs> #assertRegistrationUnnamed REGNAME _ => .K ... </instrs>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX ...  </moduleRegistry>

    rule <instrs> #assertRegistrationNamed REGNAME _NAME _ => .K ... </instrs>
         <modIdx> IDX </modIdx>
         <moduleRegistry> ... REGNAME |-> IDX ...  </moduleRegistry>
```

## Administrative instructions

```k
    rule <instrs> ref I        => <funcref>   I ... </instrs>
    rule <instrs> ref.extern I => <externref> I ... </instrs>
```

```k
endmodule
```
