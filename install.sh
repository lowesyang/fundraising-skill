#!/bin/bash
# Fundraising Skill Installer for Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/lowesyang/fundraising-skill/main/install.sh | bash

set -e

REPO_URL="https://github.com/lowesyang/fundraising-skill"
SKILLS_DIR=""

# All skill directories to install
SKILL_DIRS="fundraising before-fundraising product-metrics fundraising-strategy fundraising-stage pitch-deck pitch due-diligence deal-room fundraising-upgrade"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo ""
echo -e "${CYAN}╔══════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║     Fundraising Skill for Claude Code        ║${NC}"
echo -e "${CYAN}║     Full-lifecycle fundraising OS             ║${NC}"
echo -e "${CYAN}╚══════════════════════════════════════════════╝${NC}"
echo ""

# Determine install location
if [ "$1" = "--global" ] || [ "$1" = "-g" ]; then
    SKILLS_DIR="$HOME/.claude/skills"
    echo -e "${YELLOW}Installing globally to $SKILLS_DIR${NC}"
else
    GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "")
    if [ -n "$GIT_ROOT" ]; then
        SKILLS_DIR="$GIT_ROOT/.claude/skills"
        echo -e "${YELLOW}Installing to project: $SKILLS_DIR${NC}"
    else
        SKILLS_DIR="$HOME/.claude/skills"
        echo -e "${YELLOW}No git repo detected. Installing globally to $SKILLS_DIR${NC}"
    fi
fi

# Clean up existing installation
for dir in $SKILL_DIRS; do
    [ -d "$SKILLS_DIR/$dir" ] && rm -rf "$SKILLS_DIR/$dir"
done

# Clone repo to temp directory
mkdir -p "$SKILLS_DIR"
TMP_DIR=$(mktemp -d)

if command -v git &> /dev/null; then
    echo "Cloning from $REPO_URL..."
    git clone --depth 1 "$REPO_URL" "$TMP_DIR/repo" 2>/dev/null
else
    echo "Downloading via curl..."
    curl -sL "$REPO_URL/archive/main.tar.gz" | tar xz -C "$TMP_DIR"
    mv "$TMP_DIR/fundraising-skill-main" "$TMP_DIR/repo"
fi

# Copy each skill directory
for dir in $SKILL_DIRS; do
    if [ -d "$TMP_DIR/repo/$dir" ]; then
        cp -r "$TMP_DIR/repo/$dir" "$SKILLS_DIR/$dir"
    fi
done

# Copy shared files (VERSION, CHANGELOG, bin)
for f in VERSION CHANGELOG.md; do
    [ -f "$TMP_DIR/repo/$f" ] && cp "$TMP_DIR/repo/$f" "$SKILLS_DIR/fundraising/$f"
done
if [ -d "$TMP_DIR/repo/bin" ]; then
    mkdir -p "$SKILLS_DIR/fundraising/bin"
    cp -r "$TMP_DIR/repo/bin/"* "$SKILLS_DIR/fundraising/bin/"
    chmod +x "$SKILLS_DIR/fundraising/bin/"* 2>/dev/null
fi

# Clean up
rm -rf "$TMP_DIR"

# Show version
INSTALLED_VER=$(cat "$SKILLS_DIR/fundraising/VERSION" 2>/dev/null | tr -d '[:space:]')

# Verify installation
INSTALLED=0
for dir in $SKILL_DIRS; do
    [ -f "$SKILLS_DIR/$dir/SKILL.md" ] && INSTALLED=$((INSTALLED + 1))
done

EXPECTED=10
if [ "$INSTALLED" -ge "$((EXPECTED - 1))" ]; then
    echo ""
    echo -e "${GREEN}✅ Installation successful! v${INSTALLED_VER} ($INSTALLED skills installed)${NC}"
    echo ""
    echo -e "Installed to: ${CYAN}$SKILLS_DIR${NC}"
    echo ""
    echo -e "${GREEN}Available commands:${NC}"
    echo "  /before-fundraising    — Assess fundraising readiness"
    echo "  /product-metrics       — Review traction & key numbers"
    echo "  /fundraising-strategy  — Plan how much to raise & how"
    echo "  /fundraising-stage     — Create execution plan"
    echo "  /pitch-deck            — Build your pitch deck outline"
    echo "  /pitch                 — Practice pitching to simulated VCs"
    echo "  /due-diligence         — Prepare for investor DD"
    echo "  /deal-room             — Multi-VC fundraising process simulation"
    echo "  /fundraising-upgrade   — Check for updates"
    echo ""
    echo -e "${YELLOW}Get started:${NC} Open Claude Code and type ${CYAN}/before-fundraising${NC}"
    echo ""
else
    echo ""
    echo -e "${YELLOW}⚠️  Partial installation: $INSTALLED/$EXPECTED skills installed.${NC}"
    echo "Try manual installation:"
    echo "   git clone $REPO_URL /tmp/fundraising-skill"
    echo "   cp -r /tmp/fundraising-skill/{fundraising,before-fundraising,product-metrics,fundraising-strategy,fundraising-stage,pitch-deck,pitch,deal-room} $SKILLS_DIR/"
    exit 1
fi
