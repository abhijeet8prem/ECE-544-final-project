-makelib xcelium_lib/xpm -sv \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib xcelium_lib/xpm \
  "C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib xcelium_lib/microblaze_v11_0_4 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_microblaze_0_0/sim/embsys_microblaze_0_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0_S00_AXI.v" \
  "../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0.v" \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/f811/src/rgbpwm.v" \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/f811/src/debounce.v" \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/f811/src/sevensegment.v" \
  "../../../bd/embsys/ip/embsys_nexys4io_0_0/sim/embsys_nexys4io_0_0.v" \
-endlib
-makelib xcelium_lib/axi_lite_ipif_v3_0_4 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/lib_cdc_v1_0_2 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/interrupt_control_v3_1_4 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_gpio_v2_0_24 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_axi_gpio_0_0/sim/embsys_axi_gpio_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_pkg_v1_0_2 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_timer_v2_0_24 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/70d6/hdl/axi_timer_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_axi_timer_0_0/sim/embsys_axi_timer_0_0.vhd" \
-endlib
-makelib xcelium_lib/fit_timer_v2_0_10 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/e81b/hdl/fit_timer_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_fit_timer_0_0/sim/embsys_fit_timer_0_0.vhd" \
-endlib
-makelib xcelium_lib/lib_srl_fifo_v1_0_2 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_uartlite_v2_0_26 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/5edb/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_axi_uartlite_0_0/sim/embsys_axi_uartlite_0_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_v10_v3_0_11 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_dlmb_v10_0/sim/embsys_dlmb_v10_0.vhd" \
  "../../../bd/embsys/ip/embsys_ilmb_v10_0/sim/embsys_ilmb_v10_0.vhd" \
-endlib
-makelib xcelium_lib/lmb_bram_if_cntlr_v4_0_19 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_dlmb_bram_if_cntlr_0/sim/embsys_dlmb_bram_if_cntlr_0.vhd" \
  "../../../bd/embsys/ip/embsys_ilmb_bram_if_cntlr_0/sim/embsys_ilmb_bram_if_cntlr_0.vhd" \
-endlib
-makelib xcelium_lib/blk_mem_gen_v8_4_4 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_lmb_bram_0/sim/embsys_lmb_bram_0.v" \
-endlib
-makelib xcelium_lib/generic_baseblocks_v2_1_0 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_infrastructure_v1_1_0 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_register_slice_v2_1_22 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/fifo_generator_v13_2_5 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \
-endlib
-makelib xcelium_lib/axi_data_fifo_v2_1_21 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/axi_crossbar_v2_1_23 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_xbar_0/sim/embsys_xbar_0.v" \
-endlib
-makelib xcelium_lib/axi_intc_v4_1_15 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/47b8/hdl/axi_intc_v4_1_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_microblaze_0_axi_intc_0/sim/embsys_microblaze_0_axi_intc_0.vhd" \
-endlib
-makelib xcelium_lib/xlconcat_v2_1_4 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_microblaze_0_xlconcat_0/sim/embsys_microblaze_0_xlconcat_0.v" \
-endlib
-makelib xcelium_lib/mdm_v3_2_19 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_mdm_1_0/sim/embsys_mdm_1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_clk_wiz_1_0/embsys_clk_wiz_1_0_clk_wiz.v" \
  "../../../bd/embsys/ip/embsys_clk_wiz_1_0/embsys_clk_wiz_1_0.v" \
-endlib
-makelib xcelium_lib/proc_sys_reset_v5_0_13 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_rst_clk_wiz_1_100M_0/sim/embsys_rst_clk_wiz_1_100M_0.vhd" \
-endlib
-makelib xcelium_lib/dist_mem_gen_v8_0_13 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/simulation/dist_mem_gen_v8_0.v" \
-endlib
-makelib xcelium_lib/lib_fifo_v1_0_14 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/lib_fifo_v1_0_rfs.vhd" \
-endlib
-makelib xcelium_lib/axi_quad_spi_v3_2_21 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/axi_quad_spi_v3_2_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/sim/PmodOLEDrgb_axi_quad_spi_0_0.vhd" \
  "../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/sim/PmodOLEDrgb_axi_gpio_0_1.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/src/pmod_concat.v" \
  "../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/sim/PmodOLEDrgb_pmod_bridge_0_0.v" \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d9e9/hdl/PmodOLEDrgb_v1_0.v" \
  "../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/sim/embsys_PmodOLEDrgb_0_0.v" \
-endlib
-makelib xcelium_lib/axi_timebase_wdt_v3_0_14 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/52c7/hdl/axi_timebase_wdt_v3_0_vh_rfs.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_axi_timebase_wdt_0_0/sim/embsys_axi_timebase_wdt_0_0.vhd" \
  "../../../bd/embsys/ip/embsys_axi_gpio_0_4/sim/embsys_axi_gpio_0_4.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_xlconcat_0_1/sim/embsys_xlconcat_0_1.v" \
-endlib
-makelib xcelium_lib/xlconstant_v1_1_7 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_xlconstant_0_1/sim/embsys_xlconstant_0_1.v" \
  "../../../bd/embsys/ip/embsys_xadc_wiz_0_0/embsys_xadc_wiz_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib -sv \
  "../../../bd/embsys/ipshared/1f26/hdl/PWM_AXI.sv" \
  "../../../bd/embsys/ipshared/1f26/hdl/PWM_v2_0.sv" \
  "../../../bd/embsys/ip/embsys_PWM_0_0/sim/embsys_PWM_0_0.sv" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ipshared/ddf2/hdl/PmodENC544_v1_0_S00_AXI.v" \
  "../../../bd/embsys/ipshared/ddf2/hdl/PmodENC544_v1_0.v" \
  "../../../bd/embsys/ip/embsys_PmodENC544_0_0/sim/embsys_PmodENC544_0_0.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_axi_gpio_1_0/sim/embsys_axi_gpio_1_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_xlconstant_0_2/sim/embsys_xlconstant_0_2.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_axi_gpio_XADC_Data_Out_0/sim/embsys_axi_gpio_XADC_Data_Out_0.vhd" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_xlconstant_1_0/sim/embsys_xlconstant_1_0.v" \
  "../../../bd/embsys/ip/embsys_tier2_xbar_0_0/sim/embsys_tier2_xbar_0_0.v" \
  "../../../bd/embsys/ip/embsys_tier2_xbar_1_0/sim/embsys_tier2_xbar_1_0.v" \
  "../../../bd/embsys/ip/embsys_tier2_xbar_2_0/sim/embsys_tier2_xbar_2_0.v" \
-endlib
-makelib xcelium_lib/axi_protocol_converter_v2_1_22 \
  "../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  "../../../bd/embsys/ip/embsys_auto_pc_0/sim/embsys_auto_pc_0.v" \
  "../../../bd/embsys/sim/embsys.v" \
-endlib
-makelib xcelium_lib/xil_defaultlib \
  glbl.v
-endlib

