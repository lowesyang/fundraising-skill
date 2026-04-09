# fundraising-skill

Startup fundraising skill for Claude Code — 6 slash commands from readiness assessment to VC pitch simulation.

## Structure

- `fundraising/` — shared references (VC profiles, stage playbooks, domain metrics, deck templates)
- `before-fundraising/`, `product-metrics/`, `fundraising-strategy/`, `fundraising-stage/`, `pitch-deck/`, `pitch/` — individual skill directories, each with a `SKILL.md`

## Contributing

Read `CONTRIBUTING.md` before making changes. It contains templates, formatting rules, and quality guidelines for:
- Adding a VC profile → `fundraising/references/vc-profiles/{slug}.md`
- Adding domain metrics → `fundraising/references/metrics-by-domain/{domain}.md`
- Modifying stage playbooks → `fundraising/references/stage-playbooks/{stage}.md`
- Modifying deck templates → `fundraising/references/deck-templates/{template}.md`

Key rules:
- One firm per file, one PR per contribution
- Public information only for VC profiles
- RED/YELLOW/GREEN benchmarks must use real industry data
- Always update `_index.md` when adding a new VC profile
- Do not remove the pre-seed hard gate (no product + no exceptional team = NOT YET)
