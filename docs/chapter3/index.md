---
layout: default
title: "Chapter 3: FSM RTL → Simulation → OpenLane / ASIC Flow"
nav_order: 3
parent: "AITL Silicon Pathway"
---

# Chapter 3  
## FSM RTL → Simulation → OpenLane / ASIC Flow

This chapter verifies that the FSM RTL designed in Chapter 2 is **hardware-realistic**.

---

## 🔗 Official Links

| Language | GitHub Pages 🌐 | GitHub 💻 |
|----------|----------------|-----------|
| 🇺🇸 English | [![GitHub Pages EN](https://img.shields.io/badge/GitHub%20Pages-English-brightgreen?logo=github)](https://samizo-aitl.github.io/aitl-silicon-pathway/docs/chapter3/) | [![GitHub Repo EN](https://img.shields.io/badge/GitHub-English-blue?logo=github)](https://github.com/Samizo-AITL/aitl-silicon-pathway/tree/main/docs/chapter3) |

---

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
