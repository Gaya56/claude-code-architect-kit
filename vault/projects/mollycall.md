---
title: MollyCall
type: project
status: active
start_date: 2026-04-07
pushed_date: ~
tags:
  - project
  - mollycall
  - livekit
  - zoho
---

# MollyCall

LiveKit-based voice agent system that integrates with Zoho CRM for outbound calls. Production deployment with Eris-Canada parallel development.

## What Was Built

| Component | Count | Details |
|-----------|-------|---------|
| Agents | 11 | deploy-watcher, code-inspector, test-runner, infra-ops, supabase-zoho-verifier, Pre-Brainstorm, define-it + 4 archived |
| Skills | 5 | Detach-deployment, create-outbound-workflow, save-and-compact, save-and-document, implement-one-file |
| Commands | 3 | plan-change, test-change, verify-supabase |
| Scripts | 3+ | monitor-railway.sh, supabase validation, workflow gates |
| Hooks | 0 | None yet |
| Rules | 0 | Zoho-specific rules in PRPs/Zoho/.claude/ |

## Current Status

- **Branch:** claude-architect
- **Last commit:** deploy-watcher subagent + dynamic outbound_agent_name dispatch
- **Uncommitted:** unknown — check with `/project-status`
- **Open PRs:** none known
- **Updated:** 2026-04-07

## Ideas / Inbox

- Organize repo structure — .claude/ is rich but could use cleanup
- Integrate Obsidian vault tracking
- Keep changes minimal — current setup is excellent

## Repos

- **Target:** [Gaya56/MollyCall (claude-architect)](https://github.com/Gaya56/MollyCall/tree/claude-architect)

## Lessons Learned

> [!tip] Link to lesson entries
> - (none yet — first tracking session)

## Next Steps

- [ ] Review current .claude/ layout for organization opportunities
- [ ] Add vault integration for session tracking
- [ ] Do NOT change agent behavior — it's working well
