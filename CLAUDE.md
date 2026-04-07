# Project Instructions

> This file is loaded automatically at the start of every Claude Code session.
> Keep it under 200 lines. Use @imports for detailed references.

## About This Repo

This is the **claude-code-architect-kit** — a master template library for `.claude/` configuration.
It builds and tests `.claude/` setups here, then copies or symlinks them into target projects.

## Active Projects

| Project | Directory | Target Repo | Status |
|---------|-----------|-------------|--------|
| Cisco Inventory | `cisco-inventory/` | [Gaya56/Cisco-Inventory](https://github.com/Gaya56/Cisco-Inventory/tree/quick-macros) | Complete |
| MollyCall | — | [Gaya56/MollyCall](https://github.com/Gaya56/MollyCall/tree/claude-architect) | Active |
| openclaw-team-ops | — | [Gaya56/openclaw-team-ops](https://github.com/Gaya56/openclaw-team-ops/tree/claude-architecture) | Active |

## Skills

| Skill | Use |
|-------|-----|
| `/commit` | Create git commits |
| `/review-pr` | Review pull requests |
| `/explain-code` | Explain code with diagrams and analogies |
| `/doc-research` | Cross-reference code against official docs |
| `/save-and-document` | End-of-session save and document |
| `/save-and-compact` | Save session state to memory, then compact |
| `/update-vault` | Capture lessons, update project status, record proven patterns |
| `/obsidian-markdown` | Write correct Obsidian syntax — wikilinks, callouts, embeds, frontmatter, tags |
| `/obsidian-bases` | Create database-like views (.base files) with filters, formulas, and summaries |
| `/project-status` | Snapshot git state across tracked repos into the vault |

## Agents

| Agent | Role |
|-------|------|
| researcher | Deep codebase research and analysis |
| code-reviewer | Review code for quality, security, best practices |
| test-runner | Run tests, analyze failures, suggest fixes |

## Rules

| Rule | Scope |
|------|-------|
| code-style | Global — clear names, early returns, actionable errors |
| security | Global — no secrets, validate input, parameterized queries |

## Vault

The `vault/` directory is an Obsidian-compatible workspace for tracking work across sessions:

- `vault/dashboard.md` — master overview
- `vault/projects/` — per-project status and learnings
- `vault/lessons/` — dated lesson entries
- `vault/proven-patterns/` — reusable patterns for hooks, skills, agents, reviews
- `vault/templates/` — templates for new entries

Use `/update-vault` after completing work to capture lessons.

## Conventions

- Follow official Claude Code docs: https://code.claude.com/docs
- Never improvise file formats — use the exact structures defined by Anthropic
- Skills use `SKILL.md` inside a named directory under `.claude/skills/`
- Subagents are `.md` files with YAML frontmatter in `.claude/agents/`
- Hooks are configured in `settings.json`, with scripts in `.claude/hooks/`
- Rules are `.md` files in `.claude/rules/`, optionally with `paths:` frontmatter

## Workflow

1. Build and test all templates in this repo first
2. Copy or symlink `.claude/` into target projects
3. Use `CLAUDE.local.md` and `settings.local.json` for project-specific overrides (gitignored)
4. Run `/update-vault` to capture lessons after each build

## File Structure

```
.claude/
  settings.json          # Shared project settings (hooks, permissions)
  settings.local.json    # Personal overrides (gitignored)
  .mcp.json              # MCP server configuration
  skills/                # Custom skills (each in its own directory)
    <name>/SKILL.md
  agents/                # Custom subagent definitions
    <name>.md
  hooks/                 # Hook scripts referenced by settings.json
    <name>.sh
  rules/                 # Path-scoped or global rules
    <name>.md
vault/                   # Obsidian vault for tracking work
  dashboard.md
  projects/
  lessons/
  proven-patterns/
  templates/
cisco-inventory/         # Cisco-Inventory .claude/ setup
claude-code-examples/    # Cloned reference repos (gitignored)
articles/                # Research and articles
```

## Key Rules

- Do not commit secrets — use `settings.local.json` for API keys
- Skill descriptions should front-load the key use case (max 250 chars visible)
- Keep `SKILL.md` files under 500 lines; use supporting files for details
- Subagents require both `name` and `description` in frontmatter
- Test skills with `/skill-name` before distributing
- Always review with agent team (code-reviewer) after building a setup
- Always add `.gitignore` with `.env` and `settings.local.json` before pushing
