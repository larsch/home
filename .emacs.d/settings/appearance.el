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

;; Select a font that we like, if it's available
(setq preferred-fonts
      '("Monaco-10"
	"Consolas-12"
	"Inconsolata-12")))
(defun font-exists-p (font) "Check if font exists" (if (null (x-list-fonts font)) nil t))
(defun pick-a-font (list) (find-if 'font-exists-p list))
(defun preferred-font () "Get the preferred font" (pick-a-font preferred-fonts))
(add-to-list 'default-frame-alist (append '(font) (preferred-font)))
(set-face-attribute 'default t :font (preferred-font))

(provide 'appearance)
