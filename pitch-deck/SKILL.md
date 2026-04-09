---
name: pitch-deck
description: >
  Pitch deck outline designer — generates a slide-by-slide deck outline tailored to your target VC's
  preferences. Supports YC Demo Day format and General Series A format. Tailors to specific VCs
  (a16z, Sequoia, Benchmark, etc.) based on their known preferences.
  Use when the user asks "help me build my deck", "pitch deck", "design my pitch deck",
  "deck structure", "pitch deck outline", or mentions building a presentation for investors.
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → ▶ /pitch-deck → /pitch.
---

# /pitch-deck — Pitch Deck Outline Designer

The deck should be built after you understand your metrics, strategy, and target investors — it's
the synthesis of everything you've prepared so far.

## Workflow Context

This command is **Step 4** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → ▶ /pitch-deck → /pitch
```

## Flow

1. **Check for prior context:** Read all prior `.fundraising/` documents (readiness assessment,
   metrics, strategy, execution plan). Show: "📄 Found your [documents]. Using that context
   to tailor the deck."

2. **Use context from prior commands** if available (stage, metrics scorecard, strategy, target VCs).
   Otherwise ask: stage, target VC (or "general"), and business details (problem, solution, market,
   traction, team, ask).

3. **Load the appropriate deck template** from `../fundraising/references/deck-templates/`
   (yc-demo-day.md or general-series-a.md).

4. **If a target VC is specified**, load their individual profile from `../fundraising/references/vc-profiles/`
   (e.g., `a16z.md`, `sequoia.md`) to tailor the deck to their preferences.

5. **Generate a slide-by-slide outline:**
   - For each slide: title, key message (1 sentence), supporting data points, design notes
   - Tailor to VC preferences:
     - a16z: emphasize TAM/SAM/SOM, network effects, platform potential
     - Sequoia: lead with "why now?", market timing narrative
     - Benchmark: product-focused, less slides, more demo
     - YC Demo Day: 2 minutes, 5-8 slides, traction-heavy
     - General: standard narrative arc

6. Call out what's **strong** and what's **weak** in their story.

7. Suggest specific data points they need to find or generate.

8. Output as a structured document usable as a brief for actual slide creation.

9. **Save document:** Write the full deck outline to `.fundraising/pitch-deck-outline-{YYYY-MM-DD}.md`
   with YAML frontmatter. Append a timeline entry.

10. **Next step prompt:** "✅ Deck outline complete. Saved to `.fundraising/pitch-deck-outline-{date}.md`.
    [N] slides tailored for [VC/general].
    Next: run `/pitch` to practice your pitch with a simulated VC partner."
