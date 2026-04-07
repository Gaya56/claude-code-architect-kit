#!/usr/bin/env bash
# Hook: Stop
# Runs when Claude finishes a response. Use for cleanup, notifications, etc.
# Referenced in .claude/settings.json under hooks.Stop

set -euo pipefail

# Example: log session activity (uncomment to enable)
# echo "[$(date -Iseconds)] Session stopped" >> /tmp/claude-activity.log

exit 0
