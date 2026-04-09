# Investor Due Diligence Patterns

> Extracted from real Series A due diligence questionnaires. These patterns represent what investors
> are actually evaluating — not the surface questions, but the underlying intent.
> Used by `/pitch` (debrief follow-up questions), `/before-fundraising` (readiness probing),
> `/product-metrics` (which numbers to prepare), and `/fundraising-stage` (DD preparation).

## DD Question Categories & Investor Intent

### 1. Data Integrity & Internal Consistency
**Surface question:** "Your numbers from source A don't match source B. Explain the discrepancy."
**Investor intent:** Can I trust this team's data? Do they have clean internal systems, or are they
cobbling together metrics from different tools and hoping nobody cross-checks?
**Universal probe:** Ask founders to reconcile their top metric from two different sources. If they
can't explain discrepancies clearly, it's a red flag for data maturity.
**Applies to:** ALL — every company has this risk. SaaS: ARR in CRM vs billing system. Marketplace:
GMV vs payment processor numbers. AI: usage metrics vs billing.

### 2. Cohort Retention & Revenue Quality
**Surface question:** "What's your monthly renewal rate since launch? Show me cohort data."
**Investor intent:** Is this growth real and durable, or are you backfilling churned users with new
ones? Cohort analysis reveals whether your product actually retains value over time.
**Universal probe:** M1/M0, M2/M0, M3/M0 retention curves. If M2/M0 stabilizes (flattens), there's
a core of sticky users. If it keeps declining linearly, the product is a leaky bucket.
**Applies to:** SaaS (NDR, logo retention), Consumer (D1/D7/D30), Fintech (repeat transaction rate),
Marketplace (repeat purchase rate), AI (usage retention by cohort).

### 3. User Economics & Behavior Depth
**Surface question:** "Average wallet balance? Repeat deposit behavior? Trading frequency?"
**Investor intent:** How deeply are users engaged? Surface-level engagement (signed up, tried once)
vs deep engagement (deposited real money, came back repeatedly, increased commitment over time).
The deposit/withdrawal ratio reveals confidence — are users putting more in or pulling out?
**Universal probe:** What does the "deepening engagement" funnel look like? Sign-up → first action →
repeat action → increased commitment → referral. What % makes it through each step?
**Applies to:** Fintech (deposit/withdrawal ratio), SaaS (feature adoption depth), Consumer
(session frequency trend), Marketplace (buyer frequency, average order value trend).

### 4. Core Technology & Defensibility
**Surface question:** "What is DMIND? Where does your core edge come from? Explain in plain language."
**Investor intent:** Is there a real technical moat, or just a wrapper on top of commodity tech?
Can a well-funded competitor replicate this in 6 months? The "explain in plain language" part is
crucial — if you can't explain your edge simply, you might not actually have one.
**Universal probe:** What specific technical advantage do you have that would take a competitor
>12 months to replicate, even with unlimited funding?
**Applies to:** AI (model differentiation, data moat, training methodology), Hardware (proprietary
design, manufacturing process), Biotech (patents, clinical data), SaaS (architectural advantage).

### 5. Model/Algorithm Transparency
**Surface question:** "Which decisions are learned vs rule-based? What data sources matter most?"
**Investor intent:** How much do you understand your own system? If the AI is a black box to you,
that's terrifying. Investors want to see that founders can decompose their system into
understandable components and explain WHY each piece works.
**Universal probe:** Draw the boundary between "what the AI decides" and "what humans control."
Is the human oversight sufficient? Can you explain a failure mode?
**Applies to:** AI (model decisions), Fintech (underwriting logic), Hardware (autonomous systems),
any product with algorithmic decision-making.

### 6. Adversarial Conditions & Failure Modes
**Surface question:** "How does your product perform when market volatility drops? What about extreme events?"
**Investor intent:** Every product looks good in favorable conditions. Investors want to know:
what's the worst case? Have you stress-tested it? Do you have circuit breakers? The question
isn't whether bad things will happen — it's whether you've thought about them.
**Universal probe:** What's your product's performance in the worst 10% of conditions? What
automatically stops/limits when things go wrong? What's the recovery plan?
**Applies to:** Fintech (market downturns, default spikes), AI (model degradation, adversarial inputs),
SaaS (outages, data loss), Marketplace (supply/demand imbalance), Hardware (manufacturing defects).

### 7. Risk Controls & Guardrails
**Surface question:** "What risk guardrails exist? Maximum loss, kill switch, pause conditions?"
**Investor intent:** How does the product protect users (and by extension, the company) from
catastrophic outcomes? This reveals operational maturity. A startup that hasn't thought about
guardrails is a lawsuit waiting to happen.
**Universal probe:** What's the worst thing that can happen to a user? What prevents it?
How quickly can you intervene? What's the escalation path?
**Applies to:** Fintech (risk limits, compliance), AI (safety, content moderation), Hardware
(safety certifications), Biotech (patient safety), Consumer (data privacy).

### 8. Scalability & Capacity
**Surface question:** "What's the capacity limit of your strategy? What happens with 10x more users?"
**Investor intent:** Does this business have structural scaling limits? Some businesses (like quant
trading) have fixed capacity — alpha degrades with scale. Others (like SaaS) scale infinitely.
Investors need to know which one you are.
**Universal probe:** If you 10x your users/volume tomorrow, what breaks first? What's the
theoretical maximum scale, and what constrains it?
**Applies to:** AI (inference capacity, model serving costs), Fintech (capital requirements),
Marketplace (liquidity constraints), SaaS (infrastructure scaling), Hardware (manufacturing capacity).

### 9. Cost Structure & Unit Economics
**Surface question:** "Break down your $300K monthly operating costs. What's the trend?"
**Investor intent:** Where does money go, and does the cost structure improve with scale?
High people costs (>50%) are normal for early startups but need to show leverage potential.
Tech costs that grow linearly with users are concerning. Fixed costs that don't scale are ideal.
**Universal probe:** What % of your costs are fixed vs variable? As you 10x revenue,
do costs 2x or 10x? Where are the operating leverage points?
**Applies to:** ALL — but the concerning patterns differ. AI: inference costs. SaaS: hosting costs.
Marketplace: trust & safety costs. Hardware: COGS. Biotech: R&D burn.

### 10. Exit Strategy & Return Path
**Surface question:** "What's your ideal exit path and timeline?"
**Investor intent:** How do I get my money back, multiplied? Do the founders have realistic
expectations about exit options? Is the market structure conducive to exits (IPO, M&A)?
Are there natural acquirers who would pay a premium?
**Universal probe:** Who are the 3-5 most likely acquirers, and why would they pay a premium?
What would need to be true for an IPO to be viable?
**Applies to:** ALL stages, but especially Series A+ where exit path clarity matters.

### 11. User Acquisition & Growth Quality
**Surface question:** "What leading indicators show growth is healthy (not incentive-driven)?"
**Investor intent:** Paid growth that stops when you stop spending is not a business. Investors
want to see organic pull — users coming without being paid to, staying without being bribed to,
and growing without unsustainable burn.
**Universal probe:** What % of growth is organic? What's the payback period on paid acquisition?
If you stopped all marketing spend tomorrow, what would your growth rate be?
**Applies to:** ALL — the specific channels differ, but the question is universal.

### 12. User Profile & Market Expansion
**Surface question:** "Who are you winning today? How do you expand beyond this initial segment?"
**Investor intent:** Is your current user base a beachhead for a larger market, or a niche you're
stuck in? The best companies start narrow and expand. The worst companies start narrow and
discover they can't expand.
**Universal probe:** Describe your current user in detail. Now describe the user you'll have in
3 years. What's the bridge between them?
**Applies to:** ALL — but the expansion story matters most for Series A+.

### 13. Regulatory & Legal Risk
**Surface question:** "How do you manage risk disclosure and platform liability?"
**Investor intent:** Could this company get sued out of existence? Is there regulatory risk that
could shut down the business? Have they thought about compliance proactively, or are they
hoping nobody notices?
**Universal probe:** What's the most likely regulatory threat? What's your compliance roadmap?
Have you engaged with regulators proactively?
**Applies to:** Fintech (heavy), Biotech (heavy), AI (growing), Consumer (data privacy),
Hardware (safety certification).

### 14. Customer Custody & Fund Flow
**Surface question:** "How does money flow through your system? Who has custody?"
**Investor intent:** In any business that touches user funds or assets, the custody architecture
reveals both operational sophistication and legal risk. Can users always get their money out?
What happens if you go bankrupt?
**Universal probe:** Draw the complete flow of money/assets from user to your system and back.
Where does custody change hands? What legal entity holds what?
**Applies to:** Fintech (critical), Marketplace (escrow), SaaS (data custody), any company
handling user assets.

### 15. Compliance & Regulatory Readiness
**Surface question:** "What licenses do you have? What's your regulatory status? Who's your legal counsel?"
**Investor intent:** Regulatory risk can kill a company overnight — or block an exit entirely. Investors
need to know: (1) Is this business legal in its operating jurisdictions? (2) Is there pending regulation
that could fundamentally change the business model? (3) Has the team been proactive or reactive on
compliance? A startup that says "we'll deal with regulation later" is a red flag.
**Universal probes by domain:**

**Fintech / Crypto:**
- What money transmission licenses do you hold (MSB, MTL, EMI, etc.)? In which jurisdictions?
- How do you handle KYC/AML? What provider? What % of users pass vs fail?
- Are you registered with FinCEN, MAS, FCA, or equivalent?
- How does your product work in restricted jurisdictions (US, EU, Japan, etc.)?
- What happens to user funds if the company fails? Is there segregation of client assets?
- Do you have a compliance officer? When were they hired (before or after launch)?

**AI / ML:**
- How do you handle data privacy (GDPR, CCPA, PIPL)? What data do you collect, store, process?
- Do you use user data to train models? With what consent mechanism?
- How do you address AI output liability? (e.g., if your AI gives bad financial/medical advice)
- Are you subject to the EU AI Act? What risk category is your product in?
- Do you have an AI ethics policy or responsible AI framework?
- How do you handle bias, hallucination, and content moderation?

**Healthcare / Biotech:**
- What FDA/EMA/NMPA classification does your product have? (510(k), PMA, De Novo, CE marking)
- IRB/ethics committee approval for clinical studies?
- HIPAA compliance status? BAA agreements with cloud providers?
- GMP certification for manufacturing? Which facilities?
- Clinical trial registration (ClinicalTrials.gov)?

**SaaS / Data:**
- SOC 2 Type I or Type II certification? Timeline if not yet?
- GDPR compliance — DPA agreements, data residency, right to deletion?
- Do you process PII? What's the encryption and access control posture?
- Cyber insurance coverage?

**Hardware:**
- FCC, CE, UL certifications? Which markets are certified?
- Product liability insurance?
- Environmental compliance (RoHS, WEEE, REACH)?
- Safety certifications for industry-specific applications?

**Marketplace / Consumer:**
- Content moderation policy and enforcement?
- Background checks for service providers (if applicable)?
- Consumer protection compliance (return policies, dispute resolution)?
- Privacy policy and terms of service — when last reviewed by counsel?

**Cross-domain (ALL companies at Series A+):**
- Corporate structure — are all entities properly incorporated? Where?
- IP assignment — have all founders and employees signed IP assignment agreements?
- Employment compliance — are workers properly classified (employee vs contractor)?
- Cap table hygiene — any unresolved equity disputes, missing option grants, or messy SAFEs?
- Litigation — any pending or threatened lawsuits?
- Tax compliance — are all filings current? Any nexus issues?
- Insurance — D&O, E&O, cyber, general liability?

**Applies to:** ALL — but severity varies dramatically. Fintech and Biotech are "compliance-first"
industries where missing a license can shut you down. SaaS and Consumer are "compliance-later"
but GDPR/CCPA violations carry real fines. AI is the emerging frontier where regulation is
evolving rapidly.

### 16. IP & Technology Ownership
**Surface question:** "Who owns the IP? Are there any encumbrances? Open-source dependencies?"
**Investor intent:** If the company gets acquired or goes public, does it actually own what it's
selling? Common landmines: (1) IP created during prior employment, (2) open-source licenses that
infect commercial code (GPL copyleft), (3) university or government grant IP claims, (4) no proper
assignment agreements from contractors.
**Universal probe:**
- Has every contributor (founders, employees, contractors) signed an IP assignment agreement?
- Are there any open-source components with copyleft licenses (GPL, AGPL)?
- Was any core IP developed at a previous employer, university, or under government funding?
- Patent status — filed, granted, pending? Any freedom-to-operate analysis done?
- Trade secret protection — NDAs, access controls, documentation?
**Applies to:** ALL — but especially AI (training data licensing, model weights ownership),
Biotech (patent portfolio is often the primary asset), Hardware (design patents, trade secrets).

---

## How to Use This in the Skill

### In `/before-fundraising`:
Probe whether the founder has thought about their data integrity, retention cohorts,
and failure modes BEFORE they talk to investors.

### In `/product-metrics`:
Add these "investor-will-ask-this" warnings alongside RED/YELLOW/GREEN grading.
E.g., if retention data is GREEN but the founder can't explain the cohort methodology,
flag it: "Your numbers look good, but investors will cross-check. Make sure you can
reconcile from multiple data sources."

### In `/pitch` debrief:
After the simulation, include a "DD Preview" section: "If [VC name] proceeds to due
diligence, expect these follow-up questions based on your pitch..." Generate 5-8
specific DD questions tied to the weak points in their pitch.

### In `/fundraising-stage`:
Include a "DD Preparation Checklist" in the execution plan — what data, documents,
and answers to prepare before investors start digging.

### In `/pitch-deck`:
Flag slides where investors will demand supporting DD data. E.g., the traction slide
needs to be backed by cohort data that investors will request.
