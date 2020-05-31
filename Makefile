# Settings
# --------

BUILD_DIR := .build
DEPS_DIR  := deps
DEFN_DIR  := $(BUILD_DIR)/defn

K_SUBMODULE := $(DEPS_DIR)/k
ifneq (,$(wildcard deps/k/k-distribution/target/release/k/bin/*))
  K_RELEASE ?= $(abspath $(K_SUBMODULE)/k-distribution/target/release/k)
else
  K_RELEASE ?= $(dir $(shell which kompile))..
endif
K_BIN := $(K_RELEASE)/bin
K_LIB := $(K_RELEASE)/lib
export K_RELEASE

ifneq ($(RELEASE),)
    K_BUILD_TYPE := Release
else
    K_BUILD_TYPE := Debug
endif

PATH := $(K_BIN):$(PATH)
export PATH

PANDOC_TANGLE_SUBMODULE := $(DEPS_DIR)/pandoc-tangle
TANGLER                 := $(PANDOC_TANGLE_SUBMODULE)/tangle.lua
LUA_PATH                := $(PANDOC_TANGLE_SUBMODULE)/?.lua;;
export LUA_PATH

.PHONY: all clean deps                                                     \
        defn defn-llvm defn-haskell                                        \
        build build-llvm build-haskell                                     \
        test test-execution test-simple test-prove                         \
        test-prove-good test-prove-bad                                     \
        test-conformance test-conformance-parse test-conformance-supported \
        media presentations reports

all: build

clean:
	rm -rf $(BUILD_DIR)

# Build Dependencies (K Submodule)
# --------------------------------

deps: $(K_SUBMODULE)/make.timestamp $(TANGLER)

$(K_SUBMODULE)/make.timestamp:
	cd $(K_SUBMODULE) && mvn package -DskipTests -Dproject.build.type=$(K_BUILD_TYPE)
	touch $(K_SUBMODULE)/make.timestamp

# Building Definition
# -------------------

MAIN_MODULE        := WASM-TEST
MAIN_SYNTAX_MODULE := WASM-TEST-SYNTAX
MAIN_DEFN_FILE     := test

wasm_files := $(MAIN_DEFN_FILE).k test.k wasm-text.k wasm.k data.k numeric.k kwasm-lemmas.k wrc20.k

llvm_dir    := $(DEFN_DIR)/llvm
haskell_dir := $(DEFN_DIR)/haskell

llvm_defn    := $(patsubst %, $(llvm_dir)/%, $(wasm_files))
haskell_defn := $(patsubst %, $(haskell_dir)/%, $(wasm_files))

llvm_kompiled    := $(llvm_dir)/$(MAIN_DEFN_FILE)-kompiled/interpreter
haskell_kompiled := $(haskell_dir)/$(MAIN_DEFN_FILE)-kompiled/definition.kore

# Tangle definition from *.md files

defn: defn-haskell defn-llvm
defn-llvm: $(llvm_defn)
defn-haskell: $(haskell_defn)

$(llvm_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(haskell_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

# Build definitions

KOMPILE_OPTIONS :=

ifneq $(,$(RELEASE))
    KOMPILE_OPTIONS += -O3
else
    KOMPILE_OPTIONS += -ccopt -g
endif

build: build-llvm build-haskell
build-llvm:    $(llvm_kompiled)
build-haskell: $(haskell_kompiled)

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

# Testing
# -------

TEST  := ./kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space -R

TEST_CONCRETE_BACKEND := llvm
TEST_SYMBOLIC_BACKEND := haskell

KPROVE_MODULE := KWASM-LEMMAS

KPROVE_OPTIONS ?=

tests/proofs/functions-spec.k.prove: KPROVE_MODULE = FUNCTIONS-LEMMAS
tests/proofs/wrc20-spec.k.prove:     KPROVE_MODULE = WRC20-LEMMAS

test: test-execution test-prove

# Generic Test Harnesses

tests/%.run: tests/%
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out tests/success-$(TEST_CONCRETE_BACKEND).out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out

tests/%.run-term: tests/%
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	grep --after-context=2 "<k>" tests/$*.$(TEST_CONCRETE_BACKEND)-out > tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out-term tests/success-k.out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out-term

tests/%.parse: tests/%
	$(TEST) kast --backend $(TEST_CONCRETE_BACKEND) $< kast > $@-out
	rm -rf $@-out

tests/%.prove: tests/%
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< --format-failures --def-module $(KPROVE_MODULE) \
	$(KPROVE_OPTIONS)

tests/%.cannot-prove: tests/%
	-$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< --format-failures --def-module $(KPROVE_MODULE) --boundary-cells k > $<.out 2> $<.err-log
	$(CHECK) $<.out $<.expected
	rm -rf $<.err-log
	rm -rf $<.out

### Execution Tests

test-execution: test-simple

simple_tests         := $(wildcard tests/simple/*.wast)
simple_tests_failing := $(shell cat tests/failing.simple)
simple_tests_passing := $(filter-out $(simple_tests_failing), $(simple_tests))

test-simple: $(simple_tests_passing:=.run)

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
bad_proof_tests:=$(wildcard tests/bad-proofs/*-spec.k)
slow_proof_tests:=tests/proofs/loops-spec.k tests/proofs/wrc20-spec.k
quick_proof_tests:=$(filter-out $(slow_proof_tests), $(proof_tests))

test-prove-good: $(proof_tests:=.prove)
test-prove-bad:  $(bad_proof_tests:=.cannot-prove)

test-prove: test-prove-good test-prove-bad

# Presentation
# ------------

media: presentations reports

media/%.pdf: TO_FORMAT=beamer
presentations: $(patsubst %.md, %.pdf, $(wildcard media/*-presentation-*.md))

media/201903-report-chalmers.pdf: TO_FORMAT=latex
reports: media/201903-report-chalmers.pdf

media/%.pdf: media/%.md media/citations.md
	cat $^ | pandoc --from markdown-latex_macros --to $(TO_FORMAT) --filter pandoc-citeproc --output $@

media-clean:
	rm media/*.pdf
