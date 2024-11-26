# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/CODWork/SCCPU_SOC/SCCPU_SOC.cache/wt [current_project]
set_property parent.project_path D:/CODWork/SCCPU_SOC/SCCPU_SOC.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo d:/CODWork/SCCPU_SOC/SCCPU_SOC.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files D:/CODWork/SCCPU_SOC/SCCPU_SOC.ip_user_files/mem_init_files/mipstestloop_fpga.coe
read_verilog -library xil_defaultlib {
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/EXT.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU_FPGATop/MIO_BUS.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU_FPGATop/Multi_CH32.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/ctrl_encode_def.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/NPC.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/PC.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/RF.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/alu.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU_FPGATop/clk_div.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/ctrl.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU_FPGATop/dm.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/mux.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU/sccpu.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU_FPGATop/seg7x16.v
  D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/imports/source/SCCPU_FPGATop/SCCPU_Top.v
}
read_ip -quiet D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/ip/imem/imem.xci
set_property used_in_implementation false [get_files -all d:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/ip/imem/imem_ooc.xdc]
set_property is_locked true [get_files D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/sources_1/ip/imem/imem.xci]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/constrs_1/imports/source/Nexys4DDR_CPU.xdc
set_property used_in_implementation false [get_files D:/CODWork/SCCPU_SOC/SCCPU_SOC.srcs/constrs_1/imports/source/Nexys4DDR_CPU.xdc]


synth_design -top SCCPUSOC_Top -part xc7a100tcsg324-1


write_checkpoint -force -noxdef SCCPUSOC_Top.dcp

catch { report_utilization -file SCCPUSOC_Top_utilization_synth.rpt -pb SCCPUSOC_Top_utilization_synth.pb }
