_setenv() {
    export "$@"
    [[ -z ${SYSTEMD_EXEC_PID} ]] || systemctl --user set-environment "$@"
}

_setenv \
MOZ_ENABLE_WAYLAND=1 \
XKB_DEFAULT_OPTIONS=ctrl:nocaps \
XZ_OPT=-T0 \
ZSTD_NBTHREADS=0 \
_JAVA_AWT_WM_NONREPARENTING=1 \
SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket" \
QT_QPA_PLATFORM=wayland-egl \
QT_WAYLAND_FORCE_DPI=physical \
QT_WAYLAND_DISABLE_WINDOWDECORATION=1

unset _setenv

[ "$TTY" != /dev/tty1 ] || [ ! whence sway >/dev/null ] || exec systemd-cat sway --verbose
