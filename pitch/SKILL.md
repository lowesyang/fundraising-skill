---
name: pitch
description: >
  Hyper-realistic VC pitch simulation — practice pitching to AI versions of real VC firms
  (a16z, Sequoia, Benchmark, YC, Tiger Global, First Round, Accel, Lightspeed). Each VC has
  distinct behavioral styles, signature questions, and evaluation criteria. Includes structured
  debrief with 5-dimension scoring and actionable investor feedback.
  Use when the user asks "practice my pitch", "simulate a VC meeting", "pitch practice",
  "mock interview", "pitch to [VC name]", or wants to rehearse a fundraising conversation.
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → ▶ /pitch.
---

# /pitch — Hyper-Realistic VC Simulation & Investor Feedback

The flagship command. The goal is to make founders feel like they're in an actual partner
meeting — not a generic interview. Each VC should feel distinctly different.

## Workflow Context

This command is **Step 5** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → ▶ /pitch
```

## Legal Disclaimer

Include this at the start: "VC simulations are for practice purposes only and do not
represent actual firm views or investment decisions."

## Flow

1. **Check for prior context:** Read `.fundraising/pitch-deck-outline-*.md` and prior pitch
   simulations in `.fundraising/pitch-simulations/`. If prior pitches exist, reference
   accumulated feedback.

2. **Use context from prior commands** if available (startup description, stage, deck outline).
   Otherwise ask: describe your startup in 2-3 sentences, and your current stage.

3. **Present VC selection** via AskUserQuestion, filtered by stage:
   - Pre-seed/Seed: YC, First Round, Floodgate, Precursor Ventures, Hustle Fund + Angels (Naval Ravikant, Elad Gil, Jason Calacanis, Peter Thiel, Elon Musk, Ron Conway, Marc Andreessen, Reid Hoffman)
   - Series A/B: a16z, Sequoia, Benchmark, Accel, Lightspeed + Angels (Elad Gil, Peter Thiel, Marc Andreessen, Reid Hoffman)
   - Growth: Tiger Global

4. **Load the selected VC's profile** from `../fundraising/references/vc-profiles/`. Each VC has its
   own file (e.g., `yc.md`, `sequoia.md`, `a16z.md`). Read `_index.md` first for the full list of
   available VCs.

5. **Run the simulation:**
   - Assume the VC partner's persona completely — their speech patterns, their priorities, their quirks
   - Run 8-12 exchanges (one exchange = one founder message + one VC response)
   - The first 2-3 exchanges are the founder's pitch; remaining are VC Q&A
   - Ask questions consistent with the VC's known style (loaded from profile)
   - Reference the VC's actual portfolio where relevant
   - Use the VC's push-back patterns and closing signals from the profile

6. **Deliver a verdict:** PASS / FOLLOW-UP MEETING / TERM SHEET — with reasoning tied to that VC's
   specific thesis.

7. **DEBRIEF:**
   - "Here's what [VC name] was actually evaluating at each exchange"
   - Score across 5 dimensions (1-10):
     - **Problem clarity** (1=vague, 10=specific, urgent, quantified pain)
     - **Market conviction** (1=no evidence, 10=bottom-up TAM with clear wedge)
     - **Team strength** (1=no relevant experience, 10=domain experts with unfair advantage)
     - **Traction evidence** (1=no data, 10=strong growth with cohort analysis)
     - **Ask specificity** (1=no clear ask, 10=specific amount, use of funds, milestones)
   - Composite: 7+ avg = TERM SHEET, 5-7 = FOLLOW-UP MEETING, <5 = PASS
   - "What you did well / What to improve" — specific, actionable, per dimension
   - "If this were real, here's what they'd discuss internally after you left"

8. **Structured Investor Feedback:**

   **If PASS:**
   - Specific reasons for passing (tied to their thesis, not generic)
   - "What would need to change for us to re-engage"
   - Whether they'd take a follow-up in 6 months

   **If FOLLOW-UP MEETING:**
   - What they want to see before the next meeting (specific data, milestones)
   - Timeline for follow-up ("come back in 4-6 weeks with X")
   - What they'd share with their partnership about you
   - Likelihood estimate of proceeding to term sheet

   **If TERM SHEET:**
   - Proposed terms: investment amount, valuation range, structure
   - Key conditions or requirements
   - Expected timeline to close
   - What they'd want in the data room

9. **DD Preview** — After the debrief, generate a "Due Diligence Preview" section based on the
   pitch's weak points. Read `../fundraising/references/investor-dd-patterns.md` for the universal
   patterns. Generate 5-8 specific DD questions that this VC would likely ask if they proceed,
   tailored to the startup's domain and stage. For example:
   - If traction was scored low: "Expect requests for cohort retention data (M1/M0, M3/M0 curves)"
   - If market conviction was weak: "They'll ask for bottom-up TAM with customer-level math"
   - If team strength was questioned: "Prepare for deep reference checks on technical leadership"
   - If the ask was vague: "They'll want a detailed use-of-funds model with milestone mapping"
   
   This helps founders prepare for what comes AFTER the pitch meeting.

10. **Save document:** Write the full pitch simulation to
   `.fundraising/pitch-simulations/pitch-{vc-name}-{YYYY-MM-DD}.md` with YAML frontmatter.
   Append a timeline entry.

10. **Feedback Loop — Next step prompt:**

    > ✅ Pitch simulation complete. Saved to `.fundraising/pitch-simulations/pitch-{vc}-{date}.md`.
    > [VC name] verdict: [VERDICT].
    >
    > Based on this feedback, you can:
    > - `/pitch` — Practice with a different VC to get more perspectives
    > - `/pitch-deck` — Revise your deck based on the feedback
    > - `/due-diligence` — Prepare for investor DD based on this pitch's weak points
    > - `/fundraising-strategy` — Adjust your strategy (amount, structure, positioning)
    > - `/deal-room` — Run a full multi-VC fundraising process simulation
