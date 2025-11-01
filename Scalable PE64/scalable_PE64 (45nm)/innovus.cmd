#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Fri Oct 10 16:31:30 2025                
#                                                     
#######################################################

#@(#)CDS: Innovus v20.14-s095_1 (64bit) 04/19/2021 14:41 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: NanoRoute 20.14-s095_1 NR210411-1939/20_14-UB (database version 18.20.547) {superthreading v2.13}
#@(#)CDS: AAE 20.14-s018 (64bit) 04/19/2021 (Linux 2.6.32-431.11.2.el6.x86_64)
#@(#)CDS: CTE 20.14-s027_1 () Apr 13 2021 21:29:07 ( )
#@(#)CDS: SYNTECH 20.14-s017_1 () Mar 25 2021 13:07:27 ( )
#@(#)CDS: CPE v20.14-s080
#@(#)CDS: IQuantus/TQuantus 20.1.1-s460 (64bit) Fri Mar 5 18:46:16 PST 2021 (Linux 2.6.32-431.11.2.el6.x86_64)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
getVersion
getVersion
getVersion
win
set init_gnd_net VSS
set init_lef_file ../../../install/FOUNDRY/digital/45nm/dig/lef/gsclib045_tech.lef
set init_design_settop 0
set init_verilog priority_netlist.v
set init_mmmc_file Default.view
set init_pwr_net {VDD }
init_design
zoomBox -1.08000 0.03250 0.95200 1.01500
zoomBox -1.44500 -0.01850 1.36800 1.34150
zoomBox -0.93800 0.05250 0.78950 0.88750
zoomBox -1.44400 -0.01700 1.36900 1.34300
zoomBox -2.26750 -0.13000 2.31400 2.08500
getIoFlowFlag
setIoFlowFlag 0
floorPlan -r 1.0 0.7 6 6 6 6
uiSetTool select
getIoFlowFlag
fit
zoomBox -5.29050 1.39450 17.37850 12.35400
zoomBox -2.11400 2.89950 14.26550 10.81850
zoomBox 2.51550 5.09100 9.78400 8.60500
zoomBox 4.56950 6.06300 7.79500 7.62250
zoomBox 5.35300 6.43400 7.03650 7.24800
zoomBox 4.56900 6.06300 7.79450 7.62250
zoomBox 3.06650 5.35200 9.24800 8.34050
zoomBox 0.19000 3.99000 12.03250 9.71550
zoomBox -5.32150 1.38100 17.36700 12.35000
zoomBox -15.87950 -3.61650 27.58650 17.39750
zoomBox -29.75700 -10.18600 41.02050 24.03250
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) M11(11) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) M11(11) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) M11(11) }
win off
