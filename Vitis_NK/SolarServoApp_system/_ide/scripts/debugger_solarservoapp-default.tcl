# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: D:\PSU_Work_and_Textbooks\ECE544\ECE544_ProjFinal\ECE-544-final-project\Vitis\SolarServoApp_system\_ide\scripts\debugger_solarservoapp-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source D:\PSU_Work_and_Textbooks\ECE544\ECE544_ProjFinal\ECE-544-final-project\Vitis\SolarServoApp_system\_ide\scripts\debugger_solarservoapp-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Nexys A7 -100T 210292AE38CEA" && level==0 && jtag_device_ctx=="jsn-Nexys A7 -100T-210292AE38CEA-13631093-0"}
fpga -file D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Vitis/SolarServoApp/_ide/bitstream/download.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Vitis/SolarMotorPlatform/export/SolarMotorPlatform/hw/nexysA7fpga.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Vitis/SolarServoApp/Debug/SolarServoApp.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
