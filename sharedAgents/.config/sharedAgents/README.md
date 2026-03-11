# sharedAgents

Shared source for agent instructions and reusable skills.

## Structure

- `AGENTS.md` is the shared instruction file.
- `skills/` contains the shared skill directories.

## Stow Target

This package is exposed as `~/.config/sharedAgents` through GNU Stow.

## Consumers

- `codex/.config/codex/AGENTS.MD` points here with a symlink.
- `codex/.config/codex/skills/*` points here with symlinks for user-managed skills.
- `claude/.claude/AGENTS.md` points here with a symlink.
- `claude/.claude/skills/*` points here with symlinks.

Edit the files in this directory when you want both tools to pick up the same changes.
