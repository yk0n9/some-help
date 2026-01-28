FROM rust:1.90-slim-bookworm AS builder

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources
RUN apt update -y
RUN apt install -y musl-dev musl-tools

ENV RUSTUP_DIST_SERVER="https://rsproxy.cn"
ENV RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"
RUN rustup target add x86_64-unknown-linux-musl

WORKDIR /app
COPY . .

FROM alpine:3.20
WORKDIR /app
CMD ["bash"]
