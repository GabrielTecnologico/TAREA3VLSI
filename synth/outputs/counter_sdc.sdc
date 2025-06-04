# ####################################################################

#  Created by Genus(TM) Synthesis Solution 22.13-s093_1 on Tue Jun 03 21:35:02 CST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design counter

create_clock -name "clk" -period 10.0 -waveform {0.0 5.0} [get_ports clk_i]
set_clock_gating_check -setup 0.0 
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {q_o[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {q_o[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -max 1.0 [get_ports {q_o[0]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.1 [get_ports {q_o[2]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.1 [get_ports {q_o[1]}]
set_output_delay -clock [get_clocks clk] -add_delay -min 0.1 [get_ports {q_o[0]}]
set_input_delay -clock [get_clocks clk] -add_delay -max 0.2 [get_ports rst_n_i]
set_input_delay -clock [get_clocks clk] -add_delay -min 0.1 [get_ports rst_n_i]
set_wire_load_mode "enclosed"
set_clock_uncertainty -setup 0.3 [get_clocks clk]
set_clock_uncertainty -hold 0.3 [get_clocks clk]
