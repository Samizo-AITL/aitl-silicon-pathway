---
layout: default
title: "5.5 When Verification Fails"
---

# 5.5 When Verification Fails

Failures are expected.
They are information.

---

## Failure categories

1. Assertion failure
   - spec mismatch
   - missing invariant
   - RTL bug

2. Equivalence mismatch
   - abstraction mismatch
   - timing mismatch
   - guard mismatch

3. Coverage hole
   - test stimulus too weak

---

## Debug order

1. Check reset alignment
2. Check state mapping
3. Check guard priority
4. Check missing defaults
