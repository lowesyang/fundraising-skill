---
name: fundraising-upgrade
description: >
  Upgrade the fundraising skill to the latest version. Detects your install type
  (git clone vs vendored copy), pulls the latest version, and shows what's new.
  Use when asked to "upgrade fundraising", "update fundraising skill",
  "get latest fundraising version", or "check for fundraising updates".
---

# /fundraising-upgrade — Update to Latest Version

Upgrades the fundraising skill to the latest release from GitHub.

## Flow

### Step 1: Check for Updates

Run the update check script to compare local vs remote version:

```bash
_UPD=$( ~/.claude/skills/fundraising/bin/fundraising-update-check --force 2>/dev/null || echo "" )
```

Parse the output:
- `JUST_UPGRADED <old> <new>` → Show "What's New" from CHANGELOG.md, skip upgrade
- `UPGRADE_AVAILABLE <old> <new>` → Proceed to Step 2
- Empty → "You're on the latest version (v{version}). No update needed."

### Step 2: Confirm with User

Ask via AskUserQuestion:
1. **"Yes, upgrade now"** → Proceed to Step 3
2. **"Not now"** → Skip, continue with current version

### Step 3: Detect Install Type

Check where the skill is installed:

```bash
# Global git clone
if [ -d "$HOME/.claude/skills/fundraising/.git" ]; then
    INSTALL_TYPE="global-git"
    INSTALL_DIR="$HOME/.claude/skills/fundraising"

# Project-level git clone
elif [ -d ".claude/skills/fundraising/.git" ]; then
    INSTALL_TYPE="local-git"
    INSTALL_DIR=".claude/skills/fundraising"

# Global vendored (no .git)
elif [ -d "$HOME/.claude/skills/fundraising" ]; then
    INSTALL_TYPE="vendored-global"
    INSTALL_DIR="$HOME/.claude/skills"

# Project-level vendored
elif [ -d ".claude/skills/fundraising" ]; then
    INSTALL_TYPE="vendored-local"
    INSTALL_DIR=".claude/skills"
fi
```

### Step 4: Save Old Version

```bash
OLD_VERSION=$(cat "$INSTALL_DIR/fundraising/VERSION" 2>/dev/null || cat "$INSTALL_DIR/VERSION" 2>/dev/null || echo "unknown")
```

### Step 5: Upgrade

**For git installs:**
```bash
# Find the repo root (parent of the skill directories)
cd "$REPO_ROOT"
git fetch origin
git pull --ff-only origin main
```

**For vendored installs (installed via install.sh or manual copy):**
```bash
# Re-run the install script
curl -sL https://raw.githubusercontent.com/lowesyang/fundraising-skill/main/install.sh | bash -s -- --global
```

Or if project-level:
```bash
curl -sL https://raw.githubusercontent.com/lowesyang/fundraising-skill/main/install.sh | bash
```

### Step 6: Write Upgrade Markers

```bash
mkdir -p ~/.fundraising-skill
echo "$OLD_VERSION" > ~/.fundraising-skill/just-upgraded-from
rm -f ~/.fundraising-skill/last-update-check
```

### Step 7: Show What's New

Read `CHANGELOG.md` from the installed skill directory. Extract entries between the old
version and the new version. Summarize as 5-7 user-facing bullets:

```
fundraising-skill v{new} — upgraded from v{old}!

What's new:
- [bullet 1]
- [bullet 2]
- ...
```

If CHANGELOG.md is not available, just show the version change.

## Version Check in Other Skills

Each fundraising skill can optionally check for updates on load by reading the update-check
script output. This is lightweight (cached for 60 minutes, fails silently on network error).

To add version checking to a skill's preamble, include this note in the SKILL.md:

```
Before starting, check for updates:
Run `~/.claude/skills/fundraising/bin/fundraising-update-check` silently.
If output contains UPGRADE_AVAILABLE, mention: "A new version of fundraising-skill
is available. Run /fundraising-upgrade to update."
```

This is optional and non-blocking. The skill should continue normally regardless of
the update check result.
