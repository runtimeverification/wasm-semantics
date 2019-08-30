KWasm: Semantics of WebAssembly in K
====================================

This repository presents a prototype formal semantics of [WebAssembly].
It is currently under construction.
For examples of current capabilities, see the unit tests under the `tests/simple` directory.

Repository Structure
--------------------

### Semantics Layout

The following files constitute the KWasm semantics:

-   [data.md](data.md) provides the (functional) data of WebAssembly (basic types, type constructors, and values).
-   [numeric.md](numeric.md) provides the functional rules for numeric operators.
-   [wasm.md](wasm.md) is the main KWasm semantics, containing the configuration and transition rules of WebAssembly.

These additional files extend the semantics to make the repository more useful:

-   [test.md](test.md) is an execution harness for KWasm, providing a simple language for describing tests/programs.

### Example usage: `./kwasm` runner script

After building the definition, you can run the definition using `./kwasm`.
The most up-to-date documentation will always be in `./kwasm help`.

Run the file `tests/simple/arithmetic.wast`:

```sh
./kwasm run tests/simple/arithmetic.wast
```

To run proofs, you can similarly use `./kwasm`, but must specify the module to use for proving.
For example, to prove the specification `tests/proofs/simple-arithmetic-spec.k`:

```sh
./kwasm prove tests/proofs/simple-arithmetic-spec.k -m KWASM-LEMMAS
```

You can optionally override the default backend using the `--backend BACKEND` flag:

```sh
./kwasm run   --backend java    tests/simple/arithmetic.wast
./kwasm prove --backend haskell tests/proofs/simple-arithmetic-spec.k -m KWASM-LEMMAS
```

Installing/Building
-------------------

### K Backends

There are three backends of K available, the OCAML backend for concrete execution, the Java backend for symbolic reasoning and proofs, and the experimental Haskell backend for developers.
This repository generates the build-products for both backends in `.build/defn/java/` and `.build/defn/ocaml/`.

### System Dependencies

The following are needed for building/running KWasm:

-   [git](https://git-scm.com/)
-   [Pandoc >= 1.17](https://pandoc.org) is used to generate the `*.k` files from the `*.md` files.
-   GNU [Bison](https://www.gnu.org/software/bison/), [Flex](https://github.com/westes/flex), and [Autoconf](http://www.gnu.org/software/autoconf/).
-   GNU [libmpfr](http://www.mpfr.org/) and [libtool](https://www.gnu.org/software/libtool/).
-   Java 8 JDK (eg. [OpenJDK](http://openjdk.java.net/))
-   [Opam](https://opam.ocaml.org/doc/Install.html), **important**: Ubuntu users prior to 15.04 **must** build from source, as the Ubuntu install for 14.10 and prior is broken.
    `opam repository` also requires `rsync`.
-   [Haskell Stack](https://docs.haskellstack.org/en/stable/install_and_upgrade/#installupgrade).
    Note that the version of the `stack` tool provided by your package manager might not be recent enough.
    Please follow installation instructions from the Haskell Stack website linked above.
-   [LLVM](https://llvm.org/) For building the LLVM backend.

On Ubuntu >= 15.04 (for example):

```sh
sudo apt install                                                    \
         autoconf curl flex gcc libffi-dev libmpfr-dev libtool llvm \
         maven opam openjdk-8-jdk pandoc pkg-config python3         \
         python-pygments python-recommonmark python-sphinx time     \
         zlib1g-dev
```

To upgrade `stack` (if needed):

```sh
stack upgrade
export PATH=$HOME/.local/bin:$PATH
```

The LLVM backend has additional dependencies

```
sudo apt install
         bison cmake clang-8 clang++-8 llvm-8 llvm-8-tools lld-8 \
         libboost-test-dev libgmp-dev libprocps-dev libyaml-dev  \
         libjemalloc-dev curl protobuf-compiler libprotobuf-dev
```

### Building

After installing the above dependencies, make sure the submodules are setup:

```sh
git submodule update --init --recursive
```

If you haven't already setup K's OCaml dependencies more recently than February 1, 2019, then you also need to setup the K OCaml dependencies:

```sh
./deps/k/k-distribution/src/main/scripts/bin/k-configure-opam-dev
```

**NOTE**: It may prove useful to first do `rm -rf ~/.opam` if you've setup K projcets in the past and are experiencing trouble with the newest opam libraries.
          This is a fairly destructive operation, and will break any other projects that depend on specific locally installed ocaml packages.

Similarly, you'll need to setup K's Rust dependencies:

```sh
./deps/k/llvm-backend/src/main/native/llvm-backend/install-rust
```

Install repository specific dependencies:

```sh
make deps
```

And then build the semantics:

```sh
make build
```

To only build specific backends, you can do `make build-java`, `make build-ocaml`, or `make build-haskell`.

### Media and documents

The `media/` directory contains presentations and reports about about KWasm.
The documents are named with an approximate date of presentation/submission, what type of document it is, and a brief contextual name, e.g., name of conference where it was held.

[GhostScript](https://www.ghostscript.com/) is a dependency for building documents of type `report`.

```sh
sudo apt install ghostscript
```

To build all documents in the media file:

```sh
make media
```

Testing
-------

The target `test` contains all the currently passing tests.

```sh
make test
```

Resources
---------

[WebAssembly]: <https://webassembly.github.io/spec/>
