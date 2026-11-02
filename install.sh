#!/usr/bin/env sh
# Install the pop-quiz skills into every agent tool on this machine.
# Zero dependencies — pure POSIX sh. (For a richer installer that auto-detects
# 70+ agents, use the vercel-labs/skills CLI: `npx skills add <user>/pop-quiz`.)
#
# Usage:
#   ./install.sh             symlink the skills into all known agent dirs (default)
#   ./install.sh --copy      copy instead of symlink (Windows / no-symlink envs)
#   ./install.sh --uninstall remove the skills from all known agent dirs
#
# Targets cover every supported tool:
#   ~/.agents/skills  -> Cursor, opencode, Codex, Gemini CLI, Copilot CLI
#   ~/.claude/skills  -> Claude Code (does not read ~/.agents)

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
TARGETS="$HOME/.agents/skills $HOME/.claude/skills"

MODE="symlink"
for arg in "$@"; do
  case "$arg" in
    --copy)      MODE="copy" ;;
    --uninstall) MODE="uninstall" ;;
    -h|--help)   sed -n '2,17p' "$0"; exit 0 ;;
    *) echo "unknown option: $arg (try --help)" >&2; exit 1 ;;
  esac
done

FOUND=0
for manifest in "$SCRIPT_DIR"/skills/*/SKILL.md; do
  [ -f "$manifest" ] || continue
  FOUND=1
  SRC=$(dirname "$manifest")
  SKILL=$(basename "$SRC")
  for base in $TARGETS; do
    dest="$base/$SKILL"
    rm -rf "$dest"
    [ "$MODE" = "uninstall" ] && { echo "removed  $dest"; continue; }
    mkdir -p "$base"
    if [ "$MODE" = "copy" ]; then
      cp -R "$SRC" "$dest"; echo "copied   -> $dest"
    else
      ln -s "$SRC" "$dest"; echo "linked   $dest -> $SRC"
    fi
  done
done

[ "$FOUND" = 1 ] || { echo "error: no skills/*/SKILL.md found in $SCRIPT_DIR" >&2; exit 1; }

[ "$MODE" = "uninstall" ] || printf '\nDone. Restart your agent tool to pick up the skills.\n'
