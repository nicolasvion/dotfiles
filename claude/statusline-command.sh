#!/bin/bash
input=$(cat)

# Parse core fields in a single jq call
IFS=$'\t' read -r MODEL PCT COST DURATION_MS DIR SESSION_ID LINES_ADDED LINES_REMOVED <<< "$(
  echo "$input" | jq -r '[
    .model.display_name,
    (.context_window.used_percentage // 0 | floor | tostring),
    (.cost.total_cost_usd // 0 | tostring),
    (.cost.total_duration_ms // 0 | tostring),
    .workspace.current_dir,
    .session_id,
    (.cost.total_lines_added // 0 | tostring),
    (.cost.total_lines_removed // 0 | tostring)
  ] | @tsv'
)"

# Optional contextual fields
SESSION_NAME=$(echo "$input" | jq -r '.session_name // empty')
WORKTREE=$(echo "$input" | jq -r '.worktree.name // empty')
VIM_MODE=$(echo "$input" | jq -r '.vim.mode // empty')

# ── Colors ──────────────────────────────────────────────────────────────────
CYAN='\033[36m'; BOLD='\033[1m'
GREEN='\033[32m'; YELLOW='\033[33m'; RED='\033[31m'
DIM='\033[2m'; RESET='\033[0m'
SEP="${DIM} · ${RESET}"

# ── Context bar (color shifts green → yellow → red) ─────────────────────────
BAR_WIDTH=12
FILLED=$((PCT * BAR_WIDTH / 100))
EMPTY=$((BAR_WIDTH - FILLED))

if   [ "$PCT" -ge 90 ]; then BAR_COLOR="$RED"
elif [ "$PCT" -ge 70 ]; then BAR_COLOR="$YELLOW"
else BAR_COLOR="$GREEN"; fi

BAR_FILL=""; BAR_EMPTY=""
[ "$FILLED" -gt 0 ] && printf -v _f "%${FILLED}s" && BAR_FILL="${_f// /█}"
[ "$EMPTY"  -gt 0 ] && printf -v _e "%${EMPTY}s"  && BAR_EMPTY="${_e// /░}"
BAR="${BAR_COLOR}${BAR_FILL}${DIM}${BAR_EMPTY}${RESET}"

# ── Cost & duration ──────────────────────────────────────────────────────────
COST_FMT=$(LC_NUMERIC=C printf '$%.2f' "$COST")
DURATION_SEC=$((DURATION_MS / 1000))
MINS=$((DURATION_SEC / 60))
SECS=$((DURATION_SEC % 60))

# ── Git (cached per session, refreshed every 5s) ────────────────────────────
CACHE="/tmp/cc-statusline-${SESSION_ID}"
cache_stale() {
  [ ! -f "$CACHE" ] || \
  [ $(( $(date +%s) - $(stat -f %m "$CACHE" 2>/dev/null || stat -c %Y "$CACHE" 2>/dev/null || echo 0) )) -gt 5 ]
}

if cache_stale; then
  if git -C "$DIR" rev-parse --git-dir > /dev/null 2>&1; then
    _branch=$(git -C "$DIR" branch --show-current 2>/dev/null)
    _staged=$(git -C "$DIR" diff --cached --numstat 2>/dev/null | wc -l | tr -d ' ')
    _modified=$(git -C "$DIR" diff --numstat 2>/dev/null | wc -l | tr -d ' ')
    _remote=$(git -C "$DIR" remote get-url origin 2>/dev/null \
      | sed 's/git@github.com:/https:\/\/github.com\//' | sed 's/\.git$//')
    printf '%s|%s|%s|%s' "$_branch" "$_staged" "$_modified" "$_remote" > "$CACHE"
  else
    printf '|||' > "$CACHE"
  fi
fi
IFS='|' read -r BRANCH STAGED MODIFIED REMOTE < "$CACHE"
REPO_NAME=$(basename "$REMOTE")

# ── Line 1 : identity + git ──────────────────────────────────────────────────
L1="${CYAN}${BOLD}${MODEL}${RESET}"

[ -n "$SESSION_NAME" ] && L1="${L1}${SEP}${DIM}${SESSION_NAME}${RESET}"
[ -n "$WORKTREE"     ] && L1="${L1}${SEP}⑂ ${WORKTREE}"

L1="${L1}${SEP}📁 ${DIR##*/}"

if [ -n "$BRANCH" ]; then
  GIT="${GREEN}🌿 ${BRANCH}${RESET}"
  [ "$STAGED"   -gt 0 ] && GIT="${GIT} ${GREEN}+${STAGED}${RESET}"
  [ "$MODIFIED" -gt 0 ] && GIT="${GIT} ${YELLOW}~${MODIFIED}${RESET}"
  L1="${L1}${SEP}${GIT}"
fi

[ -n "$VIM_MODE" ] && L1="${L1}${SEP}${DIM}${VIM_MODE}${RESET}"

if [ -n "$REMOTE" ]; then
  # Conversion ssh > https
  if [[ "$REMOTE" == git@* ]]; then
    REMOTE_HTTPS=$(echo "$REMOTE" \
| sed 's#^git@\([^:]*\):#https://\1/#')
  fi
  L1="${L1}${SEP}\033]8;;${REMOTE_HTTPS}\033\\🔗 ${REPO_NAME}\033]8;;\033\\"
fi

# ── Line 2 : metrics ─────────────────────────────────────────────────────────
L2="[${BAR}${DIM}]${RESET} ${BAR_COLOR}${PCT}%${RESET}"
L2="${L2}${SEP}${YELLOW}💰 ${COST_FMT}${RESET}"
L2="${L2}${SEP}⏱️  ${MINS}m ${SECS}s"

if [ "$LINES_ADDED" -gt 0 ] || [ "$LINES_REMOVED" -gt 0 ]; then
  L2="${L2}${SEP}${GREEN}+${LINES_ADDED}${RESET}${DIM}/${RESET}${RED}-${LINES_REMOVED}${RESET}"
fi

printf '%b\n' "$L1"
printf '%b\n' "$L2"
