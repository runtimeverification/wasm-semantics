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
        defn defn-ocaml defn-haskell \
        build build-ocaml build-haskell \
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

java_dir:=$(defn_dir)/java
java_defn:=$(patsubst %, $(java_dir)/%, $(wasm_files))
java_kompiled:=$(java_dir)/test-kompiled/kore.txt

haskell_dir:=$(defn_dir)/haskell
haskell_defn:=$(patsubst %, $(haskell_dir)/%, $(wasm_files))
haskell_kompiled:=$(haskell_dir)/test-kompiled/kore.txt

# Tangle definition from *.md files

defn: defn-ocaml defn-java defn-haskell
defn-ocaml: $(ocaml_defn)
defn-java: $(java_defn)
defn-haskell: $(haskell_defn)

$(ocaml_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

$(java_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

$(haskell_dir)/%.k: %.md $(pandoc_tangle_submodule)/make.timestamp
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to $(tangler) --metadata=code:.k $< > $@

# Build definitions

build: build-ocaml build-java build-haskell
build-ocaml: $(ocaml_kompiled)
build-java: $(java_kompiled)
build-haskell: $(haskell_kompiled)

$(ocaml_kompiled): $(ocaml_defn)
	@echo "== kompile: $@"
	eval $$(opam config env)                                                          \
	    $(k_bin)/kompile -O3 --non-strict --backend ocaml                             \
	    --directory $(ocaml_dir) --main-module WASM-TEST --syntax-module WASM-TEST $<

$(java_kompiled): $(java_defn)
	@echo "== kompile: $@"
	eval $$(opam config env)                                                         \
	    $(k_bin)/kompile --backend java                                              \
	    --directory $(java_dir) --main-module WASM-TEST --syntax-module WASM-TEST $<

$(haskell_kompiled): $(haskell_defn)
	@echo "== kompile: $@"
	eval $$(opam config env)                                                            \
	    $(k_bin)/kompile --backend haskell                                              \
	    --directory $(haskell_dir) --main-module WASM-TEST --syntax-module WASM-TEST $<

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
