---
name: update-vault
description: Update the Obsidian vault with lessons learned, project status changes, and proven patterns after completing work. Use after finishing a build, review, or session.
argument-hint: "[what to capture, e.g. 'lessons from cisco build' or 'new hook pattern']"
allowed-tools:
  - Read
  - Write
  - Edit
  - Grep
  - Glob
---

# Update Vault

Capture learnings and update the vault for $ARGUMENTS.

## Workflow

1. **Identify what changed** — read recent work, git diff, or user description
2. **Update the right files:**
   - New lesson? Create `vault/lessons/YYYY-MM-DD.md` using the template
   - Project status change? Update `vault/projects/<name>.md`
   - New proven pattern? Update the relevant file in `vault/proven-patterns/`
   - Review checklist update? Edit `vault/proven-patterns/review-checklist.md`
3. **Update dashboard** — add links to new entries in `vault/dashboard.md`
4. **Use Obsidian syntax** — `[[wikilinks]]`, frontmatter properties, callouts (`> [!tip]`, `> [!warning]`)

## What to Capture

- Bugs found and how they were fixed
- Patterns that worked well (reusable)
- Things that failed silently (gotchas)
- Process improvements (review steps, checklist items)
- Project milestones and status changes

## Rules

- Use templates from `vault/templates/` for new entries
- Keep entries concise — focus on what's surprising or non-obvious
- Link related entries with `[[wikilinks]]`
- Tag entries for searchability (`#lesson`, `#pattern`, `#project`)
- Don't duplicate what's already in memory — vault is for structured knowledge, memory is for quick recall
