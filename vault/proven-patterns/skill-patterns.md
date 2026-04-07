---
title: Skill Patterns
type: proven-pattern
tags:
  - pattern
  - skills
---

# Skill Patterns

Proven patterns for `.claude/skills/<name>/SKILL.md`.

## Frontmatter

```yaml
---
name: skill-name
description: Front-load the key use case in first 250 chars. Be specific about when to trigger.
argument-hint: "[what to pass, e.g. 'topic' or 'device name']"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
---
```

## Body Structure

1. **One-line purpose** — what this skill does for `$ARGUMENTS`
2. **Workflow** — numbered steps, clear and sequential
3. **Output format** — table or structured format the user expects
4. **Rules** — constraints and guardrails

## Best Practices

- Keep under 500 lines; move references to `references/` subdirectory
- Use `$ARGUMENTS` for user input, `$0`/`$1` for positional args
- Front-load the description — first 250 chars are visible in the menu
- Use `allowed-tools` to restrict what the skill can do
- Add `disable-model-invocation: true` for destructive skills (deploy, delete)

## Reusable Patterns

- **Research skill** — check local repo first, then official docs, report with source URLs
- **Check/validate skill** — run read-only queries, report pass/fail table
- **Cross-check skill** — compare two sources (docs vs API), flag gaps
