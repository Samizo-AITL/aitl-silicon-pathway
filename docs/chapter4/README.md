# Chapter 4 — Notes

---

## 🔗 Official Links

| Language | GitHub Pages 🌐 | GitHub 💻 |
|----------|----------------|-----------|
| 🇺🇸 English | [![GitHub Pages EN](https://img.shields.io/badge/GitHub%20Pages-English-brightgreen?logo=github)](https://samizo-aitl.github.io/aitl-silicon-pathway/docs/chapter4/) | [![GitHub Repo EN](https://img.shields.io/badge/GitHub-English-blue?logo=github)](https://github.com/Samizo-AITL/aitl-silicon-pathway/tree/main/docs/chapter4) |

---

- This chapter is **spec-first**:
  - *Philosophy → Definitions → Verification Viewpoints → Results*
- All properties are written in **human-readable form** first.
  - Later, you may translate them to SVA/PSL or a model checker.
- We assume the Chapter 2 RTL is the “implementation candidate”.
- We assume the Chapter 1 Python FSM is the “reference model” (golden behavior).

## Scope reminder

Included:
- invariants (state/output constraints)
- safety + completeness of transitions
- equivalence method (Python vs Verilog)
- bug detection patterns
- PID / LLM boundary contract

Excluded:
- SoC integration details
- full formal tool operational guidance
- PPA and layout optimization
- detailed LLM implementation

## How to use this chapter

- Use this chapter as a **review rubric**:
  - you can review correctness even without running formal tools.
- If you do run tools later:
  - translate invariants and safety properties into assertions
  - run bounded proofs first, then induction where possible
