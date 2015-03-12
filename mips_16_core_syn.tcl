read_file -format verilog {/home/raid5_3/user04/r04099/Documents/finale/rtl/EX_stage.v /home/raid5_3/user04/r04099/Documents/finale/rtl/ID_stage.v /home/raid5_3/user04/r04099/Documents/finale/rtl/IF_stage.v /home/raid5_3/user04/r04099/Documents/finale/rtl/MEM_stage.v /home/raid5_3/user04/r04099/Documents/finale/rtl/WB_stage.v /home/raid5_3/user04/r04099/Documents/finale/rtl/alu.v /home/raid5_3/user04/r04099/Documents/finale/rtl/hazard_detection_unit.v /home/raid5_3/user04/r04099/Documents/finale/rtl/mips_16_core_top.v }
current_design mips_16_core_top
uplevel #0 source -verbose -echo /home/raid5_3/user04/r04099/Documents/finale/mips_16_core_syn.sdc
compile_ultra -timing_high_effort_script -no_autoungroup
report_area -nosplit > rpt/mips_16_core_syn.area.rpt
report_timing > rpt/mips_16_core_syn.time.rpt
write_file -format ddc -hierarchy -output mips_16_core_syn.ddc
write_file -format verilog -hierarchy -output mips_16_core_syn.v
write_sdf -version 2.1 mips_16_core_syn.sdf
