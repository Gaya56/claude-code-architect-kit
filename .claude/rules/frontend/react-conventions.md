---
description: React conventions for frontend code
paths:
  - "src/components/**/*.tsx"
  - "src/components/**/*.jsx"
  - "**/*.tsx"
---

## React Conventions

- Prefer functional components with hooks over class components.
- Co-locate component, styles, and tests in the same directory.
- Keep components small. If it's over 200 lines, consider splitting.
- Use TypeScript for all new components.
- Memoize expensive computations with `useMemo` and callbacks with `useCallback` only when there's a measured performance need.
