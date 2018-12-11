#!/usr/bin/env sh
clang++ fuzz.cc -o fuzz.me -fsanitize=fuzzer,address -g -O0
