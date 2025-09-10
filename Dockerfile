ARG K_COMMIT
FROM runtimeverificationinc/kframework-k:ubuntu-jammy-${K_COMMIT}

RUN    apt-get update              \
    && apt-get upgrade --yes       \
    && apt-get install --yes       \
                       wabt

ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g $GROUP_ID user && useradd -m -u $USER_ID -s /bin/sh -g user user

USER user:user
WORKDIR /home/user

ARG UV_VERSION
RUN    curl -LsSf https://astral.sh/uv/$UV_VERSION/install.sh | sh \
    && uv --version
