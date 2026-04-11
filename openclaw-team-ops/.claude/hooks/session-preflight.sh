#!/usr/bin/env bash
set -euo pipefail

# Always exit 0 — never block session start
trap 'echo "{\"systemMessage\":\"Preflight: script error\"}"; exit 0' ERR

DIR="${CLAUDE_PROJECT_DIR:-.}"
STATUS=""

# --- Check 1: Docker daemon ---
if ! command -v docker >/dev/null 2>&1; then
  STATUS+="Docker: not installed"
elif ! timeout 3 docker info >/dev/null 2>&1; then
  STATUS+="Docker: daemon not running"
else
  STATUS+="Docker: OK"
fi

# --- Check 2: Env files ---
ENV_OK=""
ENV_MISS=""
for label_path in \
  "A:openclaw/.env.member-a" \
  "B:openclaw/.env.member-b" \
  "secrets-A:data/member-a/.openclaw/.env" \
  "secrets-B:data/member-b/.openclaw/.env"; do
  label="${label_path%%:*}"
  path="${label_path#*:}"
  if [[ -f "${DIR}/${path}" ]]; then
    ENV_OK+=" ${label}"
  else
    ENV_MISS+=" ${label}"
  fi
done
STATUS+=" | Env:${ENV_OK:- none}"
if [[ -n "$ENV_MISS" ]]; then
  STATUS+=" (missing:${ENV_MISS})"
fi

# --- Check 3: Health endpoints ---
HEALTH_A="down"
HEALTH_B="down"
curl -s --max-time 2 http://127.0.0.1:18789/healthz >/dev/null 2>&1 && HEALTH_A="up"
curl -s --max-time 2 http://127.0.0.1:18791/healthz >/dev/null 2>&1 && HEALTH_B="up"
STATUS+=" | Health: A ${HEALTH_A} B ${HEALTH_B}"

# --- Check 4: Port conflicts ---
PORT_STATUS=""
for port in 18789 18791; do
  if command -v ss >/dev/null 2>&1; then
    listeners=$(ss -tlnp 2>/dev/null | grep -c ":${port} " || echo 0)
  elif command -v lsof >/dev/null 2>&1; then
    listeners=$(lsof -iTCP:${port} -sTCP:LISTEN 2>/dev/null | grep -c . || echo 0)
  else
    PORT_STATUS+=" ${port}:unknown"
    continue
  fi
  if [[ "$listeners" -gt 0 ]]; then
    PORT_STATUS+=" ${port}:in-use"
  else
    PORT_STATUS+=" ${port}:free"
  fi
done
STATUS+=" | Ports:${PORT_STATUS}"

# --- Output ---
JSON_STATUS=$(printf '%s' "$STATUS" | tr -d '\n\r\t' | sed 's/\\/\\\\/g; s/"/\\"/g')
echo "{\"systemMessage\":\"Preflight: ${JSON_STATUS}\"}"
exit 0
