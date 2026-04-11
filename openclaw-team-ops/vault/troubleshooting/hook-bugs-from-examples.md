---
date: 2026-04-08
area: hooks
severity: medium
status: resolved
tags:
  - troubleshooting
  - hooks
  - code-review
---

# Issue — Bugs Found in Hook Examples

## Symptoms

Reviewed 5 hook implementations across cloned repos. Found multiple bugs that would cause silent failures — hooks that look like they work but actually never fire or produce broken output.

## Root Cause

Common mistakes across all examples:

| Bug | Where Found | Impact |
|-----|------------|--------|
| Wrong JSON field path (`.file_path` not `.tool_input.file_path`) | protect-files.sh | Hook never blocks anything |
| `exit 2` instead of `{"decision":"block"}` | protect-files.sh | Wrong blocking signal |
| `CLAUDE_PLUGIN_ROOT` (doesn't exist) | last30days hooks.json | Script path resolves to nothing |
| `eval` with uncontrolled .env input | last30days check-config.sh | Command injection |
| Missing jq guard with `set -euo pipefail` | cross-check-reminder.sh | Script crashes on missing jq |
| `grep -c` returns exit 1 on zero matches | our first draft | Empty string arithmetic error |
| Stdout mixing (plain text + JSON) | session-start.sh | Malformed hook response |

## Fix

For our hook (session-preflight.sh):
- Used `|| echo 0` not `|| true` for grep -c
- Added `tr -d '\n\r\t'` for JSON safety
- Added `timeout 3` on docker info
- Wrapped full path in quotes in settings.json
- No stdin consumption (SessionStart doesn't receive input)

## Prevention

- Always run 3 review rounds (structure, Context7 crossref, manual line-by-line)
- Always dry-run with `| jq .` to validate JSON output
- Always use `|| echo 0` on `grep -c`, never `|| true`
- Always guard for jq if using it
- Never use `exit 2` — use `{"decision":"block"}` + `exit 0`

## Related

- [[patterns/session-preflight-hook]]
- [[patterns/hooks-and-rules-reference]]
