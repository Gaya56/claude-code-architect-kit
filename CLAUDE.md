# Project Instructions

> This file is loaded automatically at the start of every Claude Code session.
> Keep it under 200 lines. Use @imports for detailed references.

## About This Repo

This is the **claude-code-architect-kit** -- a master template library for `.claude/` configuration.
It is designed to be symlinked into other projects via:

```bash
ln -s /path/to/claude-code-architect-kit/.claude /path/to/target-project/.claude
```

## Conventions

- Follow official Claude Code docs: https://code.claude.com/docs
- Never improvise file formats -- use the exact structures defined by Anthropic
- Skills use `SKILL.md` inside a named directory under `.claude/skills/`
- Subagents are `.md` files with YAML frontmatter in `.claude/agents/`
- Hooks are configured in `settings.json`, with scripts in `.claude/hooks/`
- Rules are `.md` files in `.claude/rules/`, optionally with `paths:` frontmatter

## Workflow

1. Build and test all templates in this repo first
2. Symlink `.claude/` into target projects
3. Use `CLAUDE.local.md` and `settings.local.json` for project-specific overrides (these are gitignored)

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
  commands/              # Legacy commands (still supported, skills preferred)
    <name>.md
  rules/                 # Path-scoped or global rules
    <name>.md
```

## Key Rules

- Do not commit secrets -- use `settings.local.json` for API keys
- Skill descriptions should front-load the key use case (max 250 chars visible)
- Keep `SKILL.md` files under 500 lines; use supporting files for details
- Subagents require both `name` and `description` in frontmatter
- Test skills with `/skill-name` before distributing
