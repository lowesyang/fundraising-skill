# Biotech Metrics — Stage-Specific Benchmarks

> Used by the `/product-metrics` command to grade a biotech founder's numbers with RED/YELLOW/GREEN thresholds.

## Sub-domain Classification

Before evaluating metrics, first ask the founder which type of biotech company they are building.
The metrics that matter vary dramatically by sub-domain — a pre-revenue therapeutics company and a commercialized diagnostics company are evaluated on entirely different dimensions:

| Sub-domain | Description | Examples |
|-----------|-------------|---------|
| **Therapeutics** | Drug discovery, development, clinical trials | Moderna, BioNTech, Recursion |
| **Diagnostics** | Testing, screening, precision medicine | 23andMe, Grail, Tempus |
| **Digital Health** | Software for healthcare delivery, telemedicine | Teladoc, Hims, Noom |
| **Synthetic Biology** | Engineering biology for materials, food, chemicals | Ginkgo Bioworks, Zymergen |
| **MedTech** | Medical devices, surgical tools, implants | Intuitive Surgical, Dexcom |

### Metrics by Sub-domain

**Therapeutics** — focus on:
- Pipeline stage distribution (the core metric — everything flows from this)
- Probability of success by phase
- Patent portfolio (protection of lead compounds)
- Regulatory pathway clarity (FDA designation, orphan drug status)
- Partnership/licensing deals (validation and non-dilutive capital)
- Cash runway (existential — therapeutics companies burn for years pre-revenue)
- Clinical trial enrollment rate
- SKIP: Revenue per patient (pre-revenue for years), Market penetration (too early)
- ADD: IND-enabling study progress, CMC (chemistry/manufacturing/controls) readiness

**Diagnostics** — focus on:
- Revenue per patient / per test (if commercialized)
- Market penetration (test volume growth)
- Regulatory pathway clarity (510(k), PMA, CLIA/CAP, LDT pathway)
- Patent portfolio
- Cash runway
- Clinical trial enrollment rate (for clinical validation studies)
- Partnership/licensing deals (lab networks, health system partnerships)
- SKIP: Pipeline stage distribution (different regulatory framework)
- ADD: Test sensitivity/specificity, reimbursement coverage (payer mix), sample-to-result turnaround time

**Digital Health** — focus on:
- Revenue per patient (subscription or per-visit revenue)
- Market penetration (enrolled lives, active users)
- Cash runway
- Partnership/licensing deals (health system and payer contracts)
- Regulatory pathway clarity (if FDA-regulated: SaMD classification)
- SKIP: Pipeline stage distribution, Probability of success by phase (software, not drugs)
- ADD: Clinical outcomes data (efficacy evidence), patient engagement/retention, NPS, gross margin (use SaaS metrics as supplement)

**Synthetic Biology** — focus on:
- Pipeline stage distribution (reframe as "programs by development stage")
- Partnership/licensing deals (critical — synbio often co-develops with partners)
- Patent portfolio (engineered organisms, pathways, processes)
- Cash runway (long development cycles, capital-intensive)
- SKIP: Clinical trial enrollment (not applicable for non-pharma applications), Revenue per patient
- ADD: Strain/organism performance metrics (titer, rate, yield), production scale-up progress, unit economics at pilot vs commercial scale

**MedTech** — focus on:
- Regulatory pathway clarity (510(k), PMA, De Novo — pathway determines timeline and cost)
- Revenue per patient / per procedure (if commercialized)
- Market penetration (procedures performed, units placed)
- Patent portfolio
- Cash runway
- Clinical trial enrollment rate (for pivotal studies)
- Partnership/licensing deals (distribution, GPO contracts)
- SKIP: Pipeline stage distribution (different framework)
- ADD: Surgeon/physician adoption rate, procedure time improvement, complication rate vs standard of care, razor/blade revenue model metrics

---

### Pipeline Stage Distribution

> **Applies to: Therapeutics (critical), Synthetic Biology (reframe as program stages).** Less directly applicable to Diagnostics, Digital Health, and MedTech, which have different development frameworks.

**What it is:** The distribution of a company's drug candidates (or programs) across development stages: discovery, preclinical, IND-enabling, Phase 1, Phase 2, Phase 3, and NDA/BLA filed. This includes the number of assets at each stage, the therapeutic areas targeted, and the mechanism of action diversity.

**Why investors care:** Pipeline breadth and stage advancement are the primary value drivers for pre-revenue therapeutics companies. A single-asset company in Phase 1 is a binary bet; a company with multiple assets across stages has diversified risk. Advancing an asset from preclinical to Phase 1 or from Phase 2 to Phase 3 are major value inflection points that often trigger financing rounds. Investors also assess whether the pipeline reflects a platform (can generate many candidates efficiently) or a collection of one-offs.

**How to calculate:** List each program/asset with: target indication, mechanism of action, current stage, expected next milestone, and timeline to that milestone. Present as a pipeline chart showing stage distribution. Include both wholly-owned and partnered assets.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Single target in early discovery, no validated biology | 1-2 targets with validated biology, approaching lead optimization | 2-3 targets, lead compound identified, in vitro/in vivo data |
| Seed | Still in discovery with no IND-enabling candidate | 1 program in IND-enabling studies, 1-2 in discovery | Lead program filing IND within 12 months, 2+ backup programs |
| Series A | No program past Phase 1, pipeline not advancing | 1 program in Phase 1 with initial safety data, 1-2 preclinical | Lead program in Phase 1/2 with encouraging data, 2-3 programs across stages |
| Series B | Lead program stalled or failed, no backup advancing | Lead in Phase 2 with mixed data, limited pipeline behind it | Lead program in Phase 2/3 with strong data, 3+ programs, platform generating new candidates |

**Domain nuance:** For platform companies (Recursion, Insitro), the platform's ability to generate candidates efficiently matters more than any single asset. Investors look at "shots on goal per dollar" — how many programs can the platform produce relative to spend. Orphan drug designations (rare diseases) can compress timelines and reduce required trial sizes. Oncology programs often advance faster due to accelerated approval pathways. Synthetic biology companies should map programs to: strain development, pilot scale, demonstration scale, commercial scale.

---

### Probability of Success by Phase

> **Applies to: Therapeutics (critical).** Partially relevant to MedTech (device clinical studies) and Diagnostics (clinical validation). Not directly applicable to Digital Health and Synthetic Biology.

**What it is:** The historical and estimated probability that each drug candidate will successfully advance from its current phase to the next, and ultimately to FDA approval. This is assessed based on therapeutic area, mechanism of action, biomarker strategy, trial design, and clinical data quality.

**Why investors care:** Drug development is inherently probabilistic. The industry-wide probability of success from Phase 1 to approval is approximately 10-15%. Investors use phase-specific success probabilities to calculate risk-adjusted net present value (rNPV) of the pipeline. A company that can demonstrate above-average probability of success — through better patient selection, validated biomarkers, or differentiated mechanisms — commands a premium valuation.

**How to calculate:** Compare the company's programs against industry base rates by therapeutic area and phase. Adjustments based on: biomarker-driven patient selection (+), novel mechanism with no clinical precedent (-), orphan/rare disease (+), validated surrogate endpoints (+), prior phase data strength (+/-). Present as a waterfall from current phase to approval with probabilities at each gate.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | Novel target with no clinical validation, <5% estimated PoS | Target with preclinical validation, 5-10% estimated PoS | Validated target/mechanism, biomarker strategy, 10-15% PoS |
| Seed | Phase 1 program with below-average PoS indicators | Phase 1 with industry-average PoS (~15% to approval) | Phase 1 with biomarker enrichment or fast-track, estimated PoS >20% |
| Series A | Phase 2 with weak/ambiguous efficacy signal | Phase 2 with modest efficacy signal, ~25-30% PoS to approval | Phase 2 with strong efficacy signal, breakthrough therapy or orphan, >35% PoS |
| Series B | Phase 2/3 with safety concerns or mixed data | Phase 3 with standard PoS (~50-60% from Phase 3 to approval) | Phase 3 with strong Phase 2 data, validated endpoint, >65% PoS to approval |

**Domain nuance:** Industry base rates vary dramatically by therapeutic area: oncology Phase 1-to-approval is ~5-8%, rare disease is ~15-25%, and anti-infectives are ~15-20%. Biomarker-selected trials have approximately 2x higher success rates. First-in-class mechanisms have lower PoS than best-in-class follow-ons. Gene therapy and cell therapy have unique risk profiles that do not fit standard base rates. Investors increasingly weight "clinical proof-of-concept" data (Phase 1b/2a efficacy signals) as the key de-risking milestone.

---

### Patent Portfolio

> **Applies to: All sub-domains.** Critical for Therapeutics (composition of matter patents protect drug exclusivity), MedTech (device IP is defensible), and Synthetic Biology (engineered organism patents). Important for Diagnostics (method and biomarker patents). Less central for Digital Health but still matters for defensibility.

**What it is:** The collection of issued patents, pending applications, and provisional filings that protect the company's intellectual property. Evaluated on: number of patents, breadth (do they cover the composition, method of use, formulation, manufacturing, and delivery?), remaining patent life, geographic coverage, and freedom to operate (FTO) relative to competitors.

**Why investors care:** In biotech, patents are the moat. A therapeutic with composition of matter patent protection has 15-20 years of market exclusivity. Without strong IP, a company's drug or device can be copied the moment it proves the market exists. Patent portfolio quality also determines licensing and M&A value — acquirers pay premiums for clean, broad IP. Freedom to operate is equally important — a company with great patents that infringes someone else's IP faces injunctions or costly licensing.

**How to calculate:** Number of issued patents + pending applications. Categorize by type: composition of matter, method of use, formulation/delivery, manufacturing process, diagnostic method, device design. Report remaining patent life for key assets (from earliest priority date). Include FTO analysis status (has a formal search been conducted?).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No provisional filings, IP unprotected | 1-2 provisional applications filed, FTO not yet assessed | Provisionals filed on core IP, preliminary FTO clear, IP strategy defined |
| Seed | Only provisionals, no issued patents, FTO unclear | 2-5 pending applications, FTO analysis underway, no blocking IP identified | 1+ issued patents, 3+ pending, clean FTO, composition of matter coverage |
| Series A | Narrow IP coverage, FTO concerns, or pending litigation | 3-5 issued patents with reasonable breadth, FTO clear for lead programs | 5-10 issued patents, broad coverage (composition + method + formulation), international filings, clean FTO |
| Series B | Patent challenges or narrow remaining life (<8 years) | Solid portfolio (10+ patents) with some coverage gaps | Comprehensive portfolio (15+ patents), broad geographic coverage, >10 years remaining life on core IP, no material FTO risks |

**Domain nuance:** Therapeutics: composition of matter patents are the gold standard — they protect the molecule itself, not just its use. Method of use patents are weaker but can extend exclusivity. Biologics have additional protection through regulatory exclusivity (12 years in the US). Diagnostics: biomarker patents are under legal scrutiny post-Myriad Genetics (natural phenomena are not patentable); method patents and proprietary algorithms are the path forward. MedTech: design patents complement utility patents. Synthetic Biology: engineered organism patents are complex and evolving — trade secrets (proprietary strain libraries) often supplement patent protection. For all sub-domains, patent term adjustments (PTA) and patent term extensions (PTE) can add 1-5 years of effective life.

---

### Regulatory Pathway Clarity

> **Applies to: All sub-domains.** Critical for Therapeutics (FDA IND/NDA pathway), MedTech (510(k)/PMA/De Novo), and Diagnostics (CLIA/LDT/510(k)/PMA). Important for Synthetic Biology (EPA, USDA for bio-based products). Relevant for Digital Health if the product is FDA-regulated Software as a Medical Device (SaMD).

**What it is:** The clarity and credibility of the company's plan to achieve regulatory approval or clearance for its product. This includes: identified regulatory pathway, pre-submission meetings with regulators, designated status (breakthrough, fast track, orphan, QIDP), clinical study design alignment with regulatory requirements, and timeline to approval.

**Why investors care:** Regulatory risk is one of the top three risks in biotech investing (alongside clinical and commercial risk). A company that has had a productive pre-IND or pre-submission meeting with the FDA, secured a special designation, or chosen a well-precedented pathway dramatically reduces investor risk. Conversely, a company with an unclear regulatory path — no FDA interaction, unvalidated endpoints, novel pathway with no precedent — carries enormous risk that can delay or destroy the investment.

**How to calculate:** Assess on a qualitative framework: (1) Has the company identified the specific regulatory pathway? (2) Has there been formal FDA/EMA interaction (pre-IND, pre-submission, Type A/B/C meeting)? (3) Has the company received any special designations? (4) Are the chosen clinical endpoints validated and accepted by regulators? (5) Is the regulatory timeline realistic based on precedent? Score each dimension and present overall readiness.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No regulatory strategy, pathway unclear | Regulatory pathway identified, no FDA interaction yet | Regulatory strategy defined with experienced regulatory counsel, pathway precedented |
| Seed | Pathway unclear or relying on novel/unprecedented approach | Pathway identified, pre-IND or pre-submission meeting requested | Pre-IND/pre-submission meeting completed with positive feedback, clear study design |
| Series A | No FDA interaction, regulatory concerns unresolved | FDA interaction completed, some open questions on endpoints or design | Breakthrough/fast-track/orphan designation, FDA-aligned study design, clear path |
| Series B | Regulatory setback (CRL, clinical hold) with no clear resolution | On track but standard pathway, no special designations | Special designation(s) obtained, pivotal study design FDA-agreed, submission timeline credible |

**Domain nuance:** Therapeutics: IND filing is the first major regulatory milestone. Breakthrough therapy designation (BTD) signals FDA engagement and can accelerate review by 3-4 years. Orphan drug designation provides 7 years market exclusivity and tax credits. Diagnostics: LDT (lab-developed test) pathway allows commercialization without FDA clearance but limits scale; 510(k) clearance enables broader distribution; PMA is required for high-risk diagnostics. MedTech: 510(k) (predicate-based) is faster (6-12 months) than PMA (18-36 months) or De Novo (12-18 months). Digital Health: FDA's SaMD framework has evolved — many digital health tools are exempt from regulation, but clinical decision support tools may require clearance. Synthetic Biology: regulatory landscape is fragmented across FDA, EPA, USDA depending on the application (food, materials, chemicals, therapeutics).

---

### Partnership / Licensing Deals

> **Applies to: All sub-domains.** Most critical for Therapeutics and Synthetic Biology (pharma partnerships validate science and provide non-dilutive capital). Important for Diagnostics (lab network and health system partnerships), MedTech (distribution and co-marketing), and Digital Health (payer and health system contracts).

**What it is:** Agreements with larger companies (pharma, medical device, chemical, agriculture) that provide validation, non-dilutive capital, and commercial capabilities. Includes: licensing deals (out-licensing IP to a partner), co-development agreements, option deals, strategic collaborations, and distribution partnerships. Evaluated on deal structure (upfront payment, milestones, royalties, equity investment) and partner quality.

**Why investors care:** A partnership with a top-20 pharma or medtech company is one of the strongest signals of technical and commercial validation in biotech. These companies have deep scientific teams that conduct extensive diligence before committing. The deal terms also reveal how the market values the company's assets. Non-dilutive capital from partnerships extends runway without diluting founders and investors. At later stages, partnerships can provide the commercial infrastructure (sales force, distribution, reimbursement expertise) that a startup lacks.

**How to calculate:** List all partnerships with: partner name and tier, deal structure (upfront, milestones, royalties), total potential deal value, non-dilutive capital received to date, and stage of the collaboration. For multiple deals, present aggregate partnership economics.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No industry relationships or interest | Early conversations with potential partners, advisory board includes industry veterans | LOI or MTA (material transfer agreement) with pharma/industry partner, sponsored research |
| Seed | No partnerships, no industry validation | 1 active collaboration (research-stage), modest deal value | 1+ partnerships with recognized companies, $1-5M in non-dilutive funding |
| Series A | No partnerships despite multiple attempts | 1-2 partnerships with modest terms ($5-15M total deal value) | 1+ partnership with top-20 pharma/medtech, $15-50M total deal value, meaningful upfront |
| Series B | Partnerships stalled or terminated | Active partnerships with $50-100M total deal value | Multiple partnerships, $100M+ aggregate deal value, options exercised or milestones achieved |

**Domain nuance:** Therapeutics: the gold standard is a licensing deal with a top-10 pharma company with significant upfront payment ($20M+). Option deals (partner pays for the right to license later) are increasingly common and validate without giving up control. Diagnostics: partnerships with reference labs (Quest, LabCorp) or health systems for distribution are the equivalent. Digital Health: payer contracts (Aetna, UnitedHealth) and health system deployments (Kaiser, HCA) serve as partnership validation. Synthetic Biology: strategic partnerships with chemical, food, or materials companies (BASF, ADM, Cargill) validate the platform. MedTech: distribution partnerships with established medtech companies (Medtronic, J&J, Stryker) provide commercial reach. Always distinguish between real partnerships (significant capital committed) and PR-friendly "collaborations" (little substance).

---

### Cash Runway

> **Applies to: All sub-domains.** Existentially critical for Therapeutics (years of burn before revenue) and Synthetic Biology (capital-intensive scale-up). Very important for Diagnostics and MedTech (long development cycles). Important for Digital Health (though closer to standard startup economics).

**What it is:** The number of months the company can continue operating at its current burn rate before running out of cash. Calculated from current cash on hand, monthly net burn, and any committed non-dilutive funding. In biotech, runway must be evaluated relative to the next value-creating milestone — raising with insufficient runway to reach a milestone puts the company in a weak negotiating position.

**Why investors care:** Biotech companies, particularly therapeutics, can burn cash for 5-15 years before generating revenue. Running out of cash before reaching a value-inflection milestone (Phase 1 data, FDA clearance, commercial launch) is the most common way biotech companies die. Investors want to see that a raise provides enough runway to reach the next milestone with 6+ months of buffer. Companies that raise with <6 months runway are in "desperation mode" and accept punitive terms.

**How to calculate:** Cash runway (months) = current cash and equivalents / monthly net burn rate. Also calculate runway including committed non-dilutive funding (grants, partnership payments). Present alongside: next major milestone, estimated cost to reach it, and months of buffer beyond the milestone.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | <6 months runway | 6-12 months runway | >12 months runway to next milestone with buffer |
| Seed | <12 months runway or insufficient to reach next milestone | 12-18 months runway, reaches milestone with <3 months buffer | >18 months runway, reaches next milestone with 6+ months buffer |
| Series A | <12 months runway | 12-18 months runway, reaches Phase 2 data or key milestone | >18 months runway, clearly reaches next value inflection with 6+ months buffer |
| Series B | <15 months runway | 15-24 months runway | >24 months runway, sufficient to reach Phase 3 data or commercial launch |

**Domain nuance:** Therapeutics companies should raise enough to reach the next clinical data readout plus 6 months — this is non-negotiable. Running a Phase 2 trial costs $10-50M; running out mid-trial is catastrophic. The "18-month rule" is the biotech standard: raise enough for 18+ months to give time for the next round. Diagnostics and MedTech have shorter but still substantial development timelines — plan for 15-18 months. Digital health companies can apply standard startup runway benchmarks (12-18 months). Synthetic biology is uniquely capital-intensive at scale-up — going from lab to pilot to demonstration scale can cost $50-200M. Always ask about the milestone bridge: "Does this round get you to a data readout or regulatory milestone that supports a higher-valuation next round?"

---

### Clinical Trial Enrollment Rate

> **Applies to: Therapeutics (critical), MedTech (pivotal studies), Diagnostics (clinical validation studies).** Not directly applicable to Digital Health and Synthetic Biology.

**What it is:** The rate at which patients are screened, enrolled, and randomized into clinical trials, measured against the enrollment plan. Reported as patients per site per month, total enrollment versus target, and screen-to-enrollment conversion rate (screen failure rate). Also includes site activation rate (time from site selection to first patient enrolled).

**Why investors care:** Clinical trials are the most expensive and time-sensitive phase of drug/device development. Slow enrollment is the number one cause of clinical trial delays, which directly burns cash and pushes back value milestones. An enrollment rate that is 50% below plan means the trial takes twice as long and costs significantly more than budgeted. Investors want evidence that the company can recruit patients efficiently — this requires understanding the patient population, site selection, eligibility criteria, and competing trials.

**How to calculate:** Enrollment rate = patients enrolled per site per month (average across all active sites). Also report: total enrolled vs target, screen failure rate (screened but not enrolled / total screened x 100), time to first patient enrolled (from site activation), and enrollment trajectory (accelerating, flat, or decelerating).

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | No enrollment plan, patient population unclear | Patient population identified, enrollment feasibility assessed | Patient access strategy validated, KOL relationships, patient registry access |
| Seed | Enrollment plan unrealistic given patient population | Enrollment plan aligned with indication precedent, sites identified | Sites selected, IRB/ethics approved, enrollment beginning on schedule |
| Series A | Enrollment >30% behind plan, high screen failure rate (>50%) | Enrollment within 80-100% of plan, screen failure 30-50% | Enrollment at or above plan, screen failure <30%, sites activating on schedule |
| Series B | Enrollment stalled, trial timeline slipping >6 months | Enrollment on track but slower than planned, minor delays | Enrollment ahead of schedule, multiple geographies, strong site productivity |

**Domain nuance:** Enrollment rates vary dramatically by indication: common conditions (diabetes, hypertension) enroll faster than rare diseases (orphan indications may have <10,000 patients globally). Oncology trials in heavily pre-treated populations face fierce competition for patients. Decentralized/virtual trial designs can accelerate enrollment 2-3x for appropriate indications. Screen failure rates above 50% indicate overly restrictive eligibility criteria or poor site/patient matching. MedTech pivotal studies typically enroll faster than drug trials because procedures are shorter-duration. Pediatric trials face unique enrollment challenges. International multi-center trials can accelerate enrollment but add regulatory complexity.

---

### Revenue Metrics (Commercialized Products)

> **Applies to: Diagnostics (commercialized tests), Digital Health (subscription/per-visit), MedTech (commercialized devices/procedures).** Applicable to Therapeutics and Synthetic Biology only post-commercialization. Use these metrics only when the company has a product generating revenue.

**What it is:** For commercialized biotech/medtech products, two key revenue metrics: (1) Revenue per patient — the average revenue generated per patient/user/test, reflecting pricing power and reimbursement; (2) Market penetration — the percentage of the addressable patient population using the product, reflecting commercial traction.

**Why investors care:** Once a biotech product is commercialized, the investment thesis shifts from clinical risk to commercial execution risk. Revenue per patient reveals pricing sustainability and reimbursement health — if payers are pushing back, revenue per patient declines. Market penetration reveals the growth runway — a product at 2% penetration of a large market has enormous upside; a product at 40% penetration is approaching saturation. Together, these metrics determine the commercial trajectory and ultimate market size capture.

**How to calculate:** Revenue per patient = total product revenue / number of unique patients treated (or tests performed) in the period. Market penetration = patients using the product / total addressable patient population x 100. For diagnostics: revenue per test = total test revenue / number of tests performed. Track trends quarterly.

**Benchmarks by stage:**
| Stage | RED | YELLOW | GREEN |
|-------|-----|--------|-------|
| Pre-seed | N/A — pre-commercial | N/A — pre-commercial | N/A — pre-commercial |
| Seed | Product launched but revenue per patient declining, reimbursement uncertain | Stable revenue per patient, early reimbursement coverage | Revenue per patient at or above target, favorable payer decisions |
| Series A | <1% market penetration 12+ months post-launch, pricing pressure | 1-5% market penetration, revenue per patient stable | >5% market penetration, revenue per patient growing, broad payer coverage |
| Series B | Penetration stalling <5%, revenue per patient declining | 5-15% market penetration, stable unit economics | >15% market penetration growing, revenue per patient stable or increasing, international expansion |

**Domain nuance:** Diagnostics: revenue per test ranges from $50-200 for routine tests to $3,000-5,000 for complex genomic tests (Foundation Medicine, Grail). Reimbursement (CPT code and coverage determination) is the gating factor — a test without reimbursement is limited to cash-pay or institutional purchases. Digital Health: revenue per patient/user typically follows subscription models ($20-200/month) or per-visit models ($50-250/visit). Payer coverage for digital health varies enormously. MedTech: revenue per procedure includes the device plus disposables/consumables. Razor-and-blade models (low device cost, high consumable revenue) are favored by investors because of recurring revenue. Therapeutics: post-launch revenue per patient depends on therapy cost, duration, and competitive landscape — specialty drugs can be $50,000-500,000+ per patient per year. Market penetration should be tracked by sub-segment (line of therapy, patient subtype, geography) to identify where traction is strongest.
