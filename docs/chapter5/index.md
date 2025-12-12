---
layout: default
title: "Chapter 5: From FSM Correctness to Executable Verification"
nav_order: 5
parent: "AITL Silicon Pathway"
---

# Chapter 5
## From FSM Correctness to Executable Verification

---

## 🔗 Official Links

| Language | GitHub Pages 🌐 | GitHub 💻 |
|----------|----------------|-----------|
| 🇺🇸 English | [![GitHub Pages EN](https://img.shields.io/badge/GitHub%20Pages-English-brightgreen?logo=github)](https://samizo-aitl.github.io/aitl-silicon-pathway/docs/chapter5/) | [![GitHub Repo EN](https://img.shields.io/badge/GitHub-English-blue?logo=github)](https://github.com/Samizo-AITL/aitl-silicon-pathway/tree/main/docs/chapter5) |

---

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
