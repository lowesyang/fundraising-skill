# SaaS Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade a SaaS founder's numbers with RED/YELLOW/GREEN thresholds.

## Sub-domain Classification

Before evaluating, identify which type of SaaS:

| Sub-domain | Description | Examples | Metric Emphasis |
|-----------|-------------|---------|----------------|
| **B2B SaaS** | Selling to businesses, typically with sales team | Salesforce, Slack, Datadog | ARR, NDR, CAC payback, sales efficiency |
| **Vertical SaaS** | Deep in one industry | Veeva, Procore, Toast | Market penetration in vertical, switching cost |
| **PLG SaaS** | Product-led growth, self-serve onboarding | Figma, Notion, Canva | Free-to-paid conversion, viral coefficient, time-to-value |
| **API / Developer Tools** | Infrastructure sold to developers | Twilio, Stripe, Auth0 | API usage growth, developer adoption, revenue per call |

All metrics below apply to all SaaS sub-domains unless noted otherwise.

---

### ARR (Annual Recurring Revenue)
**What it is:** Total annualized value of all active recurring subscriptions. ARR = MRR x 12.
**Why investors care:** ARR is the single most important top-line metric for SaaS. It demonstrates product-market fit, validates pricing, and anchors valuation multiples.
**How to calculate:** Sum of all active subscription values normalized to an annual basis. Exclude one-time fees, professional services, and usage overages unless contractually recurring.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <$0 (pre-revenue with no LOIs) | $0-$100K or strong LOIs | >$100K |
| Seed | <$200K | $200K-$1M | >$1M |
| Series A | <$1M | $1M-$3M | >$3M |
| Series B | <$5M | $5M-$15M | >$15M |

**Domain nuance:** Enterprise SaaS with longer sales cycles may have lower ARR at seed but higher ACV. Investors discount ARR that is overly concentrated in one or two customers.

---

### MRR Growth Rate (Month-over-Month)
**What it is:** Percentage increase in Monthly Recurring Revenue from one month to the next.
**Why investors care:** Growth rate reveals momentum. Consistent MoM growth at early stages is a stronger signal than absolute ARR.
**How to calculate:** (MRR this month - MRR last month) / MRR last month x 100. Report on a trailing 3-month average to smooth seasonality.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <5% MoM | 5-15% MoM | >15% MoM |
| Seed | <8% MoM | 8-15% MoM | >15% MoM |
| Series A | <5% MoM | 5-10% MoM | >10% MoM |
| Series B | <3% MoM | 3-7% MoM | >7% MoM |

**Domain nuance:** Growth rates naturally decelerate as the base grows. A Series B company growing 7% MoM is tripling annually, which is exceptional. PLG companies often show faster early growth than sales-led.

---

### Net Dollar Retention (NDR)
**What it is:** Revenue retained from existing customers after accounting for expansion, contraction, and churn over a 12-month period.
**Why investors care:** NDR above 100% means the company grows even without acquiring new customers. It is the strongest indicator of product stickiness and expansion potential.
**How to calculate:** (Starting MRR + Expansion - Contraction - Churned MRR) / Starting MRR x 100, measured on a cohort over 12 months.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <80% | 80-100% | >100% |
| Seed | <90% | 90-110% | >110% |
| Series A | <100% | 100-120% | >120% |
| Series B | <105% | 105-130% | >130% |

**Domain nuance:** Best-in-class public SaaS companies (Snowflake, Datadog) have sustained NDR above 150%. SMB-focused SaaS typically has lower NDR (100-110%) vs enterprise (120%+). Seat-based models expand differently than usage-based.

---

### Gross Churn (Monthly)
**What it is:** Percentage of MRR lost from cancellations and downgrades in a given month, excluding expansion revenue.
**Why investors care:** High churn is a leaky bucket. Even fast-growing companies cannot sustain hypergrowth if churn is excessive. It also signals poor product-market fit or targeting the wrong segment.
**How to calculate:** (Churned MRR + Contraction MRR) / Starting MRR x 100 for the month.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >8% monthly | 4-8% monthly | <4% monthly |
| Seed | >5% monthly | 3-5% monthly | <3% monthly |
| Series A | >3% monthly | 2-3% monthly | <2% monthly |
| Series B | >2% monthly | 1-2% monthly | <1% monthly |

**Domain nuance:** SMB churn runs structurally higher (3-5% monthly) because small businesses fail at higher rates. Enterprise churn below 0.5% monthly is world-class. Logo churn vs revenue churn can tell different stories — always present both.

---

### LTV/CAC Ratio
**What it is:** Ratio of the lifetime value of a customer to the cost of acquiring that customer.
**Why investors care:** Indicates unit economics health. A high ratio means each dollar spent on acquisition generates outsized long-term returns.
**How to calculate:** LTV = ARPU x Gross Margin / Monthly Churn Rate. CAC = Total Sales & Marketing Spend / New Customers Acquired. Ratio = LTV / CAC.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <1x | 1-2x | >2x |
| Seed | <2x | 2-3x | >3x |
| Series A | <3x | 3-4x | >4x |
| Series B | <3x | 3-5x | >5x |

**Domain nuance:** The "3x rule" is a common heuristic but context matters. PLG companies often show very high LTV/CAC (>10x) because CAC is near zero for organic users. Blended vs paid-only CAC can dramatically change this ratio.

---

### CAC Payback Period
**What it is:** Number of months required to recover the cost of acquiring a customer from that customer's gross margin contribution.
**Why investors care:** Shorter payback means faster capital recycling. Long payback periods require more fundraising to fund growth.
**How to calculate:** CAC / (Monthly ARPU x Gross Margin %).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >24 months | 12-24 months | <12 months |
| Seed | >18 months | 12-18 months | <12 months |
| Series A | >18 months | 12-18 months | <12 months |
| Series B | >15 months | 10-15 months | <10 months |

**Domain nuance:** Enterprise SaaS with annual prepaid contracts effectively has zero payback if ACV exceeds CAC. Usage-based models may show longer payback initially but accelerate as customers ramp usage.

---

### Gross Margin
**What it is:** Revenue minus cost of goods sold (COGS) as a percentage of revenue. For SaaS, COGS includes hosting, third-party data, customer support, and DevOps costs directly tied to delivering the product.
**Why investors care:** Gross margin determines how much of each revenue dollar is available to fund growth, R&D, and eventually profit. It also underpins valuation multiples.
**How to calculate:** (Revenue - COGS) / Revenue x 100.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <50% | 50-65% | >65% |
| Seed | <60% | 60-70% | >70% |
| Series A | <65% | 65-75% | >75% |
| Series B | <70% | 70-80% | >80% |

**Domain nuance:** Pure software SaaS should target 80%+ at scale. AI/ML-heavy SaaS has structurally lower margins (60-75%) due to compute costs — investors accept this if margins trend upward. Managed services or hybrid models run 50-65%.

---

### Magic Number
**What it is:** Measures sales efficiency by comparing incremental ARR to sales and marketing spend in the prior quarter.
**Why investors care:** It reveals whether pouring more money into sales actually produces proportional returns. A magic number above 1.0 suggests the company should invest more aggressively in go-to-market.
**How to calculate:** (Current Quarter ARR - Previous Quarter ARR) / Previous Quarter Sales & Marketing Spend.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <0.3 | 0.3-0.5 | >0.5 |
| Seed | <0.4 | 0.4-0.7 | >0.7 |
| Series A | <0.5 | 0.5-0.8 | >0.8 |
| Series B | <0.6 | 0.6-1.0 | >1.0 |

**Domain nuance:** PLG companies often have magic numbers above 1.5 because organic growth inflates the numerator. Sales-led enterprise models typically run 0.5-0.8. A magic number below 0.5 at Series A is a serious concern.

---

### Burn Multiple
**What it is:** Ratio of net cash burned to net new ARR added in a given period. Measures how efficiently a company converts cash into recurring revenue growth.
**Why investors care:** Burn multiple is the definitive capital efficiency metric. It answers: "How many dollars do you burn to generate one dollar of new ARR?" Lower is better.
**How to calculate:** Net Burn / Net New ARR for the period (typically quarterly or trailing 12 months).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >5x | 3-5x | <3x |
| Seed | >3x | 2-3x | <2x |
| Series A | >2.5x | 1.5-2.5x | <1.5x |
| Series B | >2x | 1-2x | <1x |

**Domain nuance:** David Sacks popularized the burn multiple framework. In frothy markets, investors tolerated 3-4x; in tighter markets, anything above 2x raises red flags. Companies with negative burn (profitable growth) are increasingly favored at Series B+.
