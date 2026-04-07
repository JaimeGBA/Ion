#!/bin/bash
# auto-sync.sh — Auto-commit knowledge changes after Write/Edit
# Runs as PostToolUse hook on Write and Edit tools

# Read hook input from stdin
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

# Skip if no file path parsed
[ -z "$FILE_PATH" ] && exit 0

# Never commit sensitive data
[[ "$FILE_PATH" == *".sensitive/"* ]] && exit 0

# Ensure we're in a git repo
REPO_ROOT=$(git rev-parse --show-toplevel 2>/dev/null)
[ -z "$REPO_ROOT" ] && exit 0
cd "$REPO_ROOT"

# Get path relative to repo root
REL_PATH=$(python3 -c "import os.path; print(os.path.relpath('$FILE_PATH', '$REPO_ROOT'))" 2>/dev/null)
[ -z "$REL_PATH" ] && exit 0

# Only auto-commit files within the repo
[[ "$REL_PATH" == ../* ]] && exit 0

# Pull latest before committing to minimize conflicts (only if remote exists)
if git remote get-url origin &>/dev/null; then
  git pull --rebase --quiet 2>/dev/null
fi

# Stage the file
git add "$REL_PATH" 2>/dev/null || exit 0

# Build a descriptive commit message from the path
AREA=$(echo "$REL_PATH" | cut -d'/' -f1)
SUB=$(echo "$REL_PATH" | cut -d'/' -f2)
FILENAME=$(basename "$REL_PATH" .md)

case "$AREA" in
  knowledge) MSG="ion: update $SUB/$FILENAME" ;;
  ion)       MSG="ion: update self/$FILENAME" ;;
  ops)       MSG="ion: update ops/$FILENAME" ;;
  *)         MSG="ion: update $REL_PATH" ;;
esac

# Commit (silently skip if nothing to commit)
git commit -m "$MSG" 2>/dev/null

exit 0
