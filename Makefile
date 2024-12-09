.PHONY: all                                                                \
        test test-execution test-simple test-prove                         \
        test-conformance test-conformance-parse test-conformance-supported \
        media presentations reports


all: build


# Building Definition
# -------------------

ifneq ($(NIX),1)
POETRY     := poetry -C pykwasm
POETRY_RUN := $(POETRY) run --
KDIST      := $(POETRY_RUN) kdist
endif

.PHONY: pykwasm
pykwasm:
	$(POETRY) install

.PHONY: build
build: pykwasm
	$(KDIST) -v build -j3

.PHONY: clean
clean: pykwasm
	$(KDIST) clean


# Building ULM-integrated Definition
# ----------------------------------

ULM_BUILD_DIR=./build
ULM_LIB_DIR=$(ULM_BUILD_DIR)/lib
ULM_DEP_DIR=$(ULM_BUILD_DIR)/deps
ULM_CXX=$(shell [ $(origin CXX) != default ] && echo $(CXX) )
ULM_KF_INCLUDE_DIR=$(shell dirname "`which llvm-kompile`")/../include

ULM_WASM_DIR=$(ULM_BUILD_DIR)/wasm
ULM_WASM_SRC_DIR=pykwasm/src/pykwasm/kdist/wasm-semantics
ULM_WASM_LIB=libkwasm.so
ULM_WASM_BIN=interpreter
ULM_WASM_TARGET=$(ULM_LIB_DIR)/$(ULM_WASM_LIB)
ULM_WASM_MAIN=$(ULM_WASM_SRC_DIR)/ulm-wasm.md
ULM_WASM_SRC=$(wildcard $(ULM_WASM_SRC_DIR)/*.md $(ULM_WASM_SRC_DIR)/data/*.k)

ULM_WASM_COMPILER_TARGET=$(ULM_BUILD_DIR)/ulm-contract-compiler

ULM_KRYPTO_DIR=$(ULM_DEP_DIR)/plugin
ULM_KRYPTO_LIB=krypto.a
ULM_KRYPTO_TARGET=$(ULM_LIB_DIR)/$(ULM_KRYPTO_LIB)

ULM_HOOKS_CLONE_DIR=$(ULM_DEP_DIR)/ulm
ULM_HOOKS_DIR=$(ULM_HOOKS_CLONE_DIR)/kllvm
ULM_HOOKS_SRC=ulm_kllvm.cpp ulm_hooks.cpp ulm_kllvm_c.cpp
ULM_HOOKS_LIB=libulmkllvm.so
ULM_HOOKS_TARGET=$(ULM_LIB_DIR)/$(ULM_HOOKS_LIB)

### ULM Crypto Plugin

$(ULM_KRYPTO_DIR)/.git:
	@mkdir -p $(ULM_DEP_DIR)
	cd $(ULM_DEP_DIR); \
	  git clone --depth 1 https://github.com/runtimeverification/blockchain-k-plugin plugin; \
	  cd plugin; \
	  git submodule update --init --recursive

$(ULM_KRYPTO_TARGET): | $(ULM_KRYPTO_DIR)/.git
	@mkdir -p $(ULM_LIB_DIR)
	$(if $(ULM_CXX), CXX=$(ULM_CXX)) make -C "$(ULM_KRYPTO_DIR)" build
	cp "$(ULM_KRYPTO_DIR)/build/krypto/lib/krypto.a" "$(ULM_LIB_DIR)"

.PHONY: ulm-krypto-build
ulm-krypto-build: $(ULM_KRYPTO_TARGET)

### ULM Hooks

$(ULM_HOOKS_CLONE_DIR)/.git:
	@mkdir -p $(ULM_DEP_DIR)
	cd $(ULM_DEP_DIR); \
	  git clone --depth 1 https://github.com/pi-squared-inc/ulm

$(ULM_HOOKS_TARGET): | $(ULM_HOOKS_CLONE_DIR)/.git
	@mkdir -p $(ULM_LIB_DIR)
	cd $(ULM_HOOKS_DIR); \
	  $(CXX) -shared -o "$(ULM_HOOKS_LIB)" $(ULM_HOOKS_SRC) -I "$(ULM_KF_INCLUDE_DIR)" -I "$(ULM_KF_INCLUDE_DIR)/kllvm" \
	    -fPIC -lcryptopp -lgmp -std=c++20 -Wall -Werror -g -fno-omit-frame-pointer -Wno-return-type-c-linkage $(CPPFLAGS)
	cp "$(ULM_HOOKS_DIR)/$(ULM_HOOKS_LIB)" "$(ULM_LIB_DIR)"

.PHONY: ulm-hooks-build
ulm-hooks-build: $(ULM_HOOKS_TARGET)

### ULM Wasm

ULM_WASM_TYPE = $(if $(ULM_TEST),main,library)
ULM_WASM_OUT  = $(if $(ULM_TEST),$(ULM_WASM_BIN),$(ULM_WASM_LIB))
ULM_WASM_SEL  = $(if $(ULM_TEST),k|local,k|remote)
ULM_LIB_FLAGS = $(if $(ULM_TEST),,-ccopt -L"$(ULM_LIB_DIR)" -ccopt -lulmkllvm -ccopt -shared -ccopt -fPIC -ccopt "$(ULM_HOOKS_DIR)/lang/ulm_language_entry.cpp")
ULM_HOOK_NMSP = $(if $(ULM_TEST),,ULM)

$(ULM_WASM_TARGET): $(ULM_KRYPTO_TARGET) $(ULM_HOOKS_TARGET) $(ULM_WASM_SRC)
	kompile \
	  --hook-namespaces 'KRYPTO $(ULM_HOOK_NMSP)' \
	  $(if $(DEBUG),-ccopt -O0) \
	  -ccopt -g \
	  -ccopt -std=c++20 \
	  -ccopt -lcrypto \
	  -ccopt -lsecp256k1 \
	  -ccopt -lssl \
	  -ccopt "$(ULM_KRYPTO_TARGET)" \
	  $(ULM_LIB_FLAGS) \
	  -ccopt -I"$(ULM_HOOKS_DIR)" \
	  -ccopt -DULM_LANG_ID=wasm \
	  --llvm-hidden-visibility \
	  --llvm-kompile-type $(ULM_WASM_TYPE) \
	  --llvm-kompile-output "$(ULM_WASM_OUT)" \
	  -O2 \
	  -I "$(ULM_HOOKS_DIR)" \
	  -I "$(ULM_KRYPTO_DIR)/plugin" \
	  -v \
	  $(ULM_WASM_MAIN) \
	  --md-selector "$(ULM_WASM_SEL)" \
	  --main-module ULM-WASM \
	  --syntax-module ULM-WASM-SYNTAX \
	  --emit-json \
	  $(if $(DEBUG),--debug) \
	  -o $(ULM_WASM_DIR)
	$(if $(ULM_TEST),,cp "$(ULM_WASM_DIR)/$(ULM_WASM_OUT)" "$(ULM_LIB_DIR)")

.PHONY: ulm-wasm
ulm-wasm: $(ULM_WASM_TARGET)

### ULM Wasm Contract Compiler

$(ULM_WASM_COMPILER_TARGET): $(ULM_WASM_TARGET)
	$(CXX) "$(ULM_HOOKS_DIR)/emit_contract_bytes.cpp" \
	  -I "$(ULM_KF_INCLUDE_DIR)" \
	  -I "$(ULM_KF_INCLUDE_DIR)/kllvm" \
	  -std=c++20 \
	  -DULM_LANG_ID=wasm \
	  -Wno-return-type-c-linkage \
	  -L"$(ULM_LIB_DIR)" \
	  -lulmkllvm \
	  -lkwasm \
	  -o "$(ULM_WASM_COMPILER_TARGET)"

.PHONY: ulm-contract-compiler
ulm-contract-compiler: $(ULM_WASM_COMPILER_TARGET)

# Testing
# -------

TEST  := $(POETRY_RUN) kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space -R

TEST_CONCRETE_BACKEND := llvm
TEST_SYMBOLIC_BACKEND := haskell

test: test-execution test-prove

# Generic Test Harnesses

tests/%.run: tests/%
	$(TEST) run $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out tests/success-$(TEST_CONCRETE_BACKEND).out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out

tests/%.run-term: tests/%
	$(TEST) run $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	grep --after-context=2 "<instrs>" tests/$*.$(TEST_CONCRETE_BACKEND)-out > tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out-term tests/success-k.out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out-term

tests/%.parse: tests/%
	K_OPTS='-Xmx16G -Xss512m' $(TEST) kast --output kore $< > $@-out
	rm -rf $@-out

tests/%.prove: tests/%
	$(eval SOURCE_DIR := $(shell $(KDIST) which wasm-semantics.source))
	$(TEST) prove $< kwasm-lemmas -I $(SOURCE_DIR)/wasm-semantics -w2e

tests/proofs/wrc20-spec.k.prove: tests/proofs/wrc20-spec.k
	$(eval SOURCE_DIR := $(shell $(KDIST) which wasm-semantics.source))
	$(TEST) prove $< wrc20 -I $(SOURCE_DIR)/wasm-semantics -w2e --haskell-backend-command "kore-exec --smt-timeout 500"

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

### Rust tests

rust-tests: erc20-rust-tests
.PHONY: rust-tests

erc20-rust-tests: tests/ulm/erc20/rust/src/*.rs tests/ulm/erc20/rust/Cargo.*
	cd tests/ulm/erc20/rust && RUST_BACKTRACE=1 cargo test
.PHONY: erc20-rust-tests

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
