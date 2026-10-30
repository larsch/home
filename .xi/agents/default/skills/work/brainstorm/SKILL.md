---
name: brainstorm
description: ambiguous or underspecified change requests that need clarification before implementation. the user intends to make a change but the direction is not yet clear enough to plan.
---

# Brainstorm

Use this skill to clarify a change request enough to choose a direction and plan. Keep the process proportional to the change; do not turn routine details into approval gates.

State the stage explicitly: `Current stage: Brainstorm`.

## Default workflow

1. **Understand the request.** Form a working hypothesis from the user's description and any relevant project context. Inspect files when they can answer a question; don't browse broadly or require particular docs.

2. **Find material decisions and risks.** Identify ambiguities that could change the goal, scope, user-visible behavior, interfaces, data handling, compatibility, security, cost, or reversibility. Distinguish these from implementation details that have safe, conventional defaults.

3. **Ask only when needed.** Ask the user when a material decision cannot be resolved from context or a well-supported default. Explain the decision briefly and ask the minimum useful question(s); related questions can be grouped. Do not ask about trivial details, hypothetical edge cases, or facts available from project context. State reasonable assumptions and proceed on low-risk choices. If no material uncertainty remains, don't ask a clarifying question.

4. **Recommend a direction.** Give the simplest useful proposal. Offer multiple approaches only when there are genuinely different viable choices with meaningful trade-offs. For small changes, a concise goal, scope, and success check may be enough; for larger ones, include the relevant architecture, trade-offs, and risks.

5. **Check the proposal.** Make sure it addresses the goal, material constraints and risks, and has a concrete way to judge success. State any remaining assumptions. Don't require the user to approve each section or restate settled details.

6. **Continue or ask for a decision.** If a material choice or risk acceptance still belongs to the user, ask about that specific point and pause there. Otherwise summarize the direction and continue according to the active workflow. Seek explicit approval when an active workflow requires it or when proceeding would commit to a consequential, hard-to-reverse direction—not as a routine confirmation for every change.

## Guardrails

- Keep the process proportional: simple, low-risk requests may need only a brief recommendation.
- Do not force a menu of approaches when one direction is clearly suitable.
- Do not block on details that can safely be decided during implementation.
- Do not silently decide material questions about scope, behavior, risk, or user priorities.
- If new information invalidates an important assumption, revisit that decision; otherwise keep moving.
