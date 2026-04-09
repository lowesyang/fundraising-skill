# Contributing to fundraising-skill

This project is designed for community contributions — especially VC profiles and domain metrics.

You can contribute with AI assistance. Just open Claude Code in your fork and say:
- "Add a VC profile for Greylock Partners" — Claude will read this guide and create a properly formatted profile.
- "Add Fintech domain metrics for regtech sub-domain" — Claude will follow the template.

Below are the rules for each type of contribution.

### Adding a VC Profile

**Location:** `fundraising/references/vc-profiles/{slug}.md`

**Naming:** lowercase kebab-case slug (e.g., `greylock.md`, `hong-shan.md`, `founders-fund.md`)

**Required YAML frontmatter:**

```yaml
---
name: "Firm Name"
slug: firm-slug
tier: seed | series-ab | growth
stage_focus: [pre-seed, seed, series-a, series-b, growth, pre-ipo]
check_size: "$XM-$YM"
website: "https://example.com"
contributed_by: "github-username"
---
```

**Required sections (in this order):**

```markdown
## Firm Name

**Key Partners:** [names of active/well-known partners]
**Stage Focus:** [stages they invest in]
**Typical Check Size:** [$X - $Y]
**Investment Thesis:** [1-2 paragraphs from public statements — cite sources]
**Portfolio Highlights:** [5-10 notable companies]
**Sector Preferences:** [industries/verticals they gravitate toward]

### Behavioral Model
**Meeting Style:** [formal/casual, duration, energy, preparation level]
**Signature Questions:**
- [3-5 questions this firm/partner is known for asking]
**What Gets Them Excited:** [specific patterns they look for]
**Red Flags For Them:** [what makes them pass]
**Decision Process:** [solo GP vs partnership vote, timeline]
**Unique Quirks:** [distinctive behaviors that differentiate this firm]

### For the /pitch Simulator
**Opening Style:** [how they start meetings]
**Push-back Patterns:** [how they challenge founders — be specific]
**Closing Signals:**
- *Positive:* [signals the meeting went well]
- *Negative:* [signals they're passing]
**Internal Discussion:** [what they'd say about the founder after they leave — both bull and bear case]
```

**Quality rules:**
- Public information only — websites, podcasts, blog posts, interviews. No insider info.
- Be specific, not generic — "asks tough questions" is useless; "lets silence hang for 5 seconds after your answer" is gold.
- Each VC must feel distinct — if you can't tell which VC you're talking to in a simulation, the behavioral model needs more specificity.
- One firm per file.
- After adding, update the table in `fundraising/references/vc-profiles/_index.md`.

### Adding a Domain Metrics File

**Location:** `fundraising/references/metrics-by-domain/{domain}.md`

**Required structure:**

1. Title: `# {Domain} Metrics — Stage-Specific Benchmarks`
2. Description line: `> Used by the /product-metrics command to grade...`
3. **Sub-domain Classification** table — categorize product types within the domain
4. **Metrics by Sub-domain** routing table — which metrics apply to which sub-domain
5. Individual metric sections

**Metric section format:**

```markdown
### Metric Name

> **Applies to:** [list which sub-domains]

**What it is:** Brief definition
**Why investors care:** Why this matters for fundraising
**How to calculate:** Formula or methodology

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <X | X-Y | >Y |
| Seed | <X | X-Y | >Y |
| Series A | <X | X-Y | >Y |
| Series B | <X | X-Y | >Y |

**Domain nuance:** Special considerations
```

**Quality rules:**
- Benchmarks must use real industry data, not made-up numbers.
- RED/YELLOW/GREEN thresholds must be stage-appropriate — what's GREEN at seed may be RED at Series B.
- Always include the "Applies to" tag with sub-domains.
- Use plain language — avoid jargon unless you explain it.

### Modifying Stage Playbooks

**Location:** `fundraising/references/stage-playbooks/{stage}.md`

Stages: `pre-seed.md`, `seed.md`, `series-a.md`, `series-b.md`

Each playbook must include:
- Overview (typical raise, structures, timeline)
- What Investors Expect (traction benchmarks, team, market proof)
- Readiness Benchmarks with explicit RED/YELLOW/GREEN thresholds
- Typical Terms (valuation, dilution, structures)
- Key Mistakes to Avoid (3-5 stage-specific pitfalls)
- The Narrative Shift (how the pitch story changes at this stage)
- Timeline and Process
- Who to Talk To (relevant investors)

**Important:** The pre-seed playbook has a **hard gate** — if no product is launched and the team doesn't have exceptional credentials, the verdict cannot be RAISE NOW. Do not remove this gate.

### Modifying Deck Templates

**Location:** `fundraising/references/deck-templates/{template}.md`

Templates: `yc-demo-day.md`, `general-series-a.md`

Each template includes slide-by-slide structure with: title, key message, data points, design notes, and VC-specific tailoring advice.

### General Contribution Rules

1. **Don't break the flow** — each command reads specific reference files. If you rename or restructure files, update the SKILL.md files that reference them.
2. **Test your changes** — install the skill locally and run the relevant command. Does it produce better output with your changes?
3. **One PR per contribution** — keep PRs focused. One new VC profile, one new domain, or one playbook improvement per PR.
4. **Frontmatter matters** — YAML frontmatter is used for discovery and routing. Follow the exact field names and formats.
