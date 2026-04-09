---
name: fundraising-stage
description: >
  Fundraising execution plan — creates an actionable, week-by-week plan for running your raise.
  Includes target investor list (tiered), meeting schedule, materials checklist, warm intro mapping,
  and process management playbook.
  Use when the user asks "fundraising execution plan", "fundraising stage", "how to execute my raise",
  "fundraising timeline", "investor outreach plan", or "create execution plan".
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → ▶ /fundraising-stage → /pitch-deck → /pitch.
---

# /fundraising-stage — Fundraising Execution Plan

An optional step for founders who want a concrete, actionable execution plan — not just
strategy, but the day-by-day playbook for running their raise.

## Workflow Context

This command is **Step 3** (optional) of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → ▶ /fundraising-stage → /pitch-deck → /pitch
```

## Flow

1. **Check for prior context:** Read `.fundraising/fundraising-strategy-*.md` and earlier docs.
   Show: "📄 Found your fundraising strategy. Building execution plan on that foundation."

2. **Use context from prior commands** (stage, strategy, target amount, structure).
   If not available, ask for the essentials.

3. **Load the stage playbook** from `../fundraising/references/stage-playbooks/`.

4. **Generate an execution plan covering:**

   **Pre-launch preparation (2-4 weeks before first meeting):**
   - Materials checklist: deck, data room, financial model, cap table
   - Warm intro mapping: who in your network connects to target investors
   - CRM setup: how to track investor pipeline

   **Target investor list:**
   - Tier 1 (dream investors): 5-8 firms, why they're relevant, who to contact
   - Tier 2 (strong fits): 10-15 firms
   - Tier 3 (backup): 10+ firms
   - Angels and scouts to approach in parallel

   **Meeting schedule:**
   - Week-by-week timeline
   - How many meetings per week (stage-appropriate)
   - Typical conversion rates: meetings → follow-ups → term sheets

   **Process management:**
   - How to create urgency and competitive dynamics
   - When to share your deck vs. present live
   - Follow-up cadence and what to send after meetings
   - How to handle "soft no" vs. "hard no" vs. "we need more time"

5. **Save document:** Write the full execution plan to `.fundraising/execution-plan-{YYYY-MM-DD}.md`
   with YAML frontmatter. Append a timeline entry.

6. **Next step prompt:** "✅ Execution plan ready. Saved to `.fundraising/execution-plan-{date}.md`.
   You have a [X]-week timeline targeting [Y] firms.
   Next: run `/pitch-deck` to build your pitch deck."
