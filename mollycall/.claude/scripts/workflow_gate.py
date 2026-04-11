#!/usr/bin/env python3
"""
One-file-at-a-time enforcement gate.

Hook modes:
  PreToolUse  — blocks edits with no approved file or if verification pending;
                enforces single-file rule by comparing touched paths to active_file
  PostToolUse — sets pending_verification=True
  Stop        — blocks if verification pending

CLI commands:
  status                                    — show current state
  approve-step --file FILE --summary TEXT --tests TEXT  — approve a file for editing
  complete-step --result pass|fail --notes TEXT         — mark verification done

State stored in .claude/tmp/workflow-state.json
"""
# Script contents preserved from repo — see original for full implementation
