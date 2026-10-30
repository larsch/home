---
name: gitea-cli
description: uses the `tea` command line tool to interact with Gitea for authentication, repository inspection, issues, pull requests, and lightweight project automation. use when a user asks to work with gitea from terminal, script routine gitea actions, or troubleshoot `tea` usage and login context.
---

# Gitea CLI (`tea`)

Use this skill to perform Gitea operations with the `tea` CLI.

## Dependencies and assumptions

- `tea` is installed and available in `PATH`.
- The target Gitea instance is reachable from the current environment.
- At least one `tea` login is configured.

If any dependency is missing, stop and report exactly what is missing.

## Login context

Start by checking available logins and identifying the relevant one.

- Run `tea login list` to see configured logins.
- Use the login marked `true` under DEFAULT unless the user specifies otherwise.
- Pass `--login <name>` only when using a non-default login.
- If no login is configured, stop and ask the user to set one up with `tea login add`.

## Default workflow

1. Confirm target context: host, owner/org, repository, and intent.
2. Check `tea login list` and identify the active login.
3. Run the smallest command that proves context is correct.
4. Execute the requested action.
5. Show concise result evidence (IDs, URLs, status).
6. If automating, provide copy-paste-safe commands with placeholders.

## Core command patterns

Run `tea help` or `tea <subcommand> --help` before guessing flags — this
version of `tea` differs from docs in several places.

```bash
# check install and version
tea --version

# list configured logins
tea login list

# add or update login (interactive when possible)
tea login add

# NOTE: tea whoami does NOT support --login; it shows whichever login is active
tea whoami

# repo operations
tea repos ls
tea repo view <owner>/<repo>

# issues — list
tea issues ls --repo <owner>/<repo>

# issues — view a single issue (pass index as positional arg, not a subcommand)
tea issues <number> --repo <owner>/<repo>

# issues — view with comments
tea issues <number> --repo <owner>/<repo> --comments

# issues — create
# flag is --description / -d  (NOT --body)
tea issues create --repo <owner>/<repo> \
  --title "Short title" \
  --description "Full description text"

# issues — add a comment (subcommand is `tea comment`, NOT `tea issues comment`)
# body is a positional argument, NOT a flag
tea comment <number> "Comment body text" \
  --repo <owner>/<repo>

# pull requests
tea prs ls --repo <owner>/<repo>
tea pr view <number> --repo <owner>/<repo>
tea pr create --repo <owner>/<repo> \
  --title "..." --description "..."
```

Prefer explicit `--repo <owner>/<repo>` when working across multiple repositories.

Use `--login <name>` only when targeting a non-default login.

## Safety rules

- Verify login context with `tea login list` before running commands.
- Avoid destructive actions unless explicitly requested.
- For write operations, echo the exact target repo and object before running.
- Capture and report stderr clearly when `tea` fails.
- If command support differs by `tea` version, report the version and adapt.

## Troubleshooting checklist

1. `tea --version`
2. `tea login list` (confirm login exists)
3. `tea whoami` (note: no `--login` flag supported)
4. Re-run with explicit `--repo` and `--login <name>` if targeting a non-default account.
5. If auth fails, refresh the login token and retry.
6. When a flag is rejected, run `tea <subcommand> --help` to see the exact flag names — they often differ from docs.

## Completion criteria

- Requested Gitea action completed (or blocked with a clear reason).
- Output includes enough evidence for the user to verify the result.
- Any reusable command sequence is shared in a safe, parameterized form.
