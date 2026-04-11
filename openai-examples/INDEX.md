# OpenAI Skills & Codex Reference Index

> Reference links and notes — not cloned, kept lightweight.

## Official Repo

- **OpenAI Skills (Codex)** — https://github.com/openai/skills
  The official skills catalog for OpenAI's Codex CLI. Reference implementation for how skills should be structured following the agentskills.io open standard.

## Three-Tier Organization

| Tier | Directory | Description |
|---|---|---|
| System | `.system/` | Auto-installed with Codex — shell commands, file ops, basic utilities |
| Curated | `.curated/` | Community-submitted, vetted and approved by OpenAI |
| Experimental | `.experimental/` | Community contributions, still being tested, no guarantees |

## Key Components

| Component | What It Does |
|---|---|
| `$skill-installer` | Built-in tool for searching, discovering, and installing skills from the catalog |
| Multi-language support | Skills in Python, JavaScript, Shell, Swift, and PowerShell |
| agentskills.io spec | Follows the open standard — portable across Claude Code, Cursor, Gemini CLI, etc. |

## Why This Matters

- Gold standard reference for skill structure and naming conventions
- The three-tier pattern (system/curated/experimental) is a useful model for organizing any skill library
- Shows how OpenAI approaches progressive disclosure, metadata, and skill discovery

## Related

- agentskills.io spec: https://github.com/agentskills/agentskills
- Anthropic example skills: https://github.com/anthropics/skills
