# Lines configured by zsh-newuser-install
#export LC_TIME=en_GB
export XKB_DEFAULT_OPTIONS=ctrl:nocaps
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
alias tmuxre='tmux new-session -t default || tmux new-session -s default'
alias dgit='git --work-tree=$HOME --git-dir=$HOME/home.git'
alias arch-checkout-community='svn checkout --depth=empty svn://svn.archlinux.org/community'
alias arch-checkout-packages='svn checkout --depth=empty svn://svn.archlinux.org/packages'
alias arch-remove-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias esptool='python2 ~/esp/esp-open-sdk/esptool/esptool.py'
alias clip='xclip -selection clipboard'
function aur-download() { curl -OLf https://aur.archlinux.org/cgit/aur.git/snapshot/$1.tar.gz }

[ -d "$HOME/bin" ] && export PATH=$PATH:$HOME/bin

whence ruby > /dev/null
if [ $? = 0 ]; then
  PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
  export PATH
fi
export SMING_HOME=/home/larsch/esp/Sming/Sming
export ESP_HOME=/home/larsch/esp/esp-open-sdk
[ -e "/usr/share/terminfo/${TERM:0:1}/${TERM}" ] || export TERM=xterm
alias restyle="find -regex '.*\.(c|h|cpp|hpp|ino)$' | xargs clang-format -i"
[[ -v SSH_AUTH_SOCK ]] || export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
function p() { picocom --baud 115200 /dev/tty$1 }
export XZ_OPT=-T0
[ -e "/lib/modules/$(uname -r)" ] || echo "Reboot needed (new kernel)"

[ "$TTY" = /dev/tty1 ] && [ "$HOST" = t495arch ] && sway >~/.swaylog 2>&1 ||:
