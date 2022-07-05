vlib work
vlib riviera

vlib riviera/xpm
vlib riviera/microblaze_v11_0_4
vlib riviera/xil_defaultlib
vlib riviera/axi_lite_ipif_v3_0_4
vlib riviera/lib_cdc_v1_0_2
vlib riviera/interrupt_control_v3_1_4
vlib riviera/axi_gpio_v2_0_24
vlib riviera/lib_pkg_v1_0_2
vlib riviera/axi_timer_v2_0_24
vlib riviera/fit_timer_v2_0_10
vlib riviera/lib_srl_fifo_v1_0_2
vlib riviera/axi_uartlite_v2_0_26
vlib riviera/lmb_v10_v3_0_11
vlib riviera/lmb_bram_if_cntlr_v4_0_19
vlib riviera/blk_mem_gen_v8_4_4
vlib riviera/generic_baseblocks_v2_1_0
vlib riviera/axi_infrastructure_v1_1_0
vlib riviera/axi_register_slice_v2_1_22
vlib riviera/fifo_generator_v13_2_5
vlib riviera/axi_data_fifo_v2_1_21
vlib riviera/axi_crossbar_v2_1_23
vlib riviera/axi_protocol_converter_v2_1_22
vlib riviera/axi_intc_v4_1_15
vlib riviera/xlconcat_v2_1_4
vlib riviera/mdm_v3_2_19
vlib riviera/proc_sys_reset_v5_0_13
vlib riviera/dist_mem_gen_v8_0_13
vlib riviera/lib_fifo_v1_0_14
vlib riviera/axi_quad_spi_v3_2_21
vlib riviera/axi_timebase_wdt_v3_0_14
vlib riviera/xlconstant_v1_1_7

vmap xpm riviera/xpm
vmap microblaze_v11_0_4 riviera/microblaze_v11_0_4
vmap xil_defaultlib riviera/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 riviera/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 riviera/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 riviera/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 riviera/axi_gpio_v2_0_24
vmap lib_pkg_v1_0_2 riviera/lib_pkg_v1_0_2
vmap axi_timer_v2_0_24 riviera/axi_timer_v2_0_24
vmap fit_timer_v2_0_10 riviera/fit_timer_v2_0_10
vmap lib_srl_fifo_v1_0_2 riviera/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_26 riviera/axi_uartlite_v2_0_26
vmap lmb_v10_v3_0_11 riviera/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 riviera/lmb_bram_if_cntlr_v4_0_19
vmap blk_mem_gen_v8_4_4 riviera/blk_mem_gen_v8_4_4
vmap generic_baseblocks_v2_1_0 riviera/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 riviera/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 riviera/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 riviera/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 riviera/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 riviera/axi_crossbar_v2_1_23
vmap axi_protocol_converter_v2_1_22 riviera/axi_protocol_converter_v2_1_22
vmap axi_intc_v4_1_15 riviera/axi_intc_v4_1_15
vmap xlconcat_v2_1_4 riviera/xlconcat_v2_1_4
vmap mdm_v3_2_19 riviera/mdm_v3_2_19
vmap proc_sys_reset_v5_0_13 riviera/proc_sys_reset_v5_0_13
vmap dist_mem_gen_v8_0_13 riviera/dist_mem_gen_v8_0_13
vmap lib_fifo_v1_0_14 riviera/lib_fifo_v1_0_14
vmap axi_quad_spi_v3_2_21 riviera/axi_quad_spi_v3_2_21
vmap axi_timebase_wdt_v3_0_14 riviera/axi_timebase_wdt_v3_0_14
vmap xlconstant_v1_1_7 riviera/xlconstant_v1_1_7

vlog -work xpm  -sv2k12 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_4 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_microblaze_0_0/sim/embsys_microblaze_0_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0_S00_AXI.v" \
"../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0.v" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/f811/src/rgbpwm.v" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/f811/src/debounce.v" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/f811/src/sevensegment.v" \
"../../../bd/embsys/ip/embsys_nexys4io_0_0/sim/embsys_nexys4io_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_gpio_0_0/sim/embsys_axi_gpio_0_0.vhd" \

vcom -work lib_pkg_v1_0_2 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_24 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/70d6/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_timer_0_0/sim/embsys_axi_timer_0_0.vhd" \

vcom -work fit_timer_v2_0_10 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/e81b/hdl/fit_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_fit_timer_0_0/sim/embsys_fit_timer_0_0.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_26 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/5edb/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_uartlite_0_0/sim/embsys_axi_uartlite_0_0.vhd" \

vcom -work lmb_v10_v3_0_11 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_dlmb_v10_0/sim/embsys_dlmb_v10_0.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_v10_0/sim/embsys_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_dlmb_bram_if_cntlr_0/sim/embsys_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_bram_if_cntlr_0/sim/embsys_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_lmb_bram_0/sim/embsys_lmb_bram_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xbar_0/sim/embsys_xbar_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_0_0/sim/embsys_tier2_xbar_0_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_1_0/sim/embsys_tier2_xbar_1_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_2_0/sim/embsys_tier2_xbar_2_0.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_auto_pc_0/sim/embsys_auto_pc_0.v" \

vcom -work axi_intc_v4_1_15 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/47b8/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_microblaze_0_axi_intc_0/sim/embsys_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_4  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_microblaze_0_xlconcat_0/sim/embsys_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_19 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_mdm_1_0/sim/embsys_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_clk_wiz_1_0/embsys_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/embsys/ip/embsys_clk_wiz_1_0/embsys_clk_wiz_1_0.v" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_rst_clk_wiz_1_100M_0/sim/embsys_rst_clk_wiz_1_100M_0.vhd" \

vlog -work dist_mem_gen_v8_0_13  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_fifo_v1_0_14 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_21 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/sim/PmodOLEDrgb_axi_quad_spi_0_0.vhd" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/sim/PmodOLEDrgb_axi_gpio_0_1.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/src/pmod_concat.v" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/sim/PmodOLEDrgb_pmod_bridge_0_0.v" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d9e9/hdl/PmodOLEDrgb_v1_0.v" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/sim/embsys_PmodOLEDrgb_0_0.v" \

vcom -work axi_timebase_wdt_v3_0_14 -93 \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/52c7/hdl/axi_timebase_wdt_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_timebase_wdt_0_0/sim/embsys_axi_timebase_wdt_0_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_0_4/sim/embsys_axi_gpio_0_4.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xlconcat_0_1/sim/embsys_xlconcat_0_1.v" \

vlog -work xlconstant_v1_1_7  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xlconstant_0_1/sim/embsys_xlconstant_0_1.v" \
"../../../bd/embsys/ip/embsys_xadc_wiz_0_0/embsys_xadc_wiz_0_0.v" \
"../../../bd/embsys/ipshared/ddf2/hdl/PmodENC544_v1_0_S00_AXI.v" \
"../../../bd/embsys/ipshared/ddf2/hdl/PmodENC544_v1_0.v" \
"../../../bd/embsys/ip/embsys_PmodENC544_0_0/sim/embsys_PmodENC544_0_0.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_gpio_1_0/sim/embsys_axi_gpio_1_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xlconstant_0_2/sim/embsys_xlconstant_0_2.v" \

vcom -work xil_defaultlib -93 \
"../../../bd/embsys/ip/embsys_axi_gpio_XADC_Data_Out_0/sim/embsys_axi_gpio_XADC_Data_Out_0.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xlconstant_1_0/sim/embsys_xlconstant_1_0.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ipshared/1f26/hdl/PWM_AXI.sv" \
"../../../bd/embsys/ipshared/1f26/hdl/PWM_v2_0.sv" \
"../../../bd/embsys/ip/embsys_PWM_0_0/sim/embsys_PWM_0_0.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_Motor_Vivado.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/sim/embsys.v" \

vlog -work xil_defaultlib \
"glbl.v"

