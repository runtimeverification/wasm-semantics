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

K_JAR := $(K_SUBMODULE)/k-distribution/target/release/k/lib/java/kernel-1.0-SNAPSHOT.jar

deps: $(K_JAR) $(TANGLER)

$(K_JAR):
	cd $(K_SUBMODULE) && mvn package -DskipTests -Dproject.build.type=$(K_BUILD_TYPE)

# Building Definition
# -------------------

KOMPILE_OPTS         :=
LLVM_KOMPILE_OPTS    :=
HASKELL_KOMPILE_OPTS :=

SOURCE_FILES       := data         \
                      kwasm-lemmas \
                      numeric      \
                      test         \
                      wasm         \
                      wasm-text    \
                      wrc20
EXTRA_SOURCE_FILES :=
ALL_SOURCE_FILES   := $(patsubst %, %.k, $(SOURCE_FILES) $(EXTRA_SOURCE_FILES))

defn:  defn-haskell defn-llvm
build: build-llvm build-haskell

ifneq (,$(RELEASE))
    KOMPILE_OPTS += -O2
endif

ifeq (,$(RELEASE))
    LLVM_KOMPILE_OPTS += -g
endif

KOMPILE_LLVM := kompile --debug --backend llvm            \
                $(KOMPILE_OPTS)                           \
                $(addprefix -ccopt ,$(LLVM_KOMPILE_OPTS))

KOMPILE_HASKELL := kompile --debug --backend haskell \
                   $(KOMPILE_OPTS)                   \
                   $(HASKELL_KOMPILE_OPTS)

### LLVM

llvm_dir           := $(DEFN_DIR)/llvm
llvm_files         := $(patsubst %, $(llvm_dir)/%, $(ALL_SOURCE_FILES))
llvm_main_module   := WASM-TEST
llvm_syntax_module := $(llvm_main_module)-SYNTAX
llvm_main_file     := test
llvm_kompiled      := $(llvm_dir)/$(llvm_main_file)-kompiled/interpreter

defn-llvm:  $(llvm_defn)
build-llvm: $(llvm_kompiled)

$(llvm_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(llvm_kompiled): $(llvm_files)
	$(KOMPILE_LLVM) $(llvm_dir)/$(llvm_main_file).k \
	    --directory $(llvm_dir) -I $(llvm_dir)      \
	    --main-module $(llvm_main_module)           \
	    --syntax-module $(llvm_syntax_module)

### Haskell

haskell_dir           := $(DEFN_DIR)/haskell
haskell_files         := $(patsubst %, $(haskell_dir)/%, $(ALL_SOURCE_FILES))
haskell_main_module   := WASM-TEST
haskell_syntax_module := $(haskell_main_module)-SYNTAX
haskell_main_file     := test
haskell_kompiled      := $(haskell_dir)/$(haskell_main_file)-kompiled/definition.kore

defn-haskell:  $(haskell_defn)
build-haskell: $(haskell_kompiled)

$(haskell_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(haskell_kompiled): $(haskell_files)
	$(KOMPILE_HASKELL) $(haskell_dir)/$(haskell_main_file).k  \
	    --directory $(haskell_dir) -I $(haskell_dir)          \
	    --main-module $(haskell_main_module)                  \
	    --syntax-module $(haskell_syntax_module)

# Testing
# -------

TEST  := ./kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space -R

TEST_CONCRETE_BACKEND := llvm
TEST_SYMBOLIC_BACKEND := haskell

KPROVE_MODULE := KWASM-LEMMAS
KPROVE_OPTS   :=

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
	$(KPROVE_OPTS)

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
