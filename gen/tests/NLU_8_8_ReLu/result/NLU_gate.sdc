###################################################################

# Created by write_sdc on Wed Aug 15 10:21:25 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_wire_load_mode segmented
set_max_area 0
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports reset]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports io_fSel_reluEnable]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[7]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[6]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[5]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_in[0]}]
set_load -pin_load 0.00181554 [get_ports {io_out[7]}]
set_load -pin_load 0.00181554 [get_ports {io_out[6]}]
set_load -pin_load 0.00181554 [get_ports {io_out[5]}]
set_load -pin_load 0.00181554 [get_ports {io_out[4]}]
set_load -pin_load 0.00181554 [get_ports {io_out[3]}]
set_load -pin_load 0.00181554 [get_ports {io_out[2]}]
set_load -pin_load 0.00181554 [get_ports {io_out[1]}]
set_load -pin_load 0.00181554 [get_ports {io_out[0]}]
create_clock -name _sel4  -period 2  -waveform {0 1}
set_clock_uncertainty 0.1  [get_ports clock]
