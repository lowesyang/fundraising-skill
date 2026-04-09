---
title: "VC Profiles Directory"
description: "Community-maintained profiles of venture capital firms for fundraising preparation and pitch practice."
---

# VC Profiles Directory

A community-maintained collection of detailed VC firm profiles. Each profile includes investment thesis, behavioral models, signature questions, and pitch simulator data to help founders prepare for meetings with specific firms.

## Available Profiles

| Firm | Slug | Tier | Stage Focus | Check Size | File |
|------|------|------|-------------|------------|------|
| Y Combinator | `yc` | Seed | Pre-seed, Seed | $500K | [yc.md](yc.md) |
| First Round Capital | `first-round` | Seed | Pre-seed, Seed | $1M-$5M | [first-round.md](first-round.md) |
| Andreessen Horowitz | `a16z` | Series A/B | Seed to Growth | $10M-$100M+ | [a16z.md](a16z.md) |
| Sequoia Capital | `sequoia` | Series A/B | Seed to Growth | $10M-$75M+ | [sequoia.md](sequoia.md) |
| Benchmark | `benchmark` | Series A/B | Series A, B | $10M-$50M | [benchmark.md](benchmark.md) |
| Accel | `accel` | Series A/B | Seed to Growth | $10M-$60M | [accel.md](accel.md) |
| Lightspeed Venture Partners | `lightspeed` | Series A/B | Seed to Growth | $10M-$75M | [lightspeed.md](lightspeed.md) |
| Tiger Global | `tiger-global` | Growth | Series B to Pre-IPO | $25M-$200M+ | [tiger-global.md](tiger-global.md) |

## Contributing a New VC Profile

We welcome contributions! To add a new VC profile, submit a PR with a new `.md` file in this directory.

### Steps

1. Fork the repository
2. Create a new file in `fundraising/references/vc-profiles/` using the slug as the filename (e.g., `greylock.md`)
3. Follow the profile template below
4. Submit a PR with a brief description of the firm and why it should be included

### Profile Template

```markdown
---
name: "Firm Name"
slug: firm-slug
tier: seed | series-ab | growth
stage_focus: [pre-seed, seed, series-a, series-b, growth, pre-ipo]
check_size: "$XM-$YM"
website: "https://example.com"
contributed_by: "your-github-username"
---

## Firm Name

**Key Partners:** Partner names
**Stage Focus:** Description of stages they invest in
**Typical Check Size:** Dollar range with context
**Investment Thesis:** 3-5 sentences on what the firm believes and how they invest.
**Portfolio Highlights:** 8-12 notable portfolio companies
**Sector Preferences:** Sectors they focus on with nuance.

### Behavioral Model
**Meeting Style:** How meetings feel -- format, duration, energy, preparation level.
**Signature Questions:**
- 5 questions this firm is known for asking
**What Gets Them Excited:** What makes a partner lean in.
**Red Flags For Them:** What makes them pass.
**Decision Process:** How they make investment decisions, timeline, and structure.
**Unique Quirks:** What makes this firm culturally distinctive.

### For the /pitch Simulator
**Opening Style:** How the partner opens the meeting.
**Push-back Patterns:** How they challenge founders during a pitch.
**Closing Signals:**
- *Positive:* Signals that the meeting went well.
- *Negative:* Signals that they're passing.
**Internal Discussion:** What partners say about the company after the founder leaves the room -- both bull and bear cases.
```

### Guidelines

- **Accuracy matters.** Profiles should reflect the firm's actual behavior, not generic VC stereotypes. Cite public sources (blog posts, podcasts, published theses) where possible.
- **Be specific.** Generic descriptions like "they like good founders" are not useful. Describe what "good" means to this specific firm.
- **Include both bull and bear.** The pitch simulator sections need realistic positive and negative signals.
- **Keep frontmatter consistent.** Use the exact field names and value formats shown in the template. The `tier` field must be one of: `seed`, `series-ab`, `growth`. The `stage_focus` array should use: `pre-seed`, `seed`, `series-a`, `series-b`, `growth`, `pre-ipo`.
- **One firm per file.** Each file covers a single VC firm.
