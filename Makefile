patch-build:
	patch -p1 <wasm.k.patch
	ktest --skip pdf test/config.xml
	patch -R -p1 <wasm.k.patch

# Build Dependencies (K Submodule)
# --------------------------------

K_SUBMODULE=$(CURDIR)/.build/k
BUILD_LOCAL=$(CURDIR)/.build/local
PKG_CONFIG_LOCAL=$(BUILD_LOCAL)/lib/pkgconfig

deps: $(K_SUBMODULE)/make.timestamp ocaml-deps

$(K_SUBMODULE)/make.timestamp:
	git submodule update --init -- $(K_SUBMODULE)
	cd $(K_SUBMODULE) \
		&& mvn package -q -DskipTests
	touch $(K_SUBMODULE)/make.timestamp

ocaml-deps:
	opam init --quiet --no-setup
	opam repository add k "$(K_SUBMODULE)/k-distribution/target/release/k/lib/opam" \
		|| opam repository set-url k "$(K_SUBMODULE)/k-distribution/target/release/k/lib/opam"
	opam update
	opam switch 4.03.0+k
	export PKG_CONFIG_PATH=$(PKG_CONFIG_LOCAL) ; \
	opam install --yes mlgmp zarith uuidm

K_BIN=$(K_SUBMODULE)/k-distribution/target/release/k/bin

# Tangle definition from *.md files

k_files:=wasm-syntax.k wasm.k
defn_files:=$(patsubst %, .build/defn/%, $(k_files))

defn: $(defn_files)

.build/defn/%.k: %.md
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to tangle.lua --metadata=code:k $< > $@
