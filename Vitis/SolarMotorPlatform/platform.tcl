# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct D:\PSU_Work_and_Textbooks\ECE544\ECE544_ProjFinal\ECE-544-final-project\Vitis\SolarMotorPlatform\platform.tcl
# 
# OR launch xsct and run below command.
# source D:\PSU_Work_and_Textbooks\ECE544\ECE544_ProjFinal\ECE-544-final-project\Vitis\SolarMotorPlatform\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {SolarMotorPlatform}\
-hw {D:\PSU_Work_and_Textbooks\ECE544\ECE544_ProjFinal\ECE-544-final-project\nexysA7fpga.xsa}\
-proc {microblaze_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Vitis}

platform write
platform generate -domains 
platform active {SolarMotorPlatform}
platform active {SolarMotorPlatform}
platform clean
platform clean
platform clean
platform clean
