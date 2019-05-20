#------------------------------------------------------------------
#-  YANG  -  VLSI Design Lab  -  HKUEEE  -                        -
#------------------------------------------------------------------
# adder.tcl
######################################################################
set DESIGN    "alu"
set PATH      [pwd]
set RTLDIR    "$PATH/../rtl"
set SYNDIR    "$PATH/../syn"
set LIBDIR    "/vhome/cad/tech/Artisan.TSMC.130/aci/sc-x/synopsys"
set FILE_LIST $RTLDIR/${DESIGN}.v
set RPT       "$SYNDIR/${DESIGN}_gate.rpt"
######################################################################
set DELAY     "slow" 
#set IOLIB     "SP018W_V1p4_max.db"
#set WIRELOAD  "smic18_wl30"
set OPCOND    "slow"
set MAXFANOUT 6
######################################################################
set target_library  "$DELAY.db"
set link_library    "* $DELAY.db"
lappend search_path ${LIBDIR} $RTLDIR
######################################################################
#reset_design
read_file -format verilog $FILE_LIST
current_design $DESIGN
######################################################################
# design environment
# use both worst and best timing libraries for analysis
set_min_library $DELAY.db -min_version fast.db
#set_wire_load_model -name $WIRELOAD
set_operating_conditions $OPCOND
#set_max_area 100
######################################################################
# design constraints  
source -v $SYNDIR/${DESIGN}.con
set_max_fanout $MAXFANOUT $DESIGN
######################################################################
#link
check_design
check_timing
compile -map_effort high -ungroup_all
uniquify
######################################################################
write -f verilog -hier -o $SYNDIR/${DESIGN}_gate.v
write_sdc $SYNDIR/${DESIGN}_gate.sdc
write_sdf $SYNDIR/${DESIGN}_gate.sdf
######################################################################
report_design > $RPT
report_clock >> $RPT
#report_wire_load >> $RPT
report_cell >> $RPT
#report_port -v >> $RPT
#report_net >> $RPT
report_constraint -all_violators >> $RPT
#report_constraint -all_violators -verbose >> $RPT
report_timing -max_paths 5 -input_pins >> $RPT
#report_timing -delay min >> $RPT
#report_timing_requirements >> $RPT
report_area >> $RPT
report_power >> $RPT
exit
#------------------------------------------------------------------
#-  YANG  -  VLSI Design Lab  -  HKUEEE  -                        -
#------------------------------------------------------------------
