
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7a100t2default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
B
-Phase 1 Build RT Design | Checksum: a42c185c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:37 ; elapsed = 00:00:31 . Memory (MB): peak = 2240.648 ; gain = 116.1602default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
A
,Phase 2.1 Create Timer | Checksum: a42c185c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:37 ; elapsed = 00:00:31 . Memory (MB): peak = 2240.672 ; gain = 116.1842default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
M
8Phase 2.2 Fix Topology Constraints | Checksum: a42c185c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:37 ; elapsed = 00:00:31 . Memory (MB): peak = 2246.680 ; gain = 122.1912default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
F
1Phase 2.3 Pre Route Cleanup | Checksum: a42c185c
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:37 ; elapsed = 00:00:31 . Memory (MB): peak = 2246.680 ; gain = 122.1912default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
B
-Phase 2.4 Update Timing | Checksum: cc6ff833
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:45 ; elapsed = 00:00:36 . Memory (MB): peak = 2272.715 ; gain = 148.2272default:defaulth px? 
?
Intermediate Timing Summary %s164*route2K
7| WNS=0.871  | TNS=0.000  | WHS=-0.233 | THS=-345.765|
2default:defaultZ35-416h px? 
}

Phase %s%s
101*constraints2
2.5 2default:default2.
Update Timing for Bus Skew2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
2.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 2.5.1 Update Timing | Checksum: aea90af4
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:54 ; elapsed = 00:00:41 . Memory (MB): peak = 2273.723 ; gain = 149.2342default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.871  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
O
:Phase 2.5 Update Timing for Bus Skew | Checksum: bf0712c6
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:54 ; elapsed = 00:00:42 . Memory (MB): peak = 2286.129 ; gain = 161.6412default:defaulth px? 
H
3Phase 2 Router Initialization | Checksum: 87f3ebbb
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:55 ; elapsed = 00:00:42 . Memory (MB): peak = 2286.129 ; gain = 161.6412default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
3.1 2default:default2"
Global Routing2default:defaultZ18-101h px? 
C
.Phase 3.1 Global Routing | Checksum: 87f3ebbb
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:00:55 ; elapsed = 00:00:42 . Memory (MB): peak = 2286.129 ; gain = 161.6412default:defaulth px? 
C
.Phase 3 Initial Routing | Checksum: 15e9eb502
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:05 ; elapsed = 00:00:47 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=1.200  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
H
3Phase 4.1 Global Iteration 0 | Checksum: 1d5b42fea
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:17 ; elapsed = 00:00:57 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
F
1Phase 4 Rip-up And Reroute | Checksum: 1d5b42fea
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:17 ; elapsed = 00:00:57 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 5.1.1 Update Timing | Checksum: 20b5f1587
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:20 ; elapsed = 00:00:58 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=1.279  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 1bd0fbd9d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:20 ; elapsed = 00:00:58 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 1bd0fbd9d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:20 ; elapsed = 00:00:58 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 1bd0fbd9d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:20 ; elapsed = 00:00:58 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 1403fc9c0
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:23 ; elapsed = 00:01:00 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=1.279  | TNS=0.000  | WHS=0.019  | THS=0.000  |
2default:defaultZ35-416h px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 170d25cbf
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:23 ; elapsed = 00:01:00 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 170d25cbf
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:23 ; elapsed = 00:01:00 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1a033a08d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:23 ; elapsed = 00:01:00 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1a033a08d
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:23 ; elapsed = 00:01:00 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 162c5baa6
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:24 ; elapsed = 00:01:01 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=1.279  | TNS=0.000  | WHS=0.019  | THS=0.000  |
2default:defaultZ35-57h px? 
?
?The final timing numbers are based on the router estimated timing analysis. For a complete and accurate timing signoff, please run report_timing_summary.
127*routeZ35-327h px? 
G
2Phase 10 Post Router Timing | Checksum: 162c5baa6
*commonh px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:25 ; elapsed = 00:01:01 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2q
]Time (s): cpu = 00:01:25 ; elapsed = 00:01:01 . Memory (MB): peak = 2319.867 ; gain = 195.3792default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1322default:default2
432default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:01:322default:default2
00:01:052default:default2
2319.8672default:default2
195.3792default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:042default:default2
00:00:012default:default2
2319.8672default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2?
?D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Photo_Motor_Vivado/Photo_Motor_Vivado.runs/impl_1/nexysA7fpga_routed.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
vExecuting : report_drc -file nexysA7fpga_drc_routed.rpt -pb nexysA7fpga_drc_routed.pb -rpx nexysA7fpga_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2}
ireport_drc -file nexysA7fpga_drc_routed.rpt -pb nexysA7fpga_drc_routed.pb -rpx nexysA7fpga_drc_routed.rpx2default:defaultZ4-113h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
?D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Photo_Motor_Vivado/Photo_Motor_Vivado.runs/impl_1/nexysA7fpga_drc_routed.rpt?D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Photo_Motor_Vivado/Photo_Motor_Vivado.runs/impl_1/nexysA7fpga_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
report_drc: 2default:default2
00:00:102default:default2
00:00:062default:default2
2322.1022default:default2
2.2342default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file nexysA7fpga_methodology_drc_routed.rpt -pb nexysA7fpga_methodology_drc_routed.pb -rpx nexysA7fpga_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file nexysA7fpga_methodology_drc_routed.rpt -pb nexysA7fpga_methodology_drc_routed.pb -rpx nexysA7fpga_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
?D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Photo_Motor_Vivado/Photo_Motor_Vivado.runs/impl_1/nexysA7fpga_methodology_drc_routed.rpt?D:/PSU_Work_and_Textbooks/ECE544/ECE544_ProjFinal/ECE-544-final-project/Photo_Motor_Vivado/Photo_Motor_Vivado.runs/impl_1/nexysA7fpga_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:182default:default2
00:00:092default:default2
2322.1022default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
?Executing : report_power -file nexysA7fpga_power_routed.rpt -pb nexysA7fpga_power_summary_routed.pb -rpx nexysA7fpga_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
yreport_power -file nexysA7fpga_power_routed.rpt -pb nexysA7fpga_power_summary_routed.pb -rpx nexysA7fpga_power_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
?Detected over-assertion of set/reset/preset/clear net with high fanouts, power estimation might not be accurate. Please run Tool - Power Constraint Wizard to set proper switching activities for control signals.282*powerZ33-332h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1442default:default2
442default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
report_power: 2default:default2
00:00:102default:default2
00:00:062default:default2
2322.2302default:default2
0.1292default:defaultZ17-268h px? 
?
%s4*runtcl2w
cExecuting : report_route_status -file nexysA7fpga_route_status.rpt -pb nexysA7fpga_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file nexysA7fpga_timing_summary_routed.rpt -pb nexysA7fpga_timing_summary_routed.pb -rpx nexysA7fpga_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px? 
?
%s4*runtcl2h
TExecuting : report_incremental_reuse -file nexysA7fpga_incremental_reuse_routed.rpt
2default:defaulth px? 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px? 
?
%s4*runtcl2h
TExecuting : report_clock_utilization -file nexysA7fpga_clock_utilization_routed.rpt
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_bus_skew -warn_on_violation -file nexysA7fpga_bus_skew_routed.rpt -pb nexysA7fpga_bus_skew_routed.pb -rpx nexysA7fpga_bus_skew_routed.rpx
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 


End Record