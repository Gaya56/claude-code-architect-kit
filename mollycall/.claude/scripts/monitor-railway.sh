#!/usr/bin/env bash
# Polls railway service status waiting for both services to reach RUNNING.
# Max 40 polls at 5s intervals.
# Exit codes: 0 = healthy, 1 = failed, 2 = timeout
# Requires: RAILWAY_TOKEN

set -euo pipefail

MAX_POLLS=40
INTERVAL=5
SERVICES=("mollyagent-agent" "mollyagent-outbound-agent")

for ((i=1; i<=MAX_POLLS; i++)); do
  echo "Poll $i/$MAX_POLLS..."
  STATUS=$(railway service status --all 2>/dev/null || echo "ERROR")

  ALL_RUNNING=true
  for svc in "${SERVICES[@]}"; do
    if ! echo "$STATUS" | grep -q "$svc.*RUNNING"; then
      ALL_RUNNING=false
    fi
    if echo "$STATUS" | grep -q "$svc.*\(CRASHED\|FAILED\)"; then
      echo "FAILED: $svc crashed"
      railway logs --service "$svc" --tail 50
      exit 1
    fi
  done

  if $ALL_RUNNING; then
    echo "All services RUNNING"
    for svc in "${SERVICES[@]}"; do
      echo "--- Logs: $svc (last 2 min) ---"
      railway logs --service "$svc" --tail 20
    done
    exit 0
  fi

  sleep $INTERVAL
done

echo "TIMEOUT: Services did not reach RUNNING in $((MAX_POLLS * INTERVAL))s"
for svc in "${SERVICES[@]}"; do
  echo "--- Logs: $svc (last 5 min) ---"
  railway logs --service "$svc" --tail 50
done
exit 2
