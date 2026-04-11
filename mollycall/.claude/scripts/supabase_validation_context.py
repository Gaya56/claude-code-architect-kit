#!/usr/bin/env python3
"""
Supabase validation context — reads gate state, classifies touched paths
into change types, returns type-specific suggested checks.

Change types:
  migration_or_schema — SQL migrations or schema changes
  edge_function       — Supabase edge function code
  python_consumer     — Python code that reads from Supabase

Project ref: fbhzfsstmiadvgtxhnwt

Usage:
  python3 supabase_validation_context.py          # human readable
  python3 supabase_validation_context.py --json   # structured output
"""
# Script contents preserved from repo — see original for full implementation
