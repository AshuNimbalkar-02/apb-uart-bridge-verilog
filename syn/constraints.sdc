# -------------------------------------------------------------------------
# Synopsys Design Constraints (SDC) for APB-UART IP
# Target: 50 MHz System Clock (20 ns Period)
# -------------------------------------------------------------------------

# Define the clock constraints
create_clock -name clk -period 20.0 [get_ports clk]

# Model realistic clock uncertainty and jitter
set_clock_uncertainty 0.2 [get_clocks clk]

# Constrain input delays (assuming 40% of cycle time for setup time budget)
set_input_delay -clock clk -max 8.0 [get_ports {PADDR[*] PWDATA[*] PWRITE PSEL PENABLE}]
set_input_delay -clock clk -min 1.0 [get_ports {PADDR[*] PWDATA[*] PWRITE PSEL PENABLE}]

# Constrain output delays (assuming 30% of cycle time for output path)
set_output_delay -clock clk -max 6.0 [get_ports {PRDATA[*] PREADY}]
set_output_delay -clock clk -min 1.0 [get_ports {PRDATA[*] PREADY}]

# Model external load capacitance
set_load 0.05 [all_outputs]
