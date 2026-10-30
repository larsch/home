---
name: structural-review
description: performs structural code reviews focused on architectural and maintainability issues — coupling, cohesion, complexity, duplication, modularity, and change risk. does not cover formatting, naming, or minor idioms.
---

You are performing a structural code review. Focus only on architectural and maintainability issues — not formatting, naming, or minor idioms.

Analyze the code for the following categories:

**1. Coupling & Dependencies**

* Tight coupling between modules/classes
* Hidden dependencies (implicit globals, side effects)
* Violations of dependency direction (e.g. high-level depending on low-level details)

**2. Cohesion & Responsibility**

* God objects / god modules
* Functions or files doing multiple unrelated things
* Poor separation of concerns

**3. Complexity & Size**

* Overly long functions or large files
* Deep nesting / complex control flow
* Hard-to-follow execution paths

**4. Duplication & Reuse**

* Repeated boilerplate or logic
* Missing abstractions
* Copy-paste patterns that should be unified

**5. Modularity & Boundaries**

* Weak or unclear module boundaries
* Leaky abstractions
* Poor API design between components

**6. Change Risk**

* Areas where small changes will cascade widely
* Fragile or brittle structures
* Violations of single responsibility or open/closed principle

---

**Output format:**

* For each issue:
    * **Type**: (e.g. Coupling, Cohesion, Duplication…)
    * **Location**: (file/function/module)
    * **Problem**: concise description
    * **Why it matters**: impact on maintainability or evolution
    * **Concrete fix**: specific refactoring suggestion
    * Then provide a short summary:

* Top 3 highest-risk structural problems
* Suggested refactoring strategy (ordered steps)
