#!/usr/bin/env bash

# works if the realative path to this directory is,
# .../sparcv8-ajit-git/misc/test-progs/benchmarks/coremark/coremark/sparc-assembly

./clean.sh
../../../../../../src/main.py $1;
