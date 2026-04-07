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
| Agents | 1 | code-inspector |
| Skills | 2 | save-and-compact, save-and-document |
| Hooks | 0 | None yet |
| Rules | 0 | None yet |

## Current Status

- **Branch:** claude-architecture
- **Last commit:** Merge PR #1 from peyman branch + code-inspector improvements
- **Uncommitted:** unknown — check with `/project-status`
- **Open PRs:** none known
- **Updated:** 2026-04-07

> [!warning] settings.local.json is committed
> Should be added to .gitignore — may contain API keys or personal overrides.

## Ideas / Inbox

- Add hooks and rules to strengthen the setup
- Improve agent configuration — keep current behavior, enhance capabilities
- Gitignore settings.local.json
- Has `.github/agents/` and `.github/instructions/` alongside `.claude/` — review for conflicts

## Repos

- **Target:** [Gaya56/openclaw-team-ops (claude-architecture)](https://github.com/Gaya56/openclaw-team-ops/tree/claude-architecture)

## Lessons Learned

> [!tip] Link to lesson entries
> - (none yet — first tracking session)

## Next Steps

- [ ] Review current behavior before making changes
- [ ] Plan enhancements — hooks, rules, additional agents
- [ ] Fix settings.local.json gitignore issue
- [ ] Preserve what's working — user likes current behavior
