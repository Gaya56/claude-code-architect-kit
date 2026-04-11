# 9 Agent Skills Repos I Tried (And Now I Can't Stop Using Them)

**Joe Njenga**

*Following*
*9 min read · 20 hours ago*
*238 | 2*

---

Agent skills are becoming the new gold standard for building AI agents that work, but no one tells you how messy the ecosystem really is.

Finding the right skill that is safe and works is a guessing game; most repos look impressive… until you try to use them.

I know, because I went through dozens of them. I went down the rabbit hole — testing repo after repo and found a handful of agent skills repos are doing better than even some AI tools combined.

To get the best out of any of these agents' skills, you need to understand the basics of skills.

## What Is an Agent Skill?

A skill is simply a folder with a SKILL.md file inside.

That file contains instructions, code examples, and context that teach your AI agent how to perform specific tasks. It's the playbook the agent reads before doing the work.

Here's what a basic skill structure looks like:

```
my-skill/
├── SKILL.md          # Required: instructions + metadata
├── scripts/          # Optional: helper scripts
└── references/       # Optional: docs and examples
```

The SKILL.md file has two parts.

1. A YAML frontmatter with metadata (name, description, triggers)
2. Actual instructions in markdown.

When you ask your agent to do something, it checks which skills match the task and loads the relevant context.

But,

## Why Do We Need Skill Libraries?

Writing skills from scratch take time.

You need to understand the tool, write clear instructions, test edge cases, and refine the prompts. Consider also that every tool in your stack is going to take days of work.

Skill libraries solve this problem.

Someone already figured out the best way to make Claude work with Obsidian, or generate UI mockups, or query scientific databases. You install their skill and get production-ready capabilities in seconds.

The challenge is finding skills that work.

GitHub is flooded with repos that look promising but break due to outdated dependencies or have vague instructions.

Sometimes skills that worked six months ago do not work with current models.

I tested over 40 repos to find the ones worth your time.

These 9 stood out either because they're actively maintained, have serious community backing, or solve a domain-specific problem.

---

## Curated Collection Repos

These are the "awesome list" style repo with massive collections that aggregate skills from across the ecosystem. If you want variety and coverage, this is a great place to start.

### 1. Awesome Claude Skills

Awesome Claude Skills is Composio's curated collection of practical Claude skills for enhancing productivity across Claude.ai, Claude Code, and the Claude API.

It covers everything from document processing to SaaS automation. What makes it stand out is the Composio integration. You can connect Claude to 500+ apps — Gmail, Slack, GitHub, Notion, and more

The repo organizes skills into clear categories: document processing (docx, pdf, pptx, xlsx), development tools, business automation, and creative workflows. Each skill folder includes working examples and integration guides.

**Key Features**

- 78+ app automation skills via Composio SDK
- Document manipulation skills from Anthropic's official repo
- Pre-built workflows for CRM, project management, and marketing tools
- Works across Claude.ai, Claude Code, and API

The setup is easy: add the plugin, run the connect-apps setup, and you're sending emails from Claude within minutes.

Link: Awesome Claude Skills

### 2. Antigravity Awesome Skills

Antigravity Awesome Skills is the largest collection I found — 1,239+ skills and growing. It works across Claude Code, Cursor, Gemini CLI, Codex, and several other AI coding tools.

The repo includes official skills from Anthropic, Vercel, OpenAI, Supabase, and Microsoft. Community contributions fill in the gaps with everything from security auditing to marketing automation.

What I like is the grouping of skills into bundles by role — Web Developer, Security Engineer, DevOps, and QA Testing.

**Key Features**

- 1,239+ skills across 9 categories
- Starter bundles organized by role (Web Wizard, Security Engineer, etc.)
- Cross-platform support (Claude Code, Cursor, Gemini CLI, Codex, Antigravity)
- Built-in web app for searching and filtering skills

They also built a web app for browsing. Search, filter by category, and copy skills directly. It's faster than scrolling through GitHub folders.

Link: Antigravity Awesome Skills

### 3. Agent Skills for Context Engineering

Agent Skills for Context Engineering is a framework for understanding how to build effective agent systems.

The repo was cited in academic research from Peking University as foundational work on static skill architecture. It covers context fundamentals (what goes into the context window and why), memory systems (short-term, long-term, graph-based), multi-agent patterns (orchestrator, peer-to-peer, hierarchical), and evaluation frameworks.

Each skill includes scripts and examples in Python. If you're building production agent systems, this is where you learn the architecture.

**Key Features**

- 15+ foundational skills for context engineering
- Memory systems design (append-only, semantic, graph-based)
- Multi-agent orchestration patterns
- Evaluation and debugging frameworks for agent systems

The skills work as a Claude Code plugin. Install via the marketplace, and Claude activates relevant skills based on your task.

Link: Agent Skills for Context Engineering

---

## Specialized Skills

These repos do one thing very well. They are focused tools that solve specific problems better than anything else I tested.

### 4. UI UX Pro Max Skill

UI UX Pro Max is an AI skill that generates complete design systems on demand. Give it a product description, and it returns patterns, colors, typography, effects, and anti-patterns tailored to your industry.

The reasoning engine has 161 industry-specific rules covering everything from SaaS to beauty spas to fintech. When you say "build a landing page for my wellness app," it pulls the right style (Soft UI Evolution), palette (calming aqua, sage green), and typography (Cormorant Garamond / Montserrat).

The skill works across 15 tech stacks — React, Next.js, SwiftUI, Flutter, Tailwind. Install via CLI or the Claude marketplace.

**Key Features**

- 161 industry-specific design reasoning rules
- 67 UI styles (Glassmorphism, Neubrutalism, Bento Grid, etc.)
- 57 curated font pairings with Google Fonts links
- Pre-delivery checklist for accessibility and responsiveness

The output is a complete design system you can copy into your project and start building.

Link: UI UX Pro Max Skill

### 5. Humanizer

Humanizer removes the telltale signs of AI-generated writing. It's based on Wikipedia's "Signs of AI writing" guide and maintained by WikiProject AI Cleanup after reviewing thousands of AI-generated texts.

The skill detects 29 patterns. Significance inflation ("marking a pivotal moment in the evolution of…"). Copula avoidance ("serves as" instead of "is"). Em dash overuse. Sycophantic tone. Rule of three. Each pattern has a before/after example so you understand what's being fixed.

Paste a sample of your own writing, and it matches your rhythm, word choices, and quirks instead of producing generic "clean" output.

The final pass runs an "obviously AI-generated" audit and rewrites anything that still sounds synthetic.

**Key Features**

- 29 detection patterns based on Wikipedia research
- Voice calibration to match your personal writing style
- Two-pass rewrite with final audit
- Works with Claude Code and OpenCode

Install by cloning into your skills directory, paste the text, and run /humanizer.

Link: Humanizer

### 6. Last30Days Skill

Last30Days researches any topic across Reddit and X from the past 30 days, then writes prompts you can copy and paste.

It's prompt research automated. The skill synthesizes findings into actionable output.

For example, a legal prompt query, it identified hallucination prevention as the dominant theme, extracted five key prompting strategies, and generated a ready-to-use prompt with role assignment, structured output requirements, and humility enforcement.

**Key Features**

- Scans Reddit and X for discussions from the last 30 days
- Returns engagement metrics (upvotes, likes, reposts)
- Generates copy-paste-ready prompts for target tools
- Works for trend research, product research, and news analysis

Requires OpenAI API key for Reddit research and xAI API key for X.

Link: Last30Days Skill

---

## Domain-Specific Repos

These repos target specific ecosystems. If you work in science, use Obsidian, or build on OpenAI's stack, these are built for you.

### 7. Claude Scientific Skills

Claude Scientific Skills is a collection of 140 skills for scientific computing, research, and analysis.

It covers bioinformatics, genomics, cheminformatics, drug discovery, proteomics, clinical research, medical imaging, and more. The repo connects to 28+ scientific databases — PubMed, ChEMBL, UniProt, ClinVar, COSMIC, DrugBank.

**Key Features**

- 140 scientific skills across 12+ disciplines
- 28+ database integrations (PubMed, UniProt, ChEMBL, etc.)
- 55+ Python packages with automated setup
- Specialized workflows for genomics, drug discovery, and medical imaging

Each skill includes the required Python packages, such as RDKit for molecular analysis, Scanpy for single-cell genomics, and DeepChem for drug discovery ML.

Link: Claude Scientific Skills

### 8. OpenAI Skills (Codex)

OpenAI Skills is the official skills catalog for OpenAI's Codex CLI. It's the reference implementation for how skills should be structured.

The repo organizes skills into three tiers. System skills (.system) are auto-installed — shell commands, file operations, basic utilities. Curated skills (.curated) are vetted by OpenAI. Experimental skills (.experimental) are community contributions still being tested.

The skill installer ($skill-installer) handles discovery and setup. Run it, search for what you need, and install with one command.

**Key Features**

- Three-tier organization (system, curated, experimental)
- Built-in skill installer for discovery and setup
- Multi-language support (Python, JavaScript, Shell, Swift, PowerShell)
- Follows the agentskills.io open standard

If you're using Codex or want to see how OpenAI structures their skills, this is the best source.

Link: OpenAI Skills

### 9. Obsidian Skills

Obsidian Skills is maintained by Kepano, the CEO of Obsidian. That tells you these skills are designed with deep knowledge of how the app works.

The repo contains five skills: obsidian-markdown handles Obsidian's extended markdown syntax (callouts, embeds, comments). obsidian-bases covers the new Bases feature for structured data. json-canvas works with the Obsidian Canvas format. obsidian-cli integrates with the command line. defuddle extracts clean content from web pages for import.

Each skill follows the Agent Skills specification from agentskills.io. They work with Claude Code, Codex CLI, and OpenCode out of the box.

**Key Features**

- 5 official skills from the Obsidian CEO
- Covers Obsidian-specific syntax, Bases, Canvas, and CLI
- Follows the agentskills.io specification
- Works across Claude Code, Codex CLI, and OpenCode

Clone into your skills directory or install via the supported platforms.

Link: Obsidian Skills

---

## Let's Connect!

If you are new to my content, my name is Joe Njenga

Join thousands of other software engineers, AI engineers, and solopreneurs who read my content daily on Medium and on YouTube where I review the latest AI engineering tools and trends. If you are more curious about my projects and want to receive detailed guides and tutorials, join thousands of other AI enthusiasts in my weekly AI Software engineer newsletter

If you would like to connect directly, you can reach out here:
