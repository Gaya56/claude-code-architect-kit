# Articles & Research Index

> Saved articles, research findings, and references collected across sessions.

## Articles

### 9 Agent Skills Repos I Tried (And Now I Can't Stop Using Them)

- **File:** [artical-4-7-2026.md](artical-4-7-2026.md)
- **Author:** Joe Njenga | **Date saved:** 2026-04-07
- **Summary:** Field-tested roundup of 9 agent skills repos. Covers curated collections (Awesome Claude Skills, Antigravity, Context Engineering), specialized tools (UI UX Pro Max, Humanizer, Last30Days), and domain-specific repos (Scientific Skills, OpenAI Codex, Obsidian Skills).
- **Key takeaway:** The agentskills.io open standard is becoming the universal skill format across 30+ platforms. Repos that follow it are future-proof.
- **Action taken:** Cloned 5 repos and indexed 3 others into `claude-code-examples/`. See [claude-code-examples/INDEX.md](../claude-code-examples/INDEX.md) for full details.

## Past Research (from memory)

### Web Search & Research Skills (discovered pre-2026-04-07)

| Repo | Stars | What It Does |
| --- | --- | --- |
| [mvanhorn/last30days-skill](https://github.com/mvanhorn/last30days-skill) | 19k | Multi-source web research (Reddit, X, YouTube, HN) |
| [tavily-ai/skills](https://github.com/tavily-ai/skills) | 185 | Official Tavily skills: search, extract, crawl, deep research |
| [SawyerHood/dev-browser](https://github.com/SawyerHood/dev-browser) | 5.5k | Playwright browser automation for Claude |
| [PleasePrompto/google-ai-mode-skill](https://github.com/PleasePrompto/google-ai-mode-skill) | 136 | Free Google search, zero-config |
| [ckckck/UltimateSearchSkill](https://github.com/ckckck/UltimateSearchSkill) | 253 | Multi-engine: Grok + Tavily + FireCrawl |

### Config & Template References (discovered pre-2026-04-07)

| Repo | What It Does |
| --- | --- |
| [jarrodwatts/claude-code-config](https://github.com/jarrodwatts/claude-code-config) | Complete .claude/ directory reference |
| [alirezarezvani/claude-code-skill-factory](https://github.com/alirezarezvani/claude-code-skill-factory) | Tooling to build skills at scale |
| [davepoon/buildwithclaude](https://github.com/davepoon/buildwithclaude) | Hub for skills, agents, commands, hooks, plugins |
| [alirezarezvani/claude-skills](https://github.com/alirezarezvani/claude-skills) | 220+ ready-to-use skills |

### Memory & Context Engineering Gaps (2026-04-07)

Findings from doc-research session — 5 gaps identified in our setup:

1. No `/dream` or auto-dream setup (available since v2.1.59)
2. No domain-based memory structure (flat files won't scale)
3. No `memory: user` scope in subagent frontmatter
4. No SessionStart hook for auto-loading context
5. CLAUDE.md has no Global Memory section referencing memory system

See [project_memory_gaps.md](../memory notes) for implementation priorities.
