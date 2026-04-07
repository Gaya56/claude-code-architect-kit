---
name: webex-research
description: Research Webex API, RoomOS, and Cisco device docs. Use when you need to find the right API endpoint, check macro syntax, understand device behavior, or verify a command before running it.
argument-hint: "[topic, e.g. 'macro remove endpoint' or 'RoomOS standby config']"
allowed-tools:
  - Read
  - Grep
  - Glob
  - WebFetch
  - WebSearch
---

# Webex Research

Research official Cisco, Webex, and RoomOS documentation for $ARGUMENTS.

## Workflow

1. **Check local repo first** — search `DEPLOYMENT_COMMANDS.md`, `INVENTORY_COMMANDS.md`, `Terminal_commands.MD`, and existing macro files for relevant examples.
2. **Search developer.webex.com** — find the specific API endpoint, parameters, authentication requirements, and response format.
3. **Search roomos.cisco.com** — find device-side behavior, xAPI command syntax, macro runtime details.
4. **Fill gaps** — if official sources are incomplete, search official Cisco GitHub repos (`CiscoDevNet/roomdevices-macros-samples`) for working examples.
5. **Report findings** with source links.

## Output Format

Return a structured summary:

| Source | Finding | URL |
|--------|---------|-----|
| developer.webex.com | What the API docs say | Link |
| roomos.cisco.com | What the device docs say | Link |
| Local repo | Existing example or command | File path |

## Rules

- Official sources first, always.
- Never invent endpoints or parameters — if you can't find it, say so.
- If official docs and observed behavior conflict, note the discrepancy.
- Keep findings concise and actionable.
