---
name: setup-python-project
description: setting up or modernising a Python project with uv, ruff, and pytest. use when initialising a new project or converting from legacy tooling (setup.py, requirements.txt, tox, flake8, black).
---

# Set up a Python project

## Requirements

- `uv` installed on the host (`curl -LsSf https://astral.sh/uv/install.sh | sh` or `brew install uv`)
- Python already installed system-wide (uv will use it; do not let uv manage or download Python)

## Default workflow

1. **Init the project**

   ```sh
   uv init <project-name>   # creates pyproject.toml, src layout, .gitignore
   cd <project-name>
   ```

   Use `--lib` for a library (adds `__init__.py`, no `main.py`).
   Use `--app` (default) for a script or service.

   Delete `.python-version` if uv created one — the system Python is used as-is.

2. **Add dev dependencies**

   ```sh
   uv add --dev ruff pytest pytest-cov
   uv add rich
   ```

3. **Configure ruff and pytest in `pyproject.toml`**

   Append the sections below — see [references/pyproject-snippets.toml](references/pyproject-snippets.toml) for copy-paste blocks.

   Key ruff settings:
   - `target-version` — set to match the system Python minor version (e.g. `"py312"` for Python 3.12); check with `python --version`
   - `line-length = 160`
   - Enable rules: `["E", "F", "I", "UP", "B", "SIM"]`
   - `fix = true`

   Key pytest settings:
   - `testpaths = ["tests"]`
   - `addopts = "--tb=short --strict-markers"`

4. **Create the test directory**

   ```sh
   mkdir tests && touch tests/__init__.py tests/test_placeholder.py
   ```

5. **Set up rich exception formatting**

   Create `sitecustomize.py` in the project root:

   ```python
   from rich.traceback import install

   install(show_locals=True)
   ```

   This gives rich-formatted tracebacks in all `uv run` invocations automatically.

6. **Use rich for output and logging**

   Prefer `rich` over plain `print` and the standard `logging` module throughout the codebase:

   - **stdout** — use `from rich import print` or a shared `rich.console.Console()` instance for all user-facing output.
   - **logging** — install the rich logging handler early in the entry point:

     ```python
     import logging
     from rich.logging import RichHandler

     logging.basicConfig(level=logging.INFO, handlers=[RichHandler()])
     ```

   Apply this wherever output quality matters (CLIs, scripts, services). Plain `print` and bare `logging.basicConfig()` without `RichHandler` are discouraged.

6. **Verify the setup**

   ```sh
   uv run ruff check .
   uv run ruff format --check .
   uv run pytest
   ```

   All three must exit 0 before the project is considered ready.

7. **Commit**

   Stage and commit with a `feat: init project` conventional commit message.

## Src layout vs flat layout

| Situation | Layout |
|---|---|
| Installable library or package | `src/<package>/` (default from `uv init --lib`) |
| Application / script / service | flat `<project>/` or no package at all |

For libraries, verify imports work: `uv run python -c "import <package>"`.

## Guardrails

- Do not create `requirements.txt`, `setup.py`, `setup.cfg`, or `tox.ini`.
- Do not install ruff or pytest globally — keep them in `[dependency-groups]` or `[project.optional-dependencies]` under `dev`.
- Do not set `python_requires` below 3.10.
- Do not use `black`, `isort`, `flake8`, or `mypy` — ruff covers linting, formatting, and import sorting.
- Always run the three verification commands before declaring setup complete.
