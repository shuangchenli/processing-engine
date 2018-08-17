###################################################################

# Created by write_sdc on Wed Aug 15 10:23:10 2018

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_wire_load_mode segmented
set_max_area 0
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports reset]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
io_control_internal_wEnable_0]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
io_control_internal_rEnable_0]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_wAddr_0[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_wAddr_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_wAddr_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_wAddr_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_wAddr_0[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_rAddr_0[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_rAddr_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_rAddr_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_rAddr_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_internal_rAddr_0[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
io_control_internal_bpSel_0_0]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
io_control_external_wEnable_0]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
io_control_external_rEnable_0]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_wAddr_0[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_wAddr_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_wAddr_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_wAddr_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_wAddr_0[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_rAddr_0[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_rAddr_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_rAddr_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_rAddr_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
{io_control_external_rAddr_0[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports                          \
io_control_external_bpSel_0_0]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[7]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[6]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[5]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wInternal_0[0]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[7]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[6]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[5]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[4]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[3]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[2]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[1]}]
set_driving_cell -lib_cell DFFPOSX1 -pin Q [get_ports {io_wExternal_0[0]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[7]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[6]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[5]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[4]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[3]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[2]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[1]}]
set_load -pin_load 0.00181554 [get_ports {io_rInternal_0[0]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[7]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[6]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[5]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[4]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[3]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[2]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[1]}]
set_load -pin_load 0.00181554 [get_ports {io_rExternal_0[0]}]
create_clock -name _sel4  -period 2  -waveform {0 1}
set_clock_uncertainty 0.1  [get_ports clock]
