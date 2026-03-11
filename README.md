# dotfiles

Personal dotfiles for zsh, starship, tmux, ghostty, Claude Code, and Codex.

## Contents

- **`.zshrc`** - Zsh shell configuration with Oh My Zsh, plugins, and aliases
- **`.config/starship.toml`** - Starship prompt configuration
- **`.config/ghostty/config`** - Ghostty terminal configuration
- **`.tmux.conf`** - Tmux configuration
- **`.claude/settings.json`** - Claude Code settings
- **`.config/nvim`** - Neovim configuration
- **`.sharedAgents`** - Shared agent instructions and skills consumed by both Claude and Codex

## Features

### Shell Setup
- Oh My Zsh with `git` and `zsh-autosuggestions` plugins
- Starship prompt for a fast and customizable command prompt
  <img width="660" height="130" alt="image" src="https://github.com/user-attachments/assets/be14add1-262f-4646-8f24-3cda2843f5c3" />


### Tool Aliases & Functions
- **Git**: `gcom` - checkout main and pull
- **Neovim**: `v`, `vz`, `vc`, `vk`, `va`, `vl` - quick launch different Nvim configs
- **Lazygit**: `lg` - launch lazygit
- **Yazi**: `y()` - file manager with directory navigation

### Version Managers
- NVM (Node Version Manager)
- Pyenv (Python Version Manager)

### Shared Agent Config
- `sharedAgents/.sharedAgents` is the canonical source for shared `AGENTS.md` instructions and reusable skills
- `codex/.config/codex/AGENTS.MD` and selected skill directories are symlinked to the shared source
- `claude/.claude/AGENTS.md` and selected skill directories are symlinked to the same shared source

## Quick Setup on a New Machine

### Prerequisites

#### macOS
```bash
# Homebrew packages
brew install stow starship nvm pyenv lazygit yazi tmux ghostty neovim

# Nerd Font for Ghostty
brew install --cask font-fantasque-sans-mono-nerd-font

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

#### Linux (Arch/CachyOS)
```bash
# Pacman packages
sudo pacman -S stow starship nvm pyenv lazygit yazi zsh tmux ghostty neovim

# Nerd Font for Ghostty
sudo pacman -S ttf-fantasque-nerd

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

### Installation

Clone the repository to your home directory and run stow:
```bash
git clone https://github.com/TrymVei/dotfiles.git ~/dotfiles && cd ~/dotfiles && stow */
```

That's it! Your shell will be configured on the next reload.

### Verify Setup
```bash
echo $ZSH_THEME  # Should be empty (using Starship)
zsh               # Reload shell
```

## Customization

- Edit `zsh/.zshrc` for shell configurations and aliases
- Edit `starship/.config/starship.toml` for prompt appearance
- Edit `ghostty/.config/ghostty/config` for terminal settings
- Edit `tmux/.tmux.conf` for tmux settings
- Edit `claude/.claude/settings.json` for Claude Code settings
- Edit `sharedAgents/.sharedAgents/AGENTS.md` and `sharedAgents/.sharedAgents/skills` for shared agent behavior
- Edit `nvim/.config/nvim` for Neovim settings

Changes in `~/dotfiles` will automatically reflect thanks to symlinks.

## Notes

- The configuration uses Starship as the primary prompt (theme in `.zshrc` is empty)
- Some paths are machine-specific and may need adjustment
- Version managers (nvm, pyenv) are referenced - install only what you need
