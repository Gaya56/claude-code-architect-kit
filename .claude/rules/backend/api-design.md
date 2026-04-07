---
description: API design rules for backend code
paths:
  - "src/api/**/*"
  - "api/**/*"
  - "server/**/*"
---

## API Design

- Use RESTful naming: plural nouns for collections, singular for items.
- Return consistent error shapes: `{ error: { code, message, details? } }`.
- Always validate request bodies against a schema before processing.
- Use appropriate HTTP status codes (don't return 200 for errors).
- Include pagination for list endpoints from the start.
