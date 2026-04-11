---
date: 2026-04-08
area: claude-code
category: configuration
project: openclaw-team-ops
tags:
  - hooks
  - rules
  - reference
  - best-practice
---

# Hooks & Rules — Official Reference

Quick-reference from Claude Code docs. Use this to crosscheck any hook or rule we build.

## Hooks

Shell commands that fire on specific events. Deterministic — Claude doesn't decide, the script does.

**Config:** `settings.json` under `hooks` key → scripts in `.claude/hooks/`

### Events

| Event | When It Fires | Use For |
|-------|---------------|---------|
| `PreToolUse` | Before a tool runs | Block dangerous commands, validate paths |
| `PostToolUse` | After a tool runs | Log actions, check output |
| `Stop` | Claude wants to stop | Force checklist completion |
| `SubagentStop` | Subagent finishes | Validate subagent output |
| `SessionStart` | Session begins | Load context, health checks |
| `SessionEnd` | Session ends | Cleanup, save state |
| `UserPromptSubmit` | User sends message | Transform or validate input |
| `PreCompact` | Before compaction | Save state before context shrinks |
| `Notification` | Claude sends notification | Custom alerting |

### Hook Output (JSON)

| Field | Values | Effect |
|-------|--------|--------|
| `permissionDecision` | `allow`, `deny`, `ask` | Approve, block, or prompt |
| `updatedInput` | object | Modify the tool call |
| `systemMessage` | string | Inject a message to Claude |

### Hook Config Structure (settings.json)

```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          {
            "type": "command",
            "command": ".claude/hooks/script.sh"
          }
        ]
      }
    ]
  }
}
```

## Rules

Markdown files that inject instructions into Claude's context. No scripts needed.

**Location:** `.claude/rules/*.md`

### Scoping

- **Global:** plain markdown, no frontmatter — always active
- **Path-scoped:** add `paths:` frontmatter — only active for matching files

```markdown
---
paths:
  - "docker-compose*.yml"
  - "data/**/.env"
---

Never commit secrets. Validate env vars exist before referencing them.
```

## Sources

- Hook events & output: [Claude Code Plugin Dev — Hook Development](https://github.com/anthropics/claude-code/blob/main/plugins/plugin-dev/skills/hook-development/SKILL.md)
- Hook system overview: [Claude Code Plugin Dev README](https://github.com/anthropics/claude-code/blob/main/plugins/plugin-dev/README.md)
- Hook config format: [Claude Code Hookify](https://github.com/anthropics/claude-code/blob/main/plugins/hookify/commands/hookify.md)
- Rule file format: [Claude Code Hookify — Writing Rules](https://github.com/anthropics/claude-code/blob/main/plugins/hookify/skills/writing-rules/SKILL.md)
- Official docs site: [code.claude.com/docs](https://code.claude.com/docs)
