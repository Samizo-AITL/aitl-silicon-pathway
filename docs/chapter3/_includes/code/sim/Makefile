# docs/chapter3/code/sim/Makefile
# Minimal Icarus Verilog simulation flow (concept).
# Requires: iverilog, vvp

SHELL := /bin/bash

RTL_DIR := ../rtl
TB_DIR  := ../tb
BUILD   := build

RTL_SRCS := $(RTL_DIR)/fsm_rtl.sv
TB_SRCS  := $(TB_DIR)/tb_fsm_min.sv

OUT := $(BUILD)/tb.out
VCD := $(BUILD)/wave.vcd

.PHONY: all clean run wave

all: run

$(BUILD):
	mkdir -p $(BUILD)

# Build simulation executable
$(OUT): $(RTL_SRCS) $(TB_SRCS) | $(BUILD)
	iverilog -g2012 -o $(OUT) $(RTL_SRCS) $(TB_SRCS)

run: $(OUT)
	@echo "== Running simulation =="
	vvp $(OUT)

wave: run
	@echo "Generated: $(VCD)"
	@echo "Open with a waveform viewer (e.g., GTKWave)."

clean:
	rm -rf $(BUILD)
