---
title: Review Checklist
type: proven-pattern
tags:
  - pattern
  - review
---

# Post-Build Review Checklist

Run this after building any `.claude/` setup. Use agent team (code-reviewer) for automated check.

## Structure

- [ ] All YAML frontmatter has required fields (name, description)
- [ ] settings.json is valid JSON (`jq .`)
- [ ] .mcp.json is valid JSON if present
- [ ] Hook scripts are executable (`chmod +x`)
- [ ] Hook scripts have `#!/usr/bin/env bash` and `set -euo pipefail`

## Security

- [ ] No API keys in committed files
- [ ] `.gitignore` covers `.env` and `settings.local.json`
- [ ] `.mcp.json` uses `$VAR_NAME` references, not hardcoded keys
- [ ] `git check-ignore -v` confirms sensitive files are ignored
- [ ] Permission patterns aren't overly broad (no `Bash(* | jq *)`)

## Consistency

- [ ] CLAUDE.md mentions all skills, agents, hooks
- [ ] Variable names match across all files (e.g., `WEBEX_API_TOKEN` everywhere)
- [ ] Rules align with what CLAUDE.md says
- [ ] Agent tool lists include what they actually need

## Hooks

- [ ] JSON uses `decision`/`reason` fields (not `permissionDecision`)
- [ ] `exit 0` used for both pass and block (JSON is the signal)
- [ ] jq availability guarded with `command -v jq`
- [ ] Both `-X POST` and `--request POST` matched for curl detection
- [ ] Each hook under 200ms execution time

## Cross-References

- [ ] INDEX.md maps every file
- [ ] CLAUDE.md accurately lists all skills, agents, and rules
- [ ] All wikilinks in vault resolve to real files
