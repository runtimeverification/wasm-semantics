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

.PHONY: build build-simple build-prove build-wrc20
build: pykwasm
	$(KDIST) -v build -j3

build-simple: pykwasm
	$(KDIST) -v build wasm-semantics.llvm -j3

build-prove: pykwasm
	$(KDIST) -v build wasm-semantics.kwasm-lemmas -j3

build-wrc20: pykwasm
	$(KDIST) -v build wasm-semantics.wrc20 -j3

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

## Depedencies

ULM_KRYPTO_DIR=$(ULM_DEP_DIR)/plugin
ULM_KRYPTO_LIB=krypto.a
ULM_KRYPTO_TARGET=$(ULM_LIB_DIR)/$(ULM_KRYPTO_LIB)

ULM_KEVM_DIR=$(ULM_DEP_DIR)/evm-semantics
ULM_KEVM_BUILD_DIR=$(ULM_KEVM_DIR)/libkevm
ULM_KEVM_BRANCH=ulm
ULM_KEVM_LIB=libkevm.so
ULM_KEVM_TARGET=$(ULM_LIB_DIR)/$(ULM_KEVM_LIB)

ULM_CLONE_DIR=$(ULM_DEP_DIR)/ulm
ULM_HOOKS_DIR=$(ULM_CLONE_DIR)/kllvm
ULM_HOOKS_SRC=ulm_kllvm.cpp ulm_hooks.cpp ulm_kllvm_c.cpp
ULM_HOOKS_LIB=libulmkllvm.so
ULM_HOOKS_TARGET=$(ULM_LIB_DIR)/$(ULM_HOOKS_LIB)

ULM_SRC_GETH=$(shell find "$(ULM_CLONE_DIR)/op-geth" -type f -a '(' -name '*.cpp' -or -name '*.h' -or -name '*.go' ')')
ULM_SRC_HOOKS=$(shell find "$(ULM_CLONE_DIR)/kllvm" -type f -a '(' -name '*.cpp' -or -name '*.h' -or -name '*.k' ')')

ULM_GETH_TARGET=$(ULM_BUILD_DIR)/geth

### ULM Crypto Plugin

$(ULM_KRYPTO_DIR)/.git:
	@mkdir -p $(ULM_DEP_DIR)
	cd $(ULM_DEP_DIR); \
	  git clone --depth 1 https://github.com/runtimeverification/blockchain-k-plugin plugin; \
	  cd plugin; \
	  git submodule update --init --recursive

$(ULM_KRYPTO_TARGET): | $(ULM_KRYPTO_DIR)/.git
	@mkdir -p $(ULM_LIB_DIR)
	$(if $(ULM_CXX), CXX=$(ULM_CXX)) $(MAKE) -C "$(ULM_KRYPTO_DIR)" build
	cp "$(ULM_KRYPTO_DIR)/build/krypto/lib/krypto.a" "$(ULM_LIB_DIR)"

.PHONY: ulm-krypto-build
ulm-krypto-build: $(ULM_KRYPTO_TARGET)

### ULM Hooks

$(ULM_CLONE_DIR)/.git:
	@mkdir -p $(ULM_DEP_DIR)
	cd $(ULM_DEP_DIR); \
	  git clone --depth 1 --branch contract-size-limits https://github.com/pi-squared-inc/ulm

$(ULM_HOOKS_TARGET): $(ULM_SRC_HOOKS) | $(ULM_CLONE_DIR)/.git
	@mkdir -p $(ULM_LIB_DIR)
	cd $(ULM_HOOKS_DIR); \
	  $(CXX) -shared -o "$(ULM_HOOKS_LIB)" $(ULM_HOOKS_SRC) -I "$(ULM_KF_INCLUDE_DIR)" -I "$(ULM_KF_INCLUDE_DIR)/kllvm" \
	    -fPIC -lcryptopp -lgmp -std=c++20 -Wall -Werror -g -fno-omit-frame-pointer -Wno-return-type-c-linkage $(CPPFLAGS)
	cp "$(ULM_HOOKS_DIR)/$(ULM_HOOKS_LIB)" "$(ULM_LIB_DIR)"

.PHONY: ulm-hooks-build
ulm-hooks-build: $(ULM_HOOKS_TARGET)

### KEVM

$(ULM_KEVM_DIR)/.git:
	@mkdir -p $(ULM_DEP_DIR)
	cd $(ULM_DEP_DIR); \
	  git clone --depth 1 https://github.com/pi-squared-inc/evm-semantics -b $(ULM_KEVM_BRANCH) evm-semantics

$(ULM_KEVM_TARGET): $(ULM_KRYPTO_TARGET) $(ULM_HOOKS_TARGET) | $(ULM_KEVM_DIR)/.git
	@mkdir -p $(ULM_LIB_DIR)
	kompile "$(ULM_KEVM_DIR)/kevm-pyk/src/kevm_pyk/kproj/evm-semantics/evm.md" \
	--main-module EVM \
	--syntax-module EVM \
	-I "$(ULM_KEVM_DIR)/kevm-pyk/src/kevm_pyk/kproj/evm-semantics" \
	-I "$(ULM_KRYPTO_DIR)" \
	-I "$(ULM_HOOKS_DIR)" \
	--md-selector 'k & ! symbolic' \
	--hook-namespaces 'JSON KRYPTO ULM' \
	--backend llvm \
	-O3 \
	-ccopt -std=c++20 \
	-ccopt -lssl \
	-ccopt -lcrypto \
	-ccopt -lsecp256k1 \
	-ccopt "$(ULM_LIB_DIR)/krypto.a" \
	-ccopt -Wno-deprecated-declarations \
	--output-definition "$(ULM_KEVM_BUILD_DIR)" \
	--type-inference-mode simplesub \
	--verbose \
	-ccopt -L"$(ULM_LIB_DIR)" \
	-ccopt -lulmkllvm \
	--llvm-kompile-type library \
	--llvm-kompile-output libkevm.so \
	-ccopt -g \
	--llvm-mutable-bytes \
	-ccopt "$(ULM_HOOKS_DIR)/lang/ulm_language_entry.cpp" \
	-ccopt -I"$(ULM_HOOKS_DIR)" \
	-ccopt -DULM_LANG_ID=kevm \
	--llvm-hidden-visibility \
	-ccopt -fPIC \
	-ccopt -shared
	cp "$(ULM_KEVM_BUILD_DIR)"/libkevm.so "$(ULM_LIB_DIR)"

.PHONY: kevm-build
kevm-build: $(ULM_KEVM_TARGET)

### ULM

$(ULM_GETH_TARGET): $(ULM_KEVM_TARGET) $(ULM_SRC_HOOKS) $(ULM_SRC_GETH) | $(ULM_CLONE_DIR)/.git
	cd $(ULM_CLONE_DIR)/op-geth && $(MAKE)
	cp $(ULM_CLONE_DIR)/op-geth/build/bin/geth $(ULM_BUILD_DIR)

.PHONY: ulm-build
ulm-build: $(ULM_GETH_TARGET)

### ULM Wasm

ULM_WASM_TARGET_NAME = ulm-wasm$(if $(ULM_TEST),-test,)

.PHONY: ulm-wasm
ulm-wasm: $(ULM_WASM_TARGET)

$(ULM_WASM_TARGET): $(ULM_KRYPTO_TARGET) $(ULM_HOOKS_TARGET) $(ULM_WASM_SRC) pykwasm
	$(KDIST) -v build wasm-semantics.$(ULM_WASM_TARGET_NAME) -j3
	$(eval ULM_WASM_DIR := $(shell $(KDIST) which wasm-semantics.$(ULM_WASM_TARGET_NAME)))
	kore-rich-header "$(ULM_WASM_DIR)/definition.kore" -o "$(ULM_WASM_DIR)/header.bin"
	$(if $(ULM_TEST),,cp "$(ULM_WASM_DIR)/$(ULM_WASM_LIB)" "$(ULM_LIB_DIR)";)
	$(if $(ULM_TEST),,cp "$(ULM_WASM_DIR)/header.bin"      "$(ULM_LIB_DIR)";)


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

ERC20_DIR=tests/ulm/erc20/rust
ERC20_SRC=$(shell find "$(ERC20_DIR)" -type f -a '(' -name '*.rs' -or -name '*.toml' -or -name '*.lock' ')')

ERC20_BUILD_DIR=build/erc20

ERC20_BIN_TARGET= $(ERC20_BUILD_DIR)/erc20.bin
ERC20_WASM_TARGET= $(ERC20_BUILD_DIR)/erc20.wasm

$(ERC20_BUILD_DIR):
	mkdir -p $@

$(ERC20_WASM_TARGET): $(ERC20_SRC) $(ERC20_BUILD_DIR)
	cd $(ERC20_DIR) && cargo build --target=wasm32-unknown-unknown --release
	cp $(ERC20_DIR)/target/wasm32-unknown-unknown/release/erc20.wasm $@

$(ERC20_BIN_TARGET): $(ERC20_WASM_TARGET) $(ULM_WASM_COMPILER_TARGET) $(ULM_WASM_TARGET)
	$(eval ULM_WASM_DIR := $(shell $(KDIST) which wasm-semantics.$(ULM_WASM_TARGET_NAME)))
	poetry -C pykwasm run wasm2kore $(ULM_WASM_DIR) $< $(ERC20_BUILD_DIR)/erc20.kore
	scripts/compile-contract $(ERC20_BUILD_DIR)/erc20.kore > $@

.PHONY: erc20-bin
erc20-bin: $(ERC20_BIN_TARGET)


# Testing
# -------

TEST  := $(POETRY_RUN) kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space -R

TEST_CONCRETE_BACKEND := llvm
TEST_SYMBOLIC_BACKEND := haskell

test: test-execution test-prove

# Generic Test Harnesses

tests/%.run: tests/% build-simple
	$(TEST) run $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out tests/success-$(TEST_CONCRETE_BACKEND).out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out

tests/%.run-term: tests/% build-simple
	$(TEST) run $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	grep --after-context=2 "<instrs>" tests/$*.$(TEST_CONCRETE_BACKEND)-out > tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out-term tests/success-k.out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out-term

tests/%.parse: tests/% build-simple
	K_OPTS='-Xmx16G -Xss512m' $(TEST) kast --output kore $< > $@-out
	rm -rf $@-out

tests/%.prove: tests/% build-prove
	$(eval SOURCE_DIR := $(shell $(KDIST) which wasm-semantics.source))
	$(TEST) prove $< kwasm-lemmas -I $(SOURCE_DIR)/wasm-semantics -w2e

tests/proofs/wrc20-spec.k.prove: tests/proofs/wrc20-spec.k build-wrc20
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
