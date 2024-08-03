#!/bin/bash
./autogen.sh 
CC=gcc CXX=g++
CFLAGS='-g -O0' CXXFLAGS='-g -O0'
./configure --enable-static --disable-shared
AFL_USE_ASAN=1 make clean all