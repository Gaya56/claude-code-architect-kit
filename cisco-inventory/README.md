# Cisco Inventory Claude Setup

This folder defines the Claude Code setup for the `quick-macros` branch of the Cisco Inventory project. It gives the repo a flexible `.claude/` foundation with focused agents, practical skills, lightweight hooks, and clear rules for managing Cisco RoomOS devices via the Webex API.

## What This Repo Does

Manages Cisco RoomOS devices across 16 Canadian PwC locations via the Webex REST API. Operations include deploying macros, removing outdated macros, pushing configs, and troubleshooting devices — all done city-by-city with careful validation.

## Setup Overview

| Component | Count | Purpose |
|-----------|-------|---------|
| Skills | 3 | `/webex-research`, `/device-check`, `/cross-check` — primary user interface |
| Agents | 3 | lead (coordinator), researcher (docs), validator (API checks) |
| Hooks | 2 | Token check, cross-check reminder before mutations |
| Rules | 2 | Safety (read-free, execute with permission) and source priority |

See [INDEX.md](INDEX.md) for the full map of every file and its purpose.

## Safety

- Read operations run freely. Mutations require explicit user approval.
- Only operates on Canadian PwC devices (`CA-<CITY_TAG>-<ROOM_NUMBER>`).
- Official sources first: `developer.webex.com`, `roomos.cisco.com`, official Cisco docs.
- Environment-based credentials only — never hardcode tokens.
- Hooks are fast (under 1 second) and non-blocking for read operations.

## Source Priority

1. `developer.webex.com` — Webex API endpoints, authentication, examples
2. `roomos.cisco.com` — RoomOS device behavior, macro runtime, xAPI reference
3. Official Cisco documentation — platform and device reference
4. Official Cisco GitHub repos — working code samples
5. Trusted secondary sources — only when official sources are incomplete

## Current Repo: `https://github.com/Gaya56/Cisco-Inventory/tree/quick-macros`

The `quick-macros` branch contains working areas for macro development, device configs, deployment material, and testing scripts.

| Existing Repo Area | What Is There |
|--------------------|---------------|
| `Shutdown-Macro-Release/` | Production macro, deployment commands, inventory data, audit material |
| `quick_macros/` | Supporting macro samples (e.g., auto-reboot) |
| `config-push/` | Site-specific config folders (`CA-CALG-BP1-32`, `CA-EDMO-BP-2204`) |
| `roomdevices-macros-samples/` | Cisco SDK macro examples |
| `Calgary_Testing_Room_Scripts/` | Integration test scripts |
| `Room Bar Pro Device/` | Device-specific test macros |
| `.github/agents/` | Existing GitHub agent specs |

## Obsidian Vault

The `vault/` directory provides a simple Obsidian-compatible workspace for tracking proven commands, deployment progress, and daily notes. See [vault/](vault/) for templates.

## How to Use

1. Copy or symlink this `.claude/` directory into the Cisco-Inventory repo
2. Run `source .env` to load your Webex API token
3. Use `/webex-research [topic]` to find docs and commands
4. Use `/device-check [device or city]` to validate device state
5. Use `/cross-check [topic]` to compare docs vs API results before executing
