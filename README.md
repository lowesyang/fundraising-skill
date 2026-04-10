<div align="center">

# fundraising.skill

> _"The best fundraising advice is personalized, practice-based, and brutally honest. This skill delivers all three."_

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude%20Code-Skill-blueviolet)](https://claude.ai/code)

<br>

Should you even be raising right now?<br>
What metrics do Series A investors actually care about?<br>
How does pitching a16z differ from pitching Sequoia?<br>
Is your deck telling the right story for your stage?<br>

**Stop guessing. Start practicing.**

<br>

A full-lifecycle fundraising operating system for Claude Code —<br>
from readiness assessment to hyper-realistic VC pitch simulations<br>
with **41 real investors** (VC firms, angel investors, and strategic/corporate investors) modeled from public data.

[Why Use This](#why-you-should-use-this) · [Install](#install) · [Commands](#commands) · [Workflow](#workflow) · [Example](#example-a-seed-round-start-to-finish) · [VC Roster](#vc-roster) · [How It Works](#how-it-works)

</div>

---

## Why You Should Use This

Raising a seed round takes 3-6 months. Series A takes 4-9. You'll have 40+ investor conversations. Most end in polite silence. One or two, if you're lucky, become term sheets. The clock runs against your bank account the entire time.

Most founders lose weeks to avoidable mistakes:

- Raising before the product has real users, burning network goodwill on meetings that were always going to be "too early"
- Pitching the same deck to every VC, when a16z, Sequoia, and Benchmark each need a different story
- Fumbling predictable questions — "why now?", "what's your moat?", "what's your CAC payback?" — because rehearsing in your head isn't the same as answering out loud
- Scrambling for a data room the moment a VC says "we're interested"
- Running a linear process with no competitive pressure

The founders who raise well aren't smarter. They prepare more. This skill gives you the scaffolding to do that work without a fundraising mentor holding your hand:

1. **Honest readiness check.** `/before-fundraising` tells you whether to raise now or ship your MVP first. Saves you from wasting months chasing money you don't need yet.
2. **Practice pitching to real VCs.** 41 investors with real behavioral profiles. Pitching a16z feels nothing like pitching Benchmark. Fumble the questions in simulation instead of in the room.
3. **One skill, every stage.** From pre-seed prototype to Series C+. Metrics, VCs, deck structure, and the story you tell all adapt to where you are.
4. **A living playbook that builds as you go.** Every command appends to `.fundraising/{company}-{stage}/playbook.md` — company profile, metrics, strategy, pitch feedback, DD readiness, deal room results. One document, the whole story. Start today, pick up next week.

**Do the work before the meetings. Walk into every pitch knowing what you're going to say and what they're going to ask.**

---

## Install

### One-line install (recommended)

```bash
curl -sL https://raw.githubusercontent.com/lowesyang/fundraising-skill/main/install.sh | bash
```

### Install globally (available in all projects)

```bash
curl -sL https://raw.githubusercontent.com/lowesyang/fundraising-skill/main/install.sh | bash -s -- --global
```

### Manual install

```bash
# Install to current project (run at git repo root)
mkdir -p .claude/skills
git clone https://github.com/lowesyang/fundraising-skill /tmp/fundraising-skill
cp -r /tmp/fundraising-skill/fundraising .claude/skills/fundraising
rm -rf /tmp/fundraising-skill

# Or install globally
git clone https://github.com/lowesyang/fundraising-skill /tmp/fundraising-skill
cp -r /tmp/fundraising-skill/fundraising ~/.claude/skills/fundraising
rm -rf /tmp/fundraising-skill
```

### Verify installation

Open Claude Code and type:

```
/before-fundraising
```

If the skill loads, you'll see the onboarding table with all 8 commands.

---

## Commands

| # | Command | What it does |
|---|---------|-------------|
| 0 | `/before-fundraising` | Asks the hard questions (launched product? real users? team credentials?) and delivers a RAISE NOW / NOT YET / MAYBE verdict with specific reasoning and a concrete next step. If the product isn't launched and the team lacks exceptional credentials, it tells you to build the MVP first. |
| 1 | `/product-metrics` | Grades your actual numbers RED/YELLOW/GREEN against stage benchmarks by domain (SaaS, Consumer, AI/ML, Fintech, Marketplace, Hardware, Biotech). Shows which metrics are pitch strengths and which a skeptical investor will push back on. |
| 2 | `/fundraising-strategy` | Builds your round strategy from actual burn and runway: raise amount, round structure (SAFE vs. priced), dilution math, and a use-of-funds breakdown you can walk an investor through. |
| 3 | `/fundraising-stage` | Turns strategy into execution: which VCs to approach first, in what order, warm vs. cold outreach sequencing, and 30/60/90-day milestones to hit while the round is live. |
| 4 | `/pitch-deck` | Generates a stage-appropriate, slide-by-slide deck outline tailored to your domain and target VC. Populated with your actual metrics, team credentials, GTM, and financials. Structure and emphasis shift by stage (pre-seed to Series C+). |
| 5 | `/pitch` | Simulates a partner meeting with any of 41 investors. The VC sub-agent reads your deck but has no access to your internal metrics or strategy. Scored 5-dimension debrief after each session: what they were weighing, what to change, and a DD preview of follow-up questions. |
| 6 | `/due-diligence` | Generates the specific DD questions this investor would ask given your domain, stage, and pitch weak points. Covers legal/IP, domain-specific compliance (Fintech, AI, Biotech, SaaS), and data integrity. Outputs a readiness scorecard and data room checklist. |
| 7 | `/deal-room` | Runs the full fundraise: 3-5 VCs over simulated weeks, competitive dynamics, pitch evolution between meetings, and deal architecture (lead/follow scoring, dilution modeling, complete financing plan) when term sheets arrive. |

---

## Workflow

```
  ┌──────────────────────────────────────────────────────────────────┐
  │                                                                  │
  │   Step 0   /before-fundraising     Am I ready to raise?          │
  │      ↓                                                           │
  │   Step 1   /product-metrics        Grade my traction             │
  │      ↓                                                           │
  │   Step 2   /fundraising-strategy   Plan the round                │
  │      ↓                                                           │
  │   Step 3   /fundraising-stage      Execution playbook            │
  │      ↓                                                           │
  │   Step 4   /pitch-deck             Build the deck                │
  │      ↓                                                           │
  │   Step 5   /pitch ←───── feedback loop ────┐                     │
  │      │         practice single meetings    │                     │
  │      │         refine deck & strategy ─────┘                     │
  │      ↓                                                           │
  │   Step 6   /due-diligence                                        │
  │              prepare for DD based on pitch feedback               │
  │      ↓                                                           │
  │   Step 7   /deal-room                                            │
  │              simulate full fundraise (3-5 VCs)                   │
  │                                                                  │
  └──────────────────────────────────────────────────────────────────┘
```

Commands connect forward. After `/pitch`, loop back to refine your deck and strategy based on the feedback. When you get FOLLOW-UP or TERM SHEET interest, run `/due-diligence` to prepare for the real interrogation. Graduate to `/deal-room` when your single-meeting scores are consistently at FOLLOW-UP or better.

### The Living Playbook

Every command appends to a single document: `.fundraising/{company-slug}-{stage}/playbook.md`. Start today, come back tomorrow — the skill shows your progress and picks up where you left off.

```
.fundraising/
└── acme-seed/
    ├── playbook.md              # Company profile → metrics → strategy → pitch feedback → DD → deal room
    ├── pitch-simulations/       # Full pitch transcripts
    └── deal-room/               # Meeting logs + final report
```

Running multiple strategies in parallel? Create comparison scenarios: `acme-seed/`, `acme-seed-aggressive/`, `acme-seed-conservative/`. Completed a round? Archive it and start fresh for Series A — all prior rounds stay in `.fundraising/archive/`.

---

## Example: a seed round, start to finish

A realistic walkthrough. Acme is an AI coding assistant startup, 14 months in, $18K MRR, thinking about raising seed. Here's what working through the skill looks like.

```text
You:    I'm thinking about raising a seed round. $18K MRR, 22% MoM for 4 months,
        B2B AI coding assistant, 3-person team.

You:    /before-fundraising
Claude: [asks: team backgrounds, product stage, why now, runway left]

You:    Co-founder and I are ex-Stripe infra eng, 6 years each. Product
        launched 8 months ago. 9 months of runway.

Claude: VERDICT: RAISE NOW (with caveats)
        • Team credentials: GREEN (ex-Stripe infra closes seed checks)
        • Traction: YELLOW-GREEN ($18K MRR + 22% MoM is PMF signal)
        • Timing: GREEN (9 months runway — raise before you need it)
        CAVEAT: Your 22% MoM is 4 months old. Seed investors want 6+.
        You have 6-8 weeks to either extend the growth streak or start
        now and use live metrics in the pitch.
        [saves Readiness Assessment to acme-seed/playbook.md]

You:    /product-metrics
Claude: [pulls MRR, growth rate, churn, cohort retention, LTV/CAC]
        SaaS / Developer Tools grading:
        🟢 MRR growth: 22% MoM (benchmark 15%+)
        🟢 Gross margin: 78% (benchmark 70%+)
        🟡 Churn: 4.2% monthly (benchmark <3%)
        🔴 LTV/CAC: 1.8 (benchmark 3+)
        LEAD WITH: growth rate. ADDRESS PROACTIVELY: LTV/CAC — you need
        to frame the payback period story before an investor raises it.
        [appends Product Metrics section to playbook]

You:    /fundraising-strategy
Claude: Raise target: $2.5M on $12M post (SAFE, uncapped-with-discount
        won't fly at your traction — use capped SAFE or priced round).
        18-month runway gets you to ~$80K MRR with current growth. That's
        a credible Series A setup.
        Dilution: ~17%. Use of funds: 2 senior eng hires (55%), GTM
        experimentation (25%), runway buffer (20%).
        [appends Fundraising Strategy section to playbook]

You:    /fundraising-stage
Claude: [builds week-by-week execution plan]
        Tier 1 (dream targets, 3 VCs): First Round, Felicis, Lux Capital
        Tier 2 (strong fit, 5 VCs): Floodgate, Precursor, Hustle Fund, ...
        Tier 3 (warmups, 4 VCs): ...
        Week 1-2: warm up with Tier 3. Week 3-5: Tier 2. Week 5-6: Tier 1
        with competitive signals from Tier 2 interest.
        [appends Execution Plan to playbook]

You:    /pitch-deck
Claude: Seed-stage structure, 11 slides. Populated with your actual data.
        [generates slide-by-slide outline with real metrics, team credentials,
         ICP, pricing, GTM, projections]
        STRONG: traction slide (22% MoM chart, 78% margin), team slide
        (ex-Stripe infra is a closer at seed).
        WEAK: market slide needs bottom-up TAM — you cited $40B dev tools,
        which every VC has heard. Try 4.5M professional developers ×
        $200/year realistic ACV = $900M serviceable.
        GAP: no competition slide. Add one. Cursor/Copilot will come up.
        [appends Pitch Deck Outline to playbook]

You:    /pitch sequoia
Claude: [spawns sub-agent with Sequoia profile + your deck outline. Sub-agent
         has no access to your metrics grades or strategy — only what
         you actually say in the meeting and what's in the deck.]

        VC: "Why now?"
You:    We hit a tipping point where LLMs are finally good enough to
        refactor across files without breaking tests...
VC:     "Cursor does that today. What's your wedge?"
You:    [6 more exchanges — you fumble the LTV/CAC question]

Claude: VERDICT: FOLLOW-UP MEETING
        Composite: 6.4
        • Problem clarity: 7 — "tipping point" framing worked
        • Market conviction: 5 — you conceded market to Cursor too fast
        • Team: 8 — ex-Stripe credentials closed the team concern
        • Traction: 7 — growth rate landed
        • Ask: 5 — payback period answer was vague
        [appends full transcript + feedback to playbook]
        WHAT TO FIX BEFORE NEXT PITCH: (1) market — own a specific wedge
        Cursor doesn't serve, (2) payback period — prepare the exact math.

You:    [iterate: update deck, re-read the feedback, refine the wedge story]

You:    /pitch a16z
Claude: [different sub-agent, different questions, no memory of Sequoia]
        VERDICT: FOLLOW-UP MEETING (7.1) — market answer landed this time.

You:    /due-diligence
Claude: Generating DD questions a16z will likely ask:
        LEGAL: IP assignment for ex-Stripe work? Open-source licenses
        in your training data?
        DATA: Can you reconcile MRR across Stripe + HubSpot? Cohort
        retention by acquisition channel?
        COMPLIANCE: SOC 2 timeline? GDPR for EU customers?
        UNIT ECONOMICS: Recalc LTV/CAC with blended CAC including
        content/organic, not just paid.
        [grades your current state 🟢🟡🔴, outputs data room checklist]
        READINESS: 🟡 — 2 gaps to close before the DD call.

You:    /deal-room
Claude: [loads your Tier 1 + Tier 2 list from the execution plan]
        Select 4 VCs for the Deal Room:
        • First Round (warm intro via ex-Stripe colleague)
        • Felicis
        • Sequoia ← remembers your prior /pitch meeting
        • a16z ← remembers your prior /pitch meeting

        Week 1: First Round meeting. Score 7.3. FOLLOW-UP.
        Week 2: Felicis. "Who else are you talking to?" You mention
                First Round interest. Score 7.8. FOLLOW-UP.
        Week 3: Sequoia follow-up. They reference your prior conversation:
                "Last time you said tipping point, I wasn't sure. What's
                the data now?" Score 7.5. FOLLOW-UP → TERM SHEET pending.
        Week 4: a16z. Competitive signal from Sequoia + Felicis works.
                Score 8.1. TERM SHEET: $3M on $14M post.

        FINAL REPORT:
        • 1 TERM SHEET (a16z — $3M @ $14M post)
        • 2 FOLLOW-UPs pending (Sequoia, Felicis)
        • 1 polite pass (First Round — too early for their current fund)
        Pitch evolution: your market slide improved 4 → 8 across the
        4 meetings. LTV/CAC answer went from hand-wave to specific math.
        Recommendation: run Sequoia and Felicis follow-ups before
        countering a16z. You likely have 5-7 days of leverage.
        [writes final report + appends Deal Room summary to playbook]
```

Total time for the full loop above: 2-4 hours of active work spread over however many days you need. The playbook persists across sessions, so you can stop after `/pitch` on Monday and resume at `/due-diligence` on Friday without losing context.

---

## VC Roster

41 investors across 5 tiers, available in the `/pitch` simulator and `/deal-room`. The skill filters the roster by stage so you only see relevant options.

| Tier | Investors |
|------|-----------|
| Angels | Naval Ravikant, Elad Gil, Jason Calacanis, Peter Thiel, Elon Musk, Ron Conway, Marc Andreessen, Reid Hoffman |
| Seed | YC, First Round, Floodgate, Precursor, Hustle Fund, Lux Capital, Radical Ventures, 500 Global, Felicis |
| Series A/B | a16z, Sequoia, Benchmark, Accel, Lightspeed, Greylock, Khosla, General Catalyst, Index Ventures, Founders Fund, Thrive Capital, NEA |
| Growth | Tiger Global, Coatue, Insight Partners, SoftBank Vision Fund, DST Global |
| Strategic / CVC | NVIDIA NVentures, Microsoft M12, GV, Amazon/AWS, Salesforce Ventures, Intel Capital, Oracle |

Full profiles with stage coverage and links: [VC-ROSTER.md](VC-ROSTER.md)

---

## How It Works

### Stage-Aware Intelligence

The skill covers 7 stages — pre-seed through IPO — each with a dedicated playbook:

| Stage | File | Coverage |
|-------|------|----------|
| Pre-seed | `pre-seed.md` | Idea validation, founder credentials, pre-revenue hard gate |
| Seed | `seed.md` | Early traction, PMF signal, SAFE/priced round structures |
| Series A | `series-a.md` | Repeatable growth, unit economics, GTM efficiency |
| Series B | `series-b.md` | Scaling the growth engine, category leadership |
| Growth (C/D) | `growth.md` | Market dominance, Rule of 40, growth equity investors |
| Late Stage (E–I) | `late-stage.md` | Crossover rounds + Pre-IPO round, secondary market, IPO ratchets; case studies: Stripe, Databricks, SpaceX, Anthropic, OpenAI |
| IPO | `ipo.md` | Roadshow, book-build pricing; why Tesla/Snowflake/Airbnb held vs. WeWork/Robinhood/Rivian broke issue price |

Each playbook includes:

- **Readiness benchmarks** — explicit RED/YELLOW/GREEN thresholds that power the `/before-fundraising` diagnostic
- **Metrics grading** — by domain (SaaS, Consumer, AI/ML) and by sub-stage
- **Deck templates** — YC Demo Day format and General Series A format
- **Real case studies** — success and failure examples for growth through IPO stages

### The Hard Gate

If your product isn't launched and you don't have exceptional team credentials (repeat founders with exits, deep domain expertise), the skill will tell you: **build your MVP first**. With modern AI tools, building is faster than ever — and 100 real users are worth more than any pitch deck.

### Due Diligence

When a VC says "we're interested," the real work begins. `/due-diligence` generates DD questions based on your actual pitch feedback, tailored to your domain:

- **Compliance**: Fintech (licenses, KYC/AML), AI (GDPR, EU AI Act), Biotech (FDA), SaaS (SOC 2), Hardware (FCC/CE)
- **Data integrity**: Can you reconcile your metrics across sources? Cohort analysis ready?
- **Legal & IP**: IP assignment, cap table hygiene, employment classification, open-source audit
- **Risk & guardrails**: Failure modes, worst-case scenarios, recovery procedures
- **DD Scorecard**: Overall readiness graded 🟢🟡🔴 with data room checklist

### Deal Room

After practicing pitches and preparing for DD, the Deal Room simulates your entire fundraise:

- **Pick 3-5 VCs** and set your meeting order strategically
- **Sequential meetings** over simulated weeks with feedback between each
- **Same-VC memory**: if you practiced with Sequoia in `/pitch`, they carry that conversation into the Deal Room. They won't know about your meetings with any other firm.
- **Competitive dynamics**: VCs ask who else you're talking to. If you mention that another firm expressed interest, the current one responds to it.
- **Pitch evolution**: adjust your pitch between meetings based on feedback; only the dimensions you actually addressed will improve in the next score
- **Follow-up meetings**: VCs who want a second look get a focused follow-up (4-6 exchanges, no full re-pitch)
- **Deal Architecture**: when term sheets arrive, evaluate each offer — lead vs. follow-on candidacy scored on strategic value, signal for future rounds, follow-on capital capacity, and dilution efficiency; two-scenario cap table modeling (this round + projected next raise); "worth it?" judgment per investor; and a complete financing plan with declined-offer language
- **Final report**: pipeline outcome, score trajectory, pitch evolution log, and complete financing plan

### Pitch Simulation

Each VC is played by a dedicated sub-agent that receives only the VC's behavioral profile and what you say during the session. No playbook, no metrics, no prior commands. The VC only knows what you've said out loud in the room. This means they ask the questions a real VC would ask — the ones your deck didn't answer, the ones that probe the weak spots you hoped they'd miss.

After each simulated pitch, you get:

- **5-dimension scoring** (1-10): Problem clarity, Market conviction, Team strength, Traction evidence, Ask specificity
- **Verdict**: PASS / FOLLOW-UP MEETING / TERM SHEET (decided by the main agent using both the transcript and your actual playbook context)
- **Investor feedback**: Specific reasons for the verdict, what to change, timeline for follow-up
- **Internal discussion**: What the VC would say about you after you leave the room
- **DD preview**: 5-8 due diligence questions this VC would ask if they proceed, tied to your specific weak points

---

## Domains Supported

Each domain includes sub-domain classification — the skill asks what type of company you're building before evaluating metrics.

| Domain | Sub-domains | Key Metrics |
|--------|------------|-------------|
| **SaaS** | B2B, Vertical, PLG, API/Developer Tools | ARR, NDR, churn, LTV/CAC, payback, gross margin, magic number, burn multiple |
| **Consumer** | Social, Content/Media, E-commerce, Gaming, Health & Wellness | DAU/MAU, D1/D7/D30 retention, viral coefficient, session length, ARPU |
| **AI** | Foundation Models, AI Apps, Infra, Embodied Intelligence, Chips, Compute Services | Adapts by type — response time, inference cost, data moat, TOPS/W, GPU utilization, safety metrics |
| **Fintech** | Payments, Lending, Insurance, Wealth Mgmt, Crypto/Web3, BaaS | TPV, take rate, NRR, regulatory status, default rate, gross margin |
| **Marketplace** | B2C, B2B, Services, Vertical | GMV, take rate, liquidity, repeat purchase, supply/demand ratio, unit economics |
| **Hardware** | Consumer Electronics, Industrial/IoT, Semiconductors, Cleantech | BOM cost, gross margin trajectory, units shipped, yield, warranty rate, attach rate |
| **Biotech** | Therapeutics, Diagnostics, Digital Health, Synbio, MedTech | Pipeline stage, probability of success, patents, regulatory pathway, cash runway |

---


## Project Structure

```
fundraising/                              # Shared references (installed as one skill)
├── SKILL.md
├── references/
│   ├── vc-profiles/                      # One file per investor — easy to contribute via PR
│   │   ├── _index.md                     # Directory + contribution guide
│   │   ├── yc.md, first-round.md         # Seed funds
│   │   ├── floodgate.md, precursor.md    # Seed funds
│   │   ├── hustle-fund.md                # Pre-seed micro fund
│   │   ├── a16z.md, sequoia.md           # Series A/B firms
│   │   ├── benchmark.md, accel.md        # Series A/B firms
│   │   ├── lightspeed.md                 # Series A/B firms
│   │   ├── tiger-global.md               # Growth
│   │   ├── naval.md, elad-gil.md         # Angel investors
│   │   ├── calacanis.md, peter-thiel.md  # Angel investors
│   │   ├── elon-musk.md, ron-conway.md   # Angel investors
│   │   └── marc-andreessen.md, reid-hoffman.md # Angel investors
│   ├── stage-playbooks/
│   │   ├── pre-seed.md
│   │   ├── seed.md
│   │   ├── series-a.md
│   │   ├── series-b.md
│   │   ├── growth.md              # Series C/D
│   │   ├── late-stage.md          # Series E–I + Pre-IPO round
│   │   └── ipo.md
│   ├── metrics-by-domain/
│   │   ├── saas.md
│   │   ├── consumer.md
│   │   ├── ai-ml.md                     # AI (6 sub-domains)
│   │   ├── fintech.md
│   │   ├── marketplace.md
│   │   ├── hardware.md
│   │   └── biotech.md
│   └── deck-templates/
│       ├── yc-demo-day.md
│       └── general-series-a.md
before-fundraising/SKILL.md               # Step 0: Readiness assessment
product-metrics/SKILL.md                  # Step 1: Traction grading
fundraising-strategy/SKILL.md            # Step 2: Round planning
fundraising-stage/SKILL.md               # Step 3: Execution plan
pitch-deck/SKILL.md                      # Step 4: Deck outline
pitch/SKILL.md                           # Step 5: VC simulation
due-diligence/SKILL.md                   # Step 6: DD preparation
deal-room/SKILL.md                       # Step 7: Multi-VC process simulation
```

---

## Contributing

This project is built for community contributions. Open Claude Code in your fork, tell it what you want to add — it reads the relevant contributing guide and generates properly formatted content.

```bash
git clone https://github.com/lowesyang/fundraising-skill && cd fundraising-skill
# Open Claude Code and say:
# "Add a VC profile for Greylock Partners"
# "Add a RegTech sub-domain to fintech metrics"
# "Add a Customer Health Score metric to SaaS domain"
```

### What you can contribute

| Contribution | Example | Guide |
|-------------|---------|-------|
| **New VC profile** | "Add Founders Fund" | [CONTRIBUTING-vc-profiles.md](CONTRIBUTING-vc-profiles.md) |
| **New domain / sub-domain / metric** | "Add RegTech to Fintech" | [CONTRIBUTING-domain-metrics.md](CONTRIBUTING-domain-metrics.md) |
| **Stage playbook** | "Improve Series A playbook" | [CONTRIBUTING-stage-playbooks.md](CONTRIBUTING-stage-playbooks.md) |
| **Deck template** | "Add a Seed round template" | [CONTRIBUTING-deck-templates.md](CONTRIBUTING-deck-templates.md) |

---

## Disclaimer

VC simulations are for practice purposes only and do not represent actual firm views or investment decisions. VC profiles are built from publicly available information (websites, podcasts, blog posts, interviews).

---

## License

MIT
