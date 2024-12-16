#!/bin/bash
LOC_FLAG="-Zlocation-detail=none" # removes debugging info from binary
FMT_FLAG="-Zfmt-debug=none"       # removes formatter code from binary
# the last two lines build stdlib for target with minimal panic handling and optimized for size
RUSTFLAGS="$LOC_FLAG $FMT_FLAG" cargo +nightly build --release --target wasm32-unknown-unknown \
-Z build-std=std,panic_abort                                                                   \
-Z build-std-features="optimize_for_size,panic_immediate_abort"
