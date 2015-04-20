read_netlist mips_16_core_irst.v
read_netlist tsmc13.v
run_build_model mips_16_core_top
add_clocks 0 clk
add_clocks 1 rst
#add_po_masks -all
#remove_po_masks rand_data[0]
#remove_po_masks rand_data[1]
#remove_po_masks rand_data[2]
#remove_po_masks rand_data[3]
#remove_po_masks rand_data[4]
#remove_po_masks rand_data[5]
#remove_po_masks rand_data[6]
#remove_po_masks rand_data[7]
#remove_po_masks rand_data[8]
#remove_po_masks rand_data[9]
#remove_po_masks rand_data[10]
#remove_po_masks rand_data[11]
#remove_po_masks rand_data[12]
#remove_po_masks rand_data[13]
#remove_po_masks rand_data[14]
#remove_po_masks rand_data[15]
#remove_po_masks rand_data[16]
#remove_po_masks rand_data[17]
#remove_po_masks rand_data[18]
#remove_po_masks rand_data[19]
#remove_po_masks rand_data[20]
#remove_po_masks rand_data[21]
#remove_po_masks rand_data[22]
#remove_po_masks rand_data[23]
#remove_po_masks rand_data[24]
#remove_po_masks rand_data[25]
#remove_po_masks rand_data[26]
#remove_po_masks rand_data[27]
#remove_po_masks rand_data[28]
#remove_po_masks rand_data[29]
#remove_po_masks rand_data[30]
#remove_po_masks rand_data[31]
set_drc -nofile
run_drc
set_faults -model stuck
add_faults -all
remove_faults -clocks
set_patterns -external fsim/fsim.evcd -insensitive -strobe_rising clk -strobe_offset { 9 ns }
set_simulation -measure pat
run_simulation -sequential
run_fault_sim -sequential
report_summaries > rpt/fsim.rpt
report_faults -all > rpt/fsim.fault.rpt
