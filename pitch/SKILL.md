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
  /fundraising-strategy → /fundraising-stage → /pitch-deck → ▶ /pitch → /due-diligence → /deal-room.
---

# /pitch — Hyper-Realistic VC Simulation & Investor Feedback

The flagship command. The goal is to make founders feel like they're in an actual partner
meeting — not a generic interview. Each VC should feel distinctly different.

## Workflow Context

This command is **Step 5** of the fundraising workflow:

```
/before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → ▶ /pitch → /due-diligence → /deal-room
```

## Legal Disclaimer

Include this at the start: "VC simulations are for practice purposes only and do not
represent actual firm views or investment decisions."

## Flow

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`). If found, read frontmatter + pitch
   deck outline section + prior "Pitch Simulations" entries to pre-fill context and reference
   accumulated feedback. Show welcome back greeting (format in `fundraising/SKILL.md`).
   If multiple playbooks, ask which to use.

2. **Use context from playbook** if available (startup description, stage, deck outline).
   If missing, collect it conversationally per the Interaction Rules in `fundraising/SKILL.md` —
   ask stage first, then a brief startup description. One question at a time.

3. **Present VC selection** via AskUserQuestion, filtered by stage:
   - Pre-seed/Seed: YC, First Round, Floodgate, Precursor, Hustle Fund, Lux Capital, Radical Ventures, 500 Global, Felicis + Angels (Naval, Elad Gil, Calacanis, Peter Thiel, Elon Musk, Ron Conway, Marc Andreessen, Reid Hoffman)
   - Series A/B: a16z, Sequoia, Benchmark, Accel, Lightspeed, Greylock, Khosla, General Catalyst, Index Ventures, Founders Fund, Thrive Capital, NEA + Angels (Elad Gil, Peter Thiel, Marc Andreessen, Reid Hoffman)
   - Growth: Tiger Global, Coatue, Insight Partners, SoftBank Vision Fund, DST Global
   - Strategic/CVC: NVIDIA NVentures, Microsoft M12, GV (Google), Amazon/AWS, Salesforce Ventures, Intel Capital, Oracle

4. **Load the selected VC's profile** from `../fundraising/references/vc-profiles/`. Each VC has its
   own file (e.g., `yc.md`, `sequoia.md`, `a16z.md`). Read `_index.md` first for the full list of
   available VCs.

5. **Run the simulation via VC sub-agent:**

   Spawn a sub-agent to play the VC role. The VC knows what any real investor would know before
   walking into the room: the deck the founder sent ahead of the meeting. They do not have access
   to the founder's internal planning context — metrics grades, strategy verdicts, readiness
   assessment — only the materials the founder would actually share.

   **Sub-agent receives (and ONLY this):**
   - The VC profile loaded in step 4 (behavioral style, investment thesis, portfolio context,
     signature questions, push-back patterns, closing signals)
   - The pitch deck outline from the playbook's "Pitch Deck Outline" section, if one exists,
     framed as:
     > "The founder sent you their pitch deck before the meeting. Here is the deck outline."
     If no deck outline exists in the playbook, omit this — the VC enters without having seen
     a deck and will ask for the pitch cold.
   - A cold-start instruction:
     > "You are a partner at [VC Firm]. You have just reviewed the founder's deck (if provided
     > above). You are now meeting them for the first time. React to what you read in the deck
     > and to what the founder says in the room. Do not ask questions that assume knowledge
     > beyond the deck and the conversation. Stay in character throughout."
   - The conversation transcript accumulated so far (founder messages + your prior VC responses)

   **Sub-agent must NOT receive:**
   - Readiness assessment, metrics grades, fundraising strategy, or prior VC verdicts
   - Any section of the playbook the founder would not send to an investor
   - The founder's background or anything not in the deck or said aloud during the pitch

   **Required competitive probing.** At least one VC turn during the Q&A phase must be a
   competitive question. The sub-agent should raise this naturally at whatever point is
   appropriate given the VC's behavioral style. The exact question depends on the category
   inferred from the founder's pitch:

   **AI infra & platform**
   - **Foundation model** → "Where are you on the frontier vs. GPT-5, Claude, Gemini, and
     DeepSeek? What's your position on cost per million tokens, context, reasoning, and
     tool use? Do you beat them on a specific benchmark I can verify?"
   - **LLM inference / serving** → "How do you compare to Together, Fireworks, Groq, and
     Modal on latency, throughput, and price? What's your wedge when hyperscalers are
     racing to commoditize inference?"
   - **Vector DB / retrieval** → "Why should a customer pick you over Pinecone, Weaviate,
     Qdrant, or just shoving embeddings into Postgres with pgvector?"
   - **LLM observability / eval** → "What's your story vs. LangSmith, Braintrust, Arize,
     and Weights & Biases? What do you do that the default tool in a customer's stack doesn't?"
   - **AI agent framework** → "Why not just use LangGraph or the Anthropic Agent SDK?
     What's the wedge?"
   - **AI chips / hardware** → "What's your story vs. NVIDIA, Groq, and Cerebras?
     On what workload do you win, and what's the customer switching cost?"

   **AI applications (horizontal)**
   - **AI coding assistant** → "How do you compare to Cursor, GitHub Copilot, Windsurf,
     and Devin? What do you do that they don't, and why can't they just ship it next quarter?"
   - **AI search** → "Why would a user pick you over Perplexity or ChatGPT Search?"
   - **AI browser** → "What's your position vs. Arc/Dia, Perplexity Comet, and Chrome
     plus extensions?"
   - **AI notetaker / meeting assistant** → "How do you differentiate from Otter, Fireflies,
     Granola, and Read AI? Why won't Zoom/Google Meet just ship this natively?"
   - **AI inbox / email** → "What's your wedge against Superhuman, Shortwave, and now
     Gmail with Gemini?"
   - **Voice AI** → "How do you compare to ElevenLabs, Deepgram, Cartesia, and Vapi on
     quality, latency, and cost?"
   - **Image / video generation** → "How do you compare to Midjourney, Flux, Runway, Pika,
     and Kling? What's your specific quality or workflow wedge?"

   **AI applications (vertical)**
   - **AI customer support** → "How are you different from Intercom Fin, Ada, Decagon,
     and Sierra? What's your win rate in head-to-head bakeoffs?"
   - **AI sales / revenue intelligence** → "Why should a customer pick you over Gong,
     Clari, Outreach, or 11x?"
   - **AI legal** → "How do you compare to Harvey, Spellbook, EvenUp, and Hebbia?
     What's your specific wedge — a practice area, a workflow, a deployment model?"
   - **AI medical scribe** → "Why you and not Abridge, Suki, Nabla, or Heidi? What
     clinical specialty or EHR integration do you win on?"
   - **AI finance / spend management** → "What's your wedge vs. Ramp, Brex, and Pilot?"
   - **AI HR / recruiting** → "How are you different from Mercor, Paradox, or Eightfold?"
   - **AI drug discovery** → "What's your position vs. Recursion, Isomorphic Labs, Insitro,
     and Xaira? What specifically have you shown that they haven't?"
   - **Vertical AI SaaS (generic)** → "Why won't the incumbent SaaS vendor in this space
     (Salesforce, HubSpot, ServiceNow, etc.) just ship this feature? And how are you
     different from [the named AI-native entrant]?"

   **Deep tech & frontier**
   - **Humanoid / embodied AI** → "How do you compare to Figure, 1X, Physical Intelligence,
     and Skild? What specifically is your technical or GTM wedge?"
   - **Autonomous driving** → "Why you and not Waymo, Tesla FSD, Wayve, or Aurora? What's
     your specific ODD or deployment wedge?"
   - **Defense tech** → "How are you different from Anduril, Shield AI, and Palantir?
     What DoD program office is pulling you in?"
   - **Climate / fusion / energy** → "What's your position vs. Commonwealth Fusion, Helion,
     and Fervo? What's the timeline and capital profile?"

   **Non-AI fallbacks**
   - **Dev tools / infra** → "What's your competitive position vs. [incumbent] and the
     open-source alternative?"
   - **Consumer** → "Why would users switch from [dominant incumbent]?"
   - **Fintech** → "Why wouldn't a customer just use Stripe / an existing neobank?"
   - **Marketplace** → "How do you unlock liquidity when [incumbent] already has both sides?"
   - **Generic fallback** (category unclear or not listed) → "Who are the top 3 players in
     your space today, and what's your specific moat against the leader?"

   If the founder names a specific competitor the sub-agent hasn't brought up, the sub-agent
   should probe that comparison in detail. If the founder evades ("we don't really have
   competitors"), the sub-agent should push back pointedly — every good VC knows that's a
   red flag.

   **Conversation loop:**
   Each time the founder sends a message, pass [VC profile + cold-start instruction +
   conversation history] to the sub-agent and relay its response as the VC's reply.
   Repeat for 8-12 exchanges (one exchange = one founder message + one VC response).
   The first 2-3 exchanges are the founder's pitch; remaining are VC Q&A.

   **YC exception:** Follow the YC-Specific Simulation Rules from `yc.md` — 5-7 exchanges,
   questions from the start (no pitch phase), rapid-fire format. Sub-agent structure is the same;
   only the exchange count and format change.

   **End of simulation:** When the natural close point is reached (VC wraps up or 8-12 exchanges
   done), output the VC's closing statement and end the sub-agent loop.

6. **Deliver a verdict:** PASS / FOLLOW-UP MEETING / TERM SHEET — decided by the **main Claude**
   (not the sub-agent) based on both the conversation transcript and the founder's actual
   context from the playbook. This allows the verdict to reflect not just what the founder
   said, but how accurately they represented their true situation.

7. **DEBRIEF:**
   - "Here's what [VC name] was actually evaluating at each exchange"
   - Score across 5 dimensions (1-10):
     - **Problem clarity** (1=vague, 10=specific, urgent, quantified pain)
     - **Market & competition** (1=no evidence or "no real competitors", 10=bottom-up TAM with clear wedge against named competitors and a credible answer to "why won't [incumbent] just build this?")
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
   - If market & competition was weak: "They'll ask for a detailed competitive teardown against [named competitors] plus a written answer to 'why won't [incumbent] just build this?'"
   - If team strength was questioned: "Prepare for deep reference checks on technical leadership"
   - If the ask was vague: "They'll want a detailed use-of-funds model with milestone mapping"
   
   This helps founders prepare for what comes AFTER the pitch meeting.

10. **Save to playbook + transcript:**
    - Write full simulation transcript to `.fundraising/{round-dir}/pitch-simulations/{vc}-{YYYY-MM-DD}.md`
      with YAML frontmatter (command, date, vc, verdict, score, status).
    - Append to `.fundraising/{round-dir}/playbook.md`:
      1. Update frontmatter: add entry to `steps_completed.pitch` array (date, vc, verdict, score)
         + `last_updated`
      2. If this is the first pitch: update Progress Tracker row for `/pitch` (✅)
      3. Append under `## Pitch Simulations`:
         ```
         ### {VC} — {YYYY-MM-DD} · {VERDICT} · {score}/10
         **Key Feedback:** [top 3 most actionable feedback points]
         > Full transcript: `.fundraising/{round-dir}/pitch-simulations/{vc}-{date}.md`
         ```
    - Ask: "Would you like to log a strategy change based on this feedback?
      (e.g., adjusted pitch angle, changed ask amount, added a slide)
      If yes, describe the change — I'll add it to your Strategy Changes log."
      If yes: append a row to the `## Strategy Changes` table in the playbook.

11. **Feedback Loop — Next step prompt:**

    > ✅ Pitch simulation complete. Transcript saved to `.fundraising/{round-dir}/pitch-simulations/{vc}-{date}.md`.
    > [VC name] verdict: [VERDICT].
    >
    > Based on this feedback, you can:
    > - `/pitch` — Practice with a different VC to get more perspectives
    > - `/pitch-deck` — Revise your deck based on the feedback
    > - `/due-diligence` — Prepare for investor DD based on this pitch's weak points
    > - `/fundraising-strategy` — Adjust your strategy (amount, structure, positioning)
    > - `/deal-room` — Run a full multi-VC fundraising process simulation
