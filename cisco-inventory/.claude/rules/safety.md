---
description: Safety rules for Webex API operations on Cisco RoomOS devices
---

## Safety

- Read operations are free to run. Mutating operations (Macros.Macro.Save, Activate, Deactivate, Remove, config pushes) require explicit user approval before execution.
- Always verify a device's `connectionStatus` is `connected` before attempting macro operations. If disconnected or `offline_expired`, report the status and stop.
- Never hardcode API tokens. Always use `$WEBEX_API_TOKEN` from the environment.
- When executing a macro operation, show the exact curl command and target device for user review before running.
- After any mutating operation, verify the result via a follow-up GET/check call.
- If an operation fails, log the error and move to the next device — do not retry blindly.
- Never delete or overwrite inventory CSV data without explicit approval.
- Only operate on Canadian PwC devices (naming pattern `CA-<CITY_TAG>-<ROOM_NUMBER>`). If a device does not match this pattern, skip it and report why.
