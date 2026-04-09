# Marketplace Metrics — Stage-Specific Benchmarks

> Used by the `/metrics` command to grade a marketplace founder's numbers with RED/YELLOW/GREEN thresholds.

---

## Sub-domain Classification

Before evaluating metrics, ask which type of marketplace:

| Sub-domain | Description | Examples |
|-----------|-------------|---------|
| **B2C Marketplace** | Consumer buying from businesses/individuals | Airbnb, Etsy, StockX |
| **B2B Marketplace** | Businesses buying from businesses | Faire, Alibaba, Flexport |
| **Services Marketplace** | Connecting service providers with customers | Upwork, Thumbtack, DoorDash |
| **Vertical Marketplace** | Deep in one industry | Veeva (pharma), Procore (construction) |

---

### GMV (Gross Merchandise Volume)
**Applies to:** All sub-domains
**What it is:** Total dollar value of goods or services transacted through the marketplace in a given period. GMV is the primary top-line volume metric for any marketplace.
**Why investors care:** GMV demonstrates the scale of economic activity the marketplace enables. It is the base from which take rate generates revenue. GMV growth rate is the most watched metric at early stages — it signals whether the marketplace is achieving escape velocity.
**How to calculate:** Sum of all completed transactions (not listed, not initiated — completed and settled). Exclude cancelled orders, refunds, and chargebacks. Report monthly or quarterly GMV and trailing 12-month GMV for trend analysis.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No transactions or <$10K cumulative | $10K-$100K cumulative GMV | >$100K cumulative GMV |
| Seed | <$100K/month | $100K-$500K/month | >$500K/month |
| Series A | <$1M/month | $1M-$5M/month | >$5M/month |
| Series B | <$5M/month | $5M-$20M/month | >$20M/month |

**Domain nuance:** B2B marketplaces typically have higher GMV but lower take rates than B2C. Services marketplaces may show lower GMV because transactions are smaller and more frequent — compensated by higher take rates (15-30%). Vertical marketplaces in industries like construction or pharma can have very large transaction sizes, so fewer transactions are needed to hit GMV targets. Always pair GMV with take rate — $50M GMV at 1% take rate is a $500K revenue business, while $5M GMV at 20% is a $1M revenue business.

---

### Take Rate
**Applies to:** All sub-domains
**What it is:** Percentage of GMV captured as net revenue by the marketplace. This is the marketplace's "toll" on transactions.
**Why investors care:** Take rate directly determines revenue and reflects the value the marketplace provides to both sides. A high take rate signals strong value-add and defensibility. A rising take rate over time shows the marketplace is becoming indispensable.
**How to calculate:** Net Revenue / GMV x 100. Include all revenue sources: transaction fees, listing fees, promoted listings, fulfillment fees, and SaaS subscriptions charged to marketplace participants. Report blended take rate and break out by revenue stream.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No monetization or take rate untested | Take rate defined and tested with early users | Take rate validated; no pushback from participants |
| Seed | B2C: <5%; B2B: <1%; Services: <10% | B2C: 5-12%; B2B: 1-5%; Services: 10-20% | B2C: >12%; B2B: >5%; Services: >20% |
| Series A | B2C: <8%; B2B: <2%; Services: <12% | B2C: 8-15%; B2B: 2-7%; Services: 12-25% | B2C: >15%; B2B: >7%; Services: >25% |
| Series B | Take rate declining due to competitive pressure | Take rate stable | Take rate expanding via value-added services |

**Domain nuance:** Services marketplaces command the highest take rates (20-30%+) because they provide matching, trust, payments, and often fulfillment logistics. Airbnb takes 14-17% combined from hosts and guests. Etsy takes ~8% transaction fee plus payment processing. B2B marketplaces start with very low take rates (1-3%) to overcome supplier resistance but expand through financing, logistics, and SaaS tools. The best marketplaces grow take rate over time by adding services — Shopify and DoorDash are prime examples. If take rate is declining, it usually signals commoditization or competitive pressure, which is a serious red flag.

---

### Supply/Demand Ratio and Liquidity Score
**Applies to:** All sub-domains
**What it is:** The ratio of active supply (sellers, providers, listings) to active demand (buyers, customers, searches), and the percentage of listings or searches that result in a completed transaction. Liquidity is the marketplace's heartbeat.
**Why investors care:** Liquidity is the single most important structural metric for a marketplace. A marketplace without liquidity is just a listing page. High liquidity means buyers find what they want quickly and sellers convert reliably — this drives retention and organic growth through word-of-mouth.
**How to calculate:** Supply/Demand Ratio = Active Sellers / Active Buyers (or Listings / Searches). Liquidity Score = Completed Transactions / Total Listings (or Searches) x 100 over a defined period. Define "active" clearly — typically engaged in the last 30 days.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Severe imbalance (>10:1 either direction); <5% liquidity | Moderate imbalance (3-10:1); 5-15% liquidity | Balanced ratio (1:1 to 3:1); >15% liquidity |
| Seed | <10% of listings/searches convert | 10-25% of listings/searches convert | >25% of listings/searches convert |
| Series A | Liquidity stagnating or declining in core markets | Liquidity improving; expanding to new markets | >30% liquidity in core markets; replicable in new markets |
| Series B | Liquidity inconsistent across markets | Consistent liquidity across most active markets | >40% liquidity across all active markets |

**Domain nuance:** Supply-constrained marketplaces (Airbnb in hot markets, DoorDash in new cities) should focus on supply-side liquidity — how quickly a new listing gets its first booking. Demand-constrained marketplaces (B2B, niche verticals) should focus on buyer conversion rates. Services marketplaces often measure "match rate" — percentage of requests that get matched with a provider within a target timeframe (e.g., 1 hour for on-demand, 24 hours for project-based). The ideal supply/demand ratio is category-specific: Uber targets ~2-3 drivers per rider in a zone; Etsy works fine with thousands of sellers per buyer because search handles discovery.

---

### Repeat Purchase Rate
**Applies to:** All sub-domains
**What it is:** Percentage of buyers who make a second (and subsequent) purchase within a defined period, typically 6 or 12 months.
**Why investors care:** Repeat purchases are the clearest evidence that a marketplace delivers value beyond a single transaction. High repeat rates reduce reliance on new customer acquisition and dramatically improve unit economics. A marketplace with low repeat rate is essentially a lead-gen business.
**How to calculate:** Cohort analysis: Of all buyers who made their first purchase in month X, what percentage made a second purchase within 6/12 months? Report month-1, month-3, month-6, and month-12 repeat rates. Also report purchase frequency (average transactions per active buyer per month).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <10% 6-month repeat | 10-20% 6-month repeat | >20% 6-month repeat |
| Seed | <15% 6-month repeat | 15-30% 6-month repeat | >30% 6-month repeat |
| Series A | <25% 12-month repeat | 25-40% 12-month repeat | >40% 12-month repeat |
| Series B | <35% 12-month repeat | 35-50% 12-month repeat | >50% 12-month repeat |

**Domain nuance:** Repeat rate expectations vary enormously by category. High-frequency marketplaces (food delivery, ride-sharing) should see 60-80%+ monthly repeat rates. Low-frequency marketplaces (home services, real estate) may only see 10-20% annual repeat — in these cases, investors look at referral rates and NPS as proxy indicators of satisfaction. B2B marketplaces should show very high repeat rates (70%+) because business purchasing is habitual. For vertical marketplaces, benchmark against the natural purchase frequency of the category. Etsy sees ~40% buyer repeat within 12 months; Airbnb sees ~50% of guests rebook within a year.

---

### Geographic Density / Market Concentration
**Applies to:** All sub-domains (especially Services Marketplace, B2C Marketplace)
**What it is:** The depth of supply and demand within each active geographic market, and the degree to which the business is concentrated in a few markets vs. broadly distributed.
**Why investors care:** Marketplaces win locally before they win nationally. Proving density in a single market demonstrates the model works — scaling to new markets is an execution problem, not a concept risk. However, over-concentration in one geography is a risk at later stages.
**How to calculate:** For each active market: active supply per square mile (or per 10K population), demand density, and the percentage of total GMV from top 1/3/5 markets. Track market-level unit economics separately.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Spread thin across many markets; no density anywhere | Focused on 1-2 markets with early traction | Strong density in 1 market with clear liquidity |
| Seed | Top market has low density; spreading too fast | 1-3 dense markets; >80% GMV concentrated (acceptable) | 2-3 highly dense markets with strong unit economics |
| Series A | Core markets losing density; new markets not reaching liquidity | 5-10 markets with density; top 3 markets <70% of GMV | 10+ markets with proven density; replicable launch playbook |
| Series B | Expansion markets consistently underperforming | Most markets reaching target density within 6 months | Consistent density across 20+ markets; organic expansion pull |

**Domain nuance:** Services marketplaces (DoorDash, Uber, Thumbtack) are hyper-local — density within a 15-minute drive radius is what matters. B2C product marketplaces (Etsy, StockX) are less geographically sensitive because shipping enables national liquidity. B2B marketplaces may be concentrated by industry region (e.g., agriculture in the Midwest) rather than metro area. Vertical marketplaces often have natural geographic concentrations tied to where the industry operates. The classic mistake is expanding to too many cities too fast and achieving liquidity in none — investors prefer depth over breadth at seed and Series A.

---

### Unit Economics Per Transaction
**Applies to:** All sub-domains
**What it is:** The fully loaded profit or loss on each individual transaction, accounting for all variable costs: payment processing, fraud, customer support, fulfillment, and any supply-side incentives or demand-side promotions.
**Why investors care:** Positive unit economics per transaction proves the business model works at the atomic level. Negative unit economics means the company loses money on every transaction and growth makes the problem worse. This is the "does it make a dollar" test.
**How to calculate:** Revenue per transaction (take rate x AOV) minus variable costs per transaction (payment processing, fraud/chargebacks, customer support allocation, fulfillment/shipping costs, supply-side incentives, demand-side promotions). Express as dollar contribution and as a percentage of GMV.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Negative contribution; subsidizing both sides | Negative but with clear path to positive (identified cost levers) | Positive contribution per transaction, even if small |
| Seed | Contribution margin <-10% of revenue | Contribution margin -10% to +10% of revenue | Contribution margin >10% of revenue |
| Series A | Negative or flat unit economics; no improvement trend | Contribution margin 10-25% of revenue; improving quarterly | Contribution margin >25% of revenue |
| Series B | Contribution margin <20% of revenue | Contribution margin 20-35% of revenue | Contribution margin >35% of revenue |

**Domain nuance:** Services marketplaces with managed fulfillment (DoorDash, Instacart) have the most complex unit economics — delivery costs, driver incentives, and subsidies can make transactions deeply negative. Investors accept negative unit economics at pre-seed/seed ONLY if the company can articulate which cost levers improve with scale (route density, order batching, reduced incentives). Asset-light marketplaces (Etsy, Airbnb) should be unit-economics positive almost immediately because they do not handle fulfillment. B2B marketplaces may run negative on early transactions to demonstrate value but should show clear paths to margin through financing or logistics services.

---

### Supply Acquisition Cost vs Demand Acquisition Cost
**Applies to:** All sub-domains
**What it is:** The cost to acquire each new supplier/seller (SAC) and each new buyer/customer (DAC) to the marketplace, tracked and optimized independently.
**Why investors care:** The chicken-and-egg problem is the defining challenge of marketplaces. Understanding which side is harder and more expensive to acquire shapes go-to-market strategy and capital allocation. The best marketplaces solve one side cheaply and invest in the other.
**How to calculate:** SAC = Total supply-side acquisition spend / New suppliers acquired. DAC = Total demand-side acquisition spend / New buyers acquired. Include all channels: paid marketing, sales team costs, referral incentives, onboarding costs, and supply-side subsidies. Track organic vs paid acquisition separately.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Both sides require heavy paid acquisition | One side acquired cheaply; other side expensive but manageable | One side is organic/viral; other side has efficient paid channel |
| Seed | SAC + DAC combined >60% of first-year revenue per match | SAC + DAC combined 30-60% of first-year revenue | SAC + DAC combined <30% of first-year revenue |
| Series A | Acquisition costs rising on both sides | One side trending toward organic; other stable | >50% of new supply or demand is organic; paid channels efficient |
| Series B | Paid acquisition >50% of new supply AND demand | Organic >50% on one side; paid efficient on other | >60% organic on at least one side; both sides with declining CAC |

**Domain nuance:** Most successful marketplaces solve the supply side first — build a supply base, and demand follows. Airbnb focuses on host acquisition; Uber on driver acquisition; Faire on brand acquisition. The organic tipping point is the moment when supply or demand starts growing without paid spend (through word-of-mouth, SEO, or network effects). B2B marketplaces typically have higher SAC ($500-$5,000) because onboarding suppliers requires integration work and sales effort. Consumer marketplaces can achieve very low DAC through viral mechanics and SEO. Track the ratio of SAC to DAC — if both are high, the marketplace has a structural problem.

---

### Time-to-First-Transaction (for New Users)
**Applies to:** All sub-domains
**What it is:** The elapsed time from a new user's sign-up (buyer or seller) to their first completed transaction on the marketplace. Measured separately for supply side and demand side.
**Why investors care:** Time-to-first-transaction is the marketplace equivalent of "time to value." Users who transact quickly have dramatically higher retention and lifetime value. A long time-to-first-transaction signals friction in the onboarding experience, poor liquidity, or a mismatch between supply and demand. It is the leading indicator of marketplace health.
**How to calculate:** Median time (in hours or days) from account creation to first completed transaction. Report separately for buyers and sellers. Also report the percentage of new users who complete their first transaction within 7 days and 30 days (activation rate).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Buyers: >30 days; Sellers: >14 days to first transaction | Buyers: 7-30 days; Sellers: 7-14 days | Buyers: <7 days; Sellers: <7 days |
| Seed | <20% of new users transact within 30 days | 20-40% of new users transact within 30 days | >40% of new users transact within 30 days |
| Series A | Median time-to-first-transaction increasing | Median <7 days (buyers); <14 days (sellers) | Median <3 days (buyers); <7 days (sellers); >50% 30-day activation |
| Series B | Activation rate <40% at 30 days | Activation rate 40-60% at 30 days | Activation rate >60% at 30 days; median <48 hours for buyers |

**Domain nuance:** On-demand services marketplaces (Uber, DoorDash) should see first transactions within hours, not days — the experience is designed for immediate gratification. Traditional marketplaces (Etsy, Faire) have longer natural cycles because buyers browse before purchasing. B2B marketplaces typically have the longest time-to-first-transaction (weeks to months) because business purchasing involves procurement processes, approvals, and integration setup — in these cases, track "time to first PO" and benchmark against the category's typical purchasing cycle. For supply-side activation, the critical metric is "time to first sale" — sellers who do not sell within 30 days rarely become active participants. Reducing time-to-first-transaction is the highest-leverage growth lever at early stages.
