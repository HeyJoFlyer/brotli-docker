# brotli-docker
#### Who doesn't love a slice of fresh bread?
This project allows you to create a docker container which automatically compresses all files in a directory using the the brotli algorithm and saves them to a second directory. This is very useful for the nginx brotli static module to serve precompressed files.

## Usage

### Building

```bash
git clone https://github.com/HeyJoFlyer/brotli-docker.git
cd brotli-docker
docker build -t docker-brotli .
```

Instead of docker-brotli you can choose a tag of your liking.

### Starting Container
Before starting the container you need to have two directories:
* One input folder with the files that need to be compressed (internal /usr/local/in)
* An output folder where the files are going to be compressed to (internal /usr/local/out)

```bash
docker run -it -v $(pwd)/in:/usr/local/in -v $(pwd)/out:/usr/local/out docker-brotli /usr/bin/compress.sh
```
Instead of `in` and `out` you can specify custom input and output directories.

## Bugs
Please report any bugs by raising an [issue](https://github.com/HeyJoFlyer/brotli-docker/issues).

## Licenses

This project is licensed under the **AGPLv3.0 License**

[brotli by google](https://github.com/google/brotli) is licensed under **the MIT License**