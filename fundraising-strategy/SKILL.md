---
name: fundraising-strategy
description: >
  Fundraising round planning — determines how much to raise, spending allocation, round structure
  (SAFE vs priced round), dilution modeling, and investor targeting strategy.
  Use when the user asks "how much should I raise?", "fundraising strategy", "how to spend the
  money", "raise planning", "plan my round", or "fundraising plan".
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  ▶ /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room.
---

# /fundraising-strategy — Round Planning & Structure

## Workflow Context

This command is **Step 2** of the fundraising workflow:

```
/before-fundraising → /product-metrics → ▶ /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room
```

## Flow

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`). If found, read frontmatter + prior
   sections (readiness assessment verdict, metrics overall_grade) to pre-fill context. Show
   welcome back greeting (format in `fundraising/SKILL.md`). If multiple playbooks, ask which to use.

2. **Use context from playbook** if available (stage, domain, metrics, prior verdicts).
   If missing, collect conversationally per the Interaction Rules in `fundraising/SKILL.md` —
   one question at a time: stage → burn rate → runway → growth targets.

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

5. **Save to playbook:** Append to `.fundraising/{round-dir}/playbook.md`:
   1. Update frontmatter: set `steps_completed.fundraising-strategy` (date + target_amount + structure),
      update top-level `raise_target` and `raise_structure` fields + `last_updated`
   2. Update Progress Tracker row for `/fundraising-strategy` (✅ with amount + structure)
   3. Append `## Fundraising Strategy — {YYYY-MM-DD}` section with full strategy output

6. **Next step prompt:** "✅ Strategy set. Added to `.fundraising/{round-dir}/playbook.md`.
   Target: $[amount] [structure] at $[valuation].
   Next: run `/fundraising-stage` to create your execution plan, or skip to `/pitch-deck` to
   start building your deck."
