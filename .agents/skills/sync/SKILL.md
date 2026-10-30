---
name: sync
description: Commits and delivers local repository changes to the intended Git remote branch. Use for requests like “sync” or “bring this into synced state”.
---

# Sync repository changes

Treat “sync” as an instruction to reach a clean, delivered Git state—not merely to fetch or report status. Default destination is `origin/main`. If the user explicitly asks to stay on the current branch, deliver to that branch’s configured upstream instead.

## Efficient command execution

Preserve all safety gates, but avoid unnecessary one-command-per-tool-call sequencing:

- Run independent inspection or verification commands in parallel when tools support it.
- Batch related read-only checks into one command invocation where practical.
- When operations have dependencies, use one shell command with `&&` (for example, format then preflight, or stage then inspect the staged diff and run `git diff --cached --check`). This preserves fail-fast ordering.
- Keep human review gates between phases: inspect before staging; inspect the staged diff before committing; verify delivery after pushing. Do not combine across a gate in a way that commits or pushes before reviewing the relevant state.
- Do not repeat checks already included in a successful aggregate check unless a separate result is needed to diagnose or report a failure.

## Workflow

1. **Inspect before changing anything.** Read applicable repository instructions. Check the current branch, worktree (`git worktree list`), upstream, `git status`, and the diff/stat, including staged and untracked files. Fetch the destination remote and check divergence. Never inspect or print credential values. For files that may contain credentials, use metadata or a safe encryption-header check only; do not expose their contents.
2. **Check for blockers.** Stop and report rather than stage, commit, merge, or push if there are apparent temporary/debug changes, unclear ownership or intent, non-trivial conflicts, unexpected divergence, or anything else that makes integration unsafe. Do not discard, reset, overwrite, or force-push. Resolve only trivial, unambiguous conflicts; stop if resolution is uncertain.
3. **Deliver to the intended branch.**
   - On `main`, commit all intended local changes and push to `origin/main`.
   - If explicitly asked to stay on the current branch, commit all intended changes and push to its configured upstream; do not promote to `main`.
   - Otherwise, changes made in a worktree are to be squashed onto `main`. Verify the target `main` worktree/branch and integration are safe; create one squash commit on `main`, push it, then remove the completed source worktree and its branch. Do not remove a worktree with remaining changes or unrelated files. If safe completion or cleanup is unclear, stop and ask.
   - From a non-worktree branch without an explicit stay-on-branch request, bring the changes to `origin/main` as a single squash commit, push, and return to `main`; do not delete the source branch unless asked.
4. **Handle every file deliberately.** Stage intended tracked and new files, including legitimate encrypted secrets if they are part of the change. Leave ignored files alone. Do not delete or silently omit untracked non-ignored files to make status clean; include them only when clearly part of the work. If their purpose or sensitivity is unclear, stop and ask. Review the staged diff and `git diff --check` before committing. Never amend or rewrite existing commits unless explicitly requested.
5. **Verify delivery.** Fetch the remote again; confirm the intended branch equals its remote target and `git status` has no staged, modified, or untracked files. For worktree promotion, also verify the source worktree and branch were removed. Report commit, push, checks, and final status accurately. If any required outcome is blocked, state the exact remaining state instead of claiming success.

## Evaluation cases

- **Clean `main` with ordinary changes:** commit and push to `origin/main`; verify clean status and zero divergence.
- **Worktree feature branch with intended changes:** squash once onto `main`, push, and remove the source worktree/branch only after verifying it is clean and safe to remove.
- **Untracked secret-looking file, debug code, or non-trivial conflict:** do not expose secret contents or force a resolution; stop and explain the blocker.
