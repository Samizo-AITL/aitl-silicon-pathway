---
layout: default
title: "Chapter 3: FSM RTL → Simulation → OpenLane / ASIC Flow"
nav_order: 3
parent: "AITL Silicon Pathway"
---

# Chapter 3  
## FSM RTL → Simulation → OpenLane / ASIC Flow

This chapter verifies that the FSM RTL designed in Chapter 2 is **hardware-realistic**.

### Goals
- Verify FSM RTL behavior by simulation
- Confirm synthesizability via OpenLane (concept level)
- Learn how to read ASIC-flow warnings and reports

### Non-goals
- Full SoC integration
- UVM / formal verification
- Timing or PPA optimization
- Detailed physical layout

### Structure
- `overview.md` — philosophy and verification flow
- `simulation.md` — minimal simulation setup
- `openlane.md` — concept-level OpenLane flow
- `asic_checkpoints.md` — ASIC-oriented RTL checks
- `code/` — **educational minimal examples**

> The code in this chapter is **instructional**, not production IP.
