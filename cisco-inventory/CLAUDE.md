# Cisco Inventory — Claude Code Instructions

> Manages Cisco RoomOS devices via the Webex REST API.
> Deploys macros, removes outdated macros, pushes configs, troubleshoots devices.
> Work happens city-by-city across 16 Canadian PwC locations.

## Safety Rules

- **Read freely, execute with permission.** All read operations (list devices, get macros, check status) run without prompting. Mutating operations (save, activate, deactivate, remove macros) require explicit user approval.
- Never modify Control Hub without explicit approval.
- Never hardcode tokens — use `$WEBEX_API_TOKEN` from `.env`.
- Always verify device `connectionStatus` before attempting operations.
- Logs and API responses are the source of truth.

## Source Priority

1. `developer.webex.com` — Webex API behavior, authentication, endpoints
2. `roomos.cisco.com` — RoomOS device behavior, macro runtime, xAPI reference
3. Official Cisco documentation — platform and device reference
4. Official Cisco GitHub repos — working code samples and patterns
5. Trusted secondary sources — only when official sources are incomplete

## Skills

| Skill | Use |
|-------|-----|
| `/webex-research` | Look up Webex API, RoomOS, Cisco docs for commands, endpoints, and patterns |
| `/device-check` | Check device status, list macros, verify operations via read-only API calls |
| `/cross-check` | Compare research findings against validation results to find gaps before executing |

## Agents

| Agent | Role | Model |
|-------|------|-------|
| **lead** (purple) | Coordinates operations, delegates to researcher and validator, manages city-by-city workflow | sonnet |
| **researcher** (blue) | Looks up official Webex, RoomOS, and Cisco documentation | sonnet |
| **validator** (green) | Runs read-only API checks, reports pass/fail status tables | haiku |

## Hooks

| Hook | Trigger | What it does |
|------|---------|-------------|
| `check-env.sh` | Before any Bash command targeting Webex API | Blocks if `$WEBEX_API_TOKEN` is not loaded |
| `cross-check-reminder.sh` | Before mutating API calls (POST except Macro.Get) | Reminds to `/cross-check` before executing |

## Setup Guide

See [INDEX.md](INDEX.md) for the full map of every tool, agent, skill, hook, and rule in this setup.

See [vault/](vault/) for Obsidian notes — proven commands, deployment logs, and daily notes.

## API Quick Reference

- **Base URL:** `https://webexapis.com/v1/`
- **Auth:** `Authorization: Bearer $WEBEX_API_TOKEN`
- **Device naming:** `CA-<CITY_TAG>-<ROOM_NUMBER>` (e.g., `CA-CALG-29048`)
- **Pagination:** Max 100 per page; check `Link` header for `rel="next"`

### Key Endpoints

| Operation | Endpoint | Method |
|-----------|----------|--------|
| List devices | `/devices` | GET |
| Filter by name | `/devices?displayName=CA-CALG-*` | GET |
| Save macro | `/xapi/command/Macros.Macro.Save` | POST |
| Activate macro | `/xapi/command/Macros.Macro.Activate` | POST |
| Deactivate macro | `/xapi/command/Macros.Macro.Deactivate` | POST |
| Remove macro | `/xapi/command/Macros.Macro.Remove` | POST |
| Get macro | `/xapi/command/Macros.Macro.Get` | POST |

### Common Commands

```bash
# Load token
source .env

# Verify token
curl -s "https://webexapis.com/v1/people/me" \
  -H "Authorization: Bearer $WEBEX_API_TOKEN" | jq '.displayName'

# List devices by city
curl -s "https://webexapis.com/v1/devices?displayName=CA-CALG" \
  -H "Authorization: Bearer $WEBEX_API_TOKEN" | \
  jq '.items[] | {id, displayName, connectionStatus}'

# Check macro on a device
curl -s -X POST "https://webexapis.com/v1/xapi/command/Macros.Macro.Get" \
  -H "Authorization: Bearer $WEBEX_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"deviceId":"DEVICE_ID","arguments":{"Name":"ShutdownTimer","Content":"False"}}' | \
  jq '.result.Macro[] | {Name, Active}'
```

## City-by-City Workflow

1. Filter devices for the target city (`/devices?displayName=CA-<CITY>`)
2. Check each device's connection status
3. Perform the operation (deploy, remove, configure) on connected devices
4. Verify the result via API
5. Log results and move to the next city

## Repo Structure

| Directory | Contents |
|-----------|----------|
| `Shutdown-Macro-Release/` | Production macro, deployment commands, inventory data, audit material |
| `quick_macros/` | Supporting macro samples (e.g., auto-reboot) |
| `config-push/` | Site-specific device config folders |
| `roomdevices-macros-samples/` | Cisco SDK macro examples |
| `Calgary_Testing_Room_Scripts/` | Integration test scripts |
| `Room Bar Pro Device/` | Device-specific test macros |
| `.github/agents/` | Existing GitHub agent specs |

## Environment Setup

```bash
source .env
# Confirms: $WEBEX_API_TOKEN is set
```

Create `settings.local.json` for personal overrides (gitignored).
