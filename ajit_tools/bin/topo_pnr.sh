#!/bin/bash

if [ $# -lt 5 ]
then 
	echo ""
	echo "Error : Please provide correct number of input arguments "
	echo "Usage : topo_pnr.sh  < design name > < library name >  < clock period >  < sgib y/n >" 
	echo "< pnr y/n >"
	echo ""
	exit 0
fi

if [ -d "work" ]; then
  rm -r work
fi

if [ -d syn_topo ]; then
  rm -r syn_topo
fi

if [ ! -d "vhdl_files" ]; then
  mkdir vhdl_files
fi

echo 'Info : Copying VHDL xfiles';
cd vhdl_files
source chip_vhdl_files.sh
cd ../


echo 'Info : Generating DC-topo script xfiles';
buildTOPO.py -d $1 -l $2 -p $3 -g $4 


mkdir -p ${1}_${3}_reports
mkdir -p ${1}_${3}_op_data

echo 'Info : Synthesizing the design with DC-topo';
source /cad3/synopsys/digitalbashrc
dc_shell -topo -f topo.tcl | tee topo_terminal.log

# return exit status on fail
if [ "$?" -ne 0 ]
then
    echo "Error : DC-topo failed"
    exit 1
fi


if [ $5 = "y" ] 
then
	mkdir -p ${1}_pnr_reports
        echo 'Info : Generating script file for PNR on the design';
	buildICC.py -d $1 -p $3
        echo 'Info : Starting PNR on the design';
	icc_shell -f icc.tcl | tee icc_transcript.log
	
	if [ "$?" -ne 0]
	then
	    echo 'Error : ICC-PNR failed'
	    exit 1
	fi
fi


