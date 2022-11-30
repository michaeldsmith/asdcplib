FROM ubuntu:focal

RUN apt-get update

# disable interactive install 
ENV DEBIAN_FRONTEND noninteractive

# install developement tools
RUN apt-get -y install cmake
RUN apt-get -y install g++
RUN apt-get -y install git

# copy repo into docker
WORKDIR /usr/src/asdcplib
COPY . .

# build asdcplib
WORKDIR /usr/src/asdcplib/build
RUN cmake ..
RUN make
RUN make install

# finalize docker environment
WORKDIR /usr/src/asdcplib
