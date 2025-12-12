---
title: "Chapter2: FSM to Verilog RTL"
layout: default
parent: "AITL Silicon Pathway"
nav_order: 2
permalink: /chapter2/index/
---

# Chapter2: FSM → Verilog RTL  
## Index

Welcome to **Chapter2 of the AITL Silicon Pathway**.

This chapter focuses on translating a **Python-defined Finite State Machine (FSM)**
into a **formal hardware specification** and a **synthesizable Verilog RTL implementation**.
The FSM corresponds to the **middle control layer** in the PID × FSM × LLM architecture.

---

## Purpose of This Chapter

The objectives of Chapter2 are to:

- Remove ambiguity from software-based FSM descriptions
- Define FSM behavior using **formal, hardware-oriented artifacts**
- Establish a **clear mapping** from Python FSM logic to Verilog RTL
- Produce RTL that is suitable for **ASIC synthesis (OpenLane)**

By the end of this chapter, the FSM is fully defined as a **hardware block**,
ready for simulation, synthesis, and integration.

---

## Document Map

The following documents make up Chapter2.
They are intended to be read in order.

### 1. Overview
- **overview.md**  
  Explains the motivation, scope, and design philosophy of Chapter2.

### 2. Formal Specification
- **fsm_spec.md**  
  Defines states, transitions, inputs, and outputs using state tables
  and transition tables.

### 3. Mapping Rules
- **mapping_rules.md**  
  Describes how Python FSM constructs are translated into Verilog RTL,
  including state encoding and transition logic rules.

### 4. RTL Implementation
- **verilog_rtl.md**  
  Presents the FSM RTL, starting from a skeleton and progressing
  to a complete, synthesizable implementation.

### 5. RTL Guidelines
- **rtl_guidelines.md**  
  Lists ASIC- and OpenLane-oriented RTL coding rules to ensure
  robust synthesis and predictable behavior.

---

## Position in the AITL Pathway

```
Chapter1: FSM Design (Python)
        ↓
Chapter2: FSM Specification → Verilog RTL   ← You are here
        ↓
Chapter3: RTL Simulation & ASIC Flow
```

Chapter2 acts as the **formal boundary** between software modeling
and hardware realization.

---

## What Is Intentionally Excluded

This chapter does **not** cover:

- Testbench development
- RTL simulation setup
- OpenLane execution steps
- Tool usage (VSCode, editors, etc.)
- SoC-level integration

These topics are addressed in **Chapter3 and later**.

---

## How to Use This Chapter

- Use this chapter as a **reference** when converting FSMs to RTL
- Treat `fsm_spec.md` as the **single source of truth**
- Follow `mapping_rules.md` strictly when writing RTL
- Apply `rtl_guidelines.md` to avoid synthesis issues

---

## Next Step

Proceed to **overview.md** to begin Chapter2.

---
