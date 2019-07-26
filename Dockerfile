FROM runtimeverificationinc/ubuntu:bionic

RUN    apt update                                                            \
    && apt upgrade --yes                                                     \
    && apt install --yes                                                     \
        autoconf curl flex gcc libffi-dev libmpfr-dev libtool libz3-dev make \
        maven opam openjdk-8-jdk pandoc pkg-config python3 python-pygments   \
        python-recommonmark python-sphinx time zlib1g-dev z3

RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

RUN curl -sSL https://get.haskellstack.org/ | sh

USER user:user

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain 1.28.0

ADD deps/k/k-distribution/src/main/scripts/bin/k-configure-opam-dev deps/k/k-distribution/src/main/scripts/bin/k-configure-opam-common /home/user/.tmp-opam/bin/
ADD deps/k/k-distribution/src/main/scripts/lib/opam  /home/user/.tmp-opam/lib/opam/
RUN    cd /home/user \
    && ./.tmp-opam/bin/k-configure-opam-dev

ADD --chown=user:user deps/k/haskell-backend/src/main/native/haskell-backend/stack.yaml /home/user/.tmp-haskell/
ADD --chown=user:user deps/k/haskell-backend/src/main/native/haskell-backend/kore/package.yaml /home/user/.tmp-haskell/kore/
RUN    cd /home/user/.tmp-haskell \
    && stack build --only-snapshot --test --bench --no-haddock-deps --haddock --library-profiling
