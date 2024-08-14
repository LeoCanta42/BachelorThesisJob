#!/bin/bash
export CC=gcc
export CXX=g++
./autogen.sh
export CFLAGS='-g -O0'
export CXXFLAGS='-g -O0'
export ASAN_OPTIONS='abort_on_error=1:symbolize=0:detect_leaks=0:detect_stack_use_after_return=1:detect_container_overflow=0:poison_array_cookie=0:malloc_fill_byte=0:max_malloc_fill_size=16777216'
./configure --enable-static --disable-shared
AFL_USE_ASAN=1 make clean all
