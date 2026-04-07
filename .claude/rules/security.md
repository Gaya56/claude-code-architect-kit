---
description: Security rules applied to all files
---

## Security

- Never hardcode secrets, tokens, or credentials. Use environment variables.
- Validate and sanitize all external input (user input, API responses, file contents).
- Use parameterized queries for database operations. Never concatenate user input into SQL.
- Apply the principle of least privilege to file permissions, API scopes, and IAM roles.
- Log security-relevant events but never log sensitive data (passwords, tokens, PII).
