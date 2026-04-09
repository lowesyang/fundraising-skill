---
name: fundraising-strategy
description: >
  Fundraising round planning — determines how much to raise, spending allocation, round structure
  (SAFE vs priced round), dilution modeling, and investor targeting strategy.
  Use when the user asks "how much should I raise?", "fundraising strategy", "how to spend the
  money", "raise planning", "plan my round", or "fundraising plan".
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  ▶ /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch.
---

# /fundraising-strategy — Round Planning & Structure

## Workflow Context

This command is **Step 2** of the fundraising workflow:

```
/before-fundraising → /product-metrics → ▶ /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch
```

## Flow

1. **Check for prior context:** Read `.fundraising/readiness-assessment-*.md` and
   `.fundraising/product-metrics-*.md` if they exist. Show: "📄 Found your readiness assessment
   and metrics scorecard. Using that context."

2. **Use context from prior commands** if available (stage, metrics, readiness assessment).
   Otherwise ask: current stage, burn rate, runway, and growth targets.

3. **Evaluate three strategic dimensions:**

   **How much to raise:**
   - 18-24 month runway calculation
   - Milestone-based thinking: what do you need to prove for the NEXT round?
   - Raise enough to hit those milestones + 6-month buffer

   **How to spend it:**
   - Team (who to hire first), product, go-to-market, infrastructure
   - Stage-appropriate allocation benchmarks

   **What structure:**
   - Rolling close vs single close
   - Lead investor strategy
   - SAFE vs priced round tradeoffs (pre-money vs post-money SAFE)
   - Dilution modeling, pro-rata rights implications

4. **Output a fundraising strategy:**
   - Recommended raise amount with reasoning
   - Spending allocation breakdown
   - Timeline: when to start, typical duration by stage
   - Investor targeting: which tier, how many meetings, conversion rates
   - Red flags to watch for (predatory terms, excessive dilution, wrong fit)

5. **Save document:** Write the full strategy to `.fundraising/fundraising-strategy-{YYYY-MM-DD}.md`
   with YAML frontmatter (command, date, stage, target amount, structure). Append a timeline entry.

6. **Next step prompt:** "✅ Strategy set. Saved to `.fundraising/fundraising-strategy-{date}.md`.
   Target: $[amount] [structure] at $[valuation].
   Next: run `/fundraising-stage` to create your execution plan, or skip to `/pitch-deck` to
   start building your deck."
