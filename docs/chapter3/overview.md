---
layout: default
title: "Overview"
parent: "Chapter 3"
---

# Overview — Why Simulation + Synthesis Matters

## Philosophy
Simulation alone proves behavior.
Synthesis alone proves structure.

Only **both together** prove that RTL can exist as real hardware.

## Chapter 3 Flow
1. Simulate FSM RTL with a minimal testbench
2. Check behavior against the formal FSM spec
3. Run OpenLane synthesis to validate ASIC feasibility
4. Interpret warnings and reports as design feedback

## Outcome
After this chapter, you can confidently say:

> “This FSM RTL can be implemented in silicon.”
