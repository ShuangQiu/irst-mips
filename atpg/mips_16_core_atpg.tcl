read_netlist mips_16_core_dft.v
read_netlist tsmc13.v
run_build_model mips_16_core_top
report_violations -all
run_drc mips_16_core_dft.spf
set_faults -model stuck
add_fault -all
set_atpg -abort_limit 100 -merge high
run_atpg -auto_compression
report_summaries > rpt/mips_16_core_atpg.rpt
write_patterns mips_16_core_atpg.stil -format STIL -nc
