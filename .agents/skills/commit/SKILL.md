---
name: commit
description: making a git commit or formatting a commit message. user asks to commit, stage, or write a commit message outside of an active worktree workflow.
---

# Commit

> **Note:** This skill is **not** invoked during the normal worktree workflow. Incremental commits on the worktree branch are part of the `build` discipline (no preflight ceremony needed). The squash-merge commit on main is produced by the `git-worktree` skill's `merge` operation. Use this skill only as a **formatting reference** or for **ad-hoc commits** outside the worktree workflow.

Use this skill for:
- **Formatting reference** — the Conventional Commit standard used during Build (incremental commits) and Reconcile (squash-merge commit)
- **Ad-hoc commits** — when the user explicitly asks to commit something outside the worktree workflow

## Start when

- the user explicitly asks to create a commit, and
- the work is not part of an active worktree workflow (those commits are handled by Build or Reconcile)

## Preflight (must pass before committing)

1. Confirm the current directory is a git repository.
2. Check repository state:
   - no unresolved merge conflicts
   - no ongoing rebase/cherry-pick/merge operation unless the user is intentionally finishing it
3. Confirm there are staged changes to commit.
4. Run the strongest relevant project checks for the staged changes (tests, lint, typecheck, or targeted validation) and require success.
5. If any preflight check fails, stop and report the failure. Do not commit.

## Commit message standard

Follow Conventional Commits v1.0.0:

- Format: `<type>[optional scope]: <description>`
- Common types: `feat`, `fix`, `refactor`, `perf`, `docs`, `test`, `build`, `ci`, `chore`
- Use `!` or a `BREAKING CHANGE:` footer when applicable.
- The subject must stay on a single line and be no longer than 72
  characters.
- Reflow each body paragraph so every line is no longer than 72
  characters. Preserve intentional formatting in code blocks, quoted
  text, and other preformatted content; if such content cannot be
  reflowed, keep it as-is and explain the exception.

Message rules:

- Describe the product/system change, not the meta work process.
- Good: `fix(auth): prevent session timeout during oauth callback`
- Bad: `chore: implement requested feedback from review`
- Keep the subject concise, imperative, and specific.
- Reflow the subject or body as needed to enforce the 72-character limit; do
  not leave overlong prose lines in the proposed message.
- Include a body for every non-trivial product, behavior, debugging, or
  refactoring change. The body should preserve the useful context that would
  otherwise be lost from the history:
  - explain the previous or problematic behavior,
  - summarize the approach taken,
  - describe the resulting behavior or impact,
  - mention tests or regression coverage when relevant.
- Subject-only messages are appropriate only for genuinely trivial changes,
  such as mechanical formatting, metadata-only updates, or an obvious
  one-line maintenance change.
- Do not omit the body merely because the subject is technically sufficient.
  Commit history should explain why the change was made, not only what area it
  touched.

## Default workflow

1. Inspect staged diff (`git diff --staged`) to identify the real product change.
2. Choose the Conventional Commit type/scope that best matches behavior impact.
3. Draft a product-facing commit message with a concise subject and, unless
   the change is genuinely trivial, a wrapped explanatory body covering the
   problem, approach, impact, and verification.
4. Share the proposed message with the user for confirmation when message intent is ambiguous.
5. Create the commit only after preflight passes.
6. Report commit hash and final message.

## Complete when

- all preflight checks passed
- commit was created successfully
- final commit hash and message were reported

## Guardrails

- Never commit when checks fail.
- Never use a meta-task subject (for example, “address review comments”, “complete task”, “apply requested changes”).
- Do not bypass hooks or verification with `--no-verify` unless the user explicitly requests it and acknowledges risk.
- This skill is not invoked during the normal worktree workflow — incremental commits on the worktree branch do not need preflight ceremony, and the squash-merge commit on main follows the `git-worktree` skill's merge operation.
