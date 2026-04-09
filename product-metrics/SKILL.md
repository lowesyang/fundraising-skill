---
name: product-metrics
description: >
  Investor metrics review for startups — grades your traction data with RED/YELLOW/GREEN benchmarks
  by domain (SaaS, Consumer, AI/ML) and stage (pre-seed through Series B). Outputs a metrics
  scorecard showing strengths to lead with and gaps to address.
  Use when the user asks "what metrics do investors care about?", "organize my key metrics",
  "investor metrics", "what data should I show?", "traction review", or "product metrics".
  Part of the fundraising workflow: /before-fundraising → ▶ /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch.
---

# /product-metrics — Traction Data & Investor Metrics Review

Helps founders understand which metrics investors care about for their specific domain
and stage, and grades their actual numbers against industry benchmarks.

## Workflow Context

This command is **Step 1** of the fundraising workflow:

```
/before-fundraising → ▶ /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch
```

## Flow

1. **Check for prior context:** Read `.fundraising/readiness-assessment-*.md` if it exists
   to pre-fill stage and business context. Show: "📄 Found your readiness assessment. Using that context."

2. **Ask the user's domain** via AskUserQuestion:
   - SaaS / Consumer / AI / Fintech / Marketplace / Hardware / Biotech

3. **Use stage from prior commands** if available, otherwise ask.

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

7. **Save document:** Write the full metrics scorecard to `.fundraising/product-metrics-{YYYY-MM-DD}.md`
   with YAML frontmatter (command, date, stage, domain, status). Append a timeline entry.

8. **Next step prompt:** "✅ Metrics review complete. Saved to `.fundraising/product-metrics-{date}.md`.
   Your strongest numbers: [list top 2-3].
   Next: run `/fundraising-strategy` to determine how much to raise and how to structure it."
