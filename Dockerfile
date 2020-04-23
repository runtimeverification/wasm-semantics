FROM runtimeverificationinc/kframework-k:ubuntu-bionic-524fd49

RUN    sudo apt-get update           \
    && sudo apt-get upgrade --yes    \
    && sudo apt-get install --yes    \
                 autoconf            \
                 cmake               \
                 curl                \
                 libboost-test-dev   \
                 libcrypto++-dev     \
                 libffi-dev          \
                 libprocps-dev       \
                 libprotobuf-dev     \
                 libsecp256k1-dev    \
                 libssl-dev          \
                 libtool             \
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

ENV LD_LIBRARY_PATH=/usr/local/lib
ENV PATH=/home/user/.local/bin:/home/user/.cargo/bin:$PATH
