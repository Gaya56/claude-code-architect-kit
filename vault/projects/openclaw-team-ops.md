---
title: openclaw-team-ops
type: project
status: active
start_date: 2026-04-07
pushed_date: ~
tags:
  - project
  - openclaw
  - team-ops
---

# openclaw-team-ops

Team operations repo built around openclaw (git submodule). Manages per-member AI agent workspaces, task assignments, and operating context.

## What Was Built

| Component | Count | Details |
|-----------|-------|---------|
| Agents | 3 | code-inspector, obsidian, researcher |
| Skills | 4 | save-and-compact, save-and-document, defuddle, openclaw-search |
| Vault | 4 folders | sessions, decisions, troubleshooting, patterns + bases |
| Hooks | 0 | None yet |
| Rules | 0 | None yet |

## Current Status

- **Branch:** claude-architecture
- **Rating:** ~7.5/10 (was 5.5/10)
- **Last push:** 2026-04-08 — agents, skills, vault, save-and-compact update
- **Open PRs:** none
- **Updated:** 2026-04-08

## Ideas / Inbox

- Brainstorm hooks — health checks, session start, safety guards
- Brainstorm rules — code-style, security, docker-safety
- Has `.github/agents/` and `.github/instructions/` alongside `.claude/` — review for conflicts

## Repos

- **Target:** [Gaya56/openclaw-team-ops (claude-architecture)](https://github.com/Gaya56/openclaw-team-ops/tree/claude-architecture)

## Lessons Learned

> [!tip] Link to lesson entries
> - [[2026-04-08-openclaw-buildout]] — Full buildout session, code-reviewer false positives, skills frontmatter discovery

## Completed

- [x] Review current behavior before making changes
- [x] Add obsidian agent + vault structure
- [x] Add researcher agent + openclaw-search skill
- [x] Update save-and-compact with full template
- [x] Fix settings.local.json gitignore issue
- [x] Push to claude-architecture branch

## Next Steps

- [ ] Brainstorm and add hooks
- [ ] Brainstorm and add rules
- [ ] Review .github/agents/ for conflicts with .claude/agents/
