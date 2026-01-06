#!/bin/bash
# Script to set up the forked adaptive_platform_ui repository in SkinDetector organization

echo "🚀 Setting up adaptive_platform_ui fork for SkinDetector organization"
echo ""
echo "This script will help you push the forked package to your private repository."
echo ""
echo "Before running this script, please:"
echo "1. Create a new private repository in your SkinDetector organization on GitHub"
echo "2. Name it 'adaptive_platform_ui' (or your preferred name)"
echo "3. Do NOT initialize it with a README, .gitignore, or license"
echo ""
read -p "Press Enter when you've created the repository..."

echo ""
read -p "Enter your GitHub username: " GITHUB_USERNAME
read -p "Enter the repository name (default: adaptive_platform_ui): " REPO_NAME
REPO_NAME=${REPO_NAME:-adaptive_platform_ui}

echo ""
echo "Setting up remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "https://github.com/SkinDetector/${REPO_NAME}.git"

echo ""
echo "✅ Remote configured!"
echo ""
echo "To push your changes, run:"
echo "  git push -u origin main"
echo ""
echo "Or if you want to push now, type 'yes':"
read -p "Push now? (yes/no): " PUSH_NOW

if [ "$PUSH_NOW" = "yes" ]; then
  echo ""
  echo "Pushing to SkinDetector/${REPO_NAME}..."
  git push -u origin main
  echo ""
  echo "✅ Successfully pushed to SkinDetector/${REPO_NAME}!"
else
  echo ""
  echo "You can push later with:"
  echo "  git push -u origin main"
fi

