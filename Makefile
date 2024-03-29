# Settings
# --------

BUILD_DIR := .build
DEFN_DIR  := $(BUILD_DIR)/defn
K_INCLUDE_DIR ?= $(CURDIR)

.PHONY: all                                                                \
        build build-llvm build-haskell build-wrc20                         \
        test test-execution test-simple test-prove                         \
        test-conformance test-conformance-parse test-conformance-supported \
        media presentations reports

all: build

# Building Definition
# -------------------

KOMPILE_OPTS         :=
LLVM_KOMPILE_OPTS    :=
HASKELL_KOMPILE_OPTS :=

tangle_selector := k

SOURCE_FILES       := data         \
                      kwasm-lemmas \
                      numeric      \
                      test         \
                      wasm         \
                      wasm-text    \
                      wrc20
EXTRA_SOURCE_FILES :=
ALL_SOURCE_FILES   := $(patsubst %, %.md, $(SOURCE_FILES)) $(EXTRA_SOURCE_FILES)

build: build-llvm build-haskell build-wrc20

ifneq (,$(RELEASE))
    KOMPILE_OPTS += -O2 --gen-glr-bison-parser
else
    KOMPILE_OPTS += --debug
endif

ifeq (,$(RELEASE))
    LLVM_KOMPILE_OPTS += -g
endif

KOMPILE_LLVM := kompile --backend llvm --md-selector "$(tangle_selector)" \
                $(KOMPILE_OPTS)                                           \
                $(addprefix -ccopt ,$(LLVM_KOMPILE_OPTS))

KOMPILE_HASKELL := kompile --backend haskell --md-selector "$(tangle_selector)" \
                   $(KOMPILE_OPTS)                                              \
                   $(HASKELL_KOMPILE_OPTS)                                      \
                   --warnings-to-errors

### LLVM

llvm_files         := $(ALL_SOURCE_FILES)
llvm_main_module   := WASM-TEST
llvm_syntax_module := $(llvm_main_module)-SYNTAX
llvm_main_file     := test
llvm_dir           := $(DEFN_DIR)/llvm/$(llvm_main_file)-kompiled
llvm_kompiled      := $(llvm_dir)/interpreter

build-llvm: $(llvm_kompiled)

$(llvm_kompiled): $(llvm_files)
	$(KOMPILE_LLVM) $(llvm_main_file).md      \
	    --output-definition $(llvm_dir) -I $(K_INCLUDE_DIR)  \
	    --main-module $(llvm_main_module)     \
	    --syntax-module $(llvm_syntax_module) \
	    --emit-json

### Haskell

haskell_files         := $(ALL_SOURCE_FILES)
haskell_main_module   := KWASM-LEMMAS
haskell_syntax_module := WASM-TEXT-SYNTAX
haskell_main_file     := kwasm-lemmas
haskell_dir           := $(DEFN_DIR)/haskell/$(haskell_main_file)-kompiled
haskell_kompiled      := $(haskell_dir)/definition.kore

build-haskell: $(haskell_kompiled)

$(haskell_kompiled): $(haskell_files)
	$(KOMPILE_HASKELL) $(haskell_main_file).md   \
	    --output-definition $(haskell_dir) -I $(K_INCLUDE_DIR)  \
	    --main-module $(haskell_main_module)     \
	    --syntax-module $(haskell_syntax_module)

### WRC-20 Verification

wrc20_files         := $(haskell_files) wrc20.md
wrc20_main_module   := WRC20-LEMMAS
wrc20_syntax_module := WASM-TEXT-SYNTAX
wrc20_main_file     := wrc20
wrc20_dir           := $(DEFN_DIR)/haskell/$(wrc20_main_file)-kompiled
wrc20_kompiled      := $(wrc20_dir)/definition.kore

build-wrc20: $(wrc20_kompiled)

$(wrc20_kompiled): $(wrc20_files)
	$(KOMPILE_HASKELL) $(wrc20_main_file).md   \
	    --output-definition $(wrc20_dir) -I $(K_INCLUDE_DIR)  \
	    --main-module $(wrc20_main_module)     \
	    --syntax-module $(wrc20_syntax_module)

# Testing
# -------

TEST  := ./kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space -R

TEST_CONCRETE_BACKEND := llvm
TEST_SYMBOLIC_BACKEND := haskell

test: test-execution test-prove

# Generic Test Harnesses

tests/%.run: tests/% $(llvm_kompiled)
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out tests/success-$(TEST_CONCRETE_BACKEND).out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out

tests/%.run-term: tests/% $(llvm_kompiled)
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	grep --after-context=2 "<instrs>" tests/$*.$(TEST_CONCRETE_BACKEND)-out > tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out-term tests/success-k.out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out-term

tests/%.parse: tests/% $(llvm_kompiled)
	$(TEST) kast --backend $(TEST_CONCRETE_BACKEND) $< kast > $@-out
	rm -rf $@-out

tests/%.prove: tests/% $(haskell_kompiled)
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< $(haskell_main_file)

tests/proofs/wrc20-spec.k.prove: tests/proofs/wrc20-spec.k $(wrc20_kompiled)
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< $(wrc20_main_file)

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

test-prove: $(proof_tests:=.prove)

# Analysis
# --------
json_build := $(haskell_dir)/parsed.json

$(json_build):
	$(MAKE) build-haskell -B KOMPILE_OPTS="--emit-json"

graph-imports: $(json_build)
	kpyk $(haskell_dir) graph-imports

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
