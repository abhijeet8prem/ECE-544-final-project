// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Fri Jun  3 07:04:57 2022
// Host        : BACCHUS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top embsys_PmodENC544_0_0 -prefix
//               embsys_PmodENC544_0_0_ embsys_PmodENC544_0_0_sim_netlist.v
// Design      : embsys_PmodENC544_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module embsys_PmodENC544_0_0_PmodENC544_v1_0
   (S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    encA,
    s00_axi_aclk,
    encB,
    encBTN,
    encSWT,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input encA;
  input s00_axi_aclk;
  input encB;
  input encBTN;
  input encSWT;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire encA;
  wire encB;
  wire encBTN;
  wire encSWT;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  embsys_PmodENC544_0_0_PmodENC544_v1_0_S00_AXI PmodENC544_v1_0_S00_AXI_inst
       (.S_AXI_ARREADY(S_AXI_ARREADY),
        .S_AXI_AWREADY(S_AXI_AWREADY),
        .S_AXI_WREADY(S_AXI_WREADY),
        .encA(encA),
        .encB(encB),
        .encBTN(encBTN),
        .encSWT(encSWT),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module embsys_PmodENC544_0_0_PmodENC544_v1_0_S00_AXI
   (S_AXI_WREADY,
    S_AXI_AWREADY,
    S_AXI_ARREADY,
    s00_axi_rdata,
    s00_axi_rvalid,
    s00_axi_bvalid,
    encA,
    s00_axi_aclk,
    encB,
    encBTN,
    encSWT,
    s00_axi_araddr,
    s00_axi_arvalid,
    s00_axi_awaddr,
    s00_axi_wvalid,
    s00_axi_awvalid,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_aresetn,
    s00_axi_bready,
    s00_axi_rready);
  output S_AXI_WREADY;
  output S_AXI_AWREADY;
  output S_AXI_ARREADY;
  output [31:0]s00_axi_rdata;
  output s00_axi_rvalid;
  output s00_axi_bvalid;
  input encA;
  input s00_axi_aclk;
  input encB;
  input encBTN;
  input encSWT;
  input [1:0]s00_axi_araddr;
  input s00_axi_arvalid;
  input [1:0]s00_axi_awaddr;
  input s00_axi_wvalid;
  input s00_axi_awvalid;
  input [31:0]s00_axi_wdata;
  input [3:0]s00_axi_wstrb;
  input s00_axi_aresetn;
  input s00_axi_bready;
  input s00_axi_rready;

  wire ROTFILTER_n_1;
  wire ROTFILTER_n_10;
  wire ROTFILTER_n_11;
  wire ROTFILTER_n_12;
  wire ROTFILTER_n_13;
  wire ROTFILTER_n_14;
  wire ROTFILTER_n_15;
  wire ROTFILTER_n_16;
  wire ROTFILTER_n_17;
  wire ROTFILTER_n_18;
  wire ROTFILTER_n_19;
  wire ROTFILTER_n_2;
  wire ROTFILTER_n_20;
  wire ROTFILTER_n_21;
  wire ROTFILTER_n_22;
  wire ROTFILTER_n_23;
  wire ROTFILTER_n_24;
  wire ROTFILTER_n_25;
  wire ROTFILTER_n_26;
  wire ROTFILTER_n_27;
  wire ROTFILTER_n_28;
  wire ROTFILTER_n_29;
  wire ROTFILTER_n_3;
  wire ROTFILTER_n_30;
  wire ROTFILTER_n_31;
  wire ROTFILTER_n_32;
  wire ROTFILTER_n_4;
  wire ROTFILTER_n_5;
  wire ROTFILTER_n_6;
  wire ROTFILTER_n_7;
  wire ROTFILTER_n_8;
  wire ROTFILTER_n_9;
  wire S_AXI_ARREADY;
  wire S_AXI_AWREADY;
  wire S_AXI_WREADY;
  wire aw_en_i_1_n_0;
  wire aw_en_reg_n_0;
  wire [3:2]axi_araddr;
  wire \axi_araddr[2]_i_1_n_0 ;
  wire \axi_araddr[3]_i_1_n_0 ;
  wire axi_arready0;
  wire [3:2]axi_awaddr;
  wire \axi_awaddr[2]_i_1_n_0 ;
  wire \axi_awaddr[3]_i_1_n_0 ;
  wire axi_awready0;
  wire axi_awready_i_1_n_0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire clear;
  wire [1:0]db_out;
  wire encA;
  wire encB;
  wire encBTN;
  wire encSWT;
  wire [31:7]p_1_in;
  wire [31:0]reg_data_out;
  wire [31:0]rotary_count_reg;
  wire rotary_event;
  wire s00_axi_aclk;
  wire [1:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arvalid;
  wire [1:0]s00_axi_awaddr;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;
  wire \slv_reg2[15]_i_1_n_0 ;
  wire \slv_reg2[23]_i_1_n_0 ;
  wire \slv_reg2[31]_i_1_n_0 ;
  wire \slv_reg2[7]_i_1_n_0 ;
  wire \slv_reg2_reg_n_0_[10] ;
  wire \slv_reg2_reg_n_0_[11] ;
  wire \slv_reg2_reg_n_0_[12] ;
  wire \slv_reg2_reg_n_0_[13] ;
  wire \slv_reg2_reg_n_0_[14] ;
  wire \slv_reg2_reg_n_0_[15] ;
  wire \slv_reg2_reg_n_0_[16] ;
  wire \slv_reg2_reg_n_0_[17] ;
  wire \slv_reg2_reg_n_0_[18] ;
  wire \slv_reg2_reg_n_0_[19] ;
  wire \slv_reg2_reg_n_0_[1] ;
  wire \slv_reg2_reg_n_0_[20] ;
  wire \slv_reg2_reg_n_0_[21] ;
  wire \slv_reg2_reg_n_0_[22] ;
  wire \slv_reg2_reg_n_0_[23] ;
  wire \slv_reg2_reg_n_0_[24] ;
  wire \slv_reg2_reg_n_0_[25] ;
  wire \slv_reg2_reg_n_0_[26] ;
  wire \slv_reg2_reg_n_0_[27] ;
  wire \slv_reg2_reg_n_0_[28] ;
  wire \slv_reg2_reg_n_0_[29] ;
  wire \slv_reg2_reg_n_0_[2] ;
  wire \slv_reg2_reg_n_0_[30] ;
  wire \slv_reg2_reg_n_0_[31] ;
  wire \slv_reg2_reg_n_0_[3] ;
  wire \slv_reg2_reg_n_0_[4] ;
  wire \slv_reg2_reg_n_0_[5] ;
  wire \slv_reg2_reg_n_0_[6] ;
  wire \slv_reg2_reg_n_0_[7] ;
  wire \slv_reg2_reg_n_0_[8] ;
  wire \slv_reg2_reg_n_0_[9] ;
  wire [31:0]slv_reg3;
  wire slv_reg_rden__0;
  wire slv_reg_wren__0;

  embsys_PmodENC544_0_0_debounce DEBOUNCER
       (.db_out(db_out),
        .encBTN(encBTN),
        .encSWT(encSWT),
        .s00_axi_aclk(s00_axi_aclk));
  embsys_PmodENC544_0_0_rotary_filter ROTFILTER
       (.O({ROTFILTER_n_1,ROTFILTER_n_2,ROTFILTER_n_3,ROTFILTER_n_4}),
        .encA(encA),
        .encB(encB),
        .rotary_count_reg(rotary_count_reg),
        .rotary_event(rotary_event),
        .rotary_left_reg_0({ROTFILTER_n_5,ROTFILTER_n_6,ROTFILTER_n_7,ROTFILTER_n_8}),
        .rotary_left_reg_1({ROTFILTER_n_9,ROTFILTER_n_10,ROTFILTER_n_11,ROTFILTER_n_12}),
        .rotary_left_reg_2({ROTFILTER_n_13,ROTFILTER_n_14,ROTFILTER_n_15,ROTFILTER_n_16}),
        .rotary_left_reg_3({ROTFILTER_n_17,ROTFILTER_n_18,ROTFILTER_n_19,ROTFILTER_n_20}),
        .rotary_left_reg_4({ROTFILTER_n_21,ROTFILTER_n_22,ROTFILTER_n_23,ROTFILTER_n_24}),
        .rotary_left_reg_5({ROTFILTER_n_25,ROTFILTER_n_26,ROTFILTER_n_27,ROTFILTER_n_28}),
        .rotary_left_reg_6({ROTFILTER_n_29,ROTFILTER_n_30,ROTFILTER_n_31,ROTFILTER_n_32}),
        .s00_axi_aclk(s00_axi_aclk));
  LUT6 #(
    .INIT(64'hF7FFC4CCC4CCC4CC)) 
    aw_en_i_1
       (.I0(s00_axi_awvalid),
        .I1(aw_en_reg_n_0),
        .I2(S_AXI_AWREADY),
        .I3(s00_axi_wvalid),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(aw_en_i_1_n_0));
  FDSE aw_en_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(aw_en_i_1_n_0),
        .Q(aw_en_reg_n_0),
        .S(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[2]_i_1 
       (.I0(s00_axi_araddr[0]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[2]),
        .O(\axi_araddr[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    \axi_araddr[3]_i_1 
       (.I0(s00_axi_araddr[1]),
        .I1(s00_axi_arvalid),
        .I2(S_AXI_ARREADY),
        .I3(axi_araddr[3]),
        .O(\axi_araddr[3]_i_1_n_0 ));
  FDRE \axi_araddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[2]_i_1_n_0 ),
        .Q(axi_araddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_araddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_araddr[3]_i_1_n_0 ),
        .Q(axi_araddr[3]),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_1
       (.I0(s00_axi_arvalid),
        .I1(S_AXI_ARREADY),
        .O(axi_arready0));
  FDRE axi_arready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[2]_i_1 
       (.I0(s00_axi_awaddr[0]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(axi_awaddr[2]),
        .O(\axi_awaddr[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFBFFFFFF08000000)) 
    \axi_awaddr[3]_i_1 
       (.I0(s00_axi_awaddr[1]),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(aw_en_reg_n_0),
        .I4(s00_axi_awvalid),
        .I5(axi_awaddr[3]),
        .O(\axi_awaddr[3]_i_1_n_0 ));
  FDRE \axi_awaddr_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[2]_i_1_n_0 ),
        .Q(axi_awaddr[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_awaddr_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\axi_awaddr[3]_i_1_n_0 ),
        .Q(axi_awaddr[3]),
        .R(axi_awready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_awready_i_1
       (.I0(s00_axi_aresetn),
        .O(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h2000)) 
    axi_awready_i_2
       (.I0(s00_axi_wvalid),
        .I1(S_AXI_AWREADY),
        .I2(aw_en_reg_n_0),
        .I3(s00_axi_awvalid),
        .O(axi_awready0));
  FDRE axi_awready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000FFFF80008000)) 
    axi_bvalid_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_AWREADY),
        .I3(S_AXI_WREADY),
        .I4(s00_axi_bready),
        .I5(s00_axi_bvalid),
        .O(axi_bvalid_i_1_n_0));
  FDRE axi_bvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_bvalid_i_1_n_0),
        .Q(s00_axi_bvalid),
        .R(axi_awready_i_1_n_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[0]_i_1 
       (.I0(slv_reg3[0]),
        .I1(db_out[0]),
        .I2(axi_araddr[2]),
        .I3(clear),
        .I4(axi_araddr[3]),
        .I5(rotary_count_reg[0]),
        .O(reg_data_out[0]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[10]_i_1 
       (.I0(slv_reg3[10]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[10] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[10]),
        .O(reg_data_out[10]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[11]_i_1 
       (.I0(slv_reg3[11]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[11] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[11]),
        .O(reg_data_out[11]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[12]_i_1 
       (.I0(slv_reg3[12]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[12] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[12]),
        .O(reg_data_out[12]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[13]_i_1 
       (.I0(slv_reg3[13]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[13] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[13]),
        .O(reg_data_out[13]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[14]_i_1 
       (.I0(slv_reg3[14]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[14] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[14]),
        .O(reg_data_out[14]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[15]_i_1 
       (.I0(slv_reg3[15]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[15] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[15]),
        .O(reg_data_out[15]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[16]_i_1 
       (.I0(slv_reg3[16]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[16] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[16]),
        .O(reg_data_out[16]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[17]_i_1 
       (.I0(slv_reg3[17]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[17] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[17]),
        .O(reg_data_out[17]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[18]_i_1 
       (.I0(slv_reg3[18]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[18] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[18]),
        .O(reg_data_out[18]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[19]_i_1 
       (.I0(slv_reg3[19]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[19] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[19]),
        .O(reg_data_out[19]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \axi_rdata[1]_i_1 
       (.I0(slv_reg3[1]),
        .I1(db_out[1]),
        .I2(axi_araddr[2]),
        .I3(\slv_reg2_reg_n_0_[1] ),
        .I4(axi_araddr[3]),
        .I5(rotary_count_reg[1]),
        .O(reg_data_out[1]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[20]_i_1 
       (.I0(slv_reg3[20]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[20] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[20]),
        .O(reg_data_out[20]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[21]_i_1 
       (.I0(slv_reg3[21]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[21] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[21]),
        .O(reg_data_out[21]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[22]_i_1 
       (.I0(slv_reg3[22]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[22] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[22]),
        .O(reg_data_out[22]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[23]_i_1 
       (.I0(slv_reg3[23]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[23] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[23]),
        .O(reg_data_out[23]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[24]_i_1 
       (.I0(slv_reg3[24]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[24] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[24]),
        .O(reg_data_out[24]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[25]_i_1 
       (.I0(slv_reg3[25]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[25] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[25]),
        .O(reg_data_out[25]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[26]_i_1 
       (.I0(slv_reg3[26]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[26] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[26]),
        .O(reg_data_out[26]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[27]_i_1 
       (.I0(slv_reg3[27]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[27] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[27]),
        .O(reg_data_out[27]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[28]_i_1 
       (.I0(slv_reg3[28]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[28] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[28]),
        .O(reg_data_out[28]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[29]_i_1 
       (.I0(slv_reg3[29]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[29] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[29]),
        .O(reg_data_out[29]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[2]_i_1 
       (.I0(slv_reg3[2]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[2] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[2]),
        .O(reg_data_out[2]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[30]_i_1 
       (.I0(slv_reg3[30]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[30] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[30]),
        .O(reg_data_out[30]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[31]_i_1 
       (.I0(slv_reg3[31]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[31] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[31]),
        .O(reg_data_out[31]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[3]_i_1 
       (.I0(slv_reg3[3]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[3] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[3]),
        .O(reg_data_out[3]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[4]_i_1 
       (.I0(slv_reg3[4]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[4] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[4]),
        .O(reg_data_out[4]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[5]_i_1 
       (.I0(slv_reg3[5]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[5] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[5]),
        .O(reg_data_out[5]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[6]_i_1 
       (.I0(slv_reg3[6]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[6] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[6]),
        .O(reg_data_out[6]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[7]_i_1 
       (.I0(slv_reg3[7]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[7] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[7]),
        .O(reg_data_out[7]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[8]_i_1 
       (.I0(slv_reg3[8]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[8] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[8]),
        .O(reg_data_out[8]));
  LUT5 #(
    .INIT(32'hB833B800)) 
    \axi_rdata[9]_i_1 
       (.I0(slv_reg3[9]),
        .I1(axi_araddr[2]),
        .I2(\slv_reg2_reg_n_0_[9] ),
        .I3(axi_araddr[3]),
        .I4(rotary_count_reg[9]),
        .O(reg_data_out[9]));
  FDRE \axi_rdata_reg[0] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[0]),
        .Q(s00_axi_rdata[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[10] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[10]),
        .Q(s00_axi_rdata[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[11] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[11]),
        .Q(s00_axi_rdata[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[12] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[12]),
        .Q(s00_axi_rdata[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[13] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[13]),
        .Q(s00_axi_rdata[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[14] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[14]),
        .Q(s00_axi_rdata[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[15] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[15]),
        .Q(s00_axi_rdata[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[16] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[16]),
        .Q(s00_axi_rdata[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[17] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[17]),
        .Q(s00_axi_rdata[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[18] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[18]),
        .Q(s00_axi_rdata[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[19] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[19]),
        .Q(s00_axi_rdata[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[1] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[1]),
        .Q(s00_axi_rdata[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[20] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[20]),
        .Q(s00_axi_rdata[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[21] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[21]),
        .Q(s00_axi_rdata[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[22] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[22]),
        .Q(s00_axi_rdata[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[23] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[23]),
        .Q(s00_axi_rdata[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[24] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[24]),
        .Q(s00_axi_rdata[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[25] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[25]),
        .Q(s00_axi_rdata[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[26] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[26]),
        .Q(s00_axi_rdata[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[27] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[27]),
        .Q(s00_axi_rdata[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[28] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[28]),
        .Q(s00_axi_rdata[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[29] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[29]),
        .Q(s00_axi_rdata[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[2] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[2]),
        .Q(s00_axi_rdata[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[30] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[30]),
        .Q(s00_axi_rdata[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[31] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[31]),
        .Q(s00_axi_rdata[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[3] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[3]),
        .Q(s00_axi_rdata[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[4] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[4]),
        .Q(s00_axi_rdata[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[5] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[5]),
        .Q(s00_axi_rdata[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[6] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[6]),
        .Q(s00_axi_rdata[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[7] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[7]),
        .Q(s00_axi_rdata[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[8] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[8]),
        .Q(s00_axi_rdata[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \axi_rdata_reg[9] 
       (.C(s00_axi_aclk),
        .CE(slv_reg_rden__0),
        .D(reg_data_out[9]),
        .Q(s00_axi_rdata[9]),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h08F8)) 
    axi_rvalid_i_1
       (.I0(S_AXI_ARREADY),
        .I1(s00_axi_arvalid),
        .I2(s00_axi_rvalid),
        .I3(s00_axi_rready),
        .O(axi_rvalid_i_1_n_0));
  FDRE axi_rvalid_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_rvalid_i_1_n_0),
        .Q(s00_axi_rvalid),
        .R(axi_awready_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h0800)) 
    axi_wready_i_1
       (.I0(s00_axi_awvalid),
        .I1(s00_axi_wvalid),
        .I2(S_AXI_WREADY),
        .I3(aw_en_reg_n_0),
        .O(axi_wready0));
  FDRE axi_wready_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(axi_wready0),
        .Q(S_AXI_WREADY),
        .R(axi_awready_i_1_n_0));
  FDCE \rotary_count_reg[0] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_4),
        .Q(rotary_count_reg[0]));
  FDCE \rotary_count_reg[10] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_10),
        .Q(rotary_count_reg[10]));
  FDCE \rotary_count_reg[11] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_9),
        .Q(rotary_count_reg[11]));
  FDCE \rotary_count_reg[12] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_16),
        .Q(rotary_count_reg[12]));
  FDCE \rotary_count_reg[13] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_15),
        .Q(rotary_count_reg[13]));
  FDCE \rotary_count_reg[14] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_14),
        .Q(rotary_count_reg[14]));
  FDCE \rotary_count_reg[15] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_13),
        .Q(rotary_count_reg[15]));
  FDCE \rotary_count_reg[16] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_20),
        .Q(rotary_count_reg[16]));
  FDCE \rotary_count_reg[17] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_19),
        .Q(rotary_count_reg[17]));
  FDCE \rotary_count_reg[18] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_18),
        .Q(rotary_count_reg[18]));
  FDCE \rotary_count_reg[19] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_17),
        .Q(rotary_count_reg[19]));
  FDCE \rotary_count_reg[1] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_3),
        .Q(rotary_count_reg[1]));
  FDCE \rotary_count_reg[20] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_24),
        .Q(rotary_count_reg[20]));
  FDCE \rotary_count_reg[21] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_23),
        .Q(rotary_count_reg[21]));
  FDCE \rotary_count_reg[22] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_22),
        .Q(rotary_count_reg[22]));
  FDCE \rotary_count_reg[23] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_21),
        .Q(rotary_count_reg[23]));
  FDCE \rotary_count_reg[24] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_28),
        .Q(rotary_count_reg[24]));
  FDCE \rotary_count_reg[25] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_27),
        .Q(rotary_count_reg[25]));
  FDCE \rotary_count_reg[26] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_26),
        .Q(rotary_count_reg[26]));
  FDCE \rotary_count_reg[27] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_25),
        .Q(rotary_count_reg[27]));
  FDCE \rotary_count_reg[28] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_32),
        .Q(rotary_count_reg[28]));
  FDCE \rotary_count_reg[29] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_31),
        .Q(rotary_count_reg[29]));
  FDCE \rotary_count_reg[2] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_2),
        .Q(rotary_count_reg[2]));
  FDCE \rotary_count_reg[30] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_30),
        .Q(rotary_count_reg[30]));
  FDCE \rotary_count_reg[31] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_29),
        .Q(rotary_count_reg[31]));
  FDCE \rotary_count_reg[3] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_1),
        .Q(rotary_count_reg[3]));
  FDCE \rotary_count_reg[4] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_8),
        .Q(rotary_count_reg[4]));
  FDCE \rotary_count_reg[5] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_7),
        .Q(rotary_count_reg[5]));
  FDCE \rotary_count_reg[6] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_6),
        .Q(rotary_count_reg[6]));
  FDCE \rotary_count_reg[7] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_5),
        .Q(rotary_count_reg[7]));
  FDCE \rotary_count_reg[8] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_12),
        .Q(rotary_count_reg[8]));
  FDCE \rotary_count_reg[9] 
       (.C(s00_axi_aclk),
        .CE(rotary_event),
        .CLR(clear),
        .D(ROTFILTER_n_11),
        .Q(rotary_count_reg[9]));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[1]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[15]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[2]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[23]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[3]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0080)) 
    \slv_reg2[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(s00_axi_wstrb[0]),
        .I3(axi_awaddr[2]),
        .O(\slv_reg2[7]_i_1_n_0 ));
  FDRE \slv_reg2_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[0]),
        .Q(clear),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[10] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[10]),
        .Q(\slv_reg2_reg_n_0_[10] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[11] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[11]),
        .Q(\slv_reg2_reg_n_0_[11] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[12] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[12]),
        .Q(\slv_reg2_reg_n_0_[12] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[13] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[13]),
        .Q(\slv_reg2_reg_n_0_[13] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[14] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[14]),
        .Q(\slv_reg2_reg_n_0_[14] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[15] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[15]),
        .Q(\slv_reg2_reg_n_0_[15] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[16] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[16]),
        .Q(\slv_reg2_reg_n_0_[16] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[17] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[17]),
        .Q(\slv_reg2_reg_n_0_[17] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[18] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[18]),
        .Q(\slv_reg2_reg_n_0_[18] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[19] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[19]),
        .Q(\slv_reg2_reg_n_0_[19] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[1]),
        .Q(\slv_reg2_reg_n_0_[1] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[20] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[20]),
        .Q(\slv_reg2_reg_n_0_[20] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[21] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[21]),
        .Q(\slv_reg2_reg_n_0_[21] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[22] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[22]),
        .Q(\slv_reg2_reg_n_0_[22] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[23] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[23]_i_1_n_0 ),
        .D(s00_axi_wdata[23]),
        .Q(\slv_reg2_reg_n_0_[23] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[24] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[24]),
        .Q(\slv_reg2_reg_n_0_[24] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[25] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[25]),
        .Q(\slv_reg2_reg_n_0_[25] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[26] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[26]),
        .Q(\slv_reg2_reg_n_0_[26] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[27] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[27]),
        .Q(\slv_reg2_reg_n_0_[27] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[28] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[28]),
        .Q(\slv_reg2_reg_n_0_[28] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[29] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[29]),
        .Q(\slv_reg2_reg_n_0_[29] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[2]),
        .Q(\slv_reg2_reg_n_0_[2] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[30] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[30]),
        .Q(\slv_reg2_reg_n_0_[30] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[31] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[31]_i_1_n_0 ),
        .D(s00_axi_wdata[31]),
        .Q(\slv_reg2_reg_n_0_[31] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[3]),
        .Q(\slv_reg2_reg_n_0_[3] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[4] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[4]),
        .Q(\slv_reg2_reg_n_0_[4] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[5] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[5]),
        .Q(\slv_reg2_reg_n_0_[5] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[6] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[6]),
        .Q(\slv_reg2_reg_n_0_[6] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[7] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[7]_i_1_n_0 ),
        .D(s00_axi_wdata[7]),
        .Q(\slv_reg2_reg_n_0_[7] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[8] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[8]),
        .Q(\slv_reg2_reg_n_0_[8] ),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg2_reg[9] 
       (.C(s00_axi_aclk),
        .CE(\slv_reg2[15]_i_1_n_0 ),
        .D(s00_axi_wdata[9]),
        .Q(\slv_reg2_reg_n_0_[9] ),
        .R(axi_awready_i_1_n_0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[15]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[1]),
        .O(p_1_in[15]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[23]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[2]),
        .O(p_1_in[23]));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[3]),
        .O(p_1_in[31]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[31]_i_2 
       (.I0(S_AXI_WREADY),
        .I1(S_AXI_AWREADY),
        .I2(s00_axi_awvalid),
        .I3(s00_axi_wvalid),
        .O(slv_reg_wren__0));
  LUT4 #(
    .INIT(16'h8000)) 
    \slv_reg3[7]_i_1 
       (.I0(slv_reg_wren__0),
        .I1(axi_awaddr[3]),
        .I2(axi_awaddr[2]),
        .I3(s00_axi_wstrb[0]),
        .O(p_1_in[7]));
  FDRE \slv_reg3_reg[0] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[0]),
        .Q(slv_reg3[0]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[10] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[10]),
        .Q(slv_reg3[10]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[11] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[11]),
        .Q(slv_reg3[11]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[12] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[12]),
        .Q(slv_reg3[12]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[13] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[13]),
        .Q(slv_reg3[13]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[14] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[14]),
        .Q(slv_reg3[14]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[15] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[15]),
        .Q(slv_reg3[15]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[16] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[16]),
        .Q(slv_reg3[16]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[17] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[17]),
        .Q(slv_reg3[17]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[18] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[18]),
        .Q(slv_reg3[18]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[19] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[19]),
        .Q(slv_reg3[19]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[1] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[1]),
        .Q(slv_reg3[1]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[20] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[20]),
        .Q(slv_reg3[20]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[21] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[21]),
        .Q(slv_reg3[21]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[22] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[22]),
        .Q(slv_reg3[22]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[23] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[23]),
        .D(s00_axi_wdata[23]),
        .Q(slv_reg3[23]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[24] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[24]),
        .Q(slv_reg3[24]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[25] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[25]),
        .Q(slv_reg3[25]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[26] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[26]),
        .Q(slv_reg3[26]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[27] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[27]),
        .Q(slv_reg3[27]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[28] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[28]),
        .Q(slv_reg3[28]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[29] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[29]),
        .Q(slv_reg3[29]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[2] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[2]),
        .Q(slv_reg3[2]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[30] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[30]),
        .Q(slv_reg3[30]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[31] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[31]),
        .D(s00_axi_wdata[31]),
        .Q(slv_reg3[31]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[3] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[3]),
        .Q(slv_reg3[3]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[4] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[4]),
        .Q(slv_reg3[4]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[5] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[5]),
        .Q(slv_reg3[5]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[6] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[6]),
        .Q(slv_reg3[6]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[7] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[7]),
        .D(s00_axi_wdata[7]),
        .Q(slv_reg3[7]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[8] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[8]),
        .Q(slv_reg3[8]),
        .R(axi_awready_i_1_n_0));
  FDRE \slv_reg3_reg[9] 
       (.C(s00_axi_aclk),
        .CE(p_1_in[15]),
        .D(s00_axi_wdata[9]),
        .Q(slv_reg3[9]),
        .R(axi_awready_i_1_n_0));
  LUT3 #(
    .INIT(8'h20)) 
    slv_reg_rden
       (.I0(s00_axi_arvalid),
        .I1(s00_axi_rvalid),
        .I2(S_AXI_ARREADY),
        .O(slv_reg_rden__0));
endmodule

module embsys_PmodENC544_0_0_debounce
   (db_out,
    s00_axi_aclk,
    encBTN,
    encSWT);
  output [1:0]db_out;
  input s00_axi_aclk;
  input encBTN;
  input encSWT;

  wire [31:1]data0;
  wire [31:0]db_count;
  wire \db_count[31]_i_10_n_0 ;
  wire \db_count[31]_i_1_n_0 ;
  wire \db_count[31]_i_3_n_0 ;
  wire \db_count[31]_i_4_n_0 ;
  wire \db_count[31]_i_5_n_0 ;
  wire \db_count[31]_i_6_n_0 ;
  wire \db_count[31]_i_7_n_0 ;
  wire \db_count[31]_i_8_n_0 ;
  wire \db_count[31]_i_9_n_0 ;
  wire [0:0]db_count_0;
  wire \db_count_reg[12]_i_1_n_0 ;
  wire \db_count_reg[12]_i_1_n_1 ;
  wire \db_count_reg[12]_i_1_n_2 ;
  wire \db_count_reg[12]_i_1_n_3 ;
  wire \db_count_reg[16]_i_1_n_0 ;
  wire \db_count_reg[16]_i_1_n_1 ;
  wire \db_count_reg[16]_i_1_n_2 ;
  wire \db_count_reg[16]_i_1_n_3 ;
  wire \db_count_reg[20]_i_1_n_0 ;
  wire \db_count_reg[20]_i_1_n_1 ;
  wire \db_count_reg[20]_i_1_n_2 ;
  wire \db_count_reg[20]_i_1_n_3 ;
  wire \db_count_reg[24]_i_1_n_0 ;
  wire \db_count_reg[24]_i_1_n_1 ;
  wire \db_count_reg[24]_i_1_n_2 ;
  wire \db_count_reg[24]_i_1_n_3 ;
  wire \db_count_reg[28]_i_1_n_0 ;
  wire \db_count_reg[28]_i_1_n_1 ;
  wire \db_count_reg[28]_i_1_n_2 ;
  wire \db_count_reg[28]_i_1_n_3 ;
  wire \db_count_reg[31]_i_2_n_2 ;
  wire \db_count_reg[31]_i_2_n_3 ;
  wire \db_count_reg[4]_i_1_n_0 ;
  wire \db_count_reg[4]_i_1_n_1 ;
  wire \db_count_reg[4]_i_1_n_2 ;
  wire \db_count_reg[4]_i_1_n_3 ;
  wire \db_count_reg[8]_i_1_n_0 ;
  wire \db_count_reg[8]_i_1_n_1 ;
  wire \db_count_reg[8]_i_1_n_2 ;
  wire \db_count_reg[8]_i_1_n_3 ;
  wire [1:0]db_out;
  wire \db_out[0]_i_1_n_0 ;
  wire \db_out[1]_i_1_n_0 ;
  wire encBTN;
  wire encSWT;
  wire [3:1]in00;
  wire [3:0]in1;
  wire [0:0]p_0_out;
  wire s00_axi_aclk;
  wire [3:2]\NLW_db_count_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_db_count_reg[31]_i_2_O_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \db_count[0]_i_1 
       (.I0(db_count[0]),
        .O(db_count_0));
  LUT4 #(
    .INIT(16'h0001)) 
    \db_count[31]_i_1 
       (.I0(\db_count[31]_i_3_n_0 ),
        .I1(\db_count[31]_i_4_n_0 ),
        .I2(\db_count[31]_i_5_n_0 ),
        .I3(\db_count[31]_i_6_n_0 ),
        .O(\db_count[31]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \db_count[31]_i_10 
       (.I0(db_count[21]),
        .I1(db_count[20]),
        .I2(db_count[23]),
        .I3(db_count[22]),
        .O(\db_count[31]_i_10_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFF7FF)) 
    \db_count[31]_i_3 
       (.I0(db_count[10]),
        .I1(db_count[11]),
        .I2(db_count[8]),
        .I3(db_count[9]),
        .I4(\db_count[31]_i_7_n_0 ),
        .O(\db_count[31]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \db_count[31]_i_4 
       (.I0(db_count[2]),
        .I1(db_count[3]),
        .I2(db_count[0]),
        .I3(db_count[1]),
        .I4(\db_count[31]_i_8_n_0 ),
        .O(\db_count[31]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \db_count[31]_i_5 
       (.I0(db_count[26]),
        .I1(db_count[27]),
        .I2(db_count[24]),
        .I3(db_count[25]),
        .I4(\db_count[31]_i_9_n_0 ),
        .O(\db_count[31]_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \db_count[31]_i_6 
       (.I0(db_count[18]),
        .I1(db_count[19]),
        .I2(db_count[16]),
        .I3(db_count[17]),
        .I4(\db_count[31]_i_10_n_0 ),
        .O(\db_count[31]_i_6_n_0 ));
  LUT4 #(
    .INIT(16'hFFEF)) 
    \db_count[31]_i_7 
       (.I0(db_count[13]),
        .I1(db_count[12]),
        .I2(db_count[14]),
        .I3(db_count[15]),
        .O(\db_count[31]_i_7_n_0 ));
  LUT4 #(
    .INIT(16'hFFFD)) 
    \db_count[31]_i_8 
       (.I0(db_count[4]),
        .I1(db_count[5]),
        .I2(db_count[7]),
        .I3(db_count[6]),
        .O(\db_count[31]_i_8_n_0 ));
  LUT4 #(
    .INIT(16'hFFFE)) 
    \db_count[31]_i_9 
       (.I0(db_count[29]),
        .I1(db_count[28]),
        .I2(db_count[31]),
        .I3(db_count[30]),
        .O(\db_count[31]_i_9_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(db_count_0),
        .Q(db_count[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[10] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[10]),
        .Q(db_count[10]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[11] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[11]),
        .Q(db_count[11]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[12] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[12]),
        .Q(db_count[12]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[12]_i_1 
       (.CI(\db_count_reg[8]_i_1_n_0 ),
        .CO({\db_count_reg[12]_i_1_n_0 ,\db_count_reg[12]_i_1_n_1 ,\db_count_reg[12]_i_1_n_2 ,\db_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[12:9]),
        .S(db_count[12:9]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[13] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[13]),
        .Q(db_count[13]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[14] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[14]),
        .Q(db_count[14]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[15] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[15]),
        .Q(db_count[15]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[16] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[16]),
        .Q(db_count[16]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[16]_i_1 
       (.CI(\db_count_reg[12]_i_1_n_0 ),
        .CO({\db_count_reg[16]_i_1_n_0 ,\db_count_reg[16]_i_1_n_1 ,\db_count_reg[16]_i_1_n_2 ,\db_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[16:13]),
        .S(db_count[16:13]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[17] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[17]),
        .Q(db_count[17]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[18] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[18]),
        .Q(db_count[18]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[19] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[19]),
        .Q(db_count[19]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[1]),
        .Q(db_count[1]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[20] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[20]),
        .Q(db_count[20]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[20]_i_1 
       (.CI(\db_count_reg[16]_i_1_n_0 ),
        .CO({\db_count_reg[20]_i_1_n_0 ,\db_count_reg[20]_i_1_n_1 ,\db_count_reg[20]_i_1_n_2 ,\db_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[20:17]),
        .S(db_count[20:17]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[21] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[21]),
        .Q(db_count[21]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[22] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[22]),
        .Q(db_count[22]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[23] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[23]),
        .Q(db_count[23]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[24] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[24]),
        .Q(db_count[24]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[24]_i_1 
       (.CI(\db_count_reg[20]_i_1_n_0 ),
        .CO({\db_count_reg[24]_i_1_n_0 ,\db_count_reg[24]_i_1_n_1 ,\db_count_reg[24]_i_1_n_2 ,\db_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[24:21]),
        .S(db_count[24:21]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[25] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[25]),
        .Q(db_count[25]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[26] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[26]),
        .Q(db_count[26]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[27] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[27]),
        .Q(db_count[27]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[28] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[28]),
        .Q(db_count[28]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[28]_i_1 
       (.CI(\db_count_reg[24]_i_1_n_0 ),
        .CO({\db_count_reg[28]_i_1_n_0 ,\db_count_reg[28]_i_1_n_1 ,\db_count_reg[28]_i_1_n_2 ,\db_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[28:25]),
        .S(db_count[28:25]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[29] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[29]),
        .Q(db_count[29]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[2] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[2]),
        .Q(db_count[2]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[30] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[30]),
        .Q(db_count[30]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[31] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[31]),
        .Q(db_count[31]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[31]_i_2 
       (.CI(\db_count_reg[28]_i_1_n_0 ),
        .CO({\NLW_db_count_reg[31]_i_2_CO_UNCONNECTED [3:2],\db_count_reg[31]_i_2_n_2 ,\db_count_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_db_count_reg[31]_i_2_O_UNCONNECTED [3],data0[31:29]}),
        .S({1'b0,db_count[31:29]}));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[3] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[3]),
        .Q(db_count[3]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[4] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[4]),
        .Q(db_count[4]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\db_count_reg[4]_i_1_n_0 ,\db_count_reg[4]_i_1_n_1 ,\db_count_reg[4]_i_1_n_2 ,\db_count_reg[4]_i_1_n_3 }),
        .CYINIT(db_count[0]),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[4:1]),
        .S(db_count[4:1]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[5] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[5]),
        .Q(db_count[5]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[6] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[6]),
        .Q(db_count[6]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[7] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[7]),
        .Q(db_count[7]),
        .R(\db_count[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[8] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[8]),
        .Q(db_count[8]),
        .R(\db_count[31]_i_1_n_0 ));
  (* ADDER_THRESHOLD = "35" *) 
  CARRY4 \db_count_reg[8]_i_1 
       (.CI(\db_count_reg[4]_i_1_n_0 ),
        .CO({\db_count_reg[8]_i_1_n_0 ,\db_count_reg[8]_i_1_n_1 ,\db_count_reg[8]_i_1_n_2 ,\db_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(data0[8:5]),
        .S(db_count[8:5]));
  FDRE #(
    .INIT(1'b0)) 
    \db_count_reg[9] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(data0[9]),
        .Q(db_count[9]),
        .R(\db_count[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE8000)) 
    \db_out[0]_i_1 
       (.I0(p_0_out),
        .I1(in00[3]),
        .I2(in00[2]),
        .I3(in00[1]),
        .I4(db_out[0]),
        .O(\db_out[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFE8000)) 
    \db_out[1]_i_1 
       (.I0(in1[3]),
        .I1(in1[2]),
        .I2(in1[1]),
        .I3(in1[0]),
        .I4(db_out[1]),
        .O(\db_out[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \db_out_reg[0] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\db_out[0]_i_1_n_0 ),
        .Q(db_out[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \db_out_reg[1] 
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(\db_out[1]_i_1_n_0 ),
        .Q(db_out[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in0_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(encBTN),
        .Q(in00[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in0_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(in00[1]),
        .Q(in00[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in0_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(in00[2]),
        .Q(in00[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in0_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(in00[3]),
        .Q(p_0_out),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in1_reg[0] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(encSWT),
        .Q(in1[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in1_reg[1] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(in1[0]),
        .Q(in1[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in1_reg[2] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(in1[1]),
        .Q(in1[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \in1_reg[3] 
       (.C(s00_axi_aclk),
        .CE(\db_count[31]_i_1_n_0 ),
        .D(in1[2]),
        .Q(in1[3]),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "embsys_PmodENC544_0_0,PmodENC544_v1_0,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "PmodENC544_v1_0,Vivado 2020.2" *) 
(* NotValidForBitStream *)
module embsys_PmodENC544_0_0
   (encA,
    encB,
    encBTN,
    encSWT,
    s00_axi_aclk,
    s00_axi_aresetn,
    s00_axi_awaddr,
    s00_axi_awprot,
    s00_axi_awvalid,
    s00_axi_awready,
    s00_axi_wdata,
    s00_axi_wstrb,
    s00_axi_wvalid,
    s00_axi_wready,
    s00_axi_bresp,
    s00_axi_bvalid,
    s00_axi_bready,
    s00_axi_araddr,
    s00_axi_arprot,
    s00_axi_arvalid,
    s00_axi_arready,
    s00_axi_rdata,
    s00_axi_rresp,
    s00_axi_rvalid,
    s00_axi_rready);
  input encA;
  input encB;
  input encBTN;
  input encSWT;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S00_AXI_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET s00_axi_aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, INSERT_VIP 0" *) input s00_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S00_AXI_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI_RST, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input s00_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [3:0]s00_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]s00_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input s00_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output s00_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]s00_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]s00_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input s00_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output s00_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]s00_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output s00_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input s00_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) input [3:0]s00_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]s00_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input s00_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output s00_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]s00_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]s00_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output s00_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, WIZ_DATA_WIDTH 32, WIZ_NUM_REG 4, SUPPORTS_NARROW_BURST 0, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 4, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 1, PHASE 0.0, CLK_DOMAIN /clk_wiz_1_clk_out1, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s00_axi_rready;

  wire \<const0> ;
  wire encA;
  wire encB;
  wire encBTN;
  wire encSWT;
  wire s00_axi_aclk;
  wire [3:0]s00_axi_araddr;
  wire s00_axi_aresetn;
  wire s00_axi_arready;
  wire s00_axi_arvalid;
  wire [3:0]s00_axi_awaddr;
  wire s00_axi_awready;
  wire s00_axi_awvalid;
  wire s00_axi_bready;
  wire s00_axi_bvalid;
  wire [31:0]s00_axi_rdata;
  wire s00_axi_rready;
  wire s00_axi_rvalid;
  wire [31:0]s00_axi_wdata;
  wire s00_axi_wready;
  wire [3:0]s00_axi_wstrb;
  wire s00_axi_wvalid;

  assign s00_axi_bresp[1] = \<const0> ;
  assign s00_axi_bresp[0] = \<const0> ;
  assign s00_axi_rresp[1] = \<const0> ;
  assign s00_axi_rresp[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  embsys_PmodENC544_0_0_PmodENC544_v1_0 inst
       (.S_AXI_ARREADY(s00_axi_arready),
        .S_AXI_AWREADY(s00_axi_awready),
        .S_AXI_WREADY(s00_axi_wready),
        .encA(encA),
        .encB(encB),
        .encBTN(encBTN),
        .encSWT(encSWT),
        .s00_axi_aclk(s00_axi_aclk),
        .s00_axi_araddr(s00_axi_araddr[3:2]),
        .s00_axi_aresetn(s00_axi_aresetn),
        .s00_axi_arvalid(s00_axi_arvalid),
        .s00_axi_awaddr(s00_axi_awaddr[3:2]),
        .s00_axi_awvalid(s00_axi_awvalid),
        .s00_axi_bready(s00_axi_bready),
        .s00_axi_bvalid(s00_axi_bvalid),
        .s00_axi_rdata(s00_axi_rdata),
        .s00_axi_rready(s00_axi_rready),
        .s00_axi_rvalid(s00_axi_rvalid),
        .s00_axi_wdata(s00_axi_wdata),
        .s00_axi_wstrb(s00_axi_wstrb),
        .s00_axi_wvalid(s00_axi_wvalid));
endmodule

module embsys_PmodENC544_0_0_rotary_filter
   (rotary_event,
    O,
    rotary_left_reg_0,
    rotary_left_reg_1,
    rotary_left_reg_2,
    rotary_left_reg_3,
    rotary_left_reg_4,
    rotary_left_reg_5,
    rotary_left_reg_6,
    encA,
    s00_axi_aclk,
    encB,
    rotary_count_reg);
  output rotary_event;
  output [3:0]O;
  output [3:0]rotary_left_reg_0;
  output [3:0]rotary_left_reg_1;
  output [3:0]rotary_left_reg_2;
  output [3:0]rotary_left_reg_3;
  output [3:0]rotary_left_reg_4;
  output [3:0]rotary_left_reg_5;
  output [3:0]rotary_left_reg_6;
  input encA;
  input s00_axi_aclk;
  input encB;
  input [31:0]rotary_count_reg;

  wire [3:0]O;
  wire delay_rotary_q1;
  wire encA;
  wire encB;
  wire in;
  wire [1:0]p_0_in;
  wire \rotary_count[0]_i_2_n_0 ;
  wire \rotary_count[0]_i_3_n_0 ;
  wire \rotary_count[0]_i_4_n_0 ;
  wire \rotary_count[12]_i_2_n_0 ;
  wire \rotary_count[12]_i_3_n_0 ;
  wire \rotary_count[12]_i_4_n_0 ;
  wire \rotary_count[12]_i_5_n_0 ;
  wire \rotary_count[16]_i_2_n_0 ;
  wire \rotary_count[16]_i_3_n_0 ;
  wire \rotary_count[16]_i_4_n_0 ;
  wire \rotary_count[16]_i_5_n_0 ;
  wire \rotary_count[20]_i_2_n_0 ;
  wire \rotary_count[20]_i_3_n_0 ;
  wire \rotary_count[20]_i_4_n_0 ;
  wire \rotary_count[20]_i_5_n_0 ;
  wire \rotary_count[24]_i_2_n_0 ;
  wire \rotary_count[24]_i_3_n_0 ;
  wire \rotary_count[24]_i_4_n_0 ;
  wire \rotary_count[24]_i_5_n_0 ;
  wire \rotary_count[28]_i_2_n_0 ;
  wire \rotary_count[28]_i_3_n_0 ;
  wire \rotary_count[28]_i_4_n_0 ;
  wire \rotary_count[28]_i_5_n_0 ;
  wire \rotary_count[4]_i_2_n_0 ;
  wire \rotary_count[4]_i_3_n_0 ;
  wire \rotary_count[4]_i_4_n_0 ;
  wire \rotary_count[4]_i_5_n_0 ;
  wire \rotary_count[8]_i_2_n_0 ;
  wire \rotary_count[8]_i_3_n_0 ;
  wire \rotary_count[8]_i_4_n_0 ;
  wire \rotary_count[8]_i_5_n_0 ;
  wire [31:0]rotary_count_reg;
  wire \rotary_count_reg[0]_i_1_n_0 ;
  wire \rotary_count_reg[0]_i_1_n_1 ;
  wire \rotary_count_reg[0]_i_1_n_2 ;
  wire \rotary_count_reg[0]_i_1_n_3 ;
  wire \rotary_count_reg[12]_i_1_n_0 ;
  wire \rotary_count_reg[12]_i_1_n_1 ;
  wire \rotary_count_reg[12]_i_1_n_2 ;
  wire \rotary_count_reg[12]_i_1_n_3 ;
  wire \rotary_count_reg[16]_i_1_n_0 ;
  wire \rotary_count_reg[16]_i_1_n_1 ;
  wire \rotary_count_reg[16]_i_1_n_2 ;
  wire \rotary_count_reg[16]_i_1_n_3 ;
  wire \rotary_count_reg[20]_i_1_n_0 ;
  wire \rotary_count_reg[20]_i_1_n_1 ;
  wire \rotary_count_reg[20]_i_1_n_2 ;
  wire \rotary_count_reg[20]_i_1_n_3 ;
  wire \rotary_count_reg[24]_i_1_n_0 ;
  wire \rotary_count_reg[24]_i_1_n_1 ;
  wire \rotary_count_reg[24]_i_1_n_2 ;
  wire \rotary_count_reg[24]_i_1_n_3 ;
  wire \rotary_count_reg[28]_i_1_n_1 ;
  wire \rotary_count_reg[28]_i_1_n_2 ;
  wire \rotary_count_reg[28]_i_1_n_3 ;
  wire \rotary_count_reg[4]_i_1_n_0 ;
  wire \rotary_count_reg[4]_i_1_n_1 ;
  wire \rotary_count_reg[4]_i_1_n_2 ;
  wire \rotary_count_reg[4]_i_1_n_3 ;
  wire \rotary_count_reg[8]_i_1_n_0 ;
  wire \rotary_count_reg[8]_i_1_n_1 ;
  wire \rotary_count_reg[8]_i_1_n_2 ;
  wire \rotary_count_reg[8]_i_1_n_3 ;
  wire rotary_event;
  wire rotary_event_i_1_n_0;
  wire rotary_left_i_1_n_0;
  wire [3:0]rotary_left_reg_0;
  wire [3:0]rotary_left_reg_1;
  wire [3:0]rotary_left_reg_2;
  wire [3:0]rotary_left_reg_3;
  wire [3:0]rotary_left_reg_4;
  wire [3:0]rotary_left_reg_5;
  wire [3:0]rotary_left_reg_6;
  wire rotary_q1;
  wire rotary_q1_i_1_n_0;
  wire rotary_q2;
  wire rotary_q2_i_1_n_0;
  wire s00_axi_aclk;
  wire [3:3]\NLW_rotary_count_reg[28]_i_1_CO_UNCONNECTED ;

  FDRE delay_rotary_q1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_q1),
        .Q(delay_rotary_q1),
        .R(1'b0));
  FDRE rotary_a_int_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(encA),
        .Q(p_0_in[0]),
        .R(1'b0));
  FDRE rotary_b_int_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(encB),
        .Q(p_0_in[1]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[0]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[3]),
        .O(\rotary_count[0]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[0]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[2]),
        .O(\rotary_count[0]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[0]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[1]),
        .O(\rotary_count[0]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[12]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[15]),
        .O(\rotary_count[12]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[12]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[14]),
        .O(\rotary_count[12]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[12]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[13]),
        .O(\rotary_count[12]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[12]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[12]),
        .O(\rotary_count[12]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[16]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[19]),
        .O(\rotary_count[16]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[16]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[18]),
        .O(\rotary_count[16]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[16]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[17]),
        .O(\rotary_count[16]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[16]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[16]),
        .O(\rotary_count[16]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[20]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[23]),
        .O(\rotary_count[20]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[20]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[22]),
        .O(\rotary_count[20]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[20]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[21]),
        .O(\rotary_count[20]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[20]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[20]),
        .O(\rotary_count[20]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[24]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[27]),
        .O(\rotary_count[24]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[24]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[26]),
        .O(\rotary_count[24]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[24]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[25]),
        .O(\rotary_count[24]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[24]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[24]),
        .O(\rotary_count[24]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[28]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[31]),
        .O(\rotary_count[28]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[28]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[30]),
        .O(\rotary_count[28]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[28]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[29]),
        .O(\rotary_count[28]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[28]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[28]),
        .O(\rotary_count[28]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[4]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[7]),
        .O(\rotary_count[4]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[4]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[6]),
        .O(\rotary_count[4]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[4]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[5]),
        .O(\rotary_count[4]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[4]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[4]),
        .O(\rotary_count[4]_i_5_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[8]_i_2 
       (.I0(in),
        .I1(rotary_count_reg[11]),
        .O(\rotary_count[8]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[8]_i_3 
       (.I0(in),
        .I1(rotary_count_reg[10]),
        .O(\rotary_count[8]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[8]_i_4 
       (.I0(in),
        .I1(rotary_count_reg[9]),
        .O(\rotary_count[8]_i_4_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \rotary_count[8]_i_5 
       (.I0(in),
        .I1(rotary_count_reg[8]),
        .O(\rotary_count[8]_i_5_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\rotary_count_reg[0]_i_1_n_0 ,\rotary_count_reg[0]_i_1_n_1 ,\rotary_count_reg[0]_i_1_n_2 ,\rotary_count_reg[0]_i_1_n_3 }),
        .CYINIT(1'b1),
        .DI({in,in,in,1'b0}),
        .O(O),
        .S({\rotary_count[0]_i_2_n_0 ,\rotary_count[0]_i_3_n_0 ,\rotary_count[0]_i_4_n_0 ,rotary_count_reg[0]}));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[12]_i_1 
       (.CI(\rotary_count_reg[8]_i_1_n_0 ),
        .CO({\rotary_count_reg[12]_i_1_n_0 ,\rotary_count_reg[12]_i_1_n_1 ,\rotary_count_reg[12]_i_1_n_2 ,\rotary_count_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({in,in,in,in}),
        .O(rotary_left_reg_2),
        .S({\rotary_count[12]_i_2_n_0 ,\rotary_count[12]_i_3_n_0 ,\rotary_count[12]_i_4_n_0 ,\rotary_count[12]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[16]_i_1 
       (.CI(\rotary_count_reg[12]_i_1_n_0 ),
        .CO({\rotary_count_reg[16]_i_1_n_0 ,\rotary_count_reg[16]_i_1_n_1 ,\rotary_count_reg[16]_i_1_n_2 ,\rotary_count_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({in,in,in,in}),
        .O(rotary_left_reg_3),
        .S({\rotary_count[16]_i_2_n_0 ,\rotary_count[16]_i_3_n_0 ,\rotary_count[16]_i_4_n_0 ,\rotary_count[16]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[20]_i_1 
       (.CI(\rotary_count_reg[16]_i_1_n_0 ),
        .CO({\rotary_count_reg[20]_i_1_n_0 ,\rotary_count_reg[20]_i_1_n_1 ,\rotary_count_reg[20]_i_1_n_2 ,\rotary_count_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({in,in,in,in}),
        .O(rotary_left_reg_4),
        .S({\rotary_count[20]_i_2_n_0 ,\rotary_count[20]_i_3_n_0 ,\rotary_count[20]_i_4_n_0 ,\rotary_count[20]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[24]_i_1 
       (.CI(\rotary_count_reg[20]_i_1_n_0 ),
        .CO({\rotary_count_reg[24]_i_1_n_0 ,\rotary_count_reg[24]_i_1_n_1 ,\rotary_count_reg[24]_i_1_n_2 ,\rotary_count_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({in,in,in,in}),
        .O(rotary_left_reg_5),
        .S({\rotary_count[24]_i_2_n_0 ,\rotary_count[24]_i_3_n_0 ,\rotary_count[24]_i_4_n_0 ,\rotary_count[24]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[28]_i_1 
       (.CI(\rotary_count_reg[24]_i_1_n_0 ),
        .CO({\NLW_rotary_count_reg[28]_i_1_CO_UNCONNECTED [3],\rotary_count_reg[28]_i_1_n_1 ,\rotary_count_reg[28]_i_1_n_2 ,\rotary_count_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,in,in,in}),
        .O(rotary_left_reg_6),
        .S({\rotary_count[28]_i_2_n_0 ,\rotary_count[28]_i_3_n_0 ,\rotary_count[28]_i_4_n_0 ,\rotary_count[28]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[4]_i_1 
       (.CI(\rotary_count_reg[0]_i_1_n_0 ),
        .CO({\rotary_count_reg[4]_i_1_n_0 ,\rotary_count_reg[4]_i_1_n_1 ,\rotary_count_reg[4]_i_1_n_2 ,\rotary_count_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({in,in,in,in}),
        .O(rotary_left_reg_0),
        .S({\rotary_count[4]_i_2_n_0 ,\rotary_count[4]_i_3_n_0 ,\rotary_count[4]_i_4_n_0 ,\rotary_count[4]_i_5_n_0 }));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \rotary_count_reg[8]_i_1 
       (.CI(\rotary_count_reg[4]_i_1_n_0 ),
        .CO({\rotary_count_reg[8]_i_1_n_0 ,\rotary_count_reg[8]_i_1_n_1 ,\rotary_count_reg[8]_i_1_n_2 ,\rotary_count_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({in,in,in,in}),
        .O(rotary_left_reg_1),
        .S({\rotary_count[8]_i_2_n_0 ,\rotary_count[8]_i_3_n_0 ,\rotary_count[8]_i_4_n_0 ,\rotary_count[8]_i_5_n_0 }));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h2)) 
    rotary_event_i_1
       (.I0(rotary_q1),
        .I1(delay_rotary_q1),
        .O(rotary_event_i_1_n_0));
  FDRE rotary_event_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_event_i_1_n_0),
        .Q(rotary_event),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFB08)) 
    rotary_left_i_1
       (.I0(rotary_q2),
        .I1(rotary_q1),
        .I2(delay_rotary_q1),
        .I3(in),
        .O(rotary_left_i_1_n_0));
  FDRE rotary_left_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_left_i_1_n_0),
        .Q(in),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hE8)) 
    rotary_q1_i_1
       (.I0(rotary_q1),
        .I1(p_0_in[0]),
        .I2(p_0_in[1]),
        .O(rotary_q1_i_1_n_0));
  FDRE rotary_q1_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_q1_i_1_n_0),
        .Q(rotary_q1),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hD4)) 
    rotary_q2_i_1
       (.I0(p_0_in[0]),
        .I1(p_0_in[1]),
        .I2(rotary_q2),
        .O(rotary_q2_i_1_n_0));
  FDRE rotary_q2_reg
       (.C(s00_axi_aclk),
        .CE(1'b1),
        .D(rotary_q2_i_1_n_0),
        .Q(rotary_q2),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
