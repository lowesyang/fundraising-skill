# Changelog

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
