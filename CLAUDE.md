# fundraising-skill

Startup fundraising skill for Claude Code — 8 slash commands from readiness assessment to VC pitch simulation.

## Structure

- `fundraising/` — shared references (VC profiles, stage playbooks, domain metrics, deck templates)
- `before-fundraising/`, `product-metrics/`, `fundraising-strategy/`, `fundraising-stage/`, `pitch-deck/`, `pitch/`, `due-diligence/`, `deal-room/` — individual skill directories, each with a `SKILL.md`

## Contributing

Read `CONTRIBUTING.md` before making changes. It contains templates, formatting rules, and quality guidelines.

### Contribution types

| Type | Guide |
|------|-------|
| New VC profile | `CONTRIBUTING-vc-profiles.md` |
| New domain / sub-domain / metric | `CONTRIBUTING-domain-metrics.md` |
| Stage playbook | `CONTRIBUTING-stage-playbooks.md` |
| Deck template | `CONTRIBUTING-deck-templates.md` |

### Key rules

- One PR per contribution
- Public information only for VC profiles
- RED/YELLOW/GREEN benchmarks must use real industry data, not made-up numbers
- Every metric must have an "Applies to" tag listing relevant sub-domains
- Always update `_index.md` when adding a new VC profile
- Always update domain lists in `product-metrics/SKILL.md` and `fundraising/SKILL.md` when adding a new domain
- Do not remove the pre-seed hard gate (no product + no exceptional team = NOT YET)
