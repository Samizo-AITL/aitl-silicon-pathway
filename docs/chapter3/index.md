# Chapter 3 — FSM RTL → Simulation → OpenLane / ASIC Flow

This chapter verifies that the FSM RTL from Chapter 2 is **hardware-realistic**: it simulates correctly, synthesizes with OpenLane (concept level), and can be checked against the formalized spec.

## What you will build
- A **minimal** simulation setup (no UVM, no full automation)
- A **minimal** testbench pattern that still proves “RTL matches the spec”
- A **concept-level** OpenLane single-block flow for the FSM
- A set of **ASIC-flow checkpoints** to interpret typical synthesis issues

## Scope
Included:
- FSM RTL simulation (minimal)
- Testbench philosophy and minimum examples
- OpenLane synthesis flow (concept level)
- Typical synthesis problems and how to read logs/reports
- How to check “RTL conforms to spec”

Excluded:
- Full SoC integration
- Advanced verification (UVM, constrained random, formal equivalence automation)
- Timing optimization / PPA tuning
- Layout deep dive

## Files in this chapter
- `overview.md` — mindset → procedure → results (why we simulate + synthesize)
- `simulation.md` — minimal sim flow (Icarus/Verilator concept)
- `testbench.md` — minimal TB + what to check to prove spec compliance
- `openlane.md` — OpenLane single-block concept flow
- `asic_checkpoints.md` — ASIC view checkpoints & typical pitfalls
- `code/` — example RTL/TB/Makefile/OpenLane configs used in this chapter

## Quick start (concept)
1. Put your Chapter2 RTL into `docs/chapter3/code/rtl/` (or link it).
2. Run simulation via `docs/chapter3/code/sim/Makefile`.
3. Run OpenLane concept flow using `docs/chapter3/code/openlane/`.

> Note: Tool operations (VSCode, Docker, etc.) are treated as “supplemental”; the core is the logic and checkpoints.

---

Next: read `overview.md`.
