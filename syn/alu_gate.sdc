###################################################################

# Created by write_sdc on Fri May 10 15:48:53 2019

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_operating_conditions slow -library slow
set_max_fanout 6 [current_design]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[31]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[30]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[29]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[28]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[27]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[26]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[25]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[24]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[23]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[22]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[21]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[20]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[19]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[18]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[17]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[16]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[15]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[14]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[13]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[12]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[11]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[10]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[9]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[8]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[7]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[6]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[5]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[4]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[3]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[2]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[1]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs1[0]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[31]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[30]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[29]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[28]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[27]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[26]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[25]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[24]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[23]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[22]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[21]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[20]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[19]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[18]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[17]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[16]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[15]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[14]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[13]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[12]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[11]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[10]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[9]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[8]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[7]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[6]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[5]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[4]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[3]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[2]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[1]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {rs2[0]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {op[3]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {op[2]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {op[1]}]
set_driving_cell -lib_cell INVXL -pin Y [get_ports {op[0]}]
set_driving_cell -min -lib_cell INVXL -pin Y [get_ports reset]
set_load -pin_load 0.03738 [get_ports {rd[31]}]
set_load -pin_load 0.03738 [get_ports {rd[30]}]
set_load -pin_load 0.03738 [get_ports {rd[29]}]
set_load -pin_load 0.03738 [get_ports {rd[28]}]
set_load -pin_load 0.03738 [get_ports {rd[27]}]
set_load -pin_load 0.03738 [get_ports {rd[26]}]
set_load -pin_load 0.03738 [get_ports {rd[25]}]
set_load -pin_load 0.03738 [get_ports {rd[24]}]
set_load -pin_load 0.03738 [get_ports {rd[23]}]
set_load -pin_load 0.03738 [get_ports {rd[22]}]
set_load -pin_load 0.03738 [get_ports {rd[21]}]
set_load -pin_load 0.03738 [get_ports {rd[20]}]
set_load -pin_load 0.03738 [get_ports {rd[19]}]
set_load -pin_load 0.03738 [get_ports {rd[18]}]
set_load -pin_load 0.03738 [get_ports {rd[17]}]
set_load -pin_load 0.03738 [get_ports {rd[16]}]
set_load -pin_load 0.03738 [get_ports {rd[15]}]
set_load -pin_load 0.03738 [get_ports {rd[14]}]
set_load -pin_load 0.03738 [get_ports {rd[13]}]
set_load -pin_load 0.03738 [get_ports {rd[12]}]
set_load -pin_load 0.03738 [get_ports {rd[11]}]
set_load -pin_load 0.03738 [get_ports {rd[10]}]
set_load -pin_load 0.03738 [get_ports {rd[9]}]
set_load -pin_load 0.03738 [get_ports {rd[8]}]
set_load -pin_load 0.03738 [get_ports {rd[7]}]
set_load -pin_load 0.03738 [get_ports {rd[6]}]
set_load -pin_load 0.03738 [get_ports {rd[5]}]
set_load -pin_load 0.03738 [get_ports {rd[4]}]
set_load -pin_load 0.03738 [get_ports {rd[3]}]
set_load -pin_load 0.03738 [get_ports {rd[2]}]
set_load -pin_load 0.03738 [get_ports {rd[1]}]
set_load -pin_load 0.03738 [get_ports {rd[0]}]
set_max_capacitance 0.01246 [get_ports {rs1[31]}]
set_max_capacitance 0.01246 [get_ports {rs1[30]}]
set_max_capacitance 0.01246 [get_ports {rs1[29]}]
set_max_capacitance 0.01246 [get_ports {rs1[28]}]
set_max_capacitance 0.01246 [get_ports {rs1[27]}]
set_max_capacitance 0.01246 [get_ports {rs1[26]}]
set_max_capacitance 0.01246 [get_ports {rs1[25]}]
set_max_capacitance 0.01246 [get_ports {rs1[24]}]
set_max_capacitance 0.01246 [get_ports {rs1[23]}]
set_max_capacitance 0.01246 [get_ports {rs1[22]}]
set_max_capacitance 0.01246 [get_ports {rs1[21]}]
set_max_capacitance 0.01246 [get_ports {rs1[20]}]
set_max_capacitance 0.01246 [get_ports {rs1[19]}]
set_max_capacitance 0.01246 [get_ports {rs1[18]}]
set_max_capacitance 0.01246 [get_ports {rs1[17]}]
set_max_capacitance 0.01246 [get_ports {rs1[16]}]
set_max_capacitance 0.01246 [get_ports {rs1[15]}]
set_max_capacitance 0.01246 [get_ports {rs1[14]}]
set_max_capacitance 0.01246 [get_ports {rs1[13]}]
set_max_capacitance 0.01246 [get_ports {rs1[12]}]
set_max_capacitance 0.01246 [get_ports {rs1[11]}]
set_max_capacitance 0.01246 [get_ports {rs1[10]}]
set_max_capacitance 0.01246 [get_ports {rs1[9]}]
set_max_capacitance 0.01246 [get_ports {rs1[8]}]
set_max_capacitance 0.01246 [get_ports {rs1[7]}]
set_max_capacitance 0.01246 [get_ports {rs1[6]}]
set_max_capacitance 0.01246 [get_ports {rs1[5]}]
set_max_capacitance 0.01246 [get_ports {rs1[4]}]
set_max_capacitance 0.01246 [get_ports {rs1[3]}]
set_max_capacitance 0.01246 [get_ports {rs1[2]}]
set_max_capacitance 0.01246 [get_ports {rs1[1]}]
set_max_capacitance 0.01246 [get_ports {rs1[0]}]
set_max_capacitance 0.01246 [get_ports {rs2[31]}]
set_max_capacitance 0.01246 [get_ports {rs2[30]}]
set_max_capacitance 0.01246 [get_ports {rs2[29]}]
set_max_capacitance 0.01246 [get_ports {rs2[28]}]
set_max_capacitance 0.01246 [get_ports {rs2[27]}]
set_max_capacitance 0.01246 [get_ports {rs2[26]}]
set_max_capacitance 0.01246 [get_ports {rs2[25]}]
set_max_capacitance 0.01246 [get_ports {rs2[24]}]
set_max_capacitance 0.01246 [get_ports {rs2[23]}]
set_max_capacitance 0.01246 [get_ports {rs2[22]}]
set_max_capacitance 0.01246 [get_ports {rs2[21]}]
set_max_capacitance 0.01246 [get_ports {rs2[20]}]
set_max_capacitance 0.01246 [get_ports {rs2[19]}]
set_max_capacitance 0.01246 [get_ports {rs2[18]}]
set_max_capacitance 0.01246 [get_ports {rs2[17]}]
set_max_capacitance 0.01246 [get_ports {rs2[16]}]
set_max_capacitance 0.01246 [get_ports {rs2[15]}]
set_max_capacitance 0.01246 [get_ports {rs2[14]}]
set_max_capacitance 0.01246 [get_ports {rs2[13]}]
set_max_capacitance 0.01246 [get_ports {rs2[12]}]
set_max_capacitance 0.01246 [get_ports {rs2[11]}]
set_max_capacitance 0.01246 [get_ports {rs2[10]}]
set_max_capacitance 0.01246 [get_ports {rs2[9]}]
set_max_capacitance 0.01246 [get_ports {rs2[8]}]
set_max_capacitance 0.01246 [get_ports {rs2[7]}]
set_max_capacitance 0.01246 [get_ports {rs2[6]}]
set_max_capacitance 0.01246 [get_ports {rs2[5]}]
set_max_capacitance 0.01246 [get_ports {rs2[4]}]
set_max_capacitance 0.01246 [get_ports {rs2[3]}]
set_max_capacitance 0.01246 [get_ports {rs2[2]}]
set_max_capacitance 0.01246 [get_ports {rs2[1]}]
set_max_capacitance 0.01246 [get_ports {rs2[0]}]
set_max_capacitance 0.01246 [get_ports {op[3]}]
set_max_capacitance 0.01246 [get_ports {op[2]}]
set_max_capacitance 0.01246 [get_ports {op[1]}]
set_max_capacitance 0.01246 [get_ports {op[0]}]
set_max_capacitance 0.01246 [get_ports reset]
create_clock [get_ports clk]  -period 20  -waveform {0 10}
set_clock_uncertainty 0.3  [get_clocks clk]
set_input_delay -clock clk  -max 1  [get_ports {rs1[31]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[30]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[29]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[28]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[27]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[26]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[25]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[24]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[23]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[22]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[21]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[20]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[19]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[18]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[17]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[16]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[15]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[14]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[13]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[12]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[11]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[10]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[9]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[8]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[7]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[6]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[5]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[4]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[3]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[2]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[1]}]
set_input_delay -clock clk  -max 1  [get_ports {rs1[0]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[31]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[30]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[29]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[28]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[27]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[26]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[25]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[24]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[23]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[22]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[21]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[20]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[19]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[18]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[17]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[16]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[15]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[14]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[13]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[12]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[11]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[10]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[9]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[8]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[7]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[6]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[5]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[4]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[3]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[2]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[1]}]
set_input_delay -clock clk  -max 1  [get_ports {rs2[0]}]
set_input_delay -clock clk  -max 1  [get_ports {op[3]}]
set_input_delay -clock clk  -max 1  [get_ports {op[2]}]
set_input_delay -clock clk  -max 1  [get_ports {op[1]}]
set_input_delay -clock clk  -max 1  [get_ports {op[0]}]
set_input_delay -clock clk  -max 1  [get_ports reset]
set_output_delay -clock clk  -max 1  [get_ports {rd[31]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[30]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[29]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[28]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[27]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[26]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[25]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[24]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[23]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[22]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[21]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[20]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[19]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[18]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[17]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[16]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[15]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[14]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[13]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[12]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[11]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[10]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[9]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[8]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[7]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[6]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[5]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[4]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[3]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[2]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[1]}]
set_output_delay -clock clk  -max 1  [get_ports {rd[0]}]
