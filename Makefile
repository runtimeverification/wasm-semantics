# Settings
# --------

BUILD_DIR := .build
DEPS_DIR  := deps
DEFN_DIR  := $(BUILD_DIR)/defn

K_SUBMODULE := $(DEPS_DIR)/k
K_RELEASE   := $(K_SUBMODULE)/k-distribution/target/release/k
K_BIN       := $(K_RELEASE)/bin
K_LIB       := $(K_RELEASE)/lib

PATH := $(K_BIN):$(PATH)
export PATH

PANDOC_TANGLE_SUBMODULE := $(DEPS_DIR)/pandoc-tangle
TANGLER                 := $(PANDOC_TANGLE_SUBMODULE)/tangle.lua
LUA_PATH                := $(PANDOC_TANGLE_SUBMODULE)/?.lua;;
export LUA_PATH

.PHONY: all clean                                                          \
        deps ocaml-deps haskell-deps                                       \
        defn defn-llvm defn-haskell defn-ocaml defn-java                   \
        build build-llvm build-haskell build-ocaml build-java              \
        test test-execution test-simple test-prove test-klab-prove         \
        test-conformance test-conformance-parse test-conformance-supported \
        media presentations reports

all: build

clean:
	rm -rf $(BUILD_DIR)
	git submodule update --init --recursive

# Build Dependencies (K Submodule)
# --------------------------------

deps: $(K_SUBMODULE)/make.timestamp $(TANGLER) ocaml-deps

$(K_SUBMODULE)/make.timestamp:
	git submodule update --init --recursive
	cd $(K_SUBMODULE) && mvn package -DskipTests
	touch $(K_SUBMODULE)/make.timestamp

$(TANGLER):
	git submodule update --init -- $(PANDOC_TANGLE_SUBMODULE)

ocaml-deps:
	eval $$(opam config env) \
	    opam install --yes mlgmp zarith uuidm

# Building Definition
# -------------------

MAIN_MODULE        := WASM-TEST
MAIN_SYNTAX_MODULE := WASM-TEST-SYNTAX
MAIN_DEFN_FILE     :=

wasm_files := $(MAIN_DEFN_FILE) test.k wasm-text.k wasm.k data.k numeric.k kwasm-lemmas.k

llvm_dir    := $(DEFN_DIR)/llvm
haskell_dir := $(DEFN_DIR)/haskell
ocaml_dir   := $(DEFN_DIR)/ocaml
java_dir    := $(DEFN_DIR)/java

llvm_defn    := $(patsubst %, $(llvm_dir)/%, $(wasm_files))
haskell_defn := $(patsubst %, $(haskell_dir)/%, $(wasm_files))
ocaml_defn   := $(patsubst %, $(ocaml_dir)/%, $(wasm_files))
java_defn    := $(patsubst %, $(java_dir)/%, $(wasm_files))

llvm_kompiled    := $(llvm_dir)/test-kompiled/interpreter
haskell_kompiled := $(haskell_dir)/test-kompiled/definition.kore
ocaml_kompiled   := $(ocaml_dir)/test-kompiled/interpreter
java_kompiled    := $(java_dir)/test-kompiled/compiled.txt

# Tangle definition from *.md files

llvm_tangle     := .k:not(.not-llvm)
not_llvm_tangle := .k:not(.llvm)

defn: defn-ocaml defn-java defn-haskell
defn-llvm: $(llvm_defn)
defn-haskell: $(haskell_defn)
defn-ocaml: $(ocaml_defn)
defn-java: $(java_defn)

$(llvm_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:"$(llvm_tangle)" $< > $@

$(haskell_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:"$(not_llvm_tangle)" $< > $@

$(ocaml_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:"$(not_llvm_tangle)" $< > $@

$(java_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:"$(not_llvm_tangle)" $< > $@

# Build definitions

KOMPILE_OPTIONS    :=

build: build-llvm build-haskell build-ocaml build-java
build-llvm: $(llvm_kompiled)
build-haskell: $(haskell_kompiled)
build-ocaml: $(ocaml_kompiled)
build-java: $(java_kompiled)

$(llvm_kompiled): $(llvm_defn)
	kompile --backend llvm                                                    \
	    --directory $(llvm_dir) -I $(llvm_dir)                                \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

$(haskell_kompiled): $(haskell_defn)
	kompile --backend haskell                                                 \
	    --directory $(haskell_dir) -I $(haskell_dir)                          \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

$(ocaml_kompiled): $(ocaml_defn)
	eval $$(opam config env)                                                  \
	    kompile -O3 --non-strict --backend ocaml                              \
	    --directory $(ocaml_dir) -I $(ocaml_dir)                              \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

$(java_kompiled): $(java_defn)
	kompile --backend java                                                    \
	    --directory $(java_dir) -I $(java_dir)                                \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
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

