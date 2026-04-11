# Proven Commands

Tested and approved curl commands. Only add commands that have been verified against real devices.

## Device Queries

| Command | What it does | Tested on | Result |
|---------|-------------|-----------|--------|
| `curl -s ".../devices?displayName=CA-CALG" -H "Auth..."` | List Calgary devices | 2026-02-05 | Success — returned device list |

## Macro Operations

| Command | What it does | Tested on | Result |
|---------|-------------|-----------|--------|
| `curl -s -X POST ".../Macros.Macro.Get" ...` | Check macro on device | 2026-02-05 | Success — returned ShutdownTimer active |

## Config Operations

| Command | What it does | Tested on | Result |
|---------|-------------|-----------|--------|
| — | — | — | — |
