---
name: fastpath
description: lightweight path for trivial, clearly bounded changes. Use when fastpath is explicitly selected or the requested change is obviously small, isolated, and low-risk; do not use for investigation, exploration, or discussion.
---

# fastpath

Use this skill only for trivial, clearly bounded changes in fastpath mode.

## Start when

- the user has expressed clear intent to make a change, AND
- the user explicitly invokes `fastpath`, OR the change is obviously isolated, low-risk, and simple enough that the full work loop would be unnecessary

## Do not use when

- the request is exploratory, analytical, or investigative with no clear change intent
- the request is ambiguous about whether a change is wanted
- multiple approaches are plausible
- the change affects multiple components or behaviors
- design decisions are required
- the work stops looking trivial during implementation

If any of these appear, stop and tell the user that structured mode is required.

## Operating mode

Fastpath has one gate: the commit gate. There is no brainstorm, classification,
planning, acceptance, or reconciliation stage.

Implement the smallest correct change, run the strongest targeted checks, and
then summarize the result and ask whether to commit. Do not commit until the
user explicitly authorizes the commit. An explicit request such as "commit it"
is authorization after verification.

If the user does not authorize a commit, leave the verified changes in place
and stop. If a new risk or scope change appears, stop and tell the user that
full mode is needed.

## Default workflow

1. Assess fit for fastpath and decide whether lightweight planning is needed.
2. If helpful, make a tiny plan; otherwise proceed directly.
3. Implement the smallest correct change.
4. Verify with the strongest targeted checks available.
   - **Reproducer gate:** if the change was motivated by a specific bug, failure, or incorrect output, run the exact reproducer and confirm the fix resolves it. Lint, typechecks, and unit tests are supporting evidence — they cannot substitute for the reproducer.
   - If the reproducer cannot be run (missing data, unavailable environment, etc.), stop and tell the user that structured mode is required. Fastpath is not appropriate when the primary correctness check is unavailable.
5. Summarize what changed and the verification evidence, then ask once for explicit commit authorization. This is the only fastpath gate.
6. If commit authorization is given, complete the remaining fast path for the current task without pausing for per-step permission.

## Guardrails

- Do not use this skill for ambiguous, cross-cutting, or design-heavy work.
- Do not skip verification.
- When a bug, failure, or incorrect output motivated the change, the reproducer is the mandatory verification gate. Passing lint, typechecks, and unit tests that do not exercise the actual failing path is not a substitute for running the reproducer. If the reproducer cannot be run, fastpath is the wrong mode — structured mode is required.
- During the fastpath commit-authorization gate, treat clear authorization as approval to finish the remaining fastpath steps, but do not infer authorization from ambiguous acknowledgement-only replies.
- After commit authorization, do not leave task status stale in todo files or other tracking artifacts.
- If scope expands or the fix is no longer obvious, tell the user that structured mode is required.
