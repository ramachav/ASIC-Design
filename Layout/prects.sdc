#***************************************************
# Timing constraint file in PT format
#
# - Note: This is all case-sensitive
#***************************************************

#***************************************************
# Clock Constraints
#***************************************************
create_clock -name {HCLK} -period 20.0000000 -waveform { 0.0000000 10.0000000}\
   [list [get_ports {HCLK}]]


set_input_delay 1.0 -clock HCLK [all_inputs]
set_output_delay 1.0 -clock HCLK [all_outputs]
