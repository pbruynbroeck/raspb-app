FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
    make \
    gcc-arm-linux-gnueabi
COPY . raspb-app/