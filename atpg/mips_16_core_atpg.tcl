     1  read_netlist mips_16_core_dft.v
     2  read_netlist tsmc13.v
     3  run_build_model mips_16_core_top
     4  report_violations
     5  report_violations -al
     6  run_drc mips_16_core_dft.spf
     7  set_faults -model stuck
     8  add_fault -all
     9  set_atpg -abort_limit 100 -merge high
    10  run_atpg -auto_compression
    11  report_summaries
    12  report_summaries > rpt/mips_16_core_atpg.rpt
    13  write_patterns ALU_syn_ATPG.stil -format STIL -vcs
    14  write_patterns ALU_syn_ATPG.stil -format STIL -nc
    15  write_patterns mips_16_core_atpg.stil -format STIL -nc
    16  history > mips_16_core_atpg.tcl
