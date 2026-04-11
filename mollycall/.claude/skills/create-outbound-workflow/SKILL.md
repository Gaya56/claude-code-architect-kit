---
name: create-outbound-workflow
description: Architecture guide for adding new Zoho-triggered outbound call workflows. Step-by-step from trigger definition to data source wiring.
---

# Create Outbound Workflow

Guide for adding new Zoho-triggered outbound call workflows.

## Steps

1. **Define trigger type** — what Zoho event starts the call
2. **Create YAML prompt** — the conversation script
3. **Register in prompt.py** — add to `YAML_MAP`
4. **Wire data source** — choose pattern:
   - **Pattern A:** Zoho webhook → direct trigger
   - **Pattern B:** Edge function INSERT → DB trigger

## Verification

```sql
-- Check trigger type exists
SELECT * FROM outbound_triggers WHERE type = '<your_type>';
```

## Critical Gotchas

- `Who_Id` vs `What_Id` — check which Zoho field holds the contact
- Webhook payload format — raw_data_content may be rejected
- Agent name must match `mollyagent-outbound` exactly
