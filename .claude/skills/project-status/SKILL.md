---
name: project-status
description: Capture current status across all tracked repos. Use when switching context, ending a session, or the user says "where am I", "what's the status", or is about to leave.
user-invokable: true
argument-hint: "[optional: specific project name or 'all']"
allowed-tools: Read, Write, Edit, Grep, Glob, Bash
---

# Project Status Skill

Snapshot git state across tracked repos and update the vault.

## Workflow

1. **Find tracked projects**: Read `vault/dashboard.md` to get the list of active projects and their repo paths
2. **Gather git state** for each project repo:
   - `git branch --show-current`
   - `git log --oneline -3`
   - `git status --short`
   - Check for open PRs if `gh` is available
3. **Update each project note** in `vault/projects/<name>.md`:
   - Update the `## Current Status` section with branch, last commit, uncommitted changes, and today's date
   - Do NOT overwrite other sections
4. **Update dashboard**: Update the status and branch columns in `vault/dashboard.md`
5. **Print summary**: One-screen table showing each repo's branch, last commit, and any uncommitted changes

## Output Format

```
## Project Status — {{date}}

| Project | Branch | Last Commit | Uncommitted |
|---------|--------|-------------|-------------|
| ... | ... | ... | ... |

### Ideas / Inbox
- (list any items from each project's Ideas section)

### Next Steps
- (list unchecked items from each project's Next Steps)
```

## Current Status Section Format

When updating project notes, use this format for `## Current Status`:

```markdown
## Current Status

- **Branch:** {{branch}}
- **Last commit:** {{hash}} {{message}}
- **Uncommitted:** {{count}} files / none
- **Open PRs:** {{count or none}}
- **Updated:** {{date}}
```

## Rules

- Only read from repos listed in the vault dashboard — don't scan for unknown repos
- If a repo path doesn't exist locally, note it as "not cloned" in the summary
- Never modify code or git state — this skill is read-only except for vault writes
- Keep the printed summary under 20 lines
