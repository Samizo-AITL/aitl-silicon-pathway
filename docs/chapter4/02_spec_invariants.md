---
layout: default
title: "4.2 Definitions: Spec-derived FSM invariants"
---

# 4.2 Definitions: Spec-derived FSM invariants

This file defines how to build a reliable **invariant list** from a spec,
then provides a practical invariant template you can fill using your Chapter 2 FSM spec.

---

## What is an invariant?

An invariant is a statement that must hold:
- for **all cycles**
- for **all reachable states**
- under the stated assumptions

Examples:
- “State is always one of {IDLE, RUN, ERROR}.”
- “When state==ERROR, output `actuate` must be 0.”
- “`done` and `busy` must never be 1 at the same time.”

---

## How to derive invariants from a spec (repeatable method)

### Step 1: Identify the FSM interface
List inputs/outputs that are visible at the FSM boundary:
- Inputs: commands, events, fault flags, reset, clock enable, etc.
- Outputs: mode selects, enables, status flags, safe outputs, etc.

### Step 2: Extract state meaning
For each state, write:
- State intent (what it represents)
- Allowed inputs (what is meaningful)
- Outputs that must hold in this state
- Exits (which next states are legal)

### Step 3: Convert meaning into invariants
Turn each state meaning into constraints:
- state legality
- output legality (combinational constraints)
- transition legality (temporal constraints)
- mutual exclusion constraints

### Step 4: Add environment assumptions (minimal)
Some invariants need assumptions:
- inputs are synchronous
- reset deasserts cleanly
- command is one-hot
Write assumptions explicitly. Do not hide them.

---

## Invariant categories (recommended)

1. **State legality**
- I-S1: `state` is always in the defined enum set.
- I-S2: reset drives `state` to a specific initial state.

2. **Encoding constraints** (if you use one-hot, gray, etc.)
- I-E1: one-hot constraint: exactly one state bit is 1.
- I-E2: no X/Z in state vector (simulation-level check).

3. **Output constraints**
- I-O1: outputs are fully assigned (no implied latches).
- I-O2: forbidden output combinations never occur.
- I-O3: outputs in each state follow a stable contract.

4. **Transition legality**
- I-T1: from each state, next_state must be one of allowed successors.
- I-T2: ERROR entry only under fault conditions (if that’s your spec).

5. **Progress / non-deadlock** (if required)
- I-P1: from RUN, DONE is eventually reachable under fair conditions.
(Progress often needs assumptions: e.g., “start event eventually occurs”.)

6. **Reset / recovery**
- I-R1: from any state, reset forces safe outputs immediately (if required).
- I-R2: from ERROR, recovery path requires explicit ack.

---

## Spec-derived invariant list (fill-in template)

> Replace bracketed placeholders with your Chapter 2 FSM signals and states.

### State legality
- INV-S1: `state ∈ {<STATE_LIST>}` always.
- INV-S2: If `reset==1`, then `state == <RESET_STATE>` within <N> cycles.

### Output legality
- INV-O1: `(<FORBIDDEN_OUTPUT_COMBO>)` never holds.
- INV-O2: In state `<S>`, output `<y>` must equal `<value_or_expression>`.
- INV-O3: Output `<y>` must be defined for all states (no implicit memory).

### Transition legality
- INV-T1: If `state==<S>`, then `next_state ∈ {<ALLOWED_SUCC>}`.
- INV-T2: If `next_state==ERROR`, then `<fault_condition>` must be true.
- INV-T3: If `<guard>` is true in state `<S>`, then `next_state==<S2>`.

### Progress (optional)
- INV-P1: If `state==RUN` and `<fair_assumption>`, then eventually `state==DONE`.

### Boundary contract (preview; see 4.5)
- INV-B1: When `fsm_mode==SAFE`, all actuation-enables are 0.

---

## A small worked example (generic, not tool-specific)

Assume states: `IDLE, ARMED, RUN, DONE, ERROR`
Assume inputs: `cmd_start, cmd_ack, fault`
Assume outputs: `busy, done, safe_en`

Then example invariants:

- EX-S1: `state` is always one of the 5 states above.
- EX-O1: `done -> (state==DONE)` (done implies DONE state)
- EX-O2: `state==ERROR -> safe_en==0`
- EX-T1: From IDLE, only {IDLE, ARMED, ERROR} are legal next states.
- EX-T2: `next_state==ERROR -> fault==1`
- EX-R1: reset implies `safe_en==0` immediately (if specified)

These are reviewable even before you implement assertions.

---

## Result (what you should output from this file)

- A completed invariant list with:
  - state legality
  - output legality
  - transition legality
  - reset/recovery
  - progress (if needed)
- A short “assumptions” section that states what you rely on
