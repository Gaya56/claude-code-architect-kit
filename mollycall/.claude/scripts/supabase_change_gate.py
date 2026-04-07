#!/usr/bin/env python3
"""
Supabase change gate — hook gate for validating Supabase-related changes.

Hook modes:
  PreToolUse  — blocks edit tools if validation pending
  PostToolUse — sets pending flag when sensitive paths edited
  Stop        — blocks session end if pending

CLI commands:
  status     — show current gate state
  clear-pass — clear pending validation (passed)
  mark-fail  — mark validation as failed

State stored in .claude/tmp/supabase-validator-state.json

Sensitive paths:
  supabase/, molly_agent.py, molly_agent_playground.py,
  utils/company_context.py, utils/post_call.py, utils/config.py
"""
# Script contents preserved from repo — see original for full implementation
