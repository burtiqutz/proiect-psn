# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.cache/wt [current_project]
set_property parent.project_path C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/full_sub1bit.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/halfadder_1bit.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/full_adder1bit.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/full_sub8bit.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/8bitadder.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/inmultire.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/impartire.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/debouncer.vhd
  C:/Users/Alex/Downloads/ssd.vhd
  C:/Xilinx/Projects/calculator_stiintific/calculator_stiintific.srcs/sources_1/new/ALU.vhd
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Alex/Downloads/Nexys-A7-100T-Master.xdc
set_property used_in_implementation false [get_files C:/Users/Alex/Downloads/Nexys-A7-100T-Master.xdc]


synth_design -top ALU -part xc7a100tcsg324-1


write_checkpoint -force -noxdef ALU.dcp

catch { report_utilization -file ALU_utilization_synth.rpt -pb ALU_utilization_synth.pb }
