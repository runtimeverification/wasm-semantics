.PHONY: all                                                                \
        test test-execution test-simple test-prove                         \
        test-conformance test-conformance-parse test-conformance-supported \
        media presentations reports


all: build


# Building Definition
# -------------------

POETRY := poetry -C pykwasm

.PHONY: pykwasm
pykwasm:
	$(POETRY) install

.PHONY: build
build: pykwasm
	$(POETRY) run kdist -v build -j3

.PHONY: clean
clean: pykwasm
	$(POETRY) run kdist clean


# Testing
# -------

TEST  := $(POETRY) run -- kwasm
CHECK := git --no-pager diff --no-index --ignore-all-space -R

TEST_CONCRETE_BACKEND := llvm
TEST_SYMBOLIC_BACKEND := haskell

test: test-execution test-prove

# Generic Test Harnesses

tests/%.run: tests/%
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out tests/success-$(TEST_CONCRETE_BACKEND).out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out

tests/%.run-term: tests/%
	$(TEST) run --backend $(TEST_CONCRETE_BACKEND) $< > tests/$*.$(TEST_CONCRETE_BACKEND)-out
	grep --after-context=2 "<instrs>" tests/$*.$(TEST_CONCRETE_BACKEND)-out > tests/$*.$(TEST_CONCRETE_BACKEND)-out-term
	$(CHECK) tests/$*.$(TEST_CONCRETE_BACKEND)-out-term tests/success-k.out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out
	rm -rf tests/$*.$(TEST_CONCRETE_BACKEND)-out-term

tests/%.parse: tests/%
	$(TEST) kast --backend $(TEST_CONCRETE_BACKEND) $< kast > $@-out
	rm -rf $@-out

SOURCE_DIR := pykwasm/src/pykwasm/kdist/wasm-semantics

tests/%.prove: tests/%
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< kwasm-lemmas -I $(SOURCE_DIR) -w2e

tests/proofs/wrc20-spec.k.prove: tests/proofs/wrc20-spec.k
	$(TEST) prove --backend $(TEST_SYMBOLIC_BACKEND) $< wrc20 -I $(SOURCE_DIR) -w2e

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
