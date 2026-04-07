# CLAUDE.md — MollyCall Redis Workflow

Goal: implement the Redis roadmap safely, simply, and in small steps.

## Current Context

- This repo is the MollyCall multi-tenant platform.
- Active workspace target:
  - `CLIENT_ID=3956e8b4-7b23-4678-9530-2427658e4556`
  - `company_name=MollyAgent`
  - inbound `mollyagent-dispatcher`
  - outbound `mollyagent-outbound`
- Live Supabase project: `fbhzfsstmiadvgtxhnwt`
- Local `supabase/` can drift. Cloud state wins for schema and deployed edge functions.

## What Matters Most

- Keep changes small and easy to verify.
- Look first. Do not assume the roadmap is perfectly current.
- Stay close to the Redis plan in `todo/redis-roadmap/`.
- Prefer one-file steps whenever practical.
- Test after each meaningful change.
- If Redis fails, runtime behavior should still work.

## Communication Style

Default to short answers. Lead with a brief paragraph, then a table if mapping is useful. Skip filler and summaries. In plan mode, full detail is expected.

## Working Style

Preferred loop:

1. read the roadmap step and current code
2. plan the next small change
3. implement one file if possible
4. reread the file and inspect the diff
5. run focused tests
6. note any remaining smoke check or production risk

Use `.claude/scripts/workflow_gate.py` when it helps keep the step organized, but do not turn simple work into ceremony.

## Supabase and Zoho

- For Supabase work, verify live state before trusting local `supabase/`
- The `supabase` plugin is enabled — use it for live schema introspection, edge function logs, and SQL against project `fbhzfsstmiadvgtxhnwt`
- Keep the existing Supabase validator flow for Supabase-sensitive edits
- For Zoho auth, rate limits, or API behavior, verify against official docs before changing contracts
- Zoho MCP is available — use it for direct CRM/Bookings state inspection

## Current Redis Focus

Follow the roadmap priority table (`todo/redis-roadmap/README.md`):

1. Zoho OAuth token cache — `_shared/zoho-auth.ts` (fixes active rate-limit risk)
2. Distributed dispatch lock — `supabase/functions/dispatch-outbound-reminders/index.ts`
3. Outbound dedup — `supabase/functions/zoho-email-webhook/index.ts`
4. Mid-call state — `molly_agent.py`
5. Retrieval cache — `utils/retrieval.py`

Read the phase doc before starting each one.

## Active Agents

| Agent | When to use | Color |
|-------|-------------|-------|
| `Pre-Brainstorm` | Call wrong, record missing, service crashed | red |
| `define-it` | Behavior needs agreement before implementation | blue |
| `supabase-zoho-verifier` | Before/after Supabase or Zoho contract change | green |
| `infra-ops` | Explicit Railway or LiveKit ops only | yellow |
| `test-runner` | After implementing a change | cyan |
| `code-inspector` | Need exact paths, line refs, call sites | purple |
| `deploy-watcher` | After push/deploy, monitor until healthy | orange |

## Enabled Plugins

All globally available — agents and skills reference them automatically:

| Plugin | Use for |
|--------|---------|
| `supabase` | Live schema, edge function logs, SQL against `fbhzfsstmiadvgtxhnwt` |
| `railway` | Service status, logs, deployments |
| `context7` | Context tracking across long investigations |
| `code-simplifier` | Code quality and reuse checks |
| `claude-md-management` | CLAUDE.md audit and improvement |
| `Zoho MCP` | Direct CRM and Bookings inspection |

Full integration map: `.claude/PLUGIN-AGENT-MAP.md`

Project commands:

- `/plan-change`
- `/implement-one-file`
- `/verify-supabase`
- `/test-change`
- `/save-and-compact`
- `/save-and-document`

## Safety

- Never commit secrets or `.env`
- Never guess when live state or docs can answer it
- Do not treat `UI/dashboard/app/api/health/route.ts` as the current client source of truth
