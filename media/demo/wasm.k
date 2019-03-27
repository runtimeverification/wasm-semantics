module WASM
  imports DOMAINS

  configuration
    <k color="green"> $PGM:Instrs </k>
    <stack color="red"> .Stack </stack>
    <frame>
       <module>
         <memAddrs color="Orchid"> .Map </memAddrs>
       </module>
    </frame>
    <store>
      <nextMemAddr> 0 </nextMemAddr>
      <mems color="orange">
        <memInst multiplicity="*" type="Map">
          <memAddr> 0 </memAddr>
          <memSize> 0 </memSize>
        </memInst>
      </mems>
    </store>
    <spuriousMemoryFail> false </spuriousMemoryFail>


 // Useful definitions.

    syntax Instrs ::= List{Instr, ""}
 // ---------------------------------
    rule <k> .Instrs => . </k>
    rule <k> I IS:Instrs => I ~> IS ... </k>

    syntax Stack ::= ".Stack" | StackItem ":" Stack
    syntax StackItem ::= "<" IType ">" Int
 // --------------------------------------

    syntax IType ::= "i32" | "i64"
 // ------------------------------

 // Functions.

    syntax Int ::= #chop(IType, Int) [function]
 // -------------------------------------------
    rule #chop(i32, I) => I modInt (2 ^Int 32)
    rule #chop(i64, I) => I modInt (2 ^Int 64)


 // Basic instructions.
    syntax Instr ::= "(" IType "." "const" Int ")"
 // ----------------------------------------------
    rule <k> ( ITYPE . const I ) => . ... </k>
         <stack> S => < ITYPE > #chop(ITYPE, I) : S </stack>

 // Memory instructions.

    // Memory instantiation.
    syntax Instr ::= "(" "memory" ")"
 // ---------------------------------
    rule <k> (( memory ) ~> ELSE) => ELSE </k>
         <memAddrs> .Map => 0 |-> NEXT </memAddrs>
         <nextMemAddr> NEXT => NEXT +Int 1 </nextMemAddr>
         <mems>
           (.Bag =>
             <memInst>
               <memAddr> NEXT </memAddr>
               ...
             </memInst>)
           ...
         </mems>

    syntax Instr ::= "(" "memory.size" ")"
 // --------------------------------------
    rule <k> ( memory.size ) => ( i32.const SZ ) ... </k>
         <memAddrs> 0 |-> A </memAddrs>
         <memInst>
           <memAddr> A  </memAddr>
           <memSize> SZ </memSize>
           ...
         </memInst>
    rule <k> ( memory.size ) => ( i32.const -1 ) ... </k>

    syntax Instr ::= "(" "memory.grow" ")" | "(" "memory.grow" Instr ")"
 // --------------------------------------------------------------------
    rule <k> (memory.grow I:Instr) => I ~> (memory.grow) ... </k>
    rule <k> (memory.grow) => (i32.const SZ) ... </k>
         <stack> < i32 > V : S => S </stack>
         <memAddrs> 0 |-> A </memAddrs>
         <memInst>
           <memAddr> A </memAddr>
           <memSize> SZ => SZ +Int V </memSize>
         </memInst>
         requires SZ +Int V <Int 2 ^Int 16
    rule <k> (memory.grow) => (i32.const -1) ... </k>
         <stack> < i32 > _ : S => S </stack>
         <spuriousMemoryFail> true </spuriousMemoryFail>

endmodule