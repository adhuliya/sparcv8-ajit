#!/bin/sh

# run AJIT C Model on the generated mmap file
_MAIN="main";
ajit_C_system_model \
  -n {{confObj.cpu.coreCount}} \
  -t {{confObj.cpu.threadsPerCoreCount}} \
% if confObj.build.debug:
  -g \
% for i in range(len(confObj.programs)):
  -p {{confObj.build.firstDebugPort+i}} \
% end
% end
  -m ${_MAIN}.mmap \
  -w ${_MAIN}.wtrace \
  -d \
  -r {{confObj.projectFiles.resultsFile}} \
  -l ${_MAIN}.log;
