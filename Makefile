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

.PHONY: deps ocaml-deps \
        defn defn-ocaml \
        build build-ocaml \
        test test-simple \
        media

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

wasm_files:=test.k wasm.k data.k

ocaml_dir:=$(defn_dir)/ocaml
ocaml_defn:=$(patsubst %, $(ocaml_dir)/%, $(wasm_files))
ocaml_kompiled:=$(ocaml_dir)/test-kompiled/interpreter

# Tangle definition from *.md files

defn: defn-ocaml
defn-ocaml: $(ocaml_defn)

$(ocaml_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

# Build definitions

build: build-ocaml
build-ocaml: $(ocaml_kompiled)

$(ocaml_kompiled): $(ocaml_defn)
	@echo "== kompile: $@"
	eval $$(opam config env)                                                          \
	    $(k_bin)/kompile -O3 --non-strict --backend ocaml                             \
	    --directory $(ocaml_dir) --main-module WASM-TEST --syntax-module WASM-TEST $<

# Testing
# -------

TEST=./kwasm test-profile

tests/%.test: tests/%
	$(TEST) $<

test: test-simple

### Simple Tests

simple_tests:=$(wildcard tests/simple/*.wast)

test-simple: $(simple_tests:=.test)

# Presentation
# ------------

media: media/201803-ethcc/presentation.pdf

media/%/presentation.pdf: media/%/presentation.md
	cd media/$* \
		&& pandoc --from markdown --to beamer --output presentation.pdf presentation.md
