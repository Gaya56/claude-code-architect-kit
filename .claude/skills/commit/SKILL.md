---
name: commit
description: Create well-structured git commits with conventional commit messages. Use when committing code changes.
disable-model-invocation: true
allowed-tools: Bash(git *)
---

Create a git commit for the current staged changes.

## Steps

1. Run `git status` and `git diff --cached` to understand what is staged
2. If nothing is staged, show the user what's available and ask what to stage
3. Draft a commit message following Conventional Commits format:
   - `feat:` for new features
   - `fix:` for bug fixes
   - `docs:` for documentation changes
   - `refactor:` for code restructuring
   - `test:` for test additions/changes
   - `chore:` for maintenance tasks
4. Keep the subject line under 72 characters
5. Add a body if the change needs explanation (the "why", not the "what")
6. Show the draft message and ask for confirmation before committing
7. Do NOT push -- let the user decide when to push

## Arguments

If `$ARGUMENTS` is provided, use it as guidance for the commit message scope.
