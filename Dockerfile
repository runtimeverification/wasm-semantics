FROM runtimeverificationinc/kframework-k:ubuntu-bionic-524fd49

RUN    sudo apt-get update         \
    && sudo apt-get upgrade --yes  \
    && sudo apt-get install --yes  \
                            pandoc

ENV LD_LIBRARY_PATH=/usr/local/lib
ENV PATH=/home/user/.local/bin:/home/user/.cargo/bin:$PATH
