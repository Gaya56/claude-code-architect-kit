---
date: 2026-04-08
area: openclaw-team-ops
tags:
  - lesson
  - agents
  - skills
  - vault
  - code-review
---

# Lesson — OpenClaw .claude/ Buildout

## What We Built

Took openclaw-team-ops from 5.5/10 to ~7.5/10 in one session. Added obsidian subagent, researcher agent, 2 new skills, and a full vault structure.

## What Went Well

- **Plan mode first** — brainstormed vault structure before building, caught design issues early
- **Agent team reviews** — found the `user-invokable` typo and missing `.gitignore` entry
- **Official docs cross-reference** — confirmed `skills:` frontmatter injects full content at startup (critical discovery)
- **Two-step verification pattern** — WebSearch finds, Context7 confirms — good pattern for any research agent
- **Vault structure** — 4 folders with `.base` files scales well, templates enforce consistency

## What Went Wrong

- **Code-reviewer false positives** — 4 this session:
  1. Said `order:` should be `sort:` in .base files (wrong)
  2. Said `code-inspector.md` was missing (it existed)
  3. Said `skills:` is invalid agent frontmatter (it's valid and documented)
  4. Said `enabledPlugins` is invalid in settings.json (it's valid)
- **Always verify reviewer claims** against the actual spec or skill reference before acting
- **`agent:` field in skill frontmatter** — IDE diagnostic confirmed it's not supported, despite one doc check saying it was. Trust IDE diagnostics over web searches.
- **`context: fork`** — also not a valid skill field per IDE diagnostics. Removed.

## Key Discovery

`skills:` in agent frontmatter **injects the full SKILL.md content at startup**. Mentioning skills in body text does nothing. This is critical for agents that need domain knowledge (obsidian-markdown, obsidian-bases, defuddle).

## Pattern: Agent Knowledge Flow

```
researcher (WebSearch + Context7) → main agent (approval) → obsidian (vault storage)
```

Each agent has one job. Main agent is the quality gate.
