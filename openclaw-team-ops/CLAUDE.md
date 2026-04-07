# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this workspace is

An ops workspace for running two isolated OpenClaw AI assistant instances (Member A, Member B) via Docker Compose. The upstream source repo is cloned at `openclaw/` but is not modified — all customisation lives in env files and bind-mounted data directories outside the repo.

## Directory layout

```
openclaw/              # Upstream repo clone — do not edit
  .env.member-a        # Docker Compose vars for Member A (no secrets)
  .env.member-b        # Docker Compose vars for Member B (no secrets)
  docker-compose.yml   # Canonical Compose file (parametrised by env)

data/
  member-a/.openclaw/  # Persistent gateway config & state for Member A
    .env               # Provider API keys (loaded at runtime, never committed)
    openclaw.json      # Gateway config (mode, bind, allowedOrigins, channels)
  member-a/workspace/  # Agent workspace for Member A
  member-b/.openclaw/  # Same structure for Member B
  member-b/workspace/

tasks/                 # Planning notes
```

## Running the instances

All `docker compose` commands run from `openclaw/` using `--env-file` and `--project-name` to keep the two instances fully isolated.

```bash
# Start
docker compose --env-file .env.member-a --project-name openclaw-member-a up -d openclaw-gateway
docker compose --env-file .env.member-b --project-name openclaw-member-b up -d openclaw-gateway

# Stop
docker compose --env-file .env.member-a --project-name openclaw-member-a down
docker compose --env-file .env.member-b --project-name openclaw-member-b down

# Logs
docker compose --env-file .env.member-a --project-name openclaw-member-a logs -f openclaw-gateway

# Health (no auth required)
curl -s http://127.0.0.1:18789/healthz   # Member A
curl -s http://127.0.0.1:18791/healthz   # Member B
```

## Control UI

| Instance | URL | Token location |
|----------|-----|----------------|
| Member A | http://127.0.0.1:18789 | `openclaw/.env.member-a` → `OPENCLAW_GATEWAY_TOKEN` |
| Member B | http://127.0.0.1:18791 | `openclaw/.env.member-b` → `OPENCLAW_GATEWAY_TOKEN` |

Paste the token into Settings when the browser prompts for auth.

## Key architecture points

- **Image**: `ghcr.io/openclaw/openclaw:latest` (pre-built from GHCR, no local build needed). Pinned in both `.env.member-*` files as `OPENCLAW_IMAGE`.
- **Ports**: Member A → 18789/18790 (host). Member B → 18791/18792 (host). Container always listens on 18789/18790 internally.
- **Secrets flow**: Provider API keys (`OPENAI_API_KEY`, etc.) live in `data/<member>/.openclaw/.env`. OpenClaw loads that file automatically at runtime from `~/.openclaw/.env` inside the container (bind-mounted). They are never in `docker-compose.yml` or the repo's `.env.member-*` files.
- **Config persistence**: `openclaw.json` is written to `data/<member>/.openclaw/` on the host via bind mount, so it survives container replacement.
- **Isolation**: Each instance has its own Docker Compose project name, network, port range, config dir, workspace, and gateway token. They share only the image.

## Adding channels or changing config

Use the CLI container (post-gateway-start) or the Control UI. CLI example:

```bash
# Telegram channel for Member A
docker compose --env-file .env.member-a --project-name openclaw-member-a \
  run --rm openclaw-cli channels add --channel telegram --token "<token>"

# Arbitrary config key
docker compose --env-file .env.member-a --project-name openclaw-member-a \
  run --rm openclaw-cli config set <key> <value>
```

Channel tokens belong in `data/<member>/.openclaw/.env`, not in `openclaw.json`.

## Updating the image

```bash
docker pull ghcr.io/openclaw/openclaw:latest
docker compose --env-file .env.member-a --project-name openclaw-member-a up -d --force-recreate openclaw-gateway
docker compose --env-file .env.member-b --project-name openclaw-member-b up -d --force-recreate openclaw-gateway
```

## Reference docs

- Docker setup: https://docs.openclaw.ai/install/docker
- Configuration: https://docs.openclaw.ai/gateway/configuration
- Channels: https://docs.openclaw.ai/channels
