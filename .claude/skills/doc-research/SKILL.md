---
name: doc-research
description: |
  Cross-reference code against official docs and web sources to find gaps, outdated patterns, and missing features. Use this skill when the user asks to "check my code against the docs", "find gaps", "am I using this correctly", "what am I missing", "audit my implementation", or wants a gap analysis comparing their code to current best practices. Combines Context7 (library docs) + Tavily (web search, deep research) into one workflow.
allowed-tools:
  - mcp__claude_ai_Context7__resolve-library-id
  - mcp__claude_ai_Context7__query-docs
  - mcp__claude_ai_Tavily__tavily_search
  - mcp__claude_ai_Tavily__tavily_extract
  - mcp__claude_ai_Tavily__tavily_research
  - mcp__claude_ai_Tavily__tavily_skill
  - Read
  - Grep
  - Glob
user-invocable: true
argument-hint: '[library or feature area]'
---

# Doc Research

Cross-reference your code against official docs. Find gaps, outdated patterns, missing features.

## Workflow

1. **Read code** — Glob/Grep/Read to understand what's implemented and which libraries are used
2. **Context7 docs** — resolve library ID, then query for the specific features in use
3. **Tavily fill-in** — search for recent changes, deprecations, or migration guides that Context7 missed
4. **Report** — structured gap analysis with source links

## When to use each tool

| Need | Tool |
|------|------|
| Library API docs, code examples | Context7 `resolve-library-id` → `query-docs` |
| Recent changes, deprecations | Tavily `tavily_search` with time range |
| Full content from a docs URL | Tavily `tavily_extract` |
| Broad "what am I missing?" | Tavily `tavily_research` (slow, use sparingly) |
| Library docs with project context | Tavily `tavily_skill` with language + context |

## Quick start examples

```
# Check Next.js app router usage
/doc-research nextjs app router

# Audit Supabase auth setup
/doc-research supabase auth

# Verify Prisma schema patterns
/doc-research prisma schema
```

## Output format

```markdown
## Gap Analysis: [Library/Feature]

### Gaps
- [ ] What's missing — why it matters [source](url)

### Outdated Patterns
- [ ] Current approach → recommended approach [source](url)

### Confirmed Good
- [x] What matches current best practices
```

## Tips

- Always read code BEFORE searching docs — know what to look for
- Lead with Context7 — it's faster and more structured than web search
- Use Tavily `tavily_search` with `time_range: "month"` for recent deprecations
- Every finding needs a source link — no unsourced claims
- Focus on top 5-10 most impactful findings, not exhaustive lists
- If Context7 and Tavily conflict, show both sources and note the discrepancy
