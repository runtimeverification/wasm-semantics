```k
require "summaries.k"
require "elrond-impl.md"

module ELROND-SYNTAX
  imports WASM-TEXT-SYNTAX
endmodule

module ELROND
  imports ELROND-IMPL
  imports SUMMARIES
endmodule
```