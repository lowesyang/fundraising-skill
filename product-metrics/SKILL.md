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

**Interaction Rules apply** (see `fundraising/SKILL.md`). Collect metrics conversationally,
one question at a time or in small logical chunks. Do NOT dump the full list of 10-15 metrics
as a numbered form.

2. **Confirm or ask the user's domain** via AskUserQuestion (skip if already in playbook):
   - SaaS / Consumer / AI / Fintech / Marketplace / Hardware / Biotech

3. **Use stage from playbook** if available, otherwise ask as a single question.

4. **Load domain-specific metrics** from `../fundraising/references/metrics-by-domain/`
   (saas.md, consumer.md, or ai-ml.md).

5. **Collect metrics in logical chunks, not as one form.** Walk through the metrics in groups
   of 2-4 related items. For each chunk:
   - Briefly name the group (e.g., "Let's start with revenue and growth.")
   - Ask for the 2-4 numbers in that group in a single short message
   - Wait for the answer, grade each against the reference file's thresholds, give a quick
     reaction, then move to the next chunk

   Suggested chunking by domain:
   - **SaaS**: (1) revenue & growth [MRR/ARR, MoM%, NDR], (2) retention & churn [logo churn,
     revenue churn, cohort retention], (3) unit economics [LTV/CAC, payback, gross margin],
     (4) efficiency [burn multiple, magic number]
   - **Consumer / PLG**: (1) scale [MAU/DAU, paying users], (2) engagement [DAU/MAU ratio,
     session length, D1/D7/D30 retention], (3) monetization [ARPU, conversion rate, LTV],
     (4) virality & acquisition [CAC, viral coefficient, organic share]
   - **AI / ML**: (1) usage & scale [active users, API calls, tokens], (2) product quality
     [response time, cost per query, accuracy/eval scores], (3) business metrics [revenue,
     gross margin after inference cost], (4) moat [data advantage, retention]
   - **Other domains**: follow the same 3-4 chunk pattern using the reference file's sections

   Skip any metric the user already provided in an earlier turn. If the user says they don't
   track something, note it as a gap and move on — don't re-ask.

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
