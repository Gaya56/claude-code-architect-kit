# Handoff State

As of 2026-03-26.

## What's Live

- All caching layers implemented
- Upstash secrets set
- Both Railway services SUCCESS

## Next Steps

- Distributed dispatch lock (`dispatch-outbound-reminders`) — live-only, no local dir, download first
- Outbound dedup (`zoho-webhook-receiver`) — live-only, no local dir, download first

## Deferred Refactors

- Shared Redis client
- Shared cache helpers
- MD5 → crc32
- Merge two `zoho-auth.ts` copies
