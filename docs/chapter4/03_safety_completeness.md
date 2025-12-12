---
layout: default
title: "4.3 Verification Viewpoints: Safety & Completeness"
---

# 4.3 Verification Viewpoints: Safety & Completeness

This file organizes “formal viewpoints” in a human-reviewable way.
Even without running a model checker, this structure helps you catch missing cases.

---

## Safety vs Completeness (the mental model)

### Safety (nothing bad happens)
- forbidden transitions never occur
- forbidden outputs never occur
- illegal states never occur
- ERROR entry is justified
- recovery requires explicit conditions

### Completeness (nothing expected is missing)
- every defined state has defined outputs
- every state has defined transitions for all relevant input categories
- expected sequences are possible (reachability)
- corner inputs don’t create “undefined behavior”

Both are needed:
- a design can be “safe” but incomplete (stuck / deadlock)
- a design can be “complete” but unsafe (allows illegal transition)

---

## A verification map (human readable)

### 1) State space coverage
- V-SC1: All states in the spec exist in RTL enum.
- V-SC2: There are no extra states without spec meaning.
- V-SC3: No unreachable states (or unreachable ones are justified).

How to detect:
- Review transition graph.
- Add a reachability table (manual or later via tool).

### 2) Transition totality (completeness)
For each state S, classify inputs into categories:
- normal/no-event
- command/event
- fault/abort
- reset/recovery

Then ensure next_state is defined for each category.

Checklist per state:
- V-TC1: Default transition defined (no-event)
- V-TC2: Each command/event has a defined successor
- V-TC3: Fault path defined (usually to ERROR or SAFE)
- V-TC4: Recovery path defined if state is ERROR-like

### 3) Forbidden transition safety
Define “illegal edges” explicitly:
- “From DONE, must not go to RUN without re-arming”
- “From ERROR, must not go to RUN without ack”

Properties:
- V-TS1: Illegal edges never occur
- V-TS2: If multiple guards overlap, priority is well-defined

### 4) Output safety
- V-OS1: In each state, outputs match the spec meaning
- V-OS2: No forbidden output combinations
- V-OS3: Outputs do not glitch across a state transition if spec forbids (synchronous constraint)

### 5) Deadlock / livelock (progress)
If progress is required:
- V-P1: No dead-end states (unless terminal by spec)
- V-P2: Under fair assumptions, RUN eventually leads to DONE/IDLE

Note:
- Progress is often “conditional” on environment fairness.
Write assumptions explicitly (e.g., “cmd_ack eventually arrives”).

---

## Common bug patterns and how this map catches them

- Missing default assignment → violates V-OS1/V-OS2; creates latch-like behavior
- Overlapping guards with wrong priority → violates V-TS2; causes unexpected edge
- Unhandled fault input in a state → violates V-TC3; unsafe in real world
- Spec-defined state never reachable → violates V-SC3; indicates missing edge or wrong reset
- ERROR recovery too permissive → violates V-TS1; may hide faults

---

## Result (expected “chapter outcome”)

You should be able to produce:
- a transition table (state × input-category → next state)
- a list of illegal edges (explicit)
- a list of forbidden output combos
- a short progress statement (or “not required”)
