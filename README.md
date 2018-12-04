branch: pr

KWasm: Semantics of WebAssembly in K
====================================

This repository presents a prototype formal semantics of [WebAssembly].
Currently only rudimentary opcodes are supported, including simple arithmetic and stack operations.

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

On Ubuntu >= 15.04 (for example):

```sh
sudo apt install                                                          \
         autoconf curl flex gcc libffi-dev libmpfr-dev libtool make maven \
         opam openjdk-8-jdk pandoc pkg-config python3 python-pygments     \
         python-recommonmark python-sphinx time zlib1g-dev
```

To upgrade `stack` (if needed):

```sh
stack upgrade
export PATH=$HOME/.local/bin:$PATH
```

### Building

After installing the above dependencies, make sure the submodules are setup:

```sh
git submodule update --init --recursive
```

If you haven't already setup K's OCaml dependencies more recently than February 1, 2019, then you also need to setup the K OCaml dependencies:

```sh
./.build/k/k-distribution/src/main/scripts/bin/k-configure-opam-dev
```

**NOTE**: It may prove useful to first do `rm -rf ~/.opam` if you've setup K projcets in the past and are experiencing trouble with the newest opam libraries.
          This is a fairly destructive operation, and will break any other projects that depend on specific locally installed ocaml packages.

Finally, you can install repository specific dependencies and build the semantics:

```sh
make deps
make build
```

To only build specific backends, you can do `make build-java`, `make build-ocaml`, or `make build-haskell`.

This Repository
---------------

### Semantics Layout

The following files constitute the KWasm semantics:

-   [data.md](data.md) provides the (functional) data of WebAssembly (basic types, type constructors, and values).
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

Run the same file as a test:

```sh
./kwasm test tests/simple/arithmetic.wast
```

To run proofs, you can similarly use `./kwasm`.
For example, to prove the specification `tests/proofs/simple-arithmetic-spec.k`:

```sh
./kwasm prove tests/proofs/simple-arithmetic-spec.k
```

You can optionally override the default backend using the `--backend BACKEND` flag:

```sh
./kwasm run   --backend java    tests/simple/arithmetic.wast
./kwasm prove --backend haskell tests/proofs/simple-arithmetic-spec.k
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
