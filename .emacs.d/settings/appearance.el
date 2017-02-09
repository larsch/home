(show-paren-mode t)	     ; Highlight matching parens
(set 'show-paren-delay 0.05) ; Reduce the delay for showing matching parens
(line-number-mode t)	     ; Show line number
(column-number-mode 1)	     ; Show column number
(global-linum-mode 1)	     ; Show line numbers
(blink-cursor-mode 0)	     ; Stop cursor blinking

(setq frame-title-format "%b - Emacs")	; Show filename first in title bar

(setq split-width-threshold 'nil)       ; Sensible split-window-sensible

(if window-system
    (progn
      (powerline-center-theme)		; Improved mode line
      ))

(provide 'appearance)
