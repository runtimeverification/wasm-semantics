FROM runtimeverificationinc/kframework-k:ubuntu-bionic-524fd49

RUN    sudo apt-get update         \
    && sudo apt-get upgrade --yes  \
    && sudo apt-get install --yes  \
                            pandoc
