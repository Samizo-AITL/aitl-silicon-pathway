---
title: "Chapter 1 Overview — AITL Control Architecture"
layout: default
nav_order: 2
description: "Conceptual overview of the AITL three-layer hybrid control architecture: PID × FSM × LLM"
---

# 🧭 Chapter 1 Overview  
## *Conceptual Foundation of the AITL Hybrid Control Architecture*

This document provides a high-level overview of the AITL control architecture implemented in Chapter 1.  
It explains **why the system is designed as a three-layer structure**, how each layer interacts, and how this Python model aligns with the broader *AITL Silicon Pathway* (Python → Verilog → OpenLane → SPICE).

Chapter 1 establishes the **behavioral reference model**, which all downstream hardware implementations must replicate.

---

# 🎯 Purpose of This Chapter

The objectives of this chapter are:

- To define the supervisory structure of the AITL architecture  
- To establish **canonical behavior** for PID, FSM, and LLM layers  
- To create a Python baseline model that becomes the **ground truth** for RTL conversion  
- To provide simulation tools (step response, fault handling) for verifying correctness  
- To prepare a clean, deterministic specification for hardware design

This chapter does **not** optimize control performance or add real intelligence to the LLM layer—its purpose is to define **stable, portable behavior**.

---

# 🧱 The Three-Layer AITL Architecture

The AITL architecture combines:

1. **PID Layer** — continuous control  
2. **FSM Layer** — discrete supervisory logic  
3. **LLM Layer** — adaptive intelligence (future expansion)

Together they provide a hybrid system capable of robust real-time control and high-level reasoning.

---

## 1️⃣ PID Layer — Real-Time Continuous Control

The PID controller generates the control output:

- Based on setpoint and measurement  
- With proportional, integral, and derivative contributions  
- At fixed discrete time steps (`dt`)  

**Key properties defined in Chapter 1:**

- The PID operates **only** in `STARTUP` and `RUN` states  
- Its internal integral and derivative memory must persist across steps  
- Reset behavior is managed by FSM transitions  
- The control output becomes zero in `IDLE` and `FAULT` states  

These behaviors must be preserved exactly during RTL conversion.

---

## 2️⃣ FSM Layer — Supervisory Discrete Logic

The FSM defines discrete operational modes:

| State | Purpose |
|-------|---------|
| **IDLE** | Base state; system inactive; PID disabled |
| **STARTUP** | Initialization phase; ramp-up; transitions to RUN only when conditions met |
| **RUN** | Normal control operation; PID active |
| **FAULT** | Error detected; system halts until reset |

### Key State Transition Rules

- `IDLE → STARTUP` when `start_cmd = True`
- `STARTUP → RUN` when `startup_done = True`
- `STARTUP → FAULT` when `error_detected = True`
- `RUN → FAULT` when `error_detected = True`
- `FAULT → IDLE` when `reset_cmd = True`

These rules form the **canonical transition table**, to be reproduced bit-for-bit in Verilog.

FSM also dictates **when PID is allowed to run**—this distinction ensures RTL has clean enable/disable logic.

---

## 3️⃣ LLM Layer — Adaptive Behavior (Placeholder)

In Chapter 1, the LLM layer is a **stub** with no functional intelligence.  
Its purpose is:

- To define a clean interface for future upgrades  
- To model how an external reasoning agent could adjust controller parameters  
- To remain inactive during baseline validation  

This guarantees deterministic behavior for Chapters 2–5.

---

# 🔗 Interaction Between PID, FSM, and LLM Layers

```
 +-------------+     commands      +-----------------+
 |   External  | ----------------> |      FSM        |
 |   System    | <---------------- |  (Supervisory)  |
 +-------------+   state feedback  +-----------------+
                                        |
                                        | enables/disables
                                        v
                                +-----------------+
                                |      PID        |
                                | (Real-time ctl) |
                                +-----------------+
                                        |
                                        | optional tuning
                                        v
                                +-----------------+
                                |      LLM        |
                                |   (Adaptive)    |
                                +-----------------+
```

### Summary of interactions:

- **FSM** decides *when* PID runs  
- **PID** produces the control signal  
- **LLM** may adjust PID parameters (future)  
- All transitions and timing are explicitly defined  

This clarity is essential for ASIC translation.

---

# 🧪 Simulation Scenarios

Two simulation scenarios are provided for validating correctness:

---

## 📈 1. Step Response Simulation

Tests:

- PID behavior  
- Stability  
- Smooth rise to target  
- Controller enable logic  

This scenario verifies the system’s **basic dynamics**.

---

## ⚠️ 2. Fault Scenario Simulation

Tests:

- FSM transitions  
- Error handling  
- PID shutdown behavior  
- Persistent FAULT state until reset  

This verifies the **supervisory logic** that will be implemented in RTL.

---

# 🏗 Role of Chapter 1 in the AITL Silicon Pathway

Chapter 1 is the **behavioral contract** for everything downstream:

| Stage | Requirement |
|-------|------------|
| **Chapter 2 — Verilog RTL** | Must reproduce PID output, internal states, and all FSM transitions by specification |
| **Chapter 3 — OpenLane** | Physical design must preserve FSM/PID timing behavior |
| **Chapter 4 — Magic** | Extracted RC parasitics must not change logical equivalence |
| **Chapter 5 — SPICE** | Waveforms must match Python baseline characteristics |

If Chapter 1 is wrong or ambiguous, **all downstream hardware would be wrong**.

Thus, correctness here is critical.

---

# 📦 Deliverables of Chapter 1

This chapter produces:

- Fully operational Python controller model  
- Deterministic FSM definition  
- Clean directory structure for hardware flow  
- Repeatable simulation results  
- Documentation for developers and hardware engineers  

Together, these serve as the **official baseline specification**.

---

# 🚀 Next

Continue to:

👉 **python_model.md** — Code-level explanation of the Python implementation  
👉 **fsm.md** — Formal state transition rules and canonical table (RTL input)

---

# © AITL Silicon Pathway Project

