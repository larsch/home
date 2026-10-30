---
name: change-risk-assessment
description: risk assessment for a proposed change. user asks 'what are the risks', wants to evaluate a change before implementing it, or needs to weigh the cost of acting vs not acting.
---

# Change risk assessment

Produce a two-axis risk breakdown for a proposed change. Do NOT write a plan, recommendation, or any implementation artifact unless the user explicitly asks.

## Default workflow

### 1. Read before asking

If repo access is available, read relevant files before asking anything:
- Source files and modules touched by the change
- Public API surface (routes, exported functions, interfaces)
- Config files and schema definitions
- Recent commit history for the affected area
- Test coverage for affected paths

Form a working picture of what the change touches. Only ask for information that cannot be inferred.

### 2. Clarify if needed

If the change description is too vague to assess, say so and list exactly what is needed. Ask one question at a time.

Minimum required inputs:

| Input | Required |
|---|---|
| Description of the proposed change | Yes |
| Affected components or files | Preferred (infer from repo if possible) |
| Intended behaviour after the change | Preferred |

### 3. Identify risks on both axes

Work through both axes. For each axis, identify every meaningful risk and describe it with three fields.

**Cost of inaction** — risks of *not* making the change:
- Existing failures, errors, or degraded behaviour
- Workarounds currently in use and their fragility
- User or system impact of the status quo continuing
- Trend: is the problem stable, worsening, or time-sensitive?

**Cost of action** — risks of *making* the change:
- Regressions in existing behaviour
- Public API changes (additions, removals, signature changes)
- Config file changes (new keys, removed keys, format changes)
- UI changes (layout, labels, flows, accessible behaviour)
- Database or schema changes (migrations, compatibility)
- Rollback difficulty
- Test coverage gaps in the affected area

Only report risks grounded in the code, config, or stated context. Do not invent risks.

### 4. Present the report

Use the output format below. Stop after presenting it. Do not add a verdict or recommendation unless the user asks.

## Output format

```
## Change Risk Assessment: <short title>

### Cost of inaction

- **Problem:** <what is currently broken, degrading, or failing>
  **Probability:** <how likely this is to affect users in practice>
  **Impact:** <who is affected and what the consequence is>

(repeat for each risk; omit section entirely if there are no inaction risks)

### Cost of action

- **Problem:** <what could break or change as a result of implementing this>
  **Probability:** <how likely this is to occur>
  **Impact:** <who is affected and what the consequence is>

(repeat for each risk)
```

If a section has no risks, state "No significant risks identified" rather than omitting it silently.

## Guardrails

- Do not write a plan, implementation steps, or code.
- Do not produce a score, rating, or verdict unless explicitly asked.
- Do not inflate or deflate probability/impact to appear thorough.
- Do not report a risk you cannot ground in the change description, repo, or stated context.
- If asked for a recommendation after the report, give one in a separate block clearly labelled **Recommendation** — keep it out of the assessment itself.
