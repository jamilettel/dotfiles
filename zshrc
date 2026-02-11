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

# bun completions
[ -s "/home/jamil/.bun/_bun" ] && source "/home/jamil/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/home/jamil/.bun/_bun" ] && source "/home/jamil/.bun/_bun"

export DASHDOC_PROJECT_DIRECTORY=~/delivery/dashdoc
# d() { python3 "$DASHDOC_PROJECT_DIRECTORY/dd.py" "$@"; }
dd() { python3 "$DASHDOC_PROJECT_DIRECTORY/dd.py" "$@"; }
alias cdd="cd $DASHDOC_PROJECT_DIRECTORY"

fpath=("/home/jamil/delivery/dashdoc/.dd" $fpath)
autoload -U compinit && compinit
autoload -U bashcompinit && bashcompinit

# should be _dd d, but for some reason only this works for me
compdef _dd d

alias ls=lsd
alias lg=lazygit

export EDITOR=nvim
