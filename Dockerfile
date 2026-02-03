FROM rust:slim-bookworm AS base

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
RUN <<EOF
    apt-get update
    apt-get install --no-install-recommends -y \
        musl-dev \
        musl-tools \
        make \
        cmake \
        g++ \
        pkgconf \
        mingw-w64

    rm -rf /var/lib/apt/lists/*
EOF

ENV RUSTUP_DIST_SERVER="https://rsproxy.cn"
ENV RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
RUN rustup target add x86_64-unknown-linux-musl
RUN rustup target add x86_64-pc-windows-gnu

WORKDIR /app
COPY . .

FROM alpine:3
WORKDIR /app
CMD ["bash"]
