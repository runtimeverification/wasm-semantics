Semantics of WebAssembly (WASM) in K
====================================

This repository presents a prototype formal semantics of [WebAssembly].
Currently only rudimentary opcodes are supported, including simple arithmetic and stack operations.

Building
========

System Dependencies
-------------------

The following are needed for building/running KWASM:

-   [Pandoc >= 1.17](https://pandoc.org) is used to generate the `*.k` files from the `*.md` files.
-   GNU [Bison](https://www.gnu.org/software/bison/), [Flex](https://github.com/westes/flex), and [Autoconf](http://www.gnu.org/software/autoconf/).
-   GNU [libmpfr](http://www.mpfr.org/) and [libtool](https://www.gnu.org/software/libtool/).
-   Java 8 JDK (eg. [OpenJDK](http://openjdk.java.net/))
-   [Opam](https://opam.ocaml.org/doc/Install.html), **important**: Ubuntu users prior to 15.04 **must** build from source, as the Ubuntu install for 14.10 and prior is broken.
    `opam repository` also requires `rsync`.

On Ubuntu >= 15.04 (for example):

```sh
sudo apt-get install make gcc maven openjdk-8-jdk flex opam pkg-config libmpfr-dev autoconf libtool pandoc zlib1g-dev
```

To run proofs, you will also need [Z3](https://github.com/Z3Prover/z3) prover; on Ubuntu:

```sh
sudo apt-get install z3
```

Installing/Building
-------------------

After installing the above dependencies, the following command will build submodule dependencies and then KWASM:

```sh
make deps
make build
```

Testing
-------

The target `passing-test` contains all the currently passing tests.

```sh
make passing-test
```

Resources
=========

[WebAssembly]: <https://github.com/WebAssembly/design>
