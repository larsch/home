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
[[ -d "$HOME/bin" ]] && export PATH=$PATH:$HOME/bin
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

# aliases
if whence eza >/dev/null; then
    export EZA_ICONS_AUTO=1
    alias ls='command eza --classify'
    alias ll='command eza --classify -l -b'
    alias l='command eza --classify -l -b'
    alias ltr='eza --classify -l --sort modified'

    # change default grml aliases to use eza
    alias dir='command eza -lSrah'
    alias la='command eza -la --color=auto'
    alias lad='command eza -d .*(/)'
    alias lh='command eza -al --color=auto'
    alias lsa='command eza -a .*(.)'
    alias lsbig='command eza -s none -l *(.OL[1,10])'
    alias lsd='command eza -d *(/)'
    alias lse='command eza -d *(/^F)'
    alias lsl='command eza -l *(@)'
    alias lsnew='command eza -s modified -rl *(D.om[1,10])'
    alias lsnewdir='command eza -s modified -rdl *(/om[1,10]) .*(D/om[1,10])'
    alias lsold='command eza -s modified -rl *(D.Om[1,10])'
    alias lsolddir='command eza -s modified -rdl *(/Om[1,10]) .*(D/Om[1,10])'
    alias lss='command eza -l *(s,S,t)'
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
        sudo apt-get install --ignore-missing fd-find fzf ripgrep eza
        if ! whence eza >/dev/null; then
            local _temp=$(tempfile)
            curl -sfL "https://github.com/ogham/eza/releases/download/v0.10.1/eza-linux-x86_64-v0.10.1.zip" -o "$_temp"
            unzip -o "$_temp" -d ~/.local
            rm -f "$_temp"
        fi
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

# syntax highlighting
if [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# fzf
for _fzfpath in /usr/share/fzf /usr/share/doc/fzf/examples; do
    if [ -e $_fzfpath/key-bindings.zsh ]; then
        . $_fzfpath/key-bindings.zsh
        bindkey "^T" transpose-chars  # restore default bindings
        bindkey "^[o" fzf-file-widget
    fi
    if [[ -f $_fzfpath/completion.zsh ]]; then
        . $_fzfpath/completion.zsh
    fi
done
if whence fzf >/dev/null; then
    export FZF_ALT_C_OPTS="'--prompt=> cd '"
    export FZF_ALT_E_OPTS="'--prompt=> vim '"
    fzf-edit-widget() {
        local cmd="${FZF_ALT_E_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
        -o -type f -print 2> /dev/null | cut -b3-"}"
        setopt localoptions pipefail no_aliases 2> /dev/null
        local dir="$(eval "$cmd" | FZF_DEFAULT_OPTS="--height ${FZF_TMUX_HEIGHT:-40%} --reverse --bind=ctrl-z:ignore $FZF_DEFAULT_OPTS $FZF_ALT_E_OPTS" $(__fzfcmd) +m)"
        if [[ -z "$dir" ]]; then
            zle redisplay
            return 0
        fi
        zle push-line # Clear buffer. Auto-restored on next prompt.
        BUFFER="${EDITOR} ${(q)dir}"
        zle accept-line
        local ret=$?
        unset dir # ensure this doesn't end up appearing in prompt expansion
        zle reset-prompt
        return $ret
    }
    zle -N fzf-edit-widget
    bindkey '^[E' fzf-edit-widget
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
