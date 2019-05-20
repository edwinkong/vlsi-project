#######################################################
#                                                     
#  Innovus Command Logging File                     
#  Created on Mon May 20 20:52:55 2019                
#                                                     
#######################################################

#@(#)CDS: Innovus v18.12-s106_1 (64bit) 12/11/2018 14:18 (Linux 2.6.18-194.el5)
#@(#)CDS: NanoRoute 18.12-s106_1 NR181210-1607/18_12-UB (database version 2.30, 441.7.1) {superthreading v1.47}
#@(#)CDS: AAE 18.12-s039 (64bit) 12/11/2018 (Linux 2.6.18-194.el5)
#@(#)CDS: CTE 18.12-s037_1 () Dec  3 2018 09:27:36 ( )
#@(#)CDS: SYNTECH 18.12-s015_1 () Nov 30 2018 19:16:11 ( )
#@(#)CDS: CPE v18.12-s099
#@(#)CDS: IQuantus/TQuantus 18.1.2-s710 (64bit) Fri Sep 21 18:13:54 PDT 2018 (Linux 2.6.18-194.el5)

set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
save_global Default.globals
set init_gnd_net VSS
set init_lef_file {tsmc13_8lm.lef tsmc13_8lm_antenna.lef}
set init_verilog alu_gate.v
set init_mmmc_file analysis.view
set init_pwr_net VDD
init_design
getIoFlowFlag
setIoFlowFlag 0
floorPlan -site tsm12site -r 0.966584070796 0.700001 0.0 0.0 0.0 0.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site tsm12site -r 0.91386901486 0.699103 0.0 0.0 0.0 0.0
uiSetTool select
getIoFlowFlag
fit
setIoFlowFlag 0
floorPlan -site tsm12site -r 1 0.7 10 10 10 10
uiSetTool select
getIoFlowFlag
fit
clearGlobalNets
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VDD -type tiehi -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VSS -type tielo -instanceBasename *
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer METAL8 -stacked_via_bottom_layer METAL1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets {VDD VSS} -type core_rings -follow core -layer {top METAL1 bottom METAL1 left METAL2 right METAL2} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -extend_corner {} -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Bottom -layer 1 -spreadType center -spacing 0.41 -pin clk
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -side Top -layer 1 -spreadType center -spacing 1 -pin {{mode[0]} {mode[1]} {mode[2]} {mode[3]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 2 -layer 1 -spreadType side -pin {{rd[0]} {rd[1]} {rd[2]} {rd[3]} {rd[4]} {rd[5]} {rd[6]} {rd[7]} {rd[8]} {rd[9]} {rd[10]} {rd[11]} {rd[12]} {rd[13]} {rd[14]} {rd[15]} {rd[16]} {rd[17]} {rd[18]} {rd[19]} {rd[20]} {rd[21]} {rd[22]} {rd[23]} {rd[24]} {rd[25]} {rd[26]} {rd[27]} {rd[28]} {rd[29]} {rd[30]} {rd[31]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -unit MICRON -spreadDirection clockwise -edge 3 -layer 1 -spreadType center -spacing 0.41 -pin reset
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 1 -spreadType side -pin {{rs1[0]} {rs1[1]} {rs1[2]} {rs1[3]} {rs1[4]} {rs1[5]} {rs1[6]} {rs1[7]} {rs1[8]} {rs1[9]} {rs1[10]} {rs1[11]} {rs1[12]} {rs1[13]} {rs1[14]} {rs1[15]} {rs1[16]} {rs1[17]} {rs1[18]} {rs1[19]} {rs1[20]} {rs1[21]} {rs1[22]} {rs1[23]} {rs1[24]} {rs1[25]} {rs1[26]} {rs1[27]} {rs1[28]} {rs1[29]} {rs1[30]} {rs1[31]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 1 -spreadType side -pin {{rs2[0]} {rs2[1]} {rs2[2]} {rs2[3]} {rs2[4]} {rs2[5]} {rs2[6]} {rs2[7]} {rs2[8]} {rs2[9]} {rs2[10]} {rs2[11]} {rs2[12]} {rs2[13]} {rs2[14]} {rs2[15]} {rs2[16]} {rs2[17]} {rs2[18]} {rs2[19]} {rs2[20]} {rs2[21]} {rs2[22]} {rs2[23]} {rs2[24]} {rs2[25]} {rs2[26]} {rs2[27]} {rs2[28]} {rs2[29]} {rs2[30]} {rs2[31]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -pinWidth 0.16 -pinDepth 0.16 -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 1 -spreadType side -pin {{rs2[0]} {rs2[1]} {rs2[2]} {rs2[3]} {rs2[4]} {rs2[5]} {rs2[6]} {rs2[7]} {rs2[8]} {rs2[9]} {rs2[10]} {rs2[11]} {rs2[12]} {rs2[13]} {rs2[14]} {rs2[15]} {rs2[16]} {rs2[17]} {rs2[18]} {rs2[19]} {rs2[20]} {rs2[21]} {rs2[22]} {rs2[23]} {rs2[24]} {rs2[25]} {rs2[26]} {rs2[27]} {rs2[28]} {rs2[29]} {rs2[30]} {rs2[31]}}
setPinAssignMode -pinEditInBatch false
setSrouteMode -viaConnectToShape { noshape }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { METAL1(1) METAL8(8) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { METAL1(1) METAL8(8) } -nets { VDD VSS } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { METAL1(1) METAL8(8) }
setPlaceMode -fp false
place_design
selectInst U736
setAnalysisMode -cppr both -clockGatingCheck true -timeBorrowing true -useOutputPinCap true -sequentialConstProp false -timingSelfLoopsNoSkew false -enableMultipleDriveNet true -clkSrcPath true -warn true -usefulSkew false -analysisType single -log true
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -preCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix alu_preCTS -outDir timingReports
deselectAll
selectInst {rd_reg[3]}
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postCTS -pathReports -drvReports -slackReports -numPaths 50 -prefix alu_postCTS -outDir timingReports
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
addTieHiLo -cell {TIELO TIEHI} -prefix LTIE
getFillerMode -quiet
addFiller -cell FILL1 FILL2 FILL4 FILL8 FILL16 FILL32 FILL64 -prefix FILLER
setAnalysisMode -cppr both -clockGatingCheck true -timeBorrowing true -useOutputPinCap true -sequentialConstProp false -timingSelfLoopsNoSkew false -enableMultipleDriveNet true -clkSrcPath true -warn true -usefulSkew false -analysisType onChipVariation -log true
redirect -quiet {set honorDomain [getAnalysisMode -honorClockDomains]} > /dev/null
timeDesign -postRoute -pathReports -drvReports -slackReports -numPaths 50 -prefix alu_postRoute -outDir timingReports
getMultiCpuUsage -localCpu
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_implant -quiet
get_verify_drc_mode -check_implant_across_rows -quiet
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_implant true -check_implant_across_rows false -check_ndr_spacing false -check_only default -check_same_via_cell false -exclude_pg_net false -ignore_trial_route false -use_min_spacing_on_block_obs auto -report alu.drc.rpt -limit 1000
verify_drc
set_verify_drc_mode -area {0 0 0 0}
setVerifyGeometryMode -area { 0 0 0 0 } -minWidth true -minSpacing true -minArea true -sameNet true -short true -overlap true -offRGrid false -offMGrid true -mergedMGridCheck true -minHole true -implantCheck true -minimumCut true -minStep true -viaEnclosure true -antenna false -insuffMetalOverlap true -pinInBlkg false -diffCellViol true -sameCellViol false -padFillerCellsOverlap true -routingBlkgPinOverlap true -routingCellBlkgOverlap true -regRoutingOnly false -stackedViasOnRegNet false -wireExt true -useNonDefaultSpacing false -maxWidth true -maxNonPrefLength -1 -error 1000
verifyGeometry
setVerifyGeometryMode -area { 0 0 0 0 }
verifyConnectivity -type all -error 1000 -warning 50
reset_parasitics
extractRC
rcOut -spef alu.spef
streamOut alu.gds2 -libName DesignLib -structureName alu -merge { tsmc13.gds2 } -stripes 1 -outputMacros -units 2000 -mode ALL
