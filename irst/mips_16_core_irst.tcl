current_design mips_16_core_top
uplevel #0 source -verbose -echo /home/raid5_3/user04/r04099/Documents/finale/mips_16_core_syn.sdc
compile_ultra -timing_high_effort_script -no_autoungroup
#report_area -hierarchy > rpt/mips_16_core_irst.area.rpt
#report_timing > rpt/mips_16_core_irst.time.rpt
write_file -format ddc -hierarchy -output mips_16_core_irst.ddc
write_file -format verilog -hierarchy -output mips_16_core_irst.v
write_sdf -version 2.1 mips_16_core_irst.sdf
