---
name: verify
description: checks whether built work satisfies the request using the strongest relevant tests, lint, typechecks, or manual validation available. use after implementation and before user acceptance or final reconciliation.
---

# Verify

This skill is for structured mode only. Use it to establish technical
confidence in built work.

## Worktree context

This skill operates inside a git worktree (`.worktrees/<slug>/`). All file operations and command paths use this prefix. The worktree branch holds the changes to verify.

## Start when

- implementation is complete enough to validate
- changed behavior can be checked directly
- the result is stable enough for technical review
- **the worktree branch has the latest incremental commits**

State the stage explicitly: `Current stage: Verify`.
Also state the worktree slug and path.

## Default workflow

1. Choose the strongest relevant checks available. Run them in the worktree context (`cd .worktrees/<slug>/ && ...` or equivalent).
2. Start with targeted checks for the changed behavior.
3. Add broader tests, lint, or typechecks when justified by risk and project norms.
4. Use manual validation when automation is unavailable.
5. **Check structural / code-level done conditions from the plan** — if the plan named explicit done conditions (new interfaces fully adopted, old interfaces removed, deprecated call sites gone, no dead code), verify each one explicitly now:
   - Search for remaining uses of old/deprecated symbols (grep, compiler warnings, linter).
   - Confirm removed symbols are actually absent from the codebase.
   - Confirm new interfaces are used at every intended call site, not just some.
   - Confirm dead code was deleted, not just left unused.
   Show evidence for each condition — do not summarize from memory.
6. Record the evidence clearly.
7. Update `.worktrees/<slug>/.plan` with the verification outcome when that plan file exists.
8. Decide whether the work is ready for acceptance or needs another loop.

## Complete when

- the changed behavior has actually been checked
- there is technical evidence, not just assertion
- **all code-level done conditions from the plan have been checked and confirmed — or gaps are explicitly surfaced**
- failures are understood well enough to route the work correctly
- the result is ready to present for explicit user acceptance

## Loop back when

- technical checks fail and the fixes are local
- failures show the implementation does not match the plan
- failures show the plan or approach is weak
- **structural / code-level done conditions are not met — old symbols still exist, dead code remains, or not all call sites have been migrated**

## Next stage

Once technical verification succeeds, present the evidence to the user and stop
for explicit user acceptance. There is no separate acceptance skill. Reconcile
may begin only after that acceptance.

## Guardrails

- Verification is required for non-trivial work.
- Prefer evidence over confidence.
- If no automation exists, say exactly what was checked manually.
- Do not treat successful build steps as a substitute for verification.
- **Do not treat passing tests as proof a refactor is complete.** Structural goals — removed symbols, migrated call sites, absent dead code — must be checked independently and explicitly.
