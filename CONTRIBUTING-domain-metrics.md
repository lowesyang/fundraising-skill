# Contributing: Domain Metrics

There are three levels of contribution for domain metrics:

## Add a New Domain

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

## Add a Sub-domain to an Existing Domain

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

## Add a New Metric to an Existing Domain

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
