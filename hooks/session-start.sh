#!/bin/bash
# session-start.sh — Sync the knowledge base at session start
# Runs on SessionStart hook event

REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
[ -z "$REPO_ROOT" ] && exit 0
cd "$REPO_ROOT"

# Check if remote exists
if git remote get-url origin &>/dev/null; then
  PULL_OUTPUT=$(git pull --rebase 2>&1)

  if echo "$PULL_OUTPUT" | grep -q "CONFLICT"; then
    echo "WARNING: Merge conflicts detected after git pull. Help your partner resolve them before proceeding."
    echo "$PULL_OUTPUT"
  elif echo "$PULL_OUTPUT" | grep -q "Already up to date"; then
    : # Silent — no changes
  else
    echo "Synced latest changes from remote."
  fi
fi

exit 0
