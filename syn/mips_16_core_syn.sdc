###################################################################

# Created by write_sdc on Sun Nov 22 16:38:55 2015

###################################################################
set sdc_version 1.9

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max slow -max_library slow\
                         -min fast -min_library fast
set_wire_load_model -name tsmc13_wl10 -library slow
set_max_fanout 8 [current_design]
set_max_transition 1 [current_design]
set_max_area 0
set_load -pin_load 1 [get_ports {pc[7]}]
set_load -pin_load 1 [get_ports {pc[6]}]
set_load -pin_load 1 [get_ports {pc[5]}]
set_load -pin_load 1 [get_ports {pc[4]}]
set_load -pin_load 1 [get_ports {pc[3]}]
set_load -pin_load 1 [get_ports {pc[2]}]
set_load -pin_load 1 [get_ports {pc[1]}]
set_load -pin_load 1 [get_ports {pc[0]}]
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_latency 1  [get_clocks clk]
set_clock_uncertainty 1  [get_clocks clk]
set_input_delay -clock clk  1  [get_ports rst]
set_input_delay -clock clk  1  [get_ports {instruction[15]}]
set_input_delay -clock clk  1  [get_ports {instruction[14]}]
set_input_delay -clock clk  1  [get_ports {instruction[13]}]
set_input_delay -clock clk  1  [get_ports {instruction[12]}]
set_input_delay -clock clk  1  [get_ports {instruction[11]}]
set_input_delay -clock clk  1  [get_ports {instruction[10]}]
set_input_delay -clock clk  1  [get_ports {instruction[9]}]
set_input_delay -clock clk  1  [get_ports {instruction[8]}]
set_input_delay -clock clk  1  [get_ports {instruction[7]}]
set_input_delay -clock clk  1  [get_ports {instruction[6]}]
set_input_delay -clock clk  1  [get_ports {instruction[5]}]
set_input_delay -clock clk  1  [get_ports {instruction[4]}]
set_input_delay -clock clk  1  [get_ports {instruction[3]}]
set_input_delay -clock clk  1  [get_ports {instruction[2]}]
set_input_delay -clock clk  1  [get_ports {instruction[1]}]
set_input_delay -clock clk  1  [get_ports {instruction[0]}]
set_output_delay -clock clk  1  [get_ports {pc[7]}]
set_output_delay -clock clk  1  [get_ports {pc[6]}]
set_output_delay -clock clk  1  [get_ports {pc[5]}]
set_output_delay -clock clk  1  [get_ports {pc[4]}]
set_output_delay -clock clk  1  [get_ports {pc[3]}]
set_output_delay -clock clk  1  [get_ports {pc[2]}]
set_output_delay -clock clk  1  [get_ports {pc[1]}]
set_output_delay -clock clk  1  [get_ports {pc[0]}]
set_drive 1  [get_ports clk]
set_drive 1  [get_ports rst]
set_drive 1  [get_ports {instruction[15]}]
set_drive 1  [get_ports {instruction[14]}]
set_drive 1  [get_ports {instruction[13]}]
set_drive 1  [get_ports {instruction[12]}]
set_drive 1  [get_ports {instruction[11]}]
set_drive 1  [get_ports {instruction[10]}]
set_drive 1  [get_ports {instruction[9]}]
set_drive 1  [get_ports {instruction[8]}]
set_drive 1  [get_ports {instruction[7]}]
set_drive 1  [get_ports {instruction[6]}]
set_drive 1  [get_ports {instruction[5]}]
set_drive 1  [get_ports {instruction[4]}]
set_drive 1  [get_ports {instruction[3]}]
set_drive 1  [get_ports {instruction[2]}]
set_drive 1  [get_ports {instruction[1]}]
set_drive 1  [get_ports {instruction[0]}]
