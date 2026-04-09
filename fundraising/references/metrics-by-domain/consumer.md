# Consumer Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade a consumer founder's numbers with RED/YELLOW/GREEN thresholds.

## Sub-domain Classification

Before evaluating, identify which type of consumer product:

| Sub-domain | Description | Examples | Metric Emphasis |
|-----------|-------------|---------|----------------|
| **Social** | User-generated content, social networking | Instagram, TikTok, Discord | DAU/MAU, engagement depth, viral coefficient |
| **Content/Media** | Content creation, streaming, publishing | Spotify, Substack, YouTube | Session length, retention, subscriber conversion |
| **E-commerce** | Direct-to-consumer retail, shopping | Shein, Warby Parker, Glossier | AOV, repeat purchase rate, CAC by channel |
| **Gaming** | Mobile, PC, console games | Roblox, Supercell, miHoYo | D1/D7/D30 retention, ARPDAU, session frequency |
| **Health & Wellness** | Fitness, mental health, nutrition | Noom, Calm, Whoop | Subscription retention, health outcome metrics, engagement streaks |

All metrics below apply to all consumer sub-domains unless noted otherwise.

---

### DAU/MAU Ratio
**What it is:** Daily Active Users divided by Monthly Active Users. Measures what fraction of your monthly user base engages on any given day.
**Why investors care:** DAU/MAU is the gold standard for engagement stickiness. A high ratio means users have built a daily habit around your product, which correlates with retention, monetization potential, and defensibility.
**How to calculate:** DAU / MAU on a given day, averaged over a 28-day period to smooth weekly cycles.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <10% | 10-20% | >20% |
| Seed | <15% | 15-25% | >25% |
| Series A | <20% | 20-30% | >30% |
| Series B | <25% | 25-40% | >40% |

**Domain nuance:** Social apps and messaging typically see 40-60% (WhatsApp ~70%). Content/media apps run 20-30%. Marketplace and commerce apps are naturally lower (10-20%) since purchasing is less frequent. Compare within category, not across.

---

### D1/D7/D30 Retention
**What it is:** Percentage of users who return to the product on Day 1, Day 7, and Day 30 after first use, respectively.
**Why investors care:** Retention curves reveal whether the product delivers lasting value or is a novelty. D1 measures first impression quality, D7 validates habit formation, D30 confirms long-term stickiness. A flattening retention curve is essential — if it trends to zero, no amount of growth spend will save the company.
**How to calculate:** (Users active on Day N from a cohort) / (Total users in that cohort) x 100. Always use cohorted analysis, not aggregate.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed (D1/D7/D30) | <20/8/3% | 20-35/8-15/3-8% | >35/15/8% |
| Seed (D1/D7/D30) | <25/10/5% | 25-40/10-20/5-10% | >40/20/10% |
| Series A (D1/D7/D30) | <30/12/6% | 30-45/12-25/6-12% | >45/25/12% |
| Series B (D1/D7/D30) | <35/15/8% | 35-50/15-30/8-15% | >50/30/15% |

**Domain nuance:** Gaming has higher D1 (50%+) but steeper drop-off. Social apps need strong D7 (25%+) to prove network effects. Utility apps may have low DAU but high D30 because they are used periodically. Always show the full retention curve shape, not just point values.

---

### Viral Coefficient (K-Factor)
**What it is:** Average number of new users each existing user brings in through invitations, sharing, or organic word-of-mouth.
**Why investors care:** K > 1 means the product grows exponentially without paid acquisition. Even K = 0.5 dramatically reduces effective CAC because half your growth is free.
**How to calculate:** K = (Average invites sent per user) x (Conversion rate of invites). Measure over a defined time window (e.g., first 14 days).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <0.1 | 0.1-0.3 | >0.3 |
| Seed | <0.2 | 0.2-0.5 | >0.5 |
| Series A | <0.3 | 0.3-0.7 | >0.7 |
| Series B | <0.4 | 0.4-0.8 | >0.8 |

**Domain nuance:** True viral loops (K > 1) are extremely rare and typically only found in communication/social products (Hotmail, WhatsApp). Content virality (TikTok, YouTube) works differently — measure content shares and view-to-creator conversion instead. Invitation-based K-factor can be gamed; look at organic vs incentivized virality separately.

---

### Session Length
**What it is:** Average time a user spends in the product per session, from open to close.
**Why investors care:** Longer sessions indicate deeper engagement and more surface area for monetization. For attention-based business models (ads, content), session length directly drives revenue.
**How to calculate:** Total time in app across all sessions / Number of sessions. Exclude sessions under 3 seconds (accidental opens). Report median rather than mean to avoid skew from outliers.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <2 min | 2-5 min | >5 min |
| Seed | <3 min | 3-7 min | >7 min |
| Series A | <4 min | 4-8 min | >8 min |
| Series B | <5 min | 5-10 min | >10 min |

**Domain nuance:** These benchmarks assume social/content/community apps. Utility apps (e.g., weather, banking) have naturally shorter sessions (1-3 min) and should be evaluated on task completion rate instead. Gaming apps run 15-30+ min. Streaming and video apps run 20-40+ min. Always benchmark within category.

---

### Engagement Depth (Sessions per User per Day)
**What it is:** Average number of times a user opens and actively uses the product within a single day.
**Why investors care:** Multiple daily sessions indicate deep integration into a user's routine. Combined with session length, it paints a full picture of time spent.
**How to calculate:** Total daily sessions / DAU. Measure as a trailing 7-day average.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <1.5 | 1.5-2.5 | >2.5 |
| Seed | <2.0 | 2.0-3.0 | >3.0 |
| Series A | <2.5 | 2.5-4.0 | >4.0 |
| Series B | <3.0 | 3.0-5.0 | >5.0 |

**Domain nuance:** Messaging apps see 10-20+ sessions/day. Social feeds typically see 5-8. Marketplace apps see 2-4. Evaluate alongside session length — many short sessions (messaging) and fewer long sessions (streaming) are both valid engagement patterns depending on the product.

---

### CAC by Channel
**What it is:** Cost to acquire one new user, broken down by acquisition channel (organic, paid social, influencer, referral, SEO, etc.).
**Why investors care:** Channel-level CAC reveals which growth levers are efficient and which are burning cash. It also shows dependency risk — over-reliance on one paid channel is fragile.
**How to calculate:** Total spend on channel / New users attributed to that channel. Use last-touch or multi-touch attribution depending on sophistication.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Blended CAC >$5 | $2-$5 | <$2 |
| Seed | Blended CAC >$4 | $1.50-$4 | <$1.50 |
| Series A | Blended CAC >$3 | $1-$3 | <$1 |
| Series B | Blended CAC >$3 | $1-$3 (with 50%+ organic) | <$1 (with 60%+ organic) |

**Domain nuance:** These benchmarks assume free consumer apps. Subscription consumer (Spotify, Headspace) tolerates higher CAC ($10-30) because LTV supports it. Fintech consumer CAC can run $20-80 due to regulatory and trust barriers. Always present CAC relative to LTV, not in isolation. Paid CAC rising over time is a red flag investors watch closely.

---

### Revenue per User (ARPU)
**What it is:** Average revenue generated per user over a defined period (monthly ARPU is most common).
**Why investors care:** ARPU, combined with user volume, sizes the revenue opportunity. It also reveals monetization efficiency and pricing power.
**How to calculate:** Total Revenue / Active Users in the period. Report both paying ARPU and blended ARPU (including free users) for freemium models.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <$0.10/mo blended | $0.10-$0.50/mo | >$0.50/mo |
| Seed | <$0.30/mo blended | $0.30-$1.00/mo | >$1.00/mo |
| Series A | <$0.50/mo blended | $0.50-$2.00/mo | >$2.00/mo |
| Series B | <$1.00/mo blended | $1.00-$5.00/mo | >$5.00/mo |

**Domain nuance:** These benchmarks assume ad-supported or freemium consumer apps. Subscription apps should report paying ARPU separately (Netflix ~$15/mo, Spotify ~$6/mo blended with family plans). Gaming ARPU varies wildly — hypercasual ($0.05-0.20) vs midcore ($2-10). Marketplace ARPU should be measured as take rate x GMV per user.

---

### Organic vs Paid Mix
**What it is:** Percentage of new user acquisition coming from organic channels (word-of-mouth, SEO, direct, referral) versus paid channels (social ads, SEM, influencer spend, app install campaigns).
**Why investors care:** A high organic percentage signals product-market fit and natural demand. Heavy paid dependency means growth may not be sustainable if CAC rises or ad platforms change policies. Organic mix also directly impacts blended CAC and long-term margins.
**How to calculate:** Organic new users / Total new users x 100. Define "organic" consistently — typically includes direct, referral, organic search, and earned media. Exclude all channels with spend.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <30% organic | 30-50% organic | >50% organic |
| Seed | <40% organic | 40-60% organic | >60% organic |
| Series A | <40% organic | 40-60% organic | >60% organic |
| Series B | <50% organic | 50-70% organic | >70% organic |

**Domain nuance:** Some categories are inherently paid-heavy (e.g., fintech, insurance) and investors accept 60%+ paid if unit economics work. Content platforms with strong network effects (TikTok, Reddit) should show increasing organic share over time. A declining organic percentage even as total users grow is a warning sign. Present the trend over 6+ months, not a snapshot.
