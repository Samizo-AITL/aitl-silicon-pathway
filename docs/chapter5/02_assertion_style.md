---
layout: default
title: "5.2 Assertion Style for FSM Verification"
---

# 5.2 Assertion Style

Assertions are executable specs.

---

## A) State legality assertion

Example idea (pseudo):

- state must always be in the defined enum set

Purpose:
- detect X-propagation
- detect encoding bugs

---

## B) Transition legality assertion

Idea:
- if current state is S,
  next_state must be one of allowed successors

Purpose:
- catch missing or illegal transitions

---

## C) Output safety assertion

Idea:
- forbidden output combinations never occur

Purpose:
- catch unsafe actuation
- catch spec mismatch

---

## D) Reset assertion

Idea:
- reset forces known safe state and outputs

Purpose:
- ensure deterministic startup

---

## Key rule

Assertions should:
- read like English
- map 1:1 to Chapter4 invariants
