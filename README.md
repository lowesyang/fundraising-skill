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

[Install](#install) · [Commands](#commands) · [Workflow](#workflow) · [VC Roster](#vc-roster) · [How It Works](#how-it-works)

</div>

---

## What Makes This Different

**Fundraising should be as simple as cooking. Follow the recipe, one step at a time.**

You wouldn't walk into a Michelin-star kitchen without a recipe. So why walk into a VC meeting without preparation? This skill breaks fundraising into 8 clear steps, like a recipe card. You don't need to be a "fundraising expert." Just follow the workflow.

**Today, your AI helps you prepare. Tomorrow, your agent goes fundraising for you.**

We built this for **founders who'd rather be building**. Indie hackers, solo devs, first-time founders, technical teams who know their product inside out but haven't memorized the VC playbook. You focus on building something people want. We handle the fundraising prep.

1. **Honest advisor, hard questions first.** "Should you even be raising right now? Or should you ship your MVP first?" A good advisor saves you from wasting months chasing money you don't need yet.

2. **Practice pitching to real VCs.** Each firm has its actual investment thesis, its partners' real behavioral styles, their known portfolio context. Pitching a16z feels nothing like pitching Benchmark. You'll know the difference before you walk in the room.

3. **One skill, every stage.** Whether you're a solo dev with a prototype or a 20-person team prepping Series B, the metrics that matter, the VCs who care, the story you should tell all change. This skill adapts to where you actually are.

4. **Your fundraising docs build up over time.** Each step saves a document to `.fundraising/` in your project. Come back tomorrow, next week, next month. Pick up right where you left off.

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

| Step | Command                 | What it does                                                        |
| ---- | ----------------------- | ------------------------------------------------------------------- |
| 0    | `/before-fundraising`   | Assess if you're ready to raise — honest verdict with hard gates    |
| 1    | `/product-metrics`      | Review traction data with RED/YELLOW/GREEN grading by domain        |
| 2    | `/fundraising-strategy` | Plan how much to raise, spending allocation, round structure        |
| 3    | `/fundraising-stage`    | Create actionable execution plan with investor targeting (optional) |
| 4    | `/pitch-deck`           | Build slide-by-slide deck outline tailored to your target VC        |
| 5    | `/pitch`                | Practice pitching with a simulated VC partner — full debrief after  |
| 6    | `/due-diligence`        | Prepare for investor DD — compliance, data, legal readiness check   |
| 7    | `/deal-room`            | Multi-VC fundraising process simulation — competitive dynamics      |

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

Each command guides you to the next. After `/pitch`, loop back to refine your deck and strategy based on VC feedback. When you get FOLLOW-UP or TERM SHEET interest, run `/due-diligence` to prepare for investor deep-dive questions (data, compliance, legal, IP). Then graduate to `/deal-room` for the full multi-VC process.

### Document Persistence

Every command saves its output to `.fundraising/` in your project. Start today, come back tomorrow — the skill picks up where you left off.

---

## VC Roster

41 investors modeled with detailed behavioral profiles for the `/pitch` simulator and `/deal-room`:

### Angel Investors

| Investor | Stage | Known For | Links |
|----------|-------|-----------|-------|
| Naval Ravikant | Pre-seed, Seed | Socratic, first-principles, "specific knowledge" | [Web](https://nav.al) · [𝕏](https://x.com/naval) · [LinkedIn](https://linkedin.com/in/navalr) |
| Elad Gil | Seed, Series A | Operator-investor, scaling expertise, High Growth Handbook | [Blog](https://blog.eladgil.com) · [𝕏](https://x.com/eaborkin) · [LinkedIn](https://linkedin.com/in/eladgil) |
| Jason Calacanis | Pre-seed, Seed | High-energy, speed-obsessed, "cockroach founders" | [LAUNCH](https://launch.co) · [𝕏](https://x.com/Jason) · [YouTube](https://youtube.com/@ThisWeekIn) |
| Peter Thiel | Pre-seed, Seed | Contrarian, "zero to one", monopoly thinking | [Founders Fund](https://foundersfund.com) · [𝕏](https://x.com/peterthiel) · [LinkedIn](https://linkedin.com/in/peterthiel) |
| Elon Musk | Pre-seed, Seed | Deep tech, first-principles, civilization-scale ambition | [𝕏](https://x.com/elonmusk) · [LinkedIn](https://linkedin.com/in/elonmusk) |
| Ron Conway | Pre-seed, Seed | "Godfather of SV", prolific seed, network connector | [SV Angel](https://svangel.com) · [𝕏](https://x.com/ronconway) · [LinkedIn](https://linkedin.com/in/ronconway) |
| Marc Andreessen | Pre-seed, Seed | "Software eating the world", platform plays | [Substack](https://pmarca.substack.com) · [𝕏](https://x.com/pmarca) · [LinkedIn](https://linkedin.com/in/marcandreessen) |
| Reid Hoffman | Pre-seed, Seed | Network effects, "blitzscaling", systems thinker | [Web](https://www.reidhoffman.org) · [𝕏](https://x.com/reidhoffman) · [LinkedIn](https://linkedin.com/in/reidhoffman) |

### Seed Funds

| Firm | Stage | Known For | Links |
|------|-------|-----------|-------|
| Y Combinator (YC) | Pre-seed, Seed | "Do things that don't scale", user growth obsession | [Web](https://www.ycombinator.com) · [𝕏](https://x.com/ycombinator) · [YouTube](https://youtube.com/@ycombinator) |
| First Round Capital | Pre-seed, Seed | Operator-friendly, community-driven, platform model | [Web](https://firstround.com) · [𝕏](https://x.com/firstround) · [Blog](https://review.firstround.com) |
| Floodgate | Pre-seed, Seed | "Thunder lizards", contrarian, framework-driven | [Web](https://floodgate.com) · [𝕏](https://x.com/m2jr) · [Podcast](https://greatness.floodgate.com) |
| Precursor Ventures | Pre-seed, Seed | Pre-seed specialist, product-minded, fast decisions | [Web](https://precursorvc.com) · [𝕏](https://x.com/chaborkin) · [Blog](https://www.charleshudson.net) |
| Hustle Fund | Pre-seed | Micro-fund, speed of execution, first-time founders | [Web](https://www.hustlefund.vc) · [𝕏](https://x.com/dunkhippo33) · [YouTube](https://youtube.com/@hustlefund) |
| Lux Capital | Seed, Series A | Deep tech + AI, "adjacent possible", frontier science | [Web](https://luxcapital.com) · [𝕏](https://x.com/wolfejosh) · [LinkedIn](https://linkedin.com/company/lux-capital) |
| Radical Ventures | Seed, Series A | AI-first fund, Geoffrey Hinton LP, research-grade diligence | [Web](https://radical.vc) · [𝕏](https://x.com/radical_vc) · [LinkedIn](https://linkedin.com/company/radical-ventures) |
| 500 Global | Pre-seed, Seed | 2700+ companies, global accelerator, 80+ countries | [Web](https://500.co) · [𝕏](https://x.com/500Global) · [LinkedIn](https://linkedin.com/company/500-startups) |
| Felicis Ventures | Seed, Series A | Shopify seed investor, "ridiculously ambitious founders" | [Web](https://felicis.com) · [𝕏](https://x.com/aaborjsenkut) · [LinkedIn](https://linkedin.com/company/felicis-ventures) |

### Series A/B Firms

| Firm | Stage | Known For | Links |
|------|-------|-----------|-------|
| Andreessen Horowitz (a16z) | Series A/B | Network effects, "what's the 10x version?" | [Web](https://a16z.com) · [𝕏](https://x.com/a16z) · [YouTube](https://youtube.com/@a16z) |
| Sequoia Capital | Series A/B | "Why now?", market timing, arc narrative | [Web](https://www.sequoiacap.com) · [𝕏](https://x.com/sequoia) · [YouTube](https://youtube.com/@sequoiacapital) |
| Benchmark | Series A/B | Terse, product-obsessed, lets silence hang | [Web](https://www.benchmark.com) · [𝕏](https://x.com/benchmark) · [LinkedIn](https://linkedin.com/company/benchmark-capital) |
| Accel | Series A/B | Data-driven, pattern-matching, fintech/SaaS | [Web](https://www.accel.com) · [𝕏](https://x.com/Accel) · [Blog](https://www.accel.com/perspectives) |
| Lightspeed Venture Partners | Series A/B | "Earned insight", enterprise SaaS | [Web](https://lsvp.com) · [𝕏](https://x.com/lightspeedvp) · [Blog](https://lsvp.com/blog/) |
| Greylock Partners | Seed to Series B | "Systems of intelligence", product-first, AI infrastructure | [Web](https://greylock.com) · [𝕏](https://x.com/GreylockVC) · [LinkedIn](https://linkedin.com/company/greylock-partners) |
| Khosla Ventures | Seed to Growth | OpenAI early backer, deep tech + AI, world-changing bets | [Web](https://khoslaventures.com) · [𝕏](https://x.com/KhsoslavVntures) · [LinkedIn](https://linkedin.com/company/khosla-ventures) |
| General Catalyst | Seed to Growth | "Responsible innovation", AI verticals (Harvey, Jasper) | [Web](https://generalcatalyst.com) · [𝕏](https://x.com/gcvp) · [LinkedIn](https://linkedin.com/company/general-catalyst-partners) |
| Index Ventures | Seed to Growth | Transatlantic, Figma/Notion/Cohere, "product velocity" | [Web](https://indexventures.com) · [𝕏](https://x.com/indexventures) · [LinkedIn](https://linkedin.com/company/index-ventures) |
| Founders Fund | Seed to Growth | PayPal Mafia, contrarian, SpaceX/Anduril/Figure AI | [Web](https://foundersfund.com) · [𝕏](https://x.com/foaborundersfund) · [LinkedIn](https://linkedin.com/company/founders-fund) |
| Thrive Capital | Series A to Growth | OpenAI lead investor ($6.6B), product taste, low-profile | [Web](https://thrivecap.com) · [LinkedIn](https://linkedin.com/company/thrive-capital) |
| NEA | Seed to Growth | $25B AUM, Databricks/Cloudflare, all-stage coverage | [Web](https://nea.com) · [𝕏](https://x.com/NEA) · [LinkedIn](https://linkedin.com/company/new-enterprise-associates) |

### Growth

| Firm | Stage | Known For | Links |
|------|-------|-----------|-------|
| Tiger Global | Series B to Pre-IPO | Speed of decision, growth metrics, no board seats | [Web](https://www.tigerglobal.com) · [LinkedIn](https://linkedin.com/company/tiger-global-management) |
| Coatue Management | Series B to Pre-IPO | Crossover fund, quantitative, AI infrastructure bets | [Web](https://coatue.com) · [LinkedIn](https://linkedin.com/company/coatue-management) |
| Insight Partners | Series B to Pre-IPO | Largest growth equity, ScaleUp ops platform, AI/SaaS | [Web](https://insightpartners.com) · [𝕏](https://x.com/insightpartners) · [LinkedIn](https://linkedin.com/company/insight-partners) |
| SoftBank Vision Fund | Series B to Pre-IPO | 孙正义, $100B+ fund, "300-year vision", category kings | [Web](https://visionfund.com) · [𝕏](https://x.com/softbank) · [LinkedIn](https://linkedin.com/company/softbank-investment-advisers) |
| DST Global | Series B to Pre-IPO | Yuri Milner, Facebook pre-IPO, zero board seats | [Web](https://dst-global.com) · [LinkedIn](https://linkedin.com/company/dst-global) |

### Strategic / Corporate Investors (CVC)

> These investors make **strategic investments** to grow their ecosystems, not purely for financial returns. They offer cloud credits, distribution channels, engineering support, and enterprise customer access — but expect strategic alignment with their platforms.

| Firm | Focus | Strategic Value | Links |
|------|-------|----------------|-------|
| NVIDIA NVentures | AI infrastructure, GPU ecosystem | Early hardware access, engineering support | [Web](https://nvidia.com/ventures) · [𝕏](https://x.com/nvidia) · [LinkedIn](https://linkedin.com/company/nvidia) |
| Microsoft M12 & Corporate | Azure/AI ecosystem (OpenAI $13B+) | Azure credits, Copilot integration, enterprise channel | [Web](https://m12.vc) · [𝕏](https://x.com/maborink12vc) · [LinkedIn](https://linkedin.com/company/m12vc) |
| GV (Google Ventures) | AI, cloud, developer tools | Google Cloud credits, distribution, AI research access | [Web](https://gv.com) · [𝕏](https://x.com/GVteam) · [LinkedIn](https://linkedin.com/company/gv) |
| Amazon & AWS Investments | AWS ecosystem (Anthropic $4B+) | AWS credits, marketplace distribution, supply chain | [Web](https://aws.amazon.com/startups/) · [𝕏](https://x.com/AWSstartups) · [LinkedIn](https://linkedin.com/company/amazon) |
| Salesforce Ventures | CRM/enterprise SaaS ecosystem | AppExchange (150K+ customers), joint selling | [Web](https://salesforceventures.com) · [𝕏](https://x.com/SalesforceVC) · [LinkedIn](https://linkedin.com/company/salesforce-ventures) |
| Intel Capital | AI chips, edge computing, semiconductors | Early Intel hardware access, engineering support | [Web](https://intelcapital.com) · [𝕏](https://x.com/IntelCapital) · [LinkedIn](https://linkedin.com/company/intel-capital) |
| Oracle Corporate | Enterprise cloud/database ecosystem | OCI credits, enterprise customer base, M&A path | [Web](https://oracle.com) · [𝕏](https://x.com/Oracle) · [LinkedIn](https://linkedin.com/company/oracle) |

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
- **Competitive dynamics**: VCs ask who else you're talking to. Interest from one accelerates others
- **Pitch evolution**: Adjust your pitch between meetings based on feedback
- **Follow-up meetings**: VCs who want a second look get a focused follow-up
- **Final report**: Pipeline outcome, score trajectory, lessons learned, term sheet comparison

### Pitch Debrief

After each simulated pitch, you get:

- **5-dimension scoring** (1-10): Problem clarity, Market conviction, Team strength, Traction evidence, Ask specificity
- **Verdict**: PASS / FOLLOW-UP MEETING / TERM SHEET
- **Investor feedback**: Specific reasons, what to change, timeline for follow-up
- **Internal discussion**: What the VC would say about you after you leave the room

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

- [x] 8 slash commands with guided workflow
- [x] 41 investor profiles (8 angels + 9 seed funds + 12 Series A/B + 5 growth + 7 strategic/CVC)
- [x] 4 stage playbooks (pre-seed → Series B)
- [x] 7 domain metrics with sub-domain classification (SaaS, Consumer, AI, Fintech, Marketplace, Hardware, Biotech)
- [x] Document persistence to `.fundraising/`
- [x] Investor feedback loop
- [x] Due diligence preparation with domain-specific compliance
- [x] "Deal Room" multi-meeting simulation
- [ ] Growth/Late/IPO stage playbooks
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
│   │   ├── calacanis.md, peter-thiel.md  # Angel investors
│   │   ├── elon-musk.md, ron-conway.md   # Angel investors
│   │   └── marc-andreessen.md, reid-hoffman.md # Angel investors
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
