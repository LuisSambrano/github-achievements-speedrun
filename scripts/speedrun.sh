#!/bin/bash

# 🏆 GitHub Achievements Speedrun Script
# Author: Luis Sambrano
# License: MIT

echo "🚀 Starting GitHub Achievements Speedrun..."
echo "This script requires the GitHub CLI (gh) to be authenticated."
echo ""

# Check for gh CLI
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) not found. Please install it first."
    exit 1
fi

echo "🔍 Checking authentication..."
gh auth status
if [ $? -ne 0 ]; then
    echo "❌ Not authenticated. Run 'gh auth login' first."
    exit 1
fi

echo ""
echo "🤠 Achievement 1: QUICKDRAW"
echo "   (Closes an issue within 5 minutes of opening)"
read -p "Press [Enter] to execute..."
gh issue create --title "Achievement: Quickdraw" --body "Speedrun test." > /dev/null
ISSUE_NUM=$(gh issue list --limit 1 --json number --jq '.[0].number')
gh issue close $ISSUE_NUM
echo "✅ Quickdraw attempt complete!"

echo ""
echo "🦈 Achievement 2: PULL SHARK + YOLO"
echo "   (Merge a PR + Merge without review)"
read -p "Press [Enter] to execute..."
git checkout -b speedrun-branch
git commit --allow-empty -m "chore: speedrun commit"
git push -u origin speedrun-branch
gh pr create --title "Achievement: Speedrun PR" --body "Automated PR."
gh pr merge --merge --delete-branch
echo "✅ Pull Shark & YOLO attempt complete!"

echo ""
echo "🎉 Speedrun Finished!"
echo "Check your profile in a few minutes."
