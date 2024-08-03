FROM ubuntu:20.04

# Install dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update && \
    apt-get -y install sudo \ 
    build-essential \
    git \
    clang \
    autoconf \
    automake \
    libtool \
    m4 \
    pkg-config \
    libpcre2-dev \
    zlib1g-dev \
    zlib1g

# Add a new user ubuntu, pass: ubuntu
RUN groupadd ubuntu && \
    useradd -rm -d /home/ubuntu -s /bin/bash -g ubuntu -G sudo -u 1000 ubuntu

RUN chmod 777 /tmp

# Use ubuntu as default username
USER ubuntu
WORKDIR /home/ubuntu

ENV WORKDIR="/home/ubuntu/experiments"
RUN mkdir $WORKDIR

COPY lighttpd.patch $WORKDIR
COPY lighttpd.conf $WORKDIR

# Set up environment variables for ASAN
ENV ASAN_OPTIONS='abort_on_error=1:symbolize=0:detect_leaks=0:detect_stack_use_after_return=1:detect_container_overflow=0:poison_array_cookie=0:malloc_fill_byte=0:max_malloc_fill_size=16777216'

# Download and compile Lighttpd1.4 for fuzzing
RUN cd $WORKDIR && \
git clone https://git.lighttpd.net/lighttpd/lighttpd1.4.git lighttpd1 && \
cd lighttpd1 && \
git checkout 9f38b63cae3e2 && \
git apply ${WORKDIR}/lighttpd.patch && \
./autogen.sh && \
CC=gcc CXX=g++ && \
./configure --enable-static --disable-shared && \
AFL_USE_ASAN=1 make clean all

WORKDIR ${WORKDIR}/lighttpd1/src
ENTRYPOINT ./lighttpd -D -f ${WORKDIR}/lighttpd.conf
