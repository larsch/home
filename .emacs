;; .emacs - Lars Christensen <larsch@belunktum.dk>

(require 'server)
(defun server-ensure-safe-dir (dir) "Noop" t)
(server-start)

(add-to-list 'load-path "~/.elisp")	; Personal elisp files
(require 'iedit)

;; Preferences
(blink-cursor-mode 0)			; stop blinking !
(menu-bar-mode 0)			; Remove menu bar
(scroll-bar-mode 0)			; Remove scroll bar
(column-number-mode 't)			; Column numbers always
(global-font-lock-mode 't)		; highlighting always
(global-linum-mode 't)			; linum-mode
(show-paren-mode 't)			; Highlight matching parens
(tool-bar-mode 0)			; remove useless feature
(set 'ediff-split-window-function 'split-window-horizontally)
(set 'show-paren-delay 0.05)		; Reduce the delay for showing matching parens
(setq frame-title-format "%b - Emacs")	; Show filename first in title bar
(setq make-backup-files nil)		; real men don't take backups
(setq mouse-wheel-progressive-speed 'nil) ; No scroll acceleration
(setq split-width-threshold 'nil)       ; Sensible split-window-sensible
;; (setq vc-annotate-background nil)	; No annotate color
;; (setq vc-annotate-color-map nil)	; No annotate color
(setq vc-cvs-stay-local nil)		; ditto
(setq w32-get-true-file-attributes nil)	; Work-around for slow-downs
(global-auto-revert-mode 1)		; Auto-revert if change on disk
(setq revert-without-query ".*")        ; Revert all unedited files
(set 'compile-directory nil)
(set 'inhibit-read-only t)		; Never open files in read-only mode
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message "lac")

;; Short-cuts
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-unset-key "\C-z")		   ; dont minimize on C-z
(global-set-key "\C-cg" 'goto-line)	   ; goto-line
(global-set-key "\C-ct" 'todo-show)	   ; todo-show
(global-set-key [?\C-.] 'kill-this-buffer) ; quick buffer killing
(global-set-key "\C-cs" 'shell)		   ; shell mode shortcut
(global-set-key "\C-cc" 'compile)	   ; compile shortcut
(global-set-key "\C-cn" 'next-error)	   ; Jump to next error
(global-set-key "\C-cr" 'quickrun)	   ; Quick-run
(global-set-key "\C-x\C-r" 'recentf-open-files)

;; Enable grep under windows
(setq grep-command "grep -n ")
(setq grep-null-device "nul")

;; Recent files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 500)

;; Convinient buffer navigation that returns to same position if you
;; go down and up X.
(defun jump-up ()
  "Jumps 10 lines up"
  (interactive)
  (previous-line 10))
(defun jump-down()
  "Jumps 10 lines down"
  (interactive)
  (next-line 10))
(global-set-key "\M-p" 'jump-up)
(global-set-key "\M-n" 'jump-down)

;; kill-word-under-cursor: Put tag/symbol/word under cursor in kill
;; ring for easy yanking (requires etags to be loaded)
(defun kill-word-under-cursor ()
  "Kill word under cursor"
  (interactive)
  (kill-new (find-tag-default)))
(global-set-key "\M-c" 'kill-word-under-cursor)

;;
;; Programming Modes
;;

;; ruby-mode
(defun install-before-save-hooks-ruby ()
  (interactive)
  (add-hook 'write-contents-functions 'update-copyright)
  (add-hook 'write-contents-functions 'delete-trailing-whitespace))
(autoload 'ruby-mode "ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rbw?$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(set 'ruby-deep-arglist 'nil)
(set 'ruby-deep-indent-paren 'nil)
(set 'ruby-deep-indent-paren-style 'nil)
(setq ruby-insert-encoding-magic-comment nil)
(add-hook 'ruby-mode-hook 'install-before-save-hooks-ruby)
(add-hook 'ruby-mode-hook 'which-function-mode)
;; (add-hook 'ruby-mode-hook 'ruby-electric-mode)

(autoload 'run-ruby "inf-ruby"
  "Run an inferior Ruby process")
(autoload 'inf-ruby-keys "inf-ruby"
  "Set local key defs for inf-ruby in ruby-mode")
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     (inf-ruby-keys)
	     ))

(defun convert-hash-arg ()
  "Search/replace for ruby hash argument and change style"
  (interactive)
  (query-replace-regexp ":\\(\\w+\\) =>" "\\1:"))

;; text-mode for bison grammars
(add-to-list 'auto-mode-alist '("\\.y$" . text-mode))

;; javascript-mode
(autoload 'javascript-mode "javascript" nil t)
(add-to-list 'auto-mode-alist '("\\.js?$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.as$" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . javascript-mode))

;; css-mode
(autoload 'css-mode "css-mode")
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.less?$" . css-mode))

;; lua-mode
(autoload 'lua-mode "lua-mode")
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(set 'lua-indent-offset 2)
(set 'lua-indent-level 2)

;; c-mode for ttcn3 source
(add-to-list 'auto-mode-alist '("\\.tt3$" . c-mode))
(add-to-list 'auto-mode-alist '("\\.shader$" . c-mode))

;; c++-mode for .h files
(add-to-list 'auto-mode-alist '("\\.h$" . c++-mode))

;; haml-mode
(autoload 'haml-mode "haml-mode")
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

;; cmake-mode
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))
(autoload 'cmake-mode "cmake-mode")

;; batch-mode
(autoload 'batch-mode "batch-mode")
(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))
(add-to-list 'auto-mode-alist '("\\.cmd\\'" . batch-mode))

;;
;; GH Style Settings
;;

;; highlight these words as types
;; (load "cc-mode")
;; (add-to-list 'c++-font-lock-extra-types "Tcl\\sw+")
;; (add-to-list 'c++-font-lock-extra-types "Ten\\sw+")
;; (add-to-list 'c++-font-lock-extra-types "Trec\\sw+")
;; (add-to-list 'c-font-lock-extra-types "HANDLE")
;; (add-to-list 'c-font-lock-extra-types "VOID")
;; (add-to-list 'c-font-lock-extra-types "LPVOID")
;; (add-to-list 'c-font-lock-extra-types "BOOL")
;; (add-to-list 'c-font-lock-extra-types "HFILE")
;; (add-to-list 'c-font-lock-extra-types "DWORD")
;; (add-to-list 'c-font-lock-extra-types "UINT")
;; (add-to-list 'c-font-lock-extra-types "uint")

(setq c-default-style '((java-mode . "java") (other . "gh"))) ; indentation-style
(set 'parens-require-spaces nil)	;; dont insert space before parentheses

;; indentation style based on k&r
(c-add-style
 "gh"
 '("k&r"
   (c-basic-offset . 3)
   (c-offsets-alist . ((inline-open . 0)
		       (statement-case-open . +)
		       (inextern-lang . 0)
		       (innamespace . 0)
		       ))))

;; Google stuff
(defun google-symbol-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol))))
(global-set-key [f1] 'google-symbol-at-point)
(defun google-feeling-lucky-word-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol) "&btnI")))
(global-set-key [C-f1] 'google-feeling-lucky-symbol-at-point)
(defun google-feeling-lucky-symbol-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol) "&btnI")))

;; C/C++ Programming
(defun setup-c++-mode () "Setups Custom C++ mode settings" (interactive)
  (set 'comment-column 35)
  (set 'fill-column 70)
  (set 'indent-tabs-mode nil)
  (local-set-key "\C-m" 'newline-and-indent)
  (local-set-key "\M-h" 'hs-hide-block)
  (local-set-key "\M-s" 'hs-show-block)
  (local-set-key "\M-]" 'ff-find-other-file)
  (c-toggle-hungry-state 1))
(set 'c++-mode-hook 'setup-c++-mode)
(set 'c-mode-hook 'setup-c++-mode)
(setq dabbrev-case-fold-search nil) ; case sensitive expansion
(setq dabbrev-abbrev-char-regexp "\\sw\\|\\s_") ; complete only symbols (avoids completing & or *)

;; Handy diff function which opens a diff between current file and cvs
;; version. Bound to C-c d.
(defun diff-buffer () "diff buffer"
  (interactive)
  (set 'bname (buffer-name))
  (switch-to-buffer "*diff*")
  (erase-buffer)
  (diff-mode)
  (insert (shell-command-to-string (concat "cvs -q diff -u " bname)))
  (goto-line 1)
  (toggle-read-only)
  (local-set-key "q" 'kill-this-buffer))
(global-set-key "\C-cd" 'diff-buffer)

;; M-{ keybinding to inserts matching braces, indents the lines and
;; moves the cursor in between. If a region is selected, wrap it in
;; braces.
(defun insert-braces ()
  "Insert matching curly braces"
  (interactive)
  (if (region-active-p) (insert-braces-region) (insert-braces-point)))
(defun insert-braces-point () "Insert matching curly braces at point" (interactive)
  (set-mark-command 'nil)
  (insert "{\n\n}")
  (indent-region (- (line-beginning-position) 3) (line-end-position) nil)
  (previous-line 1)
  (c-indent-command))
(defun insert-braces-region () "Insert matching curly braces around region" (interactive)
  (let ((beginning (region-beginning))
	(end (region-end)))
    (goto-char end)
    (insert "}\n")
    (goto-char beginning)
    (insert "{\n")
    (indent-region (- beginning 2) (+ end 4))
    (c-indent-command)
    ))
(global-set-key "\M-{" 'insert-braces)

;; M-[ keybinding to inserts matching brackets, indents the lines and
;; moves the cursor in between.
(defun insert-brackets ()
  "Insert matching square brackets"
  (interactive)
  (set-mark-command 'nil)
  (insert "[]")
  (backward-char))
(global-set-key "\M-[" 'insert-brackets)

;; Fly-make
;; (require 'compile)
;; (require 'flymake)
;; (defun flymake-get-make-cmdline (source base-dir)
;;   (list "mingw32-make" (list "-s" "-C" base-dir (concat "CHK_SOURCES=" source) "SYNTAX_CHECK_MODE=1" "check-syntax")))

;; (global-set-key [f4] 'flymake-goto-next-error)
;; (global-set-key [M-down] 'flymake-display-err-menu-for-current-line)
;; (global-set-key [M-up] 'find-tag-other-window)

;; (defun flymake-get-mingw32-make-cmdline (source base-dir)
;;   (list "mingw32-make"
;;	(list "-s"
;;	      "-C"
;;	      base-dir
;;	      (concat "CHK_SOURCES=" source)
;;	      "SYNTAX_CHECK_MODE=1"
;;	      "check-syntax")))

;; (defun flymake-simple-mingw32-make-init ()
;;   (flymake-simple-make-init-impl 'flymake-create-temp-inplace t t "Makefile" 'flymake-get-mingw32-make-cmdline))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-mingw32-make-init))

;; (defun flymake-master-mingw32-make-header-init ()
;;   (flymake-master-mingw32-make-init
;;    'flymake-get-include-dirs
;;    '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'")
;;    "[ \t]*#[ \t]*include[ \t]*\"\\([[:word:]0-9/\\_.]*%s\\)\""))
;; (add-to-list 'flymake-allowed-file-name-masks '("\\.h\\'" flymake-master-mingw32-make-header-init flymake-master-cleanup))

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; Compile with working directory set
(defun compile-from-compile-directory()
  (interactive)
  (save-excursion
    (setq dir-buffer(find-file-noselect compile-directory))
    (set-buffer dir-buffer)
    (compile compile-command)
    (kill-buffer dir-buffer)))

;; Compile without prompting
(defun compile-no-prompt () "mybuild"
  (interactive)
  (save-some-buffers 1)
  (compile compile-command))
(global-set-key [f7] 'compile-from-compile-directory)
(global-set-key [f8] 'next-error)

;; Insert date/time function
(defun insert-date-time ()
  "Insert date and time at the current cursor position"
  (interactive)
  (insert (format-time-string "%Y/%m/%d %H:%M")))
(global-set-key [f5] 'insert-date-time)

;; More convinent way to call make (find an open Makefile buffer and
;; runs make)
(defun compile-makefile-buffer nil
  (interactive)
  (save-some-buffers)
  (set-buffer "Makefile")
  (compile "make"))
(global-set-key [C-return] 'compile-makefile-buffer)

;; Auto-Insert
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.autoinsert/")
(setq auto-insert-query nil)
(setq auto-insert-alist
      '(
	("\\.cpp$" . ["template.cpp" auto-update-source-file])
	("\\.h$"   . ["template.h" auto-update-source-file])
	("\\.c$" . ["template.c" auto-update-source-file])
	))

(defun auto-update-source-file ()
	 (save-excursion
	   (while (search-forward "%guard%" nil t)
	     (save-restriction
	       (narrow-to-region (match-beginning 0) (match-end 0))
	       (replace-match (concat "_" (downcase (file-name-nondirectory buffer-file-name))))
	       (subst-char-in-region (point-min) (point-max) ?. ?_)
	       ))
	   )
	 ;; Move cursor to $$$ mark
	 (while (search-forward "%module%" nil t)
	   (save-restriction
	       (narrow-to-region (match-beginning 0) (match-end 0))
	       (replace-match (file-name-sans-extension (file-name-nondirectory buffer-file-name)))
	       )
	   )
	 ;; Move cursor to %point%
	 (while (search-forward "%point%" nil t) (replace-match ""))
	 )

;; (setq auto-insert-alist '((c++-mode . "Hello, World!")))

(set 'restyle-command "ruby -S restyle.rb")

(defun restyle-buffer ()
  (save-excursion
    (message(concat restyle-command " "(buffer-file-name)))
    (shell-command(concat restyle-command " "(buffer-file-name)))
    (revert-buffer t t t)
  ))

(defun install-restyle-hook ()
  (add-hook 'after-save-hook 'restyle-buffer nil 't))

(defun restyle-replace-buffer ()
  (interactive)
  (let
      ((original-line (line-number-at-pos))
       (original-column (current-column)))
    (shell-command-on-region(point-min)(point-max)(concat "ruby -S restyle.rb -s "(buffer-file-name)) 1 "*messages*" t)
    (goto-char (min
		(+ (line-beginning-position original-line) original-column)
		(- (line-beginning-position (+ original-line 1)) 1)
		)))
    'nil
    )

(defun install-restyle-hook ()
  (add-hook 'write-contents-functions 'restyle-replace-buffer))

;; (add-hook 'c++-mode-hook 'install-restyle-hook)
;; (add-hook 'c-mode-hook 'install-restyle-hook)
(add-hook 'compilation-mode-hook 'toggle-truncate-lines)
(add-hook 'compilation-mode-hook
	  (lambda () (make-local-variable 'hl-line-sticky-flag)
	    (setq hl-line-sticky-flag t)
	    (hl-line-mode t)
	    ))

;; Update copyright notice
(set 'copyright-regexp "Copyright [^ ]+ \\(\\([[:digit:]]+\\)\\(-[[:digit:]]+\\)? \\)?by")
(defun find-copyright ()
  (interactive)
  (search-forward-regexp copyright-regexp))
(defun replace-regexp-in-buffer (regexp to-string)
  (goto-char (point-min))
  (while (re-search-forward regexp nil t)
    (replace-match to-string nil nil)))
(defun update-copyright ()
  (interactive)
  (save-excursion
    (replace-regexp-in-buffer
     copyright-regexp
     (concat "Copyright (C) by")
     )))

;; Rename file AND
;; buffer. http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn
	  (rename-file name new-name 1)
	  (rename-buffer new-name)
	  (set-visited-file-name new-name)
	  (set-buffer-modified-p nil))))))

;; Move lines up/down using M-S-up/M-S-down
;; source: http://stackoverflow.com/questions/2423834/move-line-region-up-and-down-in-emacs
(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
	(exchange-point-and-mark))
    (let ((column (current-column))
	  (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
	(forward-line)
	(when (or (< arg 0) (not (eobp)))
	  (transpose-lines arg))
	(forward-line -1))
      (move-to-column column t)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)
(global-set-key [M-P] 'move-text-up)
(global-set-key [M-N] 'move-text-down)

;; MELPA package repository
(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/")
	       'APPEND))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
;; '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(org-agenda-files (quote ("~/org/bre_test_workshop.org" "~/org/org.org")))
 '(safe-local-variable-values (quote ((compile-directory . "d:/src/train/src"))))
 ;; '(scroll-down-aggressively 1.0)
 ;; '(scroll-up-aggressively 0.0)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :foundry "outline" :family "Consolas"))))
 '(font-lock-comment-face ((t (:foreground "#73d216" :slant italic)))))


;; Indent, clean whitespace, untabify entire buffer, then update
;; copyright notice.
(defun emacs-format-function ()
   "Format the whole buffer."
   (indent-region (point-min) (point-max) nil)
   (whitespace-cleanup-2)
   (untabify (point-min) (point-max))
   (update-copyright)
   (save-buffer))

(defun whitespace-cleanup-2 ()
  "Clean up more whitespace"
  (interactive)
  (save-excursion
    (whitespace-cleanup)
    (replace-regexp-in-buffer "[[:space:]]+$" "")
    (replace-regexp-in-buffer "^\\([[:space:]]*\n\\)\\{2,\\}" "\n") nil (point-min) (point-max)))

(add-hook 'html-mode-hook
	  (lambda()
	    (setq indent-tabs-mode nil)))

(defun insert-double-quotes (&optional arg)
  (interactive "P")
  (insert-pair arg ?\" ?\"))
(defun insert-quotes (&optional arg)
  (interactive "P")
  (insert-pair arg ?\' ?\'))
(defun insert-braces-2 (&optional arg)
  (interactive "P")
  (insert-pair arg "{\n" "}\n"))
(defun insert-do-end (&optional arg)
  (interactive "P")
  (insert-pair arg "do\n" "end\n"))
(defun insert-brackets (&optional arg)
  (interactive "P")
  (insert-pair arg ?\[ ?\]))

(global-set-key "\M-\"" 'insert-double-quotes)
(global-set-key "\M-'" 'insert-quotes)
(global-set-key (kbd "<M-return>") 'insert-do-end)

(setq ispell-program-name "c:/program files (x86)/aspell/bin/aspell.exe")

(define-skeleton cmakelists-skeleton
  "Inserts a CMakeLists.txt skeleton"
  ""
  "cmake_minimum_required(VERSION 2.8.12.2)\n"
  "project(skeleton)\n"
  "add_library(skeleton ...)\n")

(defun unhtml (start end)
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (replace-string "&" "&amp;")
      (goto-char (point-min))
      (replace-string "<" "&lt;")
      (goto-char (point-min))
      (replace-string ">" "&gt;")
      )))

(setq ruby-insert-encoding-magic-comment 'nil)

(modify-coding-system-alist 'file "\\.rst\\'" 'utf-8)

(custom-set-faces
 '(j-verb-face ((t (:foreground "Red"))))
 '(j-adverb-face ((t (:foreground "Green"))))
 '(j-conjunction-face ((t (:foreground "Blue"))))
 '(j-other-face ((t (:foreground "Gray")))))

(defvar newline-and-indent t
      "Modify the behavior of the open-*-line functions to cause them to autoindent.")

;; Behave like vi's o command
(defun open-next-line (arg)
  "Move to the next line and then opens a line.
    See also `newline-and-indent'."
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (next-line 1)
  (when newline-and-indent
    (indent-according-to-mode)))

;; Behave like vi's O command
(defun open-previous-line (arg)
  "Open a new line before the current one.
     See also `newline-and-indent'."
  (interactive "p")
  (beginning-of-line)
  (open-line arg)
  (when newline-and-indent
    (indent-according-to-mode)))

(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "M-o") 'open-previous-line)

(unless (fboundp 'delete-consecutive-dups)
  (defun delete-consecutive-dups (list &optional circular)
    "Destructively remove `equal' consecutive duplicates from LIST.
First and last elements are considered consecutive if CIRCULAR is
non-nil."
    (let ((tail list) last)
      (while (consp tail)
        (if (equal (car tail) (cadr tail))
            (setcdr tail (cddr tail))
          (setq last (car tail)
                tail (cdr tail))))
      (if (and circular
               (cdr list)
               (equal last (car list)))
          (nbutlast list)
        list))))

(ido-mode t)
(setq ido-enable-flex-matching t
      ido-use-virtual-buffers t)
