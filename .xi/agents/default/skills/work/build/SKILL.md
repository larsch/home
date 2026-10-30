---
name: build
description: implementing code or file changes. executing an approved plan. user asks to build, write, implement, or change code or files.
---

# Build

This skill is for structured mode only. Use it to implement the current plan
in code or files.

## Worktree context

This skill operates inside a git worktree (`.worktrees/<slug>/`). All file operations use this path prefix.

During Build, incremental commits are made on the **worktree branch** at meaningful compile-clean milestones. These commits are not the final product — they checkpoint progress. The final squashed commit is produced during Reconcile.

## Start when

- there is a plan that is specific enough to execute
- the next implementation steps are clear
- the work can be changed safely enough to move forward
- **the worktree exists** at `.worktrees/<slug>/` with a branch checked out

State the stage explicitly: `Current stage: Build`.
Also state the worktree slug and path.

## Default workflow

1. Confirm the current implementation step.
2. Make the smallest coherent change that moves the work forward.
3. Keep changes aligned with the approved scope.
4. Update `.worktrees/<slug>/.plan` if implementation materially changes the plan.
5. Update `docs/ARCHITECTURE.md` or relevant `docs/*-SPEC.md` files when the implementation changes architecture or specified behavior. (Edit files in the worktree: `.worktrees/<slug>/docs/ARCHITECTURE.md`, etc.)
6. Run immediate sanity checks as needed while building.
7. **Commit at meaningful milestones:** when the code compiles and is clean at a natural boundary, create an incremental commit on the worktree branch:
   - Use a Conventional Commit message (see `commit` skill for format)
   - Do not seek commit opportunities artificially — commit when a coherent step is complete
   - Do not ask for permission for these incremental commits
   - Example boundaries: a new function/module compiles, a test passes after changes, a discrete logical step is finished
8. Surface surprises quickly.
9. Leave the result in a state that can be verified.

### Incremental commit discipline (detail)

Commit on the worktree branch when:
- Code compiles and passes a quick sanity check
- The change represents a coherent, self-contained step forward
- You would be comfortable rolling back to this point

Do NOT commit when:
- Code does not compile or has trivial breakage mid-edit
- The only change is formatting or whitespace
- You are in the middle of an unfinished step
- You would need to force-push to the worktree branch (it's local — no one else sees these commits)

Command: `git -C .worktrees/<slug>/ commit -m "<type>(<scope>): <description>"`

## Complete when

- the scoped changes are implemented in the worktree
- meaningful incremental commits exist on the worktree branch
- the result is stable enough to validate technically
- meaningful deviations from the plan have been surfaced
- relevant plan, spec, or architecture docs have been updated or explicitly flagged for reconciliation

## Loop back when

- implementation reveals missing plan steps or bad assumptions
- the task expands materially beyond the planned scope
- the underlying direction no longer appears correct

## Next stage

Move directly to `verify` once the changed behavior is ready for technical validation. This is the one normal forward transition the agent may make without stopping for user go-ahead.

**After verify, stop.** Present results to the user and wait for explicit acceptance before merging or pushing to main.

## Guardrails

- Do not silently expand scope.
- Do not keep coding through broken assumptions.
- Do not confuse implementation-time sanity checks with final verification.
- If the plan changes materially, return to `plan` or `brainstorm` before continuing.
- Before editing an existing file, read the relevant section first. Do not assume you know its current content.
- **Incremental commits on the worktree branch do not need user permission.** They are part of the Build discipline. But never push the worktree branch unless the user explicitly requests it.
- Do not merge the worktree branch to main during Build — that happens during Reconcile.
