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
    cp "$BUILD_DIR/brotli/out/brotli" /usr/sbin/
#    rm

COPY compress.sh /usr/bin/compress.sh

CMD ["/usr/bin/compress.sh"]