---
name: bug-triage
description: triaging an external or unowned bug report whose cause, scope, or priority is not yet understood. Use when the user asks for triage, assessment, prioritization, or an issue record.
---

# Bug triage

Produce a structured triage record for an issue that is not yet ready for direct repair.
This skill is for reports originating from someone else, reports being prepared for
tracking, or cases where the user explicitly requests assessment rather than a fix.

Do not select this skill merely because the user describes a defect. If the user is
working on the affected code and reports a defect in the current implementation,
treat that as a repair request: reproduce it, fix it, and verify the fix. If intent is
unclear, ask whether they want the issue fixed or triaged.

Do NOT write fixes when this skill is selected unless the user explicitly changes the
request to ask for repair.

## Default workflow

### 1. Gather information

Collect the minimum required inputs before proceeding:

| Input | Required | Notes |
|---|---|---|
| Description of unexpected behavior | Yes | What happens vs. what is expected |
| Reproduction steps | Strongly preferred | Ask if absent |
| Error message / stack trace | If applicable | Paste in full |
| Environment (OS, version, config) | When relevant | Ask if likely to matter |
| Frequency | Preferred | Always / intermittent / once |

If key inputs are missing, ask for them one at a time. Stop asking once you have enough to triage.

If you have repo access, read relevant source files and recent commit history before asking questions.

### 2. Confirm or challenge reproduction

Assess whether the bug is reproducible:

- **Confirmed reproducible** — steps are clear and deterministic.
- **Likely reproducible** — steps exist but environment-sensitive.
- **Intermittent** — no reliable trigger; note contributing factors.
- **Cannot reproduce** — steps are missing or contradictory; flag and stop.

If you can run code, attempt reproduction. Report the exact result.

### 3. Classify severity and priority

Assess independently on two axes.

**Severity** — how bad is the impact when it occurs?

| Level | Criteria |
|---|---|
| Critical | Data loss, security breach, system crash, complete feature failure |
| High | Major feature broken, significant user-facing regression, no workaround |
| Medium | Feature partially broken or degraded; workaround exists |
| Low | Cosmetic, edge-case, minor UX issue |

**Priority** — how urgently should this be addressed?

| Level | Criteria |
|---|---|
| P1 | Fix immediately; blocks users or production |
| P2 | Fix in next cycle; impacts users significantly |
| P3 | Fix when convenient; limited user impact |
| P4 | Defer or close; low value relative to cost |

State both levels and a one-sentence justification for each.

### 4. Locate the root cause

Form a hypothesis about what is causing the bug:

1. Search relevant code paths (if repo access is available).
2. Identify the proximate cause (what triggers the failure).
3. Identify the underlying cause (why the code behaves this way).
4. Note confidence: **confirmed** / **likely** / **suspected** / **unknown**.

If the root cause is unknown, describe the narrowest scope you can confidently identify.

### 5. Determine affected scope

State:
- Which components, modules, or features are affected.
- Whether other code paths share the same defect.
- Whether there is a regression (introduced by a specific change).
- Whether any related bugs are likely.

### 6. Recommend next action

Choose exactly one primary recommendation:

| Action | When to use |
|---|---|
| **Fix now** | P1 or P2, root cause located, scope is clear |
| **Investigate further** | Root cause unknown or scope unclear |
| **Defer** | P3/P4, workaround exists, low impact |
| **Close as won't fix** | Not reproducible, by design, or cost exceeds value |
| **Escalate** | Security issue, data integrity risk, or outside current knowledge |

For "Fix now" and "Investigate further", briefly describe the recommended approach or next investigation step.

## Output format

Produce a triage record using this structure:

```
## Triage: <short title>

**Status:** <Confirmed / Likely reproducible / Intermittent / Cannot reproduce>

**Severity:** <Critical / High / Medium / Low> — <one-sentence justification>
**Priority:** <P1 / P2 / P3 / P4> — <one-sentence justification>

**Root cause:** <hypothesis or "Unknown"> (confidence: <confirmed / likely / suspected / unknown>)
- Proximate: <what triggers the failure>
- Underlying: <why the code does this>

**Affected scope:**
- <component or feature>
- <related paths or known affected areas>

**Recommendation:** <Fix now / Investigate further / Defer / Close / Escalate>
<One short paragraph describing the recommended action or next step.>
```

Omit sections that are not applicable. Do not pad with uncertainty.

## Guardrails

- Do not write a fix unless the user asks. Triage is assessment, not repair.
- Do not inflate severity to appear thorough.
- Do not deflate severity to avoid work.
- Do not ask for information you can find by reading the repo.
- State confidence explicitly rather than hedging in prose.
- If the report is too vague to triage, say so clearly and list exactly what is needed.

## Approval gate

Before posting the triage record anywhere (bug tracker, issue comment, PR, external system):

1. Present the completed triage record to the user.
2. Ask explicitly: **"Does this look correct? I'll post it to the tracker once you approve."**
3. Wait for explicit approval. Do not post on "looks fine", ambiguous affirmation, or silence.
4. If the user requests changes, revise the record and repeat the gate.
5. Only post after a clear "yes", "approved", "go ahead", or equivalent.

Use `ask_user` for this checkpoint when the tool is available.

## Handoff

After the user approves and the record is posted:
- If the recommendation is **Fix now**, offer to proceed with the user's chosen repair mode.
- If the recommendation is **Investigate further**, offer to run the next investigation step.
- Otherwise, summarize the outcome and stop.

Do not route automatically to a workflow, classification stage, or worktree. The
active agent mode determines how any later repair is handled.
