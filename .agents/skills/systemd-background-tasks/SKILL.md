---
name: systemd-background-tasks
description: guides the AI to spawn background tasks using systemd-run and monitor them with journalctl instead of shell job control (& background jobs, nohup, screen, tmux, disown). use when a background process, long-running command, or daemon-like task needs to be launched from a shell session in a systemd-managed environment.
---

# Background tasks with systemd-run and journalctl

Prefer `systemd-run` over shell job control (`&`, `nohup`, `disown`, `screen`, `tmux`) for background tasks. systemd manages the lifecycle, captures stdout/stderr, survives shell exit, and makes logs queryable.

## Spawning a background task

### Transient user service (default choice)

```sh
systemd-run --user --unit=<unit-name> --remain-after-exit \
  -- <command> [args...]
```

- `--user` — runs in the user's systemd manager; no root needed.
- `--unit=<unit-name>` — stable name; omit to get an auto-generated one.
- `--remain-after-exit` — keeps the service queryable after the process exits.

### Transient system service (when root or system scope is needed)

```sh
sudo systemd-run --unit=<unit-name> --remain-after-exit \
  -- <command> [args...]
```

### Useful extra flags

| Flag | Purpose |
|------|---------|
| `--working-directory=<path>` | Set working directory |
| `--setenv=KEY=VALUE` | Pass an environment variable |
| `--property=Restart=on-failure` | Auto-restart on failure |
| `--property=RuntimeMaxSec=3600` | Kill after 1 hour |
| `--collect` | Auto-remove unit when it stops (no `--remain-after-exit` needed) |
| `--pty` | Allocate a pseudo-terminal (interactive commands) |
| `--pipe` | Connect stdin/stdout/stderr to the calling terminal |
| `--scope` | Run as a scope instead of a service (no restart, no journal capture) — avoid unless you need it |

## Monitoring and logs

```sh
# Live log tail for a user service
journalctl --user -u <unit-name> -f

# Full log dump
journalctl --user -u <unit-name> --no-pager

# System service logs
journalctl -u <unit-name> --no-pager

# Check current status
systemctl --user status <unit-name>

# List running transient services
systemctl --user list-units --type=service --state=running
```

## Stopping and cleaning up

```sh
# Stop the service
systemctl --user stop <unit-name>

# Remove the transient unit (if --remain-after-exit was used)
systemctl --user reset-failed <unit-name>

# Stop and remove in one step (when --collect was used, cleanup is automatic)
```

## Decision rules

1. **No root, no persistence across reboots → `systemd-run --user`** (default).
2. **Needs system resources or root → `systemd-run` (system scope)**.
3. **Short-lived fire-and-forget → add `--collect`** to auto-clean the unit.
4. **Long-lived or monitored task → add `--remain-after-exit` and a stable `--unit` name**.
5. **Never use `&`, `nohup`, `disown`** — they lose the process on shell exit, discard stderr, and are not inspectable.
6. **Never use `screen` or `tmux`** unless the task genuinely requires an interactive terminal that must survive disconnection; even then, prefer `--pty` with a transient service.

## Verification steps

After spawning:
1. `systemctl --user status <unit-name>` → confirm `active (running)` or `active (exited)`.
2. `journalctl --user -u <unit-name> --no-pager` → confirm expected output lines appear.
3. If the unit failed: `journalctl --user -u <unit-name> -n 50 --no-pager` for diagnostics.

## Common pitfalls

- **Command not found**: `systemd-run` inherits a minimal environment. Use full paths or `--setenv=PATH=...`.
- **Working directory wrong**: always pass `--working-directory=` explicitly.
- **No output visible**: omit `--scope`; only `service` units write to the journal.
- **Unit name collision**: if reusing a name, run `systemctl --user stop <name>` and `systemctl --user reset-failed <name>` first.
- **User lingering off**: transient user services stop when the user logs out. Enable lingering once if persistence is needed: `loginctl enable-linger $USER`.
