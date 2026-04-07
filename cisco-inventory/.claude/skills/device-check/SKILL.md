---
name: device-check
description: Check Cisco device status via Webex API. Verify a device is online, list its macros, or confirm a macro operation succeeded. Read-only by default.
argument-hint: "[device name or city tag, e.g. 'CA-CALG-BP1-32' or 'CALG']"
allowed-tools:
  - Bash
  - Read
  - Grep
  - Glob
---

# Device Check

Check device status and macro state for $ARGUMENTS.

## Prerequisites

Verify `$WEBEX_API_TOKEN` is set before making any API call.

## Workflow

1. **Identify target** — parse the argument as a device name (`CA-CALG-29048`) or city tag (`CALG`).
2. **List devices** — query `/devices?displayName=CA-<TAG>` to find matching devices.
3. **Check connection** — report `connectionStatus` for each device.
4. **List macros** (if specific device) — use `Macros.Macro.Get` to list active macros.
5. **Report** — structured pass/fail table.

## Output Format

| Check | Status | Detail |
|-------|--------|--------|
| Token loaded | PASS/FAIL | Token present in environment |
| Device found | PASS/FAIL | Device ID and displayName |
| Connection status | PASS/FAIL | connected / disconnected / offline_expired |
| Macros listed | PASS/FAIL | Count and names of active macros |

If checking multiple devices (city-wide), report a summary table:

| Device | Status | Macros | Notes |
|--------|--------|--------|-------|
| CA-CALG-29048 | connected | ShutdownTimer (active) | — |
| CA-CALG-29049 | disconnected | — | Device offline |

## Pagination

Device lists may exceed 100 results. Always check the `Link` header for `rel="next"` and follow pagination until all devices are retrieved.

## Rules

- Read-only by default. If the user asks to save, remove, or activate a macro, show the exact curl command for approval before executing.
- If a device is disconnected, report the status — do not attempt operations on offline devices.
- After any approved mutation, run a verification check to confirm the result.
- Only operate on Canadian PwC devices (pattern: `CA-<CITY_TAG>-<ROOM_NUMBER>`). Skip any device that doesn't match this naming convention.
