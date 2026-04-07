---
name: save-and-document
description: "End-of-session save and document. Captures decisions made, changes applied, and current state. Updates memory files. Use when the user says end of session, save state, wrap up, or document what we did."
user-invokable: true
---

# Save and Document — End of Session

Captures the current session's decisions and changes, and updates persistent memory.

## Trigger Phrases

- "end of session"
- "save state"
- "wrap up"
- "document what we did"

---

## Step 1 — Collect Session Summary

Ask the user (or infer from conversation) the following:

1. **What changed?** — list of files edited, config changes
2. **Key decisions** — architectural choices, things explicitly ruled out
3. **Current state** — what's live, what's pending, what's blocked
4. **Next session's starting point** — first action for next time

---

## Step 2 — Update Memory Files

Update the relevant memory files in the auto memory directory:

- If project state changed → update topic memory files
- If new feedback was given → add/update feedback memory files
- If new external references discovered → add/update reference files
- Always update `MEMORY.md` index if new files added

**Memory file rules:**
- Current state only — no historical logs
- Remove entries that are no longer true
- Keep topic files focused (one topic per file)
- MEMORY.md must stay under 200 lines

---

## Step 3 — Update CLAUDE.md If Needed

If any of these changed this session, update CLAUDE.md:

- Current state table
- Edge functions used
- Known issues added or resolved
- Active tools list
- Commented-out features status

**Claude MD Management Integration:**
The `claude-md-management` plugin is enabled. Use the `/claude-md-management:claude-md-improver` skill to audit CLAUDE.md quality and apply targeted fixes automatically, ensuring documentation stays accurate and comprehensive.

---

## Step 4 — Compact (Optional)

If the user also wants to compact context, run the `/save-and-compact` skill after completing steps 1–3.