# ALT-SHIFT-E - open selected file in default editor
fzf-edit-widget() {
  setopt localoptions pipefail no_aliases 2> /dev/null
  local file="$(
    FZF_DEFAULT_COMMAND=${FZF_ALT_SHIFT_E_COMMAND:-} \
    FZF_DEFAULT_OPTS=$(__fzf_defaults "--reverse --walker=file,follow,hidden --scheme=path" "${FZF_ALT_SHIFT_E_OPTS-} +m") \
    FZF_DEFAULT_OPTS_FILE='' $(__fzfcmd) < /dev/tty)"
  if [[ -z "$file" ]]; then
    zle redisplay
    return 0
  fi
  zle push-line # Clear buffer. Auto-restored on next prompt.
  BUFFER="command ${EDITOR:-vi} -- ${(q)file:a}"
  zle accept-line
  local ret=$?
  unset dir # ensure this doesn't end up appearing in prompt expansion
  zle reset-prompt
  return $ret
}
if [[ "${FZF_ALT_SHIFT_C_COMMAND-x}" != "" ]]; then
  zle     -N             fzf-edit-widget
  bindkey -M emacs '\eE' fzf-edit-widget
  bindkey -M vicmd '\eE' fzf-edit-widget
  bindkey -M viins '\eE' fzf-edit-widget
fi
