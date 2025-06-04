#######################################################
#                                                     
#  Tempus Timing Solution Command Logging File                     
#  Created on Tue Jun  3 21:35:33 2025                
#                                                     
#######################################################

#@(#)CDS: Tempus Timing Solution v22.13-s095_1 (64bit) 08/28/2023 11:00 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: NanoRoute 22.13-s095_1 NR230808-0153/22_13-UB (database version 18.20.615) {superthreading v2.20}
#@(#)CDS: AAE 22.13-s029 (64bit) 08/28/2023 (Linux 3.10.0-693.el7.x86_64)
#@(#)CDS: CTE 22.13-s030_1 () Aug 22 2023 02:51:11 ( )
#@(#)CDS: SYNTECH 22.13-s015_1 () Aug 20 2023 22:21:55 ( )
#@(#)CDS: CPE v22.13-s082

#@ Begin verbose source /mnt/vol_NFS_cadencedata/ESTUDIANTES/VLSI003/vlsig02af/LAB3/LOGIC_SYNTH/tcl/sta.tcl (pre)
set PROY_ROOT ${env(PROY_ROOT)}
set WORK_DIR ${PROY_ROOT}/work
set LIB_PATH "${PROY_ROOT}/lib/timing"
set RTL_PATH ${env(RTL_PATH)}
set SDC_PATH $PROY_ROOT/src/constraints
set TB_PATH $PROY_ROOT/src/testbench
set TOP_DESIGN ${env(TOP_DESIGN)}
read_mmmc ${env(SCRIPTS_PATH)}/view_definition.tcl
#@ Begin verbose source /mnt/vol_NFS_cadencedata/ESTUDIANTES/VLSI003/vlsig02af/LAB3/LOGIC_SYNTH/tcl/view_definition.tcl (pre)
create_library_set -name fast\
    -timing\
    [list $LIB_PATH/gpdk_wp_1p9v_0c.lib]
create_library_set -name slow\
    -timing\
    [list $LIB_PATH/gpdk_ws_1p65v_125c.lib]
create_timing_condition -name default_mapping_tc_2\
    -library_sets [list fast]
create_timing_condition -name default_mapping_tc_1\
    -library_sets [list slow]
create_opcond -name PVT1 \
    -process 1 \
    -voltage 2 \
    -temperature 120 \
    
create_delay_corner -name slow_max\
    -timing_condition {default_mapping_tc_1}
create_delay_corner -name fast_min\
    -timing_condition {default_mapping_tc_2}
create_constraint_mode -name functional\
    -sdc_files\
    [list ${WORK_DIR}/synth/outputs/${TOP_DESIGN}_sdc.sdc]
create_analysis_view -name func_slow_max -constraint_mode functional -delay_corner slow_max
create_analysis_view -name func_fast_min -constraint_mode functional -delay_corner fast_min
set_analysis_view -setup [list func_slow_max] -hold [list func_fast_min]
#@ End verbose source /mnt/vol_NFS_cadencedata/ESTUDIANTES/VLSI003/vlsig02af/LAB3/LOGIC_SYNTH/tcl/view_definition.tcl
read_netlist ${WORK_DIR}/synth/outputs/${TOP_DESIGN}_netlist.v 
init_design
report_timing -path_type full_clock -max_paths 100 > reports/timing_report_late.rpt
report_timing -path_type full_clock -max_paths 100 -early > reports/timing_report_early.rpt
report_constraint -all_violators > reports/timing_all_violators.rpt
exit
