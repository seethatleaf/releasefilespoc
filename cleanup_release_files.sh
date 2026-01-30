#!/bin/bash
set -e

BASE_FILE="BASE/releasefile/user_stories_BASE"
SIT_FILE="SITFULL/releasefile/user_stories_SITFULL"

if [[ ! -f "$BASE_FILE" || ! -f "$SIT_FILE" ]]; then
  echo "ERROR: One or both release files missing"
  exit 1
fi

BASE_CONTENT=$(sed '/^\s*$/d' "$BASE_FILE")
SIT_CONTENT=$(sed '/^\s*$/d' "$SIT_FILE")

echo "Comparing BASE and SITFULL release files..."

if [[ "$BASE_CONTENT" == "$SIT_CONTENT" ]]; then
  echo "Files are SAME → clearing BOTH"
  > "$BASE_FILE"
  > "$SIT_FILE"
else
  echo "Files are DIFFERENT → clearing SITFULL only"
  > "$SIT_FILE"
fi

echo "Cleanup completed"
