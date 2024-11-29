erc20.rust.wat: rust/src/*.rs rust/Cargo.toml
	cd rust && cargo build --target=wasm32-unknown-unknown
	pwd
	wasm2wat rust/target/wasm32-unknown-unknown/debug/erc20.wasm -o $@
