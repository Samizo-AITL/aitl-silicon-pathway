# Overview — Why “Simulation + Synthesis” is the minimum proof of hardware viability

## Philosophy (why)
In Chapter 1 you designed the FSM behavior in Python.
In Chapter 2 you formalized the FSM spec and implemented RTL.

Chapter 3 answers a single question:

> Does the RTL behave and compile like real hardware?

To claim “hardware viability” for an FSM block, you need at least:
- **Simulation**: the RTL produces the expected outputs for representative sequences.
- **Synthesis sanity**: the RTL is synthesizable, consistent, and free from structural hazards.

This does not require full verification or PPA tuning. It requires:
- a minimal testbench that checks “spec-level invariants”
- a basic synth flow that can produce a gate-level netlist and reports

## Procedure (how)
We proceed in the following order:

1. **Compile & simulate RTL**
   - Ensure the design is free from simulation-time hazards
   - Confirm reset behavior, state transitions, outputs

2. **Prove “RTL matches spec” using checkpoints**
   - Check state encoding coverage
   - Check transition conditions
   - Check output mapping invariants (Moore/Mealy expectations)

3. **Run concept-level OpenLane**
   - Confirm synthesizability and detect typical problems early
   - Read the reports to interpret what happened (warnings are part of the learning)

## Results (what to get)
At the end of Chapter 3 you should have:
- A waveform (or textual log) that demonstrates key transitions
- A self-checking minimal TB that flags mismatches
- OpenLane outputs (netlist + reports) showing the FSM can be synthesized

## Key mindset
- Simulation proves “behavior for tested sequences”.
- Synthesis proves “the code can become gates”.
- Together they are the minimum bar for “hardware-realistic RTL”.

---

Next: `simulation.md`.
