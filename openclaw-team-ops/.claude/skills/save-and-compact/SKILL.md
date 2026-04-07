---
name: save-and-compact
description: Save current session state to memory, then compact. Use when context is getting large or before a long task. Ensures continuity across compaction.
---

# Save and Compact

Save the current working state to auto memory, then trigger compaction.
This ensures you can pick up exactly where you left off after context is compressed.

## What to Save

Before compacting, write the following to auto memory files:

### 1. Update MEMORY.md (first 200 lines — always loaded after compact)

Read the current `MEMORY.md` at the auto memory path. Then update ONLY the sections that changed.
Do NOT rewrite the entire file — edit specific sections.

### 2. Write Session State File

Write a detailed session state to the auto memory path as `session-state.md`.

### 3. Gather Dynamic Context

Before writing the session state, gather this information:

- Run `git status` to capture uncommitted changes
- Run `git branch --show-current` for active branch
- Run `git log --oneline -3` for recent commits
- Check any active task lists
- Review conversation for in-progress work, decisions, and blockers

## Execution Steps

1. READ current MEMORY.md — understand what's already saved
2. READ current session-state.md (if it exists) — see previous state
3. GATHER dynamic context (git status, branch, recent commits)
4. REVIEW the conversation — identify task, step, decisions, files, blockers
5. WRITE session-state.md with full current state
6. UPDATE MEMORY.md — only change sections that are stale or new (keep under 200 lines)
7. TELL the user what was saved
8. TELL the user to run /compact

## Important Rules

- NEVER skip gathering git status — uncommitted work is the #1 thing lost after compact
- NEVER rewrite MEMORY.md from scratch — update only changed sections
- ALWAYS include the "Next Steps" section — this is what drives resumption
- ALWAYS tell the user what was saved before they compact
- Keep session-state.md under 100 lines
