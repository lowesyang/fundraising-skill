---
name: pitch-deck
description: >
  Pitch deck outline designer — generates a slide-by-slide deck outline tailored to your target VC's
  preferences. Supports YC Demo Day format and General Series A format. Tailors to specific VCs
  (a16z, Sequoia, Benchmark, etc.) based on their known preferences.
  Use when the user asks "help me build my deck", "pitch deck", "design my pitch deck",
  "deck structure", "pitch deck outline", or mentions building a presentation for investors.
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → ▶ /pitch-deck → /pitch → /due-diligence → /deal-room.
---

# /pitch-deck — Pitch Deck Outline Designer

The deck should be built after you understand your metrics, strategy, and target investors — it's
the synthesis of everything you've prepared so far.

## Workflow Context

This command is **Step 4** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → ▶ /pitch-deck → /pitch → /due-diligence → /deal-room
```

## Flow

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`). If found, read frontmatter + all
   prior sections (metrics, strategy, execution plan) to fully pre-fill context. Show welcome
   back greeting (format in `fundraising/SKILL.md`). If multiple playbooks, ask which to use.

2. **Extract required content from playbook and fill gaps.**

   Pull the following from the playbook. For each item not found, ask the founder directly
   before proceeding — the deck cannot be built without this information.

   **Problem & Product (required at all stages):**
   - What specific pain does this solve? Be concrete: who feels it, how often, and what's the
     current workaround? A vague "inefficiency in the market" is not a pain point.
   - What does the product do — in plain terms a non-technical investor can understand? What's
     the core workflow the user actually experiences?
   - What is the key insight or mechanism that makes this better than the status quo?

   If missing: ask the founder to describe the problem and product in 3-4 sentences each.

   **Target customer (required at all stages):**
   - Who is the primary buyer/user? Be specific: job title, company size, industry, geography.
   - What triggers them to look for a solution right now? (urgency)
   - If B2B: who signs the check vs. who uses it? Are they the same person?

   If missing: ask for the ICP and the buying trigger.

   **Business model (required seed+; directional at pre-seed):**
   - How does the company make money? Pricing model (subscription, usage-based, transaction fee, etc.)
   - Current pricing, if live
   - Expected unit revenue per customer (ACV or ARPU)
   - At pre-seed: at minimum, what monetization model is planned and why it fits the market

   If missing: ask how they plan to charge and roughly how much.

   **Go-to-market strategy (required seed+; directional at pre-seed):**
   - Primary acquisition channel(s) today and why they work (or why you believe they will)
   - Sales motion: self-serve, inside sales, field sales, partnerships, PLG?
   - CAC by channel if known
   - For Series A+: current AE ramp time, pipeline coverage, and quota attainment if applicable

   If missing: ask how the founder is currently acquiring customers and what's working.

   **Revenue projections and growth curve (required Series A+; optional seed):**
   - Historical revenue trajectory (monthly or quarterly, last 12 months)
   - Forward projection: 12-month and 36-month revenue targets with key assumptions visible
   - Growth rate assumptions: what drives the curve (headcount, channel expansion, product-led)
   - At seed: a directional 12-month revenue target is sufficient if the business has revenue

   If missing at Series A+: ask for historical MRR/ARR and 12/36-month targets with the
   underlying assumption (e.g., "hiring 3 AEs in Q2, closing rate of 20%, ACV of $24K").

   **Cost structure (optional; include when it tells a good story):**
   - Gross margin (especially if high — SaaS >70% is a strength worth showing)
   - Headcount cost as % of revenue
   - Path to profitability or Rule of 40 trajectory, if relevant to stage
   - For hardware/marketplace/fintech: COGS and take rate breakdown are often required
   - Omit if the numbers are unflattering and don't yet tell a clear trajectory story —
     investors will ask, but you can address it verbally

   **From "Product Metrics" section (if `/product-metrics` was run):**
   - Key metrics with their actual values and grades (e.g., MRR $42K 🟡, NDR 108% 🟢, churn 3.2% 🟡)
   - Standout GREEN metrics to lead with; RED metrics to decide on proactively

   If no "Product Metrics" section exists: ask for 3-5 key metrics by domain (SaaS: MRR/ARR,
   MoM growth, churn, LTV/CAC; Consumer: DAU/MAU, D30 retention, ARPU; etc.).

   **Team (required at all stages):**
   - Each founder/key team member: name, role, and one specific credential relevant to this
     problem (prior exit, domain years, company they built, specific technical depth)
   - Advisors or notable backers who add credibility
   - Key hires planned with this round (Series A+)

   If team info is missing or thin: ask for each person's relevant background specifically.
   "Strong engineering team" and "serial entrepreneur" do not belong in a deck without evidence.

   **From "Fundraising Strategy" section (if run):**
   - Target raise amount, round structure, use-of-funds breakdown, milestones this round proves

   If missing: ask for the raise amount and what it funds.

3. **Load the appropriate deck template** from `../fundraising/references/deck-templates/`
   (yc-demo-day.md or general-series-a.md).

4. **If a target VC is specified**, load their individual profile from `../fundraising/references/vc-profiles/`
   (e.g., `a16z.md`, `sequoia.md`) to tailor the deck to their preferences.

5. **Generate a slide-by-slide outline** using the actual data collected in step 2.

   First, determine the stage-appropriate structure from the `## Stage-Specific Deck Structure`
   section at the bottom of this file. The stage sets the slide count, narrative weight
   distribution, and which slides are required vs. optional.

   For each slide: title, key message (1 sentence), the specific data points to include,
   and design notes. Do not use placeholders like "[insert metric]" — if the data exists,
   use it; if it doesn't, flag it as a gap.

   **Traction/Metrics slides:** populate with the actual metric values from step 2.
   Lead with GREEN-graded metrics as headline numbers. For YELLOW metrics, suggest framing
   that shows trajectory rather than point-in-time (e.g., "MoM growth" instead of absolute
   ARR when ARR is small). Flag RED metrics — discuss with the founder whether to address
   proactively or omit, and note the risk of each choice. At pre-seed, if meaningful metrics
   don't exist yet, replace with qualitative traction signals (interviews, waitlist, LOIs).

   **Team slide:** populate with specific credentials, not role titles. "Ex-Stripe PM, built
   and scaled payments product to $2B TPV" is a credential. "Experienced product leader"
   is not. For each team member, answer: what have they done that makes an investor confident
   they can execute this specific thing? Include domain expertise, prior exits, relevant
   industry relationships, and technical depth. At pre-seed this slide carries the most weight
   in the deck — give it proportionally more space.

   **Ask slide:** populate with the exact amount, round structure (SAFE/priced), use-of-funds
   breakdown by category, and the specific milestones that spending is meant to prove.

   Tailor narrative structure to VC preferences:
   - a16z: lead with vision and platform potential; TAM/SAM/SOM with bottom-up customer math
   - Sequoia: open with "why now?" — market timing is the central story
   - Benchmark: fewer slides, deeper product clarity, less market narrative
   - YC Demo Day: 2 minutes, 5-8 slides, traction-heavy, lead with the number
   - General: follow the stage-appropriate narrative arc from Stage-Specific Deck Structure below

6. Call out what's **strong** and what's **weak** in the story — per slide and overall.
   For weak areas: suggest what data or framing would strengthen them.

7. Flag any slides that rely on missing data. For each gap, state what the founder needs to
   find, generate, or decide before the deck is complete.

8. Output as a structured document usable as a brief for actual slide creation.

9. **Save to playbook:** Append to `.fundraising/{round-dir}/playbook.md`:
   1. Update frontmatter: set `steps_completed.pitch-deck` (date) + `last_updated`
   2. Update Progress Tracker row for `/pitch-deck` (✅ with "{N} slides tailored for {VC/general}")
   3. Append `## Pitch Deck Outline — {YYYY-MM-DD}` section with full deck outline

10. **Next step prompt:** "✅ Deck outline complete. Added to `.fundraising/{round-dir}/playbook.md`.
    [N] slides tailored for [VC/general].
    Next: run `/pitch` to practice your pitch with a simulated VC partner."

---

## Stage-Specific Deck Structure

### Pre-seed (idea to MVP, pre-revenue)

**Investor's primary question:** Why is this team uniquely positioned to win?

**Slide count:** 8–10

**Narrative arc:** Problem → Target Customer → Solution/Product → Market → Why Now → Team → Ask

**Slide breakdown:**

| Slide | Content | Notes |
|-------|---------|-------|
| Problem | The specific pain, who feels it, how often, what they do today | Be concrete — "teams waste 4 hours/week" beats "inefficient workflows" |
| Target Customer | ICP: job title, company size, the trigger that makes them look for a solution | Shows market understanding before the product exists |
| Solution / Product | What the product does, the core mechanism, what makes it different | A prototype or early demo screenshot > a diagram |
| Market | TAM/SAM with bottom-up sizing; why this market, why now | Cite a structural shift (regulation, technology, behavior) |
| Why Now | What changed in the last 2–3 years that makes this the right time | Missing this slide is a common pre-seed mistake |
| Team | Each founder's specific credential relevant to this problem | See Team note below |
| Ask | Amount, structure (SAFE/convertible), use-of-funds, first milestone | |

**Required:** Problem, Target Customer, Team, Ask
**Optional:** Competition, Advisors, Product demo

**Business model:** One sentence on the intended pricing model is sufficient ("subscription, $X/seat/month"). Investors don't expect a proven model at pre-seed, but no mention of monetization signals the founder hasn't thought about it.

**GTM:** Directional is fine — "initial channel is founder-led outreach to [ICP], moving to [X] once product-market fit is confirmed." Not having a GTM at pre-seed is acceptable; not having a hypothesis is not.

**Revenue projections / cost structure:** Not expected. A use-of-funds breakdown on the Ask slide is sufficient.

**Team slide note:** At pre-seed, investors are writing a check on people, not product. Each team member needs a specific "unfair advantage" credential: domain expertise years, relevant prior company, personal connection to the problem, or technical depth. If credentials are thin, show the compensating work: number of customer interviews, prototype in market, strong advisor backing.

---

### Seed (MVP launched, early users, possibly early revenue)

**Investor's primary question:** Is there genuine PMF signal here?

**Slide count:** 10–12

**Narrative arc:** Problem → Target Customer → Solution/Product → Market → Traction → Business Model → GTM → Team → Ask

**Slide breakdown:**

| Slide | Content | Notes |
|-------|---------|-------|
| Problem | Pain + current workarounds + cost of status quo | Quantify where possible |
| Target Customer | Specific ICP, buyer vs. user distinction (B2B), buying trigger | |
| Solution / Product | Core product, key workflow, what's technically differentiated | Lead with the user experience, not the architecture |
| Market | Bottom-up TAM with customer-level math | Top-down TAM citations alone are not credible |
| Traction | Growth chart (MoM), active users/ARR, retention cohort if available | See Traction note below |
| Business Model | Pricing model, current price point, ACV or ARPU, gross margin if known | Show the unit; don't just name the model |
| GTM | Primary acquisition channel(s), CAC directionally, what's working | Even "founder-led sales" is a valid GTM if it's honest |
| Team | Credentials + what they've built/sold/operated | |
| Ask | Amount, structure, use-of-funds, 18-month milestones | |

**Required:** Problem, Target Customer, Traction, Business Model, Team, Ask
**Optional:** Competition, Why Now, Revenue projection (directional 12-month)

**Revenue projections:** A directional 12-month revenue target with one or two key assumptions is appropriate at seed if the business already has revenue. Present it as a scenario ("at current growth rate and planned AE hire, we expect $X ARR by [date]"), not a precision forecast.

**Cost structure:** Optional. Include gross margin if it's a strength (>70% for SaaS). Omit detailed cost structure — investors don't expect full P&L visibility at seed.

**Traction slide note:** Show a growth chart. Lead with MoM growth rate if absolute ARR is still small. Include cohort retention if available — a small cohort with strong retention is a powerful signal. Do not show DAU/WAU/MAU as raw numbers without benchmarks or context.

---

### Series A (repeatable growth engine forming)

**Investor's primary question:** Can this scale predictably? Is the growth engine repeatable?

**Slide count:** 12–15

**Narrative arc:** Executive Summary → Problem → Target Customer → Solution/Product → Market → Traction → Unit Economics → Business Model → GTM → Competition → Team → Revenue Projections → Ask

**Slide breakdown:**

| Slide | Content | Notes |
|-------|---------|-------|
| Executive Summary | One-slide overview: what, for whom, key metrics, ask | Some investors read this first; make it standalone |
| Problem | Pain + cost of status quo + why existing solutions fail | More rigorous than at seed |
| Target Customer | ICP with segmentation, buyer journey, ACV by segment | |
| Solution / Product | Core product, key differentiator, product roadmap (3-horizon) | |
| Market | Bottom-up TAM × SAM with customer-level math | |
| Traction | Revenue growth (MoM/QoQ), cohort retention curves | 2 slides if you have rich data |
| Unit Economics | LTV/CAC with payback period, gross margin trajectory, burn multiple | See Unit Economics note below |
| Business Model | Pricing model, ACV/ARPU, revenue mix, expansion revenue | NDR is a key metric here |
| GTM | CAC by channel, sales motion, AE ramp/quota, pipeline coverage ratio | |
| Competition | Positioning matrix, your specific moat, why you win head-to-head | |
| Team | Track record + relevant credentials + key open hires | |
| Revenue Projections | 36-month revenue forecast with key assumptions visible | |
| Ask | Amount, structure, use-of-funds by category, milestones this round proves | |

**Required:** Traction (growth + retention cohorts), Unit Economics, GTM, Revenue Projections (36-month), Team, Ask
**Optional:** Product roadmap, Customer case study

**Revenue projections note:** Show a 36-month forecast with 3–5 key assumptions (e.g., AE hiring plan, quota attainment %, ACV target, churn assumption). Investors don't expect precision — they want to see if you understand the levers of your business. A hockey-stick with no assumptions is worse than a conservative model with clear logic.

**Cost structure:** Include gross margin trajectory and burn multiple — these are expected at Series A. Full P&L is optional but demonstrates financial sophistication. If gross margin is below 60% for SaaS, include the improvement path.

**Unit economics note:** Define both LTV and CAC explicitly. Show payback period. If payback is over 18 months, address it. If gross margin is below 60%, show the trajectory. Do not present LTV/CAC as a ratio without showing the components.

---

### Series B (scaling the growth engine)

**Investor's primary question:** Are you the category winner? What keeps competitors out?

**Slide count:** 15–18

**Narrative arc:** Business Overview → Market Position → Product Platform → Traction (2 slides) → Unit Economics → Competitive Moat → GTM + Expansion → Business Model at Scale → Revenue Projections + Cost Structure → Team + Key Hires → Ask

**Slide breakdown:**

| Slide | Content | Notes |
|-------|---------|-------|
| Business Overview | Company snapshot: ARR, growth rate, customer count, team size | Replace the Problem/Solution slides from earlier stages |
| Market Position | Market share, category leadership evidence, share of wallet | |
| Product Platform | Product surface, integrations, platform depth | Emphasize switching costs and ecosystem |
| Traction (×2) | Revenue growth + cohort retention by vintage | Multi-year cohort data expected |
| Unit Economics | Gross margin, LTV/CAC improving over time, burn multiple trend | Show improvement trajectory, not just current state |
| Competitive Moat | Structural barriers: switching costs, network effects, data, ecosystem | See Moat note below |
| GTM + Expansion | Current channels + next geo/vertical/product expansion | The Series B funds expansion, not the core business |
| Business Model at Scale | NDR, revenue mix (new vs. expansion), pricing evolution | |
| Revenue Projections | 36-month P&L forecast + path to profitability horizon | Full assumptions visible |
| Cost Structure | COGS, gross margin trajectory, OpEx by category, Rule of 40 position | Expected at this stage |
| Team + Key Hires | Executive team completeness + planned hires with this round | |
| Ask | Amount, lead/follow structure, use-of-funds, milestones | |

**Required:** Market Position, Unit Economics (trajectory), Competitive Moat, GTM + Expansion, Revenue Projections, Cost Structure, Ask
**Optional:** Customer case studies, Partnership / ecosystem map

**Moat slide note:** "First-mover advantage" is not a moat. Show structural barriers with evidence: churn differential vs. competitors (switching cost), engagement curve as network grows (network effect), proprietary data that improves with scale, regulatory or certification barriers, or ecosystem lock-in through integrations.

---

### Growth / Series C+ (market dominance play)

**Investor's primary question:** What's the path to a market-defining outcome, and what's the endgame?

**Slide count:** 18–22 + financial appendix

**Narrative arc:** Business Summary → Market Dominance → Product Platform → Revenue + Financial Model (3–4 slides) → Unit Economics at Scale → Cost Structure + Rule of 40 → Competitive Positioning → Expansion Roadmap → Team → Capital Allocation → Ask

**Slide breakdown:**

| Slide | Content | Notes |
|-------|---------|-------|
| Business Summary | Scale snapshot: ARR, growth, customers, team, prior funding | |
| Market Dominance | Market share today and 3-year path, structural defensibility | |
| Product Platform | Product surface + ecosystem + roadmap | |
| Revenue History | Monthly/quarterly ARR last 3 years, growth rate trend | |
| Revenue Projections | 5-year model with detailed assumptions | |
| Unit Economics | LTV/CAC at scale, cohort retention by vintage (3+ years), gross margin | |
| Cost Structure | Full P&L: COGS, S&M, R&D, G&A, EBITDA trajectory | Required |
| Rule of 40 | Current position, path to target, comparison to comps | |
| Competitive Positioning | Market map, win/loss data, moat analysis | |
| Expansion Roadmap | Next geo, product, or vertical + timeline + investment required | |
| Team | Executive completeness + key hire plan | |
| Capital Allocation | Exactly how this round funds specific strategic objectives | Not "fund growth" — specify M&A, geo expansion, etc. |
| Ask | Amount, structure, use-of-funds, expected outcomes | |

**Required:** Revenue model (history + projections), Cost Structure (full P&L), Unit Economics at Scale, Rule of 40, Market Dominance thesis, Capital Allocation, Ask
**Appendix:** Detailed financial model, Multi-vintage cohort analysis, Cap table summary, Comparable company analysis
