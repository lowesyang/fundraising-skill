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
with **14 real investors** (VC firms + angel investors) modeled from public data.

[Install](#install) · [Commands](#commands) · [Workflow](#workflow) · [VC Roster](#vc-roster) · [How It Works](#how-it-works)

</div>

---

## What Makes This Different

**Fundraising should be as simple as cooking — follow the recipe, one step at a time.**

You wouldn't walk into a Michelin-star kitchen without a recipe. So why walk into a VC meeting without preparation? This skill breaks fundraising down into 6 clear steps — like a recipe card. You don't need to be a "fundraising expert." You just need to follow the workflow and let your AI do the heavy lifting.

**Today, your AI helps you prepare. Tomorrow, your agent will go fundraise for you.**

We built this for **founders who'd rather be building** — indie hackers, solo devs, first-time founders, technical teams who know their product inside out but haven't memorized the VC playbook. You focus on building something people want. We'll handle the fundraising prep.

1. **Your AI fundraising advisor, not a generic chatbot.** It asks the hard question first: "Should you even be raising right now? Or should you ship your MVP first?" A good advisor saves you from wasting months chasing money you don't need yet. That's what this does.

2. **Practice pitching to real VCs — not a rubber duck.** Each of the 8 VC firms has its actual investment thesis, its partners' real behavioral styles, their known portfolio context. Pitching a16z feels nothing like pitching Benchmark. You'll know the difference before you walk in the room.

3. **One skill, every stage.** Whether you're a solo dev with a prototype or a 20-person team prepping Series B — the metrics that matter, the VCs who care, the story you should tell — it all changes. This skill adapts to where you actually are.

4. **Your fundraising docs build up over time.** Each step saves a document to `.fundraising/` in your project. Come back tomorrow, next week, next month — pick up right where you left off. Your preparation compounds like interest.

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

If the skill loads, you'll see the onboarding table with all 7 commands.

---

## Commands

| Step | Command                 | What it does                                                        |
| ---- | ----------------------- | ------------------------------------------------------------------- |
| 0    | `/before-fundraising`   | Assess if you're ready to raise — honest verdict with hard gates    |
| 1    | `/product-metrics`      | Review traction data with RED/YELLOW/GREEN grading by domain        |
| 2    | `/fundraising-strategy` | Plan how much to raise, spending allocation, round structure        |
| 3    | `/fundraising-stage`    | Create actionable execution plan with investor targeting (optional) |
| 4    | `/pitch-deck`           | Build slide-by-slide deck outline tailored to your target VC        |
| 5    | `/pitch`                | Practice pitching with a simulated VC partner — full debrief after  |
| 6    | `/deal-room`            | Multi-VC fundraising process simulation — competitive dynamics      |

---

## Workflow

```
  ┌─────────────────────────────────────────────────────────────┐
  │                                                             │
  │   Step 0   /before-fundraising     Am I ready to raise?     │
  │      ↓                                                      │
  │   Step 1   /product-metrics        Grade my traction        │
  │      ↓                                                      │
  │   Step 2   /fundraising-strategy   Plan the round           │
  │      ↓                                                      │
  │   Step 3   /fundraising-stage      Execution playbook       │
  │      ↓                                                      │
  │   Step 4   /pitch-deck             Build the deck            │
  │      ↓                                                      │
  │   Step 5   /pitch ←──── feedback loop ────┐                 │
  │      │         practice single meetings   │                 │
  │      │         refine deck & strategy ────┘                 │
  │      ↓                                                      │
  │   Step 6   /deal-room                                       │
  │            simulate full fundraise (3-5 VCs)                │
  │                                                             │
  └─────────────────────────────────────────────────────────────┘
```

Each command guides you to the next. After `/pitch`, loop back to refine your deck and strategy based on VC feedback — then pitch again. When you're consistently landing FOLLOW-UP or better, graduate to `/deal-room` to simulate the full multi-VC process.

### Document Persistence

Every command saves its output to `.fundraising/` in your project. Start today, come back tomorrow — the skill picks up where you left off.

---

## VC Roster

14 investors modeled with detailed behavioral profiles for the `/pitch` simulator and `/deal-room`:

### Angel Investors

| Investor             | Stage          | Known For                                              |
| -------------------- | -------------- | ------------------------------------------------------ |
| Naval Ravikant       | Pre-seed, Seed | Socratic, first-principles, "specific knowledge"       |
| Elad Gil             | Seed, Series A | Operator-investor, scaling expertise, High Growth Handbook |
| Jason Calacanis      | Pre-seed, Seed | High-energy, speed-obsessed, "cockroach founders"      |

### Seed Funds

| Firm                | Stage          | Known For                                              |
| ------------------- | -------------- | ------------------------------------------------------ |
| Y Combinator (YC)   | Pre-seed, Seed | "Do things that don't scale", user growth obsession    |
| First Round Capital  | Pre-seed, Seed | Operator-friendly, community-driven, platform model    |
| Floodgate            | Pre-seed, Seed | "Thunder lizards", contrarian, framework-driven        |
| Precursor Ventures   | Pre-seed, Seed | Pre-seed specialist, product-minded, fast decisions    |
| Hustle Fund          | Pre-seed       | Micro-fund, speed of execution, first-time founders    |

### Series A/B Firms

| Firm                        | Stage      | Known For                                           |
| --------------------------- | ---------- | --------------------------------------------------- |
| Andreessen Horowitz (a16z)  | Series A/B | Network effects, "what's the 10x version?"          |
| Sequoia Capital             | Series A/B | "Why now?", market timing, arc narrative            |
| Benchmark                   | Series A/B | Terse, product-obsessed, lets silence hang          |
| Accel                       | Series A/B | Data-driven, pattern-matching, fintech/SaaS         |
| Lightspeed Venture Partners | Series A/B | "Earned insight", enterprise SaaS                   |

### Growth

| Firm                        | Stage              | Known For                                    |
| --------------------------- | ------------------ | -------------------------------------------- |
| Tiger Global                | Series B to Pre-IPO | Speed of decision, growth metrics, no board seats |

Each investor asks different questions, pushes back differently, and evaluates through their own lens. The debrief tells you what they were _actually_ thinking.

---

## How It Works

### Stage-Aware Intelligence

The skill covers 4 stages (pre-seed through Series B), each with:

- **Readiness benchmarks** — explicit thresholds that power the `/before-fundraising` diagnostic
- **Metrics grading** — RED/YELLOW/GREEN by domain (SaaS, Consumer, AI/ML)
- **Deck templates** — YC Demo Day format and General Series A format
- **Stage playbooks** — what investors expect, typical terms, key mistakes to avoid

### The Hard Gate

If your product isn't launched and you don't have exceptional team credentials (repeat founders with exits, deep domain expertise), the skill will tell you: **build your MVP first**. With modern AI tools, building is faster than ever — and 100 real users are worth more than any pitch deck.

### Deal Room — Full Process Simulation

After practicing individual pitches with `/pitch`, the Deal Room simulates your entire fundraise:

- **Pick 3-5 VCs** and set your meeting order strategically
- **Sequential meetings** over simulated weeks with feedback between each one
- **Competitive dynamics** — VCs ask who else you're talking to; interest from one accelerates others
- **Pitch evolution** — adjust your pitch between meetings based on feedback
- **Follow-up meetings** — VCs who want a second look get a focused follow-up
- **Final report** — pipeline outcome, score trajectory, lessons learned, and term sheet comparison

### Pitch Simulation Debrief

After each simulated pitch, you get:

- **5-dimension scoring** (1-10): Problem clarity, Market conviction, Team strength, Traction evidence, Ask specificity
- **Verdict**: PASS / FOLLOW-UP MEETING / TERM SHEET
- **Structured investor feedback**: specific reasons, what to change, timeline for follow-up
- **Internal discussion**: what the VC would say about you after you leave the room

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

## Roadmap

- [x] 7 slash commands with guided workflow
- [x] 14 investor profiles (8 VC firms + 3 seed funds + 3 angel investors)
- [x] 4 stage playbooks (pre-seed → Series B)
- [x] 7 domain metrics with sub-domain classification (SaaS, Consumer, AI, Fintech, Marketplace, Hardware, Biotech)
- [x] Document persistence to `.fundraising/`
- [x] Investor feedback loop
- [ ] Growth/Late/IPO stage playbooks
- [x] "Deal Room" multi-meeting simulation
- [ ] Cross-session state persistence via file-based context

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
│   │   └── calacanis.md                  # Angel investors
│   ├── stage-playbooks/
│   │   ├── pre-seed.md
│   │   ├── seed.md
│   │   ├── series-a.md
│   │   └── series-b.md
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
deal-room/SKILL.md                       # Step 6: Multi-VC process simulation
```

---

## Contributing

This project is built for community contributions. Open Claude Code in your fork, tell it what you want to add — it reads `CONTRIBUTING.md` and generates properly formatted content.

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
| **New VC profile** | "Add Founders Fund" | [CONTRIBUTING.md #1](CONTRIBUTING.md#1-vc-profiles) |
| **New domain** | "Add an EdTech domain" | [CONTRIBUTING.md #2a](CONTRIBUTING.md#2a-add-a-new-domain) |
| **New sub-domain** | "Add RegTech to Fintech" | [CONTRIBUTING.md #2b](CONTRIBUTING.md#2b-add-a-sub-domain-to-an-existing-domain) |
| **New metric** | "Add NPS to SaaS metrics" | [CONTRIBUTING.md #2c](CONTRIBUTING.md#2c-add-a-new-metric-to-an-existing-domain) |
| **Stage playbook** | "Improve Series A playbook" | [CONTRIBUTING.md #3](CONTRIBUTING.md#3-stage-playbooks) |
| **Deck template** | "Add a Seed round template" | [CONTRIBUTING.md #4](CONTRIBUTING.md#4-deck-templates) |

---

## Disclaimer

VC simulations are for practice purposes only and do not represent actual firm views or investment decisions. VC profiles are built from publicly available information (websites, podcasts, blog posts, interviews).

---

## License

MIT
