# Simulator to use
SIM ?= icarus
# Language of the top-level design
TOPLEVEL_LANG ?= verilog

# THE FIX: Point back to your original RTL file
VERILOG_SOURCES += $(PWD)/adder_netlist.v 

# Define power pins and functional mode for library models
COMPILE_ARGS += -Dfunctional -DUSE_POWER_PINS -DUNIT_DELAY=#1

# Help Icarus resolve the initial X state

VERILOG_SOURCES += /home/gou/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/verilog/primitives.v
VERILOG_SOURCES += /home/gou/.ciel/ciel/sky130/versions/0fe599b2afb6708d281543108caf8310912f54af/sky130A/libs.ref/sky130_fd_sc_hd/verilog/sky130_fd_sc_hd.v
# Top-level module name
TOPLEVEL = adder

# Python test file name
MODULE = test_adder

# Include the Cocotb infrastructure
include $(shell cocotb-config --makefiles)/Makefile.sim