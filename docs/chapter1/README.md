---
title: "Chapter 1 README"
layout: default
nav_order: 0
description: "Introduction and navigation for AITL Silicon Pathway Chapter 1 documentation."
---

# 📘 Chapter 1 — Python Baseline Model  
## *README / Introduction*

Welcome to **Chapter 1** of the *AITL Silicon Pathway* project.  
This chapter defines the **software baseline model** of the AITL hybrid control architecture:

- **PID** — Real-time continuous controller  
- **FSM** — Supervisory mode and fault logic  
- **LLM** — Adaptive intelligence (placeholder in this chapter)

The Python implementation created here acts as the **behavioral golden model** for all downstream chapters:

```
Python → Verilog RTL → OpenLane P&R → Magic Extraction → SPICE
```

Everything implemented in Chapter 1 must be faithfully replicated in hardware.

---

# 📂 Documents Included in Chapter 1

| File | Description |
|------|-------------|
| `index.md` | Entry page for Chapter 1 |
| `overview.md` | Conceptual overview of the AITL architecture |
| `python_model.md` | Detailed breakdown of PID/FSM/Controller implementation |
| `fsm.md` | Canonical supervisory state machine specification |
| `api.md` | Documentation for all public-facing classes and APIs |
| `getting_started.md` | How to install, run, and simulate the Python baseline |

---

# 🧱 Purpose of Chapter 1

The goals of this chapter:

- Establish a **deterministic, well-defined control model**
- Provide a **canonical specification** for the supervisory FSM
- Create simulation tools for:
  - step response  
  - fault behavior  
- Produce artifacts necessary for RTL design (Chapter 2)
- Form the **reference behavior** that all hardware must match

This ensures end-to-end correctness from software to silicon.

---

# 🧩 AITL Architecture Summary

**Three-layer model:**

1. **PID Layer**  
   - Real-time continuous control  
   - Executes only in STARTUP/RUN  
   - Disabled in IDLE/FAULT

2. **FSM Layer**  
   - Supervisory logic  
   - Exact transitions:  
     ```
     IDLE → STARTUP → RUN → FAULT → IDLE
     ```

3. **LLM Layer**  
   - Adaptive tuning (stub in this chapter)

---

# 🛠 Python Model Directory Structure

The Python reference implementation (outside docs/) follows:

```
chapter1_python_model/
├── src/
│   ├── pid.py
│   ├── fsm.py
│   ├── aitl_controller.py
│   └── llm_placeholder.py
├── sim/
├── plots/
├── tests/
├── main.py
└── requirements.txt
```

---

# ▶️ Running Simulations

To run step response:

```bash
python sim/run_step_response.py
```

To run fault scenario:

```bash
python sim/run_fault_scenario.py
```

Plots will appear under:

```
plots/
```

---

# 🔗 Relationship to Later Chapters

| Chapter | Output |
|---------|--------|
| **Chapter 1** | Python behavioral golden model |
| **Chapter 2** | FSM → Verilog RTL |
| **Chapter 3** | ASIC physical design (OpenLane) |
| **Chapter 4** | Parasitic extraction (Magic) |
| **Chapter 5** | SPICE timing & waveform analysis |

If Chapter 1 is incorrect or incomplete, **hardware will not match specification**.  
Therefore this chapter has the strictest correctness requirement.

---

# 📜 License

This documentation is part of the AITL Silicon Pathway project.  
See the main repository license page for details.

---

# © AITL Silicon Pathway Project

