---
title: Cisco Inventory
type: project
status: complete
start_date: 2026-04-07
pushed_date: 2026-04-07
tags:
  - project
  - cisco
  - webex
  - roomos
---

# Cisco Inventory

Manages Cisco RoomOS devices via Webex API across 16 Canadian PwC locations. Deploys macros, removes outdated macros, pushes configs, troubleshoots devices — all city-by-city with careful validation.

## What Was Built

| Component | Count | Details |
|-----------|-------|---------|
| Agents | 3 | lead (purple/sonnet), researcher (blue/sonnet), validator (green/haiku) |
| Skills | 3 | `/webex-research`, `/device-check`, `/cross-check` |
| Hooks | 2 | `check-env.sh` (token gate), `cross-check-reminder.sh` (mutation reminder) |
| Rules | 2 | `safety.md` (read-free, execute with permission), `sources.md` (official docs first) |
| MCP | 1 | Context7 with API key in `settings.local.json` |
| Vault | 3 files | `proven-commands.md`, `deployment-log.md`, `templates/daily-note.md` |

## Repos

- **Architect-kit:** `cisco-inventory/` on branch `cisco-inventory-setup`
- **Target:** [Gaya56/Cisco-Inventory (quick-macros)](https://github.com/Gaya56/Cisco-Inventory/tree/quick-macros)
- **Pushed:** 2026-04-07 — 18 files, 628 lines

## Safety Model

> [!note] Read freely, execute with permission
> All read operations (list devices, get macros, check status) auto-allowed. Mutating operations (save, activate, deactivate, remove) require user approval through the normal permission prompt. Only `rm -rf`, `git push --force`, `git reset --hard` are hard-denied.

## Key Files

| File | Purpose |
|------|---------|
| `CLAUDE.md` | 121 lines — project instructions, API reference, common commands |
| `INDEX.md` | Maps every agent, skill, hook, rule with usage |
| `.claude/settings.json` | Permissions, hooks, agent teams, plugins |
| `.claude/.mcp.json` | Context7 MCP server |

## Lessons Learned

> [!tip] See [[2026-04-07]] for the full lesson entry from this build.

Key takeaways:
- Hook JSON fields: `decision`/`reason` not `permissionDecision` — see [[hook-patterns]]
- `.env` variable names must match everywhere — grep before pushing
- `jq` permission patterns can bypass deny rules if too broad
- Always `.gitignore` first, then build
- Agent team review catches ==critical silent failures== — see [[review-checklist]]

## API Reference

%%Hidden in reading view — just for quick lookup%%

- **Base URL:** `https://webexapis.com/v1/`
- **Auth:** `Bearer $WEBEX_API_TOKEN`
- **Device naming:** `CA-<CITY_TAG>-<ROOM_NUMBER>`
- **Key endpoints:** `/devices`, `/xapi/command/Macros.Macro.*`
- **16 cities:** CALG, EDMO, VANC, TORO, MONT, OTTA, WINN, HFAX, QUEB, HAMI, KITC, LOND, VICT, SASK, REGI, STJO

## Next Operations

- [ ] PWC Help macro cleanup — find and delete outdated `PWC Help` macro across all cities
- [ ] Additional macro deployments as needed
- [ ] No PR to `main` yet — confirm with user before merging
