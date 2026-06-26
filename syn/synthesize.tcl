# -------------------------------------------------------------------------
# Synthesis TCL Script Template (Yosys Open Synthesis Suite)
# -------------------------------------------------------------------------

# Read Verilog RTL source files
read_verilog ../rtl/uart.v
read_verilog ../rtl/apb_uart_bridge.v
read_verilog ../rtl/apb_uart_top.v

# Set top-level module
hierarchy -check -top apb_uart_top

# High-level synthesis optimizations
procs; opt; fsm; opt; memory; opt

# Technology mapping to generic gate library
techmap; opt

# Write synthesized gate-level netlist
write_verilog gate_level_netlist.v

# Print statistics report
stat
