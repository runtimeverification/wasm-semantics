module WASM
  imports DOMAINS

  configuration
    <k color="green"> $PGM:Instrs </k>
    <stack color="red"> .Stack </stack>
    <curFrame color="Orchid">
      <moduleInst>
        <memAddrs> .Map  </memAddrs>
      </moduleInst>
    </curFrame>
    <store color="orange">
      <nextMemAddr> 0 </nextMemAddr>
      <mems>
        <memInst multiplicity="*" type="Map">   // Makes <mems> a Map
          <memAddr> 0 </memAddr>                // with <memAddr> as key
          <memSize>    0 </memSize>
        </memInst>
      </mems>
    </store>

  // Helper data structures.
  syntax Instrs ::= List{Instr, ""}
  rule <k> .Instrs => . </k>
  rule <k> I IS:Instrs => I ~> IS ... </k>

  syntax Stack ::= ".Stack" | StackItem ":" Stack
  syntax StackItem ::= "<" IType ">" Int

  syntax IType ::= "i32" | "i64"

  // Functions.

  syntax Int ::= #chop(IType, Int) [function]
  rule #chop(i32, I) => I modInt (2 ^Int 32)
  rule #chop(i64, I) => I modInt (2 ^Int 64)

  // Basic instructions.
  syntax Instr ::= "(" IType "." "const" Int ")"
  rule <k> ( ITYPE . const I ) => . ... </k>
       <stack> S => < ITYPE > #chop(ITYPE, I) : S </stack>

  // Memory instructions.

  syntax Instr ::= "(" "memory" ")"

  syntax Instr ::= "(" "memory.size" ")"

  syntax Instr ::= "(" "memory.grow" ")" | "(" "memory.grow" Instr ")"

endmodule

 





















/*

  syntax Instr ::= "(" "memory" ")"
  rule <k> ( memory ) => . ... </k>
       <memAddrs> .Map => 0 |-> NEXT </memAddrs>
       <nextMemAddr> NEXT => NEXT +Int 1 </nextMemAddr>
       <mems>
         (.Bag =>
         <memInst>
           <memAddr> 0 </memAddr>
           ...
         </memInst>)
         ...
       </mems>

  syntax Instr ::= "(" "memory.size" ")"
  rule <k> ( memory.size ) => ( i32.const SZ) ... </k>
       <memAddrs> 0 |-> A </memAddrs>
       <memInst>
         <memAddr> A  </memAddr>
         <memSize> SZ </memSize>
       </memInst>

  syntax Instr ::= "(" "memory.grow" ")" | "(" "memory.grow" Instr ")"
  rule <k> ( memory.grow INSTR ) => INSTR ~> ( memory.grow ) ... </k>
  rule <k> ( memory.grow ) => ( i32.const -1) ... </k>
       <stack> < i32 > I : STACK => STACK </stack>
       <spuriousMemoryFail> true </spuriousMemoryFail>
  rule <k> ( memory.grow ) => ( i32.const SIZE ) ... </k>
       <stack> < i32 > I : STACK => STACK </stack>
       <memAddrs> 0 |-> A </memAddrs>
       <memInst>
         <memAddr> A </memAddr>
         <memSize>   SIZE => SIZE +Int I </memSize>
         ...
       </memInst>


  // Spurious fail.
    <spuriousMemoryFail> false </spuriousMemoryFail>

*/