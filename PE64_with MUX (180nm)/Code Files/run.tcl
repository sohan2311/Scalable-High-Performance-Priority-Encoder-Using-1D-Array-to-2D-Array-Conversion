set_db init_lib_search_path /home/install/FOUNDRY/digital/180nm/dig/lib/

set_db library slow.lib

read_hdl {./priority_mux.v}

elaborate pe64_lookahead
read_sdc ./constraint_input.sdc

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

write_hdl > priority_mux_netlist.v
write_sdc > priority_mux_output.sdc

report timing > priority_mux_timing.rpt
report power > priority_mux_power.rpt
report area  > priority_mux_cell.rpt
report gates > priority_mux_gates.rpt

gui_show
