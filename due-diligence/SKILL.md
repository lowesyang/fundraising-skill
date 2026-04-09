---
name: due-diligence
description: >
  Due diligence preparation and simulation — helps founders prepare for investor DD by generating
  domain-specific questions (data integrity, compliance, IP, unit economics, risk controls),
  grading preparedness with RED/YELLOW/GREEN, and producing a data room checklist.
  Use when the user asks "due diligence", "DD preparation", "prepare for due diligence",
  "investor DD questions", "data room", "compliance check", "DD readiness", or
  "what will investors ask in due diligence".
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → ▶ /due-diligence → /deal-room.
---

# /due-diligence — Due Diligence Preparation & Simulation

Due diligence happens after a VC expresses interest (FOLLOW-UP or TERM SHEET from `/pitch`).
It's the phase between "we're interested" and "here's the wire" — where investors dig into your
data, compliance, technology, and legal structure.

This command helps founders either:
1. **Proactively prepare** — run before any pitch to identify gaps early
2. **Respond to a specific VC's DD** — run after `/pitch` to generate that VC's likely DD questions

## Workflow Context

This command is **Step 6** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → ▶ /due-diligence → /deal-room
```

## Flow

### Phase 1 — Context & Scope

1. **Check for prior context:** Read `.fundraising/` documents — especially pitch simulations
   in `.fundraising/pitch-simulations/` and readiness assessment. If prior `/pitch` results exist:
   "You pitched to [VC] and got [VERDICT]. I'll tailor DD questions to what they'd focus on."

2. **Determine DD mode** via AskUserQuestion:
   - **"Prepare for a specific VC"** — generate DD questions based on a prior pitch's weak points
     and that VC's known priorities. Requires a prior `/pitch` simulation.
   - **"General DD self-check"** — comprehensive DD review without targeting a specific VC.
     Good for proactive preparation before any meetings.

3. **Confirm domain** from prior context or ask: SaaS / Consumer / AI / Fintech / Marketplace /
   Hardware / Biotech / Other. This determines which compliance and regulatory questions apply.

### Phase 2 — DD Question Generation

4. **Read `../fundraising/references/investor-dd-patterns.md`** for the 16 universal DD patterns.
   Generate domain-appropriate questions organized into 6 categories:

   **Category A: Data Integrity & Metrics** (patterns #1-2)
   - Cohort retention analysis requests (M1-M6 curves, segmented by channel)
   - Revenue reconciliation (multiple data source cross-check)
   - Growth quality verification (organic vs paid breakdown)
   - Unit economics deep dive (fully-loaded CAC, LTV by cohort, payback)

   **Category B: Technical & Defensibility** (patterns #4-5)
   - Architecture overview and technical moat explanation
   - Data ownership, licensing, and proprietary advantage
   - Learned vs rule-based decision boundary (for AI/algorithmic products)
   - Scalability limits and what breaks at 10x

   **Category C: Risk & Failure Modes** (patterns #6-7-8)
   - Worst case scenarios and guardrails
   - Adversarial/adverse condition performance
   - Capacity limits and scaling constraints
   - Incident response and recovery procedures

   **Category D: Unit Economics & Cost Structure** (patterns #9)
   - Cost breakdown (people, tech, marketing, other) with monthly trend
   - Fixed vs variable cost ratio
   - Operating leverage model — how costs scale with 10x revenue
   - Burn rate trajectory and path to profitability

   **Category E: Compliance & Regulatory** (patterns #15, domain-specific)

   *Fintech / Crypto:*
   - License status (MSB, MTL, EMI) by jurisdiction
   - KYC/AML provider, pass/fail rates, SAR filing history
   - Client fund segregation architecture
   - Restricted jurisdiction handling (US, EU, Japan)
   - What happens to user funds if company fails

   *AI / ML:*
   - Data privacy compliance (GDPR, CCPA, PIPL)
   - User data usage for training — consent mechanism
   - AI output liability framework
   - EU AI Act risk classification
   - Bias, hallucination, and content moderation approach

   *Biotech / Healthcare:*
   - FDA/EMA/NMPA classification and submission status
   - IRB/ethics committee approvals
   - HIPAA compliance and BAA agreements
   - GMP certification and facility status
   - Clinical trial registration and enrollment

   *SaaS / Data:*
   - SOC 2 Type I/II certification (or timeline)
   - GDPR DPA agreements with customers
   - PII encryption and access control posture
   - Cyber insurance coverage

   *Hardware:*
   - FCC, CE, UL certifications by market
   - Product liability insurance
   - Environmental compliance (RoHS, WEEE, REACH)
   - Safety certifications for specific applications

   *ALL (Series A+):*
   - Corporate structure and entity incorporation
   - Employment classification (employee vs contractor)
   - Tax compliance status
   - Insurance coverage (D&O, E&O, cyber, general liability)
   - Pending or threatened litigation

   **Category F: Legal & IP** (pattern #16)
   - IP assignment agreements from all contributors
   - Open-source license audit (copyleft risk)
   - Patent status (filed, granted, pending, FTO analysis)
   - Prior employment IP conflicts
   - Cap table hygiene (unresolved equity, messy SAFEs)
   - Trade secret protection measures

5. **If targeting a specific VC:** Weight questions by that VC's pitch debrief weak points.
   For example, if Sequoia scored "Market conviction" at 5/10, add extra market-sizing DD
   questions. If Benchmark scored "Traction evidence" at 4/10, demand deeper cohort data.

### Phase 3 — Interactive Q&A

6. **Present questions category by category.** For each category:
   - Show the questions
   - Let the founder respond (answer, "not ready", or "skip")
   - Grade each response:
     - 🟢 **Ready** — answer is complete, data exists, document available
     - 🟡 **Partial** — answer exists but incomplete, needs more detail or documentation
     - 🔴 **Not ready** — no answer, no data, or significant gap

7. **Flag deal-blocking gaps immediately.** If any 🔴 item is in Category E (compliance) or
   Category F (legal/IP), warn: "This is a potential deal-blocker. Most VCs will pause DD
   until this is resolved. Priority: address this before your next investor meeting."

### Phase 4 — DD Scorecard & Data Room Checklist

8. **Generate DD Scorecard:**

   ```
   ## Due Diligence Scorecard

   | Category | Ready | Partial | Not Ready | Grade |
   |----------|-------|---------|-----------|-------|
   | Data & Metrics | 4 | 1 | 0 | 🟢 A |
   | Technical & Moat | 2 | 2 | 1 | 🟡 B |
   | Risk & Guardrails | 1 | 2 | 2 | 🔴 C |
   | Unit Economics | 3 | 1 | 0 | 🟢 A |
   | Compliance | 1 | 1 | 3 | 🔴 D |
   | Legal & IP | 2 | 2 | 0 | 🟡 B |

   **Overall DD Readiness: 62% — YELLOW**
   **Estimated time to close if VC proceeds: 6-8 weeks (2-3 weeks for gap remediation)**
   ```

9. **Generate Data Room Checklist** — organized by priority:

   **🔴 Must have before DD starts (deal-blocking):**
   - [ ] Item 1 — what's needed, why it matters
   - [ ] Item 2

   **🟡 Should have during DD (delays close if missing):**
   - [ ] Item 3
   - [ ] Item 4

   **🟢 Nice to have (shows maturity):**
   - [ ] Item 5
   - [ ] Item 6

   **Suggested data room structure:**
   ```
   data-room/
   ├── 01-corporate/          # Incorporation docs, cap table, bylaws
   ├── 02-financials/         # P&L, balance sheet, financial model
   ├── 03-metrics/            # Cohort analysis, unit economics, growth data
   ├── 04-product/            # Architecture docs, technical overview
   ├── 05-legal/              # IP assignments, contracts, terms of service
   ├── 06-compliance/         # Licenses, certifications, privacy policies
   ├── 07-team/               # Org chart, key bios, option grants
   └── 08-customers/          # References, case studies, LOIs
   ```

### Phase 5 — Save & Next Steps

10. **Save document:** Write the full DD scorecard and checklist to
    `.fundraising/due-diligence-{YYYY-MM-DD}.md` with YAML frontmatter:

    ```yaml
    ---
    command: /due-diligence
    date: YYYY-MM-DD
    mode: specific-vc | general
    target_vc: sequoia  # if specific
    domain: fintech
    overall_readiness: 62%
    grade: YELLOW
    deal_blockers: 3
    status: completed
    ---
    ```

    Append a timeline entry to `.fundraising/timeline.jsonl`.

11. **Next step prompt:**

    If readiness is GREEN (80%+):
    > ✅ DD preparation complete. Saved to `.fundraising/due-diligence-{date}.md`.
    > You're well-prepared for due diligence. [N] items to polish.
    > Next: run `/deal-room` to simulate your full fundraising process.

    If readiness is YELLOW (50-80%):
    > ✅ DD preparation complete. Saved to `.fundraising/due-diligence-{date}.md`.
    > You have [N] gaps to close before DD will go smoothly. Focus on the 🔴 items first.
    > Run `/due-diligence` again after addressing the gaps to re-check.

    If readiness is RED (<50%):
    > ✅ DD preparation complete. Saved to `.fundraising/due-diligence-{date}.md`.
    > You're not ready for investor DD yet. [N] deal-blocking items need resolution.
    > Address the 🔴 items, then run `/due-diligence` again.
    > Consider whether it's the right time to be fundraising — `/before-fundraising` can help re-assess.
