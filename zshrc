export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
zstyle ':omz:update' mode auto

plugins=(
  git
  zsh-autosuggestions
  # zsh-autocomplete
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

alias ls=lsd
alias lg=lazygit

alias ts="tmux new -A -s"

export EDITOR=nvim
