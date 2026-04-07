# Cisco Inventory — Setup Index

Complete map of the `.claude/` configuration for this repo.

## Skills

| Skill | Invoke | Purpose |
|-------|--------|---------|
| webex-research | `/webex-research [topic]` | Search official Webex, RoomOS, Cisco docs for API endpoints, commands, and patterns |
| device-check | `/device-check [device or city]` | Check device status, list macros, verify operations. Read-only by default |
| cross-check | `/cross-check [topic]` | Compare research findings vs validation results. Flags gaps before executing |

## Agents

| Agent | Color | Model | Role |
|-------|-------|-------|------|
| lead | purple | sonnet | Coordinates operations. Delegates research and validation to subagents. Manages city-by-city workflow |
| researcher | blue | sonnet | Looks up official Cisco, Webex, RoomOS documentation. Returns findings with source URLs |
| validator | green | haiku | Runs read-only Webex API checks. Reports structured pass/fail tables |

## Hooks

| Hook | Event | What it checks |
|------|-------|---------------|
| check-env.sh | PreToolUse (Bash) | Blocks Webex API calls if `$WEBEX_API_TOKEN` is not set |
| cross-check-reminder.sh | PreToolUse (Bash) | Reminds to `/cross-check` before mutating API calls |

## Rules

| Rule | Scope | What it enforces |
|------|-------|-----------------|
| safety.md | Global | Read-only default, mutations need approval, Canadian devices only, verify before operating |
| sources.md | Global | Official source priority: developer.webex.com > roomos.cisco.com > Cisco docs > GitHub > secondary |

## Configuration

| File | Purpose |
|------|---------|
| `.claude/settings.json` | Permissions (auto-allow reads, deny destructive ops), hook wiring, agent teams enabled |
| `CLAUDE.md` | Project instructions, safety rules, API reference, common commands |

## Context Files

| File | Purpose |
|------|---------|
| `README.md` | Setup goals, repo overview, safety rules, how to use |

## Obsidian Vault

| File | Purpose |
|------|---------|
| `vault/proven-commands.md` | Tested, approved curl commands with results |
| `vault/deployment-log.md` | Per-city deployment tracking |
| `vault/templates/daily-note.md` | Template for daily session notes |
