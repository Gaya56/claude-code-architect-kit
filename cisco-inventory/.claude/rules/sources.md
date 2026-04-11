---
description: Source priority for Cisco Webex and RoomOS documentation lookups
---

## Source Priority

1. **developer.webex.com** — Primary for Webex API endpoints, authentication, rate limits, pagination, and working examples.
2. **roomos.cisco.com** — Primary for RoomOS device behavior, macro runtime, xAPI command reference, and device configuration.
3. **Official Cisco documentation** — Platform reference, Control Hub capabilities, and device specifications.
4. **Official Cisco GitHub repos** — Working code samples, macro examples (`CiscoDevNet/roomdevices-macros-samples`).
5. **Trusted secondary sources** — Only when official sources do not clearly cover the topic.

- When citing API behavior, reference the specific documentation page.
- Never invent API endpoints or parameters — verify against official docs first.
- If official docs conflict with observed API behavior, note the discrepancy and trust the API response.
- Check the repo's own `DEPLOYMENT_COMMANDS.md` and `INVENTORY_COMMANDS.md` first — they may already have the answer.
