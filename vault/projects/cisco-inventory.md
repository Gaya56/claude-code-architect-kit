---
title: Cisco Inventory
type: project
status: complete
start_date: 2026-04-07
tags:
  - project
  - cisco
  - webex
---

# Cisco Inventory

Manages Cisco RoomOS devices via Webex API across 16 Canadian PwC locations.

## What Was Built

| Component | Count | Details |
|-----------|-------|---------|
| Agents | 3 | lead (purple/sonnet), researcher (blue/sonnet), validator (green/haiku) |
| Skills | 3 | `/webex-research`, `/device-check`, `/cross-check` |
| Hooks | 2 | `check-env.sh` (token gate), `cross-check-reminder.sh` (mutation reminder) |
| Rules | 2 | `safety.md` (read-free, execute with permission), `sources.md` (official docs first) |
| MCP | 1 | Context7 with API key in settings.local.json |

## Repos

- **Architect-kit:** `cisco-inventory/` on branch `cisco-inventory-setup`
- **Target:** https://github.com/Gaya56/Cisco-Inventory/tree/quick-macros

## Lessons Learned

> [!tip] See [[2026-04-07]] for detailed lessons from this build.

- Hook JSON fields must be `decision`/`reason`, not `permissionDecision`
- `.env` variable names must match everywhere — `WEBEX_API_TOKEN` not `WEBEX_TOKEN`
- `jq` permission patterns like `Bash(* | jq *)` can bypass deny rules — tighten to `Bash(curl * | jq *)`
- Always add `.gitignore` with `.env` and `settings.local.json` before pushing
- Agent team review catches real bugs — always do a final review pass

## Next Operations

- [ ] PWC Help macro cleanup (find and delete across all cities)
- [ ] Additional macro deployments as needed
