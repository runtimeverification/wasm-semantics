# Settings
# --------

build_dir:=.build
defn_dir:=$(build_dir)/defn
k_submodule:=$(build_dir)/k
pandoc_tangle_submodule:=$(build_dir)/pandoc-tangle
k_bin:=$(k_submodule)/k-distribution/target/release/k/bin
tangler:=$(pandoc_tangle_submodule)/tangle.lua

LUA_PATH=$(pandoc_tangle_submodule)/?.lua;;
export LUA_PATH

.PHONY: deps ocaml-deps \
        build build-wasm build-test \
        defn defn-wasm defn-test \
        test test-simple \
        media

all: build

clean:
	rm -rf $(build_dir)

# Build Dependencies (K Submodule)
# --------------------------------

deps: $(k_submodule)/make.timestamp $(pandoc_tangle_submodule)/make.timestamp ocaml-deps

$(k_submodule)/make.timestamp:
	git submodule update --init -- $(k_submodule)
	cd $(k_submodule) \
		&& mvn package -q -DskipTests
	touch $(k_submodule)/make.timestamp

$(pandoc_tangle_submodule)/make.timestamp:
	git submodule update --init -- $(pandoc_tangle_submodule)
	touch $(pandoc_tangle_submodule)/make.timestamp

ocaml-deps:
	opam init --quiet --no-setup
	opam repository add k "$(k_submodule)/k-distribution/target/release/k/lib/opam" \
		|| opam repository set-url k "$(k_submodule)/k-distribution/target/release/k/lib/opam"
	opam update
	opam switch 4.06.1+k
	eval $$(opam config env) \
	    opam install --yes mlgmp zarith uuidm

# Building Definition
# -------------------

# Tangle definition from *.md files

defn: defn-wasm defn-test

wasm_dir:=$(defn_dir)/wasm
wasm_files:=wasm.k data.k
defn_wasm_files:=$(patsubst %, $(wasm_dir)/%, $(wasm_files))
defn-wasm: $(defn_wasm_files)
$(wasm_dir)/%.k: %.md
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

test_dir:=$(defn_dir)/test
test_files:=test.k $(wasm_files)
defn_test_files:=$(patsubst %, $(test_dir)/%, $(test_files))
defn-test: $(defn_test_files)
$(test_dir)/%.k: %.md
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

# OCAML Backend

build: build-wasm build-test

build-wasm: $(wasm_dir)/wasm-kompiled/interpreter
$(wasm_dir)/wasm-kompiled/interpreter: $(defn_wasm_files)
	@echo "== kompile: $@"
	eval $$(opam config env) \
	$(k_bin)/kompile --gen-ml-only -O3 --non-strict \
					 --main-module WASM --syntax-module WASM $< --directory $(wasm_dir) \
		&& ocamlfind opt -c $(wasm_dir)/wasm-kompiled/constants.ml -package gmp -package zarith \
		&& ocamlfind opt -c -I $(wasm_dir)/wasm-kompiled \
		&& ocamlfind opt -a -o $(wasm_dir)/semantics.cmxa \
		&& ocamlfind remove wasm-semantics-plugin \
		&& ocamlfind install wasm-semantics-plugin META $(wasm_dir)/semantics.cmxa $(wasm_dir)/semantics.a \
		&& $(k_bin)/kompile --packages wasm-semantics-plugin -O3 --non-strict \
					 --main-module WASM --syntax-module WASM $< --directory $(wasm_dir) \
		&& cd $(wasm_dir)/wasm-kompiled \
		&& ocamlfind opt -o interpreter \
				-package gmp -package dynlink -package zarith -package str -package uuidm -package unix -package wasm-semantics-plugin \
				-linkpkg -inline 20 -nodynlink -O3 -linkall \
				constants.cmx prelude.cmx plugin.cmx parser.cmx lexer.cmx run.cmx interpreter.ml

build-test: $(test_dir)/test-kompiled/interpreter
$(test_dir)/test-kompiled/interpreter: $(defn_test_files)
	@echo "== kompile: $@"
	eval $$(opam config env) \
	$(k_bin)/kompile --gen-ml-only -O3 --non-strict \
					 --main-module WASM-TEST --syntax-module WASM-TEST $< --directory $(test_dir) \
		&& ocamlfind opt -c $(test_dir)/test-kompiled/constants.ml -package gmp -package zarith \
		&& ocamlfind opt -c -I $(test_dir)/test-kompiled \
		&& ocamlfind opt -a -o $(test_dir)/semantics.cmxa \
		&& ocamlfind remove test-semantics-plugin \
		&& ocamlfind install test-semantics-plugin META $(test_dir)/semantics.cmxa $(test_dir)/semantics.a \
		&& $(k_bin)/kompile --packages test-semantics-plugin -O3 --non-strict \
					 --main-module WASM-TEST --syntax-module WASM-TEST $< --directory $(test_dir) \
		&& cd $(test_dir)/test-kompiled \
		&& ocamlfind opt -o interpreter \
				-package gmp -package dynlink -package zarith -package str -package uuidm -package unix -package test-semantics-plugin \
				-linkpkg -inline 20 -nodynlink -O3 -linkall \
				constants.cmx prelude.cmx plugin.cmx parser.cmx lexer.cmx run.cmx interpreter.ml

# Testing
# -------

TEST=./kwasm test

tests/%.test: tests/%
	$(TEST) $<

test: test-simple

### Simple Tests

simple_tests:=$(wildcard tests/simple/*.wast)

test-simple: $(simple_tests:=.test)

# Presentation
# ------------

media: media/201803-ethcc/presentation.pdf

media/%/presentation.pdf: media/%/presentation.md
	cd media/$* \
		&& pandoc --from markdown --to beamer --output presentation.pdf presentation.md
