#!/usr/bin/env bash
# Hook: PreToolUse (Edit|Write)
# Blocks edits to protected files. Reads tool input from stdin as JSON.
# Referenced in .claude/settings.json under hooks.PreToolUse

set -euo pipefail

PROTECTED_PATTERNS=(
  ".env"
  ".env.*"
  "*.pem"
  "*.key"
  "credentials.*"
)

# Read the tool input from stdin
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.file_path // .filePath // empty' 2>/dev/null || true)

if [ -z "$FILE_PATH" ]; then
  exit 0
fi

BASENAME=$(basename "$FILE_PATH")

for PATTERN in "${PROTECTED_PATTERNS[@]}"; do
  # shellcheck disable=SC2254
  case "$BASENAME" in
    $PATTERN)
      echo "BLOCKED: Cannot edit protected file: $FILE_PATH"
      echo "reason: matches protected pattern '$PATTERN'"
      exit 2
      ;;
  esac
done

exit 0
