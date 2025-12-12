---
layout: default
title: "4.1 Philosophy: What does it mean for an FSM to be correct?"
---

# 4.1 Philosophy: What does it mean for an FSM to be correct?

## Why Chapter 4 exists

Simulation answers:
- “Did it behave correctly for the test cases I ran?”

Synthesis answers:
- “Can it be turned into gates?”

But neither guarantees:
- “Is it correct for **all** inputs and all reachable states?”
- “Is it safe against **unexpected** sequences or corner cases?”

Chapter 4 introduces **formal & structural correctness**.

---

## Two types of correctness

### A) Structural correctness (construction rules)
Correctness enforced by **design structure**, e.g.:
- Every state is encoded legally (no invalid encoding)
- Every transition is explicit (no implicit latches / X-propagation traps)
- Default assignments prevent unintended memory
- Reset brings FSM into a known legal state

Structural correctness reduces the chance of whole bug classes.

### B) Property correctness (invariants + temporal properties)
Correctness expressed as **properties** that must always hold:
- state invariants (“state must always be one of …”)
- output invariants (“never assert both A and B together”)
- transition safety (“never go to ERROR unless condition X”)
- progress (“eventually returns to IDLE after DONE”)

This is where “formal thinking” lives.

---

## What we guarantee vs what we don’t

### We DO guarantee (inside FSM boundary)
- legal states only
- legal transitions only
- outputs consistent with state and inputs
- forbidden combinations never happen
- expected transitions are fully covered (completeness)
- Python model and Verilog RTL are semantically aligned (under the same abstraction)

### We DO NOT guarantee (outside FSM boundary)
- sensor correctness, analog noise, plant physics
- PID stability/performance by itself
- LLM correctness or safety by itself
- system-level safety without system-level assumptions

So we need a clear boundary contract (see 4.5).

---

## The AITL 3-layer view (PID × FSM × LLM)

- PID layer: inner real-time loop (continuous control)
- FSM layer: supervisory discrete mode logic (this chapter)
- LLM layer: redesign / recovery / diagnosis layer (outermost)

The FSM must provide **deterministic, reviewable guarantees**
so that PID and LLM interact via explicit contracts, not “guesswork”.

---

## Result of this chapter

By the end, you will have:
- a **spec-derived invariant list**
- a **safety & completeness** verification map
- a **Python ↔ Verilog equivalence** definition
- a **guarantee boundary contract** for integrating PID/LLM
