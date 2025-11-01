# ####################################################################

#  Created by Genus(TM) Synthesis Solution 20.11-s111_1 on Fri Oct 31 14:50:52 IST 2025

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design pe64_lookahead

set_max_delay 1.2 -from [list \
  [get_ports {d[63]}]  \
  [get_ports {d[62]}]  \
  [get_ports {d[61]}]  \
  [get_ports {d[60]}]  \
  [get_ports {d[59]}]  \
  [get_ports {d[58]}]  \
  [get_ports {d[57]}]  \
  [get_ports {d[56]}]  \
  [get_ports {d[55]}]  \
  [get_ports {d[54]}]  \
  [get_ports {d[53]}]  \
  [get_ports {d[52]}]  \
  [get_ports {d[51]}]  \
  [get_ports {d[50]}]  \
  [get_ports {d[49]}]  \
  [get_ports {d[48]}]  \
  [get_ports {d[47]}]  \
  [get_ports {d[46]}]  \
  [get_ports {d[45]}]  \
  [get_ports {d[44]}]  \
  [get_ports {d[43]}]  \
  [get_ports {d[42]}]  \
  [get_ports {d[41]}]  \
  [get_ports {d[40]}]  \
  [get_ports {d[39]}]  \
  [get_ports {d[38]}]  \
  [get_ports {d[37]}]  \
  [get_ports {d[36]}]  \
  [get_ports {d[35]}]  \
  [get_ports {d[34]}]  \
  [get_ports {d[33]}]  \
  [get_ports {d[32]}]  \
  [get_ports {d[31]}]  \
  [get_ports {d[30]}]  \
  [get_ports {d[29]}]  \
  [get_ports {d[28]}]  \
  [get_ports {d[27]}]  \
  [get_ports {d[26]}]  \
  [get_ports {d[25]}]  \
  [get_ports {d[24]}]  \
  [get_ports {d[23]}]  \
  [get_ports {d[22]}]  \
  [get_ports {d[21]}]  \
  [get_ports {d[20]}]  \
  [get_ports {d[19]}]  \
  [get_ports {d[18]}]  \
  [get_ports {d[17]}]  \
  [get_ports {d[16]}]  \
  [get_ports {d[15]}]  \
  [get_ports {d[14]}]  \
  [get_ports {d[13]}]  \
  [get_ports {d[12]}]  \
  [get_ports {d[11]}]  \
  [get_ports {d[10]}]  \
  [get_ports {d[9]}]  \
  [get_ports {d[8]}]  \
  [get_ports {d[7]}]  \
  [get_ports {d[6]}]  \
  [get_ports {d[5]}]  \
  [get_ports {d[4]}]  \
  [get_ports {d[3]}]  \
  [get_ports {d[2]}]  \
  [get_ports {d[1]}]  \
  [get_ports {d[0]}] ] -to [list \
  [get_ports {q[5]}]  \
  [get_ports {q[4]}]  \
  [get_ports {q[3]}]  \
  [get_ports {q[2]}]  \
  [get_ports {q[1]}]  \
  [get_ports {q[0]}]  \
  [get_ports v] ]
set_clock_gating_check -setup 0.0 
set_wire_load_mode "enclosed"
