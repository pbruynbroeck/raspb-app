FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get -y install build-essential
COPY . raspb-app/
RUN make -C raspb-app