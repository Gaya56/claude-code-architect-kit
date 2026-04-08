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

This file must contain:

```markdown
# Session State — [current date]

## What We Were Doing
[Exact task in progress — be specific, not vague]

## Current Step
[Which step of the task we're on, what was the last thing completed]

## Next Steps (in order)
1. [Immediate next action]
2. [After that]
3. [Then this]

## Key Decisions Made This Session
- [Decision 1]
- [Decision 2]

## Files Modified This Session
- [file path]: [what changed]

## Blockers or Warnings
- [Anything that failed, needs attention, or the user flagged]

## Active Branch
[git branch name]

## Uncommitted Changes
[list of uncommitted files, or "none"]

## Instance Health
[Member A: healthy/down/unknown]
[Member B: healthy/down/unknown]
```

### 3. Gather Dynamic Context

Before writing the session state, gather this information:

- Run `git status` to capture uncommitted changes
- Run `git branch --show-current` for active branch
- Run `git log --oneline -3` for recent commits
- Check Docker instance health:
  `curl -s http://127.0.0.1:18789/healthz` (Member A)
  `curl -s http://127.0.0.1:18791/healthz` (Member B)
- Check any active task lists
- Review conversation for in-progress work, decisions, and blockers

## Execution Steps

```
1. READ current MEMORY.md — understand what's already saved
2. READ current session-state.md (if it exists) — see previous state
3. GATHER dynamic context (git status, branch, recent commits, instance health)
4. REVIEW the conversation — identify:
   - What task is in progress right now
   - What step we're on
   - What was decided
   - What files were changed
   - What's blocked or needs attention
5. WRITE session-state.md with full current state
6. UPDATE MEMORY.md — only change sections that are stale or new
   - Keep under 200 lines (hard limit — lines after 200 are truncated on reload)
7. If obsidian agent is available, tell it to create a session note
   in vault/sessions/ with today's date and a summary of what changed
8. TELL the user: "State saved. Here's what I captured: [brief summary]"
9. TELL the user: "Ready to compact. Run /compact now, and when you're back,
   I'll pick up from: [one-line summary of current task]"
```

## After Compact — How to Resume

When the session resumes after compaction:

1. MEMORY.md is automatically reloaded (first 200 lines)
2. Read `session-state.md` for detailed task state
3. Say: "Resuming from: [task]. Last step completed: [step]. Next: [action]."
4. Continue exactly where we left off

## Important Rules

- NEVER skip gathering git status — uncommitted work is the #1 thing lost after compact
- NEVER rewrite MEMORY.md from scratch — update only changed sections
- ALWAYS include the "Next Steps" section — this is what drives resumption
- ALWAYS tell the user what was saved before they compact
- Keep session-state.md under 100 lines — concise, not a journal
