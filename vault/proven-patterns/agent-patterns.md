---
title: Agent Patterns
type: proven-pattern
tags:
  - pattern
  - agents
---

# Agent Patterns

Proven patterns for `.claude/agents/<name>.md`.

## Frontmatter

```yaml
---
name: agent-name
description: One sentence — Claude uses this to decide when to delegate.
tools: Bash, Read, Grep, Glob
model: sonnet
color: blue
---
```

## Team Structure (proven)

| Agent | Role | Model | When to use |
|-------|------|-------|-------------|
| lead | Coordinates, delegates, presents findings | sonnet | Complex multi-step operations |
| researcher | Looks up docs, finds patterns | sonnet | Need accurate external info |
| validator | Runs checks, reports pass/fail | haiku | Quick read-only verification |

## Best Practices

- Keep agent prompts under 30 lines
- Comma-separated tools format works fine: `tools: Bash, Read, Grep`
- Lead agent needs `Agent` in tools list to spawn subagents
- Subagents pick up skills and project context automatically
- Spawning is by task description, not by agent name
- Requires `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1` in settings.json

## Output Rules (baked into all agents)

- Concise — paragraph + table, under 100 words
- Plain English — avoid jargon unless user introduced it
- Pass/fail tables for validation results
