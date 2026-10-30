---
name: plan
description: planning implementation before building. turning an approved direction into scoped steps, assumptions, affected areas, and a verification approach.
---

# Plan

This skill is for structured mode only. Use it to convert a chosen direction
into executable work.

## Start when

- the direction is chosen
- the change has been classified as `normal`
- the work now needs scope, steps, assumptions, or validation planning
- design questions need to be settled in a practical way before implementation

State the stage explicitly: `Current stage: Plan`.
Also state the worktree slug and path.

## Worktree context

**Create the worktree as the very first action of this stage, before writing the `.plan` file or doing any other planning work.** Use the `git-worktree` skill's `create` operation to set up `.worktrees/<slug>/` and a matching branch.

The worktree path is `.worktrees/<slug>/`. All plan file paths use this prefix.

The `.plan` file is auto-excluded from git — the `git-worktree create` operation adds `.plan` to the worktree's `.git/info/exclude`. This means `.plan` is never staged or committed. It exists only in the worktree directory and is discarded when the worktree is deleted.

## Default workflow

1. Restate the chosen direction.
2. Define the scope and boundaries.
3. **State explicit code-level done conditions** — for every interface, module, or abstraction being introduced or changed, declare what "complete" means in concrete terms:
   - New interfaces: fully implemented, all call sites migrated, covered by tests.
   - Old interfaces: all usages removed and the symbol deleted (or, if public API, marked deprecated and documented with a migration path).
   - Deprecated call sites: zero remaining uses of the old path in non-legacy code.
   - Dead code: no unused functions, types, or modules left behind.
   List these conditions explicitly; they become hard exit criteria for build and verify.
4. Break the work into ordered steps.
5. Identify the affected files, components, systems, and docs.
6. Note assumptions, risks, and dependencies.
7. Decide how the work will be verified, including structural checks (grep / static analysis) that confirm old symbols are gone.
8. For non-trivial work, create or update `.worktrees/<slug>/.plan` with scope, approach, success criteria (including the code-level done conditions from step 3), steps, risks or assumptions, and verification.

## Complete when

- the implementation steps are clear
- scope boundaries are visible
- important assumptions and risks are named
- **explicit code-level done conditions are listed** — every new interface has a completion state, every deprecated interface has a removal or deprecation marker target, and no dead code is planned to be left behind
- verification is planned well enough to build toward, and includes structural checks for old symbols/dead code
- for non-trivial work, `.worktrees/<slug>/.plan` exists and captures scope, approach, and success criteria (including code-level done conditions)
- the work can be built without inventing the whole approach mid-stream

## Loop back when

- the chosen direction is still unstable
- key constraints are still unknown
- implementation discoveries show that the plan no longer fits reality

## Next stage

Once the next implementation steps are clear enough to execute, present the plan result, state that the next stage would be `build`, and wait for explicit user go-ahead.

## Guardrails

- Keep design inside planning; do not split them into separate phases.
- Plan proportionally to the size and risk of the task.
- Do not create ceremony for small tasks.
- Do not skip verification planning.
- **For any refactor or interface migration: the plan is not complete unless it names every old symbol that must be removed (or deprecated) and how removal will be confirmed.** A plan that only describes what to add is incomplete.
- If scope is revised after the `.plan` file is written, update it before leaving this stage. A stale `.plan` file is a broken gate.
