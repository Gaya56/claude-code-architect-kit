---
name: cross-check
description: Cross-reference findings from the researcher and validator agents. Compares what the docs say against what the API actually returns to find gaps, mismatches, or missing info.
argument-hint: "[topic, e.g. 'macro remove behavior' or 'device filtering']"
allowed-tools:
  - Read
  - Grep
  - Glob
  - Bash
---

# Cross-Check

Compare research findings against validation results for $ARGUMENTS.

## When to Use

- After both the researcher and validator have reported back
- When something doesn't match between docs and observed API behavior
- To find gaps before executing a new type of operation

## Workflow

1. **Gather inputs** — read the researcher's findings (docs, endpoints, expected behavior) and the validator's results (actual API responses, device state)
2. **Compare** — check each finding against reality:
   - Does the documented endpoint match what the API actually returned?
   - Does the expected response format match the actual response?
   - Are there fields, statuses, or behaviors the docs mention that we haven't seen?
   - Are there things the API returns that the docs don't cover?
3. **Flag gaps** — anything missing, conflicting, or unverified
4. **Recommend** — what to do about each gap (research more, test manually, safe to proceed)

## Output Format

| Finding | Docs Say | API Returns | Match? | Action |
|---------|----------|-------------|--------|--------|
| Macro.Get response | Returns Name, Active | Confirmed | YES | — |
| Pagination header | Link rel=next | Not tested | GAP | Test with >100 devices |
| connectionStatus values | 7 possible values | Only seen 2 | PARTIAL | Need more city data |

## Summary

End with a one-paragraph verdict: are we good to proceed, or do we need to resolve gaps first?

## Rules

- Be honest about what's confirmed vs assumed.
- If docs and API disagree, trust the API response and flag the discrepancy.
- Keep it concise — table plus short paragraph.
