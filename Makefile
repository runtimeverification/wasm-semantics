all:
	patch -p1 <wasm.k.patch
	ktest --skip pdf test/config.xml
	patch -R -p1 <wasm.k.patch
