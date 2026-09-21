export HOMEBREW_PREFIX="/opt/homebrew"
export ZSH="$HOME/.oh-my-zsh"

#Theme
ZSH_THEME=""

#Plugins
plugins=(git)
source "$ZSH/oh-my-zsh.sh"
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


#Star Ship
eval "$(starship init zsh)"

export NVM_DIR="$HOME/.nvm"
[ -s "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm/nvm.sh" ] && \. "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm/nvm.sh"
[ -s "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm/etc/bash_completion.d/nvm" ] && \. "${HOMEBREW_PREFIX:-/opt/homebrew}/opt/nvm/etc/bash_completion.d/nvm"

#Aliases
alias gcom='git checkout main && git pull'
alias oc="opencode"
alias lg='lazygit'
alias aslw='aws sso login --profile sso-dev-eks-wapp'
alias aslt='aws sso login --sso-session toff'
alias k9sr='k9s --readonly'
alias pp='pnpm'
alias herdr='hsl'

### NVIM alias
alias v='nvim' # default Neovim config
alias vz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
alias vc='NVIM_APPNAME=nvim-nvchad nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias va='nvim' # AstroVim
alias vl='NVIM_APPNAME=nvim-lunarvim nvim' # LunarVim

vv() {
  select config in lazyvim kickstart nvchad astrovim lunarvim
  do NVIM_APPNAME=nvim-$config nvim "$@"; break; done
}

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv >/dev/null && eval "$(pyenv init -)"

# GPG configuration
export GPG_TTY=$(tty)

# Open yazi function
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Refresh claude session
clauderefresh() {
  echo "Sletter ~/.aws/credentials..."
  rm -f ~/.aws/credentials

  echo "Henter ny identity..."
  aws sts get-caller-identity || echo "Feilet å hente identity"
}

# Set codex path to .config/codex
export CODEX_HOME="$HOME/.config/codex"

if [ -f "$HOME/.zshrc.local" ]; then
  . "$HOME/.zshrc.local"
fi

# Set pi condig path to .config/pi
export PI_CODING_AGENT_DIR="$HOME/.config/pi/agent"


# bun completions
[ -s "/Users/trymveiby/.bun/_bun" ] && source "/Users/trymveiby/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export AWS_PROFILE=claude-code-eu-north-1
export AWS_DEFAULT_REGION=eu-west-1
export AWS_REGION=eu-west-1

export PATH="$HOME/.local/bin:$PATH"
