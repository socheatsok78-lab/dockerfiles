FROM --platform=$BUILDPLATFORM scratch AS rustup-init-amd64
ARG VERSION
ADD --chmod=0755 https://static.rust-lang.org/rustup/archive/${VERSION}/x86_64-unknown-linux-gnu/rustup-init /rustup-init

FROM --platform=$BUILDPLATFORM scratch AS rustup-init-arm64
ARG VERSION
ADD --chmod=0755 https://static.rust-lang.org/rustup/archive/${VERSION}/aarch64-unknown-linux-gnu/rustup-init /

FROM --platform=$BUILDPLATFORM scratch AS rustup-init-i386
ARG VERSION
ADD --chmod=0755 https://static.rust-lang.org/rustup/archive/${VERSION}/i686-unknown-linux-gnu/rustup-init /

FROM --platform=$BUILDPLATFORM scratch AS rustup-init-armv7
ARG VERSION
ADD --chmod=0755 https://static.rust-lang.org/rustup/archive/${VERSION}/armv7-unknown-linux-gnueabihf/rustup-init /

FROM --platform=$BUILDPLATFORM scratch AS rustup-init-s390x
ARG VERSION
ADD --chmod=0755 https://static.rust-lang.org/rustup/archive/${VERSION}/s390x-unknown-linux-gnu/rustup-init /

FROM --platform=$BUILDPLATFORM scratch AS rustup-init-ppc64le
ARG VERSION
ADD --chmod=0755 https://static.rust-lang.org/rustup/archive/${VERSION}/powerpc64le-unknown-linux-gnu/rustup-init /

FROM --platform=$BUILDPLATFORM rustup-init-${TARGETARCH}${TARGETVARIANT} AS rustup-init
FROM --platform=$BUILDPLATFORM rustup-init
