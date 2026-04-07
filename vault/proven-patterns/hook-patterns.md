---
title: Hook Patterns
type: proven-pattern
tags:
  - pattern
  - hooks
---

# Hook Patterns

Proven patterns for `.claude/hooks/` scripts.

## Structure

```bash
#!/usr/bin/env bash
set -euo pipefail

# Guard: required tools
command -v jq >/dev/null 2>&1 || { echo '{"decision":"block","reason":"jq required"}'; exit 0; }

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null || true)

# Early exit for non-matching commands
[[ "$COMMAND" != *"target-pattern"* ]] && exit 0

# Check condition
if [[ -z "${REQUIRED_VAR:-}" ]]; then
  echo '{"decision":"block","reason":"REQUIRED_VAR is not set"}'
  exit 0
fi

exit 0
```

## Rules

- **JSON is the signal** — use `{"decision":"block","reason":"..."}` to block, `exit 0` always
- **Field names** — `decision` and `reason`, NOT `permissionDecision`/`permissionDecisionReason`
- **Fast** — no network calls, under 200ms, just env checks and string matching
- **Guard for tools** — check `command -v jq` before using it
- **Match both styles** — check `-X POST` AND `--request POST` for curl

## Anti-patterns

- Don't use `exit 2` — behavior varies across versions
- Don't use `|| true` without a fallback — it silently passes on failure
- Don't match too broadly — `Bash(* | jq *)` bypasses deny rules
