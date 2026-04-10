# Changelog

## 0.1.1 (2026-04-10)

**Interaction model fix**
- All 8 commands now ask one question at a time instead of dumping multi-field forms. New top-level "Interaction Rules" section in `fundraising/SKILL.md` applies globally.
- `/before-fundraising`: profile and fundraising context collected as sequential single-field questions, with stage-specific field lists
- `/product-metrics`: metrics collected in logical chunks of 2-4 related items per domain (e.g., SaaS: revenue & growth → retention → unit economics → efficiency)
- `/due-diligence`: DD questions walked through one at a time per category, with per-category grade summaries
- `/pitch-deck`, `/pitch`, `/deal-room`, `/fundraising-strategy`, `/fundraising-stage`: replaced batch-question shorthand with explicit references to the Interaction Rules

**Competitive analysis**
- `/pitch-deck` step 2 now requires a "Competitive landscape" extraction with category-specific prompts (AI coding, foundation models, agent frameworks, vertical SaaS, dev infra, consumer, fintech, marketplace, and more)
- Step 5 adds a dedicated Competition slide guidance block: comparison table (not 2×2 matrix), 4-6 honest dimensions including some the founder loses on, explicit wedge statement
- Competition promoted from optional to required at pre-seed, seed, and Series A stages
- Expanded category coverage to 35+ verticals with top 3-6 market leaders per category (2024-2026 snapshot): AI infra, horizontal AI apps, vertical AI, deep tech, non-AI categories
- `/pitch` sub-agent must ask at least one competitive question during Q&A, with category-specific defaults; pushes back on "we don't really have competitors" framing
- 5-dimension scoring: "Market conviction" renamed to "Market & competition" with explicit competitive clarity in the rubric

**README overhaul**
- New sections: "Who Needs This Skill" (6 user personas), "Why You Should Use This Skill" (tightened failure-mode summary + 4 value props), "How This Differs From a Financial Advisor (FA)" (comparison table)
- New "Example: a seed round, start to finish" walkthrough showing a realistic Acme → a16z term sheet run through all 8 commands
- VC Roster extracted to dedicated `VC-ROSTER.md`; README keeps a 5-tier summary table
- Writing style guide in `CONTRIBUTING.md`: avoid em-dashes as connective tissue, avoid "not X but Y" framing, prefer concrete over abstract

## 0.1.0 (2026-04-10)

Initial public release. Full-lifecycle fundraising operating system for Claude Code.

**Eight slash commands**
- `/before-fundraising` — readiness verdict (RAISE NOW / NOT YET / MAYBE) with hard gates
- `/product-metrics` — RED/YELLOW/GREEN grading against stage + domain benchmarks
- `/fundraising-strategy` — round amount, structure, dilution, use-of-funds
- `/fundraising-stage` — execution plan with investor targeting and sequencing
- `/pitch-deck` — stage-appropriate slide-by-slide outline tailored to target VC
- `/pitch` — VC pitch simulation with sub-agent and scored debrief
- `/due-diligence` — DD readiness across legal, compliance, data integrity, IP
- `/deal-room` — multi-VC fundraise simulation with competitive dynamics

**Living playbook architecture**
- Single living playbook per round at `.fundraising/{company-slug}-{stage}/playbook.md` with YAML frontmatter, progress tracker, and all command output appended in sequence
- Directory-per-round structure supports scenario comparison (`acme-seed/`, `acme-seed-aggressive/`) and archive
- Cross-session continuity: every command reads the playbook on load and picks up where you left off
- 4-option flow when starting a new round: continue / new scenario / archive + new stage / reset

**VC sub-agent simulation**
- `/pitch` and `/deal-room` play each VC as a dedicated sub-agent with genuine information asymmetry
- Sub-agent receives only what the founder would actually share: VC profile, pitch deck outline, submitted DD materials (deal-room)
- Sub-agent never receives internal planning context: readiness assessment, metrics grades, strategy verdicts, other VC transcripts
- Same-VC memory: prior `/pitch` transcript carries into `/deal-room` for that same VC only
- Verdict decided by main Claude using both the transcript and full playbook context

**Pitch deck content**
- Explicit extraction of problem, target customer (ICP), product description, business model, GTM strategy, revenue projections, cost structure, metrics, and team credentials
- Stage-specific deck structure reference covering pre-seed through Series C+ with per-stage slide tables, weight distribution, required vs. optional slides
- Team slide requires specific credentials rather than role titles
- Traction slide guidance differentiates pre-seed (qualitative signals) from seed+ (actual numbers)

**VC roster**
- 41 investor profiles across 5 tiers: Angels, Seed, Series A/B, Growth, Strategic/CVC
- Content built from public sources (published theses, portfolio announcements, interviews, books, podcasts)
- Full roster in dedicated `VC-ROSTER.md`, README keeps a summary table

**Stage playbooks**
- 7 stage playbooks: pre-seed, seed, Series A, Series B, growth (C/D), late stage (E–I + Pre-IPO), IPO
- Each includes RED/YELLOW/GREEN readiness benchmarks, metrics grading rubrics, deck templates, and real case studies

**Domain metrics**
- 7 domains with sub-domain classification: SaaS, Consumer, AI/ML (6 sub-domains), Fintech, Marketplace, Hardware, Biotech
- Each metric tagged with "Applies to" sub-domains and stage-appropriate benchmarks

**Due diligence**
- 16 investor DD patterns derived from real Series A due diligence
- Domain-specific compliance probes: Fintech licensing, AI/GDPR/EU AI Act, Biotech FDA, SaaS SOC 2, Hardware FCC/CE
- DD scorecard with 🟢🟡🔴 grading and data room checklist

**Contributing & style**
- Modular structure: one skill directory per command, VC profiles as individual files for community PRs
- Contribution guides for VC profiles, domain metrics, stage playbooks, and deck templates
- Writing style guide in `CONTRIBUTING.md`: avoid em-dashes as connective tissue, avoid "not X but Y" framing, prefer concrete over abstract, write direct sentences

**Tooling**
- One-line installer (`install.sh`) supporting project-local and global install
- `/fundraising-upgrade` command for version detection and in-place upgrades
