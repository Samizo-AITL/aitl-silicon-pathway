# Chapter 1 — Python Baseline Model (AITL Architecture)

This directory contains the full Python reference implementation of the **AITL 3-Layer Control Architecture**:

**PID Layer → FSM Layer → LLM Layer**

This serves as the *behavioral golden model* for all downstream hardware design steps  
(RTL → OpenLane → GDSII → SPICE).

---

## 🔗 Official Links

| Language | GitHub Pages 🌐 | GitHub 💻 |
|----------|----------------|-----------|
| 🇺🇸 English | [![GitHub Pages EN](https://img.shields.io/badge/GitHub%20Pages-English-brightgreen?logo=github)](https://samizo-aitl.github.io/aitl-silicon-pathway/chapter1_python_model/) | [![GitHub Repo EN](https://img.shields.io/badge/GitHub-English-blue?logo=github)](https://github.com/Samizo-AITL/aitl-silicon-pathway/tree/main/chapter1_python_model) |

---

# 📂 Directory Structure

```
chapter1_python_model/
├─ example/                # Interactive notebooks (Jupyter)
├─ plots/                  # Output plots from simulations
├─ sim/                    # Simulation scripts (step/fault)
├─ src/                    # Python implementation (PID, FSM, Controller)
├─ tests/                  # Unit tests for PID / FSM / Controller
├─ venv/                   # Optional local virtual environment
├─ main.py                 # Entry point example
└─ requirements.txt        # Dependencies
```

---

# 🚀 How to Run

## 1️⃣ Setup (recommended)

```bash
pip install -r requirements.txt
```

## 2️⃣ Run baseline model

```bash
python main.py
```

This executes:

- FSM initialization  
- PID response  
- Text-based control loop output  

---

# 📊 Run Simulations

## Step Response

```bash
python -m sim.run_step_response
```

Output saved in:

```
plots/step_response_YYYYMMDD_HHMMSS.png
```

## Fault Scenario

```bash
python -m sim.run_fault_scenario
```

Visualizes the fault-handling timeline.

---

# 🧠 Source Code Overview

| File | Description |
|------|-------------|
| `src/pid.py` | Classic PID controller implementation |
| `src/fsm.py` | AITL canonical FSM definition |
| `src/aitl_controller.py` | Three-layer integrated controller |
| `src/llm_placeholder.py` | Stub for future LLM-driven adaptation layer |

---

# 🧪 Unit Tests

Run all tests:

```bash
pytest tests
```

---

# 📘 Documentation (GitHub Pages)

Full documentation:

👉 https://samizo-aitl.github.io/aitl-silicon-pathway/docs/chapter1/

Individual pages:

- Overview → `docs/chapter1/overview.md`  
- Python model → `docs/chapter1/python_model.md`  
- FSM spec → `docs/chapter1/fsm.md`  
- API reference → `docs/chapter1/api.md`  
- Getting started → `docs/chapter1/getting_started.md`

---

# 🧩 Relation to Silicon Pathway

This Python model is the **trusted behavioral reference** for:

| Stage | Purpose |
|-------|---------|
| **Chapter 2** | RTL FSM implementation |
| **Chapter 3** | ASIC synthesis (OpenLane) |
| **Chapter 4** | Parasitic extraction (Magic) |
| **Chapter 5** | SPICE-level waveform/timing verification |

Maintaining correctness here ensures correctness in all later hardware stages.

---

# © AITL Silicon Pathway Project
