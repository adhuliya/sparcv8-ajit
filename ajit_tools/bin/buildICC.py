#!/usr/bin/env python

# Generates the .tcl xfiles necessary for IC Compiler place and route tool
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
    print "$  buildICC.py -d <design name> -p <clock period> \n"
    print " -h <no parameter required. used to get help> \n"
    

    
def generateTCL(design, period):
           
    tcl_file = open( "icc.tcl","w")
    
    print >> tcl_file, "set_app_var search_path {"+AJIT_PROJECT_HOME+"/processor/ASIC/io_n_std/tsl18fs120_4lm_fr "+AJIT_PROJECT_HOME+"/processor/ASIC/io_n_std/tsl18cio150_4lm_dv " +AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/milkyway "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/obc11_256x8 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/obc11_dpram_16x8 "+ AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/spram_32x16 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/spram_512X24 "+AJIT_PROJECT_HOME+"/processor/ASIC/memories_mw/SPRAM_16x4 "+AJIT_PROJECT_HOME+"/processor/ASIC/db_files "+AJIT_PROJECT_HOME+"/processor/ASIC/tech_topo}"
   
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
    print >> tcl_file, "open_mw_lib syn_topo"

    print >> tcl_file, "read_ddc ./" + design + "_" + period + "_op_data/" + design + ".ddc"
    print >> tcl_file, "link -force"
    print >> tcl_file, "current_design " + design
    print >> tcl_file, "uniquify_fp_mw_cel"
    
    print >> tcl_file, "global clock_pin"
    print >> tcl_file, "set clock_pin clk" 
    print >> tcl_file, "set clk_period " + period
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

    print >> tcl_file, "create_cell { corner_pad1 corner_pad2 corner_pad3 corner_pad4  } pfrelr" 
    print >> tcl_file, "set_pad_physical_constraints -pad_name "+"\""+"corner_pad1"+"\""+" -side 1"
    print >> tcl_file, "set_pad_physical_constraints -pad_name "+"\""+"corner_pad2"+"\""+" -side 2"
    print >> tcl_file, "set_pad_physical_constraints -pad_name "+"\""+"corner_pad3"+"\""+" -side 3"
    print >> tcl_file, "set_pad_physical_constraints -pad_name "+"\""+"corner_pad4"+"\""+" -side 4"
    print >> tcl_file, "create_cell { VDD VDDX } pvdi" 
    print >> tcl_file, "create_cell { VSS } pv0i" 
    print >> tcl_file, "create_cell { VSSO1 VSSO2 } pv0a"
    print >> tcl_file, "create_cell { VDDO1 VDDO2 } pvda"

    print >> tcl_file, "link -force"
    print >> tcl_file, "set_user_grid -user_grid {{0 0} {0.005 0.005}}"
    print >> tcl_file, "create_floorplan -control_type aspect_ratio -core_aspect_ratio 1 -core_utilization 0.4 -left_io2core 100 -bottom_io2core 100 -right_io2core 100 -top_io2core 100 "

    print >> tcl_file, "derive_pg_connection -power_net {VDDO} -ground_net {VSSO} -power_pin {VDDO} -ground_pin {VSSO} -create_ports top"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -create_ports top"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie"
    print >> tcl_file, "create_rectilinear_rings -around core -nets  {VSS VDD}  -offset {10 10} -width {5 5} -space {10 10} -layers {M3 TOP_M}"
    print >> tcl_file, "preroute_instances  -route_pins_on_layer M2 -primary_routing_layer specified -specified_horizontal_layer M2"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie"
    print >> tcl_file, "set_app_var enable_recovery_removal_arcs true"
    print >> tcl_file, "set_operating_conditions -analysis_type on_chip_variation -max tsl18cio250_max  -min tsl18cio250_min -max_library tsl18cio250_max -min_library tsl18cio250_min"
    print >> tcl_file, "set_app_var timing_remove_clock_reconvergence_pessimism true"
    print >> tcl_file, "set_fix_hold [all_clocks]"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}"
    print >> tcl_file, "derive_pg_connection -power_net {VDDO} -ground_net {VSSO} -power_pin {VDDO} -ground_pin {VSSO}"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie"
    print >> tcl_file, "set_ideal_network [all_fanout -flat -clock_tree]"
    print >> tcl_file, "set_fp_placement_strategy -auto_grouping low -macro_orientation all -macro_setup_only off -min_distance_between_macros 20 -IO_net_weight 4 -force_auto_detect_hierarchy true -macros_on_edge off -pin_routing_aware on -sliver_size 10 -snap_macros_to_user_grid on -congestion_effort low -virtual_IPO true "
    print >> tcl_file, "create_fp_placement -effort low -optimize_pins -congestion_driven -timing_driven"
    print >> tcl_file, "set_attribute [all_macro_cells] is_fixed true "

    print >> tcl_file, "legalize_placement"
    print >> tcl_file, "place_opt"
    print >> tcl_file, "preroute_standard_cells -route_pins_on_layer M1  -connect horizontal  -fill_empty_rows  -port_filter_mode off -cell_master_filter_mode off -cell_instance_filter_mode off -voltage_area_filter_mode off -route_type {P/G Std. Cell Pin Conn} -do_not_route_over_macros"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -tie"
    print >> tcl_file, "report_placement_utilization > ./" + design + "_pnr_reports/" + design + "_fp_util.rpt"
    print >> tcl_file, "check_timing"
    print >> tcl_file, "check_legality"
    print >> tcl_file, "report_timing -nworst 2 -max_paths 10 > ./"+ design + "_pnr_reports/"+ design + "_placed_timing.rpt"
    print >> tcl_file, "check_physical_design -stage pre_clock_opt -output ./pre_cts_check"
    print >> tcl_file, "set_si_options -delta_delay true -route_xtalk_prevention true -static_noise true"
    print >> tcl_file, "remove_ideal_network -all"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}"

    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie"
    print >> tcl_file, "set_route_zrt_common_options -read_user_metal_blockage_layer true"
    print >> tcl_file, "set_route_zrt_global_options -effort medium -timing_driven true -crosstalk_driven true"
    print >> tcl_file, "set_app_var timing_enable_multiple_clocks_per_reg true"
    print >> tcl_file, "set_app_var cto_enable_drc_fixing true"
    print >> tcl_file, "set_clock_tree_optimization_options -enable_multicorner_optimization all"
    print >> tcl_file, "set_fix_hold [all_clocks]"
    print >> tcl_file, "define_routing_rule dsdw -spacings { M2 0.4 M3 0.4 TOP_M 0.5} -widths { M2 0.4 M3 0.4 TOP_M 0.5}"
    print >> tcl_file, "set_clock_tree_options -routing_rule dsdw -layer_list {M2 M3 TOP_M}"
    print >> tcl_file, "clock_opt -fix_hold_all_clocks -update_clock_latency -continue_on_missing_scandef -congestion "

    print >> tcl_file, "set_propagated_clock [all_clocks]"
    print >> tcl_file, "report_timing > ./" + design + "_pnr_reports/"+ design + "_cts_timing.rpt"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS} -tie"
    print >> tcl_file, "insert_pad_filler -cell {pfeed30000 pfeed10000 pfeed02000 pfeed01000 pfeed00540 pfeed00120 pfeed00040 pfeed00010}"
    print >> tcl_file, "report_congestion > ./"+ design + "_pnr_reports/"+design + "_congestion_b4_routing.rpt"
    print >> tcl_file, "define_routing_rule double_spacing -spacings {M2 0.4 M3 0.4 TOP_M 0.5}"
    print >> tcl_file, "set_net_routing_rule -rule double_spacing [remove_from_collection [get_nets *] [get_nets -hierarchical -filter "+"\""+"net_type == Clock"+"\""+"]]"
    print >> tcl_file, "check_routeability -error_cell block_withpad.err"
    print >> tcl_file, "set lib [current_mw_lib]"
    print >> tcl_file, "remove_antenna_rules $lib"

    print >> tcl_file, "define_antenna_rule $lib -mode 4 -diode_mode 2 -metal_ratio 350 -cut_ratio 20"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"M1"+"\""+" -ratio 350 -diode_ratio { 0.203 0 400 2200}"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"M2"+"\""+" -ratio 350 -diode_ratio { 0.203 0 400 2200}"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"M3"+"\""+" -ratio 350 -diode_ratio { 0.203 0 400 2200}"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"TOP_M"+"\""+ " -ratio 350 -diode_ratio {0.203 0 8000 30000}"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"V2"+"\""+" -ratio 20 -diode_ratio {0.203 0 83.33 75}"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"V3"+"\""+" -ratio 20 -diode_ratio {0.203 0 83.33 75}"
    print >> tcl_file, "define_antenna_layer_rule $lib -mode 4 -layer "+"\""+"TOP_V"+"\""+" -ratio 20 -diode_ratio {0.203 0 83.33 75}"
    print >> tcl_file, "set input_port [get_ports [all_inputs]]"

    print >> tcl_file, "foreach_in_collection itr $input_port {"
    print >> tcl_file, "set port "+"\""+"[get_object_name $itr]"+"\""
    print >> tcl_file, "define_io_gate_size  -pin_name  $port -values {0.01}}"
    print >> tcl_file, "set_si_options -delta_delay true -static_noise true"
    
    print >> tcl_file, "route_opt"
    print >> tcl_file, "report_congestion > ./" +design +"_pnr_reports/"+design + "_congestion_aftr_routing.rpt"
    print >> tcl_file, "report_qor > ./" +design +"_pnr_reports/"+ design + "_after_place_qor.rpt" 
    print >> tcl_file, "insert_stdcell_filler  -cell_without_metal {feedth9 feedth3 feedth}  -cell_with_metal {feedth9 feedth3 feedth}  -connect_to_power {VDD}  -connect_to_ground {VSS} "

    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -power_pin {VDD} -ground_pin {VSS}"
    print >> tcl_file, "derive_pg_connection -power_net {VDDO} -ground_net {VSSO} -power_pin {VDDO} -ground_pin {VSSO}"
    print >> tcl_file, "derive_pg_connection -power_net {VDD} -ground_net {VSS} -tie"
    print >> tcl_file, "define_name_rules my_rule -case_insensitive"
    print >> tcl_file, "report_name_rules my_rule"
    print >> tcl_file, "change_names -rules my_rule -hierarchy"
    print >> tcl_file, "report_timing -delay_type max -max_paths 10 > " + design +"_pnr_reports/"+design + "_final_setup_timing.rpt"
    print >> tcl_file, "report_timing -delay_type min -max_paths 10 > " + design +"_pnr_reports/"+design + "_final_hold_timing.rpt"
    print >> tcl_file, "report_constraint -all_violators > ./"+ design +"_pnr_reports/"+ design + "_final_violators.rpt"
    print >> tcl_file, "report_power > "+design +"_pnr_reports/"+ design + "_final_power.rpt"
    print >> tcl_file, "set_write_stream_options -skip_ref_lib_cells -output_pin geometry -output_pin text -keep_data_type -map_layer " + AJIT_PROJECT_HOME +"/processor/ASIC/tech_topo/RCE_TS18SL_SCL_STAR_RCXT_4M1L_TYP.map"
    print >> tcl_file, "write_stream -format gds -lib_name syn_topo ./"+design+"_pnr_reports/"+ design + ".gds"
    print >> tcl_file, "write_verilog -pg -no_corner_pad_cells -no_pad_filler_cells -no_core_filler_cells -supply_statement all -force_no_output_references {feedth9 feedth3 feedth} ./"+design+"_pnr_reports/"+design+"_icc_out.v"
    print >> tcl_file, "write_verilog  -no_corner_pad_cells -no_pad_filler_cells -no_core_filler_cells  -force_no_output_references {feedth9 feedth3 feedth} ./"+ design+"_pnr_reports/"+design+"_no_pg_icc_out.v"
    print >> tcl_file, "write_sdc ./"+design+"_pnr_reports/"+design+"_icc.sdc"
    print >> tcl_file, "write_def -output ./"+design+"_pnr_reports/"+design+"_icc.def"
   # print >> tcl_file, "write_parasitics -format SPEF -output -compress ./"+design+"_pnr_reports/"+design+"_icc.gzip"
    #print >> tcl_file, "close_mw_lib -save"
    tcl_file.close()


def main ():
    SetGlobals()
    lib_name = None
    system_top = False
    if(AHIR_RELEASE == None):
        logError (" environment variable AHIR_RELEASE is not defined." )
        return 1
       
    if (len(sys.argv) < 2 ): 
        display_usage()
        return 1
    else :
        arg_list = sys.argv[1:]
        opts,args = getopt.getopt(arg_list,'d:p:h')
        for option, parameter in opts:
            if option ==  '-d':
                design = parameter
            if option == '-p':
            	period = parameter
            if option ==  '-h':
                display_usage()
		return 0
            
                
    generateTCL(design, period)
        
    return 0





if __name__ == '__main__':
    ret = main()
    sys.exit(ret)
