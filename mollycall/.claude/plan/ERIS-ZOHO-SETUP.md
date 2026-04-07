# Eris-Zoho Setup Plan

5-phase setup for Eris Canada Zoho CRM integration.
Client: `86b679be-14e5-4811-974b-543b5ceffb2b`

## Phases

| Phase | Task | Status |
|-------|------|--------|
| 0 | Ali generates OAuth creds in Zoho web UI | Manual |
| 1 | Claude runs 2 SQL statements (client_crm INSERT + clients UPDATE) | Ready |
| 2 | Token verification via edge function | Ready |
| 3 | Create 3 Zoho workflow rules (lead created, scheduled call, email opened) | Blocked — webhook payload format |
| 4 | Bookings | Deferred |
| 5 | E2E verification checklist | Pending |

**Note:** Zero code changes needed — multi-tenant auth is already built.
