---
date: 2026-04-08
area: git
category: workflow
project: openclaw-team-ops
tags:
  - pattern
  - git
  - push
---

# Pattern — Push to External Repo from Codespace

## When to Use

When you need to push files from the architect-kit Codespace to a different repo (like openclaw-team-ops or MollyCall) that this Codespace doesn't have default write access to.

## Steps

1. Clone the target repo to `/tmp/` using `gh repo clone`
2. Checkout the correct branch
3. Copy files from the local directory to the cloned repo
4. Commit with descriptive message
5. Set the remote URL with the auth token:
   ```bash
   git remote set-url origin "https://x-access-token:$(gh auth token)@github.com/OWNER/REPO.git"
   ```
6. Push to the branch

## Why It Works

- `git clone` via HTTPS fails with 403 because the Codespace token is scoped to one repo
- `gh repo clone` works for read (uses `GH_TOKEN`)
- `git push` also fails because the default remote URL doesn't carry the token
- Setting the remote URL with `$(gh auth token)` injects the token into the push URL

## Key Detail

The magic line is step 5. Without it, push gets 403 every time. `gh auth token` returns the current token which has `repo` scope across all repos.

## Related

- [[sessions/2026-04-08-openclaw-buildout]]
