---
name: before-fundraising
description: >
  Fundraising readiness assessment for startup founders. Evaluates whether you should raise money
  right now — honest verdict with hard gates. Asks about stage, team, product launch status,
  traction, and gives a RAISE NOW / NOT YET / MAYBE verdict.
  Use when the user asks "should I raise?", "am I ready to fundraise?", "do I need funding?",
  "evaluate my startup for fundraising", "fundraising readiness", or "before fundraising".
  Part of the fundraising skill workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room.
---

# /before-fundraising — Fundraising Readiness Assessment

This is the entry point of the fundraising workflow. Before jumping into pitch decks and VC meetings,
founders need an honest assessment of whether they should be raising at all.

## Workflow Context

This command is **Step 0** of the fundraising workflow:

```
▶ /before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch → /due-diligence → /deal-room
```

## Stage Taxonomy

| Canonical Stage | User-Facing Labels | VC Tier |
|----------------|-------------------|---------|
| `pre-seed` | "I have an idea", "building MVP" | Seed tier |
| `seed` | "MVP built, early users" | Seed tier |
| `series-a` | "Proven PMF, scaling" | Series A/B tier |
| `series-b` | "Repeatable growth" | Series A/B tier |
| `growth` | "Market leader, Series C/D" | Growth tier |
| `late-stage` | "Series E+, crossover investors, pre-IPO" | Late-stage / crossover tier |
| `ipo` | "Preparing for IPO or recently public" | Public markets |

## Flow

1. **Load session context:**
   Glob `.fundraising/*/playbook.md` (exclude `archive/`).

   - **No playbook found:** proceed fresh — ask stage (step 2), then gather company profile (step 3).

   - **One playbook found:** show welcome back greeting (format in `fundraising/SKILL.md`).
     Ask:
     ```
     Found existing fundraising context:
       Company: {name} · Stage: {stage} · {N} steps complete · Last updated: {date}

     What would you like to do?
       1. Continue this plan (pick up where you left off)
       2. Create a new scenario for comparison (same stage, different strategy)
       3. Start a new round (archive everything, move to next stage)
       4. Reset (discard current session, start fresh)
     ```
     - **Option 1:** Skip steps 2-5; pre-fill known company info; jump to re-evaluation.
     - **Option 2:** Ask for a short scenario label (e.g., "conservative", "aggressive").
       Create `.fundraising/{company-slug}-{stage}-{scenario}/`. Proceed fresh for that scenario.
     - **Option 3:** First ask: "What stage is the new round? (e.g., Series A, Series B, Growth)"
       Map the answer to a canonical stage slug. Then:
       `mv .fundraising/{company-slug}-{stage}*/  .fundraising/archive/round-{N}/`
       (moves all directories matching that company+stage, including scenario variants).
       Archive N = count of existing `archive/round-*/` folders + 1.
       Create `.fundraising/{company-slug}-{new-stage}/`. Show: "Archived. Starting fresh for {new-stage}."
       Proceed fresh with the new stage pre-filled — skip stage question in step 2.
     - **Option 4:** `mv .fundraising/{company-slug}-{stage}*/  .fundraising/archive/discarded-{date}/`.
       Proceed completely fresh.

   - **Multiple playbooks found (scenario comparison):** list them (format in `fundraising/SKILL.md`)
     and ask which to use; then apply options 1-4 to the selected scenario.

**Interaction rule for steps 2-4: ask ONE question per turn.** Do not dump a form or a numbered
list of 5+ questions at the founder in a single message. For each field, ask the single question,
wait for the answer, acknowledge briefly, and move to the next. This is a conversation, not a
survey. The only exception is tightly-related pairs that share an answer (e.g., "what's your
burn and runway?") — those can go together. Skip any field that was already answered by prior
conversation context, playbook content, or an earlier turn.

2. **Ask for stage** — a single question:
   "What stage are you at?" (show user-facing labels from Stage Taxonomy as options via
   AskUserQuestion)

3. **Gather project profile** — one field at a time. Adapt which fields you ask based on the
   stage (early-stage founders get a shorter list; later-stage founders provide the detail
   investors expect). For each field below, ask the question, wait for the answer, then move on.
   Skip any field you can already infer from context.

   **All stages — ask in this order:**
   1. Company or project name
   2. One-line description: "What does it do, and for whom?"
   3. Domain: "What domain? SaaS / Consumer / AI/ML / Fintech / Marketplace / Hardware / Biotech / Other"
   4. Problem: "What specific pain are you solving? 1-2 sentences."
   5. Target customer: "Who pays, and who uses it?"

   **Seed and above — also ask:**
   6. Team: "How many people on the team, and who leads eng, product, and GTM?"
   7. Geography: "What's your primary market?"

   **Series A and above — also ask:**
   8. Legal entity: "Where are you incorporated, and what type of entity?"
   9. Competitors: "Who are your 2-3 closest competitors?"

   If any answer is too vague ("a tech company", "SMBs"), ask one clarifying follow-up before
   moving to the next field. Do not proceed to step 4 until all required fields for this stage
   have been answered with real specifics.

4. **Gather fundraising context** — still one question at a time.
   1. "Have you raised before? If yes, what round(s), how much, from whom, and when?"
      (this one can be answered in a single reply since it's tightly related)
   2. "What's your current monthly burn, and how much runway do you have left?"
   3. "Has your product launched? Do you have real users today?"

5. **Branch based on product launch status:**

   **If product is NOT launched (no real users, no revenue):**
   - This is pre-seed territory. Focus the evaluation on:
     - **Team background and credentials:** Past exits, years of domain expertise, technical depth,
       complementary skill sets. Pre-seed investors are betting on people, not products.
     - **Founder-market fit:** Why are YOU the right person to solve this problem?
     - **Idea potential:** Is the market large enough? Is the timing right? Is there a credible path
       to a massive outcome?
     - **Customer discovery:** Have you talked to potential users? What did you learn?
   - **Hard gate on verdict:** A startup with no launched product and no revenue cannot receive a
     RAISE NOW verdict unless the team has exceptional credentials — repeat founders with previous
     exits, or deep domain expertise (5+ years) in the exact problem space.
   - **MVP-first recommendation:** Always include this guidance: "With modern AI development tools,
     building an MVP is faster than ever. We strongly recommend launching a working product before
     raising — even a simple version with real users gives you dramatically better leverage in
     fundraising conversations. A launched product with 100 real users is worth more than a perfect
     pitch deck."
   - Typical verdict: **NOT YET** with a concrete "build MVP first" action plan, or **MAYBE** if
     the team is strong but needs to validate the idea.

   **If product IS launched:**
   - Acknowledge the launch and assess high-level traction
   - Continue with broader readiness questions:
     - Monthly burn rate and runway
     - Growth trajectory (qualitative)
     - What the funding would be used for
     - Biggest bottleneck — money, people, or product?
     - Alternatives to raising (revenue, grants, bootstrapping)
   - Note: detailed DD and compliance probing happens later in the workflow (after `/pitch`,
     during `/deal-room`). At this stage, just flag obvious blockers like missing regulatory
     licenses for Fintech/Biotech, or no IP assignment agreements.

6. **Read the appropriate stage playbook** from `../fundraising/references/stage-playbooks/`
   for benchmark data.

7. **Output a verdict:**
   - **RAISE NOW** — specific reasoning, recommended round type, approximate amount, timeline
   - **NOT YET** — what needs to change first, concrete action plan with milestones
   - **MAYBE** — the case for and against, what evidence would tip the decision

8. **Save to playbook:** Create (or update) `.fundraising/{company-slug}-{stage}/playbook.md`.

   - **If playbook does not exist yet (fresh start):** Write the full file:
     1. YAML frontmatter with all company fields + `steps_completed.before-fundraising`
     2. `# {Company} — Fundraising Playbook` heading
     3. **Company Overview** table (populated from step 3 — identity anchor for all downstream commands)
     4. **Progress Tracker** table (all 7 steps; mark `/before-fundraising` ✅ with verdict)
     5. `## Readiness Assessment — {YYYY-MM-DD}` section with full assessment output

   - **If playbook already exists (continuing or re-running):**
     1. Update frontmatter: set `steps_completed.before-fundraising` + `last_updated`
     2. Update Progress Tracker row for `/before-fundraising`
     3. Append `## Readiness Assessment — {YYYY-MM-DD}` section (new date preserves history)

9. **Next step prompt:**
   - If product launched: "✅ Readiness assessment complete. Saved to `.fundraising/{company-slug}-{stage}/playbook.md`.
     Next: run `/product-metrics` to review your traction data in detail."
   - If not launched: "✅ Assessment complete. Saved to `.fundraising/{company-slug}-{stage}/playbook.md`.
     Focus: build and launch your MVP first. When you have real users, come back and run `/before-fundraising` again."
   - If RAISE NOW: "✅ You're ready to raise. Saved to `.fundraising/{company-slug}-{stage}/playbook.md`.
     Next: run `/product-metrics` to organize your numbers, then `/fundraising-strategy` to plan your round."

The diagnostic must be honest. If the founder isn't ready, say so clearly. A diagnostic that always
says "raise now" is broken.
