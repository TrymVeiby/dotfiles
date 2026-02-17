ZSH="/Users/trymveiby/.oh-my-zsh/"

#Theme
ZSH_THEME=""

#Plugins
plugins=(git zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

#Star Ship
eval "$(starship init zsh)"

#Aliases
alias gcom='git checkout main && git pull'
alias oc="opencode"

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/trymveiby/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

export NVM_DIR="$HOME/.nvm"
    [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
    [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

### NVIM alias
alias v='nvim' # default Neovim config
alias vz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
alias vc='NVIM_APPNAME=nvim-nvchad nvim' # NvChad
alias vk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias va='nvim' # AstroVim
alias vl='NVIM_APPNAME=nvim-lunarvim nvim' # LunarVim

vv() {
  select config in lazyvim kickstart nvchad astrovim lunarvim
  do NVIM_APPNAME=nvim-$config nvim $@; break; done
}
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/trymveiby/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/trymveiby/Downloads/google-cloud-sdk/path.zsh.inc'; fi

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# GPG configuration
export GPG_TTY=$(tty)

# Lazygit alias
alias lg='lazygit'

# Open yazi function
y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Set codex path to .config/codex
 export CODEX_HOME="$HOME/.config/codex"
