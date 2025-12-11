---
title: "Chapter 1 — Python Baseline Model"
layout: default
nav_order: 1
description: "AITL Silicon Pathway Chapter 1: Python baseline implementation of PID × FSM × LLM hybrid control architecture"
---

# 🧩 Chapter 1 — Python Baseline Model  
## *AITL Architecture: PID × FSM × LLM*

This chapter introduces the foundational Python model of the AITL control architecture.  
It establishes the software reference that will later be translated into Verilog (Chapter 2), synthesized into ASIC form (Chapter 3), extracted into SPICE (Chapter 4), and simulated with physical RC parasitics (Chapter 5).

---

# 🎯 Objectives

By the end of Chapter 1, you will:

- Understand the three-layer AITL control architecture:
  - **PID layer** → Real-time continuous control  
  - **FSM layer** → Mode management and fault handling  
  - **LLM layer** → Adaptive logic & re-design (placeholder in Ch.1)
- Implement a **fully executed Python baseline model**
- Run simulations:
  - Step response  
  - Fault scenario (error injection)
- Produce plots and learn how controller behavior changes with state transitions
- Prepare the **precise FSM behavior definition** required for Chapter 2 (RTL conversion)

---

# 🧱 AITL Three-Layer Architecture Overview

## 1️⃣ PID Layer — Real-Time Continuous Control

- Runs at fixed dt  
- Receives setpoint and plant measurement  
- Outputs control signal  
- Isolated from mode transitions (FSM decides whether PID runs)

## 2️⃣ FSM Layer — Supervisory Mode Logic

Defines four states:

| State | Description |
|-------|-------------|
| **IDLE** | System inactive; waiting for start command |
| **STARTUP** | Controlled ramp-up / initialization |
| **RUN** | Normal operation, PID active |
| **FAULT** | Error detected; PID disabled |

FSM is the critical component for RTL conversion in Chapter 2.

## 3️⃣ LLM Layer — Adaptive Intelligence (Placeholder)

In this chapter, LLM is only a placeholder.  
Later chapters may introduce:

- Runtime tuning  
- Fault reasoning  
- PID re-identification  
- FSM rule updates  

---

# 📂 Directory Structure of the Python Model

```
chapter1_python_model/
├── src/
│   ├── pid.py
│   ├── fsm.py
│   ├── aitl_controller.py
│   └── llm_placeholder.py
├── sim/
│   ├── run_step_response.py
│   └── run_fault_scenario.py
├── plots/
├── tests/
├── main.py
└── requirements.txt
```

---

# ▶️ Running the Model

## Install dependencies:

```bash
pip install -r requirements.txt
```

## Step response:

```bash
python sim/run_step_response.py
```

## Fault scenario:

```bash
python sim/run_fault_scenario.py
```

Plots will be saved into:

```
plots/
```

---

# 🔗 Relationship to the AITL Silicon Pathway

This chapter defines the **behavior that must be preserved across all downstream flows**:

Python → Verilog RTL → OpenLane P&R → GDSII → Magic RC Extraction → SPICE

Every behavior specified here —  
**state transitions, fault handling rules, PID timing** —  
must remain functionally equivalent after hardware implementation.

This ensures that:

- RTL behaves the same as Python  
- ASIC behaves the same as RTL  
- SPICE waveforms match expectations  

This is the cornerstone of correct hardware design.

---

# 📘 Related Files

| File | Description |
|------|-------------|
| `overview.md` | Conceptual explanation of Chapter 1 |
| `python_model.md` | Full code-level explanation |
| `fsm.md` | Canonical FSM rules (for RTL conversion) |
| `api.md` | API reference of PID / FSM / Controller |
| `getting_started.md` | Setup, environment, and usage guide |

---

# ✅ Next Steps

Proceed to:

👉 **`overview.md`** — A deeper conceptual description of the architecture  
👉 **`fsm.md`** — Official state transition specification (used in Chapter 2 RTL)

---

# © AITL Silicon Pathway Project

