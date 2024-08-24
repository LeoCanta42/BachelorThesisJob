#!/bin/bash
export CC=gcc
export CXX=g++
./autogen.sh
export CFLAGS='-g -O0'
export CXXFLAGS='-g -O0'
export ASAN_OPTIONS='abort_on_error=1:symbolize=0:detect_leaks=0:detect_stack_use_after_return=1:detect_container_overflow=0:poison_array_cookie=0:malloc_fill_byte=0:max_malloc_fill_size=16777216'
./configure --enable-static --disable-shared
AFL_USE_ASAN=1 make clean all

# DEBUGGING LIGHTTPD WHILE FUZZING
# apt install gdb gdbserver
# ./configure CFLAGS='-g -O0' --enable-static --disable-shared
# RUN FUZZING
# timeout 24h cargo run --release --bin fallaway-http-mcmm-cy -- --in-dir /corpus --out-dir /output_lighttpd --target-port 8080 --loops 100 -t 300000 gdbserver :1234 /lighttpd/src/lighttpd -D -f /lighttpd.conf
# DEBUGGING
# gdb /lighttpd/src/lighttpd
    #target remote :1234
    #set follow-fork-mode child
    #set breakpoints