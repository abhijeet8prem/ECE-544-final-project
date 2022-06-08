vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/microblaze_v11_0_4
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/interrupt_control_v3_1_4
vlib modelsim_lib/msim/axi_gpio_v2_0_24
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/axi_timer_v2_0_24
vlib modelsim_lib/msim/fit_timer_v2_0_10
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_26
vlib modelsim_lib/msim/lmb_v10_v3_0_11
vlib modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_19
vlib modelsim_lib/msim/blk_mem_gen_v8_4_4
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_register_slice_v2_1_22
vlib modelsim_lib/msim/fifo_generator_v13_2_5
vlib modelsim_lib/msim/axi_data_fifo_v2_1_21
vlib modelsim_lib/msim/axi_crossbar_v2_1_23
vlib modelsim_lib/msim/axi_intc_v4_1_15
vlib modelsim_lib/msim/xlconcat_v2_1_4
vlib modelsim_lib/msim/mdm_v3_2_19
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13
vlib modelsim_lib/msim/dist_mem_gen_v8_0_13
vlib modelsim_lib/msim/lib_fifo_v1_0_14
vlib modelsim_lib/msim/axi_quad_spi_v3_2_21
vlib modelsim_lib/msim/axi_timebase_wdt_v3_0_14
vlib modelsim_lib/msim/xlconstant_v1_1_7
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_22

vmap xpm modelsim_lib/msim/xpm
vmap microblaze_v11_0_4 modelsim_lib/msim/microblaze_v11_0_4
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap interrupt_control_v3_1_4 modelsim_lib/msim/interrupt_control_v3_1_4
vmap axi_gpio_v2_0_24 modelsim_lib/msim/axi_gpio_v2_0_24
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap axi_timer_v2_0_24 modelsim_lib/msim/axi_timer_v2_0_24
vmap fit_timer_v2_0_10 modelsim_lib/msim/fit_timer_v2_0_10
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap axi_uartlite_v2_0_26 modelsim_lib/msim/axi_uartlite_v2_0_26
vmap lmb_v10_v3_0_11 modelsim_lib/msim/lmb_v10_v3_0_11
vmap lmb_bram_if_cntlr_v4_0_19 modelsim_lib/msim/lmb_bram_if_cntlr_v4_0_19
vmap blk_mem_gen_v8_4_4 modelsim_lib/msim/blk_mem_gen_v8_4_4
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_register_slice_v2_1_22 modelsim_lib/msim/axi_register_slice_v2_1_22
vmap fifo_generator_v13_2_5 modelsim_lib/msim/fifo_generator_v13_2_5
vmap axi_data_fifo_v2_1_21 modelsim_lib/msim/axi_data_fifo_v2_1_21
vmap axi_crossbar_v2_1_23 modelsim_lib/msim/axi_crossbar_v2_1_23
vmap axi_intc_v4_1_15 modelsim_lib/msim/axi_intc_v4_1_15
vmap xlconcat_v2_1_4 modelsim_lib/msim/xlconcat_v2_1_4
vmap mdm_v3_2_19 modelsim_lib/msim/mdm_v3_2_19
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13
vmap dist_mem_gen_v8_0_13 modelsim_lib/msim/dist_mem_gen_v8_0_13
vmap lib_fifo_v1_0_14 modelsim_lib/msim/lib_fifo_v1_0_14
vmap axi_quad_spi_v3_2_21 modelsim_lib/msim/axi_quad_spi_v3_2_21
vmap axi_timebase_wdt_v3_0_14 modelsim_lib/msim/axi_timebase_wdt_v3_0_14
vmap xlconstant_v1_1_7 modelsim_lib/msim/xlconstant_v1_1_7
vmap axi_protocol_converter_v2_1_22 modelsim_lib/msim/axi_protocol_converter_v2_1_22

vlog -work xpm  -incr -sv "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_fifo/hdl/xpm_fifo.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm  -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v11_0_4  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/9285/hdl/microblaze_v11_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_microblaze_0_0/sim/embsys_microblaze_0_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0_S00_AXI.v" \
"../../../bd/embsys/ipshared/f811/hdl/nexys4io_v3_0.v" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/f811/src/rgbpwm.v" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/f811/src/debounce.v" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/f811/src/sevensegment.v" \
"../../../bd/embsys/ip/embsys_nexys4io_0_0/sim/embsys_nexys4io_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_cdc_v1_0_2  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work interrupt_control_v3_1_4  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/a040/hdl/interrupt_control_v3_1_vh_rfs.vhd" \

vcom -work axi_gpio_v2_0_24  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/4318/hdl/axi_gpio_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_axi_gpio_0_0/sim/embsys_axi_gpio_0_0.vhd" \

vcom -work lib_pkg_v1_0_2  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work axi_timer_v2_0_24  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/70d6/hdl/axi_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_axi_timer_0_0/sim/embsys_axi_timer_0_0.vhd" \

vcom -work fit_timer_v2_0_10  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/e81b/hdl/fit_timer_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_fit_timer_0_0/sim/embsys_fit_timer_0_0.vhd" \

vcom -work lib_srl_fifo_v1_0_2  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_26  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/5edb/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_axi_uartlite_0_0/sim/embsys_axi_uartlite_0_0.vhd" \

vcom -work lmb_v10_v3_0_11  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/c2ed/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_dlmb_v10_0/sim/embsys_dlmb_v10_0.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_v10_0/sim/embsys_ilmb_v10_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_19  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/0b98/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_dlmb_bram_if_cntlr_0/sim/embsys_dlmb_bram_if_cntlr_0.vhd" \
"../../../bd/embsys/ip/embsys_ilmb_bram_if_cntlr_0/sim/embsys_ilmb_bram_if_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_4_4  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/2985/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_lmb_bram_0/sim/embsys_lmb_bram_0.v" \

vlog -work generic_baseblocks_v2_1_0  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_infrastructure_v1_1_0  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_crossbar_v2_1_23  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/bc0a/hdl/axi_crossbar_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xbar_0/sim/embsys_xbar_0.v" \

vcom -work axi_intc_v4_1_15  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/47b8/hdl/axi_intc_v4_1_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_microblaze_0_axi_intc_0/sim/embsys_microblaze_0_axi_intc_0.vhd" \

vlog -work xlconcat_v2_1_4  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/4b67/hdl/xlconcat_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_microblaze_0_xlconcat_0/sim/embsys_microblaze_0_xlconcat_0.v" \

vcom -work mdm_v3_2_19  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/8715/hdl/mdm_v3_2_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_mdm_1_0/sim/embsys_mdm_1_0.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_clk_wiz_1_0/embsys_clk_wiz_1_0_clk_wiz.v" \
"../../../bd/embsys/ip/embsys_clk_wiz_1_0/embsys_clk_wiz_1_0.v" \

vcom -work proc_sys_reset_v5_0_13  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_rst_clk_wiz_1_100M_0/sim/embsys_rst_clk_wiz_1_100M_0.vhd" \

vlog -work dist_mem_gen_v8_0_13  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/simulation/dist_mem_gen_v8_0.v" \

vcom -work lib_fifo_v1_0_14  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/lib_fifo_v1_0_rfs.vhd" \

vcom -work axi_quad_spi_v3_2_21  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/hdl/axi_quad_spi_v3_2_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_quad_spi_0_0/sim/PmodOLEDrgb_axi_quad_spi_0_0.vhd" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_axi_gpio_0_1/sim/PmodOLEDrgb_axi_gpio_0_1.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/src/pmod_concat.v" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/ip/PmodOLEDrgb_pmod_bridge_0_0/sim/PmodOLEDrgb_pmod_bridge_0_0.v" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d9e9/hdl/PmodOLEDrgb_v1_0.v" \
"../../../bd/embsys/ip/embsys_PmodOLEDrgb_0_0/sim/embsys_PmodOLEDrgb_0_0.v" \

vcom -work axi_timebase_wdt_v3_0_14  -93 \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/52c7/hdl/axi_timebase_wdt_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib  -93 \
"../../../bd/embsys/ip/embsys_axi_timebase_wdt_0_0/sim/embsys_axi_timebase_wdt_0_0.vhd" \
"../../../bd/embsys/ip/embsys_axi_gpio_0_4/sim/embsys_axi_gpio_0_4.vhd" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xlconcat_0_1/sim/embsys_xlconcat_0_1.v" \

vlog -work xlconstant_v1_1_7  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/fcfc/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_xlconstant_0_1/sim/embsys_xlconstant_0_1.v" \

vlog -work xil_defaultlib  -incr -sv "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ipshared/1f26/hdl/PWM_AXI.sv" \
"../../../bd/embsys/ipshared/1f26/hdl/PWM_v2_0.sv" \
"../../../bd/embsys/ip/embsys_PWM_0_0/sim/embsys_PWM_0_0.sv" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ipshared/ddf2/hdl/PmodENC544_v1_0_S00_AXI.v" \
"../../../bd/embsys/ipshared/ddf2/hdl/PmodENC544_v1_0.v" \
"../../../bd/embsys/ip/embsys_PmodENC544_0_0/sim/embsys_PmodENC544_0_0.v" \
"../../../bd/embsys/sim/embsys.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_0_0/sim/embsys_tier2_xbar_0_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_1_0/sim/embsys_tier2_xbar_1_0.v" \
"../../../bd/embsys/ip/embsys_tier2_xbar_2_0/sim/embsys_tier2_xbar_2_0.v" \

vlog -work axi_protocol_converter_v2_1_22  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/ec67/hdl" "+incdir+../../../../Photo_ADC_Motor.gen/sources_1/bd/embsys/ipshared/d0f7" \
"../../../bd/embsys/ip/embsys_auto_pc_0/sim/embsys_auto_pc_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

