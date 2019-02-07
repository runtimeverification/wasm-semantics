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
sudo apt install                                                         \
        autoconf curl flex gcc libffi-dev libmpfr-dev libtool make maven \
        opam openjdk-8-jdk pandoc pkg-config python3 python-pygments     \
        python-recommonmark python-sphinx time zlib1g-dev
```

To run proofs, you will also need [Z3](https://github.com/Z3Prover/z3) prover; on Ubuntu:

```sh
sudo apt-get install z3 libz3-dev
```

In addition, you'll need to set ocaml dependencies on your system:

```sh
git submodule update --init --recursive
./.build/k/k-distribution/src/main/scripts/bin/k-configure-opam-dev
```

**CAUTION**: It may prove useful to first do `rm -rf ~/.opam` if you've setup K projcets in the past and are experiencing trouble with the newest opam libraries.
             This is a fairly destructive operation, and will break any other projects that depend on specific locally installed ocaml packages.

Installing/Building
-------------------

After installing the above dependencies, the following command will build submodule dependencies and then KWASM:

```sh
make deps
make build
```

Testing
-------

The target `test` contains all the currently passing tests.

```sh
make test
```

Resources
=========

[WebAssembly]: <https://webassembly.github.io/spec/>
