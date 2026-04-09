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
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → ▶ /deal-room.
---

# /deal-room — Multi-Meeting Fundraising Process Simulation

The capstone experience. While `/pitch` lets you practice a single VC meeting, `/deal-room`
simulates your entire fundraising process — multiple VCs, sequential meetings over weeks,
competitive dynamics, pitch evolution, and follow-up meetings. The goal: prepare you for
the real thing by letting you experience the full arc of a fundraise.

## Workflow Context

This command is **Step 7** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → ▶ /deal-room
```

Founders should practice individual pitches with `/pitch` first, then graduate to the
Deal Room when they're consistently getting FOLLOW-UP or better verdicts.

## Legal Disclaimer

Include this at the start: "VC simulations are for practice purposes only and do not
represent actual firm views or investment decisions."

## Flow

### Phase 1 — Setup

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`). If found, read frontmatter + pitch
   deck, strategy, and Pitch Simulations sections to fully pre-fill context. Show welcome back
   greeting (format in `fundraising/SKILL.md`). If multiple playbooks, ask which to use.
   If prior `/pitch` simulations exist in the playbook, acknowledge them:
   "You've already pitched to [VCs]. Your scores: [summary]. Let's use that experience in
   the Deal Room."

2. **Use context from playbook** if available (startup description, stage, deck outline, strategy).
   Otherwise ask: describe your startup in 2-3 sentences, your current stage, and target raise amount.

3. **VC Selection** — present the stage-filtered VC roster via AskUserQuestion and ask the
   founder to pick **3-5 VCs** for their fundraising process:
   - Pre-seed/Seed: YC, First Round, Floodgate, Precursor, Hustle Fund, Lux Capital, Radical Ventures, 500 Global, Felicis + Angels (Naval, Elad Gil, Calacanis, Peter Thiel, Elon Musk, Ron Conway, Marc Andreessen, Reid Hoffman)
   - Series A/B: a16z, Sequoia, Benchmark, Accel, Lightspeed, Greylock, Khosla, General Catalyst, Index Ventures, Founders Fund, Thrive Capital, NEA + Angels (Elad Gil, Peter Thiel, Marc Andreessen, Reid Hoffman)
   - Growth: Tiger Global, Coatue, Insight Partners, SoftBank Vision Fund, DST Global
   - Strategic/CVC: NVIDIA NVentures, Microsoft M12, GV (Google), Amazon/AWS, Salesforce Ventures, Intel Capital, Oracle

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

8. **Run the meeting via VC sub-agent** — load the VC profile from `../fundraising/references/vc-profiles/{slug}.md`.

   Spawn a sub-agent to play the VC role. The VC knows what any real investor would know before
   the meeting: the deck the founder sent, any data room materials submitted, and (if this is a
   follow-up) the transcript of their prior conversation.

   **Before spawning:**
   - Check the playbook's "Pitch Deck Outline" section — pass it if present.
   - Check the playbook's "Due Diligence" section — if `/due-diligence` has been completed,
     pass the DD readiness summary and any materials the founder submitted to investors.
   - Check the playbook's `steps_completed.pitch` array for a prior `/pitch` simulation with
     this same VC. If one exists, read the full transcript from
     `.fundraising/{round-dir}/pitch-simulations/{vc}-{date}.md`.

   **Sub-agent receives (and ONLY this):**
   - The VC profile (behavioral style, investment thesis, portfolio context, signature
     questions, push-back patterns, closing signals)
   - The pitch deck outline from the playbook, if present, framed as:
     > "The founder sent you their deck before the meeting."
   - The DD readiness summary and submitted materials from the playbook, if present, framed as:
     > "The founder submitted a data room. Here is what they provided."
   - **If this VC was previously pitched in `/pitch`:** the prior meeting transcript, framed as:
     > "You met this founder before. The transcript of your prior meeting is below. You
     > remember what they told you, the questions you asked, and your impressions — but
     > you do not know anything they haven't told you directly."
     If no prior `/pitch` transcript exists for this VC, use a cold-start instruction:
     > "You are a partner at [VC Firm]. You have reviewed the deck and any submitted
     > materials above. You are now meeting this founder. React to what you've read and to
     > what they say in the room. Stay in character throughout."
   - The current Deal Room conversation transcript accumulated so far

   **Sub-agent must NOT receive:**
   - Readiness assessment, metrics grades, fundraising strategy, or prior VC verdicts
   - Transcripts from other VCs (pitch simulations or Deal Room meetings with other firms)
   - Any section of the playbook the founder would not send to an investor

   **Conversation loop:** Each founder message → pass [VC profile + cold-start + transcript]
   to sub-agent → relay response. Repeat for 8-12 exchanges (first 2-3: founder's pitch;
   remaining: VC Q&A). End when VC wraps up or exchange count is reached.

   **Deal Room additions** (these emerge naturally in the conversation — the VC asks, the
   founder answers, the sub-agent responds to what it hears):

   - **Competitive signaling:** At some point during Q&A (naturally, not forced), the VC asks
     "Who else are you talking to?" or equivalent. The founder's answer matters — if the founder
     mentions strong VCs who showed interest, competitive pressure is created.
   - **Interest acceleration:** If the founder mentions prior interest from other VCs in their
     answer to competitive questions, the sub-agent VC may become more engaged or move faster
     (realistic response to competitive signals the founder reveals).
   - **Pitch evolution:** If the founder adjusted their pitch between meetings, the sub-agent
     evaluates what it hears — improvements the founder actually delivers will show in the score.

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

10. **Save meeting log:** Write full meeting record to
    `.fundraising/{round-dir}/deal-room/meeting-{vc}-round-{N}.md` with YAML frontmatter
    (command, date, vc, round, week, verdict, composite_score, stage, mode, status).

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

13. **Due Diligence** — when any VC gives FOLLOW-UP MEETING or TERM SHEET, suggest running
    `/due-diligence` for that specific VC: "VC expressed interest — run `/due-diligence` to
    prepare for their DD questions before the follow-up meeting."
    
    If the founder has already run `/due-diligence`, reference the scorecard from the
    "Due Diligence" section in the playbook and note any gaps that remain.

### Phase 4 — Deal Architecture & Financing Plan

Triggered when: all scheduled meetings and follow-ups are complete AND at least one TERM SHEET has been issued. If no term sheets were received, skip to Phase 5.

14. **Term Sheet Inventory** — compile all term sheets received. For each one, display:

    | Field | Value |
    |-------|-------|
    | VC | Name |
    | Pre-money valuation | $XM |
    | Check size | $XM |
    | Post-round ownership | X% |
    | Board seat | Yes / Observer / No |
    | Pro-rata rights | Yes / No (follow-on rounds) |
    | Lead or follow | Lead / Follow |
    | Special terms | info rights, anti-dilution, drag-along, etc. |
    | Expiry | [week] |

    If the founder has a target raise amount from their playbook or fundraising-strategy session, surface it here: "Your target raise was $XM at roughly $YM pre-money. Here's how each offer compares."

    Ask via AskUserQuestion whether any simulated terms should be adjusted to better match their actual target round parameters.

15. **Lead Investor Analysis** — for each VC that issued a TERM SHEET, evaluate lead candidacy on four dimensions (score 1–5 each):

    **a) Strategic Value-Add**
    Portfolio synergies (customers, partners, acquirers in portfolio); domain expertise in the founder's sector; board seat quality (will this GP add real operational judgment or mostly observe?); reference network available from current portfolio companies.

    **b) Signal Value for Future Rounds**
    Brand / prestige effect when pitching Series A/B investors; whether this VC's name on the cap table increases or decreases the perceived quality of the deal for downstream investors; geographic / ecosystem fit.

    **c) Follow-on Capital Capacity**
    Fund size relative to check written (a $200M fund writing a $3M seed check has limited pro-rata capacity); stated follow-on policy; historical re-investment rate with portfolio companies; whether they have a growth fund to participate in later rounds.

    **d) Dilution Efficiency**
    Value delivered per percentage point of equity taken; whether their standard terms (pro-rata, information rights, anti-dilution provisions) are founder-friendly or investor-friendly; board control implications.

    Show the lead candidacy matrix:
    ```
    | VC          | Strategic | Signal | Follow-on | Dilution Eff. | Lead Score |
    |-------------|-----------|--------|-----------|---------------|------------|
    | [VC A]      |    X/5    |  X/5   |    X/5    |      X/5      |   XX/20    |
    | [VC B]      |    X/5    |  X/5   |    X/5    |      X/5      |   XX/20    |
    ```

    Recommend the highest-scoring VC as lead. If scores are close, explain the tie-breaker (e.g., board seat quality, sector expertise depth, fund size relative to round).

16. **Follow-on Stack Analysis** — for each remaining VC (TERM SHEET or FOLLOW-UP heading toward term sheet) evaluate as a follow-on:

    Apply these principles:
    - **Check size fit:** Follow-ons should fill the round to target without over-allocating or forcing a larger round than planned
    - **Non-overlapping value:** Does this follow-on add something the lead doesn't already provide? (e.g., geographic network, sector expertise, customer intro channel)
    - **No competing lead behavior:** If a potential follow-on insists on a board seat or is known to require lead economics, discuss negotiating them to a smaller check without board rights — or declining
    - **Dilution discipline:** Each additional investor adds dilution and cap table complexity; question whether each is worth it
    - **Round closure:** Prioritize investors who can close fast over investors who add more process drag

    For each potential follow-on produce a one-line verdict:
    > **[VC Name]** — $XM / XX% — [specific value-add] — Recommendation: **Accept / Reduce to $XM / Decline**
    
    Explain any "Decline" recommendation: round already full, terms too complex, limited incremental value beyond what lead provides, or dilution not justified by the value they bring.

17. **Dilution Modeling** — build a pro-forma cap table for two scenarios:

    **Scenario A — Proposed round (with selected lead + follow-ons):**
    ```
    Pre-money valuation:   $XM
    Round size:            $XM
    Post-money valuation:  $XM
    New dilution:          XX%

    Cap Table Post-Round:
    ┌─────────────────────────────────────────────┐
    │ Founders                   XX% → XX%        │
    │ Option Pool                XX% → XX%        │
    │ Lead: [VC]                  —  → XX%        │
    │ Follow-on: [VC]             —  → XX%        │
    │ Follow-on: [VC]             —  → XX%        │
    │ Prior investors            XX% → XX%        │
    └─────────────────────────────────────────────┘
    ```

    **Scenario B — Projected post-next-round (assuming a standard follow-on raise):**
    Use the founder's next-stage target from their playbook, or assume a typical raise for their stage (e.g., if current is Seed → assume Series A of ~$10–15M at ~5–7× current post-money). Show projected founder ownership after the next round.

    **Dilution health check:**
    - Flag if combined founder ownership after this round falls below 60% (early warning)
    - Flag if projected post-Series A founder ownership falls below 40% (common threshold for maintaining long-term incentive alignment)
    - Flag if total investor count exceeds 8–10 (cap table complexity signal for Series A)

18. **Value-Add vs. Dilution Decision** — for each investor in the proposed deal, a concise "worth it?" judgment:

    > **Taking [VC]'s $XM at XX% dilution is recommended** because [specific, concrete value-add: e.g., "their portfolio includes 4 direct enterprise buyers in your target vertical; the GP personally built and sold a company in this space and will add real board value at the Series A stage."]

    > **Taking [VC]'s $XM at XX% dilution is marginal** because [e.g., "their brand adds signal value but their portfolio doesn't overlap with your ICP; you could fill this allocation with a more strategically aligned angel at better economics."]

    > **Declining [VC]'s offer is recommended** because [e.g., "their pro-rata rights combined with the lead's pro-rata would over-constrain your Series A syndication; their check size doesn't justify the additional cap table entry and DD overhead."]

19. **Complete Financing Plan** — synthesize into one actionable output:

    ```
    ═══════════════════════════════════════════════════
    FINANCING PLAN — [Round Name] — Week [N]
    ═══════════════════════════════════════════════════

    ROUND SUMMARY
    Pre-money valuation:    $XM
    Round size:             $XM
    Post-money valuation:   $XM
    Total dilution:         XX%
    Investor count:         N

    LEAD INVESTOR
    ┌──────────────────────────────────────────────┐
    │ [VC Name]                                    │
    │ Amount: $XM   Ownership: XX%                 │
    │ Board seat: Yes / Observer / No              │
    │ Why lead: [1–2 sentence rationale]           │
    └──────────────────────────────────────────────┘

    FOLLOW-ON INVESTORS
    ┌─────────────┬────────┬───────────┬───────────────────────┐
    │ Investor    │ Amount │ Ownership │ Key Value-Add         │
    ├─────────────┼────────┼───────────┼───────────────────────┤
    │ [VC A]      │ $XM    │ XX%       │ [reason]              │
    │ [VC B]      │ $XM    │ XX%       │ [reason]              │
    └─────────────┴────────┴───────────┴───────────────────────┘

    DECLINED OFFERS
    ┌─────────────┬────────────────────────────────────────────┐
    │ Investor    │ Reason                                     │
    ├─────────────┼────────────────────────────────────────────┤
    │ [VC C]      │ [dilution vs. value-add not justified /    │
    │             │  round fully subscribed / terms conflict]  │
    └─────────────┴────────────────────────────────────────────┘

    FOUNDER RETENTION
    Post-round:           ~XX%
    Post-Series A (est.): ~XX%

    NEXT STEPS
    1. Accept [Lead VC] term sheet — respond by [week]
    2. Notify follow-on VCs of their allocations
    3. Decline [declined VCs] — suggested language below
    4. Target close: [week estimate]

    SUGGESTED DECLINE LANGUAGE
    For [VC C]: "We've decided to keep the round smaller and more focused
    to preserve cap table room for our Series A. We'd love to stay in touch
    and include you in our Series A process."
    ═══════════════════════════════════════════════════
    ```

    Ask via AskUserQuestion: "Does this financing plan work for you? You can adjust the round size, swap lead/follow-on assignments, change allocations, or include a declined VC."

    Save the financing plan to `.fundraising/{round-dir}/deal-room/financing-plan.md` with YAML frontmatter (command, date, stage, lead_vc, lead_amount, follow_on_vcs, total_raise, pre_money, dilution_pct, status: draft).

---

### Phase 5 — Process Conclusion & Final Report

20. After all meetings, follow-ups, and deal architecture are complete, generate the **Deal Room Final Report**:

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
    - If TERM SHEET(s): reference the Financing Plan from Phase 4 — include lead recommendation, follow-on stack, dilution summary, and the declined-offer rationale. Don't repeat the full plan here; link to it.
    - If FOLLOW-UP(s) but no term sheet: what to do next, timeline for follow-ups, and what milestone would likely convert each follow-up to a term sheet
    - If all PASS: honest assessment of what needs to change, concrete action plan, recommended timeline to try again

21. **Save to playbook + final report:**
    - Write full final report to `.fundraising/{round-dir}/deal-room/final-report.md`
      with YAML frontmatter (command, date, stage, vcs_selected, term_sheets, follow_ups,
      passes, duration_weeks, financing_plan_file, status).
    - Append to `.fundraising/{round-dir}/playbook.md`:
      1. Update frontmatter: set `steps_completed.deal-room` (date, term_sheets, follow_ups, passes)
         + `last_updated`
      2. Update Progress Tracker row for `/deal-room` (✅ with "Term sheets: {N}, Lead: {VC}")
      3. Append `## Deal Room Summary — {YYYY-MM-DD}` section with pipeline outcome table,
         score evolution, lessons learned, financing plan summary, and strategic recommendation
         > Full pipeline log: `.fundraising/{round-dir}/deal-room/`

22. **Next step prompt** — based on outcome:

    If TERM SHEET(s) and Financing Plan complete:
    > ✅ Deal Room complete. Financing plan saved to `.fundraising/{round-dir}/deal-room/financing-plan.md`.
    > Lead: [VC] / $XM. Follow-ons: [VCs]. Total round: $XM. Founder retention post-round: ~XX%.
    > In a real process, your next step is accepting the lead term sheet and notifying follow-ons of their allocations.

    If FOLLOW-UP(s) but no term sheet:
    > ✅ Deal Room complete. You have active interest from [N] VC(s). Saved to `.fundraising/{round-dir}/deal-room/final-report.md`.
    > Next: run `/deal-room` again to continue follow-up meetings, or `/pitch` to practice specific weak areas.

    If all PASS:
    > ✅ Deal Room complete. This round didn't produce results — but the feedback is valuable. Saved to `.fundraising/{round-dir}/deal-room/final-report.md`.
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
| a16z | 2 | ✅ Done | 7.4 | TERM SHEET | In deal architecture |
| Benchmark | 3 | ▶ Next | -- | -- | Scheduled |
| First Round | -- | ⏳ Queued | -- | -- | After Benchmark |

### Term Sheet Tracker
*(Appears once at least one TERM SHEET is received)*

| VC | Pre-money | Check | Ownership | Board | Lead/Follow | Expires |
|----|-----------|-------|-----------|-------|-------------|---------|
| a16z | $18M | $3M | 14.3% | Observer | Lead | Week 6 |

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

1. Read `.fundraising/{round-dir}/deal-room/` for existing meeting files
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
