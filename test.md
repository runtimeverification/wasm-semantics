KWasm Testing
=============

For testing, we augment the semantics with some helpers.

```k
require "wasm-text.k"
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
```k
endmodule
```
