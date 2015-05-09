;; .emacs - Lars Christensen <larsch@belunktum.dk>

(require 'server)
(if (equal window-system 'w32) (defun server-ensure-safe-dir (dir) "Noop" t))
(server-start)

(add-to-list 'load-path "~/.elisp")	; Personal elisp files
(when (> emacs-major-version 23)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.milkbox.net/packages/")
	       'APPEND))

(require 'ensure-package)
(ensure-package-installed 'whitespace-cleanup-mode)
(package-initialize)

;; Preferences
(setq make-backup-files nil)		; Disable backup files
(setq vc-cvs-stay-local nil)		; Disable VCS backup files
(setq w32-get-true-file-attributes nil)	; Work-around for slow-downs

;; Window Preferences
(blink-cursor-mode 0)			; Stop cursor blinking
(menu-bar-mode 0)			; Remove menu bar

(if window-system
    (progn
      (scroll-bar-mode 0)		; Remove scroll bar
      (tool-bar-mode 0)			; Remove toolbar
      (powerline-center-theme))		; Improved mode line
  )

(column-number-mode 't)			; Column numbers always
(setq mouse-wheel-progressive-speed 'nil) ; Disable scroll acceleration
(setq split-width-threshold 'nil)       ; Sensible split-window-sensible
(set 'inhibit-read-only t)		; Never open files in read-only mode
(setq inhibit-startup-screen t)		; Inhibit startup screen
(setq inhibit-startup-echo-area-message "lac") ; Inhibit startup echo area message

;; Editor preferences
(global-font-lock-mode 't)		; Highlighting always
(global-linum-mode 't)			; Show line numbers
(show-paren-mode 't)			; Highlight matching parens
(set 'show-paren-delay 0.05)		; Reduce the delay for showing matching parens
(setq frame-title-format "%b - Emacs")	; Show filename first in title bar
(global-auto-revert-mode 1)		; Auto-revert if change on disk
(setq revert-without-query ".*")        ; Revert all unedited files

;; Other
(set 'compile-directory nil)
(set 'ediff-split-window-function 'split-window-horizontally)
(require 'iedit)			; Interactive edit all occurences of symbols
(winner-mode 't)

;; Shortcuts
(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-x\C-r" 'ido-recentf-open)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-ct" 'todo-show)
(global-set-key [?\C-.] 'kill-this-buffer)
(global-set-key "\C-cs" 'shell)
(global-set-key "\C-cc" 'compile)
(global-set-key "\C-cn" 'next-error)
(global-set-key "\C-cr" 'quickrun)
(global-set-key "\C-j" 'newline-and-indent)
(global-set-key "\C-cw" 'whitespace-cleanup-extra)
(global-unset-key "\C-z") ; dont minimize on C-z

;; Shortcuts to custom functions
(global-set-key "\M-p" 'jump-up)
(global-set-key "\M-n" 'jump-down)
(global-set-key "\M-w" 'kill-ring-save-region-or-word)
(global-set-key [f1] 'google-symbol-at-point)
(global-set-key [C-f1] 'google-feeling-lucky-symbol-at-point)
(global-set-key [M-S-up] 'move-text-up)
(global-set-key [M-S-down] 'move-text-down)
(global-set-key [M-P] 'move-text-up)
(global-set-key [M-N] 'move-text-down)
(global-set-key "\C-cd" 'diff-buffer)
(global-set-key (kbd "C-o") 'open-next-line)
(global-set-key (kbd "M-o") 'open-previous-line)

;; Shortcuts to insert pairs (some custom functions)
(global-set-key "\M-\"" 'insert-double-quotes)
(global-set-key "\M-'" 'insert-quotes)
(global-set-key "\M-[" 'insert-brackets)
(global-set-key "\M-{" 'insert-braces)
(global-set-key (kbd "<M-return>") 'insert-do-end)

;; Interactive-do stuff with buffers mode
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-virtual-buffers t)

;; Enable grep under windows
(setq grep-command "grep -n ")
(setq grep-null-device "nul")

;; Recent files (using ido-mode)
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 500)
(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; Pseudo-scrolling (will return cursor to same position when jumping
;; up, then down, contrary to PgUp/Dn scrolling).
(defun jump-up ()
  "Jumps 10 lines up"
  (interactive)
  (previous-line 10))
(defun jump-down()
  "Jumps 10 lines down"
  (interactive)
  (next-line 10))

;; Put tag/symbol/word under cursor in kill ring for easy yanking.
(defun kill-ring-save-symbol-at-point ()
  "Kill word under cursor"
  (interactive)
  (kill-new (thing-at-point 'symbol)))

;; Copy region or word under cursor (M-w alternative)
(defun kill-ring-save-region-or-word ()
  "Save the region as if killed, but don't kill it. If no region is active, kill the symbol at the cursor."
  (interactive)
  (if (use-region-p) (kill-ring-save (point) (mark t)) (kill-ring-save-symbol-at-point)))

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
(setq ruby-insert-encoding-magic-comment 'nil)

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

;; rst-mode
(modify-coding-system-alist 'file "\\.rst\\'" 'utf-8)

;;
;; C/C++ Style Settings
;;

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

;; Google stuff
(defun google-symbol-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol))))
(defun google-feeling-lucky-word-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol) "&btnI")))
(defun google-feeling-lucky-symbol-at-point ()
  "Google word at point"
  (interactive)
  (browse-url (concat "http://google.com/search?q=" (thing-at-point 'symbol) "&btnI")))

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

;; Insert pairs of stuff using M-<key> (single and double quotes)
(defun insert-double-quotes (&optional arg)
  (interactive "P")
  (insert-pair arg ?\" ?\"))
(defun insert-quotes (&optional arg)
  (interactive "P")
  (insert-pair arg ?\' ?\'))
(defun insert-braces-2 (&optional arg)
  (interactive "P")
  (insert-pair arg "{\n" "\n}\n"))
(defun insert-do-end (&optional arg)
  (interactive "P")
  (insert-pair arg "do\n" "end\n"))
(defun insert-brackets (&optional arg)
  (interactive "P")
  (insert-pair arg ?\[ ?\]))

;; M-{ keybinding to inserts matching braces, indents the lines and
;; moves the cursor in between. If a region is selected, wrap it in
;; braces.
(defun insert-braces ()
  "Insert matching curly braces or wrap a region with braces"
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
    (c-indent-command)))

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
  (while (search-forward "%point%" nil t) (replace-match "")))

;;
;; Source code restyling on save
;;

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
     (concat "Copyright (C) by"))))

;; Rename file AND buffer.
;; http://steve.yegge.googlepages.com/my-dot-emacs-file
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

;; Indent, clean whitespace, untabify entire buffer, then update
;; copyright notice.
(defun emacs-format-function ()
   "Format the whole buffer."
   (indent-region (point-min) (point-max) nil)
   (whitespace-cleanup-extra)
   (untabify (point-min) (point-max))
   (update-copyright)
   (save-buffer))

;; Cleanup some whitespace problems (whitespace-cleanup), plus some
;; extra whitespace.
(defun whitespace-cleanup-extra ()
  "Clean up more whitespace"
  (interactive)
  (save-excursion
    (whitespace-cleanup)
    (replace-regexp-in-buffer "[[:space:]]+$" "")
    (replace-regexp-in-buffer "^\\([[:space:]]*\n\\)\\{2,\\}" "\n") nil (point-min) (point-max)))
(set 'whitespace-style '(face tabs spaces trailing lines space-before-tab newline indentation::space empty space-after-tab space-mark tab-mark newline-mark))
(global-whitespace-cleanup-mode)

(add-hook 'html-mode-hook
	  (lambda()
	    (setq indent-tabs-mode nil)))

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

;;
;; Customization
;;

(if window-system
    (custom-set-faces
     '(default ((t (:inherit nil :stipple nil :background "#2e3436" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 108 :width normal :foundry "outline" :family "Consolas"))))
     '(font-lock-comment-face ((t (:foreground "#73d216" :slant italic))))))

(custom-set-faces
 '(j-verb-face ((t (:foreground "Red"))))
 '(j-adverb-face ((t (:foreground "Green"))))
 '(j-conjunction-face ((t (:foreground "Blue"))))
 '(j-other-face ((t (:foreground "Gray")))))

(set 'markdown-command "pandoc -f markdown_github-hard_line_breaks --template=default.html5 -M css:file:///m:/projects/doc-md/doc.css")
