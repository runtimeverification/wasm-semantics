```k
requires "wasm-text.md"
requires "ulm.k"
```

```k
module ULM-WASM-SYNTAX
  imports WASM-SYNTAX
endmodule
```

```k
module ULM-WASM
  imports WASM-TEXT
  imports ULM

  configuration <ulm-wasm>
                  <wasm/>
                </ulm-wasm>
endmodule
```
