---
name: git-worktree
description: managing git worktrees — creating, merging, and deleting a branch worktree. use when starting or finishing non-trivial work on an isolated branch.
---

# git-worktree

This skill is for structured mode only. Use it when structured mode needs to
create, merge, or delete a git worktree for a non-trivial change. This is an
operations reference, not a workflow stage — it is invoked at the Plan and
Reconcile gates.

## Session state

The agent carries the following state across workflow stages:

```
WORKTREE_SLUG   — short descriptive slug derived from the work item name
WORKTREE_PATH   — .worktrees/<WORKTREE_SLUG>/
BRANCH_NAME     — same as WORKTREE_SLUG (the worktree branch)
```

These are remembered in session context and stated at each stage transition.

## Operations

### 1. Create a worktree

Called at the **start of the Plan stage** in structured mode.

**Slug derivation:** Create a short kebab-case slug from the work item description. Examples:
- "refactor workflow skills to use worktrees" → `worktree-refactor`
- "add oauth login to auth module" → `oauth-login`
- "fix session timeout bug" → `session-timeout-fix`

The user may suggest or override the slug.

**Command sequence:**

```bash
# 1. Fetch the integration target, never relying on local main
git fetch origin main

# 2. Create a new branch from origin/main and add its worktree
git worktree add -b <WORKTREE_SLUG> .worktrees/<WORKTREE_SLUG>/ origin/main

# 3. Auto-ignore the .plan file in the worktree (not committed to git)
echo .plan >> .worktrees/<WORKTREE_SLUG>/.git/info/exclude
```

After creation, all file operations for Plan, Build, and Verify use the `.worktrees/<WORKTREE_SLUG>/` path prefix.

The `.plan` file is created at `.worktrees/<WORKTREE_SLUG>/.plan` and follows the format specified in the `plan` skill.

### 2. Rebase, squash, and push without checking out local main

Called at the **start of the Reconcile stage**, after explicit user acceptance.

**Use `origin/main` as the integration target throughout. Never check out,
modify, or merge against local `main`.** Another agent or user may be working
in the local main worktree. Reconcile directly in the implementation worktree
and push the resulting single commit to `origin/main`.

**Precondition:** The implementation worktree branch has incremental commits
from Build and `origin` is the configured remote.

**Command sequence:**

```bash
# 1. Fetch the latest integration target
git fetch origin main

# 2. Rebase the implementation commits onto origin/main
git -C .worktrees/<WORKTREE_SLUG> rebase origin/main

# 3. Squash the rebased implementation into one staged change
git -C .worktrees/<WORKTREE_SLUG> reset --soft origin/main

# 4. Check/update reconciliation docs, then create the single
# Conventional Commit and push it directly to remote main
git -C .worktrees/<WORKTREE_SLUG> status --short
git -C .worktrees/<WORKTREE_SLUG> commit -m "<type>(<scope>): <description>"
git -C .worktrees/<WORKTREE_SLUG> push origin HEAD:main
```

If the push is rejected because someone advanced `origin/main` after the
fetch, fetch again, rebase the squash commit onto the newly fetched
`origin/main`, resolve only clear in-scope conflicts while preserving both
changes, then retry the normal push:

```bash
git fetch origin main
git -C .worktrees/<WORKTREE_SLUG> rebase origin/main
git -C .worktrees/<WORKTREE_SLUG> push origin HEAD:main
```

Repeat fetch/rebase/push if `origin/main` advances again. Never force-push or
touch local `main`. If a rebase conflict is ambiguous, cannot be resolved
without changing approved scope, or the push fails for another reason, stop
and report the state for user direction.

The commit message follows [Conventional Commits v1.0.0](https://www.conventionalcommits.org/):
- Format: `<type>[optional scope]: <description>`
- Common types: `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`
- Use `!` or a `BREAKING CHANGE:` footer when applicable
- Describe the product/system change, not the meta work process

For rebase conflicts, resolve only when the intended result is clear and within approved scope; otherwise stop and ask the user. After a push rejection caused by a newer `origin/main`, fetch, rebase, and retry as described above.

### 3. Delete the implementation worktree

Called at the **end of Reconcile**, only after confirming the squashed commit
has been pushed successfully to `origin/main`.

```bash
git worktree remove .worktrees/<WORKTREE_SLUG>/
git branch -D <WORKTREE_SLUG>
```

Use `-D` only after verifying the delivered commit is on `origin/main` and the
worktree is clean. If the worktree is dirty or cannot be removed safely, stop
and report its state; do not use `rm -rf` to bypass that check.

## Safety checks

- **Before create:** Fetch `origin/main` and check whether `.worktrees/<WORKTREE_SLUG>/` already exists. Create the branch from `origin/main`, never local `main`. If the path exists and is clean, reuse it only after confirming its branch is rebased onto current `origin/main`; if dirty, stop and ask.
- **Before reconcile:** Confirm implementation commits are based on the latest fetched `origin/main`; rebase there if needed. Do not create a second integration worktree or check out local `main`.
- **Before push:** Confirm the staged/committed changes are only the intended squashed implementation and reconciliation updates. Push normally to `origin/main`; if rejected because it advanced, fetch, rebase onto the new `origin/main`, and retry. Never force.
- **Before delete:** Confirm the squash commit and reconciliation updates have been pushed successfully.
- **Branch push policy:** Worktree branches are local by default. For large changes where the user wants to push the branch (e.g. for review before merge), the user explicitly requests this. Do not push worktree branches automatically.
