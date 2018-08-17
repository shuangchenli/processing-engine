###################################################################

# Created by write_sdc on Wed Aug 15 10:20:29 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_wire_load_mode segmented
set_max_area 0
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports reset]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_weightIn_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_weightIn_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_weightIn_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_weightIn_0[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_actvtnIn_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_actvtnIn_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_actvtnIn_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_actvtnIn_0[0]}]
set_load -pin_load 0.00181554 [get_ports {io_out_innerProd[3]}]
set_load -pin_load 0.00181554 [get_ports {io_out_innerProd[2]}]
set_load -pin_load 0.00181554 [get_ports {io_out_innerProd[1]}]
set_load -pin_load 0.00181554 [get_ports {io_out_innerProd[0]}]
create_clock -name _sel4  -period 2  -waveform {0 1}
set_clock_uncertainty 0.1  [get_ports clock]
