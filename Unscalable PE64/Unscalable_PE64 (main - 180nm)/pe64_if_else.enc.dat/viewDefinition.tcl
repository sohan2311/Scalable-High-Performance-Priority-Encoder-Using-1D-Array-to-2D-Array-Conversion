if {![namespace exists ::IMEX]} { namespace eval ::IMEX {} }
set ::IMEX::dataVar [file dirname [file normalize [info script]]]
set ::IMEX::libVar ${::IMEX::dataVar}/libs

create_library_set -name fast\
   -timing\
    [list ${::IMEX::libVar}/mmmc/fast.lib]
create_library_set -name slow\
   -timing\
    [list ${::IMEX::libVar}/lib/typ/slow.lib]
create_rc_corner -name Rc\
   -preRoute_res 1\
   -postRoute_res 1\
   -preRoute_cap 1\
   -postRoute_cap 1\
   -postRoute_xcap 1\
   -preRoute_clkres 0\
   -preRoute_clkcap 0\
   -qx_tech_file ${::IMEX::libVar}/mmmc/Rc/t018s6mm.tch
create_delay_corner -name min\
   -library_set fast\
   -rc_corner Rc
create_delay_corner -name max\
   -library_set slow\
   -rc_corner Rc
create_constraint_mode -name constraints\
   -sdc_files\
    [list /dev/null]
create_analysis_view -name wc -constraint_mode constraints -delay_corner max
create_analysis_view -name bc -constraint_mode constraints -delay_corner min
set_analysis_view -setup [list wc] -hold [list bc]
