# Example: Explaining a middleware pipeline

## Analogy
Think of middleware like a security checkpoint at an airport. Each station (middleware) checks one thing -- your ticket, your ID, your bags -- and either lets you through to the next station or sends you back.

## Diagram
```
Request --> [Auth] --> [RateLimit] --> [Validate] --> Handler
              |            |              |
              v            v              v
           401 Error   429 Error      400 Error
```

## Walkthrough
1. Request arrives at the first middleware (Auth)
2. Auth checks the JWT token -- valid? pass through. Invalid? return 401
3. RateLimit checks if this IP has exceeded its quota
4. Validate checks the request body against the schema
5. Only if all three pass does the request reach the actual handler

## Gotcha
Middleware order matters! If you put RateLimit before Auth, unauthenticated requests still count against your rate limit, which means attackers can exhaust legitimate users' quotas.
