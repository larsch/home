---
name: authoring-skills
description: creating or reviewing SKILL.md files. use when writing a new skill, revising an existing SKILL.md, auditing a skill library, or diagnosing why a skill is not being selected or used correctly.
---

# Skill authoring and review

## Operating rules

- Keep instructions concise. Remove background the model can already infer.
- Put discovery logic in `description`. Do not spend body space on a generic "when to use this skill" section.
- Treat `description` as a retrieval hook, not a full contract. Optimize for selection, not completeness.
- Prefer a short `description`: usually one sentence, optionally a second sentence with concrete trigger phrases.
- Keep nuance, workflow, caveats, and most exclusions out of `description` unless they are needed to distinguish this skill from nearby competing skills.
- Treat `SKILL.md` as the control plane. Keep it compact and move large detail into supporting files only when that improves reliability.
- Link every supporting file directly from `SKILL.md`. Do not create nested chains of references.
- Use consistent terminology throughout the skill.
- Use forward-slash paths only.
- Avoid time-sensitive wording. If legacy behavior matters, isolate it under an `Old patterns` section.
- Provide one sensible default approach. Mention alternatives only when a real escape hatch is needed.
- Do not assume tools, packages, connectors, or runtimes exist. State dependencies and verification steps explicitly.
- Ask only the minimum clarifying questions required for a reliable design. Otherwise proceed with explicit assumptions.

## Choose the right level of specificity

- Use high freedom for analysis, drafting, and review tasks where multiple approaches can work.
- Use medium freedom when a preferred structure exists. Provide a template, pseudocode, or a small number of examples.
- Use low freedom when the task is fragile, repetitive, or must be executed in one exact way. Prefer a specific script or command.

## Workflow for creating a new skill

1. Identify the actual job to be done.
   - Extract representative user requests.
   - Identify expected inputs, outputs, constraints, tools, and failure modes.
   - If the request is underspecified, make minimal reasonable assumptions and state them.

2. Define the smallest useful skill.
   - Write only the instructions needed to close observed gaps.
   - Avoid documenting generic domain knowledge the model likely already knows.
   - Prefer one reusable skill over a one-off prompt only when the pattern is repeatable.

3. Decide the skill shape.
   - Choose a short, specific `name` in lowercase letters, numbers, and hyphens.
   - Prefer an activity-oriented or gerund-style name when it improves clarity.
   - Write `description` in third person.
   - Make `description` a selection signal. Name the task type, problem domain, or situation the skill handles. Omit internal mechanism (how the skill works, which other skills invoke it, what steps it performs). Explicit "use when" trigger phrases are welcome but not required; clear task-domain framing is equally effective.
   - Prefer the shortest `description` that still selects reliably.
   - Do not use `description` to restate workflow, rationale, or detailed boundaries unless they are needed to disambiguate from another skill.
   - Keep YAML frontmatter limited to `name` and `description`.

4. Draft the body.
   - Start with the default workflow.
   - Add templates only when output structure matters.
   - Add examples only when output quality depends on seeing examples.
   - Add checklists for complex multi-step tasks.
   - Add validation loops for quality-critical tasks.
   - Do not include a long catalog of options.

5. Plan supporting files only if they earn their cost.
   - Use `references/` for schemas, policies, domain rules, or extended examples.
   - Use `scripts/` for fragile or repetitive operations that should be executed rather than rewritten.
   - Use `assets/` only for files needed in outputs.
   - Name files descriptively so the model can discover them easily.
   - If any reference file is likely to exceed 100 lines, add a table of contents at the top.

6. Build evaluation cases before expanding documentation.
   - Create at least three realistic scenarios: a normal case, an edge case, and a failure-prone case.
   - Define what success looks like for each scenario.
   - Prefer real usage patterns over synthetic toy prompts.

7. Deliver the result in the format the user asked for.
   - If the user asked for `SKILL.md`, return the file content directly.
   - If the skill clearly needs supporting files, provide a compact file tree and short stubs or notes for each file.
   - Call out any assumptions, omitted runtime-specific constraints, or unverified dependencies.

## Workflow for reviewing an existing skill

1. Read the whole skill surface that matters.
   - Read `SKILL.md` first.
   - Read every file linked directly from `SKILL.md`.
   - Read scripts only when behavior, dependencies, or failure handling must be checked.

2. Diagnose discovery quality.
   - Is the `name` specific and easy to understand at a glance?
   - Does the `description` name the task type, problem domain, or situation the skill handles?
   - Is internal mechanism absent — no description of how the skill works, which skills invoke it, or what steps it performs?
   - Is the `description` written in third person and packed with relevant key terms?
   - Are important task-domain terms missing from the only field used for selection?
   - Is the `description` shorter than the body-level explanation it is trying to replace?
   - Could the `description` be cut in half without harming selection?
   - Are exclusions present only where they improve disambiguation?

3. Diagnose instruction quality.
   - Is the body concise and focused on non-obvious guidance?
   - Does it give a clear default path?
   - Does it match the right level of specificity to the task?
   - Does it avoid unnecessary explanations and excessive alternatives?

4. Diagnose information architecture.
   - Is `SKILL.md` still small enough to act as an overview?
   - Are large details pushed into supporting files?
   - Are references one level deep from `SKILL.md`?
   - Are filenames descriptive and easy to navigate?
   - Do longer reference files expose their contents early with a table of contents?

5. Diagnose execution support.
   - Do scripts solve real problems instead of punting work back to the model?
   - Are dependencies explicit?
   - Are validation and error-handling steps present where failures are costly?
   - Are commands and paths portable and unambiguous?

6. Diagnose content hygiene.
   - Is terminology consistent?
   - Is time-sensitive information avoided or isolated as legacy material?
   - Are examples concrete rather than abstract?
   - Are there any hidden assumptions about runtime tools or package availability?

7. Diagnose evaluation coverage.
   - Are there at least three realistic evaluation scenarios?
   - Is there evidence of iteration from observed failures or user reports?
   - If the skill has known failures, are fixes aimed at those failures rather than general polish?

8. Prioritize and fix.
   - Rank issues as blocker, high, medium, or low.
   - Prioritize in this order: discovery failures, wrong-task execution, navigation failures, missing validation, then style or polish.
   - Prefer the smallest edit that fixes the observed problem.
   - When repeated behavior suggests a structural issue, promote critical content into `SKILL.md` or make references more explicit.

## Output patterns

### When asked to author or rewrite a skill

Return, in this order:

1. `SKILL.md`
2. Optional file tree for any supporting files that are clearly justified
3. Evaluation cases
4. Short notes on assumptions or runtime-specific caveats

### When asked to review a skill

Return, in this order:

1. Verdict
2. What is likely to work
3. What is likely to fail and why
4. Ranked issues
5. Exact fixes
6. Revised `SKILL.md` or a patch, if requested

## Description example

- Too long: `Steers diagnosis of bugs, errors, crashes, and unexpected behavior away from premature code changes and toward systematic evidence gathering...`
- Better: `Investigates bugs, errors, crashes, test failures, and unexplained broken behavior. Use for requests like 'help me debug' or 'this is failing'.`

## Review checklist

Copy this when useful:

```markdown
Skill review
- [ ] `name` is short, specific, and valid for the target runtime
- [ ] `description` names the task type, problem domain, or situation — not the internal mechanism
- [ ] `description` contains the main task-domain terms
- [ ] `description` uses third person
- [ ] `description` is optimized for retrieval and is not carrying body-level detail
- [ ] `SKILL.md` stays concise and focused on non-obvious guidance
- [ ] Default workflow is easy to follow
- [ ] Supporting files are linked directly from `SKILL.md`
- [ ] Long references have a table of contents
- [ ] Terminology is consistent
- [ ] Time-sensitive content is absent or isolated
- [ ] Examples are concrete
- [ ] Scripts handle errors and list dependencies
- [ ] Validation steps exist for fragile operations
- [ ] Paths use forward slashes
- [ ] At least three realistic evaluation cases exist
```
