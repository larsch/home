---
name: reconcile
description: updating docs and project artifacts to match accepted work, then merging and cleaning up. use after accepted implementation, before handoff.
---

# Reconcile

This skill is for structured mode only. Use it to align the surrounding project
record with the accepted implementation.

## Worktree context

Reconcile in the implementation worktree. Treat fetched `origin/main` as the
only integration target; never check out, modify, or merge against local `main`.
Another agent or user may be working in its worktree.

1. **Read the `.plan` file** (`.worktrees/<slug>/.plan`) into memory before
   anything else — it will be discarded when the implementation worktree is
   deleted and is useful as a reference for doc updates.
2. **Fetch and rebase** the implementation branch onto the latest `origin/main`.
3. **Squash** the rebased implementation into one commit, incorporating
   reconciliation documentation updates.
4. **Push** that commit directly to `origin/main` with a normal fast-forward
   push. If another worker advanced `origin/main`, fetch and rebase onto the
   new tip, then retry. Do not touch local `main`.
5. **Delete** the implementation worktree and branch only after confirming the
   push succeeded.

If there is no `origin` remote, stop and ask the user how to proceed rather than
falling back to local `main`.

## Start when

- the work has been technically verified and explicitly accepted by the user
- the user has explicitly accepted the verified result and given go-ahead to begin reconciliation

State the stage explicitly: `Current stage: Reconcile`.
State the worktree slug and that its branch will be rebased onto `origin/main`,
squashed, and pushed.

## Default workflow

1. **Read `.worktrees/<slug>/.plan`** into memory — note scope, approach, and success criteria for doc updates.
2. **Fetch and rebase** the implementation branch onto the latest `origin/main` using the `git-worktree` skill. Never check out or modify local `main`.
3. Check which project artifacts may now be stale.
4. Update `docs/ARCHITECTURE.md`, relevant `docs/*-SPEC.md`, and any other relevant docs, roadmap items, status notes, examples, or comments to match the accepted implementation.
5. **Squash** the rebased implementation and reconciliation updates into one Conventional Commit.
6. **Push** directly to `origin/main` with a normal fast-forward push. If rejected because another worker advanced `origin/main`, fetch the new tip, rebase this commit onto it, and retry. Never force-push. If rebase conflicts are ambiguous or outside approved scope, stop and ask for resolution.
7. **Delete the implementation worktree and branch** only after confirming the push succeeded. If no `origin` remote is configured, stop and ask how to proceed rather than updating local `main`.
8. Summarize what changed and what did not need changes.

## Complete when

- the implementation branch has been rebased onto `origin/main` and squashed into one Conventional Commit
- relevant artifacts have been checked and stale artifacts updated
- the reconciled commit has been pushed successfully to `origin/main` without force
- the implementation worktree and local branch have been removed safely
- local `main` and its worktree have remained untouched
- unchanged artifacts were intentionally left alone
- the final result is summarized clearly
- the work is ready for handoff

## Loop back when

- reconciliation exposes an implementation mismatch
- documentation or status updates reveal unresolved scope or behavior gaps
- acceptance assumptions are discovered to be incomplete
- rebasing conflicts are ambiguous, outside approved scope, or cannot be resolved safely — stop and ask the user for resolution

## Next stage

This is the final stage for the work loop.

## Guardrails

- Do not treat accepted code as fully complete until it has been rebased onto `origin/main`, squashed, pushed, and surrounding artifacts checked.
- Always perform reconciliation for non-trivial work, even if no updates are needed.
- Say explicitly when you checked and found nothing to change.
- The `.plan` file is not committed (it was auto-gitignored in the worktree). It is discarded when the worktree is deleted — this is intentional.
- If rebasing produces ambiguous conflicts or conflicts outside approved scope, stop and ask the user before resolving.
- Verify the push to `origin/main` succeeded before deleting the worktree.
