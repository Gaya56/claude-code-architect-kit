#!/usr/bin/env bash
set -euo pipefail

# Guard: jq required
command -v jq >/dev/null 2>&1 || { echo '{"decision":"block","reason":"jq is required but not installed"}'; exit 0; }

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null || true)

# Only check commands that target the Webex API
if [[ "$COMMAND" != *"webexapis.com"* ]] && [[ "$COMMAND" != *"WEBEX_API_TOKEN"* ]]; then
  exit 0
fi

# Verify token is set
if [[ -z "${WEBEX_API_TOKEN:-}" ]]; then
  echo '{"decision":"block","reason":"WEBEX_API_TOKEN is not set. Load it with: source .env"}'
  exit 0
fi

exit 0
