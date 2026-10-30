---
name: wrap-up
description: Completes and delivers accepted implementation work. Use when the user asks to wrap up, finish up, or finalize the work.
---

# Wrap up accepted implementation work

A request to wrap up is acceptance to finish the implementation already in progress—not permission to broaden its scope. Do not ask for confirmation to perform the normal completion steps below.

## Workflow

1. **Establish the work and its boundaries.** Inspect the repository, current branch, `git status`, recent changes, and relevant project instructions. Identify the implementation and any pre-existing or unrelated changes before editing or staging. Preserve unrelated work; never reset, discard, or overwrite it to make the tree clean. If scope or ownership is unclear, stop and ask.
2. **Finish the implementation.** Resolve outstanding work within scope. Reconcile relevant documentation with actual behavior, APIs, configuration, and usage. Review the complete diff for correctness, accidental changes, secrets, and generated artifacts.
3. **Format and verify.** Run the repository's documented formatter, lint, type checks, tests, and other relevant acceptance checks. Discover the project's canonical commands from its documentation/configuration; do not assume a tool exists. Fix failures and rerun affected checks, then rerun the full relevant suite. Report unavailable checks or external CI honestly—never claim success without evidence.
4. **Commit the finished work.** Stage only the intended implementation and its documentation/tests. Review the staged diff, then create a clear commit. Do not amend or rewrite existing commits unless the user explicitly asks.
5. **Push and verify delivery.** Push the commit to the current branch's configured upstream without force. Confirm the push succeeded and the branch is synchronized with its upstream.
6. **Leave the worktree ready for the next task.** Confirm `git status` has no modified, staged, or untracked files. Remove only clearly disposable artifacts generated during this work. Include legitimate implementation files in the commit; do not delete or silently commit unrelated untracked files. If unrelated changes/files remain, or push/verification is blocked, stop and ask how to proceed rather than claiming wrap-up is complete.

## Completion report

State the commit and push result, checks run and their outcomes, and confirm the final worktree status. Distinguish passed checks from checks that were unavailable or blocked. Only call the task complete when the implementation is committed, pushed, and the worktree is clean; otherwise state the exact blocker and remaining state.
