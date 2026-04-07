# Claude Code Examples & Reference Index

> Cloned repos and reference links for Claude Code compatible skills.

## Cloned Repos (local)

### agentskills.io Specification

- **Path:** `/workspaces/claude-code-architect-kit/claude-code-examples/agentskills-spec`
- **Repo:** [agentskills/agentskills](https://github.com/agentskills/agentskills)
- The open standard for portable agent skills. Contains the full specification, docs site (Mintlify), and a Python validation library (`skills-ref`). Originally created by Anthropic, now community-developed. Supported by 30+ platforms.

### Obsidian Skills

- **Path:** `/workspaces/claude-code-architect-kit/claude-code-examples/obsidian-skills`
- **Repo:** [kepano/obsidian-skills](https://github.com/kepano/obsidian-skills)
- 5 official skills from Obsidian's CEO. Covers Obsidian markdown syntax, Bases, Canvas, CLI, and web content extraction (defuddle). Follows the agentskills.io spec. Works across Claude Code, Codex CLI, and OpenCode.

### Humanizer

- **Path:** `/workspaces/claude-code-architect-kit/claude-code-examples/humanizer`
- **Repo:** [blader/humanizer](https://github.com/blader/humanizer)
- **Stars:** 12,683 | **Forks:** 1,065 | **Last pushed:** 2026-04-01
- Removes AI-generated writing patterns using 29 detection rules from Wikipedia's "Signs of AI writing" guide. Calibrates to your personal voice. Two-pass rewrite with final audit. Planned for use with MollyCall voice agent prompts and caller scripts.

### Agent Skills for Context Engineering

- **Path:** `/workspaces/claude-code-architect-kit/claude-code-examples/Agent-Skills-for-Context-Engineering`
- **Repo:** [muratcankoylan/Agent-Skills-for-Context-Engineering](https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering)
- **Stars:** 14,819 | **Forks:** 1,168 | **Last pushed:** 2026-03-22
- Framework for building agent systems. Covers context engineering, memory design (short-term, long-term, graph-based), multi-agent orchestration patterns, and evaluation frameworks. Cited in Peking University research. Includes Python examples, a researcher agent, and skill templates.

### Awesome Claude Skills (Composio)

- **Path:** `/workspaces/claude-code-architect-kit/claude-code-examples/awesome-claude-skills`
- **Repo:** [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills)
- **Stars:** 51,808 | **Forks:** 5,479 | **Last pushed:** 2026-02-19
- Connects Claude to 500+ external apps via Composio SDK (handles OAuth/API auth). 78+ automation skills for Gmail, Slack, GitHub, Notion, Salesforce, HubSpot, Jira, and more. Covers document processing, business automation, communication, dev tools, and creative workflows.

## Planned Integrations

These repos will likely use skills from this collection:

### MollyCall

- **Repo:** [Gaya56/MollyCall](https://github.com/Gaya56/MollyCall.git)
- Voice agent project. Humanizer skill will help write natural-sounding caller scripts, SMS messages, and conversational prompts.

### Eris-Canada

- **Repo:** [Gaya56/Eris-Canada](https://github.com/Gaya56/Eris-Canada.git)
- Planned integration with claude-code-examples skills.

### Molly Agent (Dashboard)

- **Repo:** [Gaya56/mollyagent](https://github.com/Gaya56/mollyagent) | **Branch:** `coding-tools`
- Future business dashboard. UI UX Pro Max skill will be used here for design system generation when building the frontend.

## Reference Only (not cloned)

### Antigravity Awesome Skills

- **Repo:** [sickn33/antigravity-awesome-skills](https://github.com/sickn33/antigravity-awesome-skills)
- **Stars:** 31,266 | **Forks:** 5,209 | **Last pushed:** 2026-04-07 (today)
- Largest agent skills collection — 1,377 skills across 9 categories. Cross-platform (Claude Code, Cursor, Gemini CLI, Codex). Includes installer CLI, role bundles, and a web app for browsing. ~47MB — too large to clone, cherry-pick as needed.

| Category | Skills | What It Covers |
| --- | --- | --- |
| `architecture` | 88 | Software architecture, design patterns, DDD, C4 diagrams, event sourcing |
| `business` | 75 | Marketing, product management, sales, HR, legal, growth strategy |
| `data-ai` | 257 | AI/ML engineering, LLM apps, data pipelines, ML ops, agent frameworks |
| `development` | 186 | Language-specific coding (Python, Go, JS/TS, Rust), frameworks, code quality |
| `general` | 346 | Documentation, code review, prompt engineering, brainstorming, productivity |
| `infrastructure` | 122 | AWS/Azure/GCP, Kubernetes, Docker, CI/CD, DevOps, monitoring |
| `security` | 170 | Security auditing, pen testing, compliance (GDPR, PCI), incident response |
| `testing` | 31 | TDD, E2E testing, load testing, browser automation, QA workflows |
| `workflow` | 102 | Git workflows, PR creation, task orchestration, multi-agent coordination |

Skills are flat under `skills/` — categorization is in `CATALOG.md` and `data/catalog.json`.

### UI UX Pro Max Skill

- **Repo:** [nextlevelbuilder/ui-ux-pro-max-skill](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill)
- **Stars:** 60,489 | **Forks:** 6,009 | **Last pushed:** 2026-04-03
- Generates complete design systems on demand — colors, typography, UI patterns, effects, and anti-patterns tailored by industry. 161 industry rules, 67 UI styles, 57 font pairings. Works across 15 tech stacks (React, Next.js, Flutter, Tailwind, etc.). Clone when ready to build dashboards.

### Claude Scientific Skills

- **Repo:** [K-Dense-AI/claude-scientific-skills](https://github.com/K-Dense-AI/claude-scientific-skills)
- **Stars:** 17,579 | **Forks:** 1,943 | **Last pushed:** 2026-04-03
- 140 skills for scientific computing, research, and analysis across 12+ disciplines. Connects to 28+ databases (PubMed, UniProt, ChEMBL, ClinVar, COSMIC, DrugBank). Requires 55+ Python packages — heavy install, best used as a structural reference unless doing scientific work.

| Category | Examples |
| --- | --- |
| Bioinformatics | Genomics, proteomics, single-cell analysis (Scanpy) |
| Chemistry | Molecular analysis (RDKit), cheminformatics |
| Drug Discovery | ML pipelines (DeepChem), DrugBank integration |
| Clinical | Medical imaging, ClinVar queries, clinical research |
| General | Data analysis, visualization, statistical workflows |
