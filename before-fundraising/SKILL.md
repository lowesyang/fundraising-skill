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

2. **Gather stage** — first ask a single question:
   - What stage are you at? (show user-facing labels from Stage Taxonomy)

3. **Gather project profile** — once the stage is known, collect the project's basic identity.
   Adapt the required fields to the stage so early founders aren't burdened with questions
   that don't apply yet, while later-stage founders provide the detail investors expect.

   **All stages (required):**
   | Field | Description | Example |
   |-------|-------------|---------|
   | Company / project name | Working name or registered name | "Acme Monitor" |
   | One-line description | What does it do, for whom? | "API uptime monitoring for DevOps teams" |
   | Domain / industry | SaaS, Consumer, AI/ML, Fintech, Marketplace, Hardware, Biotech, Other | "B2B SaaS" |
   | Problem statement | What pain are you solving? 1-2 sentences. | "DevOps teams waste hours debugging API outages because existing tools lack real-time root-cause analysis." |
   | Target customer | Who pays / who uses? | "Mid-market engineering teams (50-500 employees)" |

   **Seed and above — add:**
   | Field | Description |
   |-------|-------------|
   | Team size & key roles | Headcount and whether you have technical, product, and GTM leads |
   | Geography / market | Primary market region |

   **Series A and above — add:**
   | Field | Description |
   |-------|-------------|
   | Legal entity & incorporation | Where incorporated, entity type |
   | Key competitors | 2-3 closest competitors by name |

   Present these as a simple form the founder fills in. Do NOT proceed until the required fields
   are answered — the assessment needs this context to be useful. If any required field is blank
   or too vague (e.g., "a tech company"), ask the founder to be more specific.

4. **Gather fundraising context** — after the profile is complete, ask:
   - Have you raised before? If so, what round, how much, from whom?
   - What's your total funding raised to date?
   - Who are your current investors (if any)?
   - Has your product launched? Do you have real users?

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
