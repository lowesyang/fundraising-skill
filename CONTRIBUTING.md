# Contributing to fundraising-skill

This project is designed for community contributions. Three things you can extend:

1. **VC Profiles** — add a new VC firm for pitch simulation
2. **Domain Metrics** — add a new domain, sub-domain, or individual metric
3. **Stage Playbooks & Deck Templates** — improve existing fundraising guides

You can contribute with AI assistance. Just open Claude Code in your fork and say:
- "Add a VC profile for Greylock Partners"
- "Add a RegTech sub-domain to fintech metrics"
- "Add a Customer Health Score metric to the SaaS domain"

Claude will read this guide and create properly formatted content.

---

## 1. VC Profiles

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
- Each VC must feel distinct in simulation.
- One firm per file.
- After adding, update the table in `fundraising/references/vc-profiles/_index.md`.

---

## 2. Domain Metrics

There are three levels of contribution for domain metrics:

### 2a. Add a New Domain

Create a new file at `fundraising/references/metrics-by-domain/{domain}.md`.

A domain is a major industry category (e.g., SaaS, AI, Fintech). Only add a new domain if it's
fundamentally different from existing ones — don't create "Enterprise SaaS" as a domain when it
belongs as a sub-domain under SaaS.

**Current domains:**

| Domain | File | Sub-domains |
|--------|------|-------------|
| SaaS | `saas.md` | B2B, Vertical, PLG, API/Developer Tools |
| Consumer | `consumer.md` | Social, Content/Media, E-commerce, Gaming, Health & Wellness |
| AI | `ai-ml.md` | Foundation Models, AI Apps, Infra, Embodied Intelligence, Chips, Compute Services |
| Fintech | `fintech.md` | Payments, Lending, Insurance, Wealth Mgmt, Crypto/Web3, BaaS |
| Marketplace | `marketplace.md` | B2C, B2B, Services, Vertical |
| Hardware | `hardware.md` | Consumer Electronics, Industrial/IoT, Semiconductors, Cleantech |
| Biotech | `biotech.md` | Therapeutics, Diagnostics, Digital Health, Synbio, MedTech |

**Required file structure:**

```markdown
# {Domain} Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade a {domain} founder's numbers
> with RED/YELLOW/GREEN thresholds.

## Sub-domain Classification

Before evaluating, identify which type of {domain} company:

| Sub-domain | Description | Examples | Metric Emphasis |
|-----------|-------------|---------|----------------|
| **Type A** | description | Company1, Company2 | key metrics focus |
| **Type B** | description | Company3, Company4 | key metrics focus |

## Metrics by Sub-domain

| Metric | Type A | Type B | Type C |
|--------|--------|--------|--------|
| Metric 1 | ✅ | ✅ | — |
| Metric 2 | — | ✅ | ✅ |

---

### Metric Name

> **Applies to:** Type A, Type B

[metric content - see format below]
```

### 2b. Add a Sub-domain to an Existing Domain

Edit the existing domain file to add a new row to the Sub-domain Classification table and the
Metrics by Sub-domain routing table. Then update existing metrics' "Applies to" tags if they
apply to the new sub-domain.

**Example — adding "RegTech" to Fintech:**

1. Add to Sub-domain Classification table:
   ```
   | **RegTech** | Compliance automation, regulatory reporting | Alloy, Unit21, ComplyAdvantage | Regulatory coverage, automation rate |
   ```
2. Add a column to the Metrics by Sub-domain routing table
3. Mark which existing metrics apply to RegTech
4. Optionally add new metrics specific to RegTech (e.g., "Regulatory Coverage Rate")

### 2c. Add a New Metric to an Existing Domain

Append a new metric section to the domain file. Follow this exact format:

```markdown
---

### Metric Name

> **Applies to:** [list which sub-domains this metric is relevant to]

**What it is:** One-sentence definition in plain language. No jargon without explanation.

**Why investors care:** Why this number matters when raising money. Connect to fundability,
not just business quality.

**How to calculate:** Formula or methodology. Be specific enough that a founder can compute
this from their data today.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <X | X-Y | >Y |
| Seed | <X | X-Y | >Y |
| Series A | <X | X-Y | >Y |
| Series B | <X | X-Y | >Y |

**Domain nuance:** When does this metric matter more or less? How does interpretation change
by sub-domain? What's the common mistake in presenting this metric?
```

**Quality rules for all metric contributions:**

- **Real benchmarks** — thresholds must reflect actual industry data. Cite sources where possible
  (SaaS benchmarks from OpenView, Bessemer Cloud Index, etc.). Don't guess.
- **Stage-appropriate** — what's GREEN at pre-seed should be RED at Series B. The bar rises with stage.
- **Plain language** — if a metric has a technical name (NDR, LTV/CAC), explain it in "What it is."
  Not everyone knows what P50 or ARPDAU means.
- **"Applies to" is required** — every metric must specify which sub-domains it's relevant to.
  Don't force robotics founders to answer SaaS metrics.
- **Show the nuance** — "Domain nuance" is where the real value is. Generic metrics are available
  anywhere; the insight about when a metric matters *more* or *less* is what makes this skill useful.

---

## 3. Stage Playbooks

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

**Important:** The pre-seed playbook has a **hard gate** — if no product is launched and the team
doesn't have exceptional credentials, the verdict cannot be RAISE NOW. Do not remove this gate.

---

## 4. Deck Templates

**Location:** `fundraising/references/deck-templates/{template}.md`

Current templates: `yc-demo-day.md`, `general-series-a.md`

You can add new templates (e.g., `seed-round.md`, `series-b.md`, `demo-day-general.md`).
Each template includes slide-by-slide structure with: title, key message, data points,
design notes, and VC-specific tailoring advice.

---

## General Rules

1. **Don't break the flow** — each command reads specific reference files. If you rename or
   restructure files, update the SKILL.md files that reference them.
2. **Test your changes** — install the skill locally and run the relevant command. Does it
   produce better output with your changes?
3. **One PR per contribution** — keep PRs focused. One new VC, one new sub-domain, or one
   new metric per PR.
4. **Frontmatter matters** — YAML frontmatter is used for discovery and routing. Follow the
   exact field names and formats.
5. **Update indexes** — when adding a VC, update `_index.md`. When adding a domain, update
   the domain list in `product-metrics/SKILL.md` and `fundraising/SKILL.md`.
