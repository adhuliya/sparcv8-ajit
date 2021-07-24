#!/bin/sh

# run AJIT C Model on the generated mmap file
_MAIN="main";
ajit_C_system_model \
  -n {{confObj.coreCount}} \
  -t {{confObj.threadsPerCoreCount}} \
  -m ${_MAIN}.mmap \
  -w ${_MAIN}.wtrace \
  -d \
  -r ${_MAIN}.results \
  -l ${_MAIN}.log;
