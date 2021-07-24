#!/usr/bin/env python

# Searches for all xst_synthesis direcories present in current working directory 
# and appends their paths with -sd option and passes this to ngdbuild. 
# Input is ngc file name of the non leaf node.
#
#
# Author : Piyush P. Soni
#
#

import os
import sys
import getopt
import os.path

topdir = os.getcwd()
topdir = os.path.join(topdir + "/../")
srch_fold = "xst_synthesis"
global ngc_path
ngc_path = []

def display_usage():
    print "\n NGC file name is not provided. Please use\n"
    print "$  buildNGD.py  <ngc file name>\n"
    return
    
def array (srch_fold, dirname, names):
	for name in names:
		if name == srch_fold:		
			implement_path = os.path.join (dirname, srch_fold)
			if os.path.isdir (implement_path):			
				ngc_path.append(" -sd " + implement_path)	
	return

def main ():

	if (len(sys.argv) < 2 ):
		display_usage()
		return 1
	else:
		ngc_file_name = sys.argv[1]
			
	ret_val = 0
	os.path.walk (topdir, array, srch_fold)
	ngc_pth = ""

	#print len(ngc_path)
	for i in enumerate(range(len(ngc_path))):
		ngc_pth+= ngc_path[i[0]]
	print "Info : executing : ngdbuild", ngc_pth

	ret_val = os.system ("ngdbuild " + ngc_file_name + " " + ngc_pth)
	print ret_val
	return ret_val

if __name__ == '__main__':

	ret = main()
	if ret != 0:
		ret = 1
	else:
		ret = 0
	sys.exit(ret)
