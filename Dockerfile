FROM alpine:latest

ARG BUILD_DIR="/tmp/build"

RUN mkdir $BUILD_DIR && \
    cd $BUILD_DIR && \
    apk add --no-cache cmake alpine-sdk && \
    git clone https://github.com/google/brotli.git

RUN cd "$BUILD_DIR/brotli" && \
    mkdir out && cd out && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=./install .. && \
    cmake --build . --config Release --target install && \
    mkdir -p /usr/local/in && \
    mkdir /usr/local/out && \
    cp "$BUILD_DIR/brotli/out/brotli" /usr/sbin/ && \
    mv "$BUILD_DIR/brotli/out/" "/usr/out" && \
    rm -R "$BUILD_DIR/brotli" && \
    mkdir "$BUILD_DIR/brotli" && \
    mv "/usr/out" "$BUILD_DIR/brotli/out"&& \
    apk del cmake alpine-sdk

COPY compress.sh /usr/bin/compress.sh