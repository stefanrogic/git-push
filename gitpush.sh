#!/bin/sh

# Simple Git Push Script
# Usage: ./gitpush.sh "commit message"

# Check if commit message is provided
if [ -z "$1" ]; then
    echo "Error: Please provide a commit message"
    echo "Usage: ./gitpush.sh \"your commit message\""
    exit 1
fi

# Get the commit message
COMMIT_MESSAGE="$1"

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "Error: Not a git repository. Please run 'git init' first."
    exit 1
fi

# Show current status
echo "Current status:"
git status --short

# Add all changes
echo "\nAdding all changes..."
git add .

# Commit changes
echo "\nCommitting changes..."
git commit -m "$COMMIT_MESSAGE"

# Check if commit was successful
if [ $? -ne 0 ]; then
    echo "Error: Commit failed"
    exit 1
fi

# Push to remote repository
echo "\nPushing to remote repository..."
git push

# Check if push was successful
if [ $? -eq 0 ]; then
    echo "\n✓ Successfully pushed to remote repository!"
else
    echo "\n✗ Push failed. You may need to pull first or set upstream branch."
    echo "Try: git push --set-upstream origin <branch-name>"
    exit 1
fi
