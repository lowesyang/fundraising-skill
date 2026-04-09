# Hardware Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade a hardware founder's numbers with RED/YELLOW/GREEN thresholds.

## Sub-domain Classification

Before evaluating metrics, first ask the founder which type of hardware company they are building.
The metrics that matter vary significantly by sub-domain:

| Sub-domain | Description | Examples |
|-----------|-------------|---------|
| **Consumer Electronics** | Direct-to-consumer hardware products | Apple, Sonos, Oura Ring |
| **Industrial/IoT** | Sensors, devices, systems for enterprise/industrial | Samsara, Uptake, Particle |
| **Semiconductors** | Chip design, EDA tools, semiconductor IP | NVIDIA, Qualcomm, Cerebras |
| **Cleantech/Energy** | Renewable energy, batteries, climate hardware | Tesla Energy, Enphase, Form Energy |

### Metrics by Sub-domain

**Consumer Electronics** — focus on:
- BOM cost and gross margin trajectory (critical — consumer margins are thin)
- Units shipped / deployed
- Reorder rate / replacement cycle
- Warranty/return rate (directly impacts margins and brand)
- Channel mix (DTC vs retail vs B2B)
- Hardware attach rate (if hardware+software model)
- SKIP: Manufacturing yield rate is less investor-facing at early stages
- ADD: NPS/customer satisfaction, average selling price (ASP) trends

**Industrial/IoT** — focus on:
- Units deployed (fleet size matters)
- Hardware attach rate (software recurring revenue is the valuation driver)
- Manufacturing yield rate
- Warranty/return rate (enterprise SLAs demand low failure rates)
- BOM cost and gross margin trajectory
- SKIP: Reorder rate (devices are long-lived); Channel mix is simpler (direct sales)
- ADD: Annual contract value (ACV) of software layer, device uptime/reliability

**Semiconductors** — focus on:
- Design-to-ship timeline (tape-out cycles are long and expensive)
- Manufacturing yield rate (defines economic viability)
- BOM cost and gross margin trajectory (wafer economics)
- SKIP: Reorder rate, channel mix, warranty/return rate (different business model)
- ADD: Design win pipeline, NRE (non-recurring engineering) recovery, IP licensing revenue

**Cleantech/Energy** — focus on:
- BOM cost and gross margin trajectory (cost curve is everything)
- Units shipped / deployed (MW deployed, units installed)
- Manufacturing yield rate
- Design-to-ship timeline
- Warranty/return rate (20-25 year product lifetimes demand reliability)
- SKIP: Reorder rate (long replacement cycles); Hardware attach rate (less applicable)
- ADD: Levelized cost of energy (LCOE), degradation rate, permitting/interconnection timeline

---

### BOM Cost and Gross Margin Trajectory

> **Applies to: All sub-domains.** This is the single most scrutinized metric for any hardware company. Investors need to see a credible path from prototype economics to scale economics.

**What it is:** Bill of Materials (BOM) cost is the sum of all component and raw material costs to build one unit. Gross margin is revenue minus COGS (BOM + manufacturing labor + freight + packaging) as a percentage of revenue. "Trajectory" means the trend across production runs — investors want to see margins improving as volume scales.

**Why investors care:** Hardware companies live or die on gross margin. Unlike software, hardware has real marginal costs. Investors need confidence that current negative or thin margins will improve to sustainable levels through volume purchasing, design-for-manufacturing iterations, and supply chain optimization. A company with great demand but structurally negative margins is not a venture-backable business.

**How to calculate:** BOM cost = sum of all component costs per unit at current production volume. Gross margin = (ASP - fully loaded COGS) / ASP x 100. Present both current margins and projected margins at 10x and 100x current volume, with specific cost reduction drivers identified.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Negative gross margin with no credible path to positive | Negative margin but clear BOM reduction plan with identified levers | Positive gross margin even at prototype volumes (>20%) |
| Seed | Gross margin <0% at current volume | 0-25% gross margin, improving with each production run | >25% gross margin with line of sight to 40%+ |
| Series A | <20% gross margin at current volume | 20-35% gross margin with demonstrated cost-down from prior runs | >35% gross margin, approaching target at scale |
| Series B | <30% gross margin | 30-45% gross margin | >45% gross margin with continued improvement trend |

**Domain nuance:** Consumer electronics typically target 40-50% gross margin at scale (Apple is 36-38% on hardware alone but subsidized by services). Industrial/IoT targets 50-65% because software recurring revenue is layered on top. Semiconductors can achieve 60-80% gross margins at scale due to IP leverage. Cleantech/Energy margins vary wildly — solar panels are commodity (15-25%) while battery storage systems can reach 30-40%. Always ask whether quoted margins include warranty reserves, freight, and packaging — many founders understate true COGS.

---

### Units Shipped / Deployed

> **Applies to: All sub-domains.** For Semiconductors, reframe as "chips shipped" or "design wins converting to volume." For Cleantech/Energy, reframe as "MW deployed" or "systems installed."

**What it is:** Cumulative and periodic count of finished products delivered to customers and actively in use. "Shipped" means delivered; "deployed" means installed and operational, which matters more for IoT and industrial products.

**Why investors care:** Units are the hardware equivalent of user count. They demonstrate real demand (not just pre-orders), manufacturing capability (you can actually build at volume), and the installed base that drives recurring revenue, data network effects, and replacement cycles. Hardware investors have been burned by companies that can build prototypes but cannot scale production.

**How to calculate:** Cumulative units shipped to date, plus monthly or quarterly run rate. For IoT/industrial, also report "active deployed units" (shipped minus returned/decommissioned). Include backlog (orders received but not yet shipped) as a leading indicator.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No functional prototypes delivered to users | 10-50 beta units with users, collecting feedback | >50 beta units deployed with usage data and testimonials |
| Seed | <100 units shipped | 100-1,000 units shipped | >1,000 units shipped with growing order backlog |
| Series A | <1,000 units shipped | 1,000-10,000 units shipped | >10,000 units shipped with repeatable manufacturing |
| Series B | <10,000 cumulative | 10,000-50,000 cumulative with strong quarterly growth | >50,000 cumulative, production scaling predictably |

**Domain nuance:** Consumer electronics requires much higher unit volumes than industrial/IoT to prove demand. An industrial IoT company with 500 deployed sensors across 10 enterprise accounts is compelling; a consumer electronics company with 500 units is still in beta. Semiconductor companies measure design wins (committed future volume) more than current units shipped — one Tier 1 OEM design win can represent millions of future units. Cleantech/Energy may measure in MW deployed or number of installations rather than discrete units.

---

### Reorder Rate / Replacement Cycle

> **Applies to: Consumer Electronics, Industrial/IoT.** Less relevant for Semiconductors (different purchasing model) and Cleantech/Energy (very long product lifetimes).

**What it is:** The percentage of existing customers who purchase additional units or replacement products within a defined timeframe. For consumable-adjacent hardware (e.g., filters, cartridges, accessories), this includes consumable reorder rates. Replacement cycle is the average time between a customer's initial purchase and their next purchase.

**Why investors care:** Reorder rate transforms hardware from a one-time transaction into a repeatable revenue stream. High reorder rates signal product satisfaction, consumable lock-in, or expanding deployment within an account. For enterprise/IoT, it shows "land and expand" working — customers deploying more sensors, devices, or systems after an initial pilot.

**How to calculate:** Reorder rate = customers who made a repeat purchase in the last 12 months / total customers who made their first purchase 12+ months ago x 100. For consumables: consumable reorder rate = customers reordering consumables on schedule / total customers eligible to reorder x 100. Replacement cycle = median months between first and second purchase.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No repeat purchase data (too early) | Early signal: beta users requesting additional units | Beta users proactively reordering or expanding deployment |
| Seed | <10% annual reorder rate | 10-25% annual reorder rate | >25% annual reorder rate or >50% consumable reorder |
| Series A | <15% annual reorder rate | 15-30% annual reorder rate | >30% annual reorder or >70% consumable reorder |
| Series B | <20% annual reorder rate | 20-40% annual reorder rate | >40% annual reorder rate, replacement cycle shortening |

**Domain nuance:** Consumer electronics reorder depends heavily on product category — wearables (Oura Ring) have 2-3 year replacement cycles, while accessories and consumables can be quarterly. Industrial/IoT "reorder" is really expansion — an enterprise customer going from a 50-sensor pilot to a 500-sensor rollout. This metric is extremely strong for IoT because it demonstrates value proven in production. Consumable-attached hardware (razors-and-blades models) should show >80% consumable reorder rates.

---

### Warranty / Return Rate

> **Applies to: All sub-domains.** Critical for Consumer Electronics and Cleantech/Energy (long warranty periods). Important for Industrial/IoT (enterprise SLAs). Less investor-facing for Semiconductors but still matters for quality metrics.

**What it is:** The percentage of units that are returned by customers (return rate) or require warranty service (warranty claim rate) within the warranty period. This includes DOA (dead-on-arrival) rates, field failure rates, and customer-initiated returns for any reason.

**Why investors care:** High return/warranty rates destroy unit economics — each return costs shipping, refurbishment, customer support, and replacement product. They also signal quality control problems that worsen at scale. For consumer products, return rates directly impact retail channel relationships (Amazon, Best Buy penalize high-return products). For investors, this metric reveals whether the company can manufacture reliably, not just design well.

**How to calculate:** Return rate = units returned / units shipped x 100, within the return window (typically 30 days for consumer). Warranty claim rate = warranty claims filed / units within warranty period x 100, annualized. Also track DOA rate = units dead on arrival / units shipped x 100 — this specifically measures manufacturing quality.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >15% return rate on beta units | 8-15% return rate | <8% return rate on initial production |
| Seed | >10% return rate or >5% warranty claim rate | 5-10% return rate, 2-5% warranty claims | <5% return rate, <2% annual warranty claims |
| Series A | >8% return rate or >3% warranty claims | 4-8% return rate, 1-3% warranty claims | <4% return rate, <1% annual warranty claims |
| Series B | >5% return rate | 3-5% return rate, <2% warranty claims | <3% return rate, <1% warranty claims, DOA <0.5% |

**Domain nuance:** Consumer electronics benchmarks against Amazon category averages — consumer electronics returns average 8-10% (higher for complex setup products). Anything above 15% triggers Amazon listing suppression. Industrial/IoT has lower tolerance — enterprise customers expect <1% field failure rates and will cite warranty claims during renewal negotiations. Cleantech/Energy products carry 10-25 year warranties, so investors scrutinize annual degradation rates and long-term reliability testing data extensively. Semiconductor companies track defect rates in parts per million (PPM) — Tier 1 automotive customers demand <1 PPM.

---

### Channel Mix (DTC vs Retail vs B2B)

> **Applies to: Consumer Electronics (critical), Industrial/IoT (moderate — mostly direct), Cleantech/Energy (moderate — channel vs direct installer).** Less relevant for Semiconductors.

**What it is:** The percentage breakdown of revenue by sales channel: direct-to-consumer (own website, own stores), retail (Amazon, Best Buy, specialty retailers), B2B/wholesale (bulk sales, enterprise procurement), and distributor/channel partner sales. Also track the margin profile of each channel.

**Why investors care:** Channel mix determines margin structure, customer relationship ownership, and scalability. DTC has the highest margins but requires marketing spend. Retail provides volume but erodes margins (40-60% to retailers/distributors) and puts the customer relationship behind a wall. B2B provides predictability. The ideal mix depends on the product, but investors want to see a deliberate channel strategy, not accidental distribution.

**How to calculate:** Revenue by channel / total revenue x 100 for each channel. Also present gross margin by channel to show profitability differences. Include customer acquisition cost by channel.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No channel strategy; relying on a single unproven channel | DTC-only but with clear plan for channel expansion | DTC-first with early retail or B2B conversations underway |
| Seed | Over-reliant on one channel (>90%) with no diversification plan | 70-90% one channel, testing a second channel | Healthy primary channel (60-70%) plus growing secondary channel |
| Series A | Single channel dependency with margin pressure | 2 channels active, primary channel margins >40% | 2-3 channels active, blended margin >45%, no channel >70% of revenue |
| Series B | Retail dependency with eroding margins | Balanced mix but DTC <30% of revenue | DTC >30%, retail growing, B2B/enterprise emerging, blended margin >40% |

**Domain nuance:** Consumer electronics companies should lead with DTC to build brand and collect customer data, then expand to retail for volume. DTC margins are typically 60-70%; Amazon/retail margins drop to 30-40% after fees and co-op. Successful consumer hardware companies (Oura, Sonos) maintained DTC >40% even at scale. Industrial/IoT is almost entirely direct sales — the question is whether they sell direct or through system integrators/VARs. Cleantech/Energy often relies on installer networks and distributors — direct-to-homeowner (DTC) is emerging but complex.

---

### Manufacturing Yield Rate

> **Applies to: Semiconductors (most critical), Cleantech/Energy (important for cost curve), Industrial/IoT (important for reliability).** Less investor-facing for Consumer Electronics at early stages but becomes important at scale.

**What it is:** The percentage of manufactured units that pass quality control and are shippable, without requiring rework or scrap. For semiconductors, this is specifically die yield (percentage of good dies per wafer). For other hardware, it is the percentage of units coming off the production line that meet quality specifications on the first pass.

**Why investors care:** Yield rate is the bridge between designed unit economics and actual unit economics. A product with great BOM costs and terrible yield has terrible real unit economics because you are paying to manufacture units you throw away. For semiconductors, yield improvement is the single most important driver of margin expansion. For all hardware, yield problems at scale can turn a viable product into a money-losing one.

**How to calculate:** Yield = (units passing QC on first pass / total units started in production) x 100. For semiconductors: die yield = (good dies per wafer / total dies per wafer) x 100. Also track rework rate (units that fail first pass but are recoverable) and scrap rate (units that are unrecoverable).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <50% yield on prototype runs | 50-70% yield on prototypes | >70% yield on initial prototype batches |
| Seed | <60% yield in pilot production | 60-80% yield in pilot runs | >80% yield in pilot production |
| Series A | <75% yield at low volume production | 75-90% yield at current volume | >90% yield with documented improvement trend |
| Series B | <85% yield | 85-93% yield | >93% yield, approaching Six Sigma quality |

**Domain nuance:** Semiconductor yield is existential — a new process node may start at 20-30% yield and must reach 80%+ to be economically viable. TSMC achieves >95% on mature nodes. Consumer electronics at contract manufacturers (Foxconn, Flex) should target >95% yield at scale. Cleantech/Energy yield matters for cost competitiveness — solar cell manufacturers target >98% yield on mature processes. Low yield at scale is a sign of fundamental design or process problems, not just growing pains.

---

### Design-to-Ship Timeline

> **Applies to: All sub-domains.** Most critical for Semiconductors (tape-out cycles are 12-24 months) and Cleantech/Energy (regulatory and certification delays). Important for Consumer Electronics and Industrial/IoT for iteration speed.

**What it is:** The elapsed time from completing a product design (design freeze) to the first shippable units reaching customers. This includes tooling, manufacturing setup, testing, certification (FCC, UL, CE, FDA), and initial production ramp. For semiconductors, this spans from tape-out to first silicon in customer hands.

**Why investors care:** Hardware iteration cycles are fundamentally slower than software. A long design-to-ship timeline means the company burns more cash per iteration, responds slowly to market feedback, and is at risk of being overtaken by competitors. Investors want to see that the company has de-risked the manufacturing pipeline and can iterate quickly. Repeated timeline slips are a major red flag — they indicate the founder underestimates hardware complexity.

**How to calculate:** Measure in months from design freeze (or tape-out for semis) to first customer shipment. Track separately: tooling lead time, manufacturing setup, certification timeline, and production ramp. Present both the most recent timeline and the trend across product iterations (should be shortening).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >18 months estimated, no prior hardware experience | 12-18 months estimated with experienced hardware team | <12 months to first shippable units, or team has shipped before |
| Seed | >12 months from design freeze to ship, timeline slipping | 8-12 months design-to-ship, on schedule | <8 months design-to-ship, certifications on track |
| Series A | >9 months for product iterations | 6-9 months per iteration cycle | <6 months per iteration, parallel development streams |
| Series B | >6 months for incremental updates | 4-6 months per iteration | <4 months for product updates, <9 months for new products |

**Domain nuance:** Semiconductor tape-out to production is inherently 12-24 months and investors understand this — the benchmark is whether the company hits its announced timeline, not whether the timeline is short. Cleantech/Energy products face additional certification and permitting timelines (UL listing, grid interconnection approval) that can add 6-12 months. Consumer electronics companies using overseas contract manufacturers should budget 4-6 months for tooling and initial production. The biggest risk is not the timeline itself but scope creep and re-spins — ask how many design iterations the current product required.

---

### Hardware Attach Rate (Software Revenue per Device)

> **Applies to: Consumer Electronics (increasingly important), Industrial/IoT (critical — this is the valuation driver).** Less relevant for Semiconductors and Cleantech/Energy, though energy management software is emerging.

**What it is:** The percentage of hardware units that are connected to a paid software subscription or service, and the recurring revenue generated per active device. This is the key metric for hardware+software business models where the hardware is a platform for ongoing software revenue.

**Why investors care:** Pure hardware businesses get hardware multiples (1-3x revenue). Hardware+software businesses with strong attach rates get software multiples (8-15x revenue on the software portion). The attach rate determines which multiple applies. For IoT companies, software ARR per device is often the metric that makes or breaks the investment thesis. Investors want to see that customers are not just buying the hardware — they are subscribing to the software that makes the hardware valuable.

**How to calculate:** Attach rate = devices with active paid software subscription / total devices shipped x 100. Software ARR per device = total software ARR / total devices with active subscriptions. Also track: software churn per device (devices disconnecting from subscription), upsell rate (devices moving to higher subscription tiers).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No software component planned | Software planned but not built; hardware-only MVP | Software MVP shipping with hardware; early attach data |
| Seed | <20% attach rate, software feels like an afterthought | 20-50% attach rate, software adds clear value | >50% attach rate, customers buying hardware for the software |
| Series A | <40% attach rate or software ARR <$10/device/month | 40-60% attach rate, $10-30/device/month | >60% attach rate, >$30/device/month, low software churn |
| Series B | <50% attach rate or declining | 50-70% attach rate, stable software revenue per device | >70% attach rate, >$50/device/month, software NDR >110% |

**Domain nuance:** Samsara is the gold standard for hardware attach — virtually 100% of their IoT devices are tied to software subscriptions, which is why they trade at software multiples. Consumer electronics attach rates vary enormously: Peloton achieved >90% attach but struggled with churn; Oura Ring has strong attach through the subscription model. The critical question for investors is whether the software is truly essential (customer would not use the hardware without it) or merely nice-to-have (customer buys hardware and ignores the app). Industrial/IoT companies should target >80% attach at maturity. Ring/Nest-style consumer products struggle to maintain attach above 50% because the hardware works without the subscription.
