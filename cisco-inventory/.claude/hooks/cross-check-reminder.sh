#!/usr/bin/env bash
set -euo pipefail

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty' 2>/dev/null || true)

# Skip if not a Webex API call
[[ "$COMMAND" != *"webexapis.com"* ]] && exit 0

# Skip if not a POST (check both -X POST and --request POST)
[[ "$COMMAND" != *"-X POST"* ]] && [[ "$COMMAND" != *"--request POST"* ]] && exit 0

# Macro.Get is read-only, skip it
[[ "$COMMAND" == *"Macros.Macro.Get"* ]] && exit 0

# Remind to cross-check before mutations
echo '{"systemMessage":"Reminder: Have you cross-checked research findings against validation results? Use /cross-check before proceeding with mutations."}'
exit 0
