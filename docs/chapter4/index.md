---
layout: default
title: "Chapter 4: Formal & Structural Guarantees for FSM Correctness"
nav_order: 4
parent: "AITL Silicon Pathway"
---

# Chapter 4
## Formal & Structural Guarantees for FSM Correctness

Chapter 1–3 proved that the FSM **works** (simulation) and is **buildable** (synthesizable / ASIC-flow feasible).
Chapter 4 moves to the next stage:

> Prove that the FSM is correct **by construction** (structure) and **by properties** (formal thinking).

This chapter is tool-light. It is written to be **human-readable** and **reviewable**.
You can later map these ideas to any formal tool (SVA + SymbiYosys, Jasper, VC Formal, etc.).

---

## Goals

- Define **spec-derived invariants** (FSM must always satisfy them)
- Verify **safety** (no bad transition/output) and **completeness** (all expected transitions are covered)
- Define a method to check **semantic equivalence** between:
  - Python reference FSM (Chapter 1)
  - Verilog RTL FSM (Chapter 2–3)
- Detect spec deviation / design bugs *systematically*
- Clarify the **guarantee boundary** to connect PID / LLM layers in AITL

---

## Non-goals

- Full SoC integration
- Deep “how to use” for commercial formal tools
- PPA optimization or physical layout
- LLM implementation details

---

## Reading order

1. **01 Philosophy** — what correctness means in hardware FSMs
2. **02 Invariants** — how to derive invariants from spec, and a working list template
3. **03 Safety & Completeness** — property categories to ensure nothing is missing / nothing illegal exists
4. **04 Equivalence** — Python ↔ Verilog semantic alignment
5. **05 Boundary** — contract between PID, FSM, LLM
6. **06 Checklist** — review checklist and acceptance criteria

---

## Deliverables (what you should end up with)

- A written set of **FSM invariants** derived from spec
- A property checklist that can be implemented in assertions later
- A clear equivalence story (what “same behavior” means)
- A boundary contract for integrating the 3-layer architecture (PID × FSM × LLM)
