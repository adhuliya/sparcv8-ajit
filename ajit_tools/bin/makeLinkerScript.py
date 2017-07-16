#!/usr/bin/env python
#
# makeLinkerScript.py
#
# DESCRIPTION :
#      from specified entry-point, data-address-section beginning,
#      produce appropriate linker script (print to stdout)
#
# AUTHOR :
#	Madhav Desai
#




import os
import os.path
import shutil
import getopt
import sys
import glob
import commands
import threading 
import popen2
import pdb
import time


# run system command.
def execSysCmd(sys_cmd):
    logCommand(sys_cmd)
    ret_val = os.system(sys_cmd)
    return ret_val


# logging.
def logCommand(sys_cmd):
    print  "Info: Executing:\n\t" +  sys_cmd

def logInfo(mesg):
    print "Info: " + mesg

def logError(mesg):
    print "Error: " + mesg

def logWarning(mesg):
    print "Warning: " + mesg

    
            
def Usage():
    print "arguments:  \n\
               (-h)? (print-help message) \n\
	       (-d <rodata-section-address>) (address to start rodata-segment, default 0x10000)"
    return 0

#     (-h)?
#     (-d data-section-address)?
def parseOptions(opts):
    data_address = "0x00001000"
    help_flag = 0
    linker_file = "LinkerScript.lnk"

    for option, parameter in opts:
        if option == '-h':
           help_flag = 1
	if option == '-d':
           data_address = parameter
           logInfo("data-section-begins-at  = " + data_address + ".")
	if option == '-o':
           linker_file = parameter
           logInfo("output-file  = " + linker_file + ".")

    return help_flag, data_address, linker_file

def main():

    arg_list = sys.argv[1:]
    if(len(arg_list) < 1):
	print "\nERROR: no arguments!"
        Usage()
        return 1

    arg_list = sys.argv[1:]
    opts,args = getopt.getopt(arg_list,'hd:o:')
    help_flag, data_section, linker_file_name = parseOptions(opts)
    
    if(help_flag == 1):
       Usage()
       return 0
    
    linker_file = open(linker_file_name,"w")
    print  >> linker_file, "/* Linker script "
    print  >> linker_file, "ENTRY (_start)"
    print  >> linker_file, "SECTIONS"
    print  >> linker_file, "{"
    print  >> linker_file, "    . = 0x00000000;"
    print  >> linker_file, "    .text ALIGN(8) : { *(.text.main) *(.text.*) }"  
    print  >> linker_file, "    . = " + data_section + ";" 
    print  >> linker_file, "    .rodata ALIGN(8) : { *(.rodata) }"
    print  >> linker_file, "}"
 
    linker_file.close();
    return 0


if __name__ == '__main__':
    ret_val = main()
    sys.exit(ret_val)
