---
layout: default
title: "4.4 Python ↔ Verilog Semantic Equivalence"
---

# 4.4 Python ↔ Verilog Semantic Equivalence

This chapter defines what it means for the Python FSM (Chapter 1) and
the Verilog RTL FSM (Chapter 2) to be “the same”.

We do not require identical code or identical internal encoding.
We require **semantic equivalence** under an agreed abstraction.

---

## What “equivalence” means (choose your level)

### Level 0: I/O trace equivalence (most practical)
Given the same input sequence, the outputs match cycle-by-cycle.
- Pros: simple, matches system reality
- Cons: hides internal state mismatches if outputs coincide

### Level 1: State + output trace equivalence (recommended)
Given the same input sequence, both:
- produce matching outputs
- and move through corresponding abstract states

This requires a **state mapping** from Python state to Verilog state.

### Level 2: Bisimulation (strongest)
For every step in Python there exists a matching step in Verilog and vice versa,
preserving mapped states and outputs.
- Pros: strongest correctness story
- Cons: more work, typically needs formal tooling

For Chapter 4, we aim for Level 1, and describe how to scale to Level 2 later.

---

## The core idea: a step function

Define both FSMs as deterministic step functions (synchronous model):

- Python:
  - `(s_py, y_py) = step_py(s_py, x)`
- Verilog (abstracted to a cycle step):
  - `(s_v, y_v) = step_v(s_v, x)`

Then define:
- a mapping `M: S_py -> S_v` (or to a shared abstract set `S_abs`)
- an output projection `P` if outputs differ in naming/packing

Equivalence goal (Level 1):
- For all input sequences X:
  - `P(y_py[t]) == P(y_v[t])`
  - and `M(s_py[t]) == s_v[t]` (or both map to same `s_abs[t]`)

---

## Practical method (tool-agnostic)

### Step 1: Align the abstraction boundary
Agree on:
- which inputs are sampled at clock edge
- which outputs are registered vs combinational
- reset behavior (sync/async, deassert rules)
- any “don’t care” fields (e.g., debug outputs)

Write these as assumptions.

### Step 2: Build a state mapping table
Create a table:

| Python State | Verilog State | Meaning |
|-------------|---------------|---------|
| IDLE        | ST_IDLE       | waiting for command |
| RUN         | ST_RUN        | active mode |
| ERROR       | ST_ERR        | safe stop |

If encoding differs (one-hot vs enum), mapping is by meaning, not bits.

### Step 3: Define equivalence checks

#### A) Trace-based (simulation / co-sim)
- Generate random + directed input sequences
- Run Python step model
- Run Verilog RTL simulation
- Compare:
  - outputs each cycle
  - state (via mapped observation)

This is not “formal proof”, but it is systematic and catches many bugs.

#### B) Property-based (formal-friendly)
Write properties:
- “If initial states correspond, then after 1 step they correspond”
- “Outputs match whenever states correspond”
These are the building blocks for induction.

---

## How to detect spec deviation / design bugs via equivalence

Typical mismatches:
- reset mismatch (one model enters IDLE, other enters ARMED)
- off-by-one output timing (registered vs combinational)
- guard priority mismatch (two conditions overlap)
- missing transition in RTL (Python transitions but RTL stays)

Diagnosis flow:
1. find first cycle where outputs differ
2. check if state mapping diverged earlier
3. identify which guard caused divergence
4. decide: spec or implementation is wrong → update spec or fix RTL

---

## Result

You should produce:
- Abstraction assumptions (clocking, reset, output timing)
- A Python↔Verilog state mapping table
- Equivalence criteria (Level 1 recommended)
- A mismatch diagnosis procedure (repeatable)
