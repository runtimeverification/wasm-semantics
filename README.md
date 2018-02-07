# A Prototype Formal Semantics of WebAssembly in K

dummy change

This repository presents a prototype formal semantics of [WebAssembly](https://github.com/WebAssembly/design/blob/master/README.md) based on the [prototype ML interpreter](https://github.com/WebAssembly/spec/tree/master/ml-proto). Note that the language specification is still under development and expected to change, and this prototype semantics is to demonstrate the feasibility of having a formal semantics as (a supplement of) the language specification.

Currently, as a quick draft, the semantics specifies most of language constructs, as well as basic memory and arithmetic operations. Being executable, the semantics can run test programs, [fac.wasm](test/fac.wasm) and [memory.wasm](test/memory.wasm), provided by the prototype ML interpreter (albeit with minor modification), with which we will try to keep in sync.

Details of current limitations and minor syntactic modifications (for quick prototyping) are following:
 * Semantics
  * `switch`, `dispatch` and `table` are not specified yet
  * currently only `int32` is specified, thus no type conversion is specified yet
 * Syntax
  * comment syntax `//` is used instead of `;;`
  * explicit function declaration components: `params`, `result`, and `local`



## How to Run Semantics

### 1. Install K

This semantics is compatible with the latest K framework. 
See http://kframework.org for download and installation details.



### 2. Compile semantics

Currently, the semantics needs to be adjusted to work around a parsing issue in K framework that will be fixed in the upcoming K 4.0 release. To adjust and compile the semantics:
```
$ patch -p1 <wasm.k.patch
$ kompile --kore wasm.k
```

### 3. Run semantics

You can run a program:
```
$ krun --kore <pgm>.wasm
```
For example,
```
$ krun --kore test/fac.wasm
$ krun --kore test/memory.wasm
```
By default, `krun` prints out the final configuration (i.e., program state). To suppress the output, use `--output none` option:
```
$ krun --kore --output none <pgm>.wasm
```
