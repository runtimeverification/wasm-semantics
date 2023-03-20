```k
require "summaries.k"
require "elrond-impl.md"
require "elrond-lemmas.md"
require "elrond-configuration.md"

module ELROND-WASM-SYNTAX
  imports WASM-TEXT-SYNTAX
endmodule

module ELROND-WASM
  imports ELROND-CONFIGURATION
  imports ELROND-IMPL
  imports ELROND-LEMMAS
  imports SUMMARIES

  configuration
    <elrond-wasm>
      <k> $PGM:Stmts </k>
      <wasm/>
      <elrond/>
    </elrond-wasm>

  rule <k> PGM => . </k>
        <instrs> .K => sequenceStmts(text2abstract(PGM)) </instrs>
endmodule
```