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
