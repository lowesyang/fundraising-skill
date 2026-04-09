---
name: product-metrics
description: >
  Investor metrics review for startups — grades your traction data with RED/YELLOW/GREEN benchmarks
  by domain (SaaS, Consumer, AI/ML) and stage (pre-seed through Series B). Outputs a metrics
  scorecard showing strengths to lead with and gaps to address.
  Use when the user asks "what metrics do investors care about?", "organize my key metrics",
  "investor metrics", "what data should I show?", "traction review", or "product metrics".
  Part of the fundraising workflow: /before-fundraising → ▶ /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room.
---

# /product-metrics — Traction Data & Investor Metrics Review

Helps founders understand which metrics investors care about for their specific domain
and stage, and grades their actual numbers against industry benchmarks.

## Workflow Context

This command is **Step 1** of the fundraising workflow:

```
/before-fundraising → ▶ /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room
```

## Flow

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`). If found, read frontmatter to get
   company name, stage, domain, and prior verdicts. Show welcome back greeting
   (format in `fundraising/SKILL.md`). If multiple playbooks exist, ask which to use.
   Pre-fill stage and domain — do not re-ask if already known.

2. **Confirm or ask the user's domain** via AskUserQuestion (skip if already in playbook):
   - SaaS / Consumer / AI / Fintech / Marketplace / Hardware / Biotech

3. **Use stage from playbook** if available, otherwise ask.

4. **Load domain-specific metrics** from `../fundraising/references/metrics-by-domain/`
   (saas.md, consumer.md, or ai-ml.md).

5. **For each metric:**
   - What it is and why investors care
   - Benchmark ranges by stage (from reference file — explicit RED/YELLOW/GREEN thresholds)
   - Ask the user for their actual numbers
   - Grade against the hard-coded thresholds in the reference file

6. **Output a metrics scorecard:**
   - Strengths to lead with in your pitch
   - Gaps to address or explain
   - Metrics you should be tracking but aren't
   - Domain-specific nuances (e.g., "marketplace investors care about liquidity more than GMV growth")

7. **Save to playbook:** Append to `.fundraising/{round-dir}/playbook.md`:
   1. Update frontmatter: set `steps_completed.product-metrics` (date + overall_grade) + `last_updated`
   2. Update Progress Tracker row for `/product-metrics` (✅ with overall grade)
   3. Append `## Product Metrics — {YYYY-MM-DD}` section with full scorecard output

8. **Next step prompt:** "✅ Metrics review complete. Added to `.fundraising/{round-dir}/playbook.md`.
   Your strongest numbers: [list top 2-3].
   Next: run `/fundraising-strategy` to determine how much to raise and how to structure it."
