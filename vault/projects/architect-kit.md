---
title: Architect Kit
type: project
status: active
start_date: 2026-04-07
tags:
  - project
  - architect-kit
  - templates
---

# Architect Kit

Master template library for `.claude/` configuration. Builds and tests setups here, then copies or symlinks them into target projects.

## What Was Built

| Component | Count | Details |
|-----------|-------|---------|
| Agents | 3 | researcher (sonnet), code-reviewer (sonnet), test-runner (haiku) |
| Skills | 10 | commit, review-pr, explain-code, doc-research, save-and-document, save-and-compact, update-vault, obsidian-markdown, obsidian-bases, project-status |
| Hooks | 0 | None yet |
| Rules | 2 | code-style, security |
| MCP | 1 | Context7 |

## Current Status

- **Branch:** cisco-inventory-setup
- **Last commit:** 1a956c3 docs: update vault with full session lessons and project status
- **Uncommitted:** pending — project tracking additions
- **Open PRs:** none
- **Updated:** 2026-04-07

## Ideas / Inbox

- Project planner skill — agents gather data, store structured project ideas
- Add json-canvas skill for visual dependency maps
- Explore `/schedule` for automated status snapshots

## Repos

- **Architect-kit:** root `/` on branch `cisco-inventory-setup`
- **Target:** Multiple — this is the template source

## Lessons Learned

> [!tip] Link to lesson entries
> - [[2026-04-07]]

## Next Steps

- [ ] Test `/project-status` skill
- [ ] Commit project tracking additions
- [ ] Consider PR to main after testing
