---
layout: default
title: "4.6 Results: Review Checklist and Acceptance Criteria"
---

# 4.6 Results: Review Checklist and Acceptance Criteria

This is the “definition of done” for Chapter 4.
It is designed so a human reviewer can check correctness without any specific tool.

---

## A. Invariants (must be written)

- [ ] A1: State legality invariant is written (state always in defined set)
- [ ] A2: Reset behavior is specified (reset state, outputs, latency)
- [ ] A3: Forbidden output combinations are listed
- [ ] A4: State→Output contracts are written for every state
- [ ] A5: Illegal transitions are listed explicitly
- [ ] A6: ERROR/SAFE entry condition is justified
- [ ] A7: Recovery conditions are explicit (no “silent escape”)

Acceptance:
- If any item is missing → invariants are incomplete.

---

## B. Safety (must be argued)

- [ ] B1: For each illegal edge, explain why RTL prevents it
- [ ] B2: Guard priorities are deterministic (overlap resolved)
- [ ] B3: Fault handling is defined in every relevant state
- [ ] B4: Outputs are safe on reset and during ERROR/SAFE

Acceptance:
- No “undefined behavior” remains for fault/abort paths.

---

## C. Completeness (must be argued)

- [ ] C1: Transition totality table exists (state × input-category)
- [ ] C2: Each state has a default transition for no-event
- [ ] C3: All spec states are reachable (or justified unreachable)
- [ ] C4: Terminal states are explicit (if any)

Acceptance:
- No missing transitions for specified input categories.

---

## D. Python ↔ Verilog equivalence story (must exist)

- [ ] D1: Abstraction assumptions are stated (clocking, reset, output timing)
- [ ] D2: State mapping table exists (Python state ↔ Verilog state)
- [ ] D3: Equivalence level is stated (Level 1 recommended)
- [ ] D4: Mismatch diagnosis procedure is written

Acceptance:
- A reviewer can reproduce “why they are the same” on paper.

---

## E. Boundary contract for PID / LLM (must be stated)

- [ ] E1: FSM assumptions about inputs are stated (sync, encoding, reset)
- [ ] E2: FSM guarantees to PID are stated (mode legality, safe gating)
- [ ] E3: FSM guarantees to LLM are stated (observability, fault codes)
- [ ] E4: Safe update rule exists (guarded updates + re-validation)

Acceptance:
- Interfaces are contract-based, not implicit.

---

## Result

If A–E are all satisfied, Chapter 4 achieves:
- Formal/structural correctness framework
- A reusable checklist for future FSMs and future updates
- A clear guarantee boundary for AITL integration
