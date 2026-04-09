---
name: before-fundraising
description: >
  Fundraising readiness assessment for startup founders. Evaluates whether you should raise money
  right now — honest verdict with hard gates. Asks about stage, team, product launch status,
  traction, and gives a RAISE NOW / NOT YET / MAYBE verdict.
  Use when the user asks "should I raise?", "am I ready to fundraise?", "do I need funding?",
  "evaluate my startup for fundraising", "fundraising readiness", or "before fundraising".
  Part of the fundraising skill workflow: /before-fundraising → /product-metrics →
  /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch.
---

# /before-fundraising — Fundraising Readiness Assessment

This is the entry point of the fundraising workflow. Before jumping into pitch decks and VC meetings,
founders need an honest assessment of whether they should be raising at all.

## Workflow Context

This command is **Step 0** of the fundraising workflow:

```
▶ /before-fundraising → /product-metrics → /fundraising-strategy → /fundraising-stage → /pitch-deck → /pitch
```

## Stage Taxonomy

| Canonical Stage | User-Facing Labels | VC Tier |
|----------------|-------------------|---------|
| `pre-seed` | "I have an idea", "building MVP" | Seed tier |
| `seed` | "MVP built, early users" | Seed tier |
| `series-a` | "Proven PMF, scaling" | Series A/B tier |
| `series-b` | "Repeatable growth" | Series A/B tier |
| `growth` | "Market leader, Series C+" | Growth tier (limited in v1) |

## Flow

1. **Check for existing documents** in `.fundraising/` directory. If prior documents exist from
   earlier sessions, note them and offer to build on that context.

2. **Gather baseline context** — ask these questions upfront:
   - What stage are you at? (use user-facing labels from Stage Taxonomy)
   - Have you raised before? If so, what round, how much, from whom?
   - What's your total funding raised to date?
   - Who are your current investors (if any)?
   - Has your product launched? Do you have real users?

3. **Branch based on product launch status:**

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

4. **Read the appropriate stage playbook** from `../fundraising/references/stage-playbooks/`
   for benchmark data.

5. **Output a verdict:**
   - **RAISE NOW** — specific reasoning, recommended round type, approximate amount, timeline
   - **NOT YET** — what needs to change first, concrete action plan with milestones
   - **MAYBE** — the case for and against, what evidence would tip the decision

6. **Save document:** Write the full assessment to `.fundraising/readiness-assessment-{YYYY-MM-DD}.md`
   with YAML frontmatter (command, date, stage, verdict, status). Append a timeline entry
   to `.fundraising/timeline.jsonl`.

7. **Next step prompt:**
   - If product launched: "✅ Readiness assessment complete. Saved to `.fundraising/readiness-assessment-{date}.md`.
     Next: run `/product-metrics` to review your traction data in detail."
   - If not launched: "✅ Assessment complete. Saved to `.fundraising/readiness-assessment-{date}.md`.
     Focus: build and launch your MVP first. When you have real users, come back and run `/before-fundraising` again."
   - If RAISE NOW: "✅ You're ready to raise. Saved to `.fundraising/readiness-assessment-{date}.md`.
     Next: run `/product-metrics` to organize your numbers, then `/fundraising-strategy` to plan your round."

The diagnostic must be honest. If the founder isn't ready, say so clearly. A diagnostic that always
says "raise now" is broken.
