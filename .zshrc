# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep correct
bindkey -e
bindkey -r "^Ed" # Leave my end-of-line key alone
zstyle :compinstall filename '/home/larsch/.zshrc'
autoload -Uz compinit
compinit
alias dgit='git --work-tree=$HOME --git-dir=$HOME/home.git'
