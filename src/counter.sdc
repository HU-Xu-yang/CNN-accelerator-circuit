###################################################################

# Created by write_sdc on Sun Nov 28 18:41:17 2021

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
create_clock [get_ports clk]  -name CK  -period 10  -waveform {0 5}
