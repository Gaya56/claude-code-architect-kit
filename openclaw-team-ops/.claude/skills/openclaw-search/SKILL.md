---
name: openclaw-search
description: Search for OpenClaw docs, GitHub examples, and articles. Finds info via web search, confirms against official docs via Context7. Use when you need OpenClaw config help, troubleshooting, or best practices.
user-invocable: true
argument-hint: "[query or topic]"
---

# OpenClaw Search

Delegate this search to the **researcher** agent. It runs in the background and returns structured findings.

## What It Does

1. Takes your query (e.g., "how to add a Telegram channel")
2. Delegates to the researcher agent in the background
3. Researcher searches web → confirms with Context7
4. Returns structured findings with sources

## Usage

```
/openclaw-search how to configure gateway allowedOrigins
/openclaw-search Docker health check endpoint
/openclaw-search add Telegram channel to existing instance
/openclaw-search latest image version and changelog
```

## Output

Returns a structured report:
- **Answer** — concise finding
- **Sources** — what was fetched, with URLs
- **Context7 Confirmation** — official docs say...
- **Gaps** — what couldn't be verified

## What Happens Next

Main agent reviews the findings. If worth keeping, it tells the obsidian agent to store them in the vault under the right folder (decisions/, troubleshooting/, or patterns/).
