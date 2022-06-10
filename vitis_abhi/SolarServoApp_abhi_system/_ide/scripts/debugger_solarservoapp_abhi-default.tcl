# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: C:\vivado_vitis_workspace\ece544\final_project\repo\ECE-544-final-project\vitis_abhi\SolarServoApp_abhi_system\_ide\scripts\debugger_solarservoapp_abhi-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source C:\vivado_vitis_workspace\ece544\final_project\repo\ECE-544-final-project\vitis_abhi\SolarServoApp_abhi_system\_ide\scripts\debugger_solarservoapp_abhi-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys4DDR 210292A8AEAAA" && level==0 && jtag_device_ctx=="jsn-Nexys4DDR-210292A8AEAAA-13631093-0"}
fpga -file C:/vivado_vitis_workspace/ece544/final_project/repo/ECE-544-final-project/vitis_abhi/SolarServoApp_abhi/_ide/bitstream/download.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw C:/vivado_vitis_workspace/ece544/final_project/repo/ECE-544-final-project/vitis_abhi/nexys7_solar_tracker/export/nexys7_solar_tracker/hw/nexysA7fpga.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow C:/vivado_vitis_workspace/ece544/final_project/repo/ECE-544-final-project/vitis_abhi/SolarServoApp_abhi/Debug/SolarServoApp_abhi.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
