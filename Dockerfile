FROM runtimeverificationinc/ubuntu:bionic

RUN    apt-get update           \
    && apt-get upgrade --yes    \
    && apt-get install --yes    \
            autoconf            \
            bison               \
            clang-8             \
            cmake               \
            curl                \
            flex                \
            gcc                 \
            libboost-test-dev   \
            libcrypto++-dev     \
            libffi-dev          \
            libjemalloc-dev     \
            libmpfr-dev         \
            libprocps-dev       \
            libprotobuf-dev     \
            libsecp256k1-dev    \
            libssl-dev          \
            libtool             \
            libyaml-dev         \
            libz3-dev           \
            lld-8               \
            llvm-8-tools        \
            make                \
            maven               \
            netcat-openbsd      \
            openjdk-11-jdk      \
            pandoc              \
            pkg-config          \
            protobuf-compiler   \
            python3             \
            python-pygments     \
            python-recommonmark \
            python-sphinx       \
            rapidjson-dev       \
            time                \
            zlib1g-dev

RUN    git clone 'https://github.com/z3prover/z3' --branch=z3-4.8.6 \
    && cd z3                                                        \
    && python scripts/mk_make.py                                    \
    && cd build                                                     \
    && make -j8                                                     \
    && make install                                                 \
    && cd ../..                                                     \
    && rm -rf z3

ADD deps/k/haskell-backend/src/main/native/haskell-backend/scripts/install-stack.sh /.install-stack/
RUN /.install-stack/install-stack.sh

USER user:user

ADD --chown=user:user deps/k/haskell-backend/src/main/native/haskell-backend/stack.yaml /home/user/.tmp-haskell/
ADD --chown=user:user deps/k/haskell-backend/src/main/native/haskell-backend/kore/package.yaml /home/user/.tmp-haskell/kore/
RUN    cd /home/user/.tmp-haskell \
    && stack build --only-snapshot

ENV LD_LIBRARY_PATH=/usr/local/lib
ENV PATH=/home/user/.local/bin:/home/user/.cargo/bin:$PATH
