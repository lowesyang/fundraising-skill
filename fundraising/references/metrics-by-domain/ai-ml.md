# AI/ML Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade an AI/ML founder's numbers with RED/YELLOW/GREEN thresholds.

## Product Type Classification

Before evaluating metrics, first ask the founder which type of AI/ML company they are building.
The metrics that matter vary dramatically by product type:

| Type | Description | Examples | Key Differentiator |
|------|-------------|---------|-------------------|
| **Model Company** | Training proprietary foundation or specialized models | OpenAI, Anthropic, Mistral, Cohere | Model performance vs SOTA |
| **AI Application** | Building products on top of existing models (API-based) | Jasper, Copy.ai, Harvey, Cursor | UX, workflow integration, domain data |
| **AI Infrastructure / Tooling** | Building tools for AI developers or deployment | Weights & Biases, Modal, Replicate | Developer adoption, API usage |
| **AI-Enhanced Product** | Traditional product with AI features (not AI-first) | Notion AI, Canva Magic, Figma AI | Feature adoption within existing product |

### Metrics by Product Type

**Model Company** — use ALL metrics below (model accuracy, inference cost, training cost, data moat are critical)

**AI Application** — focus on:
- Data moat / proprietary dataset (if applicable)
- Inference cost per query (as a cost of goods, even if using third-party APIs)
- API usage growth → reframe as "usage growth" (queries, sessions, tasks completed)
- Revenue per API call → reframe as "revenue per task" or "revenue per user action"
- Customer concentration
- SKIP: Model accuracy benchmarks (you're using someone else's model), Training cost trajectory (not applicable)
- ADD: Gross margin (critical — third-party API costs eat into margin), Workflow completion rate, Time saved per task

**AI Infrastructure / Tooling** — focus on:
- API usage growth (core metric)
- Revenue per API call
- Inference latency (if serving models)
- Customer concentration
- ADD: Developer adoption (GitHub stars, npm downloads), Integration depth (API calls per customer)

**AI-Enhanced Product** — focus on:
- ADD: AI feature adoption rate (% of users using AI features)
- ADD: Incremental revenue from AI features
- ADD: AI cost as % of revenue (margin impact)
- Use SaaS or Consumer metrics as the primary framework, AI metrics as supplementary

---

### Model Accuracy / Performance Benchmarks

> **Applies to: Model Company.** For AI Applications, skip this metric — your differentiation is in UX and workflow, not model performance. For AI-Enhanced Products, this is not relevant.
**What it is:** Quantitative measure of model quality on relevant tasks — accuracy, F1 score, BLEU, ROUGE, AUC-ROC, or domain-specific benchmarks depending on the application.
**Why investors care:** Model performance is the core technical moat. Superior accuracy justifies premium pricing, drives adoption, and creates switching costs. Investors want to see performance relative to public baselines and competitors, not just absolute numbers.
**How to calculate:** Run standardized evaluation on held-out test sets or public benchmarks relevant to the domain. Report the metric most meaningful for the use case (e.g., precision/recall for search, accuracy for classification, BLEU for translation). Always include the benchmark name and comparison to state-of-the-art.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Below public baselines | At or near SOTA on 1 benchmark | Exceeds SOTA on key benchmark |
| Seed | <5% above open-source alternatives | 5-15% above open-source | >15% above open-source |
| Series A | No measurable advantage vs competitors | 10-20% better than competitors on core task | >20% better on core task with published evaluation |
| Series B | Losing ground to competitors | Maintaining lead with incremental gains | Widening lead + performance on new tasks |

**Domain nuance:** "Accuracy" means different things in different domains. For LLMs, use human preference evaluations (Elo/Arena-style). For computer vision, use mAP or IoU. For recommendation, use NDCG. Always present error analysis alongside headline numbers — investors want to know where the model fails, not just where it succeeds.

---

### Response Time

> **Applies to: Model Company, AI Infrastructure.** For AI Applications using third-party APIs, reframe as "end-to-end response time" including API call overhead.

**What it is:** How long users wait for a result. Measure from when the user hits "submit" to when they see a usable response. For streaming outputs (like LLM text generation), also measure time-to-first-token — when the user sees the response start appearing.

**Why investors care:** Response time directly impacts user experience and determines which use cases the product can serve. Faster = more use cases = larger market.

**How to calculate:** Track median (typical user experience) and 95th percentile (worst-case). For streaming outputs, track both time-to-first-token and total completion time separately.

**Benchmarks vary by interaction type — ask the founder what their product does first:**

| Interaction Type | Examples | Acceptable | Good | Excellent |
|-----------------|---------|------------|------|-----------|
| **Real-time / inline** | Search, autocomplete, code completion | <1s | <500ms | <200ms |
| **Interactive generation** | Chatbot, Q&A, summarization | <5s (or streaming starts <1s) | <3s (or streaming <500ms) | <1s total |
| **Complex generation** | Long-form writing, code generation, image generation | <30s | <15s | <5s |
| **Batch / async** | Document processing, data analysis, video generation | <5 min | <1 min | <30s |

**By stage** (applicable to the founder's interaction type):

| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >3x slower than user expectation for the interaction type | Within user expectation | Noticeably fast for the category |
| Seed | Users complain about speed | Speed is acceptable, not a differentiator | Speed is a positive in user feedback |
| Series A | Slower than competitors | On par with competitors | Faster than competitors, enabling use cases they can't serve |
| Series B | Speed regression or stagnation | Steady improvement | Industry-leading + consistent optimization trajectory |

**Domain nuance:** The right benchmark depends entirely on what the product does. A 10-second response for image generation is excellent; for search autocomplete it's unusable. For LLM-based products, streaming output changes the equation — users perceive a 10-second generation as fast if tokens start appearing in 500ms. Always ask: "What does your user expect, and how does your speed compare to that expectation?"

---

### Inference Cost per Query

> **Applies to: ALL types.** For AI Applications, this includes third-party API costs (OpenAI, Anthropic, etc.) — often the largest COGS line item. Critical for gross margin analysis.

**What it is:** Fully loaded cost to serve one inference request, including compute (GPU/TPU), memory, networking, and amortized infrastructure overhead.
**Why investors care:** Inference cost determines gross margin. Many AI companies have impressive revenue but thin margins because serving costs are high. Cost trajectory matters as much as current cost — investors want to see a clear path to cost reduction through optimization, quantization, or custom hardware.
**How to calculate:** Total monthly inference infrastructure cost / Total monthly queries served. Include GPU instance costs, model serving framework overhead, and any third-party API costs.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >$0.10 per query | $0.02-$0.10 | <$0.02 |
| Seed | >$0.05 per query | $0.01-$0.05 | <$0.01 |
| Series A | >$0.03 per query | $0.005-$0.03 | <$0.005 |
| Series B | >$0.02 per query | $0.003-$0.02 | <$0.003 |

**Domain nuance:** These benchmarks assume text-based AI. Image generation runs 10-50x higher. Video/3D generation runs 100x+. The key metric is cost as a percentage of revenue per query — if you charge $0.10 and cost is $0.03, that is a healthy 70% gross margin regardless of absolute cost. Show cost reduction trajectory over time (e.g., "reduced cost per query 40% QoQ through distillation and batching").

---

### Data Moat Size

> **Applies to: Model Company, AI Application.** For AI Applications, the "data moat" is often user-generated data, domain-specific datasets, or fine-tuning data — not just training data. For AI-Enhanced Products, less relevant unless AI features generate proprietary data loops.

**What it is:** Volume and uniqueness of proprietary training/fine-tuning data that competitors cannot easily replicate. Measured in unique data points, labeled examples, or proprietary data relationships.
**Why investors care:** In the age of open-source foundation models, data is the primary defensibility layer. Proprietary data that improves with usage creates a compounding flywheel — more users generate more data, which improves the model, which attracts more users.
**How to calculate:** Quantify along three dimensions: (1) Volume — total unique data points/examples, (2) Exclusivity — percentage of data that is proprietary and not publicly available, (3) Velocity — rate of new data generation from product usage.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Using only public data | Small proprietary dataset (<10K examples) with clear collection plan | >10K proprietary examples + data flywheel designed |
| Seed | <50K proprietary examples, no flywheel | 50K-500K examples, early flywheel | >500K examples, active flywheel |
| Series A | <500K examples, data easily replicable | 500K-5M examples, some exclusivity | >5M examples, strong exclusivity + growing 20%+ MoM |
| Series B | Competitors closing data gap | Significant data lead, moderate growth | Insurmountable data lead + network effects compounding |

**Domain nuance:** Data moat evaluation is highly domain-specific. In healthcare, 100K labeled medical images may be more valuable than 10M generic images. Quality and labeling accuracy often matter more than raw volume. Enterprise data moats (built from customer data with permission) are stickier than scraped web data. Present the data flywheel diagram, not just raw numbers.

---

### Training Cost Trajectory

> **Applies to: Model Company only.** AI Applications using third-party APIs should skip this metric entirely. If you're fine-tuning models, report fine-tuning costs instead (typically 10-100x cheaper than training from scratch).

**What it is:** Total cost to train or fine-tune a new model version, tracked over successive versions to show the trend.
**Why investors care:** Training costs indicate R&D capital intensity and pace of improvement. Investors want to see costs decreasing per unit of performance gain, showing the team can iterate efficiently. Runaway training costs signal unsustainable R&D burn.
**How to calculate:** Total GPU/TPU hours x cost per hour for each training run. Include data preparation, experimentation (failed runs), and hyperparameter tuning. Report cost per model version and cost per percentage point of performance improvement.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >$50K per training run | $10K-$50K per run | <$10K per run |
| Seed | >$200K per run, no cost reduction trend | $50K-$200K per run, flat cost | <$50K per run or clear downward cost trend |
| Series A | >$500K per run, increasing costs | $100K-$500K per run, stable or declining | <$100K per run or 30%+ cost reduction per version |
| Series B | >$1M per run, no efficiency gains | $200K-$1M per run, moderate optimization | <$200K per run or 50%+ cost reduction vs prior version |

**Domain nuance:** Foundation model companies (training from scratch) have structurally higher costs — $5M-$100M+ is normal for frontier models. Fine-tuning companies should be dramatically cheaper. The trend matters more than the absolute number. Show a chart of cost per training run over time with corresponding performance gains. Techniques like LoRA, QLoRA, and distillation should be reflected in decreasing costs.

---

### API Usage Growth

> **Applies to: ALL types.** For AI Applications, reframe as "usage growth" — tasks completed, sessions, queries. For AI-Enhanced Products, measure AI feature usage growth specifically.

**What it is:** Growth rate of API calls, tokens processed, or queries served over time. The core usage metric for AI companies with API-based business models.
**Why investors care:** API usage growth is the leading indicator of revenue growth for AI infrastructure companies. It reflects developer adoption, integration depth, and expanding use cases. Compounding usage growth from existing customers is especially powerful.
**How to calculate:** Total API calls (or tokens/queries) per month. Report MoM growth rate and breakdown by: new customers vs existing customer expansion. Track trailing 3-month average growth.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <10% MoM growth | 10-25% MoM | >25% MoM |
| Seed | <15% MoM growth | 15-30% MoM | >30% MoM |
| Series A | <10% MoM growth | 10-20% MoM | >20% MoM |
| Series B | <8% MoM growth | 8-15% MoM | >15% MoM |

**Domain nuance:** Distinguish between total API calls and unique calling applications. One large customer ramping up can mask stagnation elsewhere. Show the usage distribution — healthy companies have broad-based growth, not one whale. For token-based pricing, report tokens per query growth separately as it indicates deepening usage patterns.

---

### Revenue per API Call

> **Applies to: Model Company, AI Infrastructure.** For AI Applications, reframe as "revenue per task completed" or "revenue per user session." For AI-Enhanced Products, measure incremental revenue attributable to AI features.

**What it is:** Average revenue generated per API call or inference request. This is the monetization efficiency metric for AI platforms.
**Why investors care:** Combined with inference cost, it determines per-unit gross margin. Growing revenue per call (through value-based pricing, premium tiers, or increasing complexity of queries handled) is a strong signal.
**How to calculate:** Total API revenue / Total API calls for the period. Segment by tier (free, standard, premium) and by use case if pricing varies.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <$0.001 per call | $0.001-$0.005 | >$0.005 |
| Seed | <$0.002 per call | $0.002-$0.01 | >$0.01 |
| Series A | <$0.005 per call | $0.005-$0.02 | >$0.02 |
| Series B | <$0.005 per call (declining trend) | $0.005-$0.02 (stable) | >$0.02 (rising trend) |

**Domain nuance:** Revenue per call varies enormously by domain. Simple classification might be $0.001. Complex document analysis might be $0.10-$1.00. Code generation might be $0.01-$0.05 per completion. The key ratio is revenue per call / cost per call — this is your unit-level gross margin. Always present revenue per call alongside cost per call to show the spread. Token-based pricing models should normalize to a standard unit (e.g., per 1K tokens).

---

### Customer Concentration

> **Applies to: ALL types.**

**What it is:** Percentage of total revenue derived from the top 1, 3, and 10 customers.
**Why investors care:** High customer concentration is one of the most common deal-killers for AI companies. Losing a single customer can crater revenue. It also signals the product may be a bespoke solution rather than a scalable platform.
**How to calculate:** Revenue from top N customers / Total revenue x 100. Report top 1, top 3, and top 10 customer revenue share.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Top 1 customer >80% of revenue | Top 1 = 50-80% | Top 1 <50% (or pre-revenue) |
| Seed | Top 1 >50%, Top 3 >80% | Top 1 = 30-50%, Top 3 = 60-80% | Top 1 <30%, Top 3 <60% |
| Series A | Top 1 >40%, Top 3 >70% | Top 1 = 20-40%, Top 3 = 50-70% | Top 1 <20%, Top 3 <50% |
| Series B | Top 1 >30%, Top 10 >80% | Top 1 = 15-30%, Top 10 = 60-80% | Top 1 <15%, Top 10 <60% |

**Domain nuance:** Enterprise AI inherently starts concentrated — early design partners dominate revenue. Investors accept higher concentration at pre-seed/seed if the pipeline shows diversification. The concern escalates at Series A+ if concentration is not decreasing. Government/defense AI companies get more latitude (fewer, larger contracts are the norm). Show the trend: is concentration decreasing quarter over quarter as new customers onboard?
