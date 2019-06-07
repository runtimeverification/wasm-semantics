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

.PHONY: all clean \
        deps ocaml-deps haskell-deps \
        defn defn-ocaml defn-java defn-haskell \
        build build-ocaml defn-haskell build-haskell \
        test test-execution test-simple test-prove \
        media presentations reports

all: build

clean:
	rm -rf $(build_dir)
	git submodule update --init --recursive

# Build Dependencies (K Submodule)
# --------------------------------

deps: $(k_submodule)/make.timestamp $(pandoc_tangle_submodule)/make.timestamp ocaml-deps

$(k_submodule)/make.timestamp:
	git submodule update --init --recursive
	cd $(k_submodule) && mvn package -DskipTests -Dllvm.backend.skip
	touch $(k_submodule)/make.timestamp

$(pandoc_tangle_submodule)/make.timestamp:
	git submodule update --init -- $(pandoc_tangle_submodule)
	touch $(pandoc_tangle_submodule)/make.timestamp

ocaml-deps:
	eval $$(opam config env) \
	    opam install --yes mlgmp zarith uuidm

# Building Definition
# -------------------

wasm_files:=test.k wasm.k data.k kwasm-lemmas.k

ocaml_dir:=$(defn_dir)/ocaml
ocaml_defn:=$(patsubst %, $(ocaml_dir)/%, $(wasm_files))
ocaml_kompiled:=$(ocaml_dir)/test-kompiled/interpreter

java_dir:=$(defn_dir)/java
java_defn:=$(patsubst %, $(java_dir)/%, $(wasm_files))
java_kompiled:=$(java_dir)/test-kompiled/compiled.txt

haskell_dir:=$(defn_dir)/haskell
haskell_defn:=$(patsubst %, $(haskell_dir)/%, $(wasm_files))
haskell_kompiled:=$(haskell_dir)/test-kompiled/kore.txt

# Tangle definition from *.md files

defn: defn-ocaml defn-java defn-haskell
defn-ocaml: $(ocaml_defn)
defn-java: $(java_defn)
defn-haskell: $(haskell_defn)

$(ocaml_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

$(java_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

$(haskell_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

# Build definitions

build: build-ocaml build-java build-haskell
build-ocaml: $(ocaml_kompiled)
build-java: $(java_kompiled)
build-haskell: $(haskell_kompiled)

$(ocaml_kompiled): $(ocaml_defn)
	@echo "== kompile: $@"
	eval $$(opam config env)                                 \
	    $(k_bin)/kompile -O3 --non-strict --backend ocaml    \
	    --directory $(ocaml_dir) -I $(ocaml_dir)             \
	    --main-module WASM-TEST --syntax-module WASM-TEST $<

$(java_kompiled): $(java_defn)
	@echo "== kompile: $@"
	$(k_bin)/kompile --backend java                          \
	    --directory $(java_dir) -I $(java_dir)               \
	    --main-module WASM-TEST --syntax-module WASM-TEST $<

$(haskell_kompiled): $(haskell_defn)
	@echo "== kompile: $@"
	$(k_bin)/kompile --backend haskell                       \
	    --directory $(haskell_dir) -I $(haskell_dir)         \
	    --main-module WASM-TEST --syntax-module WASM-TEST $<

# Testing
# -------

TEST_CONCRETE_BACKEND=ocaml
TEST_SYMBOLIC_BACKEND=java
TEST=./kwasm

tests/%.test: tests/%
	 $(TEST) test --backend $(TEST_CONCRETE_BACKEND) $<

tests/%.parse: tests/%
	 $(TEST) kast --backend $(TEST_CONCRETE_BACKEND) $<

tests/%.prove: tests/%
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $<

test: test-execution test-prove

### Execution Tests

test-execution: test-simple

simple_tests:=$(wildcard tests/simple/*.wast)

test-simple: $(simple_tests:=.test)

### Conformance Tests

conformance_tests:=$(wildcard tests/wasm-tests/test/core/*.wast)

parse-conformance: $(conformance_tests:=.parse)

### Proof Tests

proof_tests:=$(wildcard tests/proofs/*-spec.k)

test-prove: $(proof_tests:=.prove)

# Presentation
# ------------

media: presentations reports

presentations: TO_FORMAT=beamer
presentations: media/201803-presentation-ethcc.pdf    \
               media/201903-presentation-edcon.pdf    \
               media/201903-presentation-chalmers.pdf \
               media/201906-presentation-wasm-on-blockchain.pdf

reports: TO_FORMAT=latex
reports: media/201903-report-chalmers.pdf

media/%.pdf: media/%.md media/citations.md
	cat $^ | pandoc --from markdown-latex_macros --to $(TO_FORMAT) --filter pandoc-citeproc --output $@

media-clean:
	rm media/*.pdf

