[[ "$TTY" != /dev/tty1 ]] || exec systemd-cat niri-session

# default to xterm if terminfo is missing
[ -e "/usr/share/terminfo/${TERM:0:1}/${TERM}" ] || export TERM=xterm

if [[ -d ~/.local/completions ]]; then
    fpath=(~/.local/completions $fpath)
fi

if (( ! ${+GRML_OSTYPE} )); then
    [[ -f "${ZDOTDIR}/grml" ]] || curl -s -L -o "${ZDOTDIR}/grml" https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc
    . "${ZDOTDIR}/grml"
fi

# Lazy load helper functions
fpath=("${ZDOTDIR}/functions" $fpath)
autoload -Uz $fpath[1]/*(.:t)

# user paths
[[ -d "$HOME/bin" ]] && export PATH=$HOME/bin:$PATH
[[ -d "$HOME/.cargo/bin" ]] && export PATH=$PATH:$HOME/.cargo/bin
[[ -d "/usr/lib/cargo/bin" ]] && export PATH=/usr/lib/cargo/bin:$PATH
[[ -d "$HOME/.local/bin" ]] && export PATH=$HOME/.local/bin:$PATH
[[ -d "$HOME/.yarn" ]] && export PATH=$HOME/.yarn/bin:$PATH
if whence ruby >/dev/null; then
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
    export PATH
fi

if whence nvim >/dev/null; then
    alias vi=nvim
    alias vim=nvim
elif whence vim >/dev/null; then
    alias vi=vim
fi

if whence bat >/dev/null; then
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
    alias cat=bat
fi

# aliases
if whence eza >/dev/null; then
    export EZA_ICONS_AUTO=1
    alias eza='command eza --time-style=long-iso'
    alias ls='eza --classify'
    alias ll='eza --classify -l -b'
    alias l='eza --classify -l -b'
    alias ltr='eza --classify -l --sort modified'

    # change default grml aliases to use eza
    alias dir='eza -lSrah'
    alias la='eza -la --color=auto'
    alias lad='command eza -d .*(/)'
    alias lh='eza -al --color=auto'
    alias lsa='command eza -a .*(.)'
    alias lsbig='command eza -s none -l *(.OL[1,10])'
    alias lsd='command eza -d *(/)'
    alias lse='command eza -d *(/^F)'
    alias lsl='eza -l *(@)'
    alias lsnew='command eza -s modified -rl *(D.om[1,10])'
    alias lsnewdir='command eza -s modified -rdl *(/om[1,10]) .*(D/om[1,10])'
    alias lsold='command eza -s modified -rl *(D.Om[1,10])'
    alias lsolddir='command eza -s modified -rdl *(/Om[1,10]) .*(D/Om[1,10])'
    alias lss='eza -l *(s,S,t)'
    alias lssmall='command eza -s size -rl *(.oL[1,10])'
    alias lsw='command eza -ld *(R,W,X.^ND/)'
    alias lsx='command eza -l *(*)'
fi

if whence pacman >/dev/null; then
    alias syu='sudo pacman -Syu --noconfirm'
    zinstall() {
        sudo pacman -Syu --needed fd fzf ripgrep eza grml-zsh-config zsh-syntax-highlighting
    }
fi

if whence apt-get >/dev/null; then
    zinstall() {
        sudo apt-get install --ignore-missing fd-find fzf ripgrep eza jq bat mediainfo
        mkdir -p "$HOME/bin" "$HOME/.local/completions"
        (set -eu -o pipefail &&
            echo "Installing latest eza"
            curl -Lsf "$(curl -Lsf https://api.github.com/repos/eza-community/eza/releases/latest \
                         | jq -r '.assets[] | select(.name | contains("x86_64-unknown-linux-gnu.tar.gz")) | .browser_download_url')" \
                | tar -x -z -C "$HOME/bin"
            curl -Lsf "$(curl -Lsf https://api.github.com/repos/eza-community/eza/releases/latest \
                         | jq -r '.assets[] | select(.name | contains("completions")) | .browser_download_url')" \
                | tar -z -x -C "$HOME/.local/completions" --wildcards --strip=3 "./target/completions-*/_eza"
            echo "Installing latest fzf"
            curl -Lsf "$(curl -Lsf https://api.github.com/repos/junegunn/fzf/releases/latest \
                         | jq -r '.assets[] | select(.name | contains("linux_amd64.tar.gz")) | .browser_download_url')" \
                | tar -x -z -C "$HOME/bin")
    }
fi

if whence yay >/dev/null; then
    alias yaysyu='yay -Syu --noconfirm'
fi

if whence qemu-system-x86_64 >/dev/null; then
    alias qemu='qemu-system-x86_64'
fi

if whence virsh >/dev/null; then
    alias v='virsh'
    alias sv='virsh --connect qemu:///system'
fi

if [[ -d ~/home.git ]]; then
    alias dgit='git --work-tree=$HOME --git-dir=$HOME/home.git'
fi

if whence nvim >/dev/null; then
    alias vi=nvim
    alias vim=nvim
elif whence vim >/dev/null; then
    alias vi=vim
fi

if whence bat >/dev/null; then
    alias cat=bat
    export MANPAGER="sh -c 'sed -u -e \"s/\\x1B\[[0-9;]*m//g; s/.\\x08//g\" | bat -p -lman'"
fi

alias top='LIBPROC_HIDE_KERNEL=1 top'

# keymap
bindkey -e
bindkey -r "^Ed" # Leave my end-of-line key alone
bindkey "^[[27;2;13~" accept-line
bindkey "^[[27;3;13~" accept-line
bindkey "^[[27;4;13~" accept-line
bindkey "^[[27;5;13~" accept-line
bindkey "^[[27;6;13~" accept-line
bindkey "^[[27;7;13~" accept-line
bindkey "^[[27;8;13~" accept-line

# grc-rs
if whence grc-rs >/dev/null; then
    source <(grc-rs --aliases --except=ip)
fi

# tmux
alias remux='tmux new-session -As default'
remux-widget() {
    BUFFER='remux'
    zle accept-line
}
zle -N remux-widget
bindkey "^[k" remux-widget
sshmux() {
	command ssh -t "$1" /usr/bin/tmux new-session -As default
}

# btrfs
if whence btrfs >/dev/null; then
    if [[ $UID == 0 ]]; then
        alias bfs=btrfs
        alias bsv='btrfs subvolume'
        alias bsn='btrfs subvolume snapshot'
    else
        alias bfs='sudo btrfs'
        alias bsv='sudo btrfs subvolume'
        alias bsn='sudo btrfs subvolume snapshot'
    fi
fi

# fzf
if whence fzf >/dev/null; then
    source <(fzf --zsh)
    bindkey "^T" transpose-chars  # restore default bindings
    bindkey "^[o" fzf-file-widget
    source "${ZDOTDIR}/fzf.zsh"
    FZF_PREVIEW_COMMAND="${ZDOTDIR}/fzf-preview.sh {}"
    FZF_ALT_SHIFT_E_OPTS="'--prompt=> vim ' --preview '${FZF_PREVIEW_COMMAND}'"
    FZF_ALT_C_OPTS="'--prompt=> cd ' --preview 'eza --colour=always -T {} | head -200'"
    FZF_CTRL_T_OPTS="--preview '${FZF_PREVIEW_COMMAND}'"
fi

# auto-start ssh-agent
_tmpagent=${XDG_RUNTIME_DIR:-$HOME}/.sshagent
if (( ! ${+SSH_AUTH_SOCK} )); then
    if [ -e "${_tmpagent}" ]; then
        . "${_tmpagent}" >/dev/null
        if [[ -d "/proc/$SSH_AGENT_PID" && -S "$SSH_AUTH_SOCK" ]]; then
            # continue
        else
            # start new agent
            eval $(ssh-agent 2>/dev/null | tee "${_tmpagent}") >/dev/null
        fi
    else
        # start new agent
        eval $(ssh-agent 2>/dev/null | tee "${_tmpagent}") >/dev/null
    fi
fi
unset _tmpagent

zupdate() {
    (cd "${ZDOTDIR}" && git pull) && . ${ZDOTDIR}/.zshenv && . ${ZDOTDIR}/.zshrc
}

rmux() {
    ssh -t "$@" tmux new-session -As default
}

# local configuration (~/.zshrc.d)
[[ ! -d "$HOME/.zshrc.d" ]] || source <(cat $(find "$HOME/.zshrc.d" -type f) /dev/null)

# Patch grml to not show hostname+user in title when on Wayland
grml_control_xterm_title() {
    case $TERM in
        (xterm*|rxvt*|alacritty|foot)
            if [[ -n $WAYLAND_DISPLAY ]]; then
                set_title "${(%):-"%~"}" "$1"
            else
                set_title "${(%):-"%n@%m: %~"}" "$1"
            fi
            ;;
    esac
}

# Patch grml to not show hostname+user in title when on Wayland
grml_reset_screen_title() {
    [[ ${NOTITLE:-} -gt 0 ]] && return 0
    case $TERM in
        (xterm*|rxvt*|alacritty|foot)
            if [[ -n $WAYLAND_DISPLAY ]]; then
                set_title ${(%):-"%~"}
            else
                set_title ${(%):-"%n@%m: %~"}
            fi
            ;;
    esac
}

# syntax highlighting (should be last)
if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# incognito mode
if [[ -n "$ZSH_NO_HISTORY" ]]; then
	unset HISTFILE
	SAVEHIST=0
    grml_theme_add_token incognito ' 󰗹 ' '%K{#400000}%F{#ff0000}' '%f%k '
    # note: the default items can be seen with `which prompt_grml_precmd`
    zstyle ':prompt:grml:left:setup' items incognito rc change-root user at host path vcs percent
fi
