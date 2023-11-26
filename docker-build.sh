#!/bin/bash
docker run -it -v $(pwd)/in:/usr/local/in -v $(pwd)/out:/usr/local/out docker-brotli /usr/bin/compress.sh