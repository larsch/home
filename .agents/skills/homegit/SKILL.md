---
name: homegit
description: Works with Lars's homegit bare repository for tracking and maintaining home-directory dotfiles. Use for requests involving dgit, ~/home.git, or committing configuration files from $HOME.
---

# Homegit

Manage the home-directory repository as a bare Git repository at `~/home.git` with the worktree at `$HOME`.

## Commands

The interactive zsh alias `dgit` expands to:

```sh
git --work-tree="$HOME" --git-dir="$HOME/home.git"
```

Tool calls and non-interactive shells may not expand that alias; invoke Git with both options explicitly. For example:

```sh
git --work-tree=/home/larsch --git-dir=/home/larsch/home.git status --short --branch
```

Use the actual home directory if it differs from `/home/larsch`. Do not use `git -C "$HOME"` or assume `$HOME` itself is a normal Git worktree.

## Workflow

- Check status before changing or staging files. The repo may already contain unrelated changes.
- Inspect tracked files with `git --work-tree="$HOME" --git-dir="$HOME/home.git" ls-files -- <path>`; inspect candidate contents before adding them.
- This repo sets `status.showuntrackedfiles=no`; use `status --untracked-files=all` when checking whether a specific untracked file is present.
- Configuration under `$HOME` is not necessarily tracked. Do not assume a file is in homegit just because it exists there.
- Stage only paths the user asked to track or commit. Do not use `git add -A` or stage unrelated home-directory content.
- Never commit, push, reset, clean, or discard changes unless the user explicitly asks. Preserve unrelated work.
- Before a requested commit, review the staged diff and check for secrets, credentials, machine-specific data, and generated files.
- Report paths relative to `$HOME`, and state clearly what was inspected, changed, staged, or committed.
