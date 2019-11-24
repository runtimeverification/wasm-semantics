# Settings
# --------

BUILD_DIR := .build
DEPS_DIR  := deps
DEFN_DIR  := $(BUILD_DIR)/defn

K_SUBMODULE := $(DEPS_DIR)/k
K_RELEASE   := $(K_SUBMODULE)/k-distribution/target/release/k
K_BIN       := $(K_RELEASE)/bin
K_LIB       := $(K_RELEASE)/lib

K_BUILD_TYPE := Debug

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
        test-prove-good test-prove-bad                                     \
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
	cd $(K_SUBMODULE) && mvn package -DskipTests -Dproject.build.type=$(K_BUILD_TYPE)
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
MAIN_DEFN_FILE     := test

wasm_files := $(MAIN_DEFN_FILE).k test.k wasm-text.k wasm.k data.k numeric.k kwasm-lemmas.k

llvm_dir    := $(DEFN_DIR)/llvm
haskell_dir := $(DEFN_DIR)/haskell
ocaml_dir   := $(DEFN_DIR)/ocaml
java_dir    := $(DEFN_DIR)/java

llvm_defn    := $(patsubst %, $(llvm_dir)/%, $(wasm_files))
haskell_defn := $(patsubst %, $(haskell_dir)/%, $(wasm_files))
ocaml_defn   := $(patsubst %, $(ocaml_dir)/%, $(wasm_files))
java_defn    := $(patsubst %, $(java_dir)/%, $(wasm_files))

llvm_kompiled    := $(llvm_dir)/$(MAIN_DEFN_FILE)-kompiled/interpreter
haskell_kompiled := $(haskell_dir)/$(MAIN_DEFN_FILE)-kompiled/definition.kore
ocaml_kompiled   := $(ocaml_dir)/$(MAIN_DEFN_FILE)-kompiled/interpreter
java_kompiled    := $(java_dir)/$(MAIN_DEFN_FILE)-kompiled/compiled.txt

# Tangle definition from *.md files

defn: defn-ocaml defn-java defn-haskell
defn-llvm: $(llvm_defn)
defn-haskell: $(haskell_defn)
defn-ocaml: $(ocaml_defn)
defn-java: $(java_defn)

$(llvm_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(haskell_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(ocaml_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

$(java_dir)/%.k: %.md $(TANGLER)
	@mkdir -p $(dir $@)
	pandoc --from markdown --to $(TANGLER) --metadata=code:.k $< > $@

# Build definitions

KOMPILE_OPTIONS    :=

build: build-llvm build-haskell build-ocaml build-java
build-llvm: $(llvm_kompiled)
build-haskell: $(haskell_kompiled)
build-ocaml: $(ocaml_kompiled)
build-java: $(java_kompiled)

$(llvm_kompiled): $(llvm_defn)
	$(K_BIN)/kompile --backend llvm                                           \
	    --directory $(llvm_dir) -I $(llvm_dir)                                \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

$(haskell_kompiled): $(haskell_defn)
	$(K_BIN)/kompile --backend haskell                                        \
	    --directory $(haskell_dir) -I $(haskell_dir)                          \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

$(ocaml_kompiled): $(ocaml_defn)
	eval $$(opam config env)                                                  \
	    $(K_BIN)/kompile -O3 --non-strict --backend ocaml                     \
	    --directory $(ocaml_dir) -I $(ocaml_dir)                              \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

$(java_kompiled): $(java_defn)
	$(K_BIN)/kompile --backend java                                           \
	    --directory $(java_dir) -I $(java_dir)                                \
	    --main-module $(MAIN_MODULE) --syntax-module $(MAIN_SYNTAX_MODULE) $< \
	    $(KOMPILE_OPTIONS)

# Testing
# -------

TEST  := ./kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space

TEST_CONCRETE_BACKEND       := llvm
TEST_FLOAT_CONCRETE_BACKEND := java
TEST_SYMBOLIC_BACKEND       := haskell

tests/proofs/memory-concrete-type-spec.k%prove: PROVE_OPTIONS=--z3-tactic "(or-else (using-params smt :random-seed 1))" --z3-impl-timeout 5000
tests/proofs/memory-concrete-type-spec.k%prove: KPROVE_MODULE=MEMORY-CONCRETE-TYPE-LEMMAS
tests/proofs/wrc20-spec.k.prove: TEST_SYMBOLIC_BACKEND=java
tests/proofs/wrc20-spec.k%prove: KPROVE_MODULE=WRC20-LEMMAS
tests/proofs/locals-spec.k.prove: TEST_SYMBOLIC_BACKEND=java

KPROVE_MODULE := KWASM-LEMMAS

PROVE_OPTIONS ?=

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
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< --format-failures --def-module $(KPROVE_MODULE) \
	$(PROVE_OPTIONS)

tests/%.cannot-prove: tests/%
	-$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< --format-failures --def-module $(KPROVE_MODULE) --boundary-cells k > $<.out 2> $<.err-log
	$(CHECK) $<.expected $<.out
	rm -rf $<.err-log
	rm -rf $<.out

tests/%.klab-prove: tests/%
	$(TEST) klab-prove --backend java $< --format-failures --def-module $(KPROVE_MODULE) \
	$(PROVE_OPTIONS)

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
bad_proof_tests:=$(wildcard tests/bad-proofs/*-spec.k)
slow_proof_tests:=tests/proofs/loops-spec.k tests/proofs/wrc20-spec.k
quick_proof_tests:=$(filter-out $(slow_proof_tests), $(proof_tests))

test-prove-good: $(proof_tests:=.prove)
test-prove-bad:  $(bad_proof_tests:=.cannot-prove)

test-prove: test-prove-good test-prove-bad

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

blogs: TO_FORMAT=latex
blogs: media/201912-dlab-reverse-bytes-blog.pdf

media/%.pdf: media/%.md media/citations.md
	cat $^ | pandoc --from markdown-latex_macros --to $(TO_FORMAT) --filter pandoc-citeproc --output $@

media-clean:
	rm media/*.pdf

