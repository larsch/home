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
alias syu='sudo pacman -Syu --noconfirm'
alias dgit='git --work-tree=$HOME --git-dir=$HOME/home.git'
alias arch-checkout-community='svn checkout --depth=empty svn://svn.archlinux.org/community'
alias arch-checkout-packages='svn checkout --depth=empty svn://svn.archlinux.org/packages'
alias esptool='python2 ~/esp/esp-open-sdk/esptool/esptool.py'
function aur-download() { curl -OLf https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz }

whence ruby > /dev/null
if [ $? = 0 ]; then
  PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
  export PATH
fi
export SMING_HOME=/home/larsch/esp/Sming/Sming
export ESP_HOME=/home/larsch/esp/esp-open-sdk
