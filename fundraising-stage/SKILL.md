---
name: fundraising-stage
description: >
  Fundraising execution plan — creates an actionable, week-by-week plan for running your raise.
  Includes target investor list (tiered), meeting schedule, materials checklist, warm intro mapping,
  and process management playbook.
  Use when the user asks "fundraising execution plan", "fundraising stage", "how to execute my raise",
  "fundraising timeline", "investor outreach plan", or "create execution plan".
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → ▶ /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room.
---

# /fundraising-stage — Fundraising Execution Plan

An optional step for founders who want a concrete, actionable execution plan — not just
strategy, but the day-by-day playbook for running their raise.

## Workflow Context

This command is **Step 3** (optional) of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → ▶ /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room
```

## Flow

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`). If found, read frontmatter + strategy
   section to pre-fill stage, target amount, and structure. Show welcome back greeting
   (format in `fundraising/SKILL.md`). If multiple playbooks, ask which to use.

2. **Use context from playbook** (stage, strategy, target amount, structure).
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

5. **Save to playbook:** Append to `.fundraising/{round-dir}/playbook.md`:
   1. Update frontmatter: set `steps_completed.fundraising-stage` (date) + `last_updated`
   2. Update Progress Tracker row for `/fundraising-stage` (✅ with "Execution plan ready")
   3. Append `## Execution Plan — {YYYY-MM-DD}` section with full plan output

6. **Next step prompt:** "✅ Execution plan ready. Added to `.fundraising/{round-dir}/playbook.md`.
   You have a [X]-week timeline targeting [Y] firms.
   Next: run `/pitch-deck` to build your pitch deck."
