# AI Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade an AI founder's numbers with RED/YELLOW/GREEN thresholds.

## Sub-Domain Classification

Before evaluating metrics, first ask the founder which type of AI company they are building.
The metrics that matter vary dramatically by sub-domain:

| Sub-domain | Description | Examples | Key Differentiator |
|-----------|-------------|---------|-------------------|
| **Foundation Models** | Training large-scale models from scratch | OpenAI, Anthropic, Mistral, DeepSeek | Model performance, training cost, data moat |
| **AI Applications** | Products built on top of existing models | Cursor, Jasper, Harvey, Perplexity | UX, workflow integration, domain data, retention |
| **AI Infrastructure** | Tools and platforms for AI developers | Weights & Biases, Modal, Replicate, Hugging Face | Developer adoption, API usage, ecosystem lock-in |
| **Embodied Intelligence** | Robotics, autonomous systems, physical AI | Figure AI, 1X Technologies, Waymo, Boston Dynamics | Hardware-software integration, real-world performance, safety |
| **AI Chips & Hardware** | Custom silicon, accelerators, specialized compute | NVIDIA, Cerebras, Groq, d-Matrix | Performance per watt, TCO vs incumbents, design wins |
| **Compute Services** | GPU cloud, inference platforms, training clusters | CoreWeave, Lambda, Together AI, RunPod | Utilization rate, cost per FLOP, customer retention |

### Metrics by Sub-Domain

**Foundation Models** — use ALL metrics below (model accuracy, inference cost, training cost, data moat are critical)

**AI Applications** — focus on:
- Data moat / proprietary dataset (if applicable)
- Inference cost per query (as a cost of goods, even if using third-party APIs)
- API usage growth → reframe as "usage growth" (queries, sessions, tasks completed)
- Revenue per API call → reframe as "revenue per task" or "revenue per user action"
- Customer concentration
- SKIP: Model accuracy benchmarks (you're using someone else's model), Training cost trajectory (not applicable)
- ADD: Gross margin (critical — third-party API costs eat into margin), Workflow completion rate, Time saved per task

**AI Infrastructure** — focus on:
- API usage growth (core metric)
- Revenue per API call
- Inference latency (if serving models)
- Customer concentration
- ADD: Developer adoption (GitHub stars, npm downloads), Integration depth (API calls per customer)

**Embodied Intelligence** — focus on:
- Real-world task success rate (core metric)
- Mean time between failures (MTBF)
- Sim-to-real transfer gap
- Safety incident rate
- Unit economics per robot/system deployed
- Data moat (proprietary sensor data, environment data, task demonstrations)
- Customer concentration
- ADD: Deployment site count, Autonomous operation hours logged, Regulatory milestone progress

**AI Chips & Hardware** — focus on:
- Performance per watt (TOPS/W)
- Total cost of ownership vs NVIDIA baseline
- Design wins / customer pipeline
- Tape-out timeline and yield
- Software ecosystem maturity (compiler, SDK adoption)
- Customer concentration
- ADD: Benchmark results vs incumbent silicon, Fab partner relationship status, Revenue backlog

**Compute Services** — focus on:
- GPU utilization rate (core metric)
- Cost per FLOP (training) / cost per token (inference)
- Customer retention (monthly/quarterly)
- Capacity growth rate
- Revenue per GPU-hour
- Inference cost per query
- Customer concentration
- ADD: Cluster uptime/SLA performance, Waitlist depth, Contract length and commitment levels

---

### Model Accuracy / Performance Benchmarks

> **Applies to: Foundation Models, Embodied Intelligence.** For AI Applications, skip this metric — your differentiation is in UX and workflow, not model performance. For AI Chips & Hardware, model accuracy is not directly relevant (see performance per watt instead). For Compute Services, not applicable.

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

**Domain nuance:** "Accuracy" means different things in different domains. For LLMs, use human preference evaluations (Elo/Arena-style). For computer vision, use mAP or IoU. For recommendation, use NDCG. For Embodied Intelligence, use task completion rate in real-world settings, not just simulation. Always present error analysis alongside headline numbers — investors want to know where the model fails, not just where it succeeds.

---

### Response Time

> **Applies to: Foundation Models, AI Applications, AI Infrastructure, Compute Services.** For AI Applications using third-party APIs, reframe as "end-to-end response time" including API call overhead. For Compute Services, measure infrastructure-level latency (time from request receipt to first byte served). Not directly applicable to Embodied Intelligence or AI Chips & Hardware (see domain-specific metrics instead).

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

**Domain nuance:** The right benchmark depends entirely on what the product does. A 10-second response for image generation is excellent; for search autocomplete it's unusable. For LLM-based products, streaming output changes the equation — users perceive a 10-second generation as fast if tokens start appearing in 500ms. For Compute Services, latency benchmarks should be measured at the infrastructure layer (excluding model execution time) to isolate platform performance. Always ask: "What does your user expect, and how does your speed compare to that expectation?"

---

### Inference Cost per Query

> **Applies to: Foundation Models, AI Applications, AI Infrastructure, Compute Services.** For AI Applications, this includes third-party API costs (OpenAI, Anthropic, etc.) — often the largest COGS line item. Critical for gross margin analysis. For Compute Services, reframe as the cost to serve a customer's inference workload. Not directly applicable to Embodied Intelligence or AI Chips & Hardware (see unit economics and TCO metrics instead).

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

**Domain nuance:** These benchmarks assume text-based AI. Image generation runs 10-50x higher. Video/3D generation runs 100x+. The key metric is cost as a percentage of revenue per query — if you charge $0.10 and cost is $0.03, that is a healthy 70% gross margin regardless of absolute cost. Show cost reduction trajectory over time (e.g., "reduced cost per query 40% QoQ through distillation and batching"). For Compute Services, present this alongside revenue per query to show unit-level margin.

---

### Data Moat Size

> **Applies to: Foundation Models, AI Applications, Embodied Intelligence.** For AI Applications, the "data moat" is often user-generated data, domain-specific datasets, or fine-tuning data — not just training data. For Embodied Intelligence, the data moat includes proprietary sensor data, real-world task demonstrations, and environment maps. Not directly applicable to AI Chips & Hardware or Compute Services.

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

**Domain nuance:** Data moat evaluation is highly domain-specific. In healthcare, 100K labeled medical images may be more valuable than 10M generic images. Quality and labeling accuracy often matter more than raw volume. Enterprise data moats (built from customer data with permission) are stickier than scraped web data. For Embodied Intelligence, hours of real-world operation data and environment diversity are more meaningful than raw data point counts. Present the data flywheel diagram, not just raw numbers.

---

### Training Cost Trajectory

> **Applies to: Foundation Models only.** AI Applications using third-party APIs should skip this metric entirely. If you're fine-tuning models, report fine-tuning costs instead (typically 10-100x cheaper than training from scratch). Not applicable to AI Chips & Hardware, Compute Services, or Embodied Intelligence (unless training proprietary models in-house).

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

> **Applies to: Foundation Models, AI Applications, AI Infrastructure, Compute Services.** For AI Applications, reframe as "usage growth" — tasks completed, sessions, queries. For Compute Services, reframe as "compute consumption growth" — GPU-hours consumed, jobs submitted, tokens processed.

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

**Domain nuance:** Distinguish between total API calls and unique calling applications. One large customer ramping up can mask stagnation elsewhere. Show the usage distribution — healthy companies have broad-based growth, not one whale. For token-based pricing, report tokens per query growth separately as it indicates deepening usage patterns. For Compute Services, track GPU-hours as the primary unit alongside API calls.

---

### Revenue per API Call

> **Applies to: Foundation Models, AI Infrastructure, Compute Services.** For AI Applications, reframe as "revenue per task completed" or "revenue per user session." For Compute Services, reframe as "revenue per GPU-hour" or "revenue per compute unit." Not applicable to Embodied Intelligence or AI Chips & Hardware.

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

> **Applies to: ALL sub-domains (Foundation Models, AI Applications, AI Infrastructure, Embodied Intelligence, AI Chips & Hardware, Compute Services).**

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

**Domain nuance:** Enterprise AI inherently starts concentrated — early design partners dominate revenue. Investors accept higher concentration at pre-seed/seed if the pipeline shows diversification. The concern escalates at Series A+ if concentration is not decreasing. Government/defense AI companies get more latitude (fewer, larger contracts are the norm). AI Chips & Hardware companies also receive more tolerance here — design wins are lumpy by nature, and a single hyperscaler customer can represent transformative revenue. Embodied Intelligence companies deploying to enterprise sites will naturally have concentration; show the deployment pipeline to mitigate concern. Show the trend: is concentration decreasing quarter over quarter as new customers onboard?

---

## Embodied Intelligence Metrics

### Real-World Task Success Rate

> **Applies to: Embodied Intelligence.**

**What it is:** Percentage of assigned tasks (pick-and-place, navigation, assembly, inspection, etc.) that the robot or autonomous system completes successfully in real-world (non-simulated) conditions without human intervention.
**Why investors care:** This is the single most important metric for robotics and physical AI companies. It directly determines whether the system can replace or augment human labor economically. A system that fails 20% of the time requires constant human oversight, destroying the value proposition.
**How to calculate:** (Tasks completed successfully without intervention / Total tasks attempted) x 100. Report across different task types, environments, and conditions. Always distinguish between controlled environment performance and unstructured real-world performance.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <60% in controlled settings | 60-80% in controlled settings | >80% in controlled settings with demo of real-world capability |
| Seed | <70% in controlled, <50% in real-world | 70-85% controlled, 50-70% real-world | >85% controlled, >70% real-world |
| Series A | <80% in real-world deployments | 80-90% in real-world | >90% in real-world across multiple sites |
| Series B | <90% in real-world, regression or stagnation | 90-95% in real-world, steady improvement | >95% in real-world with expanding task repertoire |

**Domain nuance:** Success rate requirements vary dramatically by application. Warehouse pick-and-place may tolerate 95% success (5% goes to human exception handling). Surgical robotics demands >99.9%. Autonomous driving has effectively zero tolerance for safety-critical failures. Always contextualize the success rate against the cost of failure in that domain. Report separately for novel vs. previously-seen scenarios.

---

### Mean Time Between Failures (MTBF)

> **Applies to: Embodied Intelligence, AI Chips & Hardware.**

**What it is:** Average operational time between system failures requiring human intervention, maintenance, or restart. Covers both hardware failures (mechanical, electrical) and software failures (crashes, perception errors causing stops, planning failures).
**Why investors care:** MTBF determines operational feasibility. A robot that fails every 2 hours needs a babysitter. A robot with 500-hour MTBF can operate autonomously across shifts. This directly impacts unit economics — higher MTBF means fewer support staff per deployed unit.
**How to calculate:** Total operational hours / Number of failure events requiring intervention. Segment by failure type (hardware, software, environmental) to identify improvement vectors.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <4 hours | 4-24 hours | >24 hours |
| Seed | <24 hours | 24-100 hours | >100 hours |
| Series A | <100 hours | 100-500 hours | >500 hours |
| Series B | <500 hours | 500-2,000 hours | >2,000 hours |

**Domain nuance:** Industrial robots in manufacturing have MTBF targets of 10,000+ hours. Early-stage autonomous systems are expected to be lower, but the trajectory matters. Show MTBF improvement over successive firmware/software versions. Distinguish between hard failures (system stops) and soft failures (degraded performance requiring eventual intervention). For AI Chips & Hardware, MTBF reflects silicon reliability and should be benchmarked against industry standards for the target deployment environment.

---

### Sim-to-Real Transfer Gap

> **Applies to: Embodied Intelligence.**

**What it is:** The performance degradation when moving a model or policy trained in simulation to real-world deployment. Measured as the percentage drop in task success rate from simulation to reality.
**Why investors care:** A narrow sim-to-real gap indicates strong engineering and domain understanding. It means the team can iterate rapidly in simulation (cheap, fast, safe) and reliably deploy to the real world. A wide gap means simulation results are misleading and real-world deployment will be slow and expensive.
**How to calculate:** (Simulation success rate - Real-world success rate) / Simulation success rate x 100. Report for each major task type.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | >40% performance drop | 20-40% drop | <20% drop |
| Seed | >30% performance drop | 15-30% drop | <15% drop |
| Series A | >20% performance drop | 10-20% drop | <10% drop |
| Series B | >15% performance drop | 5-15% drop | <5% drop with systematic transfer methodology |

**Domain nuance:** Some tasks transfer better than others. Rigid object manipulation transfers well; deformable objects (cloth, food) have inherently larger gaps. The sophistication of the simulation environment matters — photorealistic rendering and accurate physics reduce the gap. Show the techniques used to close the gap (domain randomization, real-world fine-tuning, progressive transfer). A company that can reliably sim-to-real is fundamentally more capital-efficient than one that must train everything in the real world.

---

### Safety Incident Rate

> **Applies to: Embodied Intelligence, AI Chips & Hardware (for safety-critical applications).**

**What it is:** Number of safety incidents (near-misses, property damage, or injury events) per 1,000 operational hours. Includes both physical safety events and critical software failures that could lead to unsafe behavior.
**Why investors care:** Safety incidents are existential risk for robotics companies. A single serious incident can trigger regulatory action, destroy customer trust, and generate liability. Investors need to see a rigorous safety culture with declining incident rates.
**How to calculate:** Total safety incidents / (Total operational hours / 1,000). Categorize by severity: (1) Near-miss — unsafe condition detected and averted, (2) Minor — property damage, no injury, (3) Major — injury or significant property damage. Report all categories separately.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Any major incident, or >10 near-misses per 1,000 hours | 5-10 near-misses per 1,000 hours, zero major | <5 near-misses per 1,000 hours, zero major, safety framework documented |
| Seed | Any major incident, or >5 near-misses per 1,000 hours | 2-5 near-misses per 1,000 hours | <2 near-misses per 1,000 hours, declining trend |
| Series A | Any major incident, or >2 near-misses per 1,000 hours | 1-2 near-misses per 1,000 hours | <1 near-miss per 1,000 hours, third-party safety audit passed |
| Series B | Any major incident | >0.5 near-misses per 1,000 hours | <0.5 near-misses per 1,000 hours, regulatory certifications obtained |

**Domain nuance:** Safety requirements are domain-dependent. Warehouse robots operating in fenced areas have different thresholds than robots working alongside humans. Autonomous vehicles have the most stringent requirements — any injury incident at any stage is a serious red flag. Present the safety monitoring infrastructure (sensor redundancy, emergency stops, monitoring dashboards) alongside the numbers. Show proactive safety investments, not just reactive metrics.

---

### Unit Economics per Robot/System Deployed

> **Applies to: Embodied Intelligence.**

**What it is:** The per-unit economics of deploying a single robot or autonomous system, including hardware cost, installation, software licensing, maintenance, and the revenue or cost savings it generates for the customer.
**Why investors care:** Hardware businesses have different economics than pure software. Investors need to see a clear path to positive unit economics — each deployed system should generate more lifetime revenue than it costs to build, deploy, and maintain. Negative unit economics at scale is a death spiral.
**How to calculate:** Per-unit metrics: (1) Hardware COGS per unit, (2) Installation and deployment cost per unit, (3) Annual maintenance cost per unit, (4) Annual revenue per unit (or annual cost savings delivered to customer), (5) Payback period = Total deployment cost / Annual revenue per unit.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No unit economics model, hardware cost unknown | Rough BOM estimate, >36-month customer payback | BOM costed, <24-month customer payback modeled |
| Seed | Hardware cost >3x revenue per unit annually | Hardware cost 1.5-3x annual revenue, improving | Hardware cost <1.5x annual revenue, <18-month payback |
| Series A | Negative gross margin per unit deployed | Gross margin 10-30% per unit | Gross margin >30% per unit, <12-month customer payback |
| Series B | No improvement in unit economics at scale | Moderate scale benefits (20-30% cost reduction at volume) | Strong scale benefits (>40% cost reduction at volume), >50% gross margin |

**Domain nuance:** Compare customer payback period against the industry norm for capital equipment in that sector. Manufacturing robots typically justify 12-18 month payback. Show the BOM cost reduction curve as production scales — investors want to see a path from prototype costs to volume manufacturing costs. RaaS (Robot-as-a-Service) models shift the equation to recurring revenue but require more upfront capital. Present both the company's unit economics and the customer's ROI.

---

## AI Chips & Hardware Metrics

### Performance per Watt (TOPS/W)

> **Applies to: AI Chips & Hardware.**

**What it is:** Tera operations per second per watt of power consumed (TOPS/W). The primary efficiency metric for AI accelerators, measuring how much useful compute is delivered per unit of energy.
**Why investors care:** Power is the binding constraint in data centers. A chip that delivers 2x the TOPS/W of the incumbent can either run the same workload at half the power cost or deliver 2x the performance in the same power envelope. This is the core value proposition for AI chip startups competing against NVIDIA.
**How to calculate:** Measure peak TOPS on target workloads (not just marketing specs) divided by total system power consumption (including memory, interconnect, and cooling overhead). Report on representative workloads (transformer inference, training, specific model architectures).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No silicon, theoretical claims only | Simulation/FPGA prototype showing >1.5x NVIDIA baseline | Simulation showing >2x NVIDIA baseline with clear architecture rationale |
| Seed | <1.5x NVIDIA current-gen (projected) | 1.5-3x NVIDIA current-gen (projected from prototype) | >3x NVIDIA current-gen demonstrated on FPGA/prototype |
| Series A | <2x NVIDIA current-gen (on first silicon) | 2-4x NVIDIA current-gen on real silicon | >4x NVIDIA current-gen on production silicon, benchmarked on real workloads |
| Series B | Advantage eroded by NVIDIA's next-gen | Maintaining 2-3x advantage vs NVIDIA roadmap | >3x advantage sustained, validated by third-party benchmarks |

**Domain nuance:** TOPS/W varies dramatically by precision (FP32 vs FP16 vs INT8 vs FP4). Always specify the precision and workload. Inference-optimized chips will show higher TOPS/W than training chips. Compare against the NVIDIA product that serves the same market segment (H100 for training, L40 for inference, etc.). Beware of "peak TOPS" marketing — real-world utilization on actual models is what matters. Ask for MLPerf or equivalent third-party benchmark results.

---

### Total Cost of Ownership vs NVIDIA Baseline

> **Applies to: AI Chips & Hardware, Compute Services.**

**What it is:** The all-in cost to run a workload on the startup's hardware compared to running the same workload on the current NVIDIA GPU stack. Includes chip cost, system integration, power, cooling, software migration, and maintenance over a 3-year period.
**Why investors care:** Performance claims mean nothing without cost context. Even a technically superior chip fails if the TCO savings don't justify the switching cost from the NVIDIA ecosystem. Customers need >30% TCO improvement to overcome inertia and ecosystem lock-in.
**How to calculate:** For equivalent workload performance: (Total 3-year cost on startup hardware / Total 3-year cost on NVIDIA baseline) x 100. Include: chip/system purchase price, power consumption cost, cooling costs, rack space, software porting/optimization costs, staff training, and maintenance/support.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No TCO model, or <10% projected savings | 10-30% projected TCO savings with detailed model | >30% projected TCO savings with bottoms-up analysis |
| Seed | <15% TCO savings (projected from prototype) | 15-35% TCO savings with prototype validation | >35% TCO savings with early customer validation |
| Series A | <20% TCO savings on production silicon | 20-40% TCO savings demonstrated | >40% TCO savings demonstrated with paying customers |
| Series B | TCO advantage shrinking vs NVIDIA roadmap | 25-40% sustained TCO advantage | >40% sustained TCO advantage with volume pricing improving |

**Domain nuance:** TCO analysis must include software ecosystem costs — porting CUDA code to a new platform can cost millions in engineering time. Chips that are CUDA-compatible or provide automated migration tools have a significant TCO advantage beyond raw hardware savings. For Compute Services, TCO translates to cost-per-FLOP advantage that can be passed to customers or captured as margin.

---

### Design Wins / Customer Pipeline

> **Applies to: AI Chips & Hardware.**

**What it is:** Number and value of committed customer agreements to integrate or purchase the startup's chip. A "design win" means the customer has committed engineering resources to integrate the chip into their product or infrastructure.
**Why investors care:** Design wins are the leading indicator of revenue for chip companies, typically 12-24 months ahead of revenue. They validate product-market fit and reduce execution risk. The quality of design wins (hyperscaler vs. small startup) matters as much as quantity.
**How to calculate:** Track: (1) Number of design wins (signed agreements), (2) Total committed revenue from design wins, (3) Pipeline value (potential deals in evaluation stage), (4) Conversion rate from evaluation to design win.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No customer conversations | 2-5 prospective customers evaluating architecture | >5 prospects with LOIs or co-development agreements |
| Seed | <3 evaluation customers | 3-10 evaluation customers, 1-2 early design wins | >10 evaluation customers, 3+ design wins with committed volume |
| Series A | <3 design wins, no tier-1 customers | 3-5 design wins, 1 tier-1 customer | >5 design wins, 2+ tier-1 customers, revenue backlog >$10M |
| Series B | Design wins not converting to production orders | Moderate conversion, $10-50M revenue backlog | Strong conversion, >$50M revenue backlog, repeat orders from initial customers |

**Domain nuance:** Tier-1 customers (hyperscalers, major cloud providers, large enterprises) are worth 10x a small startup design win in terms of validation and volume. However, hyperscalers can also be demanding partners that consume disproportionate support resources. Show the diversity of the pipeline — a chip company dependent on a single hyperscaler is high risk. Distinguish between "evaluation" (testing the chip), "design win" (committed to integrate), and "production order" (purchasing at volume).

---

### Tape-Out Timeline and Yield

> **Applies to: AI Chips & Hardware.**

**What it is:** Progress against the chip development timeline — from RTL design through tape-out (sending the design to the fab), silicon bring-up, and production yield (percentage of manufactured chips that are functional).
**Why investors care:** Chip development is expensive and time-consuming. Delays are common and each tape-out costs $5-50M+. Investors need confidence the team can execute on schedule. Yield directly impacts unit economics — low yield means high effective cost per working chip.
**How to calculate:** Report: (1) Current development phase (RTL, verification, tape-out, bring-up, production), (2) Timeline adherence vs plan (on-time, delayed, ahead), (3) For post-tape-out: yield percentage (functional chips / total chips manufactured), (4) Number of tape-out iterations (re-spins).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Architecture not defined, no fab relationship | Architecture defined, FPGA prototype, fab partner identified | Architecture validated on FPGA, fab partner engaged, tape-out timeline set |
| Seed | >6 months behind tape-out schedule | On schedule for first tape-out, minor delays | Ahead of schedule or first silicon received |
| Series A | Multiple re-spins required, yield <50% | First silicon functional, yield 50-70%, 1 re-spin | First silicon meets specs, yield >70%, on schedule for production |
| Series B | Yield <70%, ongoing re-spin cycles | Yield 70-85%, production ramping | Yield >85%, volume production stable, next-gen tape-out on track |

**Domain nuance:** Leading-edge nodes (5nm, 3nm) have lower initial yields and higher tape-out costs. Mature nodes (28nm, 16nm) are cheaper and higher yield but may limit performance. The choice of process node should align with the product strategy. Ask about the relationship with the foundry (TSMC, Samsung, GlobalFoundries) — allocation priority matters, especially during capacity constraints. First-time tape-out success is rare; the question is how efficiently the team addresses issues.

---

### Software Ecosystem Maturity

> **Applies to: AI Chips & Hardware.**

**What it is:** The completeness and adoption of the software stack required to use the chip — compiler, SDK, libraries, framework integrations (PyTorch, TensorFlow, JAX), documentation, and developer community.
**Why investors care:** Hardware without software is useless. NVIDIA's moat is CUDA, not just the GPU. A chip startup must build a usable software ecosystem or customers cannot adopt the hardware. This is often the most underestimated challenge for chip startups.
**How to calculate:** Assess across dimensions: (1) Compiler maturity — can it compile standard models without manual optimization?, (2) Framework support — which ML frameworks are supported and how deeply?, (3) Developer adoption — number of external developers using the SDK, (4) Model coverage — percentage of top-100 models that run out-of-the-box, (5) Documentation quality and completeness.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No software plan | Basic compiler architecture designed, key hires identified | Compiler prototype working, framework integration plan, experienced SW team |
| Seed | Compiler doesn't work on real models | Compiler handles 30-60% of target models | Compiler handles >60% of models, PyTorch integration functional |
| Series A | <50% model coverage, no external developers | 50-80% model coverage, 10-50 external developers | >80% model coverage, >50 developers, 2+ framework integrations |
| Series B | Model coverage stagnating, developer complaints | 80-95% coverage, growing developer community | >95% coverage, active community, developers contributing upstream |

**Domain nuance:** CUDA compatibility layers (e.g., running CUDA code on non-NVIDIA hardware) dramatically accelerate adoption but add technical debt. Native compiler performance eventually needs to match or exceed CUDA-translated performance. Open-source SDK and compiler increase trust and adoption. Show the software team size relative to hardware team — successful chip companies typically have 1:1 or higher SW:HW ratios by Series B.

---

## Compute Services Metrics

### GPU Utilization Rate

> **Applies to: Compute Services.**

**What it is:** The percentage of total available GPU capacity that is actively being used by paying customers. Measures how efficiently the compute provider converts hardware assets into revenue.
**Why investors care:** GPU utilization directly determines the economics of a compute business. GPUs are expensive capital assets ([$20K-$40K per H100](https://example.com)). Low utilization means capital is sitting idle generating no revenue. High utilization indicates strong demand, good scheduling, and efficient operations.
**How to calculate:** (Total GPU-hours actively computing / Total GPU-hours available) x 100. Report separately for different GPU types (H100, A100, L40, etc.) and for different workload types (training, inference, fine-tuning).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | N/A (pre-deployment) | Demand commitments covering >50% of planned capacity | Demand commitments covering >80% of planned capacity |
| Seed | <40% utilization | 40-65% utilization | >65% utilization |
| Series A | <55% utilization | 55-75% utilization | >75% utilization |
| Series B | <65% utilization | 65-85% utilization | >85% utilization |

**Domain nuance:** Training workloads provide higher utilization (long-running, predictable) but lower margin per GPU-hour. Inference workloads are bursty (lower utilization) but higher margin. The best compute providers blend training and inference workloads to maximize utilization. Spot/preemptible instances can fill idle capacity but at lower prices. Report utilization by time of day/week to show peak vs. off-peak patterns. Multi-tenancy and workload scheduling sophistication are key differentiators.

---

### Cost per FLOP (Training) / Cost per Token (Inference)

> **Applies to: Compute Services, AI Infrastructure.**

**What it is:** The cost efficiency of the platform measured in the units that matter to customers — cost per floating-point operation for training workloads, and cost per token (or per 1K tokens) for inference workloads.
**Why investors care:** This is the pricing competitiveness metric. Customers compare compute providers on cost per unit of useful work. Lower cost per FLOP/token enables the provider to either undercut competitors on price or capture higher margins at market rates.
**How to calculate:** Training: Total customer cost / Total FLOPs delivered. Inference: Total customer cost / Total tokens processed. Normalize to standard benchmarks (e.g., cost to train GPT-3-equivalent, cost per 1M tokens of Llama 70B inference). Compare against AWS, GCP, Azure, and other GPU cloud providers.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No pricing model | Pricing modeled at 10-20% below hyperscaler rates | Pricing modeled at >20% below hyperscaler rates with margin plan |
| Seed | Price parity or higher than hyperscalers | 10-25% below hyperscaler pricing | >25% below hyperscaler pricing with positive unit economics |
| Series A | <15% price advantage vs hyperscalers | 15-30% price advantage | >30% price advantage sustained with healthy margins |
| Series B | Price advantage eroding | 20-35% advantage maintained | >30% advantage sustained at scale, improving through operational efficiency |

**Domain nuance:** Hyperscalers have massive purchasing power for GPUs and infrastructure. Startups compete through operational efficiency (higher utilization, optimized cooling, cheaper power), specialized offerings (bare-metal GPU access, better developer experience), or geographic arbitrage (data centers in lower-cost regions). Show the cost structure breakdown — power, hardware depreciation, networking, staff — and where the advantage comes from. Beware of companies competing solely on price without a structural cost advantage.

---

### Customer Retention (Monthly/Quarterly)

> **Applies to: Compute Services, AI Infrastructure, AI Applications.**

**What it is:** The percentage of customers (and more importantly, revenue) retained from one period to the next. For compute services, this includes both logo retention (did the customer stay?) and net dollar retention (did they spend the same or more?).
**Why investors care:** Compute is increasingly commoditized. Retention proves that the platform provides value beyond raw GPU access (developer experience, reliability, support, specialized features). High net dollar retention indicates customers are expanding their usage — the best possible signal for a compute business.
**How to calculate:** Logo retention: (Customers at end of period who were also customers at start) / Customers at start x 100. Net dollar retention (NDR): (Revenue from retained customers including expansion) / Revenue from those same customers in prior period x 100.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | N/A (pre-revenue) | Early design partners committed for >3 months | Design partners expanding usage month-over-month |
| Seed | Monthly logo retention <70% | Monthly logo retention 70-85% | Monthly logo retention >85%, NDR >100% |
| Series A | Quarterly logo retention <75%, NDR <90% | Quarterly retention 75-85%, NDR 90-110% | Quarterly retention >85%, NDR >110% |
| Series B | Quarterly retention <80%, NDR <100% | Quarterly retention 80-90%, NDR 100-120% | Quarterly retention >90%, NDR >120% |

**Domain nuance:** Compute services often see high initial churn as customers experiment, followed by sticky long-term relationships once workloads are in production. Separate "exploration" customers (trying the platform) from "production" customers (running real workloads). Production customer retention should be significantly higher than blended retention. Contract customers (committed spend) vs. on-demand (pay-as-you-go) have very different retention profiles. Show both.

---

### Capacity Growth Rate

> **Applies to: Compute Services.**

**What it is:** The rate at which the provider is adding GPU capacity — measured in total GPUs, petaFLOPS of available compute, or number of data center locations. Tracks the supply side of the business.
**Why investors care:** In a supply-constrained market (which AI compute has been since 2023), the ability to acquire and deploy GPUs is a competitive advantage. Growth rate shows whether the company can secure supply and scale to meet demand. However, capacity growth must be balanced with utilization — adding capacity faster than demand is capital destruction.
**How to calculate:** (GPU capacity at end of period / GPU capacity at start of period - 1) x 100. Report total GPUs by type, data center count, and geographic distribution.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No GPU supply secured | LOIs or commitments for initial cluster (100-1,000 GPUs) | Initial cluster deployed or purchase orders signed for 1,000+ GPUs |
| Seed | <50% QoQ capacity growth, demand outstripping supply | 50-100% QoQ growth, supply roughly matching demand | >100% QoQ growth with utilization maintained >60% |
| Series A | <30% QoQ growth, losing customers to supply constraints | 30-75% QoQ growth | >75% QoQ growth with utilization >65% |
| Series B | <20% QoQ growth, capacity constraints hurting retention | 20-50% QoQ growth, balanced with demand | >50% QoQ growth with utilization >70%, multi-region presence |

**Domain nuance:** Capacity growth must be paired with GPU procurement economics — are they buying GPUs at list price, getting volume discounts, or leasing? The GPU supply chain relationship (direct from NVIDIA, through distributors, second-hand market) matters. Ask about the capital efficiency: revenue generated per dollar of GPU capex. Companies with creative supply strategies (GPU financing, revenue-share with GPU owners, marketplace models) may grow faster with less capital.

---

### Revenue per GPU-Hour

> **Applies to: Compute Services.**

**What it is:** Average revenue generated per GPU-hour sold to customers. The core monetization metric for compute providers, equivalent to "revenue per room night" for hotels.
**Why investors care:** Combined with cost per GPU-hour (depreciation, power, networking, support), this determines per-unit gross margin. Revenue per GPU-hour trends reveal pricing power, customer mix quality, and competitive positioning.
**How to calculate:** Total compute revenue / Total GPU-hours sold to customers. Segment by GPU type (H100 vs A100 vs consumer GPUs), by workload (training vs inference), and by pricing tier (on-demand vs reserved vs spot).

**Benchmarks by stage (H100-equivalent):**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No pricing validated | Pricing at $2.00-$2.50/GPU-hr (below market) with customer interest | Pricing at $2.50-$3.50/GPU-hr validated with early commitments |
| Seed | <$1.50/GPU-hr or no paying customers | $1.50-$2.50/GPU-hr | >$2.50/GPU-hr with growing customer base |
| Series A | <$1.50/GPU-hr or declining trend | $1.50-$2.50/GPU-hr, stable | >$2.50/GPU-hr or rising trend, healthy mix of on-demand and reserved |
| Series B | <$1.50/GPU-hr, pricing pressure from competition | $1.50-$2.50/GPU-hr, stable margins | >$2.00/GPU-hr with >50% gross margin, premium justified by platform value |

**Domain nuance:** GPU-hour pricing varies significantly by GPU generation and availability. H100 pricing has been volatile — from $4+/hr during peak scarcity to sub-$2/hr as supply normalized. The benchmarks above will shift with market conditions. Revenue per GPU-hour alone is insufficient — always pair with cost per GPU-hour to show margin. Companies that add value beyond raw compute (managed services, optimized inference, auto-scaling) can command premium pricing. Show the blended vs. segmented view — a high blended number from one premium customer is less valuable than a solid average across many customers.
