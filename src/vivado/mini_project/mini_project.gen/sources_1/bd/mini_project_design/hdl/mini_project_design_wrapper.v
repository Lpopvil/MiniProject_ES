//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Tue Dec  5 17:02:06 2023
//Host        : oliver-pc running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target mini_project_design_wrapper.bd
//Design      : mini_project_design_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module mini_project_design_wrapper
   (led_ctrl1_1,
    led_ctrl2_1,
    led_ctrl3_1,
    led_ctrl4_1);
  output led_ctrl1_1;
  output led_ctrl2_1;
  output led_ctrl3_1;
  output led_ctrl4_1;

  wire led_ctrl1_1;
  wire led_ctrl2_1;
  wire led_ctrl3_1;
  wire led_ctrl4_1;

  mini_project_design mini_project_design_i
       (.led_ctrl1_1(led_ctrl1_1),
        .led_ctrl2_1(led_ctrl2_1),
        .led_ctrl3_1(led_ctrl3_1),
        .led_ctrl4_1(led_ctrl4_1));
endmodule
