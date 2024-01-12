############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project mini_project
set_top nn_inference
add_files matmul.cpp
add_files matmul.hpp
add_files -tb matmul_tb.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "project_mini" -flow_target vivado
set_part {xczu3eg-sbva484-1-e}
create_clock -period 12 -name default
config_export -format ip_catalog -output /home/oliver/Documents/Study/Embedded/Final_Project/MiniProject_ES/src/hls/nn_inference.zip -rtl vhdl
source "./mini_project/project_mini/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl vhdl -format ip_catalog -output /home/oliver/Documents/Study/Embedded/Final_Project/MiniProject_ES/src/hls/nn_inference.zip
