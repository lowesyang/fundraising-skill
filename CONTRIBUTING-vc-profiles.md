# Contributing: VC Profiles

**Location:** `fundraising/references/vc-profiles/{slug}.md`

**Naming:** lowercase kebab-case slug (e.g., `greylock.md`, `hong-shan.md`, `founders-fund.md`)

**Required YAML frontmatter:**

```yaml
---
name: "Firm Name"
slug: firm-slug
tier: seed | series-ab | growth
stage_focus: [pre-seed, seed, series-a, series-b, growth, pre-ipo]
check_size: "$XM-$YM"
website: "https://example.com"
contributed_by: "github-username"
---
```

**Required sections (in this order):**

```markdown
## Firm Name

**Key Partners:** [names of active/well-known partners]
**Stage Focus:** [stages they invest in]
**Typical Check Size:** [$X - $Y]
**Investment Thesis:** [1-2 paragraphs from public statements — cite sources]
**Portfolio Highlights:** [5-10 notable companies]
**Sector Preferences:** [industries/verticals they gravitate toward]

### Behavioral Model
**Meeting Style:** [formal/casual, duration, energy, preparation level]
**Signature Questions:**
- [3-5 questions this firm/partner is known for asking]
**What Gets Them Excited:** [specific patterns they look for]
**Red Flags For Them:** [what makes them pass]
**Decision Process:** [solo GP vs partnership vote, timeline]
**Unique Quirks:** [distinctive behaviors that differentiate this firm]

### For the /pitch Simulator
**Opening Style:** [how they start meetings]
**Push-back Patterns:** [how they challenge founders — be specific]
**Closing Signals:**
- *Positive:* [signals the meeting went well]
- *Negative:* [signals they're passing]
**Internal Discussion:** [what they'd say about the founder after they leave — both bull and bear case]
```

**Quality rules:**
- Public information only — websites, podcasts, blog posts, interviews. No insider info.
- Be specific, not generic — "asks tough questions" is useless; "lets silence hang for 5 seconds after your answer" is gold.
- Each VC must feel distinct in simulation.
- One firm per file.
- After adding, update the table in `fundraising/references/vc-profiles/_index.md`.
