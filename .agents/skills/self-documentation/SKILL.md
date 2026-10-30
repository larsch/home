---
name: self-documentation
description: Captures and maintains durable project knowledge for future sessions. Use when asked to capture status, save context, record what we learned, prepare a handoff, or establish project documentation.
---

# Self-documentation

Turn relevant project knowledge into concise, findable files so a future session can continue without relying on chat history. Treat “capture status/knowledge,” “handoff,” “checkpoint,” and similar requests as requests to write the knowledge to disk, not merely summarize it in chat.

## Workflow

1. **Inspect first.** Read applicable `AGENTS.md` files and relevant existing docs; inspect the current project state as needed. Reuse established locations and conventions. Do not duplicate or contradict authoritative docs.
2. **Capture what helps continuation.** Record durable context from the work so far: goal and scope, decisions and rationale, constraints, what is complete, current state, unresolved questions or risks, and concrete next steps. Include useful file paths, commands, or test results when they help someone resume. Distinguish confirmed facts from assumptions. Do not reproduce the conversation or claim work that was not verified.
3. **Write proportionately.** Update the most relevant existing document, or create a focused Markdown document when the knowledge has no suitable home. Keep `AGENTS.md` a short, stable entry point: add or update links to important context docs so future agents can find them. Avoid a prescribed docs tree, unnecessary templates, and detailed knowledge dumps in `AGENTS.md`.
4. **Check the handoff.** Verify the written status against the current project state, make links and paths usable, and ensure the next action is clear. If no durable knowledge needs recording, say so rather than inventing content.
5. **Report briefly.** State which files were updated and what a future session can find there; mention any important uncertainty or missing information.

For broader requests to establish an ongoing documentation practice, also add a concise project instruction in `AGENTS.md` to consult and maintain the linked project docs as work evolves. Do not add that standing instruction for a one-off handoff unless it is needed.