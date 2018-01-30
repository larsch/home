(auto-compression-mode t)    ; Auto-open compressed
(global-auto-revert-mode 1)  ; Auto-revert if change on disk
(global-font-lock-mode t)    ; Colourize text
(global-subword-mode 1)	     ; Navigate PascalCasedWords
(setq shift-select-mode nil) ; Disable shift-select
(transient-mark-mode 1)	     ; Highlight selection
(defalias 'yes-or-no-p 'y-or-n-p) ; Allow me to answer with 'y' or 'n' keys

(provide 'sane-defaults)
