patch-build:
	patch -p1 <wasm.k.patch
	ktest --skip pdf test/config.xml
	patch -R -p1 <wasm.k.patch

# Tangle definition from *.md files

k_files:=wasm-syntax.k wasm.k
defn_files:=$(patsubst %, .build/defn/%, $(k_files))

defn: $(defn_files)

.build/defn/%.k: %.md
	@echo "==  tangle: $@"
	mkdir -p $(dir $@)
	pandoc --from markdown --to tangle.lua --metadata=code:k $< > $@
