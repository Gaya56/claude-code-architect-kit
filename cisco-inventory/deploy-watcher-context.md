# Deploy Watcher Context

This file describes what we want the future deploy watcher workflow to become for the `Cisco-Inventory` repository on the `quick-macros` branch. The existing `deploy-watcher.md` file is only a reference example for structure, tone, and reporting style. The real watcher for this setup should stay focused on Cisco and Webex local validation work, not generic deployment monitoring.

The future workflow should be simple. A research agent should gather official guidance, commands, and snippets from sources such as Webex for Developers, RoomOS documentation, official Cisco documentation, and official GitHub repositories. After approval, the watcher or terminal side should run quick, careful local checks, use logs and API responses as the source of truth, and suggest the next safe action when results are clear or incomplete.

This setup should also help document what we learn so it is easy to repeat for other people later. The watcher should work together with lightweight local notes that track the codebase, proven commands, and proof of what worked. Only commands that are approved, tested, proven safe, and reusable should be recorded automatically. Control Hub must never be changed unless explicitly approved.

| Requirement | Expectation |
|-------------|-------------|
| Scope | Specific to `Cisco-Inventory` on branch `quick-macros` |
| Role of `deploy-watcher.md` | Reference example only |
| Research source priority | Official Webex, RoomOS, Cisco, and official GitHub sources first |
| Workflow | Research agent finds guidance, user approves, watcher validates locally |
| Default behavior | Read-only and careful by default |
| Control Hub safety | Never change Control Hub without explicit approval |
| Proof standard | Logs and API responses are the source of truth |
| Output style | Pass/fail status, short summary, and next safe action |
| Reusable learning | Record only approved, proven, reusable commands |
| Documentation goal | Keep the setup easy to understand, track, and reuse later |
