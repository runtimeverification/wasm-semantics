# Settings
# --------

BUILD_DIR:=.build
DEPS_DIR:=deps
DEFN_DIR:=$(BUILD_DIR)/defn
K_SUBMODULE:=$(DEPS_DIR)/k
PANDOC_TANGLE_SUBMODULE:=$(DEPS_DIR)/pandoc-tangle
K_BIN:=$(K_SUBMODULE)/k-distribution/target/release/k/bin
TANGLER:=$(PANDOC_TANGLE_SUBMODULE)/tangle.lua

PATH:=$(K_BIN):$(PATH)
export PATH

LUA_PATH=$(PANDOC_TANGLE_SUBMODULE)/?.lua;;
export LUA_PATH

.PHONY: all clean \
        deps ocaml-deps haskell-deps \
        defn defn-ocaml defn-java defn-haskell defn-llvm \
        build build-ocaml defn-haskell build-haskell build-llvm \
        test test-execution test-simple test-prove test-klab-prove \
        test-conformance test-conformance-parse test-conformance-supported \
        media presentations reports

all: build

clean:
	rm -rf $(BUILD_DIR)
	git submodule update --init --recursive

# Build Dependencies (K Submodule)
# --------------------------------

deps: $(K_SUBMODULE)/make.timestamp $(PANDOC_TANGLE_SUBMODULE)/make.timestamp ocaml-deps

$(K_SUBMODULE)/make.timestamp:
	git submodule update --init --recursive
	cd $(K_SUBMODULE) && mvn package -DskipTests
	touch $(K_SUBMODULE)/make.timestamp

$(PANDOC_TANGLE_SUBMODULE)/make.timestamp:
	git submodule update --init -- $(PANDOC_TANGLE_SUBMODULE)
	touch $(PANDOC_TANGLE_SUBMODULE)/make.timestamp

ocaml-deps:
	eval $$(opam config env) \
	    opam install --yes mlgmp zarith uuidm

# Building Definition
# -------------------

wasm_files:=test.k wasm-text.k wasm.k data.k numeric.k kwasm-lemmas.k

ocaml_dir:=$(DEFN_DIR)/ocaml
ocaml_defn:=$(patsubst %, $(ocaml_dir)/%, $(wasm_files))
ocaml_kompiled:=$(ocaml_dir)/test-kompiled/interpreter

java_dir:=$(DEFN_DIR)/java
java_defn:=$(patsubst %, $(java_dir)/%, $(wasm_files))
java_kompiled:=$(java_dir)/test-kompiled/compiled.txt

haskell_dir:=$(DEFN_DIR)/haskell
haskell_defn:=$(patsubst %, $(haskell_dir)/%, $(wasm_files))
haskell_kompiled:=$(haskell_dir)/test-kompiled/definition.kore

llvm_dir:=$(DEFN_DIR)/llvm
llvm_defn:=$(patsubst %, $(llvm_dir)/%, $(wasm_files))
llvm_kompiled:=$(llvm_dir)/test-kompiled/interpreter

$(ocaml_dir):
	mkdir -p $@

$(java_dir):
	mkdir -p $@

$(haskell_dir):
	mkdir -p $@

$(llvm_dir):
	mkdir -p $@

# Tangle definition from *.md files

defn: defn-ocaml defn-java defn-haskell
defn-ocaml: $(ocaml_defn)
defn-java: $(java_defn)
defn-haskell: $(haskell_defn)
defn-llvm: $(llvm_defn)

$(ocaml_dir)/%.k: %.md $(PANDOC_TANGLE_SUBMODULE)/make.timestamp $(ocaml_dir)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(java_dir)/%.k: %.md $(PANDOC_TANGLE_SUBMODULE)/make.timestamp $(java_dir)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(haskell_dir)/%.k: %.md $(PANDOC_TANGLE_SUBMODULE)/make.timestamp $(haskell_dir)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(llvm_dir)/%.k: %.md $(PANDOC_TANGLE_SUBMODULE)/make.timestamp $(llvm_dir)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

# Build definitions

KOMPILE_OPTIONS :=

build: build-ocaml build-java build-haskell build-llvm
build-ocaml: $(ocaml_kompiled)
build-java: $(java_kompiled)
build-haskell: $(haskell_kompiled)
build-llvm: $(llvm_kompiled)

$(ocaml_kompiled): $(ocaml_defn)
	eval $$(opam config env)                                        \
	    kompile -O3 --non-strict --backend ocaml                    \
	    --directory $(ocaml_dir) -I $(ocaml_dir)                    \
	    --main-module WASM-TEST --syntax-module WASM-TEST-SYNTAX $< \
	    $(KOMPILE_OPTIONS)

$(java_kompiled): $(java_defn)
	kompile --backend java                                          \
	    --directory $(java_dir) -I $(java_dir)                      \
	    --main-module WASM-TEST --syntax-module WASM-TEST-SYNTAX $< \
	    $(KOMPILE_OPTIONS)

$(haskell_kompiled): $(haskell_defn)
	kompile --backend haskell                                       \
	    --directory $(haskell_dir) -I $(haskell_dir)                \
	    --main-module WASM-TEST --syntax-module WASM-TEST-SYNTAX $< \
	    $(KOMPILE_OPTIONS)

$(llvm_kompiled): $(llvm_defn)
	kompile --backend llvm                                          \
	    --directory $(llvm_dir) -I $(llvm_dir)                      \
	    --main-module WASM-TEST --syntax-module WASM-TEST-SYNTAX $< \
	    $(KOMPILE_OPTIONS)

# Testing
# -------

TEST  := ./kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space

TEST_CONCRETE_BACKEND       := llvm
TEST_FLOAT_CONCRETE_BACKEND := java
TEST_SYMBOLIC_BACKEND       := java

KPROVE_MODULE := KWASM-LEMMAS

tests/%/make.timestamp:
	git submodule update --init -- tests/$*
	touch $@

test: test-execution test-prove

# Generic Test Harnesses

tests/%.run: tests/%
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	$(CHECK) tests/success-$(TEST_CONCRETE_BACKEND).out tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out

tests/%.frun: tests/%
	$(TEST) run --backend $(TEST_FLOAT_CONCRETE_BACKEND) $< > tests/$*.$(TEST_FLOAT_CONCRETE_BACKEND)-out
	$(CHECK) tests/success-$(TEST_FLOAT_CONCRETE_BACKEND).out tests/$*.$(TEST_FLOAT_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_FLOAT_CONCRETE_BACKEND)-out

tests/%.run-term: tests/%
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	grep --after-context=2 "<k>" tests/$*.$(TEST_CONCRETE_BACKEND)-out > tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	$(CHECK) tests/success-k.out tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out-term

tests/%.parse: tests/%
	$(TEST) kast --backend $(TEST_CONCRETE_BACKEND) $< kast > $@-out
	rm -rf $@-out

tests/%.prove: tests/%
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< --format-failures --def-module $(KPROVE_MODULE) --boundary-cells	k

tests/%.klab-prove: tests/%
	$(TEST) klab-prove --backend $(TEST_SYMBOLIC_BACKEND) $< --format-failures --def-module $(KPROVE_MODULE)

### Execution Tests

test-execution: test-simple test-simple-float

simple_tests:=$(wildcard tests/simple/*.wast)

test-simple: $(simple_tests:=.run)

simple_tests-float:=$(wildcard tests/simple/float/*.wast)

test-simple-float: $(simple_tests-float:=.frun)

### Conformance Tests

conformance_tests:=$(wildcard tests/wasm-tests/test/core/*.wast)
unsupported_conformance_tests:=$(patsubst %, tests/wasm-tests/test/core/%, $(shell cat tests/conformance/unsupported-$(TEST_CONCRETE_BACKEND).txt))
unparseable_conformance_tests:=$(patsubst %, tests/wasm-tests/test/core/%, $(shell cat tests/conformance/unparseable.txt))
parseable_conformance_tests:=$(filter-out $(unparseable_conformance_tests), $(conformance_tests))
supported_conformance_tests:=$(filter-out $(unsupported_conformance_tests), $(parseable_conformance_tests))

test-conformance-parse: $(parseable_conformance_tests:=.parse)
test-conformance-supported: $(supported_conformance_tests:=.run-term)

test-conformance: test-conformance-parse test-conformance-supported

### Proof Tests

proof_tests:=$(wildcard tests/proofs/*-spec.k)
slow_proof_tests:=tests/proofs/loops-spec.k
quick_proof_tests:=$(filter-out $(slow_proof_tests), $(proof_tests))

test-prove: $(proof_tests:=.prove)

### KLab interactive

test-klab-prove: $(quick_proof_tests:=.klab-prove)

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

