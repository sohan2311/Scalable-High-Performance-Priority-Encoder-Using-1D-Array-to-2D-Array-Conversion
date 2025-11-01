set_db init_lib_search_path /home/install/FOUNDRY/digital/180nm/dig/lib/

set_db library slow.lib

read_hdl {./priority.v}

elaborate pe64_if_else
read_sdc ./constraint_input.sdc

set_db syn_generic_effort medium
set_db syn_map_effort medium
set_db syn_opt_effort medium

syn_generic
syn_map
syn_opt

write_hdl > priority_netlist.v
write_sdc > priority_output.sdc

report timing > priority_timing.rpt
report power > priority_power.rpt
report area  > priority_cell.rpt
report gates > priority_gates.rpt

gui_show
