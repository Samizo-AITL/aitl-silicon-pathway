---
layout: default
title: "Chapter 5: From FSM Correctness to Executable Verification"
nav_order: 5
parent: "AITL Silicon Pathway"
---

# Chapter 5
## From FSM Correctness to Executable Verification

Chapter 4 defined *what correctness means* for an FSM.
Chapter 5 shows **how to actually check it**.

This chapter focuses on:
- assertions
- simulation-based checking
- equivalence checking mindset

Tool details are secondary.
The goal is **repeatable verification thinking**.

---

## Goals

- Turn Chapter4 invariants into executable checks
- Learn minimal assertion patterns for FSMs
- Detect spec deviation via simulation
- Check Python ↔ Verilog equivalence in practice

---

## Non-goals

- Full formal tool mastery
- UVM environments
- Large-scale SoC verification
