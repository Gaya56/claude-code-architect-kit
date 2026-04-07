---
name: review-pr
description: Review a pull request for code quality, security, and correctness. Use when reviewing PRs or when asked to check a PR.
argument-hint: "[PR number or URL]"
context: fork
agent: Explore
allowed-tools: Bash(gh *) Read Grep Glob
---

## Pull request context

- PR diff: !`gh pr diff $ARGUMENTS`
- PR details: !`gh pr view $ARGUMENTS`
- Changed files: !`gh pr diff $ARGUMENTS --name-only`

## Review instructions

Analyze this pull request and provide a structured review:

1. **Summary**: What does this PR do? (2-3 sentences)
2. **Security**: Flag any security concerns (injection, secrets, auth issues)
3. **Correctness**: Logic errors, edge cases, error handling gaps
4. **Quality**: Code style, naming, duplication, complexity
5. **Testing**: Are changes adequately tested? What's missing?
6. **Suggestions**: Specific, actionable improvements (with file:line references)

Be concise. Focus on issues that matter, not style nitpicks.
