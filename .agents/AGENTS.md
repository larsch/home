# AGENTS.md

## Efficient tool and command use

Keep necessary safety and review gates, but minimize needless command-by-command tool calls:

- Run independent checks in parallel when their results do not depend on each other.
- Batch related read-only checks into one tool call where practical.
- When command order matters, use one command invocation with `&&` between steps so failures stop the sequence.
- Preserve human review gates: do not combine commands in a way that skips inspection before modifying, staging, committing, or pushing, or skips verification afterward.
- Avoid rerunning checks already covered by a successful aggregate check unless needed to diagnose a failure.

If anything is unclear, ambiguous, or difficult to resolve confidently, stop and ask the user instead of guessing or proceeding.

Before asking, think about what would actually help the user give you a good answer, and ask for that specifically — clarify what you know, what you don't, and what you need from them to continue.
