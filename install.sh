#!/bin/bash
# Fundraising Skill Installer for Claude Code
# Usage: curl -sL https://raw.githubusercontent.com/YOUR_USERNAME/fundraising-skill/main/install.sh | bash

set -e

SKILL_NAME="fundraising"
REPO_URL="https://github.com/YOUR_USERNAME/fundraising-skill"
SKILL_DIR=""

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
    SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
    echo -e "${YELLOW}Installing globally to $SKILL_DIR${NC}"
else
    # Try to find git repo root
    GIT_ROOT=$(git rev-parse --show-toplevel 2>/dev/null || echo "")
    if [ -n "$GIT_ROOT" ]; then
        SKILL_DIR="$GIT_ROOT/.claude/skills/$SKILL_NAME"
        echo -e "${YELLOW}Installing to project: $SKILL_DIR${NC}"
    else
        SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
        echo -e "${YELLOW}No git repo detected. Installing globally to $SKILL_DIR${NC}"
    fi
fi

# Check if already installed
if [ -d "$SKILL_DIR" ]; then
    echo -e "${YELLOW}Existing installation found. Updating...${NC}"
    rm -rf "$SKILL_DIR"
fi

# Create directory and clone
mkdir -p "$(dirname "$SKILL_DIR")"

# Try git clone first, fall back to curl
if command -v git &> /dev/null; then
    echo "Cloning from $REPO_URL..."
    git clone --depth 1 "$REPO_URL" /tmp/fundraising-skill-install 2>/dev/null
    mkdir -p "$SKILL_DIR"
    cp -r /tmp/fundraising-skill-install/fundraising/* "$SKILL_DIR/"
    rm -rf /tmp/fundraising-skill-install
else
    echo "git not found, downloading via curl..."
    curl -sL "$REPO_URL/archive/main.tar.gz" | tar xz -C /tmp
    mkdir -p "$SKILL_DIR"
    cp -r /tmp/fundraising-skill-main/fundraising/* "$SKILL_DIR/"
    rm -rf /tmp/fundraising-skill-main
fi

# Verify installation
if [ -f "$SKILL_DIR/SKILL.md" ]; then
    echo ""
    echo -e "${GREEN}✅ Installation successful!${NC}"
    echo ""
    echo -e "Installed to: ${CYAN}$SKILL_DIR${NC}"
    echo ""
    echo -e "${GREEN}Available commands:${NC}"
    echo "  /before-fundraising   — Assess fundraising readiness"
    echo "  /product-metrics      — Review traction & key numbers"
    echo "  /fundraising-strategy — Plan how much to raise & how"
    echo "  /fundraising-stage    — Create execution plan"
    echo "  /pitch-deck           — Build your pitch deck outline"
    echo "  /pitch                — Practice pitching to simulated VCs"
    echo ""
    echo -e "${YELLOW}Get started:${NC} Open Claude Code and type ${CYAN}/before-fundraising${NC}"
    echo ""
else
    echo ""
    echo "❌ Installation failed. Please try manual installation:"
    echo "   git clone $REPO_URL ~/.claude/skills/$SKILL_NAME"
    exit 1
fi
