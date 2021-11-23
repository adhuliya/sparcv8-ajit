#!/usr/bin/env python

# Generates the .tcl xfiles necessary for topographical synthesis using Design Compiler.
# Written by : Ch V kalyani
# Date : 23/04/2017


import os
import sys
import getopt
import os.path


current_dir = os.getcwd()

def logError(mesg):
    print "Error: " + mesg

def SetGlobals():
    global AHIR_RELEASE
    global AHIR_IEEE_LIBRARY
    global AHIR_LIBRARY
    global SCL_LIB1
    global SCL_LIB2
    global SCL_LIB3
    global SCL_LIB4
    global SCL_LIB5
    global SCL_LIB6
    global SCL_LIB7
    global SCL_LIB8
    global WORK_AREA
    global AJIT_PROJECT_HOME
    AJIT_PROJECT_HOME=os.environ.get('AJIT_PROJECT_HOME')
    AHIR_RELEASE = os.environ.get('AHIR_RELEASE')
    AHIR_IEEE_LIBRARY = AHIR_RELEASE + "/vhdl/No_Asserts/aHiR_ieee_proposed.vhdl"
    AHIR_LIBRARY = AHIR_RELEASE + "/vhdl/No_Asserts/ahirForAsic.vhdl"
    SCL_LIB1 =  "tsl18fs120_scl_ss.db "
    SCL_LIB2 =  "tsl18_memory_max_16_4.db "
    SCL_LIB3 =  "spram_32_16_max.db "
    SCL_LIB4 =  "obc11_256x8_max.db "
    SCL_LIB5 =  "tsl18_memory_max_512_24.db "
    SCL_LIB6 =  "obc11_dpram_16x8_max.db "
    SCL_LIB7 =  "tsl18_memory_max_DP_16x4.db "
    SCL_LIB8 =  "tsl18_memory_max_DP_32x8.db "
    WORK_AREA= "[pwd]/work"

def display_usage():
    print "\n VHDL file is not provided. Please use\n"
    print "$  buildTOPO.py -l <library name> -d <design name> \n"
    print " -p <clock period> -g <sgib y/n> "
    print " -h <no parameter required. used to get help> \n"
    
    
def generateTCL(design, clock_period, library_name, sgib):
           
    tcl_file = open( "topo.tcl","w")
    print >> tcl_file, "set design "+ design  
    print >> tcl_file, "set_svf " + design +".svf"
    print >> tcl_file, "set_app_var search_path {"+AJIT_PROJECT_HOME+"/processor/ASIC/io_n_std/tsl18cio150_4lm_dv "+AJIT_PROJECT_HOME+"/processor/ASIC/io_n_std/tsl18fs120_4lm_fr " +AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/milkyway "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/obc11_256x8 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/obc11_dpram_16x8 "+ AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/spram_32x16 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/spram_512X24 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/SPRAM_16x4 "+AJIT_PROJECT_HOME+"/processor/ASIC/db_files "+AJIT_PROJECT_HOME+"/processor/ASIC/tech_topo}"
    print >> tcl_file, "set target_library " "\"" + SCL_LIB1 + SCL_LIB2 + SCL_LIB3 + SCL_LIB4+ SCL_LIB5 + SCL_LIB6 + SCL_LIB7 + SCL_LIB8 + "\""
    print >> tcl_file, "set link_library $target_library " 
    print >> tcl_file, "set_min_library tsl18fs120_scl_ss.db -min_version tsl18fs120_scl_ff.db"
    print >> tcl_file, "set_min_library tsl18cio250_max.db -min_version tsl18cio250_min.db" 
    print >> tcl_file, "set_min_library tsl18_memory_max_16_4.db -min_version tsl18_memory_min_16_4.db"
    print >> tcl_file, "set_min_library spram_32_16_max.db -min_version tsl18_memory_min_SP_32x16.db"
    print >> tcl_file, "set_min_library obc11_256x8_max.db -min_version obc11_256x8_min.db"
    print >> tcl_file, "set_min_library tsl18_memory_max_512_24.db -min_version tsl18_memory_min_512_24.db"
    print >> tcl_file, "set_min_library obc11_dpram_16x8_max.db -min_version obc11_dpram_16x8_min.db"
    print >> tcl_file, "set_min_library tsl18_memory_max_DP_32x8.db -min_version tsl18_memory_min_DP_32x8.db"
    print >> tcl_file, "set_min_library tsl18_memory_max_DP_16x4.db -min_version tsl18_memory_min_DP_16x4.db" 

    print >> tcl_file, "set_tlu_plus_files -max_tluplus  RCE_TS18SL_SCL_STAR_RCXT_4M1L_TYP.tlup -tech2itf_map RCE_TS18SL_SCL_STAR_RCXT_4M1L_TYP.map"
    print >> tcl_file, "create_mw_lib -technology "+AJIT_PROJECT_HOME+"/processor/ASIC/tech_topo/tsl18l4_30_ApII.tf -mw_reference_library {"+AJIT_PROJECT_HOME+"/processor/ASIC/io_n_std/tsl18cio150_4lm_dv "+AJIT_PROJECT_HOME+"/processor/ASIC/io_n_std/tsl18fs120_4lm_fr "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/milkyway "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/obc11_256x8 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/obc11_dpram_16x8 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/spram_32x16 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/spram_512X24 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/SPRAM_16x4}  syn_topo"

    print >> tcl_file, "open_mw_lib syn_topo"

    print >> tcl_file, "set hdlin_enable_rtldrc_info true"
    print >> tcl_file, "set hdlin_infer_fsm TRUE"
    print >> tcl_file, "set fsm_auto_inferring TRUE"
    print >> tcl_file, "set hdlin_report_fsm TRUE"
    print >> tcl_file, "set hdlin_enable_rtldrc_info true"

    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/mx08d*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/slnht*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/skbrb*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/slbhb*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/slnh*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/slnln*"
    print >> tcl_file, "set_dont_use tsl18fs120_min/mx08d*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ff/slnht*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ff/skbrb*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ff/slbhb*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ff/slnh*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ff/slnln*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ff/jk*"
    print >> tcl_file, "set_dont_use tsl18fs120_scl_ss/jk*"	

    print >> tcl_file, "define_design_lib default -path " + WORK_AREA 
    print >> tcl_file, "define_design_lib aHiR_ieee_proposed -path " + WORK_AREA + "/aHiR_ieee_proposed " 
    print >> tcl_file, "define_design_lib ahir -path " + WORK_AREA + "/ahir " 
    print >> tcl_file, "define_design_lib AjitCustom -path " + WORK_AREA + "/AjitCustom"

    print >> tcl_file, "define_design_lib core_cpu -path ./work/core_cpu"
    print >> tcl_file, "define_design_lib cpu_ccu -path ./work/cpu_ccu"
    print >> tcl_file, "define_design_lib cpu_debug_interface -path ./work/cpu_debug_interface"
    print >> tcl_file, "define_design_lib cpu_teu -path ./work/cpu_teu"
    print >> tcl_file, "define_design_lib teu_cpunit -path ./work/teu_cpunit"
    
    print >> tcl_file, "define_design_lib teu_fpunit -path ./work/teu_fpunit"
    print >> tcl_file, "define_design_lib teu_iexception -path ./work/teu_iexception"
    print >> tcl_file, "define_design_lib teu_idecode_idispatch -path ./work/teu_idecode_idispatch"
    print >> tcl_file, "define_design_lib teu_ifetch -path ./work/teu_ifetch"
    print >> tcl_file, "define_design_lib teu_iretire -path ./work/teu_iretire"
    print >> tcl_file, "define_design_lib teu_iunit -path ./work/teu_iunit"
    print >> tcl_file, "define_design_lib teu_loadstore -path ./work/teu_loadstore"
    print >> tcl_file, "define_design_lib teu_stream_corrector -path ./work/teu_stream_corrector"
    
    print >> tcl_file, "define_design_lib fpunit_exec -path ./work/fpunit_exec"
    print >> tcl_file, "define_design_lib fpunit_registers -path ./work/fpunit_registers"
    print >> tcl_file, "define_design_lib fpunit_writeback -path ./work/fpunit_writeback"

    print >> tcl_file, "define_design_lib iunit_exec -path ./work/iunit_exec"
    print >> tcl_file, "define_design_lib iunit_registers -path ./work/iunit_registers"
    print >> tcl_file, "define_design_lib iunit_writeback -path ./work/iunit_writeback"

    print >> tcl_file, "define_design_lib sys_chip -path ./work/sys_chip"
    print >> tcl_file, "define_design_lib chip_ahblite_controller -path ./work/chip_ahblite_controller"
    print >> tcl_file, "define_design_lib chip_core -path ./work/chip_core"
    print >> tcl_file, "define_design_lib debug_spi_slave_adapter -path ./work/debug_spi_slave_adapter"
    print >> tcl_file, "define_design_lib debug_spi_slave_stub -path ./work/debug_spi_slave_stub"
    print >> tcl_file, "define_design_lib chip_debug_spi_slave -path ./work/chip_debug_spi_slave"
    print >> tcl_file, "define_design_lib chip_interrupt_stub -path ./work/chip_interrupt_stub"
    print >> tcl_file, "define_design_lib chip_logger_stub -path ./work/chip_logger_stub"
    print >> tcl_file, "define_design_lib chip_reset_pmode_stub -path ./work/chip_reset_pmode_stub"
    print >> tcl_file, "define_design_lib serial_spi_slave_adapter -path ./work/serial_spi_slave_adapter"
    print >> tcl_file, "define_design_lib serial_spi_slave_stub -path ./work/serial_spi_slave_stub"
    print >> tcl_file, "define_design_lib chip_serial_spi_slave -path ./work/chip_serial_spi_slave"
    print >> tcl_file, "define_design_lib chip_spi_master_interface -path ./work/chip_spi_master_interface"

    print >> tcl_file, "define_design_lib core_bootmem -path ./work/core_bootmem"
    print >> tcl_file, "define_design_lib core_bridge -path ./work/core_bridge"
    print >> tcl_file, "define_design_lib core_cpu -path ./work/core_cpu"
    print >> tcl_file, "define_design_lib core_dcache -path ./work/core_dcache"
    print >> tcl_file, "define_design_lib core_icache -path ./work/core_icache"
    print >> tcl_file, "define_design_lib core_irc -path ./work/core_irc"
    print >> tcl_file, "define_design_lib core_mmu -path ./work/core_mmu"
    print >> tcl_file, "define_design_lib core_serial -path ./work/core_serial"
    print >> tcl_file, "define_design_lib core_spi -path ./work/core_spi"
    print >> tcl_file, "define_design_lib core_timer -path ./work/core_timer"

    print >> tcl_file, "analyze -format vhdl -library aHiR_ieee_proposed ./vhdl_files/aHiR_ieee_proposed.vhdl"
    print >> tcl_file, "analyze -format vhdl -library ahir ./vhdl_files/ahirASIC.vhdl"
    print >> tcl_file, "analyze -format vhdl -library AjitCustom ./vhdl_files/AjitCustomForAsic.vhdl"
    print >> tcl_file, "analyze -format vhdl -library cpu_ccu ./vhdl_files/ccu.vhdl"
    print >> tcl_file, "analyze -format vhdl -library cpu_debug_interface ./vhdl_files/debug_interface.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_cpunit ./vhdl_files/cpunit.vhdl"

    print >> tcl_file, "analyze -format vhdl -library teu_iexception ./vhdl_files/iexception.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_idecode_idispatch ./vhdl_files/idecode_idispatch.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_ifetch ./vhdl_files/ifetch.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_iretire ./vhdl_files/iretire.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_loadstore ./vhdl_files/loadstore.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_stream_corrector ./vhdl_files/stream_corrector.vhdl"

    print >> tcl_file, "analyze -format vhdl -library fpunit_exec ./vhdl_files/exec.vhdl"
    print >> tcl_file, "analyze -format vhdl -library fpunit_registers ./vhdl_files/registers.vhdl"
    print >> tcl_file, "analyze -format vhdl -library fpunit_writeback ./vhdl_files/writeback.vhdl"
 
    print >> tcl_file, "analyze -format vhdl -library iunit_exec ./vhdl_files/iu_exec.vhdl"
    print >> tcl_file, "analyze -format vhdl -library iunit_registers ./vhdl_files/iu_registers.vhdl"
    print >> tcl_file, "analyze -format vhdl -library iunit_writeback ./vhdl_files/iu_writeback.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_fpunit ./vhdl_files/fpunit.vhdl"
    print >> tcl_file, "analyze -format vhdl -library teu_iunit ./vhdl_files/iunit.vhdl"
    print >> tcl_file, "analyze -format vhdl -library cpu_teu ./vhdl_files/teu.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_cpu ./vhdl_files/cpu.vhdl"
    
    print >> tcl_file, "analyze -format vhdl -library core_timer ./vhdl_files/timer.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_spi ./vhdl_files/spi.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_serial ./vhdl_files/serial.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_mmu ./vhdl_files/mmu.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_irc ./vhdl_files/irc.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_icache ./vhdl_files/icache.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_dcache ./vhdl_files/dcache.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_bridge ./vhdl_files/bridge.vhdl"
    print >> tcl_file, "analyze -format vhdl -library core_bootmem ./vhdl_files/bootmem.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_core ./vhdl_files/core.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_ahblite_controller ./vhdl_files/ahblite_controller.vhdl"
    print >> tcl_file, "analyze -format vhdl -library debug_spi_slave_stub ./vhdl_files/debug_spi_stub.vhdl"
    print >> tcl_file, "analyze -format vhdl -library debug_spi_slave_adapter ./vhdl_files/debug_adapter.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_debug_spi_slave ./vhdl_files/debug_spi_slave.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_interrupt_stub ./vhdl_files/interrupt_stub.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_logger_stub ./vhdl_files/logger_stub.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_reset_pmode_stub ./vhdl_files/reset_pmode_stub.vhdl"
    print >> tcl_file, "analyze -format vhdl -library serial_spi_slave_stub ./vhdl_files/serial_spi_stub.vhdl"
    print >> tcl_file, "analyze -format vhdl -library serial_spi_slave_adapter ./vhdl_files/serial_adapter.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_serial_spi_slave ./vhdl_files/serial_spi_slave.vhdl"
    print >> tcl_file, "analyze -format vhdl -library chip_spi_master_interface ./vhdl_files/spi_master_interface.vhdl"
    print >> tcl_file, "analyze -format vhdl -library sys_chip ./vhdl_files/chip.vhdl"

    print >> tcl_file, "elaborate  $design -library " + library_name
    print >> tcl_file, "link"
    print >> tcl_file, "set_verification_priority -high [ get_designs { DcacheFrontendDaemon_tag_length2 } ]"
    print >> tcl_file, "set_verification_priority -high [ get_designs { IcacheFrontendDaemon_tag_length2 } ]"

    print >> tcl_file, "current_design $design"

    print >> tcl_file, "global clock_pin"
    print >> tcl_file, "set clock_pin clk" 
    print >> tcl_file, "set clk_period " + clock_period
    print >> tcl_file, "set clk_name $clock_pin"
    print >> tcl_file, "create_clock -period $clk_period -name clk [get_ports clk]"
    print >> tcl_file, "set_clock_uncertainty 1 -setup [get_clock clk]"
    print >> tcl_file, "set_clock_uncertainty 1 -hold  [get_clock clk]"
    print >> tcl_file, "set_clock_transition  1 [get_clock clk]"

    print >> tcl_file, "set_clock_latency  -max 3 [get_clock clk]"
    print >> tcl_file, "set_clock_latency  -min 1.5 [get_clock clk]"

    print >> tcl_file, "set CLK_EXT_SOURCE_LATENCY_MAX     2.5"
    print >> tcl_file, "set CLK_EXT_SOURCE_LATENCY_MIN     1.5"
    print >> tcl_file, "set_clock_latency  -source  -max $CLK_EXT_SOURCE_LATENCY_MAX [get_clock clk]"
    print >> tcl_file, "set_clock_latency  -source   -min $CLK_EXT_SOURCE_LATENCY_MIN [get_clock clk]"

    print >> tcl_file, "set input_delay_max_ns 1"
    print >> tcl_file, "set input_delay_min_ns 0.5"

    print >> tcl_file, "set output_delay_max_ns 1"
    print >> tcl_file, "set output_delay_min_ns 0.5"

    print >> tcl_file, "set_input_delay $input_delay_max_ns -max -clock clk [remove_from_collection [all_inputs] $clock_pin]"
    print >> tcl_file, "set_input_delay $input_delay_min_ns -min -clock clk [remove_from_collection [all_inputs] $clock_pin]"

    print >> tcl_file, "set_output_delay $output_delay_max_ns -max -clock clk [all_outputs]"
    print >> tcl_file, "set_output_delay $output_delay_min_ns -min -clock clk [all_outputs]"

    print >> tcl_file, "group_path -name INREG -from [all_inputs]"
    print >> tcl_file, "group_path -name REGOUT -to [all_outputs]"
    print >> tcl_file, "group_path -name INOUT -from [all_inputs] -to [all_outputs]"



    #after SGIB

    if sgib == 'y':
	 print >> tcl_file, "set SGIB [get_designs *SplitGuardInterfaceBase*]"
	 print >> tcl_file, "foreach_in_collection a $SGIB {"
	 print >> tcl_file, "current_design $a" 
	 print >> tcl_file, "rename_design $a -prefix ${design}_ }"
	 print >> tcl_file, "set SGIB_rename [get_designs *SplitGuardInterfaceBase*]"
	 print >> tcl_file, "foreach_in_collection a $SGIB_rename {"
	 print >> tcl_file, "current_design $a" 
	 print >> tcl_file, "compile_ultra -no_autoungroup"
	 print >> tcl_file, "set QB [get_designs -hierarchical ShiftRegisterSingleBitQueue*]"
	 print >> tcl_file, "foreach_in_collection b $QB {" 
	 print >> tcl_file, "rename_design $b -prefix ${design}_ }"
	 print >> tcl_file, "set_dont_touch $a }"
    
   
    print >> tcl_file, "current_design $design"  
    print >> tcl_file, "compile_ultra -no_autoungroup"
    print >> tcl_file, "write -f verilog -hier -output ./"+design+"_"+clock_period+"_"+"op_data/${design}.v"
    print >> tcl_file, "write -f ddc -hier -output ./"+design+"_"+clock_period+"_"+"op_data/${design}.ddc"
    print >> tcl_file, "write_sdc -version 1.2 ./"+design+"_"+clock_period+"_"+"op_data/${design}.sdc"
    print >> tcl_file, "report_timing -nets -cap -transition -nworst 2  -max_paths 20 > ./" +design+"_"+clock_period+"_"+"reports/timing_full.rpt"
    print >> tcl_file, "report_timing -loops -max_paths 50 > ./" +design+"_"+clock_period+"_"+"reports/loops.rpt"
    print >> tcl_file, "report_area > ./" +design+"_"+clock_period+"_"+"reports/area.rpt"
    print >> tcl_file, "report_constraint -all_violators > ./" +design+"_"+clock_period+"_"+"reports/constraint.rpt"
    print >> tcl_file, "report_cell > ./" +design+"_"+clock_period+"_"+"reports/cell.rpt"
    print >> tcl_file, "report_power > ./" +design+"_"+clock_period+"_"+"reports/power.rpt"
    print >> tcl_file, "report_qor > ./" +design+"_"+clock_period+"_"+"reports/qor.rpt"

    print >> tcl_file, "quit"
    tcl_file.close()


def main ():
    SetGlobals()
    lib_name = None
    system_top = False
    if(AHIR_RELEASE == None):
        logError (" environment variable AHIR_RELEASE is not defined." )
        return 1
       
    if (len(sys.argv) < 4 ): 
        display_usage()
        return 1
    else :
        arg_list = sys.argv[1:]
        opts,args = getopt.getopt(arg_list,'d:l:p:g:h')
        for option, parameter in opts:
            if option ==  '-l':
                lib_name = parameter
            if option ==  '-d':
                design = parameter
            if option == '-p':
            	period = parameter
	    if option ==  '-g':
                sgib = parameter
            if option ==  '-h':
                display_usage()
		return 0
            
                
    generateTCL(design, period, lib_name, sgib)
        
    return 0





if __name__ == '__main__':
    ret = main()
    sys.exit(ret)
