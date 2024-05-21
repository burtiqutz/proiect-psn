############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2017 Xilinx, Inc. All Rights Reserved.
############################################################
open_project calculator_stiintific
add_files ../Vivado_HLS/2016.4/suma
open_solution "solution1"
set_part {xc7a100tcsg324-1} -tool vivado
create_clock -period 10 -name default
#source "./calculator_stiintific/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design
export_design -format ip_catalog
