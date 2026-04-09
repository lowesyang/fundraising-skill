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
with **8 real VC firms** modeled from public data.

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

If the skill loads, you'll see the onboarding table with all 6 commands.

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

---

## Workflow

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch
                                                  ↑                                                    |
                                                  └──────── investor feedback loop ←───────────────────┘
```

Each command guides you to the next step. After pitching, you can loop back to refine your strategy and deck based on investor feedback, then pitch again.

### Document Persistence

Every command saves its output to `.fundraising/` in your project:

```
.fundraising/
├── readiness-assessment-2026-04-09.md
├── product-metrics-2026-04-09.md
├── fundraising-strategy-2026-04-09.md
├── execution-plan-2026-04-09.md
├── pitch-deck-outline-2026-04-09.md
├── pitch-simulations/
│   ├── pitch-sequoia-2026-04-09.md
│   └── pitch-a16z-2026-04-10.md
└── timeline.jsonl
```

Start today, come back tomorrow — the skill picks up where you left off.

---

## VC Roster

8 firms modeled with detailed behavioral profiles for the `/pitch` simulator:

| Firm                        | Tier       | Known For                                           |
| --------------------------- | ---------- | --------------------------------------------------- |
| Y Combinator (YC)           | Seed       | "Do things that don't scale", user growth obsession |
| First Round Capital         | Seed       | Operator-friendly, community-driven, platform model |
| Andreessen Horowitz (a16z)  | Series A/B | Network effects, "what's the 10x version?"          |
| Sequoia Capital             | Series A/B | "Why now?", market timing, arc narrative            |
| Benchmark                   | Series A/B | Terse, product-obsessed, lets silence hang          |
| Accel                       | Series A/B | Data-driven, pattern-matching, fintech/SaaS         |
| Lightspeed Venture Partners | Series A/B | "Earned insight", enterprise SaaS                   |
| Tiger Global                | Growth     | Speed of decision, growth metrics, no board seats   |

Each VC asks different questions, pushes back differently, and evaluates through their own lens. The debrief tells you what they were _actually_ thinking.

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

### Pitch Simulation Debrief

After each simulated pitch, you get:

- **5-dimension scoring** (1-10): Problem clarity, Market conviction, Team strength, Traction evidence, Ask specificity
- **Verdict**: PASS / FOLLOW-UP MEETING / TERM SHEET
- **Structured investor feedback**: specific reasons, what to change, timeline for follow-up
- **Internal discussion**: what the VC would say about you after you leave the room

---

## Domains Supported

| Domain       | Metrics Covered                                                                                 |
| ------------ | ----------------------------------------------------------------------------------------------- |
| **SaaS**     | ARR, MRR growth, NDR, churn, LTV/CAC, payback period, gross margin, magic number, burn multiple |
| **Consumer** | DAU/MAU, D1/D7/D30 retention, viral coefficient, session length, ARPU, organic vs paid          |
| **AI/ML**    | Adapts by product type (Model Co / AI App / Infra / AI-Enhanced) — response time, inference cost, data moat, usage growth, customer concentration |

More domains (Fintech, Marketplace, Hardware, Biotech) coming in v2.

---

## Roadmap

- [x] 6 slash commands with guided workflow
- [x] 8 VC profiles with community-friendly individual files
- [x] 4 stage playbooks (pre-seed → Series B)
- [x] 3 domain metrics (SaaS, Consumer, AI/ML)
- [x] Document persistence to `.fundraising/`
- [x] Investor feedback loop
- [ ] Growth/Late/IPO stage playbooks
- [ ] More domains (Fintech, Marketplace, Hardware, Biotech)
- [ ] "Deal Room" multi-meeting simulation
- [ ] Cross-session state persistence via file-based context

---

## Project Structure

```
fundraising/                              # Shared references (installed as one skill)
├── SKILL.md
├── references/
│   ├── vc-profiles/                      # One file per VC — easy to contribute via PR
│   │   ├── _index.md                     # Directory of all VCs + contribution guide
│   │   ├── yc.md                         # Y Combinator
│   │   ├── first-round.md               # First Round Capital
│   │   ├── a16z.md                       # Andreessen Horowitz
│   │   ├── sequoia.md                    # Sequoia Capital
│   │   ├── benchmark.md                  # Benchmark
│   │   ├── accel.md                      # Accel
│   │   ├── lightspeed.md                 # Lightspeed Venture Partners
│   │   └── tiger-global.md              # Tiger Global
│   ├── stage-playbooks/
│   │   ├── pre-seed.md
│   │   ├── seed.md
│   │   ├── series-a.md
│   │   └── series-b.md
│   ├── metrics-by-domain/
│   │   ├── saas.md
│   │   ├── consumer.md
│   │   └── ai-ml.md
│   └── deck-templates/
│       ├── yc-demo-day.md
│       └── general-series-a.md
before-fundraising/SKILL.md               # Step 0: Readiness assessment
product-metrics/SKILL.md                  # Step 1: Traction grading
fundraising-strategy/SKILL.md            # Step 2: Round planning
fundraising-stage/SKILL.md               # Step 3: Execution plan
pitch-deck/SKILL.md                      # Step 4: Deck outline
pitch/SKILL.md                           # Step 5: VC simulation
```

---

## Contributing a VC Profile

The VC roster is community-driven. Anyone can add a new VC or improve an existing profile via PR.

### Quick Start

1. Copy the template below into a new file: `fundraising/references/vc-profiles/{vc-slug}.md`
2. Fill in the profile using **publicly available information only** (websites, podcasts, blog posts, interviews)
3. Submit a PR

### Profile Template

```yaml
---
name: "Firm Name"
slug: firm-name
tier: seed | series-ab | growth | late
stage_focus: [pre-seed, seed]
check_size: "$1M - $5M"
website: "https://example.com"
contributed_by: "your-github-username"
---
```

```markdown
## Firm Name

**Key Partners:** [names]
**Stage Focus:** [stages]
**Typical Check Size:** [$X - $Y]
**Investment Thesis:** [1-2 paragraphs from public statements]
**Portfolio Highlights:** [5-10 notable companies]
**Sector Preferences:** [industries/verticals]

### Behavioral Model
**Meeting Style:** [formal/casual, time-boxed, etc.]
**Signature Questions:** [3-5 questions this firm is known for]
**What Gets Them Excited:** [patterns they look for]
**Red Flags For Them:** [what makes them pass]
**Decision Process:** [solo GP vs partnership, timeline]
**Unique Quirks:** [distinctive behaviors]

### For the /pitch Simulator
**Opening Style:** [how they start meetings]
**Push-back Patterns:** [how they challenge founders]
**Closing Signals:** [positive vs negative signals]
**Internal Discussion:** [what they'd say after you leave]
```

### Guidelines

- **Public info only** — profiles are built from websites, podcasts, blog posts, and interviews. No insider or confidential information.
- **Make it distinct** — the value of the simulation is that each VC *feels different*. Focus on what makes this VC unique: their signature questions, their quirks, their specific push-back patterns.
- **Be specific** — "asks tough questions" is useless. "Lets silence hang for 5 seconds after you answer, waiting to see if you'll fill the gap" is gold.
- **Test it** — after writing your profile, run `/pitch` with it. Can you tell which VC you're talking to without being told? If not, the behavioral model needs more specificity.

---

## Disclaimer

VC simulations are for practice purposes only and do not represent actual firm views or investment decisions. VC profiles are built from publicly available information (websites, podcasts, blog posts, interviews).

---

## License

MIT
