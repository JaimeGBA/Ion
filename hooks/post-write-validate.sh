#!/bin/bash
# post-write-validate.sh — Validate knowledge files have proper frontmatter
# Runs as PostToolUse hook on Write and Edit tools

# Read hook input from stdin
INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // empty' 2>/dev/null)

[ -z "$FILE_PATH" ] && exit 0

# Only validate knowledge files
[[ "$FILE_PATH" != *"/knowledge/"* ]] && exit 0

# Skip READMEs (they don't need full frontmatter)
[[ "$(basename "$FILE_PATH")" == "README.md" ]] && exit 0

# Check file exists
[ ! -f "$FILE_PATH" ] && exit 0

# Check for YAML frontmatter
FIRST_LINE=$(head -1 "$FILE_PATH")
if [ "$FIRST_LINE" != "---" ]; then
  echo "WARNING: $FILE_PATH is missing YAML frontmatter. Knowledge files must start with --- frontmatter containing: title, description, last_updated, updated_by, status."
  exit 0
fi

# Check required fields exist in frontmatter
FRONTMATTER=$(sed -n '1,/^---$/p' "$FILE_PATH" | tail -n +2 | head -n -1)

for FIELD in title description last_updated updated_by status; do
  if ! echo "$FRONTMATTER" | grep -q "^${FIELD}:"; then
    echo "WARNING: $FILE_PATH frontmatter is missing required field: $FIELD"
  fi
done

exit 0
