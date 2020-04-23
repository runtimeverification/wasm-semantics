ARG K_COMMIT
FROM runtimeverificationinc/kframework-k:ubuntu-bionic-${K_COMMIT}

RUN    sudo apt-get update         \
    && sudo apt-get upgrade --yes  \
    && sudo apt-get install --yes  \
                            pandoc
