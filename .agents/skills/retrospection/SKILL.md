---
name: retrospection
description: reflects informally on what went wrong in an agent session, identifies likely misunderstandings and missing information, and suggests small practical mitigations across skills, AGENTS.md guidance, and tool usage to reduce repeated mistakes.
---

# Retrospection

Use this skill after a confusing, failed, or frustrating session when the goal is to learn quickly and reduce repeat mistakes.

Keep the tone informal and practical. Do not run a heavy postmortem unless the user asks.

## Default flow

1. State the observed failure in plain language, using evidence from the session where available.
2. Explain the causal chain, distinguishing observed facts from hypotheses:
   - what behavior occurred
   - what ambiguity, omission, or process failure enabled it
   - why the existing instruction did not prevent it
3. Identify the specific instruction, workflow, or tool-use gap.
4. Inspect the applicable instruction layers separately:
   - the relevant skill or task instructions
   - local `AGENTS.md` instructions
   - global `AGENTS.md` instructions
   - tool or runtime constraints, if relevant
5. For each layer that could have prevented the failure, propose a concrete mitigation at that layer. Prefer exact wording to add, replace, or remove, and name the target file or section. If no layer needs changing, explain why rather than omitting the analysis.
6. Explain how future recurrence or relapse would be detected.
7. Prioritize the top 1–3 changes with the best effort-to-impact ratio.

A retrospection is incomplete if it only expresses an intention or promise to remember, be more careful, or do better. It must identify at least one cause and one actionable mitigation. A reminder about the desired behavior is not a mitigation unless it is tied to a specific instruction location and enforceable checkpoint. When the user asks for retrospection on this skill itself, inspect this skill's wording for ambiguity and missing enforcement rather than merely promising to follow it.

## Output format

- **What seemed off**
- **Why it likely happened**
- **Instruction-layer analysis**
  - Skill/task instructions: ...
  - Local `AGENTS.md`: ...
  - Global `AGENTS.md`: ...
  - Tools/runtime: ...
- **How to reduce recurrence** (3–5 concrete bullets, each naming a target location and exact change where practical)

The instruction-layer analysis is required, not optional. Do not collapse it into general advice. A valid mitigation should look like “in `<path>`, replace/add `<wording>` because `<mechanism>`,” or explain why changing that layer would not help.

## Guardrails

- Use evidence from the session when available; quote or paraphrase it. Label explanations without direct evidence as hypotheses.
- Focus on behavior and process, not blame.
- Prefer small edits and habits over large redesigns, but make the mitigation specific enough to apply.
- Do not treat a promise to remember or be more careful as a mitigation.
- If details are missing, state the assumption and continue with the strongest bounded analysis rather than giving generic reassurance.
- Before finishing, check that the response contains at least one observed or hypothesized cause, one concrete mitigation, and one way to detect recurrence.
- Before finishing, check that the response explicitly considered skill/task instructions, local `AGENTS.md`, global `AGENTS.md`, and relevant tools/runtime constraints. If a layer is not applicable, say so explicitly.

## Quick mitigation ideas

- Add one trigger phrase or guardrail sentence to the relevant skill.
- Add one escalation/checkpoint rule to `AGENTS.md`.
- Add one tool sanity check before relying on a result.
- Ask one early alignment question when ambiguity is high.
