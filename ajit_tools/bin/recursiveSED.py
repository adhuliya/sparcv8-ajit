#!/usr/bin/env python
#
# buildHierarchicalModel.py is a top-level script which 
# searches for useful info in  a list of directories and builds a C
# model.
#
# Borrows lots from IMAGE RC.
#  (Thanks to Powai Labs).
#
# Brief Description:
#   The script walks the directory tree starting from the
#   working-directory = ./
#   If the -M option is specified
#      all makefiles in the directory tree rooted at working-dir
#      are executed.
#   If the -R option is specified
#      all contents of aa2c/ lib/ objsw/ and vhdl/ files
#      in the hierarchy are removed (like a clean)
#   If the -H option is specified
#      all the hsys files in the directory tree rooted at working-dir
#      are assembled and a C model is created in  working-dir/aa2c/
#   If the -C option is specified.
#      all source files in aa2c subdirectories in the tree
#      rooted at working-dir are compiled into objsw/ and
#      an archive is created in lib/.
#                and
#      a top-level VHDL file is created in the vhdl/ directory.
#   If the -D option is specified
#      C files will be compiled with the " -gdwarf-2 -g3 " flags.
#      (to enable macro info in gdb).
#   If the -O option is specified
#      C files will be compiled with the " -O3 " flags.
#
#
#   Typically, one does 
#            -M
# 	     -H
#            -C
#
#   To clean, use 
#            -R
#
#
#
# Author: Madhav Desai

# Modification: 
#	added simulation choice <modelsim>|<ghdl>
#	change the default choice as preferred on line: 278
#	modified by: Ashfaque Ahammed
#	date: 23-Nov-2015
# 
import os
import os.path
import shutil
import getopt
import sys
import glob
import commands
import threading 
import subprocess
import pdb
import time

# run system command.
def execSysCmd(sys_cmd):
    logCommand(sys_cmd)
    ret_val = os.system(sys_cmd)
    return ret_val

# clean the work-area, remove all the stuff produced by the script.
def cleanWorkArea(work_area):

    execSysCmd("rm -rf " + work_area + "./objsw")
    execSysCmd("rm -f "  + work_area + "./lib")
    return 0

    
# set global variables used in this script from environment
# variables.
def setGlobals(ahir_release_path):


    global AHIR_RELEASE
    global FUNCTIONLIB
    global XILINX_UNISIM
    global XILINX_SIMPRIM
    global AHIR_PTHREAD_UTILS_INCLUDE
    global AHIR_FUNCTIONLIB

    # Two versions of pipes, for software version, we
    # use pipeHandler, for ghdl simulation we use SocketLib.
    global SOCKETLIB_INCLUDE
    global SOCKETLIB_LIB
    global PIPEHANDLER_INCLUDE
    global PIPEHANDLER_LIB
    global AHIR_FUNCTIONLIB_INCLUDE

    # VHDL libraries from AHIR distro.
    global AHIR_VHDL_LIB
    global AHIR_VHDL_VHPI_LIB

    # VHDL, Aa results
    global VHDL
    global AA


    # SW version.
    global SW_INCLUDES
    global SW_LIB_PATHS
    global SW_LIBS

    # HW version..
    global HW_INCLUDES
        
    # CLANG includes
    global CLANG_INCLUDES
    
    # HW testbench for GHDL sim.
    global TB_INCLUDES
    global TB_LIB_PATHS
    global TB_LIBS

    # GHDL libraries to be linked to.
    global GHDL_LIB_OPTS

    # AHIR-related
    AHIR_RELEASE=ahir_release_path
    FUNCTIONLIB=AHIR_RELEASE + "/functionLibrary"
    XILINX_UNISIM=AHIR_RELEASE + "/vhdl"
    XILINX_SIMPRIM=AHIR_RELEASE + "/vhdl"
    SOCKETLIB_INCLUDE=AHIR_RELEASE + "/include"
    SOCKETLIB_LIB=AHIR_RELEASE + "/lib"
    PIPEHANDLER_INCLUDE=AHIR_RELEASE + "/include"
    PIPEHANDLER_LIB=AHIR_RELEASE + "/lib"
    AHIR_VHDL_LIB=AHIR_RELEASE + "/vhdl"
    AHIR_VHDL_VHPI_LIB=AHIR_RELEASE + "/vhdl"
    AHIR_PTHREAD_UTILS_INCLUDE=AHIR_RELEASE + "/include"
    AHIR_FUNCTIONLIB=AHIR_RELEASE + "/functionLibrary"
    AHIR_FUNCTIONLIB_INCLUDE=AHIR_FUNCTIONLIB + "/include"
    
    #GHDL_LIB_OPTS = "-Wl,-L" + SOCKETLIB_LIB + " -Wl,-L" + RC_LIB + " -Wl,-lVhpi" + " -Wl,-lrcApiWithoutPlx" + " -Wl,-lrt"


# logging.
def logCommand(sys_cmd):
    print >> command_log_file, sys_cmd

def logInfo(mesg):
    print "Info: " + mesg

def logError(mesg):
    print "Error: " + mesg

def logWarning(mesg):
    print "Warning: " + mesg

# utility to make a directory or if exists, remove its contents.
def makeOrCleanDir(dest_dir):
    curr_path = os.getcwd()
    if(os.path.isdir(dest_dir) != 1):
        os.mkdir(dest_dir)
    else:
        execSysCmd("rm -rf " + curr_path + "/" + dest_dir + "/*")

    
# compile function
#  CC = compiler, SRC_DIRS = src-directory-list, OBJ = obj-dir, CFLAGS, list-of-includes, list-of-defines.
def  compileFiles(CC, SRC_DIRS, OBJ, CFLAGS, INCLUDE_LIST, DEFINES):
    err_flag = 0
    include_string = ""
    for incldir in INCLUDE_LIST:
   	include_string += " -I" +   incldir + " "

    include_string += " -I" + AHIR_FUNCTIONLIB_INCLUDE +  " -I" + PIPEHANDLER_INCLUDE + " "

    define_string = ""
    for defs  in DEFINES:
        define_string += "-D" + defs

    # make object directory if needed.       
    if(os.path.isdir(OBJ) != 1): 
    	os.mkdir(OBJ)

    ccflag_string = CFLAGS

        
    cc_command = ""
    for src_dir in SRC_DIRS:
        for sfile in os.listdir(src_dir):
	    name,extn = os.path.splitext(sfile)
            if(extn == ".c"):
               cc_command = CC + " -pthread -c " + ccflag_string  + " " + include_string + " " +  define_string + " " + src_dir + "/" + sfile  + " -o " + OBJ + "/" + name + ".o"
	       logInfo("executing compile-command\n\t " + cc_command)
               ret_val = execSysCmd(cc_command)
               if(ret_val != 0):
                   logError("in compiling file " + sfile)
	           err_flag = 1
	
    return err_flag

    
# build static library
def buildArchive(DEST_DIR, LIBNAME, OBJDIRS):
    err_flag = 0

    ar_cmd = "ar -rcs " + DEST_DIR + "/lib" + LIBNAME + ".a "
    for objdir in OBJDIRS:
        obj_files = os.listdir(objdir)
        for obj_file in obj_files:
            root,ext = os.path.splitext(obj_file)
            if(ext == ".o"):
               ar_cmd += " " + objdir + "/" +  obj_file
    
    logInfo("executing archive-command\n\t " + ar_cmd)
    err_flag = execSysCmd(ar_cmd)

    return(err_flag)


   

#
# Author: Madhav Desai 
#
# Brief Description:
#   The script walks the directory tree starting from the
#   working-directory = ./
#   If the -M option is specified
#      all makefiles in the directory tree rooted at working-dir
#      are executed.
#   If the -H option is specified
#      all the hsys files in the directory tree rooted at working-dir
#      are assembled and a C model is created in  working-dir/aa2c/
#   If the -C option is specified.
#      all source files in aa2c subdirectories in the tree
#      rooted at working-dir are compiled into objsw/ and
#      an archive is created in lib/.
#
#   Typically, one does 
#            -M
# 	     -H
#            -C
#
#
#
def printUsage():
    print ''' 
     -a <app-name> 
     -M (if all makefiles needs to be exexcuted)
     -H (if  hsys needs to be expanded)
     -C (if  C model needs to be created).
     -D (cc-flags set -gdwarf-2 -g3).
     -O (cc-flags set -O3).
     -R (to clean)
     (-s ghdl/modelsim)?  (default is ghdl)
     (-I  (c-include-dir))*
     src-dir-1 src-dir-2 ... src-dir-n.
          '''
def main():

    ahir_release = os.environ.get('AHIR_RELEASE')
    if(ahir_release == None):
       logError (" environment variable AHIR_RELEASE is not defined." )
       return 1

    if len(sys.argv) < 2:
       printUsage()
       return 1

    arg_list = sys.argv[1:]
    hiersys2c_flag = False
    compile_aa2c_files = False
    make_flag = False
    clean_flag = False
    debug_flag = False
    use_gnu_pth = False


    simulator_choice = os.environ.get('AJIT_DEFAULT_VHDL_SIMULATOR')

    opts,args = getopt.getopt(arg_list,'a:I:s:tHCMRDO')
    app_name = ""
    c_include_dirs = []
    cc_flags =  " "
    for option, parameter in opts:
        if option ==  '-a':
 	   app_name = parameter
           logInfo("application-name  = " + parameter + ".")
        elif option ==  '-I':
           c_include_dirs.append(parameter)
           logInfo("added c-include_directory = " + parameter + ".")
        elif option ==  '-D':
           debug_flag = True
           cc_flags = " -gdwarf-2 -g3 "
           logInfo("debug mode selected cc-flags = " + cc_flags + ".")
        elif option ==  '-O':
           cc_flags = " -O3 "
           logInfo("optimize mode selected cc-flags = " + cc_flags + ".")
        elif option ==  '-G':
           use_gnu_pth = True
           logInfo("link to gnu-pth = True.")
        elif option ==  '-H':
           hiersys2c_flag = True
           logInfo("only hsys files will be expanded")
        elif option ==  '-C':
           compile_aa2c_files = True
           logInfo("all aa2c files will be compiled into library")
        elif option ==  '-M':
           make_flag = True
           logInfo("all make files in the hierarchy will be executed. ")
        elif option ==  '-R':
           make_flag = True
           clean_flag = True
           logInfo("all secondary products in the hierarchy will be removed. ")
	elif option == "-s":
 	   simulator_choice = parameter
           logInfo("simulator-choice = " + simulator_choice + ".")
 	else:
	   logError("unknown-option " + option)
	   return 1
	
    work_area = "./"
    global command_log_file
    command_log_file = open(work_area + "/executed_command_log.txt","a")


    if(app_name == ""):
	logError("specify an application name ")
       	printUsage()
        command_log_file.close()
       	return 1

    #default compilation and simulation [ghdl | modelsim]
    if ((not clean_flag) and (simulator_choice == None)):
       logError("unspecified simulator-type (ghdl/modelsim), set AJIT_DEFAULT_VHDL_SIMULATOR to ghdl or modelsim")
       return 1

    # set all the global constants (include-paths, libraries etc. etc.)
    setGlobals(ahir_release)

    # 0 = success.
    ret_status  = 0

    # walk this directory.. note bottom up..
    src_list = []
    hsys_list = []

    # as you walk, execute the makefiles that you
    # see.  This will produce aa2c directories 
    # and also hsys files.
    for root, dirs, files in os.walk(work_area, topdown=False, followlinks=True):
        for fname in files:
           full_name = os.path.join(root, fname)

           rootfname, extn = os.path.splitext(fname)
	   if(make_flag and (fname == "Makefile")):
              #
	      # existing makefiles will be executed in reverse
              # order (leaves first)
	      #
              logInfo("found Makefile in " + root)
              cwd = os.getcwd()
              make_cmd = "make -C " + root
              if(debug_flag):
                 make_cmd += " DEBUG=-D "
              if(clean_flag):
                 make_cmd += " clean"

              if (simulator_choice != None):
	         make_cmd += " SIMULATOR=-s\ "
	         make_cmd += simulator_choice
	
	      if(use_gnu_pth):
                  make_cmd += " GNUPTH=-G "

	      #pdb.set_trace()
              make_status = execSysCmd(make_cmd)
              if(make_status):
                  logError("make failed in " + root)
                  return 1
           if(hiersys2c_flag and (extn == ".hsys")):
              logInfo("found hsys file " + full_name)
              hsys_list.append(full_name)

        for name in dirs:
           full_name = os.path.join(root, name)
           if(compile_aa2c_files and (name == "aa2c")):
              logInfo("found aa2c directory " + full_name)
              src_list.append(full_name)
              c_include_dirs.append(full_name)
    
   
    #
    # construct the hierarchical model from lower level constructs.
    #
    if(len(hsys_list) > 0):
        
        hiersys2c_cmd = "hierSys2C -n " + app_name  + " -o aa2c "
        if(use_gnu_pth): 
            hiersys2c_cmd += " -G "
	for aafile in args:
            hiersys2c_cmd += aafile + " "
        for hsys_file in hsys_list:
            hiersys2c_cmd += hsys_file + " " 
        hsys2c_status = execSysCmd(hiersys2c_cmd)
        if(hsys2c_status):
            logError("hierSys2C failed in " + root)
            return 1
    elif (hiersys2c_flag):
        logError("no hsys files found under " + root)

    if(len(src_list) > 0):
        ret_status = compileFiles("gcc", src_list, "./objsw", cc_flags, c_include_dirs,"") 
        if(ret_status):
           logError("compilation failed.") 
           return 1
    elif (compile_aa2c_files):
        logError("no aa2c subdirectories found under " + root)
        return 1


    if (compile_aa2c_files):
        obj_dirs = []
        obj_dirs.append("./objsw")
        ret_status = buildArchive("./lib", app_name, obj_dirs)


    # create a top-level VHDL file.
    if(len(hsys_list) > 0):
        hiersys2vhdl_cmd = "hierSys2Vhdl -s " + simulator_choice +  " -o vhdl " 
	for aafile in args:
            hiersys2vhdl_cmd += aafile + " "
        for hsys_file in hsys_list:
            hiersys2vhdl_cmd += hsys_file + " " 
        hsys2vhdl_status = execSysCmd(hiersys2vhdl_cmd)
        if(hsys2vhdl_status):
            logError("hierSys2Vhdl failed in " + root)
            return 1
        format_cmd = "formatVhdlFiles.py vhdl"
        ret_status = execSysCmd(format_cmd)

    return ret_status

if __name__ == '__main__':
    ret_val = main()
    sys.exit(ret_val)
