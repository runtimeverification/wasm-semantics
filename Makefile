.PHONY: build deps ocaml-deps defn

# patch-build:
#	 patch -p1 <wasm.k.patch
#	 ktest --skip pdf test/config.xml
#	 patch -R -p1 <wasm.k.patch

build: .build/defn/wasm-kompiled/interpreter

# Build Dependencies (K Submodule)
# --------------------------------

K_SUBMODULE=$(CURDIR)/.build/k
BUILD_LOCAL=$(CURDIR)/.build/local
PKG_CONFIG_LOCAL=$(BUILD_LOCAL)/lib/pkgconfig

deps: $(K_SUBMODULE)/make.timestamp ocaml-deps

$(K_SUBMODULE)/make.timestamp:
	git submodule update --init -- $(K_SUBMODULE)
	cd $(K_SUBMODULE) \
		&& mvn package -q -DskipTests
	touch $(K_SUBMODULE)/make.timestamp

ocaml-deps:
	opam init --quiet --no-setup
	opam repository add k "$(K_SUBMODULE)/k-distribution/target/release/k/lib/opam" \
		|| opam repository set-url k "$(K_SUBMODULE)/k-distribution/target/release/k/lib/opam"
	opam update
	opam switch 4.03.0+k
	export PKG_CONFIG_PATH=$(PKG_CONFIG_LOCAL) ; \
	opam install --yes mlgmp zarith uuidm

K_BIN=$(K_SUBMODULE)/k-distribution/target/release/k/bin

# Tangle definition from *.md files

k_files:=wasm.k wasm-syntax.k
defn_files:=$(patsubst %, .build/defn/%, $(k_files))

defn: $(defn_files)

.build/defn/%.k: %.md
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to tangle.lua --metadata=code:k $< > $@

# OCAML Backend

.build/defn/wasm-kompiled/interpreter: $(defn_files) deps
	@echo "== kompile: $@"
	eval $(shell opam config env) \
	$(K_BIN)/kompile --debug --main-module WASM \
					--syntax-module WASM $< --directory .build/defn \
					--gen-ml-only -O3 --non-strict
#; \
#	ocamlfind opt -c .build/ocaml/wasm-kompiled/constants.ml -package gmp -package zarith; \
#	ocamlfind opt -c -I .build/ocaml/wasm-kompiled ; \
#	ocamlfind opt -a -o semantics.cmxa; \
#	ocamlfind remove wasm-semantics-plugin; \
#	ocamlfind install wasm-semantics-plugin META semantics.cmxa semantics.a KRYPTO.cmi KRYPTO.cmx; \
#	$(K_BIN)/kompile --debug --main-module WASM \
#					--syntax-module WASM $< --directory .build/defn \
#					--packages wasm-semantics-plugin -O3 --non-strict; \
#	cd .build/ocaml/driver-kompiled && ocamlfind opt -o interpreter constants.cmx prelude.cmx plugin.cmx parser.cmx lexer.cmx run.cmx interpreter.ml -package gmp -package dynlink -package zarith -package str -package uuidm -package unix -package wasm-semantics-plugin -linkpkg -inline 20 -nodynlink -O3 -linkall
