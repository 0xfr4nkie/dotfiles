#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
claude_src="$repo_dir/config/claude"
claude_home="$HOME/.claude"
timestamp="$(date +%Y%m%d-%H%M%S)"

link_file() {
  local source="$1"
  local target="$2"

  if [[ ! -f "$source" ]]; then
    printf 'Missing source file: %s\n' "$source" >&2
    exit 1
  fi

  if [[ -L "$target" ]]; then
    if [[ "$(readlink "$target")" == "$source" ]]; then
      printf 'Skipped (already linked): %s -> %s\n' "$target" "$source"
      return
    fi
    printf 'Replacing symlink: %s (was -> %s)\n' "$target" "$(readlink "$target")"
    rm "$target"
  elif [[ -e "$target" ]]; then
    local backup="$target.bak.$timestamp" suffix=1
    while [[ -e "$backup" || -L "$backup" ]]; do
      backup="$target.bak.$timestamp.$suffix"
      suffix=$((suffix + 1))
    done
    mv "$target" "$backup"
    printf 'Backed up: %s -> %s\n' "$target" "$backup"
  fi

  ln -s "$source" "$target"
  printf 'Linked: %s -> %s\n' "$target" "$source"
}

# Link individual files only; ~/.claude holds machine-local state and other agents.
mkdir -p "$claude_home/agents"

link_file "$claude_src/CLAUDE.md" "$claude_home/CLAUDE.md"

for agent in "$claude_src"/agents/*.md; do
  link_file "$agent" "$claude_home/agents/$(basename "$agent")"
done

printf 'Done linking Claude config.\n'
