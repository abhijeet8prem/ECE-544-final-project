# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct C:\vivado_vitis_workspace\ece544\final_project\repo\ECE-544-final-project\vitis_abhi\nexys7_solar_tracker\platform.tcl
# 
# OR launch xsct and run below command.
# source C:\vivado_vitis_workspace\ece544\final_project\repo\ECE-544-final-project\vitis_abhi\nexys7_solar_tracker\platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {nexys7_solar_tracker}\
-hw {C:\vivado_vitis_workspace\ece544\final_project\repo\ECE-544-final-project\nexysA7fpga.xsa}\
-proc {microblaze_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {C:/vivado_vitis_workspace/ece544/final_project/repo/ECE-544-final-project/vitis_abhi}

platform write
platform generate -domains 
platform active {nexys7_solar_tracker}
platform generate
platform active {nexys7_solar_tracker}
platform config -updatehw {C:/vivado_vitis_workspace/ece544/final_project/repo/ECE-544-final-project/Photo_Motor_Vivado/nexysA7fpga.xsa}
platform generate -domains 
platform generate -domains 
