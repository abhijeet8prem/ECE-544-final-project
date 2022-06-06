//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sun Jun  5 19:16:44 2022
//Host        : BACCHUS running 64-bit major release  (build 9200)
//Command     : generate_target embsys_wrapper.bd
//Design      : embsys_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module embsys_wrapper
   (PWM,
    PmodOLEDrgb_out_0_pin10_io,
    PmodOLEDrgb_out_0_pin1_io,
    PmodOLEDrgb_out_0_pin2_io,
    PmodOLEDrgb_out_0_pin3_io,
    PmodOLEDrgb_out_0_pin4_io,
    PmodOLEDrgb_out_0_pin7_io,
    PmodOLEDrgb_out_0_pin8_io,
    PmodOLEDrgb_out_0_pin9_io,
    RGB1_Blue_0,
    RGB1_Green_0,
    RGB1_Red_0,
    RGB2_Blue_0,
    RGB2_Green_0,
    RGB2_Red_0,
    an_0,
    btnC_0,
    btnD_0,
    btnL_0,
    btnR_0,
    btnU_0,
    dp_0,
    encA,
    encB,
    encBTN,
    encSWT,
    gpio_rtl_0_tri_i,
    gpio_rtl_1_tri_i,
    led_0,
    seg_0,
    sw_0,
    sysclk,
    sysreset_n,
    uart_rtl_0_rxd,
    uart_rtl_0_txd,
    vn_in,
    vp_in);
  output [7:0]PWM;
  inout PmodOLEDrgb_out_0_pin10_io;
  inout PmodOLEDrgb_out_0_pin1_io;
  inout PmodOLEDrgb_out_0_pin2_io;
  inout PmodOLEDrgb_out_0_pin3_io;
  inout PmodOLEDrgb_out_0_pin4_io;
  inout PmodOLEDrgb_out_0_pin7_io;
  inout PmodOLEDrgb_out_0_pin8_io;
  inout PmodOLEDrgb_out_0_pin9_io;
  output RGB1_Blue_0;
  output RGB1_Green_0;
  output RGB1_Red_0;
  output RGB2_Blue_0;
  output RGB2_Green_0;
  output RGB2_Red_0;
  output [7:0]an_0;
  input btnC_0;
  input btnD_0;
  input btnL_0;
  input btnR_0;
  input btnU_0;
  output dp_0;
  input encA;
  input encB;
  input encBTN;
  input encSWT;
  input [7:0]gpio_rtl_0_tri_i;
  input [7:0]gpio_rtl_1_tri_i;
  output [15:0]led_0;
  output [6:0]seg_0;
  input [15:0]sw_0;
  input sysclk;
  input sysreset_n;
  input uart_rtl_0_rxd;
  output uart_rtl_0_txd;
  input vn_in;
  input vp_in;

  wire [7:0]PWM;
  wire PmodOLEDrgb_out_0_pin10_i;
  wire PmodOLEDrgb_out_0_pin10_io;
  wire PmodOLEDrgb_out_0_pin10_o;
  wire PmodOLEDrgb_out_0_pin10_t;
  wire PmodOLEDrgb_out_0_pin1_i;
  wire PmodOLEDrgb_out_0_pin1_io;
  wire PmodOLEDrgb_out_0_pin1_o;
  wire PmodOLEDrgb_out_0_pin1_t;
  wire PmodOLEDrgb_out_0_pin2_i;
  wire PmodOLEDrgb_out_0_pin2_io;
  wire PmodOLEDrgb_out_0_pin2_o;
  wire PmodOLEDrgb_out_0_pin2_t;
  wire PmodOLEDrgb_out_0_pin3_i;
  wire PmodOLEDrgb_out_0_pin3_io;
  wire PmodOLEDrgb_out_0_pin3_o;
  wire PmodOLEDrgb_out_0_pin3_t;
  wire PmodOLEDrgb_out_0_pin4_i;
  wire PmodOLEDrgb_out_0_pin4_io;
  wire PmodOLEDrgb_out_0_pin4_o;
  wire PmodOLEDrgb_out_0_pin4_t;
  wire PmodOLEDrgb_out_0_pin7_i;
  wire PmodOLEDrgb_out_0_pin7_io;
  wire PmodOLEDrgb_out_0_pin7_o;
  wire PmodOLEDrgb_out_0_pin7_t;
  wire PmodOLEDrgb_out_0_pin8_i;
  wire PmodOLEDrgb_out_0_pin8_io;
  wire PmodOLEDrgb_out_0_pin8_o;
  wire PmodOLEDrgb_out_0_pin8_t;
  wire PmodOLEDrgb_out_0_pin9_i;
  wire PmodOLEDrgb_out_0_pin9_io;
  wire PmodOLEDrgb_out_0_pin9_o;
  wire PmodOLEDrgb_out_0_pin9_t;
  wire RGB1_Blue_0;
  wire RGB1_Green_0;
  wire RGB1_Red_0;
  wire RGB2_Blue_0;
  wire RGB2_Green_0;
  wire RGB2_Red_0;
  wire [7:0]an_0;
  wire btnC_0;
  wire btnD_0;
  wire btnL_0;
  wire btnR_0;
  wire btnU_0;
  wire dp_0;
  wire encA;
  wire encB;
  wire encBTN;
  wire encSWT;
  wire [7:0]gpio_rtl_0_tri_i;
  wire [7:0]gpio_rtl_1_tri_i;
  wire [15:0]led_0;
  wire [6:0]seg_0;
  wire [15:0]sw_0;
  wire sysclk;
  wire sysreset_n;
  wire uart_rtl_0_rxd;
  wire uart_rtl_0_txd;
  wire vn_in;
  wire vp_in;

  IOBUF PmodOLEDrgb_out_0_pin10_iobuf
       (.I(PmodOLEDrgb_out_0_pin10_o),
        .IO(PmodOLEDrgb_out_0_pin10_io),
        .O(PmodOLEDrgb_out_0_pin10_i),
        .T(PmodOLEDrgb_out_0_pin10_t));
  IOBUF PmodOLEDrgb_out_0_pin1_iobuf
       (.I(PmodOLEDrgb_out_0_pin1_o),
        .IO(PmodOLEDrgb_out_0_pin1_io),
        .O(PmodOLEDrgb_out_0_pin1_i),
        .T(PmodOLEDrgb_out_0_pin1_t));
  IOBUF PmodOLEDrgb_out_0_pin2_iobuf
       (.I(PmodOLEDrgb_out_0_pin2_o),
        .IO(PmodOLEDrgb_out_0_pin2_io),
        .O(PmodOLEDrgb_out_0_pin2_i),
        .T(PmodOLEDrgb_out_0_pin2_t));
  IOBUF PmodOLEDrgb_out_0_pin3_iobuf
       (.I(PmodOLEDrgb_out_0_pin3_o),
        .IO(PmodOLEDrgb_out_0_pin3_io),
        .O(PmodOLEDrgb_out_0_pin3_i),
        .T(PmodOLEDrgb_out_0_pin3_t));
  IOBUF PmodOLEDrgb_out_0_pin4_iobuf
       (.I(PmodOLEDrgb_out_0_pin4_o),
        .IO(PmodOLEDrgb_out_0_pin4_io),
        .O(PmodOLEDrgb_out_0_pin4_i),
        .T(PmodOLEDrgb_out_0_pin4_t));
  IOBUF PmodOLEDrgb_out_0_pin7_iobuf
       (.I(PmodOLEDrgb_out_0_pin7_o),
        .IO(PmodOLEDrgb_out_0_pin7_io),
        .O(PmodOLEDrgb_out_0_pin7_i),
        .T(PmodOLEDrgb_out_0_pin7_t));
  IOBUF PmodOLEDrgb_out_0_pin8_iobuf
       (.I(PmodOLEDrgb_out_0_pin8_o),
        .IO(PmodOLEDrgb_out_0_pin8_io),
        .O(PmodOLEDrgb_out_0_pin8_i),
        .T(PmodOLEDrgb_out_0_pin8_t));
  IOBUF PmodOLEDrgb_out_0_pin9_iobuf
       (.I(PmodOLEDrgb_out_0_pin9_o),
        .IO(PmodOLEDrgb_out_0_pin9_io),
        .O(PmodOLEDrgb_out_0_pin9_i),
        .T(PmodOLEDrgb_out_0_pin9_t));
  embsys embsys_i
       (.PWM(PWM),
        .PmodOLEDrgb_out_0_pin10_i(PmodOLEDrgb_out_0_pin10_i),
        .PmodOLEDrgb_out_0_pin10_o(PmodOLEDrgb_out_0_pin10_o),
        .PmodOLEDrgb_out_0_pin10_t(PmodOLEDrgb_out_0_pin10_t),
        .PmodOLEDrgb_out_0_pin1_i(PmodOLEDrgb_out_0_pin1_i),
        .PmodOLEDrgb_out_0_pin1_o(PmodOLEDrgb_out_0_pin1_o),
        .PmodOLEDrgb_out_0_pin1_t(PmodOLEDrgb_out_0_pin1_t),
        .PmodOLEDrgb_out_0_pin2_i(PmodOLEDrgb_out_0_pin2_i),
        .PmodOLEDrgb_out_0_pin2_o(PmodOLEDrgb_out_0_pin2_o),
        .PmodOLEDrgb_out_0_pin2_t(PmodOLEDrgb_out_0_pin2_t),
        .PmodOLEDrgb_out_0_pin3_i(PmodOLEDrgb_out_0_pin3_i),
        .PmodOLEDrgb_out_0_pin3_o(PmodOLEDrgb_out_0_pin3_o),
        .PmodOLEDrgb_out_0_pin3_t(PmodOLEDrgb_out_0_pin3_t),
        .PmodOLEDrgb_out_0_pin4_i(PmodOLEDrgb_out_0_pin4_i),
        .PmodOLEDrgb_out_0_pin4_o(PmodOLEDrgb_out_0_pin4_o),
        .PmodOLEDrgb_out_0_pin4_t(PmodOLEDrgb_out_0_pin4_t),
        .PmodOLEDrgb_out_0_pin7_i(PmodOLEDrgb_out_0_pin7_i),
        .PmodOLEDrgb_out_0_pin7_o(PmodOLEDrgb_out_0_pin7_o),
        .PmodOLEDrgb_out_0_pin7_t(PmodOLEDrgb_out_0_pin7_t),
        .PmodOLEDrgb_out_0_pin8_i(PmodOLEDrgb_out_0_pin8_i),
        .PmodOLEDrgb_out_0_pin8_o(PmodOLEDrgb_out_0_pin8_o),
        .PmodOLEDrgb_out_0_pin8_t(PmodOLEDrgb_out_0_pin8_t),
        .PmodOLEDrgb_out_0_pin9_i(PmodOLEDrgb_out_0_pin9_i),
        .PmodOLEDrgb_out_0_pin9_o(PmodOLEDrgb_out_0_pin9_o),
        .PmodOLEDrgb_out_0_pin9_t(PmodOLEDrgb_out_0_pin9_t),
        .RGB1_Blue_0(RGB1_Blue_0),
        .RGB1_Green_0(RGB1_Green_0),
        .RGB1_Red_0(RGB1_Red_0),
        .RGB2_Blue_0(RGB2_Blue_0),
        .RGB2_Green_0(RGB2_Green_0),
        .RGB2_Red_0(RGB2_Red_0),
        .an_0(an_0),
        .btnC_0(btnC_0),
        .btnD_0(btnD_0),
        .btnL_0(btnL_0),
        .btnR_0(btnR_0),
        .btnU_0(btnU_0),
        .dp_0(dp_0),
        .encA(encA),
        .encB(encB),
        .encBTN(encBTN),
        .encSWT(encSWT),
        .gpio_rtl_0_tri_i(gpio_rtl_0_tri_i),
        .gpio_rtl_1_tri_i(gpio_rtl_1_tri_i),
        .led_0(led_0),
        .seg_0(seg_0),
        .sw_0(sw_0),
        .sysclk(sysclk),
        .sysreset_n(sysreset_n),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd),
        .vn_in(vn_in),
        .vp_in(vp_in));
endmodule
