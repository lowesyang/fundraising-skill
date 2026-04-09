# Fintech Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade a fintech founder's numbers with RED/YELLOW/GREEN thresholds.

---

## Sub-domain Classification

Before evaluating metrics, ask which type of fintech company:

| Sub-domain | Description | Examples |
|-----------|-------------|---------|
| **Payments** | Processing, facilitation, or infrastructure for money movement | Stripe, Square, Adyen |
| **Lending** | Consumer or business lending, BNPL, credit | Affirm, Upstart, Brex |
| **Insurance** | Insurtech — distribution, underwriting, or claims | Lemonade, Root, Hippo |
| **Wealth Management** | Investment, trading, robo-advisory | Robinhood, Wealthfront, Betterment |
| **Crypto/Web3** | Exchanges, wallets, DeFi, infrastructure | Coinbase, Uniswap, Alchemy |
| **Banking-as-a-Service** | Infrastructure for embedded finance | Unit, Treasury Prime, Synapse |

---

### TPV / Loan Volume / AUM
**Applies to:** Payments (TPV), Lending (Loan Volume), Wealth Management (AUM), Crypto/Web3 (Trading Volume)
**What it is:** The total dollar value of transactions processed (TPV), loans originated (Loan Volume), or assets under management (AUM). This is the primary volume metric for fintech, analogous to GMV in marketplaces.
**Why investors care:** Volume is the top-of-funnel from which all revenue derives. It demonstrates market adoption, distribution strength, and the scale of financial activity flowing through the platform. Investors use volume growth to project revenue trajectories.
**How to calculate:** TPV = sum of all payment transactions processed in the period. Loan Volume = total principal originated in the period. AUM = market value of all assets managed at period end. For crypto, trading volume = total value of trades executed.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No live transactions | <$500K cumulative | >$500K cumulative |
| Seed | <$1M/month | $1M-$10M/month | >$10M/month |
| Series A | <$20M/month | $20M-$100M/month | >$100M/month |
| Series B | <$100M/month | $100M-$500M/month | >$500M/month |

**Domain nuance:** Volume benchmarks vary dramatically by sub-domain. Payments companies process high volume at low margins; lending companies process lower volume at higher margins. AUM-based businesses (wealth management) should show both net inflows and market appreciation. For crypto exchanges, distinguish between spot volume and derivatives volume — derivatives volume is typically 3-10x spot but carries different risk profiles.

---

### Revenue Per Transaction / Take Rate
**Applies to:** All sub-domains
**What it is:** The percentage of each transaction (or volume unit) captured as revenue. For payments, this is the processing fee. For lending, it includes origination fees and net interest margin. For wealth management, it is the management fee as a percentage of AUM.
**Why investors care:** Take rate determines how efficiently volume converts to revenue. A tiny improvement in take rate at scale creates enormous value. It also reveals pricing power and competitive positioning.
**How to calculate:** Net Revenue / Total Volume x 100. For lending: (Interest Income + Origination Fees - Cost of Funds) / Total Loan Volume. For wealth management: Annual Management Fee / AUM.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Unclear or untested pricing | Pricing validated with early users | Pricing validated + expansion path |
| Seed | Payments: <0.5%; Lending: <3%; WM: <0.3% | Payments: 0.5-1.5%; Lending: 3-6%; WM: 0.3-0.6% | Payments: >1.5%; Lending: >6%; WM: >0.6% |
| Series A | Payments: <0.8%; Lending: <4%; WM: <0.4% | Payments: 0.8-2.0%; Lending: 4-7%; WM: 0.4-0.8% | Payments: >2.0%; Lending: >7%; WM: >0.8% |
| Series B | Stable or growing take rate | Take rate stable with clear floor | Take rate expanding via value-added services |

**Domain nuance:** Payments is a race to the bottom on core processing — winners add value-added services (fraud detection, analytics, treasury) to expand take rate above commodity levels. Stripe's effective take rate is well above interchange + processing because of its platform fees. In lending, take rate must be evaluated against default risk — high yields mean nothing if losses consume them. Crypto exchange take rates are compressing rapidly due to competition.

---

### Net Revenue Retention
**Applies to:** All sub-domains (especially Payments, Banking-as-a-Service, Wealth Management)
**What it is:** Revenue retained from existing customers over 12 months, including expansion (more volume, new products) and contraction (churn, reduced volume).
**Why investors care:** In fintech, customers that process more volume over time are the strongest signal of product-market fit. Net retention above 100% means the business grows from its existing base alone, before any new customer acquisition.
**How to calculate:** (Revenue from cohort at month 12) / (Revenue from cohort at month 0) x 100. Include all revenue from existing customers — volume growth, new product adoption, and price changes.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <70% | 70-90% | >90% |
| Seed | <85% | 85-105% | >105% |
| Series A | <100% | 100-120% | >120% |
| Series B | <110% | 110-130% | >130% |

**Domain nuance:** Payments companies often show exceptional NRR (130%+) because customer transaction volumes grow naturally as their businesses scale. BaaS companies show similar dynamics — once embedded, customers expand usage steadily. Lending NRR is trickier to measure because loans are discrete events; track repeat borrowing rates and cross-sell instead. For wealth management, NRR is heavily influenced by market returns, so separate organic net inflows from market appreciation.

---

### Regulatory Status and Compliance Timeline
**Applies to:** All sub-domains (critical for Lending, Insurance, Banking-as-a-Service)
**What it is:** Current regulatory standing — licenses obtained, applications pending, compliance infrastructure in place, and timeline to full authorization.
**Why investors care:** Regulation is the existential risk in fintech. A company without the right licenses cannot operate, and regulatory setbacks can delay launches by years. Conversely, obtained licenses are a durable competitive moat.
**How to calculate:** Qualitative assessment: List all required licenses/registrations, status of each (obtained, applied, planned), and expected timeline. Include: money transmitter licenses, lending licenses, broker-dealer registration, insurance carrier/agency licenses, or relevant state/federal approvals.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No regulatory strategy; unclear licensing path | Regulatory path mapped; partner/sponsor bank identified | Key licenses obtained or operating under partner license |
| Seed | Regulatory gaps blocking go-to-market | Applications pending; operating in limited states/markets | Licensed in key markets; clear path to full coverage |
| Series A | Regulatory issues causing delays or restrictions | Most licenses obtained; 1-2 pending | Fully licensed in all target markets; compliance team in place |
| Series B | Any outstanding regulatory risk or enforcement action | Minor gaps in coverage; compliance scaling | Full regulatory coverage; clean track record; compliance as competitive advantage |

**Domain nuance:** Banking-as-a-Service and lending companies face the heaviest regulatory burden — state-by-state money transmitter licenses can take 12-24 months and cost $1M+. Insurance requires state-level licensing or an MGA structure. Payments companies can initially operate under a payment facilitator (PayFac) model to reduce licensing burden. Crypto regulatory status is evolving rapidly — being proactive with regulators (BitLicense, state registrations) is viewed favorably. Investors increasingly treat regulatory readiness as a hard gate — no license, no investment.

---

### CAC and Payback Period
**Applies to:** All sub-domains
**What it is:** Cost to acquire a customer (CAC) and the number of months required to recover that cost from the customer's gross margin contribution.
**Why investors care:** Fintech CAC is notoriously high because of trust barriers, compliance-related onboarding costs, and competition from incumbents. Payback period determines how much capital is needed to fund growth.
**How to calculate:** CAC = Total Sales, Marketing, & Onboarding Cost / New Customers Acquired. Payback = CAC / (Monthly Revenue per Customer x Gross Margin %). Include KYC/AML and compliance onboarding costs in CAC for fintech.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >$500 CAC with no payback data | $200-$500 CAC; payback estimated <24 months | <$200 CAC or organic/referral-driven |
| Seed | Payback >24 months | Payback 12-24 months | Payback <12 months |
| Series A | Payback >18 months; CAC rising | Payback 12-18 months; CAC stable | Payback <12 months; CAC declining |
| Series B | Payback >15 months | Payback 10-15 months | Payback <10 months |

**Domain nuance:** B2B fintech (payments infrastructure, BaaS) has high CAC ($1K-$10K+) but long customer lifetimes and strong retention, making 18-24 month payback acceptable at early stages. Consumer fintech (neobanks, trading apps) can achieve very low CAC through viral mechanics but may struggle with monetization. Lending CAC must be evaluated against loan size — $200 CAC on a $50K loan is excellent; $200 CAC on a $500 loan is unsustainable. Insurance CAC is among the highest in fintech — $300-$800 per policy is common, making retention critical.

---

### Default Rate / Loss Ratio
**Applies to:** Lending (Default Rate), Insurance (Loss Ratio)
**What it is:** For lending: percentage of loan principal that is written off as uncollectible. For insurance: ratio of claims paid to premiums earned (loss ratio).
**Why investors care:** This is the most critical risk metric for lending and insurance businesses. High default rates or loss ratios can wipe out all revenue and destroy the business. Investors scrutinize vintage-level performance to assess underwriting quality.
**How to calculate:** Default Rate = Total Principal Written Off / Total Principal Originated, measured by loan vintage (cohort). Loss Ratio = Claims Paid / Premiums Earned x 100. Report both gross and net (after recoveries/reinsurance).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No credit model or actuarial data | Backtested model with reasonable assumptions | Early live data showing controlled losses |
| Seed | Default >8% (consumer) or >5% (business); Loss ratio >80% | Default 5-8% (consumer) or 3-5% (business); Loss ratio 60-80% | Default <5% (consumer) or <3% (business); Loss ratio <60% |
| Series A | Default trending up or above underwriting targets | Default stable and within targets; Loss ratio 50-70% | Default declining vintage-over-vintage; Loss ratio <50% |
| Series B | Any vintage showing unexpected deterioration | Stable performance across multiple vintages; Loss ratio 40-60% | Consistent outperformance vs industry benchmarks across 8+ vintages |

**Domain nuance:** Consumer unsecured lending typically runs 5-10% annualized default rates; anything below 4% is exceptional. Business lending defaults are lower (2-5%) but recovery rates matter more due to larger loan sizes. For insurance, a combined ratio (loss ratio + expense ratio) below 100% means underwriting profitability — most insurtechs are not underwriting profitable at early stages, so focus on loss ratio trends. BNPL default rates (2-4%) are lower than traditional consumer lending because of smaller ticket sizes and shorter durations. Vintage analysis is essential — show investors performance by origination quarter with at least 6-12 months of seasoning.

---

### Gross Margin
**Applies to:** All sub-domains
**What it is:** Revenue minus cost of goods sold as a percentage of revenue. For fintech, COGS includes interchange fees, payment processing costs, cost of funds (lending), reinsurance costs (insurance), hosting, and compliance/regulatory costs directly tied to revenue delivery.
**Why investors care:** Gross margin determines the long-term business model viability and valuation multiple. Fintech gross margins vary enormously by sub-domain, so investors benchmark within category.
**How to calculate:** (Net Revenue - Direct Costs) / Net Revenue x 100. Direct costs include: interchange and network fees, cost of capital/funds, claims/losses, third-party data costs, required regulatory costs per transaction, and hosting/infrastructure.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <20% | 20-40% | >40% |
| Seed | Payments: <30%; Lending: <20%; Insurance: <15%; Software/BaaS: <50% | Payments: 30-50%; Lending: 20-40%; Insurance: 15-30%; Software/BaaS: 50-65% | Payments: >50%; Lending: >40%; Insurance: >30%; Software/BaaS: >65% |
| Series A | Payments: <40%; Lending: <30%; Insurance: <20%; Software/BaaS: <55% | Payments: 40-55%; Lending: 30-50%; Insurance: 20-35%; Software/BaaS: 55-70% | Payments: >55%; Lending: >50%; Insurance: >35%; Software/BaaS: >70% |
| Series B | Margins flat or declining | Margins stable with clear path to scale targets | Margins expanding; approaching category leaders |

**Domain nuance:** Pure-play payments processing has structurally lower gross margins (40-55%) because interchange and network fees are pass-through costs. The winning strategy is to layer software and value-added services on top of payments to push margins to 60%+. Lending gross margins depend entirely on cost of funds — companies that can access cheaper capital (warehouse facilities, securitization) dramatically improve margins over time. Insurance gross margins are the lowest in fintech at early stages, but technology-enabled underwriting can push loss ratios down and margins up. BaaS and fintech infrastructure companies (the "picks and shovels") can achieve SaaS-like margins of 70%+ because they sell software, not financial products directly.

---

### Customer Concentration
**Applies to:** All sub-domains (especially Payments, Banking-as-a-Service)
**What it is:** Percentage of revenue or volume derived from the top 1, 5, or 10 customers.
**Why investors care:** High customer concentration creates existential risk — losing one customer could collapse the business. It also signals weak distribution and limits valuation multiples. In fintech, where switching costs are high, concentration risk is somewhat mitigated but still penalized.
**How to calculate:** Revenue from top N customers / Total Revenue x 100. Report for top 1, top 5, and top 10 customers.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | 1 customer = 100% of revenue | 1 customer >50% but others in pipeline | 3+ paying customers, none >40% |
| Seed | Top customer >50% of revenue | Top customer 30-50%; top 5 >80% | Top customer <30%; top 5 <70% |
| Series A | Top customer >40% of revenue | Top customer 20-40%; top 10 >75% | Top customer <20%; top 10 <60% |
| Series B | Top customer >25% of revenue | Top customer 15-25%; top 10 >60% | Top customer <15%; top 10 <50% |

**Domain nuance:** BaaS companies are most susceptible to concentration risk — a single large neobank customer can represent 50%+ of volume. The Synapse-Evolve collapse illustrates the danger. Payments companies serving SMBs naturally diversify quickly. Lending platforms that originate their own loans have no customer concentration risk in the traditional sense, but may have capital provider concentration (one warehouse lender providing all funding). For B2B fintech, enterprise contracts with 2-3 year terms somewhat mitigate concentration risk, but investors still want to see a diversification roadmap.
