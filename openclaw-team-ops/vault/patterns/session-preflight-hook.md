---
date: 2026-04-08
area: hooks
category: SessionStart
project: openclaw-team-ops
tags:
  - pattern
  - hooks
  - preflight
---

# Pattern — SessionStart Preflight Hook

## When to Use

Any project with Docker containers, env files, or services that need to be running. Run once on session start to report what's up/down before you start working.

## Steps

1. Create `.claude/hooks/session-preflight.sh` with 4 checks
2. Add `hooks.SessionStart` to `.claude/settings.json`
3. `chmod +x` the script
4. Dry-run with `CLAUDE_PROJECT_DIR=... bash script.sh | jq .`

## Key Implementation Details

- `set -euo pipefail` + ERR trap that always exits 0
- No stdin (SessionStart doesn't receive tool input)
- All diagnostics to stderr, single JSON `systemMessage` to stdout
- Use `$CLAUDE_PROJECT_DIR` for paths (not `$CLAUDE_PLUGIN_ROOT`)
- `|| echo 0` on `grep -c` (not `|| true`) to avoid empty string arithmetic
- `timeout 3` on `docker info` to cap slow daemon responses
- `tr -d '\n\r\t'` before JSON escaping to strip control chars
- `matcher: ""` in settings.json for SessionStart (no tool to match)

## Why It Works

One script, runs once, no blocking. Catches 4 common problems (Docker down, missing env, dead containers, port conflicts) before you waste time debugging them mid-session.

## Example

- [[sessions/2026-04-08-first-hook|First hook session]]
- [[hooks-and-rules-reference|Hooks & rules reference]]

## Related

- [[hooks-and-rules-reference]]
