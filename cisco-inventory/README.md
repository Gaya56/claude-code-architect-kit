# Cisco Inventory Claude Setup

This folder defines the Claude Code setup we want for the `quick-macros` branch of the Cisco Inventory project. The goal is to give the repo a flexible, reliable `.claude/` foundation with a clear `CLAUDE.md`, focused agents, practical hooks, and lightweight rules that improve research and terminal workflows without adding unnecessary complexity.

The setup should prioritize official Cisco, Webex, RoomOS, and official GitHub documentation first, then fall back to trusted secondary sources only when official references are incomplete. It should help collect accurate commands, API references, and working examples from real documentation so changes stay grounded in sources we trust, especially from `https://developer.webex.com/` and RoomOS documentation.

The workflow side should stay simple and safe. During local development in this codespace, terminal usage should be read-only against Webex Control Hub data through environment-based API access, with no destructive changes. When this setup is later moved into the `Cisco-Inventory` repository on `quick-macros`, execution capabilities can be added carefully, but they must remain conservative and avoid breaking or unintentionally changing anything in Control Hub. Hooks should remain fast and bounded, with a target runtime of no more than `3-5` minutes.

## Current Repo Review: `https://github.com/Gaya56/Cisco-Inventory.git`

The `quick-macros` branch already contains several useful working areas that show this repo is centered on Cisco room device automation, macro development, and device-specific operational work. At the top level there are folders for quick macros, config push workflows, shutdown macro release material, room device macro samples, testing room scripts, and device-specific content such as `Room Bar Pro Device` as a example repo.

The branch also already includes supporting documentation and tooling patterns that can guide the Claude setup. There is a `.github/agents` directory, deployment and audit material under `Shutdown-Macro-Release`, location-based config push folders, a `Terminal_commands.MD` file, and an environment configuration file. That makes this a good candidate for a focused `.claude/` layer that organizes research, terminal validation, and short-running hook workflows around assets that already exist.

| Existing repo area | What is already there |
|--------------------|-----------------------|
| `.github` | An existing `agents` directory is already present |
| `quick_macros` | A `2577-resolution-auto-reboot` macro area exists |
| `config-push` | Site-specific config folders such as `CA-CALG-BP1-32` and `CA-EDMO-BP-2204` |
| `Shutdown-Macro-Release` | `CLAUDE.md`, `README.md`, deployment commands, audit summary, final shutdown macro, and inventory data |
| `roomdevices-macros-samples` | A large collection of room device macro sample content |
| Other top-level content | `Calgary_Testing_Room_Scripts`, `Room Bar Pro Device`, `Terminal_commands.MD`, and environment config |

| Area | Goal |
|------|------|
| Repository target | `Cisco-Inventory` on branch `quick-macros` |
| Main deliverables | `CLAUDE.md`, `.claude/agents`, `.claude/hooks`, `.claude/skills`, `.claude/rules`, `.claude/settings` |
| Core priority | Better tooling, guidance, and workflow support |
| Reference model | `deploy-watcher.md` is a pattern only, not the final implementation |

| Agent or Capability | Purpose |
|---------------------|---------|
| Research agent | Search official docs and official GitHub repos for commands, API usage, and reference snippets |
| Terminal and workflow agent | Handle local read-only API checks, status updates, and carefully scoped validation workflows |
| Hooks | Provide short background checks and clear pass/fail status updates |

| Guardrail | Requirement |
|-----------|-------------|
| Source quality | Official sources first, trusted secondary sources only if needed |
| Local API usage | Read Control Hub data locally through environment-based credentials without exposing or storing secrets |
| Safety | Prefer read-only actions first, and only allow future execution in the target repo with explicit caution |
| Flexibility | Keep the setup modular and easy to extend |
| Hook runtime | Each hook should finish within `3-5` minutes |

| Success Criteria | Pass Condition |
|------------------|----------------|
| Claude setup exists | `CLAUDE.md` and the main `.claude/` structure are defined clearly |
| Research is grounded | Official Webex, Cisco, RoomOS, and official GitHub sources are the default references |
| Local terminal workflow is safe | Local terminal commands read data only and do not modify Control Hub |
| Future execution is controlled | Any later execute capability is added carefully in `Cisco-Inventory` on `quick-macros` |
| Hooks stay lightweight | Each hook completes within `3-5` minutes and reports clear status |

| Source Priority | Default Use |
|-----------------|-------------|
| `developer.webex.com` | Primary source for Webex API behavior, authentication, and examples |
| `roomos.cisco.com` docs | Primary source for RoomOS device behavior and macro guidance |
| Official Cisco docs | Primary source for platform and device reference material |
| Official GitHub repos | Preferred source for working command snippets and implementation patterns |
| Trusted secondary sources | Use only when official sources do not cover the need clearly |