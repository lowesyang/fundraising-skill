# Contributing to fundraising-skill

This project is designed for community contributions. Four things you can extend:

| Type | Guide | Location |
|------|-------|----------|
| **VC Profiles** — add a new VC firm for pitch simulation | [CONTRIBUTING-vc-profiles.md](CONTRIBUTING-vc-profiles.md) | `fundraising/references/vc-profiles/{slug}.md` |
| **Domain Metrics** — add a new domain, sub-domain, or metric | [CONTRIBUTING-domain-metrics.md](CONTRIBUTING-domain-metrics.md) | `fundraising/references/metrics-by-domain/{domain}.md` |
| **Stage Playbooks** — improve fundraising stage guides | [CONTRIBUTING-stage-playbooks.md](CONTRIBUTING-stage-playbooks.md) | `fundraising/references/stage-playbooks/{stage}.md` |
| **Deck Templates** — add pitch deck templates | [CONTRIBUTING-deck-templates.md](CONTRIBUTING-deck-templates.md) | `fundraising/references/deck-templates/{template}.md` |

You can contribute with AI assistance. Just open Claude Code in your fork and say:
- "Add a VC profile for Greylock Partners"
- "Add a RegTech sub-domain to fintech metrics"
- "Add a Customer Health Score metric to the SaaS domain"

Claude will read the relevant contributing guide and create properly formatted content.

---

## General Rules

1. **Don't break the flow** — each command reads specific reference files. If you rename or
   restructure files, update the SKILL.md files that reference them.
2. **Test your changes** — install the skill locally and run the relevant command. Does it
   produce better output with your changes?
3. **One PR per contribution** — keep PRs focused. One new VC, one new sub-domain, or one
   new metric per PR.
4. **Frontmatter matters** — YAML frontmatter is used for discovery and routing. Follow the
   exact field names and formats.
5. **Update indexes** — when adding a VC, update `_index.md`. When adding a domain, update
   the domain list in `product-metrics/SKILL.md` and `fundraising/SKILL.md`.
6. **Playbook persistence** — every command appends to `.fundraising/{company-slug}-{stage}/playbook.md`
   rather than writing separate files. If modifying a command's save step, follow the pattern in
   `fundraising/SKILL.md` (Document Persistence section): update frontmatter + Progress Tracker row
   + append a new H2 section. Do not write standalone dated files for command output.

---

## Writing Style

These rules apply to all content in SKILL.md files, reference documents, VC profiles, and the README.

**Avoid em-dashes as connective tissue.**
Split into two sentences, or use a comma, colon, or parenthesis instead.

  Bad: `Shows which metrics are strengths — and which a skeptical investor will probe.`
  Good: `Shows which metrics are strengths and which a skeptical investor will probe.`

**Avoid "not X, but Y" framing.**
It sounds like AI explaining itself. Say the positive thing directly.

  Bad: `Investors are betting on people, not products.`
  Good: `At pre-seed, team credentials carry more weight than the product itself.`

**Avoid explanatory throat-clearing.**
Don't announce what you're about to say. Say it.

  Bad: `The key insight here is that investors need to see real growth.`
  Good: `Investors need to see real growth.`

**Use concrete over abstract.**
Numbers, names, and examples beat adjectives.

  Bad: `Shows strong unit economics.`
  Good: `Shows LTV/CAC with payback period and gross margin trajectory.`

**Write direct sentences.**
Start with the verb or the subject. Avoid "This command helps you understand X by doing Y."

  Bad: `This command walks you through your metrics and helps you understand what investors look for.`
  Good: `Grades your metrics RED/YELLOW/GREEN against stage benchmarks by domain.`
