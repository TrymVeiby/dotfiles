# dotfiles

Personal dotfiles for zsh and starship configuration.

## Contents

- **`.zshrc`** - Zsh shell configuration with Oh My Zsh, plugins, and aliases
- **`.config/starship.toml`** - Starship prompt configuration

## Features

### Shell Setup
- Oh My Zsh with `git` and `zsh-autosuggestions` plugins
- Starship prompt for a fast and customizable command prompt

### Tool Aliases & Functions
- **Git**: `gcom` - checkout main and pull
- **Neovim**: `v`, `vz`, `vc`, `vk`, `va`, `vl` - quick launch different Nvim configs
- **Lazygit**: `lg` - launch lazygit
- **Yazi**: `y()` - file manager with directory navigation

### Version Managers
- NVM (Node Version Manager)
- Pyenv (Python Version Manager)

## Quick Setup on a New Machine

### Prerequisites
Install the required tools:
```bash
# Homebrew packages
brew install stow starship nvm pyenv lazygit yazi

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Zsh plugins (in ~/.oh-my-zsh/custom/plugins/)
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
```

### Installation

1. Clone the repository:
```bash
git clone https://github.com/TrymVei/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Create symlinks with stow:
```bash
stow .
```

That's it! Your shell will be configured on the next reload.

### Verify Setup
```bash
echo $ZSH_THEME  # Should be empty (using Starship)
zsh               # Reload shell
```

## Customization

- Edit `.zshrc` for shell configurations and aliases
- Edit `.config/starship.toml` for prompt appearance

Changes in `~/dotfiles` will automatically reflect in `~/.zshrc` and `~/.config/starship.toml` thanks to the symlinks.

## Notes

- The configuration uses Starship as the primary prompt (theme in `.zshrc` is empty)
- Some paths are machine-specific (Google Cloud SDK, etc.) and may need adjustment
- Rancher Desktop and various version managers are referenced - install only what you need