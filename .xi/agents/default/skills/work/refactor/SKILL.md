---
name: refactor
description: "structured-mode support for refactoring tasks — decomposition, extraction, inlining, restructuring, coupling reduction, or any reshape of code that does not change external behavior. use when a user asks to restructure code, decompose a large module or struct, extract subsystems, reduce a god object, or otherwise change code shape rather than behavior. distinct from feature work: passing tests and lint is necessary but not sufficient — the structural goal must be explicitly checked and met."
---

# Refactor

Use this skill in structured mode alongside the structured-mode stages. It adds
two refactor-specific obligations on top of the normal loop:

1. **Define the structural goal before building** — state what done looks like in concrete terms.
2. **Verify the structural goal explicitly** — do not treat passing tests as completion.

---

## Worktree context

Refactors follow the same worktree workflow as other non-trivial changes. The structural goal is documented in the `.plan` file (`.worktrees/<slug>/.plan`) and checked during Verify.

## Before brainstorm / plan

Establish the structural goal before any code changes:

- **What is the structural problem?** Name it: god object, tangled dependencies, oversized module, missing abstraction, etc.
- **What does done look like?** State it in concrete, measurable terms (e.g. "`app.rs` is under 300 lines", "all provider logic lives in `ProviderManager`", "no circular imports between `foo` and `bar`").
- **What must not change?** Name behavioral invariants: public API, test results, observable behavior.

If the goal cannot be stated in concrete terms, clarify with the user before entering the plan stage.

---

## During verify

Verification has two parts — both are required:

**Behavioral:** tests pass, lint and type checks pass, no unintended API changes.

**Structural:** explicitly check the original goal. Run measurements, inspect structure, or otherwise confirm the stated outcome was reached. Show evidence — do not summarize from memory.

Passing behavioral checks alone is not sufficient to conclude a refactor. If the structural goal is not met, surface the gap and ask the user how to proceed before moving to accept.

---

## Evaluation cases

**Normal:** User asks to decompose a 900-line `app.rs`. Agent states the structural goal (reduce to <300 lines, extract `ProviderManager`), builds in phases, then at verify runs `wc -l` and confirms the goal is met before presenting results.

**Failure-prone:** Tests pass after restructuring but the target module is still 650 lines. Agent does not declare done — surfaces the gap, shows the measurement, and asks the user whether to continue, adjust the goal, or stop.

**Vague request:** User asks to "clean up the code." Agent does not proceed — asks for a concrete structural outcome before entering the plan stage.
