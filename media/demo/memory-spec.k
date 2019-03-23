module MEMORY-SPEC
  imports WASM

  rule <k> ( memory.size ) => (i32.const SZ) ... </k>
      <memAddrs> 0 |-> A </memAddrs>
      <memInst>
        <memAddr> A </memAddr>
        <memSize> SZ </memSize>
      </memInst>

// /*
  rule <k> (memory.grow (i32.const X)) => (i32.const SZ) ...</k>
      <memAddrs> 0 |-> A </memAddrs>
      <memInst>
        <memAddr> A </memAddr>
        <memSize> SZ => (SZ +Int X) </memSize>
      </memInst>
// */

endmodule






















/* Necessary conditions for the second proof.
     <spuriousMemoryFail> false </spuriousMemoryFail>
     requires X >=Int 0
      andBool X <Int  (2 ^Int 32)
*/