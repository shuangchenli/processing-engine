###################################################################

# Created by write_sdc on Wed Aug 15 10:24:08 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_wire_load_mode segmented
set_max_area 0
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports reset]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports io_fSel_addEnable]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports io_fSel_accEnable]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_innerProd[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_innerProd[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_innerProd[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_innerProd[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpWeight[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpWeight[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpWeight[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpWeight[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpActvtn[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpActvtn[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpActvtn[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_ipu_bpActvtn[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_rf[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_rf[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_rf[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_rf[0]}]
set_load -pin_load 0.00181554 [get_ports {io_out[3]}]
set_load -pin_load 0.00181554 [get_ports {io_out[2]}]
set_load -pin_load 0.00181554 [get_ports {io_out[1]}]
set_load -pin_load 0.00181554 [get_ports {io_out[0]}]
create_clock -name _sel4  -period 2  -waveform {0 1}
set_clock_uncertainty 0.1  [get_ports clock]
