---
name: deal-room
description: >
  Deal Room — multi-meeting fundraising process simulation. Pick 3-5 VCs, run sequential
  meetings over simulated weeks, get feedback between meetings, adjust your pitch, and
  experience realistic investor dynamics including competitive signals, follow-ups, and
  timing pressure. Tracks your full pipeline with a live dashboard.
  Use when the user asks "deal room", "run my fundraise", "multi-VC simulation",
  "full fundraising process", "simulate my fundraise", "practice multiple VCs",
  "deal room simulation", or "run the full process".
  Part of the fundraising workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → ▶ /deal-room.
---

# /deal-room — Multi-Meeting Fundraising Process Simulation

The capstone experience. While `/pitch` lets you practice a single VC meeting, `/deal-room`
simulates your entire fundraising process — multiple VCs, sequential meetings over weeks,
competitive dynamics, pitch evolution, and follow-up meetings. The goal: prepare you for
the real thing by letting you experience the full arc of a fundraise.

## Workflow Context

This command is **Step 6** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → ▶ /deal-room
```

Founders should practice individual pitches with `/pitch` first, then graduate to the
Deal Room when they're consistently getting FOLLOW-UP or better verdicts.

## Legal Disclaimer

Include this at the start: "VC simulations are for practice purposes only and do not
represent actual firm views or investment decisions."

## Flow

### Phase 1 — Setup

1. **Check for prior context:** Read `.fundraising/` documents — especially
   `pitch-deck-outline-*.md`, `fundraising-strategy-*.md`, and any prior pitch simulations
   in `.fundraising/pitch-simulations/`. If prior `/pitch` simulations exist, acknowledge them:
   "You've already pitched to [VCs]. Your scores: [summary]. Let's use that experience in
   the Deal Room."

2. **Use context from prior commands** if available (startup description, stage, deck outline,
   strategy). Otherwise ask: describe your startup in 2-3 sentences, your current stage,
   and your target raise amount.

3. **VC Selection** — present the stage-filtered VC roster via AskUserQuestion and ask the
   founder to pick **3-5 VCs** for their fundraising process:
   - Pre-seed/Seed: YC, First Round, Floodgate, Precursor Ventures, Hustle Fund + Angels (Naval Ravikant, Elad Gil, Jason Calacanis)
   - Series A/B: a16z, Sequoia, Benchmark, Accel, Lightspeed + Angels (Elad Gil)
   - Growth: Tiger Global

   Prompt: "Select 3-5 VCs for your fundraising process. You'll meet them sequentially
   and can adjust your pitch between meetings."

4. **Meeting order** — ask the founder to set their preferred order. Provide strategic
   guidance: "Many founders start with lower-priority VCs to warm up, saving their top
   targets for later when their pitch is sharpest. How do you want to order your meetings?"

5. **Establish timeline:** "Your fundraise begins in Week 1. Each meeting takes about a
   week to schedule and debrief. A [N]-VC process typically runs [N+1 to N+2] weeks.
   Let's begin."

### Phase 2 — Meeting Loop

Repeat for each VC in the selected order:

6. **Pre-meeting briefing** — before each meeting, show:
   - The current **Deal Room Dashboard** (see format below)
   - Brief on the upcoming VC: key focus areas, signature questions, what excites them
     (loaded from `../fundraising/references/vc-profiles/{slug}.md`)
   - Current week of the process
   - If not the first meeting: "Based on your last meeting with [previous VC], here are
     2-3 things to consider adjusting..." (drawn from prior meeting's debrief)
   - Competitive context: if any prior VC gave FOLLOW-UP or TERM SHEET, note the leverage:
     "[VC] expressed interest, which creates urgency for [current VC]."

7. **Meeting mode selection** (for meetings 2+) — ask via AskUserQuestion:
   - **Full simulation** — interactive 8-12 exchanges, same format as `/pitch`
   - **Key moments only** — 3-4 critical exchanges where the founder responds to the
     VC's hardest questions; the rest is auto-generated with a summary

   The **first meeting is always full simulation** to establish the founder's pitch baseline.

8. **Run the meeting** — load the VC profile from `../fundraising/references/vc-profiles/{slug}.md`.
   Run the simulation using the same behavioral modeling as `/pitch`, with these Deal Room
   additions:

   - **Competitive signaling:** At some point during Q&A (naturally, not forced), the VC asks
     "Who else are you talking to?" or equivalent. The founder's answer matters — naming
     strong VCs who showed interest creates competitive pressure.
   - **Interest acceleration:** If prior meetings generated FOLLOW-UP or TERM SHEET verdicts,
     model the current VC being slightly more engaged and moving faster (realistic competitive
     dynamics). They may reference having "heard good things" or ask more urgently about timeline.
   - **Pitch evolution:** If the founder adjusted their pitch between meetings, the VC's
     evaluation should reflect the improvement. Score dimensions that were explicitly
     addressed should improve; dimensions that weren't should remain consistent.

9. **Post-meeting verdict and debrief** — same 5-dimension scoring as `/pitch`:
   - Problem clarity (1-10)
   - Market conviction (1-10)
   - Team strength (1-10)
   - Traction evidence (1-10)
   - Ask specificity (1-10)
   - Composite: 7+ = TERM SHEET, 5-7 = FOLLOW-UP MEETING, <5 = PASS

   Additional Deal Room context in the debrief:
   - How this verdict affects the overall process
   - If FOLLOW-UP: what they want to see, scheduled in the timeline (adds 2-3 weeks)
   - If TERM SHEET: the competitive leverage this creates for remaining meetings
   - If PASS: "You've lost one option. [N] VCs remaining in your process."

10. **Save meeting document:** Write to
    `.fundraising/deal-room/meeting-{vc}-{round}-{YYYY-MM-DD}.md` with YAML frontmatter:

    ```yaml
    ---
    command: /deal-room
    type: meeting
    date: YYYY-MM-DD
    vc: {slug}
    round: 1
    week: {week_number}
    verdict: FOLLOW-UP MEETING
    composite_score: 6.8
    stage: series-a
    mode: full | key-moments
    status: completed
    ---
    ```

    Append a timeline entry to `.fundraising/timeline.jsonl`:
    ```json
    {"command": "/deal-room", "event": "meeting", "vc": "sequoia", "round": 1, "week": 1, "verdict": "FOLLOW-UP MEETING", "score": 6.8, "ts": "2026-04-09T10:30:00Z"}
    ```

11. **Inter-meeting phase** — after each meeting (except the last), present the updated
    Dashboard and offer three options via AskUserQuestion:

    - **"Continue to next meeting"** — proceed to the next VC as planned
    - **"Adjust my pitch"** — the founder describes what they want to change based on
      feedback. Record the adjustment as a **Pitch Evolution** entry in the dashboard
      with the week number and what changed. The next meeting's simulation will reflect
      these adjustments.
    - **"Handle follow-up"** — if any previous VC gave FOLLOW-UP MEETING, the founder can
      choose to do a follow-up meeting before proceeding (see Phase 3)

### Phase 3 — Follow-up Meetings & Due Diligence

12. Follow-up meetings trigger when a VC gave FOLLOW-UP MEETING and the founder chooses
    to handle it (either during the inter-meeting phase or after all initial meetings).

    Follow-up format:
    - **Shorter:** 4-6 exchanges (not a full re-pitch)
    - **Focused:** The VC references the prior meeting explicitly: "Last time we spoke,
      I asked you to come back with [specific data/milestone]. What do you have?"
    - **Pointed Q&A:** The VC drills into the specific areas they flagged, not a broad
      re-evaluation
    - **Possible verdicts:**
      - **PASS** — they couldn't deliver what was asked; the VC moves on
      - **SECOND FOLLOW-UP** — progress but not enough; one more chance with specific asks
      - **TERM SHEET** — they delivered; the VC is ready to invest

    Save follow-up meetings with `round: 2` (or `round: 3` for second follow-ups) in
    the filename and frontmatter.

13. **Due Diligence Simulation** — when any VC gives FOLLOW-UP MEETING or TERM SHEET,
    simulate the DD process that follows. Read `../fundraising/references/investor-dd-patterns.md`
    and generate domain-appropriate DD questions.

    **DD happens AFTER the pitch, not before.** This is when investors dig deeper into the
    company — it's the phase between "we're interested" and "here's the wire."

    **DD question generation — draw from patterns #1-16, prioritized by:**
    - The pitch's weakest scoring dimensions (low traction → demand cohort data)
    - The specific VC's known priorities (Sequoia → market timing proof, Benchmark → product depth)
    - The startup's domain (Fintech → compliance/licenses, AI → data privacy, Biotech → regulatory)

    **Simulate the DD as a structured Q&A:**

    **Data Integrity & Metrics (patterns #1-2):**
    - "Send us your cohort retention analysis — M1 through M6, segmented by acquisition channel."
    - "Your deck says $X ARR. Walk us through the reconciliation from Stripe to your reported number."

    **Technical & Defensibility (patterns #4-5):**
    - "We'd like a technical deep dive with your CTO. What's your architecture and where's the moat?"
    - "What data do you use to train? What's proprietary vs public? License status?"

    **Risk & Failure Modes (patterns #6-7):**
    - "Walk us through your worst week/month. What happened, how did you recover?"
    - "What guardrails exist? What breaks if you 10x overnight?"

    **Unit Economics & Cost (patterns #8-9):**
    - "Send us a cost breakdown — people, tech, marketing, other. Monthly trend for last 6 months."
    - "What's your fully-loaded CAC by channel? Payback period?"

    **Compliance & Legal (patterns #15-16):**
    - Fintech: "Share your MSB/MTL license status. KYC/AML provider and pass rates. Fund segregation architecture."
    - AI: "GDPR compliance documentation. Data processing agreements. AI output liability approach."
    - Biotech: "FDA submission status. IRB approvals. GMP facility audit reports."
    - SaaS: "SOC 2 Type II report. GDPR DPA with major customers. PII handling documentation."
    - Hardware: "FCC/CE certification documents. Product liability insurance policy."
    - ALL: "Cap table. IP assignment agreements for all contributors. Employment classification audit. Pending litigation."

    **Customer References (pattern #3):**
    - "We'd like to speak with 3-5 customers. Please provide contacts — ideally including one who almost churned."

    **Present the DD as a checklist** the founder needs to prepare, with:
    - 🔴 **Must have before close** — deal-blocking if missing
    - 🟡 **Should have** — won't kill the deal but delays it
    - 🟢 **Nice to have** — shows maturity

    The founder can respond to each DD item. Grade their preparedness and flag gaps:
    "You're missing [X]. This will delay your close by 2-4 weeks. Prepare it now."

    Save DD results to `.fundraising/deal-room/dd-{vc}-{YYYY-MM-DD}.md`.

### Phase 4 — Process Conclusion & Final Report

13. After all meetings and follow-ups are complete, generate the **Deal Room Final Report**:

    **Process Summary:**
    - Timeline of all meetings, week by week
    - Total duration of the simulated fundraise

    **Pipeline Outcome:**
    | VC | Meetings | Final Verdict | Score Trajectory | Key Feedback |
    |----|----------|---------------|------------------|--------------|
    | Sequoia | 2 (initial + follow-up) | TERM SHEET | 6.2 → 7.8 | "Strong NDR, needed team plan" |
    | a16z | 1 | FOLLOW-UP | 5.8 | "Loved product, weak TAM story" |
    | Benchmark | 1 | PASS | 4.2 | "Too early for us" |

    **Score Evolution:**
    - Table showing 5-dimension scores across all meetings
    - Highlight dimensions that improved vs. regressed
    - Overall composite trend

    **Pitch Evolution:**
    - What the founder changed between meetings
    - Which changes had the most impact on scores

    **Competitive Dynamics:**
    - How interest from one VC affected others
    - Whether competitive signals accelerated or didn't matter

    **Lessons Learned:**
    - Top 3 strengths (consistent across VCs)
    - Top 3 weaknesses (consistent across VCs)
    - Biggest single improvement made during the process

    **Strategic Recommendation:**
    - If TERM SHEET(s): compare terms side by side, recommend which to pursue and why
    - If FOLLOW-UP(s) but no term sheet: what to do next, timeline for follow-ups
    - If all PASS: honest assessment of what needs to change, concrete action plan,
      recommended timeline to try again

14. **Save final report:** Write to `.fundraising/deal-room/final-report-{YYYY-MM-DD}.md`
    with YAML frontmatter:

    ```yaml
    ---
    command: /deal-room
    type: final-report
    date: YYYY-MM-DD
    stage: series-a
    vcs_selected: [sequoia, a16z, benchmark]
    term_sheets: 1
    follow_ups: 1
    passes: 1
    duration_weeks: 5
    status: completed
    ---
    ```

    Append a timeline entry:
    ```json
    {"command": "/deal-room", "event": "completed", "term_sheets": 1, "follow_ups": 1, "passes": 1, "duration_weeks": 5, "ts": "2026-04-09T12:00:00Z"}
    ```

15. **Next step prompt** — based on outcome:

    If TERM SHEET(s):
    > ✅ Deal Room complete. You have [N] term sheet(s). Saved to `.fundraising/deal-room/final-report-{date}.md`.
    > In a real process, you'd now negotiate terms and close. Review the term sheet comparison above.
    > Congratulations — your pitch evolved significantly through this process.

    If FOLLOW-UP(s) but no term sheet:
    > ✅ Deal Room complete. You have active interest from [N] VC(s). Saved to `.fundraising/deal-room/final-report-{date}.md`.
    > Next: run `/deal-room` again to continue follow-up meetings, or `/pitch` to practice specific weak areas.

    If all PASS:
    > ✅ Deal Room complete. This round didn't produce results — but the feedback is valuable. Saved to `.fundraising/deal-room/final-report-{date}.md`.
    > Review the lessons learned, then:
    > - `/pitch-deck` — Revise your deck based on consistent VC feedback
    > - `/pitch` — Practice specific weak areas identified across meetings
    > - `/deal-room` — Run another process when ready

## Deal Room Dashboard Format

Show this between meetings and update it after each meeting:

```
## Deal Room Dashboard — Week [N]

| VC | Week | Status | Score | Verdict | Next Step |
|----|------|--------|-------|---------|-----------|
| Sequoia | 1 | ✅ Done | 6.8 | FOLLOW-UP | Week 4: deliver Q2 metrics |
| a16z | 2 | ✅ Done | 7.4 | TERM SHEET | Review terms |
| Benchmark | 3 | ▶ Next | -- | -- | Scheduled |
| First Round | -- | ⏳ Queued | -- | -- | After Benchmark |

### Competitive Signals
- a16z term sheet creates urgency for Benchmark meeting
- Sequoia follow-up can reference competitive interest

### Pitch Adjustments Made
- Week 2: Strengthened unit economics slide after Sequoia feedback
- Week 3: Added competitive moat section based on a16z questions
```

## Session Continuity

If a Deal Room session is interrupted (conversation ends, context resets), the founder
can restart `/deal-room` and the system picks up from the saved state:

1. Read `.fundraising/deal-room/` for existing meeting files
2. Reconstruct the Dashboard from saved meetings
3. Identify which VCs have been met and which remain
4. Resume from the next unmet VC

This is possible because each meeting is saved individually with full frontmatter,
and the Dashboard can be reconstructed from those files.

## Scoring Consistency

The 5-dimension scoring must be **consistent across VCs** while reflecting each VC's
different priorities:

- The same pitch should score differently with different VCs (Benchmark weights product
  clarity more heavily; Sequoia weights market conviction; a16z weights team and vision)
- But the **composite** should reflect objective quality — a strong pitch scores well
  everywhere, even if individual dimensions shift
- When the founder adjusts their pitch, only the dimensions they addressed should
  improve — other scores remain consistent
- Never inflate scores just because the process is progressing — honest assessment
  throughout

## Context Window Management

A full Deal Room with 4 VCs could be very long. Manage context by:

- Only load the **current VC's profile** at meeting time (not all profiles at once)
- For prior meetings, reference the **summary and scores** rather than full transcripts
- Keep the Dashboard as the single source of cross-meeting state
- In "key moments only" mode, keep the auto-generated summary concise
