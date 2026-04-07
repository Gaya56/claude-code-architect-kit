---
name: Detach-deployment
description: Deploy eris-agent to Railway. Pre-flight checks, deploy with --detach, post-deploy verification and smoke test.
---

# Detach Deployment

Deploy eris-agent to Railway with full pre-flight and post-deploy verification.

## Pre-Flight

1. Syntax check — `python3 -m py_compile`
2. Import check — verify all imports resolve
3. Agent registration name — must be `eris-dispatcher`
4. DB-first API key pattern — verify key lookup

## Deploy

```bash
railway up --detach
```

## Post-Deploy

1. Check build status
2. Tail logs for errors
3. Smoke test call to +15185589185
4. If failure — rollback via Railway dashboard or `railway service redeploy`

## Required Railway Env Vars

Verify all are set before deploying. Check with `railway variables`.
