---
layout: default
title: "5.4 Python ↔ Verilog Equivalence Check"
---

# 5.4 Equivalence Check

This section operationalizes Chapter4 equivalence.

---

## Practical equivalence loop

1. Generate input sequence X
2. Step Python FSM → record states/outputs
3. Simulate Verilog FSM → record states/outputs
4. Compare traces after mapping

---

## What to compare

- mapped state
- visible outputs
- timing alignment (cycle boundaries)

---

## Typical mismatch causes

- reset off-by-one
- registered vs combinational outputs
- missing transition in RTL
- priority inversion

---

## Outcome

If traces match for:
- directed tests
- randomized tests

Then Python and Verilog are *behaviorally aligned*.
