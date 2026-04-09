---
name: fundraising
description: >
  Full-lifecycle fundraising assistant for startup founders — guided workflow from readiness assessment
  through pitch practice with hyper-realistic VC simulations. Seven commands in a sequential flow:
  /before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /deal-room,
  with an investor feedback loop that refines your strategy and deck after each pitch.
  Use this skill whenever the user mentions fundraising, raising money, pitch deck, VC meeting,
  investor pitch, Series A/B/seed, startup funding, term sheet, SAFE, valuation, dilution,
  or wants to practice pitching to investors. Also triggers on specific VC names like a16z, Sequoia,
  Benchmark, YC, Tiger Global, First Round, Accel, Lightspeed. Triggers on "should I raise",
  "fundraising readiness", "pitch practice", "investor metrics", "fundraising strategy".
---

# Fundraising Skill

A complete fundraising operating system for startup founders. Seven commands in a guided workflow —
each step builds on the last, and after pitching you can loop back to refine your approach based
on investor feedback.

## Recommended Workflow

```
Step 0: /before-fundraising  — Assess readiness, understand your stage
Step 1: /product-metrics      — Review your traction numbers (if product launched)
Step 2: /fundraising-strategy — Plan the raise (amount, structure, spending)
Step 3: /fundraising-stage    — Create execution plan (optional)
Step 4: /pitch-deck           — Build your pitch deck outline
Step 5: /pitch                — Practice with simulated VCs, get feedback
         ↓
    Investor feedback loop: refine strategy/deck → pitch again
         ↓
Step 6: /due-diligence        — Prepare for investor DD (data, compliance, legal)
Step 7: /deal-room            — Multi-VC process simulation (full fundraise)
```

## Onboarding

When a user first triggers any fundraising command, show this orientation before proceeding:

> **Fundraising Skill** — your fundraising co-pilot:
>
> | Step | Command | What it does |
> |------|---------|-------------|
> | 0 | `/before-fundraising` | Assess if you're ready to raise |
> | 1 | `/product-metrics` | Review your traction & key numbers |
> | 2 | `/fundraising-strategy` | Plan how much to raise & how |
> | 3 | `/fundraising-stage` | Create an execution plan (optional) |
> | 4 | `/pitch-deck` | Build your pitch deck outline |
> | 5 | `/pitch` | Practice pitching to simulated VCs |
> | 6 | `/due-diligence` | Prepare for investor due diligence |
> | 7 | `/deal-room` | Multi-VC fundraising process simulation |
>
> **Start here:** Run `/before-fundraising` to assess your fundraising readiness.

Then proceed to the requested command.

## Version Check

Before starting any command, silently run the update check:

```bash
_UPD=$( ~/.claude/skills/fundraising/bin/fundraising-update-check 2>/dev/null || echo "" )
```

- If output contains `UPGRADE_AVAILABLE <old> <new>`:
  Ask the user via AskUserQuestion before proceeding:
  > fundraising-skill v{new} is available (you have v{old}).
  >
  > 1. **Upgrade now**
  > 2. **Enable auto-upgrade** (always stay up to date, never ask again)
  > 3. **Skip this time**

  - Option 1: Run `/fundraising-upgrade` inline, then continue with the original command.
  - Option 2: Write `auto_upgrade=true` to `~/.fundraising-skill/config`, run upgrade, continue.
  - Option 3: Write a skip marker (`touch ~/.fundraising-skill/skip-session`), continue.
    The script won't ask again for 4 hours.

- If output contains `AUTO_UPGRADE <old> <new>`:
  User previously chose "Enable auto-upgrade." Skip the prompt. Silently run the upgrade,
  then continue with the original command.

- If output contains `JUST_UPGRADED`: show the "What's New" summary from CHANGELOG.md.
- If empty or error: skip silently. Never block the user's command for an update check.

## Stage Taxonomy

All commands use this single taxonomy:

| Canonical Stage | User-Facing Labels | VC Tier |
|----------------|-------------------|---------|
| `pre-seed` | "I have an idea", "building MVP" | Seed tier |
| `seed` | "MVP built, early users" | Seed tier |
| `series-a` | "Proven PMF, scaling" | Series A/B tier |
| `series-b` | "Repeatable growth" | Series A/B tier |
| `growth` | "Market leader, Series C+" | Growth tier (limited in v1) |

## Document Persistence

Every command saves its output as a markdown document in the project's `.fundraising/` directory.
This serves three purposes:
1. **Cross-session continuity** — pick up where you left off in a new conversation
2. **Cross-command context** — later commands read earlier documents instead of re-asking
3. **Audit trail** — track how your fundraising approach evolves over time

### Directory Structure

```
.fundraising/
├── readiness-assessment-{YYYY-MM-DD}.md      # from /before-fundraising
├── product-metrics-{YYYY-MM-DD}.md           # from /product-metrics
├── fundraising-strategy-{YYYY-MM-DD}.md      # from /fundraising-strategy
├── execution-plan-{YYYY-MM-DD}.md            # from /fundraising-stage
├── pitch-deck-outline-{YYYY-MM-DD}.md        # from /pitch-deck
├── pitch-simulations/
│   ├── pitch-{vc-name}-{YYYY-MM-DD}.md       # from /pitch (one per VC)
│   └── ...
├── deal-room/
│   ├── meeting-{vc}-{round}-{YYYY-MM-DD}.md  # from /deal-room (one per meeting)
│   ├── dashboard-{YYYY-MM-DD}.md             # pipeline tracker
│   └── final-report-{YYYY-MM-DD}.md          # process summary
└── timeline.jsonl                            # event log (append-only)
```

### File Naming

- Use the current date: `YYYY-MM-DD` format (e.g., `2026-04-09`)
- VC names in lowercase kebab-case: `pitch-sequoia-2026-04-09.md`
- If a file for today already exists, overwrite it (latest version wins for same-day runs)

### Timeline Log

Append a JSONL entry to `.fundraising/timeline.jsonl` at the start and end of each command:

```json
{"command": "/before-fundraising", "event": "completed", "verdict": "RAISE NOW", "stage": "series-a", "ts": "2026-04-09T10:30:00Z"}
{"command": "/product-metrics", "event": "completed", "domain": "saas", "stage": "series-a", "ts": "2026-04-09T10:45:00Z"}
{"command": "/pitch", "event": "completed", "vc": "sequoia", "verdict": "FOLLOW-UP MEETING", "score": 6.8, "ts": "2026-04-09T11:00:00Z"}
{"command": "/deal-room", "event": "meeting", "vc": "a16z", "round": 1, "week": 2, "verdict": "TERM SHEET", "score": 7.4, "ts": "2026-04-09T11:30:00Z"}
{"command": "/deal-room", "event": "completed", "term_sheets": 1, "follow_ups": 1, "passes": 1, "duration_weeks": 5, "ts": "2026-04-09T12:00:00Z"}
```

### Document Format

Each saved document should use this frontmatter structure:

```markdown
---
command: /before-fundraising
date: 2026-04-09
stage: series-a
status: completed
---

# Readiness Assessment — [Company/Product Name]

[full output content]
```

### Cross-Command Context Loading

When starting any command, check for existing documents in `.fundraising/`:

1. Read `.fundraising/timeline.jsonl` (if exists) to understand what commands have been run
2. Load the most recent relevant documents to pre-fill context:
   - `/product-metrics` reads `readiness-assessment-*.md` for stage and business context
   - `/fundraising-strategy` reads both readiness assessment and product metrics
   - `/fundraising-stage` reads strategy document
   - `/pitch-deck` reads all prior documents (metrics, strategy, execution plan)
   - `/pitch` reads deck outline and prior pitch simulations for accumulated feedback
   - `/deal-room` reads deck outline, strategy, and all prior pitch simulations
3. When prior documents exist, show: "📄 Found previous [document]. Using that context.
   Run the command again to refresh."

This means founders can run `/before-fundraising` today, come back tomorrow and run
`/product-metrics`, and it will automatically pick up their stage and business context
from the saved assessment.

## Inter-Command State

Commands pass context through two channels:
1. **Conversation context** — within the same session, use prior command outputs directly
2. **Saved documents** — across sessions, read from `.fundraising/` directory

If both exist (same-session context AND saved documents), prefer the conversation context
as it's more current.

## Workflow Navigation

After completing each command, always show a next-step prompt:

```
✅ [Command name] complete.
Next recommended: `/next-command` — brief description of what it does and why it's the logical next step.
```

This guides founders through the full workflow without them needing to remember the sequence.

## Error Handling

- **Incomplete answers:** Acknowledge the gap and work with what you have. Flag it: "I'm working without
  burn rate data, so my runway estimate is approximate. Get this number before talking to real investors."
- **Unavailable VC:** "That VC isn't in my database yet. Available VCs: [list]. Pick one, or I can
  simulate a generic [stage]-focused investor."
- **Wrong stage for VC:** Redirect with context. E.g., "Tiger Global typically invests at Series B+
  ($15M+ rounds). At your stage, you'd be talking to [relevant VCs]. Want to switch, or practice
  pitching up?"

## Legal Disclaimer

Include this in any `/pitch` simulation: "VC simulations are for practice purposes only and do not
represent actual firm views or investment decisions."

---

## `/before-fundraising` — Fundraising Readiness Assessment

**Trigger:** "should I raise?", "am I ready to fundraise?", "do I need funding?", "fundraising
readiness", "before fundraising", "evaluate my startup for fundraising"

This is the entry point. Before jumping into pitch decks and VC meetings, founders need an honest
assessment of whether they should be raising at all, and if so, what kind of round.

### Flow

1. **Gather baseline context** — ask these questions upfront:
   - What stage are you at? (use user-facing labels from Stage Taxonomy)
   - Have you raised before? If so, what round, how much, from whom?
   - What's your total funding raised to date?
   - Who are your current investors (if any)?
   - Has your product launched? Do you have real users?

2. **Branch based on product launch status:**

   **If product is NOT launched (no real users, no revenue):**
   - This is pre-seed territory. Focus the evaluation on:
     - **Team background and credentials:** Past exits, years of domain expertise, technical depth,
       complementary skill sets. Pre-seed investors are betting on people, not products.
     - **Founder-market fit:** Why are YOU the right person to solve this problem?
     - **Idea potential:** Is the market large enough? Is the timing right? Is there a credible path
       to a massive outcome?
     - **Customer discovery:** Have you talked to potential users? What did you learn?
   - **Hard gate on verdict:** A startup with no launched product and no revenue cannot receive a
     RAISE NOW verdict unless the team has exceptional credentials — repeat founders with previous
     exits, or deep domain expertise (5+ years) in the exact problem space. This is because:
     - Pre-seed investors are primarily evaluating the team, not the product
     - Without usage data, there's no evidence of product-market fit
     - The risk premium is extremely high, making terms unfavorable
   - **MVP-first recommendation:** Always include this guidance: "With modern AI development tools,
     building an MVP is faster than ever. We strongly recommend launching a working product before
     raising — even a simple version with real users gives you dramatically better leverage in
     fundraising conversations. A launched product with 100 real users is worth more than a perfect
     pitch deck."
   - Typical verdict: **NOT YET** with a concrete "build MVP first" action plan, or **MAYBE** if
     the team is strong but needs to validate the idea.

   **If product IS launched:**
   - Acknowledge the launch and assess high-level traction
   - Prompt the user to run `/product-metrics` for a detailed metrics review
   - Continue with broader readiness questions:
     - Monthly burn rate and runway
     - Growth trajectory (qualitative)
     - What the funding would be used for
     - Biggest bottleneck — money, people, or product?
     - Alternatives to raising (revenue, grants, bootstrapping)

3. **Read the appropriate stage playbook** from `references/stage-playbooks/` for benchmark data.

4. **Output a verdict:**
   - **RAISE NOW** — specific reasoning, recommended round type, approximate amount, timeline
   - **NOT YET** — what needs to change first, concrete action plan with milestones
   - **MAYBE** — the case for and against, what evidence would tip the decision

5. **Save document:** Write the full assessment to `.fundraising/readiness-assessment-{YYYY-MM-DD}.md`
   with frontmatter including command, date, stage, verdict, and status. Append a timeline entry
   to `.fundraising/timeline.jsonl`.

6. **Next step prompt:**
   - If product launched: "✅ Readiness assessment complete. Saved to `.fundraising/readiness-assessment-{date}.md`.
     Next: run `/product-metrics` to review your traction data in detail."
   - If not launched: "✅ Assessment complete. Saved to `.fundraising/readiness-assessment-{date}.md`.
     Focus: build and launch your MVP first. When you have real users, come back and run `/before-fundraising` again."
   - If RAISE NOW: "✅ You're ready to raise. Saved to `.fundraising/readiness-assessment-{date}.md`.
     Next: run `/product-metrics` to organize your numbers, then `/fundraising-strategy` to plan your round."

---

## `/product-metrics` — Traction Data & Investor Metrics Review

**Trigger:** "product metrics", "investor metrics", "what metrics matter", "organize my key metrics",
"what data should I show investors", "traction review"

This command helps founders understand which metrics investors care about for their specific domain
and stage, and grades their actual numbers against industry benchmarks.

### Flow

1. **Ask the user's domain** via AskUserQuestion:
   - SaaS (B2B, Vertical, PLG, API/Developer Tools)
   - Consumer (Social, Content/Media, E-commerce, Gaming, Health & Wellness)
   - AI (Foundation Models, AI Apps, Infra, Embodied Intelligence, Chips, Compute)
   - Fintech (Payments, Lending, Insurance, Wealth Management, Crypto/Web3, BaaS)
   - Marketplace (B2C, B2B, Services, Vertical)
   - Hardware (Consumer Electronics, Industrial/IoT, Semiconductors, Cleantech)
   - Biotech (Therapeutics, Diagnostics, Digital Health, Synthetic Biology, MedTech)

2. **Use stage from prior commands** if available, otherwise ask.

3. **Load domain-specific metrics** from `references/metrics-by-domain/` (saas.md, consumer.md, or ai-ml.md).

4. **For each metric:**
   - What it is and why investors care
   - Benchmark ranges by stage (from reference file — explicit RED/YELLOW/GREEN thresholds)
   - Ask the user for their actual numbers
   - Grade against the hard-coded thresholds in the reference file

5. **Output a metrics scorecard:**
   - Strengths to lead with in your pitch
   - Gaps to address or explain
   - Metrics you should be tracking but aren't
   - Domain-specific nuances (e.g., "marketplace investors care about liquidity more than GMV growth")

6. **Save document:** Write the full metrics scorecard to `.fundraising/product-metrics-{YYYY-MM-DD}.md`
   with frontmatter including command, date, stage, domain, and status. Append a timeline entry.

7. **Next step prompt:** "✅ Metrics review complete. Saved to `.fundraising/product-metrics-{date}.md`.
   Your strongest numbers: [list top 2-3].
   Next: run `/fundraising-strategy` to determine how much to raise and how to structure it."

---

## `/fundraising-strategy` — Round Planning & Structure

**Trigger:** "how much should I raise?", "fundraising strategy", "how to spend the money",
"raise planning", "plan my round", "fundraising plan"

### Flow

1. **Use context from prior commands** if available (stage, metrics, readiness assessment).
   Otherwise ask: current stage, burn rate, runway, and growth targets.

2. **Evaluate three strategic dimensions:**

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

3. **Output a fundraising strategy:**
   - Recommended raise amount with reasoning
   - Spending allocation breakdown
   - Timeline: when to start, typical duration by stage
   - Investor targeting: which tier, how many meetings, conversion rates
   - Red flags to watch for (predatory terms, excessive dilution, wrong fit)

4. **Save document:** Write the full strategy to `.fundraising/fundraising-strategy-{YYYY-MM-DD}.md`
   with frontmatter including command, date, stage, target amount, and structure. Append a timeline entry.

5. **Next step prompt:** "✅ Strategy set. Saved to `.fundraising/fundraising-strategy-{date}.md`.
   Target: $[amount] [structure] at $[valuation].
   Next: run `/fundraising-stage` to create your execution plan, or skip to `/pitch-deck` to
   start building your deck."

---

## `/fundraising-stage` — Fundraising Execution Plan

**Trigger:** "fundraising execution plan", "fundraising stage", "how to execute my raise",
"fundraising timeline", "investor outreach plan"

This is an optional step for founders who want a concrete, actionable execution plan — not just
strategy, but the day-by-day playbook for running their raise. This takes the strategy from
`/fundraising-strategy` and turns it into an operational plan.

### Flow

1. **Use context from prior commands** (stage, strategy, target amount, structure).
   If not available, ask for the essentials.

2. **Load the stage playbook** from `references/stage-playbooks/`.

3. **Generate an execution plan covering:**

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

4. **Save document:** Write the full execution plan to `.fundraising/execution-plan-{YYYY-MM-DD}.md`
   with frontmatter including command, date, stage, timeline, and target investor count. Append a timeline entry.

5. **Next step prompt:** "✅ Execution plan ready. Saved to `.fundraising/execution-plan-{date}.md`.
   You have a [X]-week timeline targeting [Y] firms.
   Next: run `/pitch-deck` to build your pitch deck."

---

## `/pitch-deck` — Pitch Deck Outline Designer

**Trigger:** "help me build my deck", "pitch deck", "design my pitch deck", "deck structure",
"pitch deck outline"

The deck should be built after you understand your metrics, strategy, and target investors — it's
the synthesis of everything you've prepared so far.

### Flow

1. **Use context from prior commands** if available (stage, metrics scorecard, strategy, target VCs).
   Otherwise ask: stage, target VC (or "general"), and business details (problem, solution, market,
   traction, team, ask).

2. **Load the appropriate deck template** from `references/deck-templates/`
   (yc-demo-day.md or general-series-a.md).

3. **If a target VC is specified**, also load their profile from `references/vc-profiles/` to
   tailor the deck to their preferences.

4. **Generate a slide-by-slide outline:**
   - For each slide: title, key message (1 sentence), supporting data points, design notes
   - Tailor to VC preferences:
     - a16z: emphasize TAM/SAM/SOM, network effects, platform potential
     - Sequoia: lead with "why now?", market timing narrative
     - Benchmark: product-focused, less slides, more demo
     - YC Demo Day: 2 minutes, 5-8 slides, traction-heavy
     - General: standard narrative arc

5. Call out what's **strong** and what's **weak** in their story.

6. Suggest specific data points they need to find or generate.

7. Output as a structured document usable as a brief for actual slide creation.

8. **Save document:** Write the full deck outline to `.fundraising/pitch-deck-outline-{YYYY-MM-DD}.md`
   with frontmatter including command, date, stage, target VC, and slide count. Append a timeline entry.

9. **Next step prompt:** "✅ Deck outline complete. Saved to `.fundraising/pitch-deck-outline-{date}.md`.
   [N] slides tailored for [VC/general].
   Next: run `/pitch` to practice your pitch with a simulated VC partner."

---

## `/pitch` — Hyper-Realistic VC Simulation & Investor Feedback

**Trigger:** "practice my pitch", "simulate a VC meeting", "pitch practice", "mock interview",
"pitch to [VC name]"

This is the flagship command. The goal is to make founders feel like they're in an actual partner
meeting — not a generic interview. Each VC should feel distinctly different.

### Flow

1. **Use context from prior commands** if available (startup description, stage, deck outline).
   Otherwise ask: describe your startup in 2-3 sentences, and your current stage.

2. **Present VC selection** via AskUserQuestion, filtered by stage:
   - Pre-seed/Seed: YC, First Round, Floodgate, Precursor, Hustle Fund, Lux Capital, Radical Ventures, 500 Global, Felicis + Angels (Naval, Elad Gil, Calacanis, Peter Thiel, Elon Musk, Ron Conway, Marc Andreessen, Reid Hoffman)
   - Series A/B: a16z, Sequoia, Benchmark, Accel, Lightspeed, Greylock, Khosla, General Catalyst, Index Ventures, Founders Fund, Thrive Capital, NEA + Angels (Elad Gil, Peter Thiel, Marc Andreessen, Reid Hoffman)
   - Growth: Tiger Global, Coatue, Insight Partners, SoftBank Vision Fund, DST Global
   - Strategic/CVC: NVIDIA NVentures, Microsoft M12, GV (Google), Amazon/AWS, Salesforce Ventures, Intel Capital, Oracle

3. **Load the selected VC's profile** from `references/vc-profiles/`. Read the appropriate tier file
   (seed-tier.md, series-ab-tier.md, or growth-tier.md).

4. **Run the simulation:**
   - Assume the VC partner's persona completely — their speech patterns, their priorities, their quirks
   - Run 8-12 exchanges (one exchange = one founder message + one VC response)
   - The first 2-3 exchanges are the founder's pitch; remaining are VC Q&A
   - Ask questions consistent with the VC's known style (loaded from profile)
   - Reference the VC's actual portfolio where relevant
   - Use the VC's push-back patterns and closing signals from the profile

5. **Deliver a verdict:** PASS / FOLLOW-UP MEETING / TERM SHEET — with reasoning tied to that VC's
   specific thesis.

6. **DEBRIEF:**
   - "Here's what [VC name] was actually evaluating at each exchange"
   - Score across 5 dimensions (1-10):
     - **Problem clarity** (1=vague, 10=specific, urgent, quantified pain)
     - **Market conviction** (1=no evidence, 10=bottom-up TAM with clear wedge)
     - **Team strength** (1=no relevant experience, 10=domain experts with unfair advantage)
     - **Traction evidence** (1=no data, 10=strong growth with cohort analysis)
     - **Ask specificity** (1=no clear ask, 10=specific amount, use of funds, milestones)
   - Composite: 7+ avg = TERM SHEET, 5-7 = FOLLOW-UP MEETING, <5 = PASS
   - "What you did well / What to improve" — specific, actionable, per dimension
   - "If this were real, here's what they'd discuss internally after you left"

7. **Structured Investor Feedback:**

   After the debrief, provide a structured investor response as the VC would deliver it:

   **If PASS:**
   - Specific reasons for passing (tied to their thesis, not generic)
   - "What would need to change for us to re-engage"
   - Whether they'd take a follow-up in 6 months

   **If FOLLOW-UP MEETING:**
   - What they want to see before the next meeting (specific data, milestones)
   - Timeline for follow-up ("come back in 4-6 weeks with X")
   - What they'd share with their partnership about you
   - Likelihood estimate of proceeding to term sheet

   **If TERM SHEET:**
   - Proposed terms: investment amount, valuation range, structure
   - Key conditions or requirements
   - Expected timeline to close
   - What they'd want in the data room

8. **Save document:** Write the full pitch simulation (exchanges, verdict, debrief, investor feedback)
   to `.fundraising/pitch-simulations/pitch-{vc-name}-{YYYY-MM-DD}.md` with frontmatter including
   command, date, vc, verdict, composite score, and stage. Append a timeline entry.

   If prior pitch simulations exist in `.fundraising/pitch-simulations/`, read them to reference
   accumulated feedback. For example: "In your previous pitch to Sequoia, they flagged weak unit
   economics. Let's see if Benchmark has the same concern."

9. **Feedback Loop — Next step prompt:**

   > ✅ Pitch simulation complete. Saved to `.fundraising/pitch-simulations/pitch-{vc}-{date}.md`.
   > [VC name] verdict: [VERDICT].
   >
   > Based on this feedback, you can:
   > - `/pitch` — Practice with a different VC to get more perspectives
   > - `/pitch-deck` — Revise your deck based on the feedback (updates `.fundraising/pitch-deck-outline-*.md`)
   > - `/fundraising-strategy` — Adjust your strategy (updates `.fundraising/fundraising-strategy-*.md`)
   > - `/fundraising-stage` — Update your execution plan with new insights

   This creates an iterative loop: pitch → get feedback → refine → pitch again. Each iteration
   saves a new document, building an audit trail of how your pitch evolves. When revising the deck
   or strategy based on feedback, the updated document overwrites the previous version (same-day)
   or creates a new dated version, so you can track the evolution.

---

## `/deal-room` — Multi-Meeting Fundraising Process Simulation

**Trigger:** "deal room", "run my fundraise", "multi-VC simulation", "full fundraising
process", "simulate my fundraise", "practice multiple VCs"

The capstone experience. While `/pitch` simulates a single VC meeting, `/deal-room`
simulates your entire fundraising process — multiple VCs, sequential meetings over
simulated weeks, competitive dynamics, pitch evolution, and follow-up meetings.

### Flow

1. **Use context from prior commands** if available (deck outline, strategy, prior pitch
   simulations). Otherwise ask: describe your startup, stage, and target raise amount.

2. **VC Selection:** Founder picks 3-5 VCs from the stage-filtered roster and sets
   meeting order (strategic: warm up on lower-priority VCs first).

3. **Meeting Loop:** For each VC:
   - Pre-meeting briefing with Deal Room Dashboard and adjustment suggestions
   - Meeting mode: "Full simulation" (8-12 exchanges) or "Key moments only" (3-4 exchanges).
     First meeting is always full.
   - Run simulation with Deal Room additions: competitive signaling ("who else are you
     talking to?"), interest acceleration from prior verdicts, pitch evolution tracking
   - Post-meeting verdict + 5-dimension debrief (same scoring as `/pitch`)
   - Inter-meeting phase: continue, adjust pitch, or handle follow-ups

4. **Follow-up meetings:** Shorter (4-6 exchanges), focused on specific asks from the
   prior meeting. Verdicts: PASS / SECOND FOLLOW-UP / TERM SHEET.

5. **Final Report:** Process summary, pipeline outcome, score evolution across meetings,
   pitch evolution analysis, competitive dynamics impact, lessons learned, and strategic
   recommendation (term sheet comparison if applicable).

6. **Save documents:** Individual meeting files to `.fundraising/deal-room/meeting-{vc}-{round}-{date}.md`,
   final report to `.fundraising/deal-room/final-report-{date}.md`. Append timeline entries.

7. **Next step prompt:** Based on outcome — celebrate term sheets, encourage follow-ups,
   or redirect to `/pitch-deck` and `/pitch` for further practice if all passes.

See `deal-room/SKILL.md` for the complete specification including Dashboard format,
scoring consistency rules, and session continuity behavior.

---

## Reference Files

The following reference files contain detailed data that commands load as needed:

| Directory | Files | Used by |
|-----------|-------|---------|
| `references/vc-profiles/` | One file per VC (yc.md, a16z.md, sequoia.md, etc.) — see `_index.md` for full list | `/pitch`, `/deal-room` |
| `references/stage-playbooks/` | pre-seed.md, seed.md, series-a.md, series-b.md | `/before-fundraising`, `/fundraising-stage`, `/fundraising-strategy` |
| `references/metrics-by-domain/` | saas.md, consumer.md, ai-ml.md, fintech.md, marketplace.md, hardware.md, biotech.md | `/product-metrics` |
| `references/deck-templates/` | yc-demo-day.md, general-series-a.md | `/pitch-deck` |
| `references/` | investor-dd-patterns.md — universal DD question patterns extracted from real fundraises | `/pitch` (DD preview), `/before-fundraising` (readiness probing), `/fundraising-stage` (DD prep checklist) |
