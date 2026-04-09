# fundraising-skill

Startup fundraising skill for Claude Code — 6 slash commands from readiness assessment to VC pitch simulation.

## Structure

- `fundraising/` — shared references (VC profiles, stage playbooks, domain metrics, deck templates)
- `before-fundraising/`, `product-metrics/`, `fundraising-strategy/`, `fundraising-stage/`, `pitch-deck/`, `pitch/` — individual skill directories, each with a `SKILL.md`

## Contributing

Read `CONTRIBUTING.md` before making changes. It contains templates, formatting rules, and quality guidelines.

### Contribution types

| Type | Location | Section |
|------|----------|---------|
| New VC profile | `fundraising/references/vc-profiles/{slug}.md` | CONTRIBUTING.md #1 |
| New domain | `fundraising/references/metrics-by-domain/{domain}.md` | CONTRIBUTING.md #2a |
| New sub-domain to existing domain | Edit existing domain file | CONTRIBUTING.md #2b |
| New metric to existing domain | Append to existing domain file | CONTRIBUTING.md #2c |
| Stage playbook | `fundraising/references/stage-playbooks/{stage}.md` | CONTRIBUTING.md #3 |
| Deck template | `fundraising/references/deck-templates/{template}.md` | CONTRIBUTING.md #4 |

### Key rules

- One PR per contribution
- Public information only for VC profiles
- RED/YELLOW/GREEN benchmarks must use real industry data, not made-up numbers
- Every metric must have an "Applies to" tag listing relevant sub-domains
- Always update `_index.md` when adding a new VC profile
- Always update domain lists in `product-metrics/SKILL.md` and `fundraising/SKILL.md` when adding a new domain
- Do not remove the pre-seed hard gate (no product + no exceptional team = NOT YET)
