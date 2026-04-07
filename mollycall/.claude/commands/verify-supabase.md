Inspect local code + `workflow_gate.py status`.
Verify live Supabase state first (plugin preferred).
Run `supabase_validation_context.py --json` if needed.
Report verified facts, drift, pass/block recommendation.
Clear gate with `supabase_change_gate.py clear-pass` on pass.
