# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/CODWork/MCCPU_SOC/MCCPU_SOC.cache/wt [current_project]
set_property parent.project_path D:/CODWork/MCCPU_SOC/MCCPU_SOC.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/CODWork/MCCPU_SOC/MCCPU_SOC.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/CODWork/MCCPU_SOC/MCCPU_SOC.ip_user_files/mem_init_files/mipstestloopjal_fpga.coe
read_verilog -library xil_defaultlib {
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/EXT.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/FPGATop/MIO_BUS.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/FPGATop/Multi_CH32.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/RF.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/ctrl_encode_def.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/alu.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/FPGATop/clk_div.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/ctrl.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/flopenr.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/flopr.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/mccpu.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/mux.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/FPGATop/seg7x16.v
  D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/imports/MCCPU/FPGATop/MCCPU_Top.v
}
read_ip -quiet D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/ip/dmem/dmem.xci
set_property used_in_implementation false [get_files -all d:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/ip/dmem/dmem_ooc.xdc]
set_property is_locked true [get_files D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/sources_1/ip/dmem/dmem.xci]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/constrs_1/imports/source/Nexys4DDR_CPU.xdc
set_property used_in_implementation false [get_files D:/CODWork/MCCPU_SOC/MCCPU_SOC.srcs/constrs_1/imports/source/Nexys4DDR_CPU.xdc]


synth_design -top MCCPUSOC_Top -part xc7a100tcsg324-1


write_checkpoint -force -noxdef MCCPUSOC_Top.dcp

catch { report_utilization -file MCCPUSOC_Top_utilization_synth.rpt -pb MCCPUSOC_Top_utilization_synth.pb }
