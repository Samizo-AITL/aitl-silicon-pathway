# Formal FSM Specification  
## State, Transition, and Signal Definition

This document defines the **formal specification** of the FSM introduced in Chapter1.
All behavioral ambiguity is removed by explicitly describing **states, transitions,
inputs, and outputs** in a hardware-oriented manner.

This specification serves as the **single source of truth** for RTL implementation.

---

## Scope of This FSM

The FSM specified here corresponds to the **FSM layer** in the PID × FSM × LLM architecture.

- Discrete-time, clocked FSM
- Fully deterministic
- Designed for complete hardware implementation
- Independent of software execution semantics

---

## FSM Type

- **FSM model**: Moore-type FSM  
  (Outputs depend only on the current state)
- **Clock domain**: Single synchronous clock
- **Reset**: Synchronous reset (active-high)

---

## State Definition

### State List

| State Name | Description |
|------------|-------------|
| `IDLE`     | System idle, waiting for activation |
| `INIT`     | Initialization and parameter setup |
| `RUN`      | Normal operation mode |
| `FAULT`    | Fault handling / safe mode |
| `RECOVER`  | Recovery and re-initialization |

---

## State Encoding (Abstract)

At this stage, states are defined **symbolically**.
Concrete binary encoding is deferred to the mapping stage.

| State | Symbolic Code |
|-------|---------------|
| IDLE  | S_IDLE        |
| INIT  | S_INIT        |
| RUN   | S_RUN         |
| FAULT | S_FAULT       |
| RECOVER | S_RECOVER   |

---

## Input Signal Definition

All inputs are **single-bit synchronous signals** unless otherwise noted.

| Signal Name | Direction | Description |
|------------|-----------|-------------|
| `start`    | Input | Start command |
| `init_done` | Input | Initialization completed |
| `fault_detected` | Input | Fault condition detected |
| `recover_done` | Input | Recovery completed |
| `reset`    | Input | Synchronous reset |

---

## Output Signal Definition

Outputs are driven purely by the current state (Moore FSM).

| Signal Name | Direction | Description |
|-------------|-----------|-------------|
| `mode_idle` | Output | Idle mode active |
| `mode_init` | Output | Initialization mode active |
| `mode_run`  | Output | Normal run mode |
| `mode_fault` | Output | Fault mode active |
| `mode_recover` | Output | Recovery mode active |

---

## Transition Conditions

Transitions are evaluated **on each rising clock edge**.

### Transition Rules (Textual)

- `IDLE → INIT`  
  Condition: `start == 1`

- `INIT → RUN`  
  Condition: `init_done == 1`

- `RUN → FAULT`  
  Condition: `fault_detected == 1`

- `FAULT → RECOVER`  
  Condition: `fault_detected == 0`

- `RECOVER → INIT`  
  Condition: `recover_done == 1`

- Any state → `IDLE`  
  Condition: `reset == 1`

---

## Transition Table

| Current State | Input Condition | Next State |
|---------------|-----------------|------------|
| IDLE | start | INIT |
| IDLE | otherwise | IDLE |
| INIT | init_done | RUN |
| INIT | otherwise | INIT |
| RUN | fault_detected | FAULT |
| RUN | otherwise | RUN |
| FAULT | !fault_detected | RECOVER |
| FAULT | otherwise | FAULT |
| RECOVER | recover_done | INIT |
| RECOVER | otherwise | RECOVER |

---

## Output Behavior (Moore)

| State | mode_idle | mode_init | mode_run | mode_fault | mode_recover |
|-------|-----------|-----------|----------|------------|--------------|
| IDLE | 1 | 0 | 0 | 0 | 0 |
| INIT | 0 | 1 | 0 | 0 | 0 |
| RUN | 0 | 0 | 1 | 0 | 0 |
| FAULT | 0 | 0 | 0 | 1 | 0 |
| RECOVER | 0 | 0 | 0 | 0 | 1 |

---

## Completeness and Determinism

- All states define behavior for **all input combinations**
- Undefined transitions are explicitly self-loops
- Reset behavior is globally defined

This guarantees that the FSM is **fully deterministic** and
safe for direct RTL implementation.

---
