# claude-code-architect-kit

Master Claude Code template library -- skills, subagents, hooks, rules, and configuration patterns shared across all repos via symlink.

## Quick Start

```bash
# Symlink into any project
ln -s /path/to/claude-code-architect-kit/.claude /path/to/your-project/.claude

# Or copy the CLAUDE.md too
ln -s /path/to/claude-code-architect-kit/CLAUDE.md /path/to/your-project/CLAUDE.md
```

## Structure

All paths verified against [official Claude Code docs](https://code.claude.com/docs).

```
.
├── CLAUDE.md                              # Project instructions (auto-loaded)
├── .gitignore                             # Excludes local-only files
│
└── .claude/
    ├── settings.json                      # Shared settings: permissions, hooks
    ├── settings.local.json                # Personal overrides (gitignored)
    ├── .mcp.json                          # MCP server configuration
    │
    ├── skills/                            # Custom skills (each dir has SKILL.md)
    │   ├── commit/
    │   │   └── SKILL.md                   # /commit -- conventional commit helper
    │   ├── review-pr/
    │   │   └── SKILL.md                   # /review-pr -- PR review in subagent
    │   └── explain-code/
    │       ├── SKILL.md                   # /explain-code -- diagrams + analogies
    │       └── examples/
    │           └── sample-explanation.md   # Supporting file
    │
    ├── agents/                            # Custom subagent definitions
    │   ├── researcher.md                  # Deep codebase exploration
    │   ├── code-reviewer.md               # Code quality review
    │   └── test-runner.md                 # Test execution + failure diagnosis
    │
    ├── hooks/                             # Hook scripts (referenced by settings.json)
    │   ├── protect-files.sh               # Block edits to .env, keys, creds
    │   └── on-stop.sh                     # Runs when Claude finishes responding
    │
    ├── commands/                           # Legacy commands (skills preferred)
    │   └── hello.md                       # /hello -- config verification
    │
    └── rules/                             # Path-scoped and global rules
        ├── code-style.md                  # General code style
        ├── security.md                    # Security rules
        ├── frontend/
        │   └── react-conventions.md       # React rules (*.tsx paths)
        └── backend/
            └── api-design.md              # API rules (src/api/** paths)
```

## How It Works

| Component | Location | Format | Docs |
|-----------|----------|--------|------|
| **Skills** | `.claude/skills/<name>/SKILL.md` | Markdown + YAML frontmatter | [Skills docs](https://code.claude.com/docs/en/skills) |
| **Subagents** | `.claude/agents/<name>.md` | Markdown + YAML frontmatter | [Subagents docs](https://code.claude.com/docs/en/sub-agents) |
| **Hooks** | `.claude/settings.json` + `.claude/hooks/*.sh` | JSON config + shell scripts | [Hooks docs](https://code.claude.com/docs/en/hooks) |
| **Rules** | `.claude/rules/<name>.md` | Markdown, optional `paths:` frontmatter | [Memory docs](https://code.claude.com/docs/en/memory) |
| **Commands** | `.claude/commands/<name>.md` | Markdown (legacy, same as skills) | [Skills docs](https://code.claude.com/docs/en/skills) |
| **MCP** | `.claude/.mcp.json` | JSON | [MCP docs](https://code.claude.com/docs/en/mcp) |
| **Settings** | `.claude/settings.json` | JSON | [Settings docs](https://code.claude.com/docs/en/settings) |

## Customizing

**For personal overrides** (not committed):
- `CLAUDE.local.md` -- personal project instructions
- `.claude/settings.local.json` -- personal settings (API keys, preferences)

**For new skills**: create `.claude/skills/<name>/SKILL.md` with YAML frontmatter.

**For new agents**: create `.claude/agents/<name>.md` with `name` and `description` in frontmatter.

**Settings precedence** (highest to lowest):
1. Managed policy settings (org-level)
2. `.claude/settings.local.json` (personal, gitignored)
3. `.claude/settings.json` (shared, committed)
4. `~/.claude/settings.json` (user-level, all projects)
